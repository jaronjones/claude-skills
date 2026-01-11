#!/bin/bash

set -e

# Get script directory for sourcing helpers
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/colors.sh"
source "$SCRIPT_DIR/lib/validators.sh"

# Usage information
usage() {
    cat << EOF
Usage: $(basename "$0") <skill-directory>

Validate a Claude Code skill for completeness and correctness.

Arguments:
    skill-directory    Path to the skill directory to validate

Exit codes:
    0    Validation passed
    1    Validation failed with errors
    2    Missing required files

Examples:
    $(basename "$0") ./my-skill
    $(basename "$0") ../examples/git-commit-formatter
EOF
}

# Main validation function
validate_skill() {
    local skill_dir="$1"
    local errors=0
    
    header "Validating skill: $skill_dir"
    
    # Check if directory exists
    if [ ! -d "$skill_dir" ]; then
        error "Directory does not exist: $skill_dir"
        return 2
    fi
    
    # Check for required files
    step "Checking required files..."
    
    if [ ! -f "$skill_dir/SKILL.md" ]; then
        error "Missing SKILL.md file"
        ((errors++))
    else
        success "SKILL.md found"
    fi
    
    if [ ! -f "$skill_dir/LICENSE" ]; then
        error "Missing LICENSE file"
        ((errors++))
    else
        if check_apache_license "$skill_dir/LICENSE"; then
            success "LICENSE found (Apache 2.0)"
        else
            error "LICENSE must be Apache 2.0"
            ((errors++))
        fi
    fi
    
    # If SKILL.md doesn't exist, can't continue validation
    if [ ! -f "$skill_dir/SKILL.md" ]; then
        return 1
    fi
    
    # Validate SKILL.md structure
    step "Validating SKILL.md structure..."
    
    local required_sections=("Overview" "Instructions" "Examples")
    local skill_md="$skill_dir/SKILL.md"
    
    # Check for skill name (first # header)
    if ! grep -q "^# " "$skill_md"; then
        error "Missing skill name (# header at top of file)"
        ((errors++))
    else
        success "Skill name found"
    fi
    
    # Check for required sections
    for section in "${required_sections[@]}"; do
        if check_required_section "$skill_md" "$section"; then
            success "Section found: $section"
        else
            warn "Optional/missing section: $section"
            # Not counting as error since only name is truly required
        fi
    done
    
    # Check for template placeholders
    step "Checking for placeholders..."
    
    if check_placeholders "$skill_md"; then
        success "No template placeholders found"
    else
        if grep -q "{{.*}}" "$skill_md"; then
            error "Found template placeholders ({{...}})"
            grep -n "{{.*}}" "$skill_md" | while read -r line; do
                info "  Line: $line"
            done
            ((errors++))
        fi
        
        if grep -qE "(TODO|FIXME|XXX)" "$skill_md"; then
            warn "Found TODO/FIXME markers"
            grep -nE "(TODO|FIXME|XXX)" "$skill_md" | while read -r line; do
                info "  Line: $line"
            done
        fi
    fi
    
    # Check for Apache license header in SKILL.md
    step "Checking license header in SKILL.md..."
    
    if grep -q "Apache License" "$skill_md"; then
        success "License header found in SKILL.md"
    else
        warn "No license header in SKILL.md (recommended but not required)"
    fi
    
    # Check for minimum content length
    step "Checking content completeness..."
    
    local line_count=$(wc -l < "$skill_md")
    if [ "$line_count" -lt 20 ]; then
        warn "SKILL.md seems short ($line_count lines). Consider adding more detail."
    else
        success "SKILL.md has substantial content ($line_count lines)"
    fi
    
    # Validate markdown syntax (basic check)
    step "Validating markdown syntax..."
    
    # Check for unclosed code blocks
    local code_fence_count=$(grep -c '```' "$skill_md" 2>/dev/null || echo "0")
    if [ $((code_fence_count % 2)) -ne 0 ]; then
        error "Unclosed code block (odd number of backtick fence markers)"
        ((errors++))
    else
        success "Markdown code blocks are balanced"
    fi
    
    # Check copyright year
    step "Checking copyright year..."
    
    local current_year=$(date +%Y)
    if grep -q "Copyright.*$current_year" "$skill_md" || grep -q "Copyright.*$current_year" "$skill_dir/LICENSE"; then
        success "Copyright year is current ($current_year)"
    else
        warn "Copyright year might be outdated (current year is $current_year)"
    fi
    
    # Summary
    echo ""
    if [ $errors -eq 0 ]; then
        success "✓ Validation passed! No errors found."
        return 0
    else
        error "✗ Validation failed with $errors error(s)"
        return 1
    fi
}

# Main script
main() {
    # Check arguments
    if [ $# -ne 1 ]; then
        usage
        exit 2
    fi
    
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi
    
    # Run validation
    validate_skill "$1"
    exit $?
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main "$@"
fi
