# Epic: Security Hardening – Low Findings

**Status:** closed
**Priority:** LOW
**Source:** Security Audit, 2026-02-06

## Description

Two low-severity hardening improvements were identified and have since been resolved: IDE configuration files are no longer tracked in git, and `.gitignore` now excludes generated output directories.

---

## Tickets

### 1.1 – Remove IDE Configuration from Repository ✓ RESOLVED

**File:** `.idea/`
**Finding:** L1 – The `.idea/` directory (JetBrains IDE configuration) was committed to the repository despite being listed in `.gitignore`. The `workspace.xml` file contained local environment details such as the PHP interpreter version, project IDs, and internal timestamps.

**Resolution:** The `.idea/` directory is no longer tracked in git. The `.gitignore` rule prevents future re-addition. Verified via `git ls-files .idea/` returning empty.

---

### 1.2 – Add Generated Output Directories to `.gitignore` ✓ RESOLVED

**File:** `.gitignore`
**Finding:** L2 – The `docs/epics/` and `docs/security-audit/` output directories were not covered by `.gitignore`.

**Resolution:** Added `docs/epics/` and `docs/security-audit/` to `.gitignore`:

```
docs/epics/
docs/security-audit/
```

---

## Acceptance Criteria

- [x] `.idea/` directory is removed from git tracking (`git ls-files .idea/` returns empty)
- [x] `.gitignore` includes `docs/epics/` and `docs/security-audit/` entries
- [x] Running `git status` after generating audit output shows no untracked files in `docs/`
