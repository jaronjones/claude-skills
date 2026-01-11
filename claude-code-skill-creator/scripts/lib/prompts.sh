#!/bin/bash

# Source colors for output
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

# Prompt for required input
prompt_required() {
    local prompt="$1"
    local var_name="$2"
    local value=""
    
    while [ -z "$value" ]; do
        echo -ne "${CYAN}${prompt}:${NC} "
        read value
        if [ -z "$value" ]; then
            error "This field is required"
        fi
    done
    
    eval "$var_name='$value'"
}

# Prompt for optional input with default value
prompt_optional() {
    local prompt="$1"
    local var_name="$2"
    local default="$3"
    
    echo -ne "${CYAN}${prompt}${NC} [${default}]: "
    read value
    value="${value:-$default}"
    eval "$var_name='$value'"
}

# Prompt for multiline input
prompt_multiline() {
    local prompt="$1"
    local var_name="$2"
    local lines=()
    
    echo -e "${CYAN}${prompt}${NC} (press Ctrl+D when done, empty line to skip):"
    
    while IFS= read -r line; do
        lines+=("$line")
    done
    
    # Join lines with newlines
    local result=$(printf "%s\n" "${lines[@]}")
    eval "$var_name='$result'"
}

# Confirm yes/no question
confirm() {
    local prompt="$1"
    local response
    
    while true; do
        echo -ne "${CYAN}${prompt}${NC} (y/n): "
        read response
        case "$response" in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) warn "Please answer y or n";;
        esac
    done
}

# Select from a list of options
select_option() {
    local prompt="$1"
    shift
    local options=("$@")
    local var_name="${options[-1]}"
    unset 'options[-1]'
    
    echo -e "\n${CYAN}${prompt}${NC}"
    
    local i=1
    for option in "${options[@]}"; do
        echo "  ${i}) ${option}"
        ((i++))
    done
    
    local choice
    while true; do
        echo -ne "\n${CYAN}Select option (1-${#options[@]}):${NC} "
        read choice
        
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#options[@]}" ]; then
            local selected="${options[$((choice-1))]}"
            eval "$var_name='$selected'"
            break
        else
            error "Invalid selection. Please choose 1-${#options[@]}"
        fi
    done
}

# Display a section separator
section() {
    echo -e "\n${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${BLUE}  $1${NC}"
    echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}
