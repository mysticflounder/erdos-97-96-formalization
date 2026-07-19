#!/usr/bin/env python3
"""Independent encoding audit for the whole-carrier search.

This file does not import or mutate the active drivers.  It reconstructs the
Boolean structural surface by named constraint family, runs single-family
ablations, and smoke-checks that the row-free linear Kalmanson base is SAT.
All verdicts are bounded Z3 theorem-discovery evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SEARCH = HERE / "search.py"
CEGAR = HERE / "cegar.py"
STRUCTURAL_GROUPS = (
    "circle_intersection",
    "pair_bisector",
    "cyclic_alternation",
    "strong_connectivity",
    "two_omission_blockers",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def member_table(n: int) -> dict[tuple[int, int], z3.BoolRef]:
    return {
        (center, point): z3.Bool(f"audit_m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }


def build_structural(
    n: int,
    second_apex: int,
    enabled: frozenset[str],
    timeout_ms: int,
) -> tuple[z3.Solver, dict[tuple[int, int], z3.BoolRef], dict[str, int]]:
    if n < 5:
        raise ValueError("a four-point row needs at least five carrier points")
    if not 0 < second_apex < n:
        raise ValueError("second apex must differ from zero and lie in range")
    unknown = enabled - set(STRUCTURAL_GROUPS)
    if unknown:
        raise ValueError(f"unknown structural groups: {sorted(unknown)}")

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    member = member_table(n)
    counts = {
        "row_shape": 0,
        **{group: 0 for group in STRUCTURAL_GROUPS},
    }
    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.PbEq(
                [(member[center, point], 1) for point in range(n)],
                4,
            )
        )
        counts["row_shape"] += 2

    if "circle_intersection" in enabled:
        for left, right in itertools.combinations(range(n), 2):
            solver.add(
                z3.PbLe(
                    [
                        (z3.And(member[left, p], member[right, p]), 1)
                        for p in range(n)
                    ],
                    2,
                )
            )
            counts["circle_intersection"] += 1

    if "pair_bisector" in enabled:
        for first, second in itertools.combinations(range(n), 2):
            solver.add(
                z3.PbLe(
                    [
                        (
                            z3.And(
                                member[center, first],
                                member[center, second],
                            ),
                            1,
                        )
                        for center in range(n)
                    ],
                    2,
                )
            )
            counts["pair_bisector"] += 1

    if "cyclic_alternation" in enabled:
        for center_left, center_right in itertools.combinations(range(n), 2):
            remaining = tuple(
                point
                for point in range(n)
                if point not in {center_left, center_right}
            )
            for point_left, point_right in itertools.combinations(remaining, 2):
                alternates = (center_left < point_left < center_right) != (
                    center_left < point_right < center_right
                )
                if alternates:
                    continue
                solver.add(
                    z3.Not(
                        z3.And(
                            member[center_left, point_left],
                            member[center_left, point_right],
                            member[center_right, point_left],
                            member[center_right, point_right],
                        )
                    )
                )
                counts["cyclic_alternation"] += 1

    if "strong_connectivity" in enabled:
        vertices = tuple(range(n))
        for size in range(1, n):
            for subset_tuple in itertools.combinations(vertices, size):
                subset = frozenset(subset_tuple)
                complement = tuple(p for p in vertices if p not in subset)
                solver.add(
                    z3.Or(
                        *(
                            member[center, point]
                            for center in subset
                            for point in complement
                        )
                    )
                )
                counts["strong_connectivity"] += 1

    if "two_omission_blockers" in enabled:
        blocker = {
            (source, center): z3.Bool(f"audit_b_{source}_{center}")
            for source in range(n)
            for center in range(n)
        }
        for source in range(n):
            allowed = tuple(
                center
                for center in range(n)
                if center not in {source, 0, second_apex}
            )
            solver.add(
                z3.PbEq([(blocker[source, center], 1) for center in allowed], 1)
            )
            counts["two_omission_blockers"] += 1
            for center in range(n):
                if center not in allowed:
                    solver.add(z3.Not(blocker[source, center]))
                else:
                    solver.add(
                        z3.Implies(
                            blocker[source, center], member[center, source]
                        )
                    )
                counts["two_omission_blockers"] += 1

    return solver, member, counts


def structural_verdict(
    n: int, second_apex: int, enabled: frozenset[str], timeout_ms: int
) -> dict[str, object]:
    solver, _member, counts = build_structural(
        n, second_apex, enabled, timeout_ms
    )
    verdict = solver.check()
    return {
        "status": str(verdict).upper(),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
        "constraint_counts": counts,
    }


def distance_table(n: int) -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (left, right): z3.Real(f"audit_d_{left}_{right}")
        for left in range(n)
        for right in range(left + 1, n)
    }


def dist(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[tuple(sorted((left, right)))]


def metric_base_verdict(n: int, timeout_ms: int) -> dict[str, object]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    table = distance_table(n)
    count = 0
    for variable in table.values():
        solver.add(variable >= 0)
        count += 1
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(diagonals >= dist(table, a, b) + dist(table, c, d) + 1)
        solver.add(diagonals >= dist(table, a, d) + dist(table, b, c) + 1)
        count += 2
    for a, b, c in itertools.combinations(range(n), 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >= dist(table, a, c))
        solver.add(dist(table, a, c) + dist(table, b, c) >= dist(table, a, b))
        solver.add(dist(table, a, b) + dist(table, a, c) >= dist(table, b, c))
        count += 3
    verdict = solver.check()
    return {
        "status": str(verdict).upper(),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
        "constraint_count": count,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--min-n", type=int, default=6)
    parser.add_argument("--max-n", type=int, default=12)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument(
        "--subset-max-n",
        type=int,
        default=7,
        help="enumerate every structural-group subset through this n",
    )
    args = parser.parse_args()
    if not 5 <= args.min_n <= args.max_n:
        raise SystemExit("require 5 <= min-n <= max-n")
    if args.timeout_ms <= 0:
        raise SystemExit("timeout must be positive")

    all_groups = frozenset(STRUCTURAL_GROUPS)
    results: dict[str, object] = {
        "schema": "p97-generic-biapex-kalmanson-encoding-audit-v1",
        "epistemic_status": "BOUNDED_Z3_ENCODING_AUDIT_NOT_LEAN_PROOF",
        "source_sha256": {
            "search.py": sha256(SEARCH),
            "cegar.py": sha256(CEGAR),
        },
        "structural": {},
        "metric_base": {},
        "structural_group_subsets": {},
    }
    for n in range(args.min_n, args.max_n + 1):
        second_apex = n // 2
        variants = {
            "all": structural_verdict(
                n, second_apex, all_groups, args.timeout_ms
            )
        }
        for dropped in STRUCTURAL_GROUPS:
            variants[f"without_{dropped}"] = structural_verdict(
                n,
                second_apex,
                all_groups - {dropped},
                args.timeout_ms,
            )
        results["structural"][str(n)] = {
            "second_apex": second_apex,
            "variants": variants,
        }
        results["metric_base"][str(n)] = metric_base_verdict(
            n, args.timeout_ms
        )
        if n <= args.subset_max_n:
            subset_results = []
            for size in range(len(STRUCTURAL_GROUPS) + 1):
                for group_tuple in itertools.combinations(STRUCTURAL_GROUPS, size):
                    enabled = frozenset(group_tuple)
                    verdict = structural_verdict(
                        n, second_apex, enabled, args.timeout_ms
                    )
                    subset_results.append(
                        {
                            "enabled": list(group_tuple),
                            "status": verdict["status"],
                            "reason_unknown": verdict["reason_unknown"],
                        }
                    )
            results["structural_group_subsets"][str(n)] = subset_results

    print(json.dumps(results, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
