# OPNDRM Founders Workflow

One-command bootstrap for the three-space OPNDRM agent workflow:

1. **APP — AUDITOR** — SSS/Pi, read-only, with the Auditor Screen at `http://localhost:4600`.
2. **APP — JCODE** — fresh JCode session in `Desktop/App`.
3. **APP — GATE** — No Mistakes installed and visibly waiting for a JCode-owned run.

Every workspace points at the newly created, initially empty `Desktop/App` folder. JCode and the Auditor use Ollama model `deepseek-v4-flash:0731-cloud`; `minimax-m3:cloud` is the optional hard-work fallback. No Mistakes is a Git gate and has no independent model setting.

## Install

macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/opndrm/founders/main/install.sh | bash
```

Windows PowerShell (HERDR is currently a preview build on Windows):

```powershell
irm https://raw.githubusercontent.com/opndrm/founders/main/install.ps1 | iex
```

Run with `--dry-run` on macOS or `-DryRun` on Windows to inspect actions. The installer never copies API keys, tokens, Atomic Vault data, caches, transcripts, or private machine state.

## What it changes

- Installs or verifies HERDR, JCode, Pi, Ollama, Git, Bun, uv, and No Mistakes.
- Creates `Desktop/App` only when it does not exist.
- Installs SSS centrally under the user's application-data directory; it does not stamp SSS into `Desktop/App`.
- Installs 37 owner-approved portable skills included in `skills/` without deleting unrelated skills. Codex supplies its own `.system` skills.
- Backs up existing HERDR/WezTerm configuration before applying the optional OPNDRM black theme.
- Creates the three APP spaces idempotently and does not touch existing HERDR spaces.

See [SECURITY.md](SECURITY.md) for trust and credential boundaries.
