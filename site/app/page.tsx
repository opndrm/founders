"use client";

import { useState } from "react";

const commands = {
  mac: "curl -fsSL https://raw.githubusercontent.com/opndrm/founders/main/install.sh | bash",
  windows:
    "irm https://raw.githubusercontent.com/opndrm/founders/main/install.ps1 | iex",
};

const spaces = [
  {
    index: "01",
    name: "APP — AUDITOR",
    role: "SSS / Pi",
    detail: "Read-only evidence, live at localhost:4600.",
    state: "observing",
    tone: "cyan",
  },
  {
    index: "02",
    name: "APP — JCODE",
    role: "Coder",
    detail: "Fresh JCode session rooted in Desktop/App.",
    state: "ready",
    tone: "pink",
  },
  {
    index: "03",
    name: "APP — GATE",
    role: "No Mistakes",
    detail: "Installed, visible, and waiting for JCode.",
    state: "reserved",
    tone: "gold",
  },
];

const setupItems = [
  "HERDR workspace shell",
  "JCode execution harness",
  "SSS / Pi read-only Auditor",
  "No Mistakes Git gate",
  "Ollama cloud model route",
  "37 portable Crew skills",
  "Black WezTerm + HERDR theme",
  "Localhost pipeline dashboard",
];

export default function Home() {
  const [platform, setPlatform] = useState<"mac" | "windows">("mac");
  const [copied, setCopied] = useState(false);

  async function copyCommand() {
    await navigator.clipboard.writeText(commands[platform]);
    setCopied(true);
    window.setTimeout(() => setCopied(false), 1800);
  }

  return (
    <main>
      <div className="grid-noise" aria-hidden="true" />

      <nav className="nav od-shell" aria-label="Primary navigation">
        <a className="brand" href="#top" aria-label="OPNDRM Founders home">
          <span className="brand-mark">O</span>
          <span>OPNDRM / FOUNDERS</span>
        </a>
        <div className="nav-links">
          <a href="#workflow">Workflow</a>
          <a href="#install">Install</a>
          <a href="#security">Security</a>
          <a
            className="github-link"
            href="https://github.com/opndrm/founders"
            target="_blank"
            rel="noreferrer"
          >
            GitHub ↗
          </a>
        </div>
      </nav>

      <section className="hero od-shell" id="top">
        <div className="eyebrow od-eyebrow od-reveal">
          <span className="live-dot" />
          Founder workflow / installer preview
        </div>
        <h1 className="od-display od-reveal od-reveal--late">
          One command.
          <br />
          <span className="od-accent">Three spaces.</span>
          <br />
          One App.
        </h1>
        <p className="hero-copy od-lead od-reveal od-reveal--later">
          A visible agent workflow for founders who want the coder, gate, and
          independent auditor separated—and every claim backed by a receipt.
        </p>
        <div className="hero-actions">
          <a className="primary-button od-button" href="#install">
            Get the installer <span>↓</span>
          </a>
          <a
            className="secondary-button od-button od-button--secondary"
            href="https://github.com/opndrm/founders/pull/1"
            target="_blank"
            rel="noreferrer"
          >
            Review the build ↗
          </a>
        </div>
        <div className="hero-status od-status" aria-label="Workflow summary">
          <span><b>MODEL</b> deepseek-v4-flash:0731-cloud</span>
          <span><b>ROOT</b> ~/Desktop/App</span>
          <span><b>SCREEN</b> localhost:4600</span>
        </div>
      </section>

      <hr className="od-rule od-shell" />

      <section className="workflow od-shell" id="workflow">
        <div className="section-heading">
          <div>
            <span className="section-index od-eyebrow">01 / WORKFLOW</span>
            <h2>The Crew flow,<br /><span className="od-accent">one lane.</span></h2>
          </div>
          <p>
            The installer creates only these three spaces. All three point at
            the same blank App folder; each has one job and one authority.
          </p>
        </div>

        <div className="space-list">
          {spaces.map((space) => (
            <article className={`space-card ${space.tone}`} key={space.name}>
              <div className="space-topline">
                <span>{space.index}</span>
                <span className="space-state">
                  <i /> {space.state}
                </span>
              </div>
              <div className="terminal-chrome">
                <span /> <span /> <span />
              </div>
              <h3>{space.name}</h3>
              <strong>{space.role}</strong>
              <p>{space.detail}</p>
              <div className="space-path">cwd: ~/Desktop/App</div>
            </article>
          ))}
        </div>
      </section>

      <hr className="od-rule od-shell" />

      <section className="install-section od-shell" id="install">
        <div className="install-copy">
          <span className="section-index od-eyebrow">02 / INSTALL</span>
          <h2>Paste once.<br /><span className="od-accent">Keep control.</span></h2>
          <p>
            The bootstrap verifies each tool, asks before changing the machine,
            preserves existing work, and stops if a required trust boundary is
            unresolved.
          </p>
          <ul className="setup-grid">
            {setupItems.map((item) => (
              <li key={item}><span>✓</span>{item}</li>
            ))}
          </ul>
        </div>

        <div className="command-card">
          <div className="command-tabs" role="tablist" aria-label="Install platform">
            <button
              className={platform === "mac" ? "active" : ""}
              onClick={() => { setPlatform("mac"); setCopied(false); }}
              role="tab"
              aria-selected={platform === "mac"}
            >
              macOS
            </button>
            <button
              className={platform === "windows" ? "active" : ""}
              onClick={() => { setPlatform("windows"); setCopied(false); }}
              role="tab"
              aria-selected={platform === "windows"}
            >
              Windows
            </button>
          </div>
          <div className="command-window">
            <div className="command-title">
              <span>founders / install</span>
              <span>{platform === "mac" ? "zsh · bash" : "PowerShell"}</span>
            </div>
            <code><span>$</span> {commands[platform]}</code>
            <button className="copy-button" onClick={copyCommand}>
              {copied ? "Copied ✓" : "Copy command"}
            </button>
          </div>
          <p className="preview-note">
            Preview release. Permanent <code>main</code> commands activate after
            the installer PR is reviewed and merged.
          </p>
        </div>
      </section>

      <hr className="od-rule od-shell" />

      <section className="model-section od-shell">
        <div className="section-heading compact">
          <div>
            <span className="section-index od-eyebrow">03 / ROUTING</span>
            <h2>Fast by default.<br /><span className="od-accent">Deliberate when hard.</span></h2>
          </div>
        </div>
        <div className="model-grid">
          <div className="model-primary">
            <span>DEFAULT ROUTE</span>
            <h3>DeepSeek V4 Flash</h3>
            <code>ollama/deepseek-v4-flash:0731-cloud</code>
            <p>Shared by JCode and the read-only Auditor.</p>
          </div>
          <div className="model-secondary">
            <span>HARD-WORK FALLBACK</span>
            <h3>MiniMax M3</h3>
            <code>ollama/minimax-m3:cloud</code>
            <p>Optional and owner-selected—not silently escalated.</p>
          </div>
          <div className="model-gate">
            <span>GATE ROUTE</span>
            <h3>No model</h3>
            <code>JCode-owned validation</code>
            <p>No Mistakes observes Git work; it is not another agent.</p>
          </div>
        </div>
      </section>

      <section className="security-section" id="security">
        <div className="od-shell security-inner">
          <div>
            <span className="section-index od-eyebrow">04 / TRUST</span>
            <h2>Nothing <span className="od-accent">hidden</span><br />in the bootstrap.</h2>
          </div>
          <div className="security-list">
            <p><span>01</span>No copied API keys, tokens, or provider credentials.</p>
            <p><span>02</span>No Atomic Vault database or automatic trust approval.</p>
            <p><span>03</span>No cache, transcript, session, or machine-state publishing.</p>
            <p><span>04</span>No Gate run until JCode and the owner authorize it.</p>
          </div>
        </div>
      </section>

      <footer className="footer od-shell">
        <div className="brand footer-brand">
          <span className="brand-mark">O</span>
          <span>OPNDRM / FOUNDERS</span>
        </div>
        <p>Visible agents. Separated roles. Honest receipts.</p>
        <div className="footer-links">
          <a href="https://github.com/opndrm/founders">Repository</a>
          <a href="https://github.com/opndrm/founders/pull/1">Installer PR</a>
          <a href="https://github.com/opndrm/founders/blob/main/SECURITY.md">Security</a>
        </div>
      </footer>
    </main>
  );
}
