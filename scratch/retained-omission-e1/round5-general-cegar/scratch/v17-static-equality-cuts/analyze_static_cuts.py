#!/usr/bin/env python3
"""Audit static length-two equality-closure cuts against the v17 canary trace."""

from __future__ import annotations

import itertools
import json
import sys
import time
from collections import Counter
from pathlib import Path

POINTS = tuple(range(15))
APICES = (12, 13, 14)


def classes_at(center: int, profiles: str, *, exact: bool = False):
    if center not in APICES:
        return [("critical", center, 0)] if exact else [
            ("k4", center, 0), ("critical", center, 0)
        ]
    i = center - 12
    rich = [("rich", center, cls) for cls in range(1 if profiles[i] == "S" else 2)]
    return rich if exact else [("k4", center, 0), *rich]


def member(cls, point: int) -> str:
    kind, center, index = cls
    if kind == "rich":
        return f"rich_{center - 12}_{index}_{point}"
    if kind == "critical":
        return f"critical_row_{center}_{point}"
    return f"{kind}_{center}_{point}"


def triangle_cuts(profiles: str):
    for center in POINTS:
        for target in classes_at(center, profiles, exact=True):
            for inside, outside in itertools.permutations(
                (x for x in POINTS if x != center), 2
            ):
                for left in classes_at(outside, profiles):
                    for right in classes_at(inside, profiles):
                        signed = (
                            (member(target, inside), True),
                            (member(target, outside), False),
                            (member(left, center), True),
                            (member(left, inside), True),
                            (member(right, outside), True),
                            (member(right, center), True),
                        )
                        used = tuple(
                            sorted({c for kind, c, _ in (target, left, right) if kind == "critical"})
                        )
                        yield signed, used


def assignment_map(entry):
    return {str(f["bool"]): bool(f["value"]) for f in entry["assignment"]}


def core_map(entry):
    return {str(f["bool"]): bool(f["value"]) for f in entry["projected_core"]}


def used(assignment, center: int) -> bool:
    return any(assignment.get(f"block_{q}_{center}", False) for q in POINTS)


def matches(cut, assignment) -> bool:
    signed, used_centers = cut
    return all(assignment.get(name) is value for name, value in signed) and all(
        used(assignment, c) for c in used_centers
    )


def specializes_core(cut, core) -> bool:
    signed, used_centers = cut
    if not all(core.get(name) is value for name, value in signed):
        return False
    return all(any(core.get(f"block_{q}_{c}") is True for q in POINTS) for c in used_centers)


def main() -> None:
    trace_path = Path(sys.argv[1])
    trace = json.loads(trace_path.read_text())
    profiles = trace["case_id"].split("_")[1]

    started = time.perf_counter()
    cuts = list(triangle_cuts(profiles))
    elapsed = time.perf_counter() - started
    unique = {(signed, used_centers) for signed, used_centers in cuts}
    lengths = Counter(6 + len(used_centers) for _, used_centers in cuts)

    coverage = []
    for entry in trace["iterations"]:
        assignment = assignment_map(entry)
        core = core_map(entry)
        hits = [cut for cut in cuts if matches(cut, assignment)]
        core_hits = [cut for cut in hits if specializes_core(cut, core)]
        coverage.append(
            {
                "iteration": entry["iteration"],
                "projected_core_size": len(core),
                "matching_static_cuts": len(hits),
                "core_specializations": len(core_hits),
            }
        )

    print(json.dumps({
        "case_id": trace["case_id"],
        "dynamic_blocker_count": trace["blocker_count"],
        "triangle_cut_count": len(cuts),
        "unique_triangle_cut_count": len(unique),
        "generation_seconds": elapsed,
        "clause_length_distribution": dict(sorted(lengths.items())),
        "all_assignments_covered": all(x["matching_static_cuts"] for x in coverage),
        "all_projected_cores_specialized": all(x["core_specializations"] for x in coverage),
        "coverage": coverage,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
