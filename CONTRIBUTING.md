# Contributing to Claude Skills Library

Thank you for contributing! This guide will help you add high-quality skills to the library.

## 🎯 Quick Contribution Guide

### 1. Choose a Category

Skills are organized by purpose:
- **development/** - Coding, testing, debugging
- **devops/** - Infrastructure, deployment, CI/CD
- **documentation/** - Writing, formatting, docs generation
- **automation/** - Scripts, workflows, task automation

Not sure? See [docs/CATEGORIES.md](docs/CATEGORIES.md) for detailed descriptions.

### 2. Create Your Skill

**Option A: Use the Skill Creator Tool**
```bash
# Clone the skill creator
git clone https://github.com/YOUR_USERNAME/claude-code-skill-creator.git
cd claude-code-skill-creator

# Run the wizard
./scripts/create-skill.sh

# Move to skills library
mv your-skill ../claude-skills-library/skills/category-name/
```

**Option B: Manual Creation**
```bash
# Fork and clone this repo
git clone https://github.com/YOUR_USERNAME/claude-skills-library.git
cd claude-skills-library

# Create skill directory
mkdir -p skills/category-name/your-skill-name

# Copy template
cp SKILL_TEMPLATE.md skills/category-name/your-skill-name/SKILL.md

# Edit the skill
$EDITOR skills/category-name/your-skill-name/SKILL.md
```

### 3. Follow the Template

Your `SKILL.md` must include:

- **Skill Name** (H1 header)
- **Overview** - What it does (2-4 sentences)
- **When to Use** - Use cases
- **Prerequisites** - Requirements
- **Instructions** - Step-by-step guide
- **Examples** - At least one complete example
- **License** - Apache 2.0 footer

Optional but recommended:
- Best practices
- Common issues & solutions
- Additional resources

### 4. Test Everything

Before submitting:
- [ ] Run every command in your instructions
- [ ] Verify examples work as documented
- [ ] Test on a fresh environment if possible
- [ ] Remove any sensitive information (API keys, passwords)
- [ ] Check for typos and clarity

### 5. Submit a Pull Request

```bash
# Create a branch
git checkout -b skill/your-skill-name

# Add your skill
git add skills/category-name/your-skill-name/

# Commit
git commit -m "feat(category): add your-skill-name"

# Push
git push origin skill/your-skill-name
```

Then open a pull request on GitHub.

## 📝 Skill Quality Standards

### Must Have

- [ ] **Complete documentation** - All sections filled out
- [ ] **Working examples** - Tested and verified
- [ ] **Clear instructions** - Step-by-step, easy to follow
- [ ] **Prerequisites listed** - Tools, knowledge, versions
- [ ] **No placeholders** - All {{VARS}} replaced
- [ ] **Apache 2.0 license** - Footer included
- [ ] **No sensitive data** - No secrets, keys, passwords

### Should Have

- [ ] **Multiple examples** - Basic, common, advanced
- [ ] **Troubleshooting** - Common issues documented
- [ ] **Best practices** - Tips for optimal use
- [ ] **Visual aids** - Screenshots, diagrams (if helpful)
- [ ] **Resource links** - Related tools, docs

### Nice to Have

- [ ] **Helper scripts** - Automation in `scripts/` folder
- [ ] **Config templates** - Examples in `config/` folder
- [ ] **Tests** - Validation scripts
- [ ] **Video tutorial** - Screencast or demo

## 📐 Skill Structure

### File Organization

```
skills/category/your-skill-name/
├── SKILL.md           # Main documentation (required)
├── README.md          # Optional: Additional context
├── scripts/           # Optional: Helper scripts
│   ├── setup.sh
│   ├── run.sh
│   └── cleanup.sh
├── config/            # Optional: Config templates
│   └── example.json
└── assets/            # Optional: Images, diagrams
    └── screenshot.png
```

### Naming Conventions

**Skill names:**
- Use lowercase with hyphens: `docker-compose-helper`
- Be descriptive: `api-client-generator` not `acg`
- Avoid redundancy: `git-workflow` not `git-workflow-skill`

**File names:**
- Main doc: Always `SKILL.md`
- Scripts: Use `.sh` for bash, `.py` for Python, etc.
- Configs: Use standard extensions (`.json`, `.yaml`, `.toml`)

## ✍️ Writing Guidelines

### Clarity Over Cleverness

**Good:**
```markdown
### Step 1: Install Dependencies
Install the required npm packages:
\`\`\`bash
npm install --save express cors
\`\`\`
```

**Bad:**
```markdown
### Step 1
npm i express cors
```

### Show, Don't Just Tell

**Good:**
```markdown
### Example: Deploy to Production

\`\`\`bash
./deploy.sh production --validate
\`\`\`

**Expected Output:**
\`\`\`
✓ Validation passed
✓ Building artifacts
✓ Deploying to production
Deployment URL: https://app.example.com
\`\`\`
```

**Bad:**
```markdown
Use deploy.sh with production flag.
```

### Use Active Voice

**Good:**
- "Run the command to start the server"
- "Configure the API key in settings"
- "Install the dependencies first"

**Bad:**
- "The command should be run to start the server"
- "The API key should be configured"
- "Dependencies should be installed"

### Be Specific

**Good:**
```markdown
## Prerequisites
- Node.js 18.x or higher
- npm 9.x or higher
- PostgreSQL 14+ running locally
- At least 2GB free disk space
```

**Bad:**
```markdown
## Prerequisites
- Node.js
- npm
- Database
```

## 🏷️ Category Guidelines

### Development
Skills related to writing, testing, and debugging code:
- Code formatters and linters
- Testing frameworks and helpers
- Debugging tools
- Code generators
- Language-specific utilities

**Examples:** `go-struct-generator`, `test-coverage-reporter`, `debug-workflow`

### DevOps
Skills for infrastructure, deployment, and operations:
- Container orchestration
- CI/CD pipelines
- Infrastructure as Code
- Monitoring and logging
- Deployment automation

**Examples:** `kubernetes-deployment`, `terraform-module-creator`, `docker-cleanup`

### Documentation
Skills for creating and managing documentation:
- Doc generators
- Markdown helpers
- API documentation
- README templates
- Changelog automation

**Examples:** `api-docs-generator`, `readme-builder`, `changelog-from-commits`

### Automation
Skills for automating repetitive tasks:
- Workflow automation
- File processing
- Batch operations
- Scheduled tasks
- System administration

**Examples:** `batch-image-resize`, `log-analyzer`, `backup-automation`

## 🔍 Review Process

### What We Look For

1. **Completeness** - All required sections present
2. **Accuracy** - Instructions work as described
3. **Clarity** - Easy to understand and follow
4. **Quality** - Professional and polished
5. **Value** - Useful to the community

### Timeline

- **Initial review**: Within 3-5 days
- **Feedback**: Provided if changes needed
- **Merge**: Once approved and all checks pass

### Automated Checks

GitHub Actions will automatically:
- Validate SKILL.md structure
- Check for Apache 2.0 license
- Look for sensitive data patterns
- Verify no placeholders remain

## 🚫 What Not to Include

### Prohibited Content

- **Sensitive data**: API keys, passwords, credentials
- **Proprietary code**: Copyrighted or confidential code
- **Malicious content**: Exploits, malware, vulnerabilities
- **Personal info**: Email addresses, phone numbers
- **Incomplete skills**: Half-finished or untested work

### Discouraged Patterns

- **Over-complex skills**: Break into multiple skills instead
- **Too specific**: If only works for one exact scenario
- **Deprecated tools**: Unless specifically for legacy support
- **Duplicate skills**: Check existing skills first

## 💬 Communication

### Getting Help

- **Questions**: Open a [Discussion](https://github.com/YOUR_USERNAME/claude-skills-library/discussions)
- **Issues**: Report problems via [Issues](https://github.com/YOUR_USERNAME/claude-skills-library/issues)
- **Ideas**: Suggest in Discussions or Issues with `skill-idea` label

### Providing Feedback

When reviewing others' skills:
- Be constructive and specific
- Suggest improvements, don't just criticize
- Test before commenting
- Recognize good work

## 🎨 Style Guide

### Markdown Formatting

```markdown
# Skill Name (H1 - only once, at top)

## Major Section (H2)

### Subsection (H3)

#### Sub-subsection (H4 - sparingly)

**Bold** for emphasis
*Italic* for mild emphasis
`code` for inline code
```

### Code Blocks

Always specify language:
```markdown
\`\`\`bash
echo "Shell script"
\`\`\`

\`\`\`python
print("Python code")
\`\`\`

\`\`\`javascript
console.log("JavaScript");
\`\`\`
```

### Lists

Use `-` for unordered lists:
```markdown
- First item
- Second item
  - Nested item
  - Another nested
```

Use `1.` for ordered lists:
```markdown
1. First step
2. Second step
3. Third step
```

## 📊 Maintenance

### Updating Skills

To update an existing skill:
1. Create a branch: `git checkout -b update/skill-name`
2. Make your changes
3. Test thoroughly
4. Submit PR with description of changes

### Deprecating Skills

If a skill becomes outdated:
1. Add **DEPRECATED** notice to top of SKILL.md
2. Explain why and suggest alternatives
3. Move to `skills/deprecated/` after 3 months

### Versioning

Skills don't use semantic versioning, but:
- Document major changes in comments
- Update copyright year when changing
- Note breaking changes prominently

## 🎓 Learning Resources

### Great Examples

Look at these skills for inspiration:
- `skills/development/example-skill/` - Well documented
- `skills/devops/example-skill/` - Good structure
- `skills/automation/example-skill/` - Clear examples

### External Resources

- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message format
- [Markdown Guide](https://www.markdownguide.org/) - Markdown syntax
- [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) - License details

## ✅ Pre-Submission Checklist

Before submitting your PR:

- [ ] Skill is in correct category
- [ ] SKILL.md is complete
- [ ] All examples tested and working
- [ ] No sensitive information included
- [ ] No placeholder text ({{...}})
- [ ] Apache 2.0 license footer included
- [ ] Prerequisites clearly listed
- [ ] At least one complete example
- [ ] Spell-checked and proofread
- [ ] Commit message follows format
- [ ] PR description is clear

## 🙏 Recognition

Contributors are recognized:
- Listed in repository contributors
- Mentioned in release notes
- Credited in skill documentation

Thank you for helping build the Claude Skills Library! 🚀
