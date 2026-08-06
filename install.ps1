[CmdletBinding()]
param(
  [switch]$DryRun,
  [switch]$NoLaunch
)

$ErrorActionPreference = 'Stop'
$Model = 'deepseek-v4-flash:0731-cloud'
$FallbackModel = 'minimax-m3:cloud'
$AppDir = Join-Path ([Environment]::GetFolderPath('Desktop')) 'App'
$DataDir = Join-Path $env:LOCALAPPDATA 'OPNDRMWorkflow'
$SourceDir = Join-Path $DataDir 'founders'
$SssDir = Join-Path $DataDir 'sssf'
$CodexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
$SkillsDir = Join-Path $CodexHome 'skills'
$HerdrConfigDir = Join-Path $env:APPDATA 'herdr'
$WezTermConfig = Join-Path $HOME '.wezterm.lua'

function Say([string]$Message) { Write-Host "[opndrm] $Message" }
function Invoke-Step([scriptblock]$Action, [string]$Description) {
  if ($DryRun) { Write-Host "+ $Description" } else { & $Action }
}
function Has([string]$Command) { return [bool](Get-Command $Command -ErrorAction SilentlyContinue) }

Say 'OPNDRM three-space workflow installer (Windows)'
Say "Target: $AppDir"
Say 'HERDR on Windows is currently preview/beta.'
if (-not $DryRun) {
  $answer = Read-Host 'Continue? [y/N]'
  if ($answer -notmatch '^(y|yes)$') { Say 'Cancelled.'; exit 0 }
}

Invoke-Step { New-Item -ItemType Directory -Force $AppDir,$DataDir,$SkillsDir,$HerdrConfigDir | Out-Null } 'Create workflow directories'
if (-not (Has 'git')) { throw 'Git for Windows is required.' }

if (Test-Path (Join-Path $SourceDir '.git')) {
  Invoke-Step { git -C $SourceDir fetch --depth 1 origin main; git -C $SourceDir reset --keep origin/main } 'Refresh installer source'
} else {
  Invoke-Step { git clone --depth 1 https://github.com/opndrm/founders.git $SourceDir } 'Clone installer source'
}

if (-not (Has 'herdr')) { Invoke-Step { irm https://herdr.dev/install.ps1 | iex } 'Install HERDR preview' }
if (-not (Has 'jcode')) { Invoke-Step { irm https://jcode.sh/install.ps1 | iex } 'Install JCode' }
if (-not (Has 'no-mistakes')) { Invoke-Step { irm https://raw.githubusercontent.com/kunchenguid/no-mistakes/main/docs/install.ps1 | iex } 'Install No Mistakes' }
if (-not (Has 'pi')) {
  if (-not (Has 'npm')) { throw 'Node.js/npm is required to install Pi.' }
  Invoke-Step { npm install -g @mariozechner/pi-coding-agent } 'Install Pi'
}
if (-not $DryRun -and -not (Has 'ollama')) { throw 'Install Ollama from https://ollama.com/download and rerun.' }
if (-not $DryRun -and -not (Has 'uv')) { throw 'Install uv from https://docs.astral.sh/uv/ and rerun.' }
if (-not $DryRun -and -not (Has 'bun')) { throw 'Install Bun from https://bun.sh/ and rerun.' }

Invoke-Step { ollama pull $Model } "Pull Ollama model $Model"
Say "Optional fallback: $FallbackModel"

if (-not (Test-Path (Join-Path $SssDir '.git'))) {
  Invoke-Step { git clone --depth 1 https://github.com/disler/super-simple-software-factory.git $SssDir } 'Clone SSS'
}
if (-not $DryRun) {
  Push-Location $SssDir
  try { uv run .claude/skills/sssf/scripts/install.py } finally { Pop-Location }
  Copy-Item (Join-Path $SourceDir 'config/sssf/auditor.config.yaml') (Join-Path $SssDir 'adws/adw_sssf_config/sssf.config.yaml') -Force
  Copy-Item (Join-Path $SourceDir 'config/sssf/AUDITOR-SYSTEM.md') (Join-Path $SssDir 'AUDITOR-SYSTEM.md') -Force
  Push-Location (Join-Path $SssDir '.claude/skills/sssf/apps/visualizer')
  try { bun install --frozen-lockfile } finally { Pop-Location }
}

$Manifest = Join-Path $SourceDir 'skills/manifest.txt'
if (Test-Path $Manifest) {
  foreach ($Skill in Get-Content $Manifest) {
    $Skill = $Skill.Trim()
    if (-not $Skill -or $Skill.StartsWith('#')) { continue }
    $From = Join-Path $SourceDir "skills/$Skill"
    $To = Join-Path $SkillsDir $Skill
    if ((Test-Path $From) -and -not (Test-Path $To)) { Invoke-Step { Copy-Item $From $To -Recurse } "Install skill $Skill" }
  }
}

$HerdrConfig = Join-Path $HerdrConfigDir 'config.toml'
if ((Test-Path $HerdrConfig) -and -not $DryRun) { Copy-Item $HerdrConfig "$HerdrConfig.$(Get-Date -Format yyyyMMdd-HHmmss).bak" }
Invoke-Step { Copy-Item (Join-Path $SourceDir 'config/herdr/config.toml') $HerdrConfig -Force } 'Apply OPNDRM HERDR black theme'
if (Has 'wezterm') {
  if ((Test-Path $WezTermConfig) -and -not $DryRun) { Copy-Item $WezTermConfig "$WezTermConfig.$(Get-Date -Format yyyyMMdd-HHmmss).bak" }
  Invoke-Step { Copy-Item (Join-Path $SourceDir 'config/wezterm/wezterm.lua') $WezTermConfig -Force } 'Apply OPNDRM WezTerm black theme'
}

if (-not $DryRun) {
  try { herdr status server | Out-Null } catch { Start-Process herdr -ArgumentList 'server' -WindowStyle Hidden; Start-Sleep -Seconds 1 }
  $Existing = herdr workspace list | ConvertFrom-Json
  $Spaces = @(
    @{ Label = 'APP -          AUDITOR'; Role = 'auditor' },
    @{ Label = 'APP -                  JCODE'; Role = 'jcode' },
    @{ Label = 'APP    GATE'; Role = 'gate' }
  )
  foreach ($Space in $Spaces) {
    if ($Existing.result.workspaces.label -contains $Space.Label) { Say "Space exists; leaving it untouched: $($Space.Label)"; continue }
    $Created = (herdr workspace create --cwd $AppDir --label $Space.Label --no-focus | ConvertFrom-Json).result
    $Pane = $Created.root_pane.pane_id
    if ($Space.Role -eq 'auditor') {
      herdr pane run $Pane "Set-Location '$AppDir'; pi --provider ollama --model '$Model' --tools read,grep,find,ls --system-prompt 'Read-only APP Auditor. Read, grep, find, and list only. Never write, edit, execute shell commands, mutate Git, contact GitHub, or operate JCode or No Mistakes.'" | Out-Null
      $Split = herdr pane split $Pane --direction right --ratio 0.35 --cwd $SssDir --no-focus | ConvertFrom-Json
      $DashboardPane = $Split.result.pane.pane_id
      $DashboardDir = Join-Path $SssDir '.claude/skills/sssf/apps/visualizer'
      $DashboardDb = Join-Path $SssDir 'adws/adw_data/sssf.db'
      herdr pane run $DashboardPane "Set-Location '$DashboardDir'; bun run server/index.ts --db '$DashboardDb'" | Out-Null
    } elseif ($Space.Role -eq 'jcode') {
      herdr pane run $Pane "Set-Location '$AppDir'; jcode -C '$AppDir' --provider ollama --model '$Model'" | Out-Null
    } else {
      herdr pane run $Pane "Write-Host ''; Write-Host '  APP NO MISTAKES GATE'; Write-Host '  Waiting for a JCode-owned authorized run.'; Write-Host '  The Gate has no independent model setting.'" | Out-Null
    }
    $Existing = herdr workspace list | ConvertFrom-Json
  }
  try { herdr integration install pi | Out-Null } catch { }
  $DashboardOk = $false
  1..10 | ForEach-Object {
    if ($DashboardOk) { return }
    try { Invoke-RestMethod http://localhost:4600/api/health | Out-Null; $DashboardOk = $true } catch { Start-Sleep -Seconds 1 }
  }
  if (-not $DashboardOk) { throw 'Auditor Screen health check failed at http://localhost:4600/api/health' }
}

Say 'No Mistakes is installed and idle; no gate was initialized or run.'
Say 'Auditor Screen target: http://localhost:4600'
Say "Model: $Model"
Say "App folder: $AppDir"
if (-not $NoLaunch) { Say 'Launch HERDR with: herdr' }
