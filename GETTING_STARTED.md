# Claude Code Skill Creator - Setup Instructions

## What You've Got

A complete skill creation toolkit with:
- ✅ Interactive wizard for guided skill creation
- ✅ Quick template copy tool
- ✅ Automatic validation
- ✅ Three professional templates
- ✅ GitHub Actions for CI/CD
- ✅ Complete documentation
- ✅ Example skills

## Quick Start (2 minutes)

### 1. Save to Your Repository

```bash
# Navigate to where you want the repo
cd ~/projects

# If you downloaded the files
mv /path/to/claude-code-skill-creator ./

# Or clone from GitHub after you push it
# git clone https://github.com/YOUR_USERNAME/claude-code-skill-creator.git

cd claude-code-skill-creator
```

### 2. Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

### 3. Create Your First Skill

```bash
./scripts/create-skill.sh
```

Answer the prompts and you're done! The wizard will:
- Guide you through naming and describing your skill
- Let you choose a template
- Auto-generate the files
- Validate everything
- Offer to open your editor

## What's Next?

### For Your Team

1. **Initialize Git repository** (if not already)
   ```bash
   git init
   git add .
   git commit -m "feat: add skill-creator toolkit"
   ```

2. **Push to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/claude-code-skill-creator.git
   git push -u origin main
   ```

3. **Update README badges**
   - Edit `README.md`
   - Replace `YOUR_USERNAME` with your GitHub username

4. **Enable GitHub Actions**
   - Go to repository Settings → Actions
   - Enable workflows

### Creating Skills

**Interactive (recommended for first time):**
```bash
./scripts/create-skill.sh
```

**Quick copy (for experienced users):**
```bash
./scripts/copy-template.sh basic my-skill-name
```

**Validate a skill:**
```bash
./scripts/validate-skill.sh path/to/skill
```

## File Structure

```
claude-code-skill-creator/
├── SKILL.md                 # The meta-skill (documents this tool)
├── README.md                # Main documentation
├── LICENSE                  # Apache 2.0
├── CONTRIBUTING.md          # Contribution guide
├── CHANGELOG.md             # Version history
│
├── scripts/                 # Creation & validation tools
│   ├── create-skill.sh      # Interactive wizard ⭐
│   ├── copy-template.sh     # Quick copy
│   ├── validate-skill.sh    # Validation
│   └── lib/                 # Helper functions
│
├── templates/               # Skill templates
│   ├── basic/               # Simple documentation
│   ├── with-scripts/        # Includes scripts/
│   └── with-config/         # Includes config/
│
├── examples/                # Example skills
│   └── git-commit-formatter/ # Complete example
│
├── docs/                    # Documentation
│   ├── QUICKSTART.md        # 5-minute guide
│   ├── SKILL_FORMAT.md      # Format spec
│   └── BEST_PRACTICES.md    # Writing guide
│
└── .github/                 # CI/CD
    ├── workflows/           # GitHub Actions
    └── ISSUE_TEMPLATE/      # Issue templates
```

## Templates Explained

### Basic
- Just SKILL.md + LICENSE
- Perfect for documentation-only skills
- Example: Process guides, checklists

### With-Scripts
- Includes scripts/ directory
- For automation and helper scripts
- Example: Setup scripts, deployment tools

### With-Config
- Includes config/ directory
- For configurable tools
- Example: Templates with customization

## Testing the Toolkit

### 1. Test Validation
```bash
./scripts/validate-skill.sh examples/git-commit-formatter
```

Should show: ✓ Validation passed!

### 2. Test Template Copy
```bash
./scripts/copy-template.sh basic test-skill /tmp
ls /tmp/test-skill
```

Should create SKILL.md and LICENSE

### 3. Test Wizard
```bash
./scripts/create-skill.sh
```

Follow the prompts to create a test skill

## Customization

### Add Your Own Templates

1. Create new template directory:
   ```bash
   mkdir templates/my-template
   ```

2. Add SKILL.md.template and LICENSE

3. Update scripts if needed

### Customize Validation

Edit `scripts/validate-skill.sh` to add your own checks

### Add Team-Specific Docs

- Add to `docs/`
- Update README with team info
- Customize CONTRIBUTING.md

## Tips for Your Team

1. **Start with examples** - Look at `examples/git-commit-formatter/`
2. **Use the wizard first** - Learn the structure
3. **Read best practices** - Check `docs/BEST_PRACTICES.md`
4. **Validate often** - Run validator before committing
5. **Share early** - Get feedback on draft skills

## GitHub Actions

Once pushed to GitHub, you get:

- **PR Validation** - Auto-validates skills in pull requests
- **Weekly Checks** - Validates all examples every Sunday
- **Issue Creation** - Creates issues if validation fails

To enable: Push to GitHub and actions will run automatically

## Support

- **Documentation**: Read `docs/` directory
- **Examples**: Check `examples/` directory
- **Issues**: Use GitHub issues
- **Questions**: Open a discussion

## Next Steps

1. ✅ Test the wizard: `./scripts/create-skill.sh`
2. ✅ Read QUICKSTART: `docs/QUICKSTART.md`
3. ✅ Browse examples: `examples/`
4. ✅ Create your first real skill
5. ✅ Push to GitHub
6. ✅ Share with your team

---

**Everything is Apache 2.0 licensed - free to use and modify!**

Happy skill creating! 🚀
