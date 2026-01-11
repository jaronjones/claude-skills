# Skill Creator

## Overview
A comprehensive toolkit for creating, validating, and managing Claude Code skills. This meta-skill provides templates, automation, and best practices to help teams build consistent, high-quality skills quickly.

## When to Use This Skill
Use this skill when you need to:
- Create new Claude Code skills for your team
- Standardize skill documentation across projects
- Validate existing skills for completeness
- Set up automated skill validation in CI/CD
- Establish skill creation best practices

## Prerequisites
- Bash 4.0 or higher
- Git (for version control)
- Basic command line knowledge
- Text editor (vim, nano, VS Code, etc.)

## Directory Structure

```
claude-code-skill-creator/
├── scripts/
│   ├── create-skill.sh      # Interactive wizard
│   ├── copy-template.sh     # Quick template copy
│   ├── validate-skill.sh    # Validation tool
│   └── lib/                 # Helper libraries
├── templates/
│   ├── basic/               # Simple skill template
│   ├── with-scripts/        # Template with automation
│   └── with-config/         # Template with configuration
├── examples/                # Example skills
├── docs/                    # Comprehensive documentation
└── .github/                 # CI/CD workflows
```

## Instructions

### Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-skill-creator.git
cd claude-code-skill-creator
```

### Step 2: Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

### Step 3: Create Your First Skill

**Option A: Interactive Wizard (Recommended)**

```bash
./scripts/create-skill.sh
```

Follow the prompts to:
- Name your skill
- Choose a template
- Customize details
- Auto-validate the result

**Option B: Quick Template Copy**

```bash
./scripts/copy-template.sh basic my-skill-name
```

Then manually edit the generated files.

### Step 4: Customize Your Skill

Edit the generated `SKILL.md` file:

```bash
cd my-skill-name
$EDITOR SKILL.md
```

Replace all `{{PLACEHOLDERS}}` with actual content:
- Add specific instructions
- Include working examples
- Document prerequisites
- Add troubleshooting tips

### Step 5: Validate Your Skill

```bash
../scripts/validate-skill.sh .
```

Fix any errors or warnings reported by the validator.

### Step 6: Share or Deploy

**For team sharing:**
```bash
# Move to examples directory
mv my-skill-name examples/

# Commit and push
git add examples/my-skill-name
git commit -m "feat(skills): add my-skill-name"
git push
```

**For pull request submission:**
1. Fork the repository
2. Create a feature branch
3. Add your skill to `examples/`
4. Submit a pull request

## Available Templates

### Basic Template
- Simple SKILL.md and LICENSE
- Best for documentation-only skills
- Minimal structure

**Use when:**
- No scripts or configuration needed
- Pure instructional content
- Simple workflows

### With-Scripts Template
- Includes `scripts/` directory
- Template for setup, run, cleanup scripts
- Best for automation tasks

**Use when:**
- Need helper scripts
- Automating repetitive tasks
- Complex setup procedures

### With-Config Template
- Includes `config/` directory
- Configuration file templates
- JSON schema examples

**Use when:**
- Skills require configuration
- Multiple deployment scenarios
- User-customizable behavior

## Examples

### Example 1: Create a Basic Skill

```bash
# Start wizard
./scripts/create-skill.sh

# Answer prompts:
# Skill name: docker-cleanup
# Description: Remove unused Docker resources safely
# Author: Your Name
# Template: basic
# Output: ./skills

# Result: skills/docker-cleanup/ created with validated SKILL.md
```

### Example 2: Quick Copy and Customize

```bash
# Copy template
./scripts/copy-template.sh with-scripts backup-tool ./my-skills

# Edit SKILL.md
cd my-skills/backup-tool
vim SKILL.md

# Create scripts
cat > scripts/setup.sh << 'EOF'
#!/bin/bash
echo "Setting up backup tool..."
EOF

# Validate
../../scripts/validate-skill.sh .
```

### Example 3: Validate Existing Skill

```bash
# Validate a skill directory
./scripts/validate-skill.sh examples/git-commit-formatter

# Output shows:
# ✓ SKILL.md found
# ✓ LICENSE found (Apache 2.0)
# ✓ Skill name found
# ✓ No template placeholders found
# ✓ Validation passed!
```

## Validation Checks

The validator automatically checks:

- ✓ **Required files** - SKILL.md and LICENSE present
- ✓ **Apache 2.0 license** - Correct license file
- ✓ **Skill name** - H1 header at top of file
- ✓ **No placeholders** - All `{{VARS}}` replaced
- ✓ **Valid markdown** - Balanced code blocks
- ✓ **Minimum content** - At least 20 lines
- ✓ **Current copyright** - Year matches current

## Best Practices

### Skill Naming
- Use lowercase with hyphens: `my-skill-name`
- Be descriptive: `git-commit-formatter` not `gcf`
- Avoid redundancy: `api-client` not `api-client-skill`

### Documentation
- Write clear, step-by-step instructions
- Include complete, tested examples
- Document common issues and solutions
- Add prerequisites and requirements

### Testing
- Test all commands before documenting
- Verify examples on fresh environment
- Update for version changes
- Remove sensitive information

### Maintenance
- Keep skills current
- Respond to issues promptly
- Archive obsolete skills
- Update based on feedback

## GitHub Actions Integration

### Automatic PR Validation

The repository includes GitHub Actions that automatically validate skills in pull requests:

```yaml
# .github/workflows/validate-pr.yml
# Runs on every PR touching examples/ or templates/
```

**What it checks:**
- All changed skills pass validation
- Apache 2.0 license is present
- No validation errors

### Scheduled Validation

Weekly validation of all example skills:

```yaml
# .github/workflows/validate-examples.yml
# Runs every Sunday at midnight UTC
```

Creates an issue if validation fails.

## Common Issues

### Validation Fails on Placeholders

**Problem**: Validator reports `{{PLACEHOLDER}}` text found

**Solution**: 
```bash
# Find remaining placeholders
grep -r "{{" SKILL.md

# Replace them with actual content
vim SKILL.md
```

### Script Permission Denied

**Problem**: `./scripts/create-skill.sh: Permission denied`

**Solution**:
```bash
chmod +x scripts/*.sh
```

### Git Hooks Not Working

**Problem**: Pre-commit hooks don't execute

**Solution**:
```bash
# Make hooks executable
chmod +x .git/hooks/*
```

## Customization

### Adding Custom Templates

1. Create template directory:
```bash
mkdir templates/my-template
```

2. Add template files:
```bash
cp templates/basic/SKILL.md.template templates/my-template/
# Customize as needed
```

3. Update scripts to recognize new template

### Extending Validation

Edit `scripts/validate-skill.sh` to add custom checks:

```bash
# Add to validation function
if ! check_my_custom_requirement "$skill_md"; then
    error "Custom requirement not met"
    ((errors++))
fi
```

## Additional Resources

- [Skill Format Specification](docs/SKILL_FORMAT.md) - Detailed format requirements
- [Best Practices Guide](docs/BEST_PRACTICES.md) - Writing effective skills
- [Quick Start Guide](docs/QUICKSTART.md) - Get started in 5 minutes
- [Contributing Guide](CONTRIBUTING.md) - How to contribute

## Troubleshooting

### Issue: sed Command Not Working

Some systems use BSD sed instead of GNU sed, which has different syntax.

**Solution**: Install GNU sed or adjust commands:
```bash
# macOS with Homebrew
brew install gnu-sed
# Then use 'gsed' instead of 'sed'
```

### Issue: Validation Passes But Skill Seems Incomplete

The validator checks structure, not content quality. Manually review:
- Are instructions clear?
- Do examples work?
- Is documentation complete?

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to submit skills
- Quality guidelines
- Review process
- Style requirements

## License

Copyright 2025 Claude Code Skill Creator Contributors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
