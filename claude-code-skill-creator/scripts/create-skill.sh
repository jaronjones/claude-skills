#!/bin/bash

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Source helpers
source "$SCRIPT_DIR/lib/colors.sh"
source "$SCRIPT_DIR/lib/prompts.sh"
source "$SCRIPT_DIR/lib/validators.sh"

# Display welcome banner
show_banner() {
    cat << 'EOF'
╔═══════════════════════════════════════════════════════════════════╗
║                                                                   ║
║        🚀  Claude Code Skill Creator  🚀                          ║
║                                                                   ║
║        Create professional Claude Code skills in minutes         ║
║                                                                   ║
╚═══════════════════════════════════════════════════════════════════╝

EOF
}

# Get current year
get_current_year() {
    date +%Y
}

# Replace placeholders in template
replace_placeholders() {
    local file="$1"
    local skill_name="$2"
    local description="$3"
    local author="$4"
    local year="$5"
    
    # Use sed to replace placeholders
    sed -i "s/{{SKILL_NAME}}/$skill_name/g" "$file"
    sed -i "s/{{DESCRIPTION}}/$description/g" "$file"
    sed -i "s/{{AUTHOR}}/$author/g" "$file"
    sed -i "s/{{YEAR}}/$year/g" "$file"
}

# Interactive wizard mode
wizard_mode() {
    show_banner
    
    info "This wizard will guide you through creating a new Claude Code skill."
    echo ""
    
    # Section 1: Basic Information
    section "Basic Information"
    
    # Skill name
    local skill_name
    while true; do
        prompt_required "Skill name (lowercase-with-hyphens)" skill_name
        if validate_skill_name "$skill_name"; then
            break
        fi
    done
    
    # Description
    local description
    while true; do
        prompt_required "Short description (10-200 chars)" description
        if validate_description "$description"; then
            break
        fi
    done
    
    # Author
    local author
    prompt_required "Author name" author
    
    # Year
    local year
    year=$(get_current_year)
    prompt_optional "Copyright year" year "$year"
    
    # Section 2: Template Selection
    section "Template Selection"
    
    local template_type
    select_option "Choose a template type" \
        "basic - Simple skill with SKILL.md" \
        "with-scripts - Includes scripts/ directory for automation" \
        "with-config - Includes config/ directory for configuration" \
        template_type
    
    # Extract just the template name (before the dash)
    template_type=$(echo "$template_type" | cut -d' ' -f1)
    
    # Section 3: Output Location
    section "Output Location"
    
    local output_dir
    prompt_optional "Output directory" output_dir "."
    
    local target_dir="$output_dir/$skill_name"
    
    # Check if target exists
    if [ -d "$target_dir" ]; then
        error "Directory already exists: $target_dir"
        if ! confirm "Remove existing directory and continue?"; then
            info "Cancelled."
            return 1
        fi
        rm -rf "$target_dir"
    fi
    
    # Section 4: Additional Details (Wizard Only)
    section "Additional Details"
    
    local when_to_use
    prompt_optional "When should this skill be used?" when_to_use "Use this skill when you need to..."
    
    local prerequisites
    prompt_optional "Prerequisites (if any)" prerequisites "None"
    
    # Section 5: Confirmation
    section "Summary"
    
    echo "Skill Name:     $skill_name"
    echo "Description:    $description"
    echo "Author:         $author"
    echo "Template:       $template_type"
    echo "Output:         $target_dir"
    echo ""
    
    if ! confirm "Create this skill?"; then
        info "Cancelled."
        return 1
    fi
    
    # Section 6: Create Skill
    section "Creating Skill"
    
    # Create output directory if needed
    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"
    fi
    
    # Copy template
    step "Copying template files..."
    local template_dir="$PROJECT_ROOT/templates/$template_type"
    cp -r "$template_dir" "$target_dir"
    
    # Rename template file
    if [ -f "$target_dir/SKILL.md.template" ]; then
        mv "$target_dir/SKILL.md.template" "$target_dir/SKILL.md"
    fi
    
    success "Template copied"
    
    # Replace placeholders in SKILL.md
    step "Customizing SKILL.md..."
    local skill_md="$target_dir/SKILL.md"
    
    # Basic replacements
    sed -i "s/{{SKILL_NAME}}/$skill_name/g" "$skill_md"
    sed -i "s/{{DESCRIPTION}}/$description/g" "$skill_md"
    sed -i "s/{{AUTHOR}}/$author/g" "$skill_md"
    sed -i "s/{{YEAR}}/$year/g" "$skill_md"
    sed -i "s/{{WHEN_TO_USE}}/$when_to_use/g" "$skill_md"
    sed -i "s/{{PREREQUISITES}}/$prerequisites/g" "$skill_md"
    
    # Provide helpful defaults for remaining placeholders
    sed -i "s/{{STEP_1_TITLE}}/Setup/g" "$skill_md"
    sed -i "s/{{STEP_1_INSTRUCTIONS}}/Describe the first step here./g" "$skill_md"
    sed -i "s/{{STEP_2_TITLE}}/Execute/g" "$skill_md"
    sed -i "s/{{STEP_2_INSTRUCTIONS}}/Describe the second step here./g" "$skill_md"
    sed -i "s/{{STEP_3_TITLE}}/Verify/g" "$skill_md"
    sed -i "s/{{STEP_3_INSTRUCTIONS}}/Describe the third step here./g" "$skill_md"
    
    sed -i "s/{{EXAMPLE_1_TITLE}}/Basic Usage/g" "$skill_md"
    sed -i "s/{{EXAMPLE_1_DESCRIPTION}}/A simple example demonstrating basic usage./g" "$skill_md"
    sed -i "s/{{EXAMPLE_1_CODE}}/# Add your example code here/g" "$skill_md"
    sed -i "s/{{EXAMPLE_1_OUTPUT}}/Expected output goes here/g" "$skill_md"
    
    sed -i "s/{{EXAMPLE_2_TITLE}}/Advanced Usage/g" "$skill_md"
    sed -i "s/{{EXAMPLE_2_DESCRIPTION}}/An advanced example showing more features./g" "$skill_md"
    sed -i "s/{{EXAMPLE_2_CODE}}/# Add your advanced example here/g" "$skill_md"
    
    sed -i "s/{{BEST_PRACTICE_1}}/Follow established conventions/g" "$skill_md"
    sed -i "s/{{BEST_PRACTICE_2}}/Test thoroughly before deploying/g" "$skill_md"
    sed -i "s/{{BEST_PRACTICE_3}}/Document your changes/g" "$skill_md"
    
    sed -i "s/{{ISSUE_1_TITLE}}/Common Error/g" "$skill_md"
    sed -i "s/{{ISSUE_1_DESCRIPTION}}/Describe the problem/g" "$skill_md"
    sed -i "s/{{ISSUE_1_SOLUTION}}/Describe the solution/g" "$skill_md"
    sed -i "s/{{ISSUE_2_TITLE}}/Another Issue/g" "$skill_md"
    sed -i "s/{{ISSUE_2_DESCRIPTION}}/Describe the problem/g" "$skill_md"
    sed -i "s/{{ISSUE_2_SOLUTION}}/Describe the solution/g" "$skill_md"
    
    sed -i "s/{{RESOURCE_1}}/[Documentation](https:\/\/example.com)/g" "$skill_md"
    sed -i "s/{{RESOURCE_2}}/[Related Tool](https:\/\/example.com)/g" "$skill_md"
    
    # Template-specific placeholders
    if [ "$template_type" = "with-scripts" ]; then
        sed -i "s/{{SETUP_DETAILS}}/Configure your environment as needed./g" "$skill_md"
        sed -i "s/{{SCRIPT_ARGS}}/[your-arguments]/g" "$skill_md"
        sed -i "s/{{SETUP_SCRIPT_DESCRIPTION}}/Prepares the environment/g" "$skill_md"
        sed -i "s/{{RUN_SCRIPT_DESCRIPTION}}/Executes the main task/g" "$skill_md"
        sed -i "s/{{CLEANUP_SCRIPT_DESCRIPTION}}/Cleans up temporary files/g" "$skill_md"
        sed -i "s/{{OPTION_1}}/-v, --verbose: Enable verbose output/g" "$skill_md"
        sed -i "s/{{OPTION_2}}/-h, --help: Show help message/g" "$skill_md"
        sed -i "s/{{ARG_1}}/argument1: Description of first argument/g" "$skill_md"
        sed -i "s/{{ARG_2}}/argument2: Description of second argument/g" "$skill_md"
        sed -i "s/{{EXAMPLE_1_ARGS}}/example arguments/g" "$skill_md"
    fi
    
    if [ "$template_type" = "with-config" ]; then
        sed -i "s/{{CONFIG_KEY_1}}/setting1/g" "$skill_md"
        sed -i "s/{{CONFIG_KEY_2}}/setting2/g" "$skill_md"
        sed -i "s/{{CONFIG_KEY_3}}/advanced/g" "$skill_md"
        sed -i "s/{{CONFIG_VALUE_1}}/value1/g" "$skill_md"
        sed -i "s/{{CONFIG_VALUE_2}}/value2/g" "$skill_md"
        sed -i "s/{{NESTED_KEY}}/option/g" "$skill_md"
        sed -i "s/{{NESTED_VALUE}}/value/g" "$skill_md"
        sed -i "s/{{TYPE_1}}/string/g" "$skill_md"
        sed -i "s/{{TYPE_2}}/boolean/g" "$skill_md"
        sed -i "s/{{TYPE_3}}/object/g" "$skill_md"
        sed -i "s/{{DEFAULT_1}}/default-value/g" "$skill_md"
        sed -i "s/{{DEFAULT_2}}/true/g" "$skill_md"
        sed -i "s/{{DEFAULT_3}}/{}/g" "$skill_md"
        sed -i "s/{{DESCRIPTION_1}}/Description of setting1/g" "$skill_md"
        sed -i "s/{{DESCRIPTION_2}}/Description of setting2/g" "$skill_md"
        sed -i "s/{{DESCRIPTION_3}}/Description of advanced settings/g" "$skill_md"
        sed -i "s/{{STEP_2_COMMAND}}/your-command/g" "$skill_md"
        sed -i "s/{{EXAMPLE_1_VALUE_1}}/example1/g" "$skill_md"
        sed -i "s/{{EXAMPLE_1_VALUE_2}}/true/g" "$skill_md"
        sed -i "s/{{EXAMPLE_1_COMMAND}}/your-command --config config\/example1.json/g" "$skill_md"
        sed -i "s/{{EXAMPLE_2_VALUE_1}}/example2/g" "$skill_md"
        sed -i "s/{{EXAMPLE_2_NESTED_VALUE}}/custom/g" "$skill_md"
        sed -i "s/{{EXAMPLE_2_COMMAND}}/your-command --config config\/example2.json/g" "$skill_md"
        sed -i "s/{{VALIDATION_COMMAND}}/jsonlint config\/my-config.json/g" "$skill_md"
    fi
    
    success "SKILL.md customized"
    
    # Section 7: Validate
    section "Validation"
    
    step "Running validation..."
    if "$SCRIPT_DIR/validate-skill.sh" "$target_dir"; then
        success "Skill created successfully!"
    else
        warn "Validation found some issues. Please review and fix them."
    fi
    
    # Section 8: Next Steps
    section "Next Steps"
    
    echo "Your skill has been created at: $target_dir"
    echo ""
    info "To finish your skill:"
    echo "  1. cd $target_dir"
    echo "  2. Edit SKILL.md to complete the documentation"
    echo "  3. Add any scripts or config files as needed"
    echo "  4. Run: $SCRIPT_DIR/validate-skill.sh $target_dir"
    echo ""
    
    if confirm "Open SKILL.md in your default editor?"; then
        ${EDITOR:-vi} "$skill_md"
    fi
    
    return 0
}

# Quick mode (non-interactive)
quick_mode() {
    info "Use the wizard mode for guided creation, or copy-template.sh for quick copying"
    "$SCRIPT_DIR/copy-template.sh" "$@"
}

# Usage information
usage() {
    cat << EOF
Usage: $(basename "$0") [options]

Interactive wizard to create Claude Code skills.

Options:
    -h, --help       Show this help message
    -q, --quick      Quick mode (same as copy-template.sh)

Interactive Mode (default):
    Run without arguments to start the interactive wizard

Quick Mode:
    $(basename "$0") -q <template-type> <skill-name> [output-dir]

Examples:
    $(basename "$0")                              # Interactive wizard
    $(basename "$0") -q basic my-skill            # Quick copy

EOF
}

# Main script
main() {
    # Handle help
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi
    
    # Handle quick mode
    if [ "$1" = "-q" ] || [ "$1" = "--quick" ]; then
        shift
        quick_mode "$@"
        exit $?
    fi
    
    # Default to wizard mode
    if wizard_mode; then
        exit 0
    else
        exit 1
    fi
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main "$@"
fi
