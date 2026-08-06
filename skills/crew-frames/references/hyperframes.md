# HyperFrames reference

Upstream: `heygen-com/hyperframes`, Apache-2.0.

HyperFrames turns HTML, CSS, media, and seekable animations into deterministic video. The local CLI supports project initialization, linting, preview, rendering, snapshots, dependency checks, and local text-to-speech. It requires Node 22 or newer and FFmpeg for local renders.

Use these commands only inside an approved video project directory:

```sh
npx hyperframes init <project-name>
npx hyperframes doctor
npx hyperframes lint
npx hyperframes preview
npx hyperframes render -o out.mp4
```

Avoid hosted render, authentication, publishing, and uploads unless the user explicitly asks. Keep each video composition original and retain a local media/license ledger.
