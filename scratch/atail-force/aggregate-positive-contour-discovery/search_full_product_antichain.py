#!/usr/bin/env python3
"""Exact bounded CEGAR search for a full product-box antichain.

The outer object is a cyclic row table ``S(c)`` with exactly four nonself
targets at every center, selected-pair alternation, and a strongly connected
selected digraph.  A table is a counterexample to the proposed circular
product-box comparability theorem when every equal-target-multiplicity fiber
is an antichain under the circular interval outward-crossing profiles.

The inner exact Z3 query searches for two assignments with equal target
multiplicities and a nonzero coordinatewise one-signed profile difference.
Each found pair contributes the sound outer cut saying that not all of its
changed-center row incidences may coexist.  A surviving table is replayed by
complete ``4^n`` assignment enumeration before it is serialized.

This is theorem-discovery support only.  SAT witnesses are exactly replayed;
UNSAT remains external solver evidence for the encoded finite bound.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import time
from collections import defaultdict
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path

import z3


Arc = tuple[int, int]
Assignment = tuple[int, ...]
Profile = tuple[int, ...]
Rows = dict[int, tuple[int, ...]]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    """Nontrivial circular intervals modulo complement."""

    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def outward_profile(
    intervals: Sequence[frozenset[int]], assignment: Assignment
) -> Profile:
    return tuple(
        sum(center in interval and target not in interval
            for center, target in enumerate(assignment))
        for interval in intervals
    )


def target_multiplicities(n: int, assignment: Assignment) -> tuple[int, ...]:
    counts = [0] * n
    for target in assignment:
        counts[target] += 1
    return tuple(counts)


def comparable_strict(left: Profile, right: Profile) -> bool:
    if left == right:
        return False
    return all(a <= b for a, b in zip(left, right, strict=True)) or all(
        b <= a for a, b in zip(left, right, strict=True)
    )


def alternating_partition(
    center_left: int, center_right: int, target_left: int, target_right: int
) -> bool:
    ordered = sorted((center_left, center_right, target_left, target_right))
    if len(set(ordered)) != 4:
        return False
    center_set = {center_left, center_right}
    return {ordered[0], ordered[2]} == center_set or {
        ordered[1], ordered[3]
    } == center_set


def verify_rows(n: int, rows: Mapping[int, Sequence[int]]) -> None:
    assert set(rows) == set(range(n))
    for center, row in rows.items():
        assert len(row) == 4
        assert len(set(row)) == 4
        assert center not in row
        assert all(0 <= target < n for target in row)

    for center_left, center_right in itertools.combinations(range(n), 2):
        shared = sorted(set(rows[center_left]) & set(rows[center_right]))
        for target_left, target_right in itertools.combinations(shared, 2):
            assert alternating_partition(
                center_left, center_right, target_left, target_right
            )

    def reachable(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            neighbors: Iterable[int]
            if reverse:
                neighbors = (
                    source for source, row in rows.items() if vertex in row
                )
            else:
                neighbors = rows[vertex]
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    stack.append(neighbor)
        return seen

    assert len(reachable(False)) == n
    assert len(reachable(True)) == n


def changed_support(left: Assignment, right: Assignment) -> frozenset[Arc]:
    return frozenset(
        (center, target)
        for center, (left_target, right_target) in enumerate(
            zip(left, right, strict=True)
        )
        if left_target != right_target
        for target in (left_target, right_target)
    )


def make_cut_certificate(
    n: int,
    intervals: Sequence[frozenset[int]],
    left: Assignment,
    right: Assignment,
) -> dict[str, object]:
    changed = {
        center: (left_target, right_target)
        for center, (left_target, right_target) in enumerate(
            zip(left, right, strict=True)
        )
        if left_target != right_target
    }
    left_counts = [0] * n
    right_counts = [0] * n
    for left_target, right_target in changed.values():
        left_counts[left_target] += 1
        right_counts[right_target] += 1
    assert left_counts == right_counts

    difference = tuple(
        sum(
            center in interval and left_target not in interval
            for center, (left_target, _right_target) in changed.items()
        )
        - sum(
            center in interval and right_target not in interval
            for center, (_left_target, right_target) in changed.items()
        )
        for interval in intervals
    )
    assert difference != (0,) * len(intervals)
    assert all(value >= 0 for value in difference) or all(
        value <= 0 for value in difference
    )
    return {
        "changed_rows": [
            [center, left_target, right_target]
            for center, (left_target, right_target) in sorted(changed.items())
        ],
        "profile_difference": list(difference),
        "support": [list(arc) for arc in sorted(changed_support(left, right))],
    }


def verify_cut_certificate(
    n: int,
    intervals: Sequence[frozenset[int]],
    certificate: Mapping[str, object],
) -> frozenset[Arc]:
    changed_rows = certificate["changed_rows"]
    assert isinstance(changed_rows, list)
    left = [-1] * n
    right = [-1] * n
    seen_centers: set[int] = set()
    for raw in changed_rows:
        assert isinstance(raw, list) and len(raw) == 3
        center, left_target, right_target = map(int, raw)
        assert 0 <= center < n
        assert 0 <= left_target < n and 0 <= right_target < n
        assert center not in (left_target, right_target)
        assert left_target != right_target
        assert center not in seen_centers
        seen_centers.add(center)
        left[center] = left_target
        right[center] = right_target
    assert seen_centers

    left_counts = [0] * n
    right_counts = [0] * n
    for center in seen_centers:
        left_counts[left[center]] += 1
        right_counts[right[center]] += 1
    assert left_counts == right_counts
    difference = tuple(
        sum(
            center in interval and left[center] not in interval
            for center in seen_centers
        )
        - sum(
            center in interval and right[center] not in interval
            for center in seen_centers
        )
        for interval in intervals
    )
    assert difference == tuple(map(int, certificate["profile_difference"]))  # type: ignore[arg-type]
    assert difference != (0,) * len(intervals)
    assert all(value >= 0 for value in difference) or all(
        value <= 0 for value in difference
    )
    support = frozenset(
        (center, target)
        for center in seen_centers
        for target in (left[center], right[center])
    )
    assert support == frozenset(
        tuple(map(int, raw)) for raw in certificate["support"]  # type: ignore[arg-type]
    )
    return support


def verify_pair(
    n: int,
    rows: Mapping[int, Sequence[int]],
    intervals: Sequence[frozenset[int]],
    left: Assignment,
    right: Assignment,
) -> dict[str, object]:
    assert left != right
    assert all(left[c] in rows[c] and right[c] in rows[c] for c in range(n))
    left_multiplicity = target_multiplicities(n, left)
    right_multiplicity = target_multiplicities(n, right)
    assert left_multiplicity == right_multiplicity
    left_profile = outward_profile(intervals, left)
    right_profile = outward_profile(intervals, right)
    assert comparable_strict(left_profile, right_profile)
    difference = tuple(
        a - b for a, b in zip(left_profile, right_profile, strict=True)
    )
    return {
        "left": list(left),
        "right": list(right),
        "target_multiplicity": list(left_multiplicity),
        "left_profile": list(left_profile),
        "right_profile": list(right_profile),
        "profile_difference": list(difference),
        "changed_support": [list(arc) for arc in sorted(changed_support(left, right))],
    }


class ProductAntichainSearch:
    def __init__(self, n: int, seed: int) -> None:
        self.n = n
        self.intervals = circular_intervals(n)
        self.outer = z3.Solver()
        self.outer.set(random_seed=seed)
        self.member = {
            (center, point): z3.Bool(f"m_{center}_{point}")
            for center in range(n)
            for point in range(n)
            if point != center
        }
        self.alternation_clause_count = 0
        self.connectivity_clause_count = 0
        self.learned_supports: set[frozenset[Arc]] = set()
        self.cut_certificates: list[dict[str, object]] = []
        self._add_outer_surface()

    def _add_outer_surface(self) -> None:
        n = self.n
        for center in range(n):
            self.outer.add(
                z3.PbEq(
                    [
                        (self.member[center, point], 1)
                        for point in range(n)
                        if point != center
                    ],
                    4,
                )
            )

        for quadruple in itertools.combinations(range(n), 4):
            a, b, c, d = quadruple
            alternating = {frozenset((a, c)), frozenset((b, d))}
            vertices = frozenset(quadruple)
            for centers_tuple in itertools.combinations(quadruple, 2):
                centers = frozenset(centers_tuple)
                if centers in alternating:
                    continue
                targets = vertices - centers
                center_left, center_right = sorted(centers)
                target_left, target_right = sorted(targets)
                self.outer.add(
                    z3.Or(
                        z3.Not(self.member[center_left, target_left]),
                        z3.Not(self.member[center_left, target_right]),
                        z3.Not(self.member[center_right, target_left]),
                        z3.Not(self.member[center_right, target_right]),
                    )
                )
                self.alternation_clause_count += 1

        vertices = tuple(range(n))
        for size in range(1, n):
            for tail in itertools.combinations(vertices[1:], size - 1):
                subset = frozenset((0, *tail))
                if len(subset) == n:
                    continue
                complement = frozenset(vertices) - subset
                self.outer.add(
                    z3.Or(
                        [
                            self.member[source, target]
                            for source in subset
                            for target in complement
                        ]
                    ),
                    z3.Or(
                        [
                            self.member[source, target]
                            for source in complement
                            for target in subset
                        ]
                    ),
                )
                self.connectivity_clause_count += 2

    def decode_rows(self, model: z3.ModelRef) -> Rows:
        rows = {
            center: tuple(
                point
                for point in range(self.n)
                if point != center
                and z3.is_true(
                    model.eval(self.member[center, point], model_completion=True)
                )
            )
            for center in range(self.n)
        }
        verify_rows(self.n, rows)
        return rows

    def add_support_cut(
        self, support: frozenset[Arc], certificate: dict[str, object]
    ) -> bool:
        assert support == verify_cut_certificate(
            self.n, self.intervals, certificate
        )
        if support in self.learned_supports:
            return False
        assert support
        self.outer.add(z3.Or([z3.Not(self.member[arc]) for arc in support]))
        self.learned_supports.add(support)
        self.cut_certificates.append(certificate)
        return True

    def find_pair_batch(
        self,
        rows: Rows,
        *,
        limit: int,
        timeout_ms: int,
    ) -> tuple[str, list[dict[str, object]], str | None]:
        n = self.n
        solver = z3.Solver()
        solver.set(timeout=timeout_ms, random_seed=0)
        left = {
            (center, target): z3.Bool(f"left_{center}_{target}")
            for center in range(n)
            for target in rows[center]
        }
        right = {
            (center, target): z3.Bool(f"right_{center}_{target}")
            for center in range(n)
            for target in rows[center]
        }
        for center in range(n):
            solver.add(
                z3.PbEq([(left[center, target], 1) for target in rows[center]], 1),
                z3.PbEq([(right[center, target], 1) for target in rows[center]], 1),
            )
        for target in range(n):
            solver.add(
                z3.Sum(
                    [
                        z3.If(left[center, target], 1, 0)
                        for center in range(n)
                        if target in rows[center]
                    ]
                )
                == z3.Sum(
                    [
                        z3.If(right[center, target], 1, 0)
                        for center in range(n)
                        if target in rows[center]
                    ]
                )
            )

        differences: list[z3.ArithRef] = []
        for interval in self.intervals:
            left_crossing = z3.Sum(
                [
                    z3.If(left[center, target], 1, 0)
                    for center in interval
                    for target in rows[center]
                    if target not in interval
                ]
            )
            right_crossing = z3.Sum(
                [
                    z3.If(right[center, target], 1, 0)
                    for center in interval
                    for target in rows[center]
                    if target not in interval
                ]
            )
            difference = left_crossing - right_crossing
            solver.add(difference >= 0)
            differences.append(difference)
        solver.add(z3.Sum(differences) >= 1)

        found: list[dict[str, object]] = []
        seen_supports: set[frozenset[Arc]] = set()
        while len(found) < limit:
            status = solver.check()
            if status == z3.unsat:
                return "UNSAT", found, None
            if status == z3.unknown:
                return "UNKNOWN", found, solver.reason_unknown()
            model = solver.model()
            left_assignment = tuple(
                next(
                    target
                    for target in rows[center]
                    if z3.is_true(
                        model.eval(left[center, target], model_completion=True)
                    )
                )
                for center in range(n)
            )
            right_assignment = tuple(
                next(
                    target
                    for target in rows[center]
                    if z3.is_true(
                        model.eval(right[center, target], model_completion=True)
                    )
                )
                for center in range(n)
            )
            record = verify_pair(
                n,
                rows,
                self.intervals,
                left_assignment,
                right_assignment,
            )
            support = changed_support(left_assignment, right_assignment)
            assert support
            record["cut_certificate"] = make_cut_certificate(
                n, self.intervals, left_assignment, right_assignment
            )
            if support not in seen_supports:
                seen_supports.add(support)
                record["support_size"] = len(support)
                found.append(record)

            same_support_conditions: list[z3.BoolRef] = []
            for center in range(n):
                left_target = left_assignment[center]
                right_target = right_assignment[center]
                if left_target == right_target:
                    same_support_conditions.append(
                        z3.Or(
                            [
                                z3.And(left[center, target], right[center, target])
                                for target in rows[center]
                            ]
                        )
                    )
                else:
                    same_support_conditions.append(
                        z3.Or(
                            z3.And(
                                left[center, left_target],
                                right[center, right_target],
                            ),
                            z3.And(
                                left[center, right_target],
                                right[center, left_target],
                            ),
                        )
                    )
            solver.add(z3.Not(z3.And(same_support_conditions)))
        return "BATCH_LIMIT", found, None


def exhaustive_replay(
    n: int, rows: Rows, intervals: Sequence[frozenset[int]]
) -> dict[str, object]:
    groups: dict[
        tuple[int, ...], dict[Profile, Assignment]
    ] = defaultdict(dict)
    assignment_count = 0
    pair_comparisons = 0
    for assignment in itertools.product(*(rows[center] for center in range(n))):
        assignment_count += 1
        multiplicity = target_multiplicities(n, assignment)
        profile = outward_profile(intervals, assignment)
        for previous_profile, previous_assignment in groups[multiplicity].items():
            pair_comparisons += 1
            if comparable_strict(profile, previous_profile):
                return {
                    "status": "COMPARABLE_PAIR_FOUND",
                    "assignment_count_before_hit": assignment_count,
                    "pair_comparisons_before_hit": pair_comparisons,
                    "pair": verify_pair(
                        n,
                        rows,
                        intervals,
                        assignment,
                        previous_assignment,
                    ),
                }
        groups[multiplicity].setdefault(profile, assignment)
    return {
        "status": "FULL_PRODUCT_ANTICHAIN_VERIFIED",
        "assignment_count": assignment_count,
        "expected_assignment_count": 4**n,
        "multiplicity_fiber_count": len(groups),
        "distinct_profile_count": sum(len(profiles) for profiles in groups.values()),
        "pair_comparisons": pair_comparisons,
    }


def canonical_sha256(value: object) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def dimacs_clauses(search: ProductAntichainSearch) -> tuple[dict[Arc, int], list[list[int]]]:
    n = search.n
    variable = {
        arc: index
        for index, arc in enumerate(sorted(search.member), start=1)
    }
    clauses: list[list[int]] = []

    for center in range(n):
        row_variables = [variable[center, target] for target in range(n) if target != center]
        # Exactly four: no five true and no four false among n-1 variables.
        clauses.extend([-literal for literal in chosen] for chosen in itertools.combinations(row_variables, 5))
        clauses.extend(list(chosen) for chosen in itertools.combinations(row_variables, n - 4))

    for quadruple in itertools.combinations(range(n), 4):
        a, b, c, d = quadruple
        alternating = {frozenset((a, c)), frozenset((b, d))}
        vertices = frozenset(quadruple)
        for centers_tuple in itertools.combinations(quadruple, 2):
            centers = frozenset(centers_tuple)
            if centers in alternating:
                continue
            targets = vertices - centers
            center_left, center_right = sorted(centers)
            target_left, target_right = sorted(targets)
            clauses.append(
                [
                    -variable[center_left, target_left],
                    -variable[center_left, target_right],
                    -variable[center_right, target_left],
                    -variable[center_right, target_right],
                ]
            )

    vertices = tuple(range(n))
    for size in range(1, n):
        for tail in itertools.combinations(vertices[1:], size - 1):
            subset = frozenset((0, *tail))
            if len(subset) == n:
                continue
            complement = frozenset(vertices) - subset
            clauses.append(
                [
                    variable[source, target]
                    for source in subset
                    for target in complement
                ]
            )
            clauses.append(
                [
                    variable[source, target]
                    for source in complement
                    for target in subset
                ]
            )

    clauses.extend(
        [-variable[arc] for arc in sorted(support)]
        for support in search.learned_supports
    )
    assert all(clause for clause in clauses)
    return variable, clauses


def write_dimacs(path: Path, search: ProductAntichainSearch) -> dict[str, object]:
    variable, clauses = dimacs_clauses(search)
    lines = [f"p cnf {len(variable)} {len(clauses)}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
    rendered = "\n".join(lines) + "\n"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(rendered, encoding="ascii")
    return {
        "path": str(path),
        "variable_count": len(variable),
        "clause_count": len(clauses),
        "sha256": hashlib.sha256(rendered.encode("ascii")).hexdigest(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--solver-timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-iterations", type=int, default=10_000)
    parser.add_argument("--batch-cuts", type=int, default=64)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--dimacs-output", type=Path)
    args = parser.parse_args()
    if args.n < 5:
        raise ValueError("n must be at least five")
    if args.timeout_seconds <= 0 or args.solver_timeout_ms <= 0:
        raise ValueError("timeouts must be positive")
    if args.max_iterations <= 0 or args.batch_cuts <= 0:
        raise ValueError("budgets must be positive")

    started = time.monotonic()
    search = ProductAntichainSearch(args.n, args.seed)
    iterations: list[dict[str, object]] = []
    terminal: dict[str, object]

    for iteration in range(1, args.max_iterations + 1):
        elapsed = time.monotonic() - started
        remaining_ms = int((args.timeout_seconds - elapsed) * 1000)
        if remaining_ms <= 0:
            terminal = {"status": "WALL_BUDGET"}
            break
        search.outer.set(timeout=min(args.solver_timeout_ms, remaining_ms))
        outer_status = search.outer.check()
        if outer_status == z3.unsat:
            terminal = {
                "status": "EXHAUSTIVE_SMALL_N_UNSAT_EXTERNAL_Z3",
                "solver_statistics": str(search.outer.statistics()),
            }
            break
        if outer_status == z3.unknown:
            terminal = {
                "status": "OUTER_UNKNOWN",
                "reason": search.outer.reason_unknown(),
                "solver_statistics": str(search.outer.statistics()),
            }
            break

        rows = search.decode_rows(search.outer.model())
        remaining_ms = int((args.timeout_seconds - (time.monotonic() - started)) * 1000)
        if remaining_ms <= 0:
            terminal = {"status": "WALL_BUDGET", "last_rows": rows}
            break
        inner_status, pair_records, reason = search.find_pair_batch(
            rows,
            limit=args.batch_cuts,
            timeout_ms=min(args.solver_timeout_ms, remaining_ms),
        )
        added = 0
        for record in pair_records:
            support = frozenset(
                tuple(arc) for arc in record["changed_support"]  # type: ignore[arg-type]
            )
            certificate = record["cut_certificate"]
            assert isinstance(certificate, dict)
            added += search.add_support_cut(support, certificate)
        iterations.append(
            {
                "iteration": iteration,
                "outer_rows_sha256": canonical_sha256(rows),
                "inner_status": inner_status,
                "pairs_found": len(pair_records),
                "cuts_added": added,
                "total_cuts": len(search.learned_supports),
                "smallest_support": min(
                    (int(record["support_size"]) for record in pair_records),
                    default=None,
                ),
                "largest_support": max(
                    (int(record["support_size"]) for record in pair_records),
                    default=None,
                ),
            }
        )
        if inner_status == "UNKNOWN":
            terminal = {
                "status": "INNER_UNKNOWN",
                "reason": reason,
                "rows": rows,
            }
            break
        if not pair_records:
            replay = exhaustive_replay(args.n, rows, search.intervals)
            if replay["status"] != "FULL_PRODUCT_ANTICHAIN_VERIFIED":
                terminal = {
                    "status": "INVARIANT_FAILURE",
                    "reason": "inner UNSAT disagrees with exhaustive replay",
                    "rows": rows,
                    "replay": replay,
                }
            else:
                row_payload = {str(center): list(row) for center, row in rows.items()}
                terminal = {
                    "status": "REPLAYED_FULL_PRODUCT_ANTICHAIN_COUNTEREXAMPLE",
                    "rows": row_payload,
                    "rows_sha256": canonical_sha256(row_payload),
                    "replay": replay,
                }
            break
        if added == 0:
            terminal = {
                "status": "INVARIANT_FAILURE",
                "reason": "comparable pairs produced no new outer cut",
                "rows": rows,
            }
            break
    else:
        terminal = {"status": "MAX_ITERATIONS"}

    dimacs = (
        write_dimacs(args.dimacs_output, search)
        if args.dimacs_output is not None
        else None
    )
    payload = {
        "schema": "p97-full-four-row-product-antichain-cegar-v1",
        "epistemic_status": "EXACT_REPLAY_IF_COUNTEREXAMPLE_EXTERNAL_Z3_IF_UNSAT",
        "n": args.n,
        "seed": args.seed,
        "strong_connectivity": True,
        "pair_alternation": True,
        "row_cardinality": 4,
        "interval_count": len(search.intervals),
        "alternation_clause_count": search.alternation_clause_count,
        "connectivity_clause_count": search.connectivity_clause_count,
        "iterations_completed": len(iterations),
        "learned_comparable_support_cuts": len(search.learned_supports),
        "cut_certificate_bank_sha256": canonical_sha256(search.cut_certificates),
        "cut_certificates": search.cut_certificates,
        "dimacs": dimacs,
        "elapsed_seconds": time.monotonic() - started,
        "iteration_log": iterations,
        "terminal": terminal,
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
