#!/usr/bin/env python3
"""Classify the tiny LRAT cores of Phase-3 terminal leaves.

This is an audit/materialization helper, not part of the trusted proof.
For every nonempty terminal.drat under the Phase-3 scratch lane, it:

* verifies and trims the proof with drat-trim;
* extracts the final empty-clause RUP hint list;
* resolves those clause identifiers against terminal.cnf; and
* classifies each hint as hard, prefix, or learned.

The JSON output is designed to become the input manifest for a later
kernel-checked Lean materializer.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def dimacs(path: Path) -> tuple[int, list[list[int]]]:
    variables: int | None = None
    clauses: list[list[int]] = []
    for raw in path.read_text().splitlines():
        line = raw.strip()
        if not line or line.startswith("c"):
            continue
        if line.startswith("p "):
            _, kind, nvars, nclauses = line.split()
            if kind != "cnf":
                raise ValueError(f"{path}: expected CNF header")
            variables = int(nvars)
            declared = int(nclauses)
            continue
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise ValueError(f"{path}: unterminated clause {line!r}")
        clauses.append(values[:-1])
    if variables is None:
        raise ValueError(f"{path}: missing CNF header")
    if declared != len(clauses):
        raise ValueError(
            f"{path}: declared {declared} clauses, parsed {len(clauses)}"
        )
    return variables, clauses


def final_rup_addition(lrat: Path) -> tuple[int, list[int]]:
    additions: list[tuple[int, list[int]]] = []
    for raw in lrat.read_text().splitlines():
        fields = raw.split()
        if not fields or len(fields) > 1 and fields[1] == "d":
            continue
        clause_id = int(fields[0])
        first_zero = fields.index("0", 1)
        clause = [int(value) for value in fields[1:first_zero]]
        hints = [int(value) for value in fields[first_zero + 1 : -1]]
        if clause == []:
            additions.append((clause_id, hints))
    if len(additions) != 1:
        raise ValueError(f"{lrat}: expected one empty addition, got {additions!r}")
    return additions[0]


def classify_one(drat: Path, lrat_root: Path) -> dict[str, Any]:
    leaf = drat.parent
    terminal = leaf / "terminal.cnf"
    base = leaf / "base.cnf"
    if not terminal.is_file() or not base.is_file():
        raise ValueError(f"{leaf}: terminal/base CNF missing")

    rel = Path(*leaf.parts[-3:])
    lrat = lrat_root / rel.with_suffix(".lrat")
    lrat.parent.mkdir(parents=True, exist_ok=True)
    checked = subprocess.run(
        ["drat-trim", str(terminal), str(drat), "-L", str(lrat)],
        capture_output=True,
        text=True,
        check=False,
    )
    verified = checked.returncode == 0 and "s VERIFIED" in checked.stdout
    if not verified:
        raise RuntimeError(
            f"{leaf}: drat-trim failed ({checked.returncode})\n"
            f"{checked.stdout[-1000:]}\n{checked.stderr[-1000:]}"
        )

    nvars, terminal_clauses = dimacs(terminal)
    base_nvars, base_clauses = dimacs(base)
    if nvars != base_nvars:
        raise ValueError(f"{leaf}: base/terminal variable-count mismatch")

    # The deterministic projected-static-v2 root has exactly 8,624 hard clauses.
    # Any extra clauses in base.cnf are the leaf's prefix units.
    hard_count = 8624
    if len(base_clauses) < hard_count:
        raise ValueError(f"{leaf}: base has fewer than {hard_count} clauses")
    addition_id, hints = final_rup_addition(lrat)

    resolved: list[dict[str, Any]] = []
    for hint in hints:
        if not 1 <= hint <= len(terminal_clauses):
            raise ValueError(f"{leaf}: out-of-range hint {hint}")
        if hint <= hard_count:
            origin = "hard"
        elif hint <= len(base_clauses):
            origin = "prefix"
        else:
            origin = "learned"
        resolved.append(
            {
                "clause_id": hint,
                "clause": terminal_clauses[hint - 1],
                "origin": origin,
            }
        )

    return {
        "leaf": str(leaf),
        "variables": nvars,
        "base_clause_count": len(base_clauses),
        "terminal_clause_count": len(terminal_clauses),
        "prefix_depth": len(base_clauses) - hard_count,
        "learned_clause_count": len(terminal_clauses) - len(base_clauses),
        "terminal_cnf_sha256": sha256(terminal),
        "terminal_drat_sha256": sha256(drat),
        "trimmed_lrat_sha256": sha256(lrat),
        "empty_addition_original_id": addition_id,
        "hints": resolved,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--root",
        type=Path,
        default=Path("scratch/p97-distinct-distance-lane"),
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=Path(
            "scratch/p97-distinct-distance-lane/"
            "terminal-rup-hint-classification-20260730.json"
        ),
    )
    parser.add_argument(
        "--lrat-root",
        type=Path,
        default=Path(
            "scratch/p97-distinct-distance-lane/"
            "terminal-rup-hint-lrats-20260730"
        ),
    )
    args = parser.parse_args()

    drats = sorted(
        path
        for path in args.root.rglob("terminal.drat")
        if path.stat().st_size > 0
        and "phase3_projected_static_v2" in str(path)
    )
    records = [classify_one(path, args.lrat_root) for path in drats]
    histogram: dict[str, int] = {}
    for record in records:
        signature = "+".join(sorted(hint["origin"] for hint in record["hints"]))
        histogram[signature] = histogram.get(signature, 0) + 1

    payload = {
        "schema": "p97-phase3-terminal-rup-hint-classification-v1",
        "hard_clause_count": 8624,
        "record_count": len(records),
        "hint_origin_histogram": histogram,
        "records": records,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(args.out)
    print(f"records={len(records)}")
    print(f"hint_origin_histogram={json.dumps(histogram, sort_keys=True)}")


if __name__ == "__main__":
    main()
