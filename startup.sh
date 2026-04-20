#!/usr/bin/env bash
#
# Claude Code remote-env setup script.
# Installs the Hive CLI and the hive + beeswax skills. Result is
# snapshotted by the harness and reused across sessions.
#
# User-specific login happens separately in the SessionStart hook
# (scripts/session-start.sh) because HIVE_API_* env vars don't
# reliably propagate to the setup-script phase.

set -euo pipefail

WORK_DIR="$HOME/hive-cli"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# Seed a package.json so npx can resolve the local binary.
[ -f package.json ] || npm init -y >/dev/null

echo "==> Installing @agent-hive/cli..."
npm install --silent @agent-hive/cli@latest

echo "==> Installing hive + beeswax skills..."
# `hive setup-skill` chains into `beeswax setup-skill` automatically
# (CLI >= 0.4.11), so both skills land in ~/.claude/skills/.
npx hive setup-skill claude-code

# Beeswax renders .wax via Playwright + Chromium. Without this, the
# first compile of a session pays a ~2 min penalty installing
# Chromium on demand. Doing it here means the cost is paid once at
# env creation and snapshotted.
echo "==> Installing Chromium for Playwright (beeswax renderer)..."
npx playwright install chromium

echo "✓ Hive CLI + hive/beeswax skills + Chromium installed. Workspace: $WORK_DIR"
echo "   (Login runs at session start via .claude/settings.json hook.)"
