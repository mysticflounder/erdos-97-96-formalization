#!/usr/bin/env python3
"""Audit candidate tetrahedron predicates in the exact-12 dichotomy.

This is theorem-mining evidence, not a proof artifact.  Each query retains the
live source-role/deletion ingress and fixes one arm of
``pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit``.  It then
asks separately whether asserting or negating each named incidence is SAT.
The registry covers the checked fixed-pair consumer plus natural three-row
instantiations for each dichotomy arm.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from collections import Counter, defaultdict
from itertools import permutations
from pathlib import Path

import probe
import source_role_deletion_cegar_v5 as v5


HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "dichotomy-tetrahedron-predicate-audit.json"
ARMS = ("common_deletion", "next_row_only_hit")
PREDICATES = (
    "xu_blocker_in_physical_row_after_u_deletion",
    "physical_apex_in_xu_row",
    "deleted_blocker_in_xu_row",
    "physical_apex_in_deleted_row",
    "xu_blocker_in_deleted_row",
    "xu_blocker_in_physical_row_after_xv_deletion",
    "c_blocker_in_xu_row",
    "physical_apex_in_c_row",
    "xu_blocker_in_c_row",
    "c_blocker_in_physical_row_after_xu_deletion",
    "next_blocker_in_c_row",
    "physical_apex_in_next_row",
    "c_blocker_in_next_row",
)


def solve(instance: probe.CoverInstance, timeout: int) -> str:
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
        return "UNKNOWN"
    if completed.returncode == 10:
        return "SAT"
    if completed.returncode == 20:
        return "UNSAT"
    return "UNKNOWN"


def build_branch(
    deleted: int,
    v: int,
    source_role: str,
    deletion_role: str,
    arm: str,
):
    _model, instance, blockers, metadata = v5.build_case(deleted, v)
    instance.metadata = metadata
    v5.add_branch_constraints(
        instance,
        blockers,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    constrain_actual_row_contains(
        instance,
        blockers,
        row_source=probe.C,
        point=probe.XU,
        truth=arm == "next_row_only_hit",
    )
    return instance, blockers


def constrain_actual_row_contains(
    instance,
    blockers,
    *,
    row_source: int,
    point: int,
    truth: bool,
) -> None:
    """Constrain the selected row at ``blocker(row_source)``."""

    for center in range(probe.CARDINALITY):
        blocker = blockers.get((row_source, center))
        if blocker is None:
            continue
        for index, candidate in enumerate(instance.candidates[center]):
            if (point in candidate) != truth:
                instance.cnf.add_clause(
                    (-blocker, -instance.choice_variables[(center, index)])
                )


def constrain_actual_center_in_set(
    instance,
    blockers,
    *,
    source: int,
    allowed: set[int],
    truth: bool,
) -> None:
    centers = allowed if truth else set(range(probe.CARDINALITY)) - allowed
    clause = [
        blockers[(source, center)]
        for center in sorted(centers)
        if (source, center) in blockers
    ]
    instance.cnf.add_clause(clause)


def constrain_actual_center_in_actual_row(
    instance,
    blockers,
    *,
    point_source: int,
    row_source: int,
    truth: bool,
) -> None:
    """Constrain ``blocker(point_source)`` membership in ``row(row_source)``."""

    for row_center in range(probe.CARDINALITY):
        row_blocker = blockers.get((row_source, row_center))
        if row_blocker is None:
            continue
        for point_center in range(probe.CARDINALITY):
            point_blocker = blockers.get((point_source, point_center))
            if point_blocker is None:
                continue
            for index, candidate in enumerate(instance.candidates[row_center]):
                if (point_center in candidate) != truth:
                    instance.cnf.add_clause(
                        (
                            -row_blocker,
                            -point_blocker,
                            -instance.choice_variables[(row_center, index)],
                        )
                    )


def constrain_next_center_in_c_row(
    instance,
    blockers,
    *,
    truth: bool,
) -> None:
    """Constrain ``blocker(blocker(c))`` membership in the row at blocker(c)."""

    for c_blocker in range(probe.CARDINALITY):
        first = blockers.get((probe.C, c_blocker))
        if first is None:
            continue
        for next_center in range(probe.CARDINALITY):
            second = blockers.get((c_blocker, next_center))
            if second is None:
                continue
            for index, candidate in enumerate(instance.candidates[c_blocker]):
                if (next_center in candidate) != truth:
                    instance.cnf.add_clause(
                        (
                            -first,
                            -second,
                            -instance.choice_variables[(c_blocker, index)],
                        )
                    )


def constrain_point_in_next_row(
    instance,
    blockers,
    *,
    point: int,
    truth: bool,
) -> None:
    """Constrain a fixed point in the row at ``blocker(blocker(c))``."""

    for c_blocker in range(probe.CARDINALITY):
        first = blockers.get((probe.C, c_blocker))
        if first is None:
            continue
        for next_center in range(probe.CARDINALITY):
            second = blockers.get((c_blocker, next_center))
            if second is None:
                continue
            for index, candidate in enumerate(instance.candidates[next_center]):
                if (point in candidate) != truth:
                    instance.cnf.add_clause(
                        (
                            -first,
                            -second,
                            -instance.choice_variables[(next_center, index)],
                        )
                    )


def constrain_c_blocker_in_next_row(
    instance,
    blockers,
    *,
    truth: bool,
) -> None:
    """Constrain ``blocker(c)`` in the row at ``blocker(blocker(c))``."""

    for c_blocker in range(probe.CARDINALITY):
        first = blockers.get((probe.C, c_blocker))
        if first is None:
            continue
        for next_center in range(probe.CARDINALITY):
            second = blockers.get((c_blocker, next_center))
            if second is None:
                continue
            for index, candidate in enumerate(instance.candidates[next_center]):
                if (c_blocker in candidate) != truth:
                    instance.cnf.add_clause(
                        (
                            -first,
                            -second,
                            -instance.choice_variables[(next_center, index)],
                        )
                    )


def add_predicate(
    instance,
    blockers,
    *,
    name: str,
    deleted: int,
    v: int,
    truth: bool,
) -> None:
    physical_after_u_deletion = {probe.XU, deleted, v, probe.XV}
    if name == "xu_blocker_in_physical_row_after_u_deletion":
        constrain_actual_center_in_set(
            instance,
            blockers,
            source=probe.XU,
            allowed=physical_after_u_deletion,
            truth=truth,
        )
    elif name == "physical_apex_in_xu_row":
        constrain_actual_row_contains(
            instance,
            blockers,
            row_source=probe.XU,
            point=probe.PHYSICAL_APEX,
            truth=truth,
        )
    elif name == "deleted_blocker_in_xu_row":
        constrain_actual_center_in_actual_row(
            instance,
            blockers,
            point_source=deleted,
            row_source=probe.XU,
            truth=truth,
        )
    elif name == "physical_apex_in_deleted_row":
        constrain_actual_row_contains(
            instance,
            blockers,
            row_source=deleted,
            point=probe.PHYSICAL_APEX,
            truth=truth,
        )
    elif name == "xu_blocker_in_deleted_row":
        constrain_actual_center_in_actual_row(
            instance,
            blockers,
            point_source=probe.XU,
            row_source=deleted,
            truth=truth,
        )
    elif name == "xu_blocker_in_physical_row_after_xv_deletion":
        constrain_actual_center_in_set(
            instance,
            blockers,
            source=probe.XU,
            allowed={probe.U, probe.XU, deleted, v},
            truth=truth,
        )
    elif name == "c_blocker_in_xu_row":
        constrain_actual_center_in_actual_row(
            instance,
            blockers,
            point_source=probe.C,
            row_source=probe.XU,
            truth=truth,
        )
    elif name == "physical_apex_in_c_row":
        constrain_actual_row_contains(
            instance,
            blockers,
            row_source=probe.C,
            point=probe.PHYSICAL_APEX,
            truth=truth,
        )
    elif name == "xu_blocker_in_c_row":
        constrain_actual_center_in_actual_row(
            instance,
            blockers,
            point_source=probe.XU,
            row_source=probe.C,
            truth=truth,
        )
    elif name == "c_blocker_in_physical_row_after_xu_deletion":
        constrain_actual_center_in_set(
            instance,
            blockers,
            source=probe.C,
            allowed={probe.U, deleted, v, probe.XV},
            truth=truth,
        )
    elif name == "next_blocker_in_c_row":
        constrain_next_center_in_c_row(instance, blockers, truth=truth)
    elif name == "physical_apex_in_next_row":
        constrain_point_in_next_row(
            instance,
            blockers,
            point=probe.PHYSICAL_APEX,
            truth=truth,
        )
    elif name == "c_blocker_in_next_row":
        constrain_c_blocker_in_next_row(instance, blockers, truth=truth)
    else:
        raise ValueError(f"unknown predicate: {name}")


def query(
    deleted: int,
    v: int,
    source_role: str,
    deletion_role: str,
    arm: str,
    timeout: int,
    predicate: str | None = None,
    truth: bool = True,
) -> str:
    instance, blockers = build_branch(
        deleted, v, source_role, deletion_role, arm
    )
    if predicate is not None:
        add_predicate(
            instance,
            blockers,
            name=predicate,
            deleted=deleted,
            v=v,
            truth=truth,
        )
    return solve(instance, timeout)


def self_test(timeout: int) -> dict[str, str]:
    # A non-collision branch is known SAT in the placement-complete v3 audit.
    known_sat = query(0, 2, "u", "q", "common_deletion", timeout)
    # Here source=xu and the erased q is the exact physical successor in its
    # selected row, so the live survival ingress is contradictory.
    known_collision = query(10, 0, "xu", "q", "common_deletion", timeout)
    if known_sat != "SAT" or known_collision != "UNSAT":
        raise RuntimeError(
            f"contract self-test failed: SAT={known_sat}, collision={known_collision}"
        )
    return {"known_sat": known_sat, "known_direct_collision": known_collision}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=20)
    parser.add_argument("--max-placements", type=int)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--self-test-only", action="store_true")
    parser.add_argument("--arm", choices=ARMS)
    args = parser.parse_args()

    contract = self_test(args.timeout)
    if args.self_test_only:
        print(json.dumps(contract, sort_keys=True))
        return 0

    placements = list(permutations(probe.OUTSIDE_O2_INTERIOR, 2))
    if args.max_placements is not None:
        placements = placements[: args.max_placements]

    rows = []
    aggregate = defaultdict(Counter)
    for deleted, v in placements:
        for source_role in v5.SOURCE_ROLE_LABELS:
            for deletion_role in v5.DELETION_ROLE_LABELS:
                for arm in ((args.arm,) if args.arm else ARMS):
                    base_status = query(
                        deleted,
                        v,
                        source_role,
                        deletion_role,
                        arm,
                        args.timeout,
                    )
                    row = {
                        "deleted": deleted,
                        "v": v,
                        "source_role": source_role,
                        "deletion_role": deletion_role,
                        "arm": arm,
                        "base_status": base_status,
                        "predicate_status": {},
                    }
                    aggregate[(arm, "base")][base_status] += 1
                    if base_status == "SAT":
                        for predicate in PREDICATES:
                            statuses = {}
                            for truth in (True, False):
                                status = query(
                                    deleted,
                                    v,
                                    source_role,
                                    deletion_role,
                                    arm,
                                    args.timeout,
                                    predicate=predicate,
                                    truth=truth,
                                )
                                polarity = "positive" if truth else "negative"
                                statuses[polarity] = status
                                aggregate[(arm, f"{predicate}:{polarity}")][status] += 1
                            row["predicate_status"][predicate] = statuses
                    rows.append(row)

    result = {
        "schema": "p97_pentagon_exact12_dichotomy_tetrahedron_predicate_audit.v1",
        "scope": (
            "finite necessary-condition theorem mining only; no Euclidean "
            "realizability, certificate replay, or Lean closure"
        ),
        "target_theorem": v5.TARGET_THEOREM,
        "checked_consumer": (
            "Problem97.ATailFrontierLiveClosure."
            "pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_"
            "false_of_tetrahedron_incidences"
        ),
        "contract_self_test": contract,
        "placements": len(placements),
        "queries": sum(
            1 + 2 * len(row["predicate_status"]) for row in rows
        ),
        "aggregate": {
            f"{arm}:{predicate}": dict(sorted(counts.items()))
            for (arm, predicate), counts in sorted(aggregate.items())
        },
        "rows": rows,
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "placements": result["placements"],
                "queries": result["queries"],
                "aggregate": result["aggregate"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
