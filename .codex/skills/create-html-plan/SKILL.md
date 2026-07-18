---
name: create-html-plan
description: Create polished, self-contained HTML implementation plans, project plans, technical plans, roadmaps, migration plans, and execution briefs. Use when Codex needs to turn requirements, repository findings, a discussion, a specification, or a rough outline into a readable `.html` plan that can be reviewed or shared.
---

# Create HTML Plan

Create one polished HTML document that makes the work easy to understand, evaluate, and execute. Treat the plan as a decision-support artifact, not a decorated transcript.

## Build the plan

1. Gather the source material. Inspect relevant repository files and existing project conventions when the request depends on them. Separate confirmed facts from assumptions and unresolved questions.
2. Choose a structure that fits the work. Include only useful sections, typically:
   - Executive summary and desired outcome
   - Current state or problem
   - Goals, non-goals, and constraints
   - Proposed approach and important decisions
   - Phased implementation or workstreams
   - Dependencies, risks, and mitigations
   - Validation, rollout, and success criteria
   - Open questions or decision log
3. Make the plan actionable. Use concrete owners or responsible roles when known, dependency order, clear deliverables, verification steps, and explicit exit criteria. Link to source files or public references when they materially support the plan.
4. Clearly label assumptions, recommendations, and unresolved decisions. Do not present inferred details as confirmed facts.
5. Write a self-contained `.html` file with inline CSS and, only when useful, small inline JavaScript. Do not require a build step, package install, local asset path, authenticated resource, or external font.

## Design the document

- Use semantic HTML, responsive layout, readable typography, strong contrast, visible keyboard focus, and print-friendly styling.
- Establish a clear visual hierarchy with a compact title block, summary, section navigation for longer plans, and restrained use of cards, tables, timelines, or status badges.
- Prefer prose and short lists for simple material. Use a table, flow, timeline, or dependency diagram only when it makes relationships easier to understand.
- Keep tables usable on narrow screens. Avoid horizontal overflow where practical.
- Use color to reinforce meaning, never as the only carrier of meaning.
- Avoid generic dashboard decoration, excessive gradients, fake metrics, and ornamental charts.
- Add document metadata visible in the page: title, purpose or status, and generated or updated date when relevant.

## Verify the artifact

Before delivery:

1. Open or render the file and inspect the complete page at desktop and narrow widths.
2. Check heading order, navigation anchors, links, overflow, contrast, and print behavior.
3. Confirm the plan preserves the user's requirements and that phases, dependencies, risks, and validation steps do not contradict one another.
4. Remove placeholders, unsupported claims, secrets, credentials, private customer data, non-public personal data, and internal-only URLs.
5. Iterate until the rendered document is readable and complete.

## Publish the plan

Use the installed `$publish-html-docs` skill for all publishing, updating, URL retrieval, and remote verification. Read and follow that skill rather than duplicating its service commands here.

Unless the user explicitly requests a local-only draft, invoke `$publish-html-docs` after local verification. Its public-data safety gate is mandatory: tell the user the resulting URL is public, do not publish sensitive or internal-only material, and verify the live page before reporting success.

Return the local file path and, when published, the verified public URL. Briefly identify any assumptions or open decisions that still need user input.
