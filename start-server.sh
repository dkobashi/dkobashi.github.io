#!/usr/bin/env bash
# Starts the Hugo dev server for the personal website.
# Run from anywhere: ./start-server.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/site"
exec hugo server --themesDir .. -D -p 1313 --baseURL http://localhost:1313/ --disableFastRender
