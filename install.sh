#!/usr/bin/env bash
# a-stack one-liner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/your-org/a-stack/main/install.sh | bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installing a-stack...${NC}"

# 1. Determine scope
SCOPE="local"
if [ "$1" == "--global" ]; then
  SCOPE="global"
elif [ -z "$1" ]; then
  echo -e "Install a-stack ${YELLOW}globally${NC} (~/.config/antigravity) or ${YELLOW}locally${NC} (current directory)?"
  read -p "[g/l]: " scope_input
  if [[ "$scope_input" == "g" || "$scope_input" == "G" ]]; then
    SCOPE="global"
  fi
fi

# 2. Define clone destination
if [ "$SCOPE" == "global" ]; then
  DEST_DIR="$HOME/.astack-global"
else
  DEST_DIR="$(pwd)/.astack-local"
fi

# 3. Clone repository
echo -e "\n${BLUE}📥 Cloning repository to $DEST_DIR...${NC}"
rm -rf "$DEST_DIR"
git clone --quiet --single-branch --depth 1 https://github.com/your-org/a-stack.git "$DEST_DIR"

# 4. Run setup
echo -e "\n${BLUE}⚙️  Running setup...${NC}"
if [ "$SCOPE" == "global" ]; then
  cd "$DEST_DIR"
  ./setup --global
else
  # Run setup from the user's project directory, pointing to the setup script in the temp directory.
  # This ensures files are copied into the user's current directory instead of the temp directory.
  "$DEST_DIR/setup" --local
fi

# 5. Cleanup local temp dir if installed locally (setup copies what it needs)
if [ "$SCOPE" == "local" ]; then
  rm -rf "$DEST_DIR"
fi

echo -e "\n${GREEN}✨ a-stack installation complete!${NC}"
echo -e "To get started, ask Antigravity: ${YELLOW}/office-hours${NC}"
