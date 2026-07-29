#!/usr/bin/env python3
"""Ground-Boolean performance port of the exact bounded n=17 outer model.

This module deliberately reuses the hash-pinned legacy constraint generators,
but replaces all three Int-indexed uninterpreted functions by finite Boolean
tables and replaces every integer role by an exact-one Boolean vector.  Thus
the generated formula contains only propositional atoms, Boolean connectives,
and pseudo-Boolean cardinality constraints.

This is bounded solver infrastructure, not a proof.  In particular, n=17 is
only the minimum-cardinality slice of the live n>=17 obligation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from collections import Counter, defaultdict
from pathlib import Path
from typing import Iterable

import z3

import model as legacy


LEGACY_MODEL_SHA256 = "cc6a5738d915adc2d8df0cd664adf1c525e3554dfbf384f115087e19536098e4"
_LEGACY_PATH = Path(legacy.__file__).resolve()
_actual_hash = hashlib.sha256(_LEGACY_PATH.read_bytes()).hexdigest()
if _actual_hash != LEGACY_MODEL_SHA256:
    raise RuntimeError(
        "FAIL_CLOSED_SOURCE_HASH_MISMATCH: model.py is "
        f"{_actual_hash}, expected {LEGACY_MODEL_SHA256}"
    )

N = legacy.N
FIRST_APEX = legacy.FIRST_APEX
SECOND_APEX = legacy.SECOND_APEX
THIRD_APEX = legacy.THIRD_APEX
APICES = legacy.APICES
CAPS = legacy.CAPS
CAP_ENDPOINTS = legacy.CAP_ENDPOINTS
FIRST_STRICT = legacy.FIRST_STRICT
OUTSIDE_FIRST = legacy.OUTSIDE_FIRST

ROLE_NAMES = (
    "p1",
    "p2",
    "r1",
    "r2",
    "source",
    "q",
    "other",
    "b1",
    "b2",
    "bsource",
    "cycle_p",
    "cycle_r",
)
Index = int | str


class BoolCardinality:
    """A cardinality expression that stays in pseudo-Boolean logic."""

    def __init__(self, literals: Iterable[z3.BoolRef]) -> None:
        self.literals = tuple(literals)

    def __le__(self, bound: int) -> z3.BoolRef:
        return z3.PbLe([(literal, 1) for literal in self.literals], bound)

    def __ge__(self, bound: int) -> z3.BoolRef:
        return z3.PbGe([(literal, 1) for literal in self.literals], bound)

    def __eq__(self, bound: object) -> z3.BoolRef:  # type: ignore[override]
        if not isinstance(bound, int):
            return z3.BoolVal(False)
        return z3.PbEq([(literal, 1) for literal in self.literals], bound)


class Encoding(legacy.Encoding):
    """The legacy formula over fixed Boolean tables and one-hot roles."""

    def __init__(
        self,
        timeout_ms: int,
        random_seed: int,
        nonbisector: bool,
        full_circle_intersections: bool,
    ) -> None:
        # Do not call legacy.Encoding.__init__: that is exactly where the
        # Int-indexed UFs and integer roles are introduced.
        # QF_FD selects Z3's finite-domain/SAT pipeline for this ground
        # propositional formula instead of routing it through the general SMT
        # solver used by the legacy UF/Int encoding.
        self.solver = z3.SolverFor("QF_FD")
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.counts: Counter[str] = Counter()
        self.constraints_by_block: dict[str, list[z3.BoolRef]] = defaultdict(list)
        self.nonbisector = nonbisector
        self.full_circle_intersections = full_circle_intersections

        self._member = [
            [z3.Bool(f"member__{center}__{point}") for point in range(N)]
            for center in range(N)
        ]
        self._same = [
            [
                [
                    z3.Bool(f"same__{center}__{left}__{right}")
                    for right in range(N)
                ]
                for left in range(N)
            ]
            for center in range(N)
        ]
        self._blocker = [
            [z3.Bool(f"blocker__{source}__{center}") for center in range(N)]
            for source in range(N)
        ]
        self.roles = {
            name: [z3.Bool(f"role__{name}__{value}") for value in range(N)]
            for name in ROLE_NAMES
        }
        self.role_domains = {
            **{
                name: tuple(FIRST_STRICT)
                for name in ("p1", "p2", "r1", "r2", "source", "b1", "b2")
            },
            "q": tuple(OUTSIDE_FIRST),
            "other": tuple(OUTSIDE_FIRST),
            "bsource": tuple(point for point in range(N) if point not in APICES),
            "cycle_p": tuple(FIRST_STRICT),
            "cycle_r": tuple(FIRST_STRICT),
        }

        # Same semantic domain as the legacy pair 0 <= role, role < N.
        for name in ROLE_NAMES:
            self.add(
                "role_bounds",
                z3.PbEq([(bit, 1) for bit in self.roles[name]], 1),
            )

        self._add_global_partitions_and_rows()
        self._add_blocker_map_and_critical_shells()
        self._add_global_incidence()
        self._add_kalmanson_three_equality_cuts()
        self._add_cap_bounds()
        self._add_tri_apex_residual()
        self._add_named_leaf()

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.constraints_by_block[block].extend(constraints)
        self.counts[block] += len(constraints)

    def role_eq(self, role: str, value: int) -> z3.BoolRef:
        return self.roles[role][value]

    def roles_equal(self, left: str, right: str) -> z3.BoolRef:
        return z3.Or(
            *(
                z3.And(self.roles[left][v], self.roles[right][v])
                for v in sorted(
                    set(self.role_domains[left]).intersection(self.role_domains[right])
                )
            )
        )

    def roles_distinct(self, *names: str) -> z3.BoolRef:
        return z3.And(
            *(
                z3.Not(self.roles_equal(left, right))
                for left, right in __import__("itertools").combinations(names, 2)
            )
        )

    def _select(
        self,
        table: object,
        indices: tuple[Index, ...],
        depth: int = 0,
    ) -> z3.BoolRef:
        if depth == len(indices):
            assert isinstance(table, z3.BoolRef)
            return table
        index = indices[depth]
        if isinstance(index, int):
            return self._select(table[index], indices, depth + 1)  # type: ignore[index]
        return z3.Or(
            *(
                z3.And(
                    self.roles[index][value],
                    self._select(table[value], indices, depth + 1),  # type: ignore[index]
                )
                for value in self.role_domains[index]
            )
        )

    def member(self, center: Index, point: Index) -> z3.BoolRef:
        return self._select(self._member, (center, point))

    def same(self, center: Index, left: Index, right: Index) -> z3.BoolRef:
        return self._select(self._same, (center, left, right))

    def blocker(self, source: Index, center: Index) -> z3.BoolRef:
        return self._select(self._blocker, (source, center))

    def class_size(
        self,
        center: Index,
        representative: Index,
        points: tuple[int, ...] | list[int],
    ) -> BoolCardinality:
        return BoolCardinality(
            self.same(center, representative, point) for point in points
        )

    @staticmethod
    def in_set(variable: str, points: Iterable[int]) -> z3.BoolRef:
        # Kept only for API compatibility; _add_named_leaf uses role_in_set.
        raise TypeError(f"use role_in_set for one-hot role {variable!r}")

    def role_in_set(self, role: str, points: Iterable[int]) -> z3.BoolRef:
        return z3.Or(*(self.roles[role][point] for point in points))

    def _add_tri_apex_residual(self) -> None:
        for apex in APICES:
            self.add("apex_rich", self._rich(apex))
        for center in range(N):
            self.add(
                "no_center_covers_all_apices",
                z3.Not(
                    z3.And(
                        self.same(center, FIRST_APEX, SECOND_APEX),
                        self.same(center, FIRST_APEX, THIRD_APEX),
                    )
                ),
            )
        not_robust = [self._not_robust(center) for center in range(N)]
        self.add(
            "not_robust_cover_card",
            z3.PbGe([(formula, 1) for formula in not_robust], 5),
        )

    def _add_named_leaf(self) -> None:
        p1, p2, r1, r2 = "p1", "p2", "r1", "r2"
        source, q, other = "source", "q", "other"
        b1, b2, bsource = "b1", "b2", "bsource"
        cycle_p, cycle_r = "cycle_p", "cycle_r"

        for variable in (p1, p2, r1, r2, source, b1, b2):
            self.add("strict_cap_roles", self.role_in_set(variable, FIRST_STRICT))
        for variable in (q, other):
            self.add(
                "outside_first_cap_roles",
                self.role_in_set(variable, OUTSIDE_FIRST),
            )

        self.add(
            "retained_sources_distinct",
            self.roles_distinct(p1, p2, r1, r2, source),
        )
        self.add(
            "outside_points_distinct",
            self.roles_distinct(q, other, p1, p2, r1, r2, source),
        )
        self.add("blockers_distinct", z3.Not(self.roles_equal(b1, b2)))
        self.add(
            "source_blocker_distinct",
            z3.Not(self.roles_equal(bsource, b1)),
            z3.Not(self.roles_equal(bsource, b2)),
        )

        first_targets = tuple(point for point in range(N) if point != FIRST_APEX)
        self.add("p_radius_pair", self.same(FIRST_APEX, p1, p2))
        self.add("r_radius_pair", self.same(FIRST_APEX, r1, r2))
        self.add("radii_distinct", z3.Not(self.same(FIRST_APEX, p1, r1)))
        self.add(
            "p_class_card_eq_four",
            self.class_size(FIRST_APEX, p1, first_targets) == 4,
        )
        self.add(
            "r_class_card_eq_four",
            self.class_size(FIRST_APEX, r1, first_targets) == 4,
        )
        for point in FIRST_STRICT:
            self.add(
                "p_class_strict_trace",
                self.same(FIRST_APEX, p1, point)
                == z3.Or(self.role_eq(p1, point), self.role_eq(p2, point)),
            )
            self.add(
                "r_class_strict_trace",
                self.same(FIRST_APEX, r1, point)
                == z3.Or(self.role_eq(r1, point), self.role_eq(r2, point)),
            )
            self.add(
                "singleton_strict_trace",
                self.same(FIRST_APEX, source, point)
                == self.role_eq(source, point),
            )

        import itertools

        for left, right in itertools.combinations(FIRST_STRICT, 2):
            self.add(
                "all_multi_point_radii_aligned",
                z3.Implies(
                    self.same(FIRST_APEX, left, right),
                    z3.Or(
                        self.same(FIRST_APEX, left, p1),
                        self.same(FIRST_APEX, left, r1),
                    ),
                ),
            )

        self.add("p1_blocker", self.blocker(p1, b1))
        self.add("p2_blocker", self.blocker(p2, b1))
        self.add("r1_blocker", self.blocker(r1, b2))
        self.add("r2_blocker", self.blocker(r2, b2))
        self.add("q_blocker", self.blocker(q, b1))
        self.add("singleton_source_blocker", self.blocker(source, bsource))

        for point in range(N):
            self.add(
                "first_blocker_row_exact",
                self.member(b1, point)
                == z3.Or(
                    self.role_eq(p1, point),
                    self.role_eq(p2, point),
                    self.role_eq(q, point),
                    self.role_eq(other, point),
                ),
            )
        for point in FIRST_STRICT:
            self.add(
                "second_blocker_strict_trace",
                self.member(b2, point)
                == z3.Or(self.role_eq(r1, point), self.role_eq(r2, point)),
            )

        self.add(
            "source_omits_p_pair",
            z3.Or(z3.Not(self.member(bsource, p1)), z3.Not(self.member(bsource, p2))),
        )
        self.add(
            "source_omits_r_pair",
            z3.Or(z3.Not(self.member(bsource, r1)), z3.Not(self.member(bsource, r2))),
        )

        self.add(
            "cycle_p_choice",
            z3.Or(self.roles_equal(cycle_p, p1), self.roles_equal(cycle_p, p2)),
        )
        self.add(
            "cycle_r_choice",
            z3.Or(self.roles_equal(cycle_r, r1), self.roles_equal(cycle_r, r2)),
        )
        self.add("cycle_p_blocker", self.blocker(cycle_p, b1))
        self.add("cycle_r_blocker", self.blocker(cycle_r, b2))
        self.add(
            "cycle_p_omitted_by_second",
            z3.Not(self.member(b2, cycle_p)),
        )
        self.add(
            "cycle_r_omitted_by_first",
            z3.Not(self.member(b1, cycle_r)),
        )
        for left in (p1, p2):
            self.add("cross_omission_rectangle", z3.Not(self.member(b2, left)))
        for right in (r1, r2):
            self.add("cross_omission_rectangle", z3.Not(self.member(b1, right)))

        target = self.same(b2, q, other)
        self.add(
            "second_blocker_target",
            z3.Not(target) if self.nonbisector else target,
        )

    def role_value(self, witness: z3.ModelRef, role: str) -> int:
        values = [
            value
            for value, bit in enumerate(self.roles[role])
            if z3.is_true(witness.eval(bit, model_completion=True))
        ]
        if len(values) != 1:
            raise RuntimeError(f"role {role!r} has choices {values}")
        return values[0]


strongly_connected_components = legacy.strongly_connected_components
sink_components = legacy.sink_components
eval_bool = legacy.eval_bool


def equivalence_classes(
    encoding: Encoding, witness: z3.ModelRef, center: int
) -> list[list[int]]:
    return legacy.equivalence_classes(encoding, witness, center)


def extract_payload(
    encoding: Encoding,
    witness: z3.ModelRef,
    status: str,
    elapsed_seconds: float,
    refinements: int,
) -> dict[str, object]:
    rows = {
        center: tuple(
            point
            for point in range(N)
            if eval_bool(witness, encoding.member(center, point))
        )
        for center in range(N)
    }
    blockers: dict[int, int] = {}
    for source in range(N):
        matches = [
            center
            for center in range(N)
            if eval_bool(witness, encoding.blocker(source, center))
        ]
        if len(matches) != 1:
            raise RuntimeError(f"source {source} has blocker choices {matches}")
        blockers[source] = matches[0]

    classes = {
        center: equivalence_classes(encoding, witness, center)
        for center in range(N)
    }
    not_robust = [
        center
        for center in range(N)
        if eval_bool(witness, encoding._not_robust(center))
    ]
    roles = {name: encoding.role_value(witness, name) for name in ROLE_NAMES}
    return {
        "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
        "encoder": "ground-bool-one-hot-v1",
        "source_model_sha256": LEGACY_MODEL_SHA256,
        "epistemic_status": "BOUNDED_COMBINATORIAL_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN",
        "status": status,
        "n": N,
        "apices": list(APICES),
        "caps": {name: sorted(cap) for name, cap in CAPS.items()},
        "first_strict_cap": list(FIRST_STRICT),
        "target": (
            "second_blocker_nonbisector"
            if encoding.nonbisector
            else "second_blocker_bisector_control"
        ),
        "roles": roles,
        "rows": {str(center): list(row) for center, row in rows.items()},
        "blockers": {str(source): center for source, center in blockers.items()},
        "equality_classes": {
            str(center): blocks for center, blocks in classes.items()
        },
        "not_robust_centers": not_robust,
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "connectivity_refinements": refinements,
        "elapsed_seconds": elapsed_seconds,
        "omitted": [
            "Euclidean coordinates and MEC/cap realizability",
            "strict metric triangle and Kalmanson inequalities",
            "full geometric content of noM44",
            "theorem-bank cuts not derived directly in this script",
        ]
        + (
            []
            if encoding.full_circle_intersections
            else ["monolithic all-class two-circle intersection overlay"]
        ),
    }


def formula_is_ground_bool(encoding: Encoding) -> tuple[bool, str]:
    """Reject Int/BV/UF applications; propositional constants are allowed."""
    seen: set[int] = set()
    stack = list(encoding.solver.assertions())
    while stack:
        expression = stack.pop()
        key = expression.get_id()
        if key in seen:
            continue
        seen.add(key)
        if expression.sort().kind() != z3.Z3_BOOL_SORT:
            return False, f"unexpected sort {expression.sort()} in {expression}"
        if z3.is_app(expression):
            declaration = expression.decl()
            if (
                declaration.kind() == z3.Z3_OP_UNINTERPRETED
                and declaration.arity() != 0
            ):
                return False, f"non-ground UF application {expression}"
            if (
                declaration.kind() == z3.Z3_OP_UNINTERPRETED
                and expression.sort().kind() != z3.Z3_BOOL_SORT
            ):
                return False, f"non-Boolean free constant {expression}"
            stack.extend(expression.children())
    return True, f"GROUND_BOOL_OK nodes={len(seen)}"


def run_outer(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
        nonbisector=not args.bisector_control,
        full_circle_intersections=args.full_circle_intersections,
    )
    refinements = 0
    while refinements <= args.max_connectivity_refinements:
        status = encoding.solver.check()
        if status != z3.sat:
            return {
                "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
                "encoder": "ground-bool-one-hot-v1",
                "source_model_sha256": LEGACY_MODEL_SHA256,
                "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
                "status": str(status).upper(),
                "reason_unknown": (
                    encoding.solver.reason_unknown() if status == z3.unknown else None
                ),
                "n": N,
                "constraint_counts": dict(sorted(encoding.counts.items())),
                "connectivity_refinements": refinements,
                "elapsed_seconds": time.monotonic() - started,
            }
        witness = encoding.solver.model()
        rows = {
            center: tuple(
                point
                for point in range(N)
                if eval_bool(witness, encoding.member(center, point))
            )
            for center in range(N)
        }
        components = strongly_connected_components(rows)
        if len(components) == 1:
            return extract_payload(
                encoding,
                witness,
                status="SAT",
                elapsed_seconds=time.monotonic() - started,
                refinements=refinements,
            )
        sinks = sink_components(rows, components)
        if not sinks:
            raise RuntimeError("non-strong graph has no proper sink component")
        for component in sinks:
            encoding.add_connectivity_cut(component)
        refinements += 1
    return {
        "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
        "encoder": "ground-bool-one-hot-v1",
        "source_model_sha256": LEGACY_MODEL_SHA256,
        "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
        "status": "UNKNOWN",
        "reason_unknown": "connectivity refinement budget exhausted",
        "n": N,
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "connectivity_refinements": refinements,
        "elapsed_seconds": time.monotonic() - started,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--max-connectivity-refinements", type=int, default=100)
    parser.add_argument("--bisector-control", action="store_true")
    parser.add_argument("--full-circle-intersections", action="store_true")
    args = parser.parse_args()
    payload = run_outer(args)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "status": payload["status"],
                "elapsed_seconds": payload.get("elapsed_seconds"),
                "connectivity_refinements": payload.get(
                    "connectivity_refinements"
                ),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
