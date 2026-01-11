# Skill Categories

This document defines the categories used to organize skills in the library.

## Category Definitions

### Development

**Purpose**: Skills for writing, testing, and debugging code

**Subcategories**:
- Code generation and scaffolding
- Testing and quality assurance
- Debugging and troubleshooting
- Code formatting and linting
- Language-specific utilities
- IDE and editor helpers

**Examples**:
- `go-struct-generator` - Generate Go structs from JSON
- `test-coverage-reporter` - Analyze and report test coverage
- `debug-logging-helper` - Add structured logging to applications
- `code-formatter` - Auto-format code to standards
- `api-mock-generator` - Generate API mocks for testing

**When to use this category**:
- Skill directly helps write code
- Assists with code quality or testing
- Automates code-related tasks
- Language or framework specific

---

### DevOps

**Purpose**: Skills for infrastructure, deployment, and operations

**Subcategories**:
- Container orchestration (Docker, Kubernetes)
- CI/CD pipelines (GitHub Actions, GitLab CI)
- Infrastructure as Code (Terraform, CloudFormation)
- Monitoring and observability
- Deployment automation
- Cloud platforms (AWS, GCP, Azure)

**Examples**:
- `kubernetes-deployment-helper` - Deploy apps to K8s clusters
- `terraform-module-builder` - Create reusable Terraform modules
- `docker-cleanup` - Remove unused containers and images
- `ci-pipeline-validator` - Validate CI/CD configs
- `cloudwatch-log-analyzer` - Parse and analyze AWS logs

**When to use this category**:
- Skill manages infrastructure
- Relates to deployment or releases
- Involves containers or orchestration
- Cloud platform operations
- System monitoring or logging

---

### Documentation

**Purpose**: Skills for creating and managing documentation

**Subcategories**:
- Documentation generation
- Markdown utilities
- API documentation
- README builders
- Changelog automation
- Diagram creation

**Examples**:
- `api-docs-generator` - Generate API docs from OpenAPI spec
- `readme-builder` - Create comprehensive README files
- `changelog-from-commits` - Generate changelogs from git history
- `markdown-table-formatter` - Format markdown tables
- `docs-link-validator` - Check for broken links in docs

**When to use this category**:
- Skill creates or formats documentation
- Generates docs from code or specs
- Manages documentation workflows
- Helps write better docs

---

### Automation

**Purpose**: Skills for automating repetitive tasks and workflows

**Subcategories**:
- File and directory operations
- Data processing and transformation
- Batch operations
- Scheduled tasks and cron jobs
- System administration
- Workflow orchestration

**Examples**:
- `batch-file-renamer` - Rename files in bulk with patterns
- `log-analyzer` - Parse and summarize log files
- `csv-to-json-converter` - Convert data formats
- `backup-automation` - Automated backup scripts
- `email-processor` - Process emails based on rules

**When to use this category**:
- Skill automates manual tasks
- Processes files or data in bulk
- Runs on a schedule
- General purpose automation
- System administration tasks

---

## Category Selection Guide

### Decision Tree

1. **Is it about writing/testing code?**
   - Yes → **Development**

2. **Is it about infrastructure/deployment?**
   - Yes → **DevOps**

3. **Is it about creating documentation?**
   - Yes → **Documentation**

4. **Is it about automating tasks?**
   - Yes → **Automation**

5. **Still unsure?**
   - Consider the primary purpose
   - Ask in Discussions
   - Default to most relevant category

### Multiple Categories?

If a skill fits multiple categories:
- Choose the **primary** purpose
- Mention related categories in the skill's documentation
- Link to related skills in other categories

**Example**: A skill that generates API documentation from code could be:
- **Primary**: Documentation (it creates docs)
- **Related**: Development (involves code analysis)
- **Place in**: `documentation/`

### Creating New Categories

New categories require:
1. Discussion and consensus
2. At least 3 skills that would fit
3. Clear definition and purpose
4. Update to this document
5. Update to repository structure

To propose a new category:
1. Open a Discussion
2. Explain the need
3. Provide examples
4. Get community feedback

## Category Guidelines

### Naming

- Use singular form: `development` not `developments`
- Be concise: one word if possible
- Be descriptive: clear purpose
- Use lowercase: `devops` not `DevOps`

### Organization

Within each category, skills are:
- Listed alphabetically
- One skill per directory
- Self-contained (all files in skill directory)

### Metadata

Each skill should include category in metadata:
```markdown
**Skill Metadata**
- **Category**: development
- **Difficulty**: Intermediate
- **Tags**: go, code-generation, json
```

## Tag System

In addition to categories, skills can have tags:

### Common Tags

**Languages**: `go`, `python`, `javascript`, `bash`, `rust`, `java`
**Tools**: `docker`, `kubernetes`, `terraform`, `git`, `aws`, `gcp`
**Types**: `code-generation`, `testing`, `deployment`, `automation`
**Difficulty**: `beginner`, `intermediate`, `advanced`

### Tag Guidelines

- Use lowercase
- Use hyphens for multi-word tags
- Be specific but not overly narrow
- Limit to 3-5 tags per skill
- Reuse existing tags when possible

## Finding Skills

### By Category
```bash
ls skills/development/
ls skills/devops/
ls skills/documentation/
ls skills/automation/
```

### By Tag
```bash
grep -r "Tags:.*docker" skills/
```

### By Search
```bash
find skills -name "SKILL.md" | xargs grep -l "kubernetes"
```

## Examples by Category

### Development Category Examples

```
skills/development/
├── go-struct-generator/
├── test-coverage-reporter/
├── api-mock-generator/
├── code-formatter/
└── debug-logging-helper/
```

### DevOps Category Examples

```
skills/devops/
├── kubernetes-deployment/
├── terraform-module-builder/
├── docker-cleanup/
├── ci-pipeline-validator/
└── monitoring-setup/
```

### Documentation Category Examples

```
skills/documentation/
├── api-docs-generator/
├── readme-builder/
├── changelog-automation/
├── markdown-formatter/
└── docs-link-checker/
```

### Automation Category Examples

```
skills/automation/
├── batch-file-processor/
├── log-analyzer/
├── backup-automation/
├── email-handler/
└── report-generator/
```

## Questions?

If you're unsure which category to use:
1. Read this document carefully
2. Look at existing skills in each category
3. Ask in Discussions
4. When in doubt, choose the primary purpose

Remember: Categories help organization, but they're not critical. The most important thing is that your skill is well-documented and useful!
