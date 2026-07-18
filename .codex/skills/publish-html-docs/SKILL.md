---
name: publish-html-docs
description: Publish, update, remove, list, retrieve, or search public self-contained HTML plans and reports on the personal Oracle HTML Docs service. Use when Codex creates a polished standalone HTML artifact that should be publicly shareable, when a user asks to publish or host an HTML document, or when an agent needs to find or retrieve a previously published HTML document.
---

# Publish HTML Docs

Use `scripts/html-docs` for every service operation. All documents are intentionally public.

## Safety gate

Before publishing or updating, inspect the source for secrets, credentials, private customer data, non-public personal data, or internal-only URLs. Do not publish when any are present; remove or redact them first. Tell the user that the resulting URL is public.

Publish only self-contained HTML. Inline CSS and JavaScript. Inline small images or use durable public asset URLs. Avoid local file paths, build-tool dependencies, and authenticated assets.

## Publish

Validate the source exists and is an HTML document, then run:

```bash
scripts/html-docs publish /absolute/path/report.html optional-slug
```

Omit the slug to derive it from the file name. Use a short descriptive slug when the name is generic. The JSON result contains the canonical public URL. Open or fetch that URL after publishing and verify a distinctive title or sentence before reporting success.

`publish` creates a new document or replaces the document at the same slug. To require that the slug already exists, run:

```bash
scripts/html-docs update /absolute/path/report.html existing-slug
```

## Find and retrieve

List metadata and URLs:

```bash
scripts/html-docs list
scripts/html-docs list --json
```

Search slugs, titles, and visible document text:

```bash
scripts/html-docs search "query"
scripts/html-docs search "query" --json
```

Retrieve to stdout or a local file:

```bash
scripts/html-docs get slug
scripts/html-docs get slug /absolute/path/output.html
```

Print a shareable URL without fetching:

```bash
scripts/html-docs url slug
```

Prefer `list --json` and `search ... --json` when consuming results programmatically.

## Remove

Removal is permanent. Confirm the requested slug by listing or searching first, then run:

```bash
scripts/html-docs remove slug
```

Fetch the former URL and expect HTTP 404 before reporting completion.

## Configuration

The script defaults to the configured Oracle host and SSH identity. Override only when the environment changes:

- `HTML_DOCS_SSH_HOST`
- `HTML_DOCS_SSH_KEY`
- `HTML_DOCS_PUBLIC_URL`
- `HTML_DOCS_REMOTE_COMMAND`

