#!/usr/bin/env python3
"""Find the next undone local Markdown issue.

Expected layout:
  docs/issues/epics/<epic-slug>/0000-epic.md
  docs/issues/epics/<epic-slug>/NNNN-status-type-slug.md
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


ISSUE_RE = re.compile(
    r"^(?P<number>\d{4})-(?P<status>todo|doing|done|blocked)-(?P<type>afk|hitl)-(?P<slug>.+)\.md$"
)


def main() -> int:
    root = Path.cwd()
    epics_dir = root / "docs" / "issues" / "epics"

    if not epics_dir.exists():
        print(f"No local issue epic directory found: {epics_dir}", file=sys.stderr)
        return 1

    for epic_dir in sorted(path for path in epics_dir.iterdir() if path.is_dir()):
        epic_file = epic_dir / "0000-epic.md"
        if not epic_file.exists():
            continue

        issues = []
        for issue_file in sorted(epic_dir.glob("*.md")):
            if issue_file.name == "0000-epic.md":
                continue

            match = ISSUE_RE.match(issue_file.name)
            if not match:
                continue

            issues.append((issue_file, match.groupdict()))

        for issue_file, parts in issues:
            if parts["status"] == "done":
                continue

            print(
                json.dumps(
                    {
                        "epic": str(epic_file),
                        "issue": str(issue_file),
                        "number": parts["number"],
                        "status": parts["status"],
                        "type": parts["type"],
                        "slug": parts["slug"],
                    },
                    indent=2,
                )
            )
            return 0

    print("No undone local issues found.", file=sys.stderr)
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
