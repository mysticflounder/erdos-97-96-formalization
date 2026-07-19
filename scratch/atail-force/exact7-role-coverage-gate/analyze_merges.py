#!/usr/bin/env python3
"""Analyze the merge-layer census ledger.

Outputs, per merge kind: verdict counts; for dead schemas the locality
audit (does the minimized core mention any fresh point other than the
fused one?) — required for the containment argument that multi-merge
patterns containing a dead pair type inherit its core verbatim; and for
SAT p0-p1 schemas the surviving sub-catalog.
"""

from __future__ import annotations

import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
NAMED = {"EA", "W", "O", "s0", "b0", "s1", "b1", "s2"}


def kind_of(schema_id: str) -> str:
    tag = schema_id.split(".m", 1)[1]
    if "+" in tag:
        return "p0-p1-double"
    a, b = tag.split("=")
    if a.startswith("e"):
        return f"e-p{b[1]}"
    return f"p{a[1]}-p{b[1]}"


def core_points(core: list[str]) -> set[str]:
    points: set[str] = set()
    for label in core:
        parts = label.split("|")
        family = parts[0]
        if family in ("cls_eq", "cls_ne", "row_eq", "rad_ne", "uniq4", "k4"):
            points.add(parts[1])
            points.update(parts[2].split(","))
        elif family == "kal":
            points.update(parts[1].split(","))
        elif family == "pos":
            points.update(parts[2].split(","))
    return points


def main() -> None:
    ledger_glob = sys.argv[1] if len(sys.argv) > 1 else "merge_ledger_shard*.jsonl"
    rows = []
    for path in sorted(HERE.glob(ledger_glob)):
        for line in path.read_text().splitlines():
            if line.strip():
                rows.append(json.loads(line))

    by_kind_verdict: Counter[tuple[str, str]] = Counter()
    nonlocal_cores = []
    families_by_kind: dict[str, Counter[str]] = defaultdict(Counter)
    sat_p0p1 = []

    for row in rows:
        schema_id = row["schema_id"]
        kind = kind_of(schema_id)
        verdict = row["verdict"]
        by_kind_verdict[(kind, verdict)] += 1
        if verdict == "unsat":
            fused = {p for p in core_points(row["core"]) if p not in NAMED}
            expected = {p for p in fused if "+" in p}
            stray = fused - expected
            if stray:
                nonlocal_cores.append(
                    {"id": schema_id, "stray": sorted(stray), "core": row["core"]}
                )
            families_by_kind[kind][
                ",".join(f"{k}:{v}" for k, v in sorted(row["families"].items()))
            ] += 1
        elif verdict == "sat" and kind in ("p0-p1", "p0-p1-double"):
            sat_p0p1.append(schema_id)
        elif verdict not in ("sat", "unsat"):
            nonlocal_cores.append({"id": schema_id, "stray": ["<" + verdict + ">"]})

    print("== verdicts by kind ==")
    kinds = sorted({k for k, _ in by_kind_verdict})
    for kind in kinds:
        sat = by_kind_verdict[(kind, "sat")]
        unsat = by_kind_verdict[(kind, "unsat")]
        other = sum(
            v
            for (k, verdict), v in by_kind_verdict.items()
            if k == kind and verdict not in ("sat", "unsat")
        )
        print(f"  {kind:14s} sat={sat:5d} unsat={unsat:5d} other={other}")

    print(f"== locality audit: {len(nonlocal_cores)} non-local/odd cores ==")
    for entry in nonlocal_cores[:20]:
        print("  ", json.dumps(entry))

    print("== core family shapes by kind (top 3) ==")
    for kind in kinds:
        top = families_by_kind[kind].most_common(3)
        print(f"  {kind:14s} {top}")

    print(f"== SAT p0-p1 schemas: {len(sat_p0p1)} ==")
    site_pattern: Counter[str] = Counter()
    for schema_id in sat_p0p1:
        base, tag = schema_id.split(".m", 1)
        parts = base.split(".")
        site_pattern[".".join(parts[2:5])] += 1
    for pattern, count in sorted(site_pattern.items(), key=lambda kv: -kv[1])[:15]:
        print(f"  {pattern}  x{count}")

    summary = {
        "total": len(rows),
        "by_kind": {
            kind: {
                "sat": by_kind_verdict[(kind, "sat")],
                "unsat": by_kind_verdict[(kind, "unsat")],
            }
            for kind in kinds
        },
        "nonlocal_cores": nonlocal_cores,
        "sat_p0p1": sat_p0p1,
    }
    (HERE / "merge_census_summary.json").write_text(json.dumps(summary, indent=1))
    print(f"output={HERE / 'merge_census_summary.json'}")


if __name__ == "__main__":
    main()
