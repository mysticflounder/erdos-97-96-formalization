#!/usr/bin/env python3
"""Fail-closed comparison of a saved SAT assignment with an algebra pattern."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from census.global_confinement import shadow

from card_five_source_indexed_target_probe import FIRST_APEX, signature
from probe_saved_source_indexed_patterns import PATTERNS


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def canonical_row_sha256(rows: dict[int, tuple[int, ...]]) -> str:
    payload = [[center, list(support)] for center, support in sorted(rows.items())]
    return hashlib.sha256(
        json.dumps(payload, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("scan", type=Path)
    parser.add_argument("pattern", choices=sorted(PATTERNS))
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    payload = json.loads(args.scan.read_text(encoding="utf-8"))
    reports = payload.get("reports")
    require(isinstance(reports, list) and len(reports) == 1, "expected one report")
    report = reports[0]
    require(report.get("status") == "SAT", "saved report is not SAT")
    raw_support = report.get("support")
    require(
        isinstance(raw_support, list)
        and len(raw_support) == 5
        and all(isinstance(point, int) for point in raw_support),
        "malformed pinned support",
    )
    raw_rows = report.get("rows")
    require(isinstance(raw_rows, list), "saved rows are missing")

    pseudo = shadow.ClassRow(
        "pinned:first-apex-card-five",
        FIRST_APEX,
        frozenset(raw_support),
        exact=True,
    )
    retained: list[shadow.ClassRow] = []
    global_rows: dict[int, tuple[int, ...]] = {
        FIRST_APEX: tuple(sorted(raw_support))
    }
    shell_rows: list[tuple[int, tuple[int, ...]]] = []
    for raw in raw_rows:
        require(isinstance(raw, dict), "malformed retained row")
        name = raw.get("name")
        center = raw.get("center")
        support = raw.get("support")
        exact = raw.get("exact")
        require(
            isinstance(name, str)
            and isinstance(center, int)
            and isinstance(support, list)
            and all(isinstance(point, int) for point in support)
            and isinstance(exact, bool),
            "malformed retained row fields",
        )
        normalized_support = tuple(sorted(support))
        retained.append(
            shadow.ClassRow(name, center, frozenset(normalized_support), exact=exact)
        )
        if name.startswith("global:"):
            require(center not in global_rows, f"duplicate global center {center}")
            global_rows[center] = normalized_support
        elif name.startswith("shell:"):
            shell_rows.append((center, normalized_support))
        else:
            raise AssertionError(f"unexpected retained row name {name}")

    require(set(global_rows) == set(range(12)), "global/pinned rows are incomplete")
    require(
        all(global_rows.get(center) == support for center, support in shell_rows),
        "a shell row disagrees with its global row",
    )
    expected = {
        center: tuple(sorted(support))
        for center, support in PATTERNS[args.pattern].items()
    }
    require(global_rows == expected, "saved assignment and algebra pattern differ")

    recomputed_signature = signature(pseudo, retained)
    recorded_signature = report.get("assignment_signature_sha256")
    require(
        recomputed_signature == recorded_signature,
        "saved assignment signature does not replay",
    )
    result = {
        "scan": str(args.scan),
        "pattern": args.pattern,
        "assignment_signature_sha256": recomputed_signature,
        "canonical_row_sha256": canonical_row_sha256(global_rows),
        "global_or_pinned_row_count": len(global_rows),
        "shell_duplicate_count": len(shell_rows),
        "exact_encoding_match": True,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
