# Quick Start Guide

Get started with Claude Code Skill Creator in 5 minutes.

## Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/claude-code-skill-creator.git
cd claude-code-skill-creator
```

2. Make scripts executable:
```bash
chmod +x scripts/*.sh
```

That's it! No dependencies to install.

## Create Your First Skill

### Option 1: Interactive Wizard (Recommended)

Run the wizard:
```bash
./scripts/create-skill.sh
```

Answer the prompts:
- **Skill name**: `my-first-skill`
- **Description**: `A simple example skill for testing`
- **Author**: `Your Name`
- **Template**: Choose `basic`
- **Output directory**: `.` (current directory)

The wizard will:
1. ✓ Create the skill directory
2. ✓ Copy and customize templates
3. ✓ Validate the skill
4. ✓ Offer to open in your editor

### Option 2: Quick Copy

For faster creation without prompts:
```bash
./scripts/copy-template.sh basic my-first-skill
```

Then edit the files manually.

## Edit Your Skill

1. Open the generated SKILL.md:
```bash
cd my-first-skill
$EDITOR SKILL.md  # or: nano SKILL.md, vim SKILL.md, code SKILL.md
```

2. Replace remaining placeholders (if any):
   - Add specific instructions
   - Include working examples
   - Document prerequisites

3. Test any commands or scripts you document

## Validate Your Skill

Run the validator:
```bash
../scripts/validate-skill.sh .
```

Fix any errors reported. Common issues:
- Leftover `{{PLACEHOLDERS}}`
- Missing examples
- Unclosed code blocks

## Submit (Optional)

If sharing with the community:

1. Fork the repository
2. Move your skill to `examples/`:
```bash
mv my-first-skill ../examples/
```

3. Create a pull request

## What's Next?

- Read [SKILL_FORMAT.md](SKILL_FORMAT.md) for detailed format info
- Check [BEST_PRACTICES.md](BEST_PRACTICES.md) for writing tips
- Browse `examples/` for inspiration
- Create more skills!

## Common Commands

```bash
# Create skill (wizard)
./scripts/create-skill.sh

# Quick copy template
./scripts/copy-template.sh <template> <name>

# Validate skill
./scripts/validate-skill.sh <skill-dir>

# List available templates
ls templates/
```

## Templates

- **basic** - Simple documentation-only skill
- **with-scripts** - Includes `scripts/` directory
- **with-config** - Includes `config/` directory

## Getting Help

- Check the main [README.md](../README.md)
- Read the [CONTRIBUTING.md](../CONTRIBUTING.md) guide
- Open an [issue](https://github.com/YOUR_USERNAME/claude-code-skill-creator/issues)

## Tips for Success

1. **Start simple** - Use the basic template first
2. **Test everything** - Run all your examples
3. **Be specific** - Clear instructions beat clever ones
4. **Use examples** - Show, don't just tell
5. **Validate often** - Catch issues early

Happy skill creating! 🚀
