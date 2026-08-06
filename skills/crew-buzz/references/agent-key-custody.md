# Agent key custody

## Verified current behavior

- A Buzz portable definition has no runnable private identity.
- When Buzz creates a runnable local agent, it mints that agent's private key.
- Buzz stores the runnable key in macOS Keychain when available, strips the
  inline copy from its local JSON, and refuses to launch if recovery fails.
- Portable snapshots and relay events must not contain the private key.

## Crew boundary

- Treat Buzz Keychain custody as the active agent-key store.
- Treat Automic Vault as the owner relay-credential store.
- Store only an agent alias and public identity in Crew documentation.
- Never mirror a private key by reading a dialog, screenshot, clipboard, or
  export.

## Relay credential format

The Buzz Desktop runtime uses WebSocket relay addresses internally. The Crew
CLI launcher uses the relay's HTTPS endpoint. Store the CLI relay entry as an
`https://` URL under `BUZZ_RELAY_URL`; do not substitute a `wss://` address in
that Vault entry.

## Future approved handoff contract

Only a compatible signed Buzz and signed Automic Vault integration may add an
optional direct handoff. It must keep the key in memory, request Vault's normal
approval, write through Vault's protected interface, retain Buzz's own
fail-closed runtime check, and emit only the alias plus public identity in
audit records. It must not use terminal input, command arguments, environment
variables, logs, files, or the clipboard for the private key.
