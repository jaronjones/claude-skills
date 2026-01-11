#!/bin/bash

# Terminal color codes for styled output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Output functions with color and icons
error() {
    echo -e "${RED}✗ $1${NC}" >&2
}

success() {
    echo -e "${GREEN}✓ $1${NC}"
}

info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

warn() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

highlight() {
    echo -e "${CYAN}$1${NC}"
}

header() {
    echo -e "\n${BOLD}${MAGENTA}$1${NC}\n"
}

step() {
    echo -e "${BOLD}${BLUE}▸ $1${NC}"
}
