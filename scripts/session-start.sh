#!/usr/bin/env bash
#
# Runs every time the Claude session starts (or resumes). Logs in to
# Hive using the env vars set in the Claude Code environment config.
# Re-runs on every session so a rotated API URL or key is picked up
# without manual intervention.

set -euo pipefail

# Only run in cloud sessions; locally this file is a no-op.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

: "${HIVE_API_KEY:?HIVE_API_KEY not set — add it under Environment variables in the env config}"
: "${HIVE_API_URL:?HIVE_API_URL not set — add it under Environment variables in the env config}"

WORK_DIR="$HOME/hive-cli"

if [ ! -d "$WORK_DIR/node_modules/@agent-hive/cli" ]; then
  echo "hive CLI not installed — did the setup script run?" >&2
  exit 1
fi

cd "$WORK_DIR"
npx hive login --api-key "$HIVE_API_KEY" --api-url "$HIVE_API_URL"
