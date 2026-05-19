# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## First Steps

**Your first tool call in this repository MUST be reading .claude/CODING_STANDARD.md.
Do not read any other files, search, or take any actions until you have read it.**
This contains InfraHouse's comprehensive coding standards for Terraform, Python, and general formatting rules.

## Module Overview

This is `terraform-aws-cloudcraft-role`, an InfraHouse Terraform module that creates an IAM role
for Cloudcraft to scan AWS infrastructure. It grants read-only permissions across many AWS services
(EC2, RDS, S3, ECS, Lambda, etc.) and uses an external ID condition for cross-account trust with
Cloudcraft's AWS account (`968898580625`).

## Build & Development Commands

```bash
make bootstrap          # Install dependencies (pip packages from requirements.txt, git hooks)
make format             # Format code (terraform fmt -recursive && black tests)
make lint               # Check formatting (black --check, terraform fmt -check, tflint)
make test               # Run pytest integration tests
make clean              # Remove .pytest_cache and .terraform directories
```

## Commit Message Format

Commits must follow Conventional Commits format (enforced by `hooks/commit-msg`):
```
<type>[optional scope]: <description>
```
Valid types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`,
`security`

## Pre-commit Hook

The `hooks/pre-commit` hook runs automatically and:
1. Checks Terraform formatting (`terraform fmt -check -recursive`)
2. Regenerates README.md via `terraform-docs` (auto-stages changes)
3. Validates all staged files end with a newline

## Architecture

- `cloudcraft.tf` — IAM role with cross-account assume-role trust policy (external ID condition),
  IAM policy attachment, and outputs
- `policy.tf` — IAM policy document granting read-only permissions to Cloudcraft across AWS services
- `variables.tf` — Single required variable: `external_id` (UUID from Cloudcraft)
- `outputs.tf` — Empty (outputs are defined inline in `cloudcraft.tf`)
- `terraform.tf` — Provider requirements (AWS >= 5.20)

## Key Files Managed Externally

These files are managed by Terraform in the `github-control` repository — do not edit them directly:
- `hooks/pre-commit`, `hooks/commit-msg`
- `.terraform-docs.yml`, `mkdocs.yml`, `cliff.toml`
- `.claude/CODING_STANDARD.md`
