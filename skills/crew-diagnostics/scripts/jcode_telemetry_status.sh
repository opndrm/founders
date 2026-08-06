#!/usr/bin/env bash
set -euo pipefail

echo 'JCode telemetry status'
if JCODE_DEBUG_CONTROL=1 jcode debug state 2>&1; then
  echo 'Result: debug telemetry is reachable.'
else
  echo 'Result: live JCode telemetry is unavailable; show only route or bridge state.'
fi
