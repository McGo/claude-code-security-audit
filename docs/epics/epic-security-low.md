# Epic: Security Hardening – Low Findings

**Status:** open
**Priority:** LOW
**Source:** Security Audit, 2026-02-06

## Description

Two low-severity hardening improvements were identified: IDE configuration files committed to the repository (information disclosure) and missing `.gitignore` entries for generated output directories.

---

## Tickets

### 1.1 – Remove IDE Configuration from Repository

**File:** `.idea/`
**Finding:** L1 – The `.idea/` directory (JetBrains IDE configuration) is committed to the repository despite being listed in `.gitignore`. The `workspace.xml` file contains local environment details such as the PHP interpreter version, project IDs, and internal timestamps. While not directly exploitable, this constitutes unnecessary information disclosure and repository clutter.

**Current Code (.gitignore:6):**
```
.idea/
```

Note: The `.gitignore` correctly lists `.idea/` but the directory was committed before the rule was added.

**Required Changes:**

1. Remove the `.idea/` directory from git tracking:

```bash
git rm -r --cached .idea/
```

2. Commit the removal. The existing `.gitignore` rule will prevent future re-addition.

---

### 1.2 – Add Generated Output Directories to `.gitignore`

**File:** `.gitignore`
**Finding:** L2 – The `docs/epics/` and `docs/security-audit/` output directories are not covered by `.gitignore`. When the skill is run on its own repository (self-audit), generated markdown epics would be tracked by git. While `*.pdf` and `*.html` are excluded globally, the markdown epic files are not.

**Current Code (.gitignore:1-7):**
```
*.pdf
*.html
!report-template.html
node_modules/
.DS_Store
.idea/
.claude/
```

**Required Changes:**

1. Add exclusions for generated output content:

```
*.pdf
*.html
!report-template.html
node_modules/
.DS_Store
.idea/
.claude/
docs/epics/
docs/security-audit/
```

---

## Acceptance Criteria

- [ ] `.idea/` directory is removed from git tracking (`git ls-files .idea/` returns empty)
- [ ] `.gitignore` includes `docs/epics/` and `docs/security-audit/` entries
- [ ] Running `git status` after generating audit output shows no untracked files in `docs/`
