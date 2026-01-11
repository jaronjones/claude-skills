#!/bin/bash

# Source colors for output
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

# Validate skill name (lowercase, hyphens, numbers only)
validate_skill_name() {
    local name="$1"
    
    if [[ ! "$name" =~ ^[a-z0-9-]+$ ]]; then
        error "Skill name must contain only lowercase letters, numbers, and hyphens"
        return 1
    fi
    
    if [[ "$name" =~ ^- ]] || [[ "$name" =~ -$ ]]; then
        error "Skill name cannot start or end with a hyphen"
        return 1
    fi
    
    if [[ "$name" =~ -- ]]; then
        error "Skill name cannot contain consecutive hyphens"
        return 1
    fi
    
    return 0
}

# Validate directory doesn't already exist
validate_directory() {
    local dir="$1"
    
    if [ -d "$dir" ]; then
        error "Directory '$dir' already exists"
        return 1
    fi
    
    return 0
}

# Check if required section exists in SKILL.md
check_required_section() {
    local file="$1"
    local section="$2"
    
    # Check for both ## and # headers
    if grep -q "^## $section" "$file" || grep -q "^# $section" "$file"; then
        return 0
    fi
    
    return 1
}

# Check for template placeholders
check_placeholders() {
    local file="$1"
    
    if grep -q "{{.*}}" "$file"; then
        return 1
    fi
    
    if grep -qE "(TODO|FIXME|XXX)" "$file"; then
        return 1
    fi
    
    return 0
}

# Validate email format
validate_email() {
    local email="$1"
    
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    fi
    
    return 1
}

# Check if file contains Apache 2.0 license
check_apache_license() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        return 1
    fi
    
    if grep -q "Apache License" "$file" && grep -q "Version 2.0" "$file"; then
        return 0
    fi
    
    return 1
}

# Validate description length
validate_description() {
    local desc="$1"
    local max_length="${2:-200}"
    
    if [ ${#desc} -gt "$max_length" ]; then
        error "Description is too long (${#desc} chars, max $max_length)"
        return 1
    fi
    
    if [ ${#desc} -lt 10 ]; then
        error "Description is too short (minimum 10 characters)"
        return 1
    fi
    
    return 0
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Validate year format
validate_year() {
    local year="$1"
    
    if [[ ! "$year" =~ ^[0-9]{4}$ ]]; then
        return 1
    fi
    
    if [ "$year" -lt 2020 ] || [ "$year" -gt 2100 ]; then
        return 1
    fi
    
    return 0
}
