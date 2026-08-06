# Security

The installer never embeds or commits credentials. Ollama, GitHub, Minimax, and Atomic Vault authentication remain user-controlled.

- Existing config files are backed up before an explicitly approved replacement.
- Atomic Vault trust is never granted automatically.
- No Mistakes is installed but no gate is initialized or run by the bootstrap.
- The Auditor launches Pi with only `read`, `grep`, `find`, and `ls` tools.
- `Desktop/App` is preserved by repair and uninstall operations.
- Only skills physically included in this repository's `skills/` directory are copied.

Report security issues privately to the repository owner.
