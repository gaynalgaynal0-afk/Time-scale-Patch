#!/bin/bash

# ─────────────────────────────────────────
#     INSTALLER - Video Patch Tool
# ─────────────────────────────────────────

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${CYAN}=============================${NC}"
echo -e "${CYAN}   Installing Patch Tool...  ${NC}"
echo -e "${CYAN}=============================${NC}"
echo ""

# Install required packages
echo -e "${YELLOW}Installing git and ffmpeg...${NC}"
pkg install -y git ffmpeg

# Setup storage access
echo -e "${YELLOW}Setting up storage...${NC}"
termux-setup-storage

# Clone the repo
echo -e "${YELLOW}Downloading patch tool...${NC}"
cd ~
git clone https://github.com/YOUR_USERNAME/ffmpeg-patch-tool.git

# Make script executable
chmod +x ~/ffmpeg-patch-tool/patch.sh

# Add shortcut command so user just types "patch"
echo 'alias patch="bash ~/ffmpeg-patch-tool/patch.sh"' >> ~/.bashrc
source ~/.bashrc

echo ""
echo -e "${GREEN}=============================${NC}"
echo -e "${GREEN}  Installation complete! ✓   ${NC}"
echo -e "${GREEN}=============================${NC}"
echo ""
echo -e "${CYAN}How to use:${NC}"
echo -e "  1. Put your video in Documents folder as ${YELLOW}input.mp4${NC}"
echo -e "  2. Type ${YELLOW}patch${NC} and press Enter"
echo -e "  3. Select ${YELLOW}1${NC} for 60fps or ${YELLOW}2${NC} for 120fps"
echo -e "  4. Find ${YELLOW}output.mp4${NC} in Documents folder"
echo ""
