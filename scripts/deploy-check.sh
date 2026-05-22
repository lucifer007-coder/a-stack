#!/usr/bin/env bash
# a-stack — Deployment Pre-flight Check
# Verifies environment and dependencies before deploying.
# Used by: /ship, /land-and-deploy
set -euo pipefail

echo "🚀 a-stack pre-flight deploy check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Find the script's directory to resolve sibling script paths dynamically
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Check uncommitted changes
if ! git diff-index --quiet HEAD --; then
  echo "❌ Error: Uncommitted changes found."
  echo "   Please commit or stash your changes before deploying."
  exit 1
fi
echo "✅ Git working tree clean"

# 2. Run linter
echo "▸ Running linter..."
if ! "$SCRIPT_DIR/lint.sh" > /dev/null; then
  echo "❌ Error: Linter failed. Run ./scripts/lint.sh for details."
  exit 1
fi
echo "✅ Lint check passed"

# 3. Run tests
echo "▸ Running tests..."
if ! "$SCRIPT_DIR/test-runner.sh" > /dev/null; then
  echo "❌ Error: Test suite failed. Run ./scripts/test-runner.sh for details."
  exit 1
fi
echo "✅ Test suite passed"

# 4. Check for lockfiles
if [ ! -f "package-lock.json" ] && [ ! -f "yarn.lock" ] && [ ! -f "pnpm-lock.yaml" ] && [ -f "package.json" ]; then
  echo "⚠️  Warning: Node.js project without a lockfile."
  echo "   Consider creating one before deploying for consistent builds."
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🟢 All pre-flight checks passed! Ready to deploy."
