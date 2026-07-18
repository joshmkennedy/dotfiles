---
name: work-local-issue
description: Find and work the next open local Markdown issue in repositories that use docs/issues/epics/<epic>/0000-epic.md and NNNN-status-type-slug.md files. Use when the user asks to work the next local issue, next story, next open epic item, or continue work from a local Markdown issue tracker without GitHub commands.
---

# Work Local Issue

Work from the repository's local Markdown issue tracker. Do not use GitHub issue commands unless the user separately asks for them.

## Workflow

1. Run the finder script from the repo root:

```sh
python3 ~/.codex/skills/work-local-issue/scripts/find_next_issue.py
```

2. Read the returned epic `0000-epic.md` first.
3. Read the returned issue file.
4. Read referenced project docs before editing, usually `CONTEXT.md`, `docs/TECH-STACK.md`, `docs/nodebug-PRD.md`, and relevant ADRs.
5. If the next issue status is `todo`, claim it by renaming `NNNN-todo-...md` to `NNNN-doing-...md` before implementation.
6. If the next issue status is `blocked`, inspect the blocker note and report the blocker instead of skipping ahead.
7. If the next issue status is `doing`, inspect the issue and current worktree; continue only if it is clearly safe, otherwise report that the issue is already in progress.
8. Implement the issue end-to-end according to its acceptance criteria and QA workflow.
9. Run the repo's required checks.
10. When complete, update the issue body with a short completion note if useful, then rename `NNNN-doing-...md` to `NNNN-done-...md`.

If the user asks to start, plan, or break down a specific epic and that epic has no issue files yet, treat it as a backlog/planning epic: read `0000-epic.md`, discuss scope and acceptance criteria with the user, and create story files only after the user approves the breakdown. Do not implement code from an epic overview alone.

## Issue Rules

- Treat the numeric prefix as the stable issue ID. Status-bearing filenames are expected to change.
- Pick the first undone issue in the first undone epic by sorted path order.
- "Undone" means the filename status is not `done`.
- Do not skip a blocked lower-numbered issue to work a later issue unless the user explicitly instructs you to.
- Keep implementation aligned with the issue body, `CONTEXT.md`, `docs/TECH-STACK.md`, and ADRs.
- Keep files focused by concept; split large mixed-concept files before marking the issue done.
- Epic directories with only `0000-epic.md` are not ready-to-work issues. They are planning containers until `NNNN-todo-afk-...md` or `NNNN-todo-hitl-...md` story files exist.
- When creating story files during epic kickoff, make each story a thin vertical slice that is demoable on its own. Prefer `todo-afk` only when the story can be implemented without more product discussion; use `todo-hitl` for stories that require human review.

## Status Rename Examples

```sh
mv docs/issues/epics/0001-v0-1/0003-todo-afk-target-discovery.md \
  docs/issues/epics/0001-v0-1/0003-doing-afk-target-discovery.md
```

```sh
mv docs/issues/epics/0001-v0-1/0003-doing-afk-target-discovery.md \
  docs/issues/epics/0001-v0-1/0003-done-afk-target-discovery.md
```
