#!/usr/bin/env bash
# Stops the Hugo dev server for the personal website.
# Run from anywhere: ./stop-server.sh
set -euo pipefail

# Anchored pattern so this script's own command line (which starts with
# "pgrep"/"bash", not "hugo") never self-matches.
PIDS="$(pgrep -f '^hugo server' || true)"

if [[ -z "$PIDS" ]]; then
  echo "No Hugo server is running."
  exit 0
fi

echo "Stopping Hugo server (PID(s): $PIDS)..."
kill $PIDS
echo "Stopped."
