# Getting Started with Claude Skills Library

Welcome! This guide will help you start using and contributing to the skills library.

## For Skill Users

### Finding Skills

1. **Browse by category**:
   ```bash
   cd skills
   ls development/    # Code-related skills
   ls devops/         # Infrastructure skills
   ls documentation/  # Doc-related skills
   ls automation/     # Task automation skills
   ```

2. **Search for keywords**:
   ```bash
   # Find skills mentioning "docker"
   grep -r "docker" skills/*/SKILL.md
   
   # Find all git-related skills
   find skills -name "*git*"
   ```

### Using a Skill

1. Navigate to the skill directory:
   ```bash
   cd skills/category/skill-name/
   ```

2. Read the SKILL.md:
   ```bash
   cat SKILL.md
   # or
   less SKILL.md
   ```

3. Check prerequisites

4. Follow the instructions step-by-step

5. Try the examples

## For Skill Contributors

### Quick Start

1. **Fork and clone**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/claude-skills-library.git
   cd claude-skills-library
   ```

2. **Create a skill**:
   ```bash
   # Create directory
   mkdir -p skills/category/your-skill-name
   
   # Copy template
   cp SKILL_TEMPLATE.md skills/category/your-skill-name/SKILL.md
   
   # Edit the skill
   $EDITOR skills/category/your-skill-name/SKILL.md
   ```

3. **Fill in all sections** (see template)

4. **Test thoroughly**

5. **Submit PR**:
   ```bash
   git checkout -b skill/your-skill-name
   git add skills/category/your-skill-name/
   git commit -m "feat(category): add your-skill-name"
   git push origin skill/your-skill-name
   ```

### Using the Skill Creator Tool

For easier skill creation, use the skill-creator toolkit:

```bash
# Clone the creator tool
git clone https://github.com/YOUR_USERNAME/claude-code-skill-creator.git

# Create a skill
cd claude-code-skill-creator
./scripts/create-skill.sh

# Move to skills library
mv your-skill-name ../claude-skills-library/skills/category/
```

## Repository Structure

```
claude-skills-library/
├── README.md              # Main overview
├── CONTRIBUTING.md        # How to contribute
├── SKILL_TEMPLATE.md      # Template for new skills
├── LICENSE                # Apache 2.0
│
├── skills/                # All skills
│   ├── development/       # Code-related
│   ├── devops/           # Infrastructure
│   ├── documentation/    # Docs
│   └── automation/       # Task automation
│
├── docs/                 # Guidelines
│   ├── CATEGORIES.md     # Category definitions
│   └── SKILL_GUIDELINES.md  # Writing guide
│
└── .github/              # GitHub config
    ├── workflows/        # CI/CD
    └── ISSUE_TEMPLATE/   # Templates
```

## Categories

### Development
Skills for writing, testing, and debugging code:
- Code generators
- Testing tools
- Formatters/linters
- Language utilities

### DevOps
Skills for infrastructure and deployment:
- Docker/Kubernetes
- CI/CD pipelines
- Terraform/IaC
- Monitoring

### Documentation
Skills for creating docs:
- Doc generators
- Markdown tools
- API documentation
- READMEs

### Automation
Skills for automating tasks:
- File processing
- Batch operations
- Scripts
- Workflows

See [docs/CATEGORIES.md](docs/CATEGORIES.md) for details.

## Skill Requirements

Every skill must have:
- ✅ SKILL.md with complete documentation
- ✅ Clear category placement
- ✅ Working, tested examples
- ✅ Prerequisites listed
- ✅ Apache 2.0 license
- ✅ No sensitive data

## Quality Standards

Good skills are:
- **Clear** - Easy to understand
- **Complete** - All info needed
- **Correct** - Tested and accurate
- **Concise** - No fluff
- **Consistent** - Follows patterns

## Resources

- **SKILL_TEMPLATE.md** - Copy this to start
- **docs/SKILL_GUIDELINES.md** - Writing tips
- **docs/CATEGORIES.md** - Category guide
- **CONTRIBUTING.md** - Full contribution guide

## Getting Help

- **Questions**: Open a [Discussion](https://github.com/YOUR_USERNAME/claude-skills-library/discussions)
- **Issues**: Report [bugs/problems](https://github.com/YOUR_USERNAME/claude-skills-library/issues)
- **Ideas**: Suggest skills with the skill-idea template

## Quick Tips

### For Users
1. Read the whole SKILL.md first
2. Check prerequisites
3. Follow steps exactly
4. Try the basic example first

### For Contributors
1. Read existing skills for inspiration
2. Test everything before submitting
3. Keep it simple and clear
4. Follow the template structure

## Common Tasks

### Add a New Skill
```bash
mkdir -p skills/category/skill-name
cp SKILL_TEMPLATE.md skills/category/skill-name/SKILL.md
$EDITOR skills/category/skill-name/SKILL.md
```

### Update an Existing Skill
```bash
cd skills/category/skill-name
$EDITOR SKILL.md
# Test your changes
git commit -m "docs(skill-name): update instructions"
```

### Find Skills by Tag
```bash
grep -r "Tags:.*docker" skills/
```

### Validate Before Submitting
```bash
# Check for placeholders
grep -r "{{" skills/your-skill/

# Check for sensitive data
grep -iE "(api.?key|password|secret)" skills/your-skill/
```

## Next Steps

### I Want to Use Skills
1. Browse `skills/` directory
2. Pick a skill that interests you
3. Follow its SKILL.md
4. Give feedback if something doesn't work

### I Want to Contribute
1. Read [CONTRIBUTING.md](CONTRIBUTING.md)
2. Check [docs/SKILL_GUIDELINES.md](docs/SKILL_GUIDELINES.md)
3. Create your skill
4. Submit a PR

### I Have an Idea
1. Check existing skills first
2. Open an issue with the skill-idea template
3. Discuss with the community
4. Create it (or find a volunteer)

## Questions?

Don't hesitate to ask! We're here to help.

- Open a Discussion for questions
- Check the docs/ folder
- Look at existing skills for examples

Happy skill creating! 🚀
