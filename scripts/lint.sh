#!/usr/bin/env bash
# a-stack — Generic linter
# Detects project type and runs the appropriate linter.
# Used by: /qa-only, /ship, /health
set -euo pipefail

echo "🧹 a-stack linter"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Detect project type and run appropriate linter
if [ -f "package.json" ]; then
  echo "📦 Detected: Node.js project"
  
  if grep -q '"lint"' package.json 2>/dev/null; then
    echo "▸ Running: npm run lint"
    npm run lint
  elif command -v eslint &> /dev/null; then
    echo "▸ Running: eslint ."
    eslint .
  elif command -v tsc &> /dev/null && grep -q '"typecheck"' package.json 2>/dev/null; then
    echo "▸ Running: npm run typecheck"
    npm run typecheck
  else
    echo "⚠️  No lint script found in package.json"
    echo "   Add a \"lint\" script to package.json"
    exit 1
  fi

elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  echo "🐍 Detected: Python project"
  
  if command -v ruff &> /dev/null; then
    echo "▸ Running: ruff check ."
    ruff check .
  elif command -v flake8 &> /dev/null; then
    echo "▸ Running: flake8 ."
    flake8 .
  elif command -v black &> /dev/null; then
    echo "▸ Running: black --check ."
    black --check .
  elif command -v pylint &> /dev/null; then
    echo "▸ Running: pylint **/*.py"
    pylint **/*.py
  else
    echo "⚠️  No Python linter found. Install ruff, flake8, or black."
    exit 1
  fi

elif [ -f "go.mod" ]; then
  echo "🔵 Detected: Go project"
  if command -v golangci-lint &> /dev/null; then
    echo "▸ Running: golangci-lint run"
    golangci-lint run
  else
    echo "▸ Running: go vet ./..."
    go vet ./...
  fi

elif [ -f "Cargo.toml" ]; then
  echo "🦀 Detected: Rust project"
  echo "▸ Running: cargo clippy -- -D warnings"
  cargo clippy -- -D warnings

elif [ -f "Makefile" ] && grep -q "^lint:" Makefile 2>/dev/null; then
  echo "🔧 Detected: Makefile with lint target"
  echo "▸ Running: make lint"
  make lint

else
  echo "⚠️  No recognized linter detected."
  echo ""
  echo "Supported project types:"
  echo "  • Node.js  (package.json with lint script)"
  echo "  • Python   (ruff/flake8/black/pylint)"
  echo "  • Go       (golangci-lint/go vet)"
  echo "  • Rust     (cargo clippy)"
  echo "  • Makefile (make lint)"
  exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Linting complete. No issues found."
