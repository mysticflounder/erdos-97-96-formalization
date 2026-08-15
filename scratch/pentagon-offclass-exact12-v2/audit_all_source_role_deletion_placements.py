#!/usr/bin/env python3
"""Sweep every exact-12 placement and live source/deletion branch once.

This is a theorem-mining diagnostic.  It checks the full 42 x 3 x 2 finite
branch grid at the current source-role/deletion ingress, but it does not replay
the placement-specific CEGAR journals and is not a proof artifact.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from collections import Counter
from itertools import permutations
from pathlib import Path

import probe
import source_role_deletion_cegar_v5 as v5
import source_sensitive_cegar as source


HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "all-placement-source-role-deletion-audit.json"


def solve(instance: probe.CoverInstance, timeout: int) -> tuple[str, str]:
    dimacs = [f"p cnf {instance.cnf.n_variables} {len(instance.cnf.clauses)}"]
    dimacs.extend(
        " ".join(map(str, clause)) + " 0" for clause in instance.cnf.clauses
    )
    try:
        completed = subprocess.run(
            ["cadical", "-q", "-t", str(timeout)],
            input="\n".join(dimacs) + "\n",
            capture_output=True,
            text=True,
            timeout=timeout + 15,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return "UNKNOWN", ""
    if completed.returncode == 10:
        return "SAT", completed.stdout + completed.stderr
    if completed.returncode == 20:
        return "UNSAT", completed.stdout + completed.stderr
    return "UNKNOWN", completed.stdout + completed.stderr


def sat_features(instance, blocker_variables, output, source_role, deletion_role):
    _assignment, positive = probe.parse_assignment(output, instance.cnf.n_variables)
    cube = instance.decode_model(positive)
    blockers, fibers = source.decode_blockers(blocker_variables, positive)
    predicates = v5.validate_branch_model(
        instance,
        blockers,
        cube,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    xv_row = set(cube[probe.C])
    next_center = blockers[probe.C]
    next_row = set(cube[next_center])
    second_cap = set(
        instance.model.caps[probe.THEOREM_OPP2_FROZEN_INDEX]
    )
    physical_class = set(instance.metadata["physical_class"])
    second_cap_fan = second_cap - xv_row
    physical_class_fan = physical_class - next_row
    crossed_fan_deletions = second_cap_fan & physical_class_fan
    max_fiber_size = max(map(len, fibers.values()))
    return {
        "selected_source_actual_blocker": predicates[
            "selected_source_actual_blocker"
        ],
        "selected_blocker_row": predicates["selected_blocker_row"],
        "xv_row": sorted(xv_row),
        "offclass_blocker_actual_blocker": next_center,
        "next_row": sorted(next_row),
        "second_cap_fan": sorted(second_cap_fan),
        "physical_class_fan": sorted(physical_class_fan),
        "crossed_fan_deletions": sorted(crossed_fan_deletions),
        "max_fiber_size": max_fiber_size,
        "max_fiber_centers": sorted(
            center for center, fiber in fibers.items() if len(fiber) == max_fiber_size
        ),
        "blockers": {str(q): blocker for q, blocker in sorted(blockers.items())},
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=20)
    parser.add_argument("--max-placements", type=int)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    placements = list(permutations(probe.OUTSIDE_O2_INTERIOR, 2))
    if args.max_placements is not None:
        placements = placements[: args.max_placements]

    rows = []
    for deleted, v in placements:
        for source_role in v5.SOURCE_ROLE_LABELS:
            for deletion_role in v5.DELETION_ROLE_LABELS:
                _model, instance, blocker_variables, metadata = v5.build_case(
                    deleted, v
                )
                instance.metadata = metadata
                ingress = v5.add_branch_constraints(
                    instance,
                    blocker_variables,
                    source_role=source_role,
                    deletion_role=deletion_role,
                )
                status, solver_output = solve(instance, args.timeout)
                row = {
                    "deleted": deleted,
                    "v": v,
                    "source_role": source_role,
                    "deletion_role": deletion_role,
                    "status": status,
                    "variables": instance.cnf.n_variables,
                    "clauses": len(instance.cnf.clauses),
                    "branch_added_clauses": ingress["branch"]["added_clauses"],
                }
                if status == "SAT":
                    row["sat_features"] = sat_features(
                        instance,
                        blocker_variables,
                        solver_output,
                        source_role,
                        deletion_role,
                    )
                rows.append(row)

    status_counts = Counter(row["status"] for row in rows)
    for row in rows:
        row["direct_trace_collision"] = row["source_role"] == "xu" and (
            (row["deleted"] == probe.DELETION_ROLE_LABELS["q"]
             and row["deletion_role"] == "q")
            or (row["deleted"] == probe.DELETION_ROLE_LABELS["w"]
                and row["deletion_role"] == "w")
        )
    unexpected_unsat = [
        row for row in rows if row["status"] == "UNSAT" and not row["direct_trace_collision"]
    ]
    expected_collision_sat = [
        row for row in rows if row["status"] == "SAT" and row["direct_trace_collision"]
    ]
    branch_status_counts = {}
    for source_role in v5.SOURCE_ROLE_LABELS:
        for deletion_role in v5.DELETION_ROLE_LABELS:
            key = f"{source_role}-{deletion_role}"
            branch_status_counts[key] = dict(
                sorted(
                    Counter(
                        row["status"]
                        for row in rows
                        if row["source_role"] == source_role
                        and row["deletion_role"] == deletion_role
                    ).items()
                )
            )

    sat_rows = [row for row in rows if row["status"] == "SAT"]
    crossed_fan_counts = Counter(
        len(row["sat_features"]["crossed_fan_deletions"])
        for row in sat_rows
    )

    result = {
        "schema": "p97_pentagon_offclass_exact12_all_placement_source_role_deletion_audit.v3",
        "classification": "empirical theorem-mining diagnostic only",
        "scope": (
            "one base-abstraction SAT query for each tested placement and each "
            "live source/deletion branch; no inherited CEGAR cuts, Euclidean "
            "realizability claim, coverage theorem, or kernel proof"
        ),
        "target_theorem": v5.TARGET_THEOREM,
        "placements_tested": len(placements),
        "placements_total": len(list(permutations(probe.OUTSIDE_O2_INTERIOR, 2))),
        "branches_per_placement": len(v5.SOURCE_ROLE_LABELS)
        * len(v5.DELETION_ROLE_LABELS),
        "queries": len(rows),
        "status_counts": dict(sorted(status_counts.items())),
        "direct_trace_collision_check": {
            "description": (
                "source=xu has jointDeletion.deleted in its exact selected row, "
                "so that row cannot survive deletion when deleted=q and the "
                "chosen deletion is q, or deleted=w and the chosen deletion is w"
            ),
            "unsat_exactly_matches_collision": (
                not unexpected_unsat and not expected_collision_sat
            ),
            "unexpected_unsat_count": len(unexpected_unsat),
            "expected_collision_sat_count": len(expected_collision_sat),
        },
        "branch_status_counts": branch_status_counts,
        "crossed_fan_deletion_counts": {
            str(size): count for size, count in sorted(crossed_fan_counts.items())
        },
        "rows": rows,
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "placements_tested": result["placements_tested"],
                "queries": result["queries"],
                "status_counts": result["status_counts"],
                "direct_trace_collision_check": result[
                    "direct_trace_collision_check"
                ],
                "branch_status_counts": result["branch_status_counts"],
                "crossed_fan_deletion_counts": result[
                    "crossed_fan_deletion_counts"
                ],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 1 if status_counts.get("UNKNOWN", 0) else 0


if __name__ == "__main__":
    raise SystemExit(main())
