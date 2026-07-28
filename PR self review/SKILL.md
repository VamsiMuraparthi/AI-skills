---
name: self-pr-review
description: Reviews git changes in the current branch by retrieving git diff and sending those changes to the model to give a comprehensive code review.
argument-hint: "[target-branch]"
---

# Self PR Review

This skill takes changes from `git diff`, sends them to the model for analysis, and provides a detailed code review.

## First-time setup

```bash
bash ${CLAUDE_SKILL_DIR}/setup.sh
```

## How to invoke

`/self-pr-review` (reviews uncommitted changes)
`/self-pr-review [target-branch]` (reviews changes in the current branch against the target branch)

## Workflow

1. The agent will determine the appropriate `git diff` command to run based on the arguments provided (e.g., `git diff` for uncommitted changes, or `git diff <branch>...HEAD` for comparing against another branch).
2. The agent executes the diff command to capture the changes.
3. The agent will review the changes, focusing on:
   - Bugs and edge cases
   - Code readability, maintainability, and style
   - Security vulnerabilities
   - Performance optimizations
4. The agent presents a structured markdown review.
