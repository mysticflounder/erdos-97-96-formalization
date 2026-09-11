#!/usr/bin/env python3
"""Reject Lean doc comments in positions the parser cannot accept.

Two bulk docstring-coverage passes landed without a build and broke
`lake build` with `unexpected token '/--'`.  Both defects are cheap to find
statically, and neither has any legitimate form:

``adjacent-docstring``
    A doc comment immediately follows another doc comment.  The bulk pass
    added a generic one-liner above a declaration that already carried a
    hand-written docstring.  Lean accepts exactly one doc comment per
    declaration, so this is always a parse error.

``docstring-after-attribute``
    A doc comment sits between an attribute line such as ``@[simp]`` and the
    declaration it annotates.  The doc comment has to come first.

Comment blocks nest in Lean and may contain either pattern as ordinary prose,
so the scan tokenizes block comments and string literals rather than matching
lines directly.  Only doc comments that really are doc comments are reported.

Usage::

    uv run python scripts/check_lean_docstring_placement.py [ROOT ...]
    uv run python scripts/check_lean_docstring_placement.py --json

Exit status is 0 when no site is found and 1 when any site is found, so the
script is usable directly as a gate.  Exit status 2 marks a usage error.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections.abc import Iterator, Sequence
from dataclasses import dataclass
from itertools import pairwise
from pathlib import Path

DEFAULT_ROOTS = ("lean",)
SKIP_DIR_NAMES = (".lake", ".git")

ADJACENT = "adjacent-docstring"
AFTER_ATTRIBUTE = "docstring-after-attribute"


@dataclass(frozen=True)
class CommentBlock:
    """One `/- ... -/` block, with the line span it covers (1-indexed)."""

    start_line: int
    end_line: int
    is_doc: bool


@dataclass(frozen=True)
class Finding:
    path: str
    line: int
    kind: str
    detail: str

    def as_text(self) -> str:
        return f"{self.path}:{self.line}: {self.kind}: {self.detail}"

    def as_dict(self) -> dict[str, object]:
        return {
            "path": self.path,
            "line": self.line,
            "kind": self.kind,
            "detail": self.detail,
        }


def _skip_string_literal(text: str, index: int) -> int:
    """Return the index just past the string literal opening at `index`."""
    i = index + 1
    n = len(text)
    while i < n:
        if text[i] == "\\":
            i += 2
            continue
        if text[i] == '"':
            return i + 1
        i += 1
    return n


def scan_comment_blocks(text: str) -> list[CommentBlock]:
    """Return every top-level block comment, with nesting handled.

    Lean block comments nest, so the end of an outer block is the `-/` that
    brings the depth back to zero.  Character comment openers inside string
    literals and line comments do not open a block.
    """
    blocks: list[CommentBlock] = []
    line_starts = _line_start_offsets(text)
    i = 0
    n = len(text)
    while i < n:
        char = text[i]
        if char == '"':
            i = _skip_string_literal(text, i)
            continue
        if text.startswith("--", i):
            newline = text.find("\n", i)
            i = n if newline == -1 else newline + 1
            continue
        if text.startswith("/-", i):
            start = i
            is_doc = text.startswith("/--", i) and not text.startswith("/---", i)
            depth = 0
            while i < n:
                if text.startswith("/-", i):
                    depth += 1
                    i += 2
                    continue
                if text.startswith("-/", i):
                    depth -= 1
                    i += 2
                    if depth == 0:
                        break
                    continue
                i += 1
            blocks.append(
                CommentBlock(
                    start_line=_line_of(line_starts, start),
                    end_line=_line_of(line_starts, min(i, n) - 1),
                    is_doc=is_doc,
                )
            )
            continue
        i += 1
    return blocks


def _line_start_offsets(text: str) -> list[int]:
    offsets = [0]
    for index, char in enumerate(text):
        if char == "\n":
            offsets.append(index + 1)
    return offsets


def _line_of(line_starts: Sequence[int], offset: int) -> int:
    """1-indexed line number for a character offset, by binary search."""
    low, high = 0, len(line_starts) - 1
    while low < high:
        mid = (low + high + 1) // 2
        if line_starts[mid] <= offset:
            low = mid
        else:
            high = mid - 1
    return low + 1


def check_text(text: str, path: str) -> list[Finding]:
    """Return every placement finding for one Lean source text."""
    lines = text.splitlines()
    blocks = scan_comment_blocks(text)
    findings: list[Finding] = []

    docs = [block for block in blocks if block.is_doc]
    for previous, current in pairwise(docs):
        if _only_blank_between(lines, previous.end_line, current.start_line):
            findings.append(
                Finding(
                    path=path,
                    line=current.start_line,
                    kind=ADJACENT,
                    detail=(
                        "doc comment follows the doc comment ending on line "
                        f"{previous.end_line}; a declaration takes only one"
                    ),
                )
            )

    for block in docs:
        before = block.start_line - 1
        if before < 1:
            continue
        stripped = lines[before - 1].strip()
        if stripped.startswith("@[") and stripped.endswith("]"):
            findings.append(
                Finding(
                    path=path,
                    line=block.start_line,
                    kind=AFTER_ATTRIBUTE,
                    detail=(
                        f"doc comment follows the attribute `{stripped}` on line "
                        f"{before}; it must come before the attribute"
                    ),
                )
            )

    findings.sort(key=lambda finding: (finding.line, finding.kind))
    return findings


def _only_blank_between(lines: Sequence[str], end_line: int, start_line: int) -> bool:
    """True when nothing but blank lines separates the two line numbers."""
    if start_line <= end_line:
        return False
    for line_no in range(end_line + 1, start_line):
        if lines[line_no - 1].strip():
            return False
    return True


def iter_lean_files(roots: Sequence[Path]) -> Iterator[Path]:
    for root in roots:
        if root.is_file():
            yield root
            continue
        for path in sorted(root.rglob("*.lean")):
            if any(part in SKIP_DIR_NAMES for part in path.parts):
                continue
            yield path


def check_paths(roots: Sequence[Path], repo_root: Path) -> list[Finding]:
    findings: list[Finding] = []
    for path in iter_lean_files(roots):
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as error:
            print(f"{path}: unreadable ({error})", file=sys.stderr)
            continue
        try:
            display = str(path.relative_to(repo_root))
        except ValueError:
            display = str(path)
        findings.extend(check_text(text, display))
    return findings


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Reject Lean doc comments the parser cannot accept.",
    )
    parser.add_argument(
        "roots",
        nargs="*",
        default=list(DEFAULT_ROOTS),
        help="files or directories to scan (default: lean)",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        dest="as_json",
        help="emit a machine-readable report instead of one line per finding",
    )
    args = parser.parse_args(argv)

    repo_root = Path(__file__).resolve().parent.parent
    roots = [Path(root) for root in args.roots]
    missing = [root for root in roots if not root.exists()]
    if missing:
        for root in missing:
            print(f"no such path: {root}", file=sys.stderr)
        return 2

    findings = check_paths(roots, repo_root)

    if args.as_json:
        report = {
            "schema": "lean-docstring-placement/v1",
            "roots": [str(root) for root in roots],
            "finding_count": len(findings),
            "findings": [finding.as_dict() for finding in findings],
        }
        print(json.dumps(report, indent=2, sort_keys=True))
    else:
        for finding in findings:
            print(finding.as_text())
        if findings:
            kinds = sorted({finding.kind for finding in findings})
            print(
                f"\n{len(findings)} misplaced doc comment(s): {', '.join(kinds)}",
                file=sys.stderr,
            )
        else:
            print("no misplaced doc comments")

    return 1 if findings else 0


if __name__ == "__main__":
    raise SystemExit(main())
