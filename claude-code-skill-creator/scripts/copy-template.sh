#!/bin/bash

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Source helpers
source "$SCRIPT_DIR/lib/colors.sh"
source "$SCRIPT_DIR/lib/validators.sh"

# Usage information
usage() {
    cat << EOF
Usage: $(basename "$0") <template-type> <skill-name> [output-dir]

Quickly copy a skill template without interactive prompts.

Arguments:
    template-type    Type of template (basic, with-scripts, with-config)
    skill-name       Name for your new skill (lowercase-with-hyphens)
    output-dir       Output directory (default: current directory)

Templates:
    basic           Simple skill with SKILL.md and LICENSE
    with-scripts    Skill with scripts/ directory for automation
    with-config     Skill with config/ directory for configuration files

Examples:
    $(basename "$0") basic my-awesome-skill
    $(basename "$0") with-scripts api-wrapper ./skills
    $(basename "$0") with-config db-migration ../projects

EOF
}

# Main copy function
copy_template() {
    local template_type="$1"
    local skill_name="$2"
    local output_dir="${3:-.}"
    
    # Validate inputs
    if ! validate_skill_name "$skill_name"; then
        return 1
    fi
    
    # Construct paths
    local template_dir="$PROJECT_ROOT/templates/$template_type"
    local target_dir="$output_dir/$skill_name"
    
    # Check template exists
    if [ ! -d "$template_dir" ]; then
        error "Template '$template_type' not found"
        info "Available templates: basic, with-scripts, with-config"
        return 1
    fi
    
    # Check target doesn't exist
    if ! validate_directory "$target_dir"; then
        return 1
    fi
    
    # Create output directory if needed
    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"
        info "Created output directory: $output_dir"
    fi
    
    # Copy template
    step "Copying template '$template_type' to '$target_dir'..."
    cp -r "$template_dir" "$target_dir"
    
    # Rename template file if it exists
    if [ -f "$target_dir/SKILL.md.template" ]; then
        mv "$target_dir/SKILL.md.template" "$target_dir/SKILL.md"
    fi
    
    success "Template copied successfully!"
    
    # Instructions
    echo ""
    info "Next steps:"
    echo "  1. cd $target_dir"
    echo "  2. Edit SKILL.md and replace all {{PLACEHOLDERS}}"
    echo "  3. Run: $SCRIPT_DIR/validate-skill.sh $target_dir"
    echo ""
    
    return 0
}

# Main script
main() {
    # Check arguments
    if [ $# -lt 2 ] || [ $# -gt 3 ]; then
        usage
        exit 1
    fi
    
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi
    
    # Run copy
    if copy_template "$@"; then
        exit 0
    else
        exit 1
    fi
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main "$@"
fi
