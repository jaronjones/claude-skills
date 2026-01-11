# Quick Reference

Quick answers to common questions for contributors and maintainers.

## For Contributors

### How do I add a skill?

```bash
# 1. Create directory
mkdir -p skills/category/skill-name

# 2. Copy template
cp SKILL_TEMPLATE.md skills/category/skill-name/SKILL.md

# 3. Edit
$EDITOR skills/category/skill-name/SKILL.md

# 4. Test

# 5. Submit PR
git checkout -b skill/skill-name
git add skills/category/skill-name/
git commit -m "feat(category): add skill-name"
git push origin skill/skill-name
```

### Which category should I use?

- **development/** - Writing, testing, debugging code
- **devops/** - Infrastructure, deployment, CI/CD
- **documentation/** - Creating, managing docs
- **automation/** - Task automation, scripts

See [docs/CATEGORIES.md](docs/CATEGORIES.md) for details.

### What must every skill include?

- ✅ SKILL.md with complete sections
- ✅ Skill name (H1)
- ✅ Overview (2-4 sentences)
- ✅ Instructions or Examples
- ✅ Prerequisites
- ✅ Apache 2.0 license footer
- ✅ No sensitive data
- ✅ No placeholders

### How do I test my skill?

1. Follow your own instructions exactly
2. Test on a fresh environment if possible
3. Verify all examples work
4. Check for errors

### What should I avoid?

- ❌ Sensitive data (API keys, passwords)
- ❌ Placeholder text ({{...}})
- ❌ Untested examples
- ❌ Incomplete instructions
- ❌ Hard-coded personal paths

## For Maintainers

### Review checklist

- [ ] SKILL.md complete and well-written
- [ ] Correct category
- [ ] Examples tested
- [ ] No sensitive data
- [ ] No placeholders
- [ ] License included
- [ ] Prerequisites clear
- [ ] Follows template structure

### Merging PRs

```bash
# Review the PR
# Run automated checks (GitHub Actions does this)
# Test the skill if needed
# Approve and merge
```

### Adding categories

New categories require:
1. Discussion and consensus
2. At least 3 skills that fit
3. Clear definition
4. Update CATEGORIES.md
5. Create skills/category/ directory

### Deprecating skills

1. Add DEPRECATED notice to SKILL.md
2. Explain why
3. Suggest alternatives
4. Move to skills/deprecated/ after 3 months

## Common Commands

### Search for keywords
```bash
grep -r "docker" skills/
find skills -name "*kubernetes*"
```

### Validate skill
```bash
# Check for placeholders
grep -r "{{" skills/category/skill-name/

# Check for sensitive data
grep -iE "(api.?key|password|secret|token)" skills/category/skill-name/
```

### Update README stats
```bash
# Count skills
find skills -name "SKILL.md" | wc -l

# List all skills
find skills -name "SKILL.md" -exec dirname {} \;
```

## File Structure

```
skills/category/skill-name/
├── SKILL.md           # Main doc (required)
├── scripts/           # Optional
│   └── helper.sh
├── config/            # Optional
│   └── example.json
└── assets/            # Optional
    └── diagram.png
```

## Template Placeholders

Replace these in SKILL_TEMPLATE.md:

- `{{SKILL_NAME}}` - Your skill name
- `{{Brief description}}` - Overview text
- `{{Use case N}}` - When to use
- `{{Tool/dependency}}` - Prerequisites
- `{{Step Title}}` - Instruction steps
- `{{command}}` - Code examples
- `{{YEAR}}` - Current year
- `{{AUTHOR_NAME}}` - Your name

## Resources

- [README.md](README.md) - Main overview
- [CONTRIBUTING.md](CONTRIBUTING.md) - Full guide
- [SKILL_TEMPLATE.md](SKILL_TEMPLATE.md) - Template
- [docs/SKILL_GUIDELINES.md](docs/SKILL_GUIDELINES.md) - Writing tips
- [docs/CATEGORIES.md](docs/CATEGORIES.md) - Categories
- [GETTING_STARTED.md](GETTING_STARTED.md) - Quick start

## Questions?

- Open a Discussion for general questions
- Open an Issue for bugs or problems
- Check existing skills for examples
