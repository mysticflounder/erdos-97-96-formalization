#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Reproducible, source-only census of native_decide in tracked Lean files.

The primary first-party scope is every tracked Lean file under ``lean/``;
``lean/scratch/``, repository ``scratch/``, ``attic/``, and other tracked roots
remain separately labeled.  Declaration names are read from proof-blueprint's
existing line-span index only after its stored file hash matches the bytes on
disk; this script never parses theorem declarations from source text.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sqlite3
import subprocess
from collections import Counter, defaultdict
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path


TOKEN = "native_decide"
IDENT_CHARS = frozenset("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'")
LITERAL_BOUNDARIES = {"string": re.compile(r'["\\\n]'), "char": re.compile(r"['\\\n]")}
NORMAL_BOUNDARIES = re.compile(r'''--|/-|"|'|native_decide|\n''')


@dataclass(frozen=True)
class Occurrence:
    line: int
    column: int


def tracked_lean_files(repo: Path) -> list[str]:
    result = subprocess.run(
        ["git", "ls-files", "--full-name", "--", ":(top)**.lean"],
        cwd=repo,
        check=True,
        capture_output=True,
        text=True,
    )
    return [line for line in result.stdout.splitlines() if line]


def source_scope(path: str) -> str:
    if path.startswith("lean/scratch/"):
        return "lean-scratch"
    if path.startswith("lean/"):
        return "lean-first-party"
    if path.startswith("attic/"):
        return "attic-archive"
    if path.startswith("scratch/"):
        return "scratch"
    if path.startswith("prove2me/"):
        return "prove2me"
    return "other-tracked"


def scan_tokens(data: bytes) -> list[Occurrence]:
    """Find identifier tokens while skipping Lean comments and literals."""
    if TOKEN.encode() not in data:
        return []
    text = data.decode("utf-8", errors="replace")
    out: list[Occurrence] = []
    i = 0
    line = 1
    column = 1
    state = "normal"
    block_depth = 0
    while i < len(text):
        if state == "normal":
            boundary = NORMAL_BOUNDARIES.search(text, i)
            if boundary is None:
                break
            column += boundary.start() - i
            i = boundary.start()
        ch = text[i]
        nxt = text[i + 1] if i + 1 < len(text) else ""
        if state == "line":
            if ch == "\n":
                state = "normal"
                line += 1
                column = 1
            else:
                column += 1
            i += 1
            continue
        if state == "block":
            if ch == "/" and nxt == "-":
                block_depth += 1
                i += 2
                column += 2
            elif ch == "-" and nxt == "/":
                block_depth -= 1
                i += 2
                column += 2
                if block_depth == 0:
                    state = "normal"
            elif ch == "\n":
                line += 1
                column = 1
                i += 1
            else:
                column += 1
                i += 1
            continue
        if state in {"string", "char"}:
            # Certificate payloads can contain megabytes of encoded text. Skip
            # literal content in bulk while retaining escape and line handling.
            boundary = LITERAL_BOUNDARIES[state].search(text, i)
            if boundary is None:
                break
            column += boundary.start() - i
            i = boundary.start()
            ch = text[i]
            closing = '"' if state == "string" else "'"
            if ch == "\\":
                step = 2 if i + 1 < len(text) else 1
                i += step
                column += step
            elif ch == closing:
                state = "normal"
                i += 1
                column += 1
            elif ch == "\n":
                line += 1
                column = 1
                i += 1
            else:
                i += 1
                column += 1
            continue
        if ch == "-" and nxt == "-":
            state = "line"
            i += 2
            column += 2
            continue
        if ch == "/" and nxt == "-":
            state = "block"
            block_depth = 1
            i += 2
            column += 2
            continue
        if ch == '"':
            state = "string"
            i += 1
            column += 1
            continue
        # Apostrophes are valid Lean identifier suffixes (foo').  Enter the
        # character-literal state only for a syntactically bounded 'x'/'\\n'
        # token whose opening quote is at an identifier boundary.
        char_literal = False
        if ch == "'" and (i == 0 or text[i - 1] not in IDENT_CHARS):
            char_literal = i + 2 < len(text) and text[i + 2] == "'"
            char_literal = char_literal or (
                i + 3 < len(text) and text[i + 1] == "\\" and text[i + 3] == "'"
            )
        if char_literal:
            state = "char"
            i += 1
            column += 1
            continue
        if text.startswith(TOKEN, i):
            before = text[i - 1] if i else ""
            after = text[i + len(TOKEN)] if i + len(TOKEN) < len(text) else ""
            if before not in IDENT_CHARS and after not in IDENT_CHARS:
                out.append(Occurrence(line, column))
                i += len(TOKEN)
                column += len(TOKEN)
                continue
        if ch == "\n":
            line += 1
            column = 1
        else:
            column += 1
        i += 1
    return out


def family(path: str) -> str:
    parts = Path(path).parts
    try:
        p97 = parts.index("P97")
    except ValueError:
        return "/".join(parts[:2])
    tail = list(parts[p97 + 1 :])
    if not tail:
        return "P97"
    first = Path(tail[0]).stem
    if first == "ATail" and len(tail) > 1:
        return f"P97/ATail/{Path(tail[1]).stem}"
    if first in {"EndpointCertificate", "SurplusCertificate", "ErasedCertificate", "Census554", "MultiCenter"} and len(tail) > 1:
        return f"P97/{first}/{Path(tail[1]).stem}"
    return f"P97/{first}"


def role_hint(path: str) -> str:
    lower = path.lower()
    if "/generated/" in lower:
        return "generated-certificate-payload"
    if "/scratch/" in lower:
        return "scratch-source"
    if any(word in lower for word in ("certificate", "bank", "census")):
        return "certificate-or-bank"
    if any(word in lower for word in ("finite", "enumerat", "catalog", "mask")):
        return "small-finite-example-or-enumeration"
    return "handwritten-first-party"


def indexed_names(
    db: Path, rows: dict[str, list[Occurrence]], hashes: dict[str, str]
) -> tuple[dict[str, list[str]], set[str]]:
    if not db.exists() or not rows:
        return {}, set()
    uri = f"file:{db.resolve()}?mode=ro"
    conn = sqlite3.connect(uri, uri=True)
    try:
        matched: dict[str, list[tuple[int, int, str, str]]] = defaultdict(list)
        paths = sorted(path for path in rows if path.startswith("lean/"))
        rel_to_path = {path.removeprefix("lean/"): path for path in paths}
        for start in range(0, len(paths), 400):
            chunk = paths[start : start + 400]
            rel_chunk = [path.removeprefix("lean/") for path in chunk]
            marks = ",".join("?" for _ in chunk)
            query = f"""
                SELECT f.rel_path, f.content_hash, s.line,
                       COALESCE(s.end_line, s.line), s.fully_qualified_name, s.kind
                FROM lean_files AS f JOIN lean_symbols AS s ON s.file_id = f.id
                WHERE f.rel_path IN ({marks})
            """
            for rel, stored_hash, line, end_line, name, kind in conn.execute(query, rel_chunk):
                path = rel_to_path.get(rel)
                if path is not None and stored_hash == hashes.get(path):
                    matched[path].append((line, end_line, name, kind))
        out: dict[str, list[str]] = {}
        for path, occurrences in rows.items():
            names: set[str] = set()
            for occurrence in occurrences:
                for start, end, name, kind in matched.get(path, []):
                    if start <= occurrence.line <= end and kind in {"theorem", "lemma"}:
                        names.add(name)
            out[path] = sorted(names)
        return out, set(matched)
    finally:
        conn.close()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--db", type=Path, default=None)
    parser.add_argument("--out", type=Path, default=None)
    parser.add_argument(
        "--scope",
        choices=("lean", "all"),
        default="lean",
        help="scan tracked Lean sources under lean/ (default), or every tracked .lean root",
    )
    args = parser.parse_args()
    repo = args.repo.resolve()
    db = (args.db or repo / "data/proof-blueprint.db").resolve()
    out_path = (args.out or repo / "prove2me/native-bank-inventory.json").resolve()
    tracked = tracked_lean_files(repo)
    candidates = [path for path in tracked if args.scope == "all" or path.startswith("lean/")]
    scanned: list[str] = []
    missing: list[str] = []
    occurrences: dict[str, list[Occurrence]] = {}
    hashes: dict[str, str] = {}
    bytes_by_path: dict[str, int] = {}
    for rel in candidates:
        try:
            data = (repo / rel).read_bytes()
        except FileNotFoundError:
            missing.append(rel)
            continue
        scanned.append(rel)
        # Avoid decoding and lexing the overwhelmingly large no-hit tail.
        if TOKEN.encode("ascii") not in data:
            continue
        found = scan_tokens(data)
        if found:
            occurrences[rel] = found
            hashes[rel] = hashlib.sha256(data).hexdigest()
            bytes_by_path[rel] = len(data)
    names, matched_paths = indexed_names(db, occurrences, hashes)
    families: dict[str, dict[str, object]] = {}
    for path, found in occurrences.items():
        key = family(path)
        item = families.setdefault(key, {"files": 0, "sites": 0, "role_hints": Counter(), "paths": []})
        item["files"] = int(item["files"]) + 1
        item["sites"] = int(item["sites"]) + len(found)
        item["role_hints"][role_hint(path)] += 1
        item["paths"].append(path)
    for item in families.values():
        item["role_hints"] = dict(item["role_hints"])
        item["paths"].sort()
    files = []
    for path in sorted(occurrences):
        files.append({
            "path": path,
            "sha256": hashes[path],
            "bytes": bytes_by_path[path],
            "sites": len(occurrences[path]),
            "lines": [occurrence.line for occurrence in occurrences[path]],
            "family": family(path),
            "role_hint": role_hint(path),
            "source_scope": source_scope(path),
            "indexed_hash_match": path in matched_paths,
            "representative_theorem_names": names.get(path, []),
        })
    result = {
        "schema": "native-bank-inventory/v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "repository_root": str(repo),
        "scope": {
            "tracked_source_command": "git ls-files --full-name -- ':(top)**.lean'",
            "scan_scope": args.scope,
            "primary_first_party": "all scanned tracked paths under lean/, including Generated",
            "secondary_scopes": "when --scope all, tracked .lean under attic/, scratch/, prove2me/, and other roots are separately labeled",
            "excluded": "untracked files and .lake dependencies",
            "source_scan": "Lean comments (including nested block comments), strings, and character literals ignored",
        },
        "counts": {
            "tracked_lean_files": len(tracked),
            "scanned_tracked_lean_files": len(scanned),
            "missing_tracked_lean_files": len(missing),
            "first_party_lean_files": sum(source_scope(path) == "lean-first-party" for path in scanned),
            "native_files": len(occurrences),
            "native_sites": sum(map(len, occurrences.values())),
            "native_files_by_scope": dict(Counter(source_scope(path) for path in occurrences)),
            "native_sites_by_scope": {
                scope: sum(len(found) for path, found in occurrences.items() if source_scope(path) == scope)
                for scope in sorted({source_scope(path) for path in occurrences})
            },
            "tracked_lean_files_by_scope": dict(Counter(source_scope(path) for path in scanned)),
        },
        "index": {
            "path": str(db.relative_to(repo)) if db.is_relative_to(repo) else str(db),
            "names_source": "proof-blueprint lean_symbols line spans only after lean_files.content_hash match",
            "matched_native_files": len(matched_paths),
            "stale_or_absent_native_files": len(occurrences) - len(matched_paths),
        },
        "families": dict(sorted(families.items(), key=lambda item: (-int(item[1]["sites"]), item[0]))),
        "missing_tracked_paths": missing,
        "files": files,
    }
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result["counts"], sort_keys=True))
    print(f"wrote {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
