#!/usr/bin/env bash
# a-stack — Generic test runner
# Detects project type and runs the appropriate test suite.
# Used by: /qa-only, /ship, /health
set -euo pipefail

echo "🔍 a-stack test runner"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Detect project type and run appropriate tests
if [ -f "package.json" ]; then
  echo "📦 Detected: Node.js project"
  
  # Check for common test scripts
  if grep -q '"test"' package.json 2>/dev/null; then
    echo "▸ Running: npm test"
    npm test
  elif grep -q '"vitest"' package.json 2>/dev/null; then
    echo "▸ Running: npx vitest run"
    npx vitest run
  elif grep -q '"jest"' package.json 2>/dev/null; then
    echo "▸ Running: npx jest"
    npx jest
  else
    echo "⚠️  No test script found in package.json"
    echo "   Add a \"test\" script to package.json"
    exit 1
  fi

elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  echo "🐍 Detected: Python project"
  
  if command -v pytest &> /dev/null; then
    echo "▸ Running: pytest -v"
    pytest -v
  elif command -v python3 &> /dev/null; then
    echo "▸ Running: python3 -m pytest -v"
    python3 -m pytest -v
  else
    echo "⚠️  pytest not found. Install it: pip install pytest"
    exit 1
  fi

elif [ -f "go.mod" ]; then
  echo "🔵 Detected: Go project"
  echo "▸ Running: go test ./..."
  go test ./...

elif [ -f "Cargo.toml" ]; then
  echo "🦀 Detected: Rust project"
  echo "▸ Running: cargo test"
  cargo test

elif [ -f "build.gradle" ] || [ -f "pom.xml" ]; then
  echo "☕ Detected: Java project"
  if [ -f "build.gradle" ]; then
    echo "▸ Running: ./gradlew test"
    ./gradlew test
  else
    echo "▸ Running: mvn test"
    mvn test
  fi

elif [ -f "Makefile" ] && grep -q "^test:" Makefile 2>/dev/null; then
  echo "🔧 Detected: Makefile with test target"
  echo "▸ Running: make test"
  make test

else
  echo "⚠️  No recognized test suite detected."
  echo ""
  echo "Supported project types:"
  echo "  • Node.js  (package.json with test script)"
  echo "  • Python   (pytest)"
  echo "  • Go       (go test)"
  echo "  • Rust     (cargo test)"
  echo "  • Java     (gradle/maven)"
  echo "  • Makefile (make test)"
  exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Tests complete."
