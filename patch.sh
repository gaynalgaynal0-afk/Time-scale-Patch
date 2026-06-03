#!/bin/bash

# ─────────────────────────────────────────
#        VIDEO PATCH TOOL by Termux
# ─────────────────────────────────────────

DOCS="/storage/emulated/0/Documents"
INPUT="$DOCS/input.mp4"
OUTPUT="$DOCS/output.mp4"

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}=============================${NC}"
echo -e "${CYAN}      VIDEO PATCH TOOL       ${NC}"
echo -e "${CYAN}=============================${NC}"
echo ""

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo -e "${YELLOW}FFmpeg not found. Installing...${NC}"
    pkg install -y ffmpeg
    echo -e "${GREEN}FFmpeg installed!${NC}"
fi

# Check if input.mp4 exists in Documents
if [ ! -f "$INPUT" ]; then
    echo -e "${RED}ERROR: input.mp4 not found in Documents folder!${NC}"
    echo -e "${YELLOW}Please place your video at:${NC}"
    echo -e "  $INPUT"
    echo ""
    exit 1
fi

echo -e "${GREEN}Found: input.mp4 ✓${NC}"
echo ""

# Ask user for FPS option
echo -e "${CYAN}Select patch type:${NC}"
echo -e "  ${YELLOW}1${NC} → 60fps  (itsscale 2)"
echo -e "  ${YELLOW}2${NC} → 120fps (itsscale 4)"
echo ""
read -p "Enter 1 or 2: " CHOICE
echo ""

case $CHOICE in
    1)
        echo -e "${CYAN}Running 60fps patch...${NC}"
        ffmpeg -itsscale 2 -i "$INPUT" -c copy "$OUTPUT"
        ;;
    2)
        echo -e "${CYAN}Running 120fps patch...${NC}"
        ffmpeg -itsscale 4 -i "$INPUT" -c copy "$OUTPUT"
        ;;
    *)
        echo -e "${RED}Invalid choice. Please enter 1 or 2.${NC}"
        exit 1
        ;;
esac

# Done
echo ""
echo -e "${GREEN}=============================${NC}"
echo -e "${GREEN}  Done! output.mp4 saved to:${NC}"
echo -e "${GREEN}  $DOCS${NC}"
echo -e "${GREEN}=============================${NC}"
echo ""
