#!/usr/bin/env python3
"""Arbitrary-cardinality induced-witness relaxation for the live ATail leaf.

W is only the quotient of the named witness occurrences below.  It is never
identified with D.A.  Consequently Exact4(c; support) and the unique-four
projections quantify only over W.  Global K4, robustness beyond its selected
escape row, minimality, noM44, and cover are deliberately not encoded as
finite-universe universal statements.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from collections import Counter
from pathlib import Path

import z3


BASE_ROLES = (
    "a0", "a1", "a2",
    "p1", "p2", "r1", "r2",
    "q", "other", "z", "t", "source",
    "b1", "b2", "bs", "bz",
    "s2", "s3", "s4",
    "p3", "p4", "r3", "r4",
    "z2", "z3", "z4",
)
ESCAPE_ROLES = ("be", "escape", "e2", "e3", "e4")


class InducedEncoding:
    def __init__(
        self,
        *,
        timeout_ms: int,
        random_seed: int,
        z_branch: str,
        escape_arm: str,
        geometry: str,
    ) -> None:
        self.names = BASE_ROLES + ESCAPE_ROLES
        self.index = {name: i for i, name in enumerate(self.names)}
        self.n = len(self.names)
        assert self.n <= 31
        self.z_branch = z_branch
        self.escape_arm = escape_arm
        self.geometry = geometry
        self.kalmanson_cuts_seen: set[tuple[int, int, int, int]] = set()
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.counts: Counter[str] = Counter()
        self.rank = [z3.Int(f"rank_{name}") for name in self.names]
        self.distance = {
            (i, j): z3.Real(f"d_{self.names[i]}_{self.names[j]}")
            for i in range(self.n) for j in range(i + 1, self.n)
        }
        self._add_quotient_metric()
        self._add_live_prefix()
        self._add_first_cap_order()
        self._add_apex_triple_exclusion()

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def ix(self, name: str) -> int:
        return self.index[name]

    def d(self, left: int | str, right: int | str) -> z3.ArithRef:
        i = self.ix(left) if isinstance(left, str) else left
        j = self.ix(right) if isinstance(right, str) else right
        if i == j:
            return z3.RealVal(0)
        return self.distance[min(i, j), max(i, j)]

    def same(self, left: int | str, right: int | str) -> z3.BoolRef:
        i = self.ix(left) if isinstance(left, str) else left
        j = self.ix(right) if isinstance(right, str) else right
        return self.rank[i] == self.rank[j]

    def distinct(self, names: tuple[str, ...] | list[str]) -> z3.BoolRef:
        return z3.Distinct(*(self.rank[self.ix(name)] for name in names))

    def _add_quotient_metric(self) -> None:
        for rank in self.rank:
            self.add("rank_bounds", 0 <= rank, rank < self.n)
        for (i, j), dij in self.distance.items():
            self.add(
                "quotient_distance",
                z3.Implies(self.rank[i] == self.rank[j], dij == 0),
                z3.Implies(self.rank[i] != self.rank[j], dij > 0),
            )
            for k in range(self.n):
                if k == i or k == j:
                    continue
                self.add(
                    "quotient_distance_congruence",
                    z3.Implies(
                        self.rank[i] == self.rank[j],
                        self.d(i, k) == self.d(j, k),
                    ),
                )

        # Homogeneous scale normalization; the three MEC apices are distinct.
        self.add("apices_distinct", self.distinct(["a0", "a1", "a2"]))
        self.add("scale", self.d("a0", "a1") == 1)

        for i, j, k in itertools.combinations(range(self.n), 3):
            guard = z3.Distinct(self.rank[i], self.rank[j], self.rank[k])
            self.add(
                "strict_triangle",
                z3.Implies(guard, self.d(i, j) + self.d(j, k) > self.d(i, k)),
                z3.Implies(guard, self.d(i, j) + self.d(i, k) > self.d(j, k)),
                z3.Implies(guard, self.d(i, k) + self.d(j, k) > self.d(i, j)),
            )

        if self.geometry == "eager-kalmanson":
            for quad in itertools.combinations(range(self.n), 4):
                for cyclic in self._three_cyclic_orders(quad):
                    a, b, c, d = cyclic
                    guard = self._cyclic_rank_guard(cyclic)
                    diagonal_sum = self.d(a, c) + self.d(b, d)
                    self.add(
                        "strict_kalmanson",
                        z3.Implies(
                            guard,
                            self.d(a, b) + self.d(c, d) < diagonal_sum,
                        ),
                        z3.Implies(
                            guard,
                            self.d(a, d) + self.d(b, c) < diagonal_sum,
                        ),
                    )

    def add_lazy_kalmanson_cuts(self, model: z3.ModelRef) -> int:
        """Refine the currently selected cyclic order by violated strict cuts."""
        added = 0
        rank_value = [
            model.eval(rank, model_completion=True).as_long() for rank in self.rank
        ]
        for quad in itertools.combinations(range(self.n), 4):
            if len({rank_value[i] for i in quad}) != 4:
                continue
            order = tuple(sorted(quad, key=rank_value.__getitem__))
            a, b, c, d = order
            diagonal_sum = self.d(a, c) + self.d(b, d)
            inequalities = (
                self.d(a, b) + self.d(c, d) < diagonal_sum,
                self.d(a, d) + self.d(b, c) < diagonal_sum,
            )
            if all(
                z3.is_true(model.eval(formula, model_completion=True))
                for formula in inequalities
            ):
                continue
            if order in self.kalmanson_cuts_seen:
                raise RuntimeError("previously asserted Kalmanson cut is violated")
            self.kalmanson_cuts_seen.add(order)
            guard = z3.And(
                self.rank[a] < self.rank[b],
                self.rank[b] < self.rank[c],
                self.rank[c] < self.rank[d],
            )
            self.add(
                "lazy_strict_kalmanson",
                *(z3.Implies(guard, formula) for formula in inequalities),
            )
            added += 1
        return added

    def freeze_order_and_add_kalmanson(self, model: z3.ModelRef) -> None:
        """Sound SAT probe: freeze one quotient/order, then solve its LRA metric."""
        rank_value = [
            model.eval(rank, model_completion=True).as_long() for rank in self.rank
        ]
        self.add(
            "fixed_order_probe",
            *(self.rank[i] == rank_value[i] for i in range(self.n)),
        )
        for quad in itertools.combinations(range(self.n), 4):
            if len({rank_value[i] for i in quad}) != 4:
                continue
            a, b, c, d = sorted(quad, key=rank_value.__getitem__)
            diagonal_sum = self.d(a, c) + self.d(b, d)
            self.add(
                "fixed_order_strict_kalmanson",
                self.d(a, b) + self.d(c, d) < diagonal_sum,
                self.d(a, d) + self.d(b, c) < diagonal_sum,
            )

    @staticmethod
    def _three_cyclic_orders(
        quad: tuple[int, int, int, int],
    ) -> tuple[tuple[int, int, int, int], ...]:
        a, b, c, d = quad
        return ((a, b, c, d), (a, b, d, c), (a, c, b, d))

    def _cyclic_rank_guard(
        self, cyclic: tuple[int, int, int, int],
    ) -> z3.BoolRef:
        orders: list[z3.BoolRef] = []
        seq = list(cyclic)
        for direction in (seq, list(reversed(seq))):
            for shift in range(4):
                order = direction[shift:] + direction[:shift]
                orders.append(
                    z3.And(
                        self.rank[order[0]] < self.rank[order[1]],
                        self.rank[order[1]] < self.rank[order[2]],
                        self.rank[order[2]] < self.rank[order[3]],
                    )
                )
        return z3.Or(*orders)

    def selected4_formula(
        self, center: str, support: tuple[str, ...],
    ) -> z3.BoolRef:
        """Four distinct named carrier points on one circle about `center`."""
        assert len(support) == 4
        radius = self.d(center, support[0])
        return z3.And(
            self.distinct([center, *support]),
            *(self.d(center, point) == radius for point in support[1:]),
        )

    def exact4_formula(
        self, center: str, support: tuple[str, ...],
    ) -> z3.BoolRef:
        assert len(support) == 4
        radius = self.d(center, support[0])
        clauses: list[z3.BoolRef] = [self.selected4_formula(center, support)]
        # Induced-only exclusion: t ranges over named W, never over D.A.
        for point in self.names:
            clauses.append(
                z3.Implies(
                    self.d(center, point) == radius,
                    z3.Or(*(self.same(point, member) for member in support)),
                )
            )
        return z3.And(*clauses)

    def unique4_projection_formula(
        self, center: str, support: tuple[str, ...],
    ) -> z3.BoolRef:
        """Project uniqueness of the center's K4 radius onto named points W."""
        clauses: list[z3.BoolRef] = [self.exact4_formula(center, support)]
        candidates = tuple(name for name in self.names if name != center)
        for four in itertools.combinations(candidates, 4):
            radius = self.d(center, four[0])
            clauses.append(
                z3.Implies(
                    z3.And(
                        self.distinct([center, *four]),
                        *(self.d(center, point) == radius for point in four[1:]),
                    ),
                    radius == self.d(center, support[0]),
                )
            )
        return z3.And(*clauses)

    def exact4(self, block: str, center: str, support: tuple[str, ...]) -> None:
        self.add(block, self.exact4_formula(center, support))

    def unique4_projection(
        self, block: str, center: str, support: tuple[str, ...],
    ) -> None:
        self.add(block, self.unique4_projection_formula(center, support))

    def support_set_equal_formula(
        self, left: tuple[str, ...], right: tuple[str, ...],
    ) -> z3.BoolRef:
        return z3.And(
            *(
                z3.Or(*(self.same(point, other) for other in right))
                for point in left
            ),
            *(
                z3.Or(*(self.same(point, other) for other in left))
                for point in right
            ),
        )

    def support_overlap_at_most_two_formula(
        self, left: tuple[str, ...], right: tuple[str, ...],
    ) -> z3.BoolRef:
        """No three distinct members of `left` occur in `right`."""
        return z3.And(
            *(
                z3.Not(
                    z3.And(
                        *(
                            z3.Or(*(self.same(point, other) for other in right))
                            for point in triple
                        )
                    )
                )
                for triple in itertools.combinations(left, 3)
            )
        )

    def shell_coherence_formula(
        self,
        left_center: str,
        left_support: tuple[str, ...],
        right_center: str,
        right_support: tuple[str, ...],
    ) -> z3.BoolRef:
        """Unique-four equality plus the two-circle intersection bound."""
        return z3.And(
            z3.Implies(
                self.same(left_center, right_center),
                self.support_set_equal_formula(left_support, right_support),
            ),
            z3.Implies(
                z3.Not(self.same(left_center, right_center)),
                self.support_overlap_at_most_two_formula(
                    left_support, right_support,
                ),
            ),
        )

    def set_equal(self, block: str, left: tuple[str, ...], right: tuple[str, ...]) -> None:
        for point in left:
            self.add(block, z3.Or(*(self.same(point, other) for other in right)))
        for point in right:
            self.add(block, z3.Or(*(self.same(point, other) for other in left)))

    def _add_live_prefix(self) -> None:
        retained = ("p1", "p2", "r1", "r2")
        inside = (*retained, "source")
        strict_cap_named = (*inside, "b1", "b2")
        outside = ("q", "other", "z", "t")

        self.add("retained_disjoint_pairs", self.distinct(list(retained)))
        self.add("outside_cap_separation", self.distinct(list(inside)))
        for u in inside:
            for v in outside:
                self.add("inside_outside_distinct", z3.Not(self.same(u, v)))
        self.add("first_outside_pair", z3.Not(self.same("q", "other")))
        self.add("second_outside_pair", z3.Not(self.same("z", "t")))
        self.add("z_new_from_first_pair", z3.Not(self.same("z", "q")),
                 z3.Not(self.same("z", "other")))

        shell1 = ("p1", "p2", "q", "other")
        shell2 = ("r1", "r2", "z", "t")
        self.unique4_projection("critical_shell_1", "b1", shell1)
        self.unique4_projection("critical_shell_2", "b2", shell2)
        source_support = ("source", "s2", "s3", "s4")
        self.unique4_projection("critical_shell_source", "bs", source_support)
        source_omits = lambda point: z3.And(
            *(z3.Not(self.same(point, member)) for member in source_support)
        )
        self.add(
            "source_cross_pair_omissions",
            z3.Or(source_omits("p1"), source_omits("p2")),
            z3.Or(source_omits("r1"), source_omits("r2")),
        )
        self.add("canonical_blockers_distinct", self.distinct(["b1", "b2", "bs"]))
        for blocker in ("b1", "b2", "bs"):
            self.add(
                "critical_blocker_not_robust_apices",
                *(z3.Not(self.same(blocker, apex)) for apex in ("a0", "a1", "a2")),
            )

        self.exact4("first_apex_radius", "a0", ("p1", "p2", "p3", "p4"))
        self.exact4("first_apex_rho", "a0", ("r1", "r2", "r3", "r4"))
        self.add("retained_radii_distinct", self.d("a0", "p1") != self.d("a0", "r1"))
        for point in (*retained, "b1", "b2"):
            self.add(
                "singleton_named_trace",
                z3.Implies(
                    z3.Not(self.same(point, "source")),
                    self.d("a0", point) != self.d("a0", "source"),
                ),
            )
        for left, right in itertools.combinations(strict_cap_named, 2):
            self.add(
                "aligned_named_trace",
                z3.Implies(
                    z3.And(
                        z3.Not(self.same(left, right)),
                        self.d("a0", left) == self.d("a0", right),
                    ),
                    z3.Or(
                        self.d("a0", left) == self.d("a0", "p1"),
                        self.d("a0", left) == self.d("a0", "r1"),
                    ),
                ),
            )

        self.add("second_blocker_nonbisector",
                 self.d("b2", "q") != self.d("b2", "other"))

        z_support = ("z", "z2", "z3", "z4")
        self.unique4_projection("z_critical_shell", "bz", z_support)
        self.add(
            "z_blocker_not_robust_apices",
            *(z3.Not(self.same("bz", apex)) for apex in ("a0", "a1", "a2")),
        )
        self.add("z_blocker_not_first", z3.Not(self.same("bz", "b1")))
        if self.z_branch == "reuse-second":
            self.add("z_blocker_branch", self.same("bz", "b2"))
            self.set_equal(
                "z_reused_support",
                ("z", "z2", "z3", "z4"),
                ("r1", "r2", "z", "t"),
            )
        else:
            self.add("z_blocker_branch", z3.Not(self.same("bz", "b2")))

        critical_shells = (
            ("b1", shell1),
            ("b2", shell2),
            ("bs", source_support),
            ("bz", z_support),
        )
        for (left_center, left_support), (right_center, right_support) in (
            itertools.combinations(critical_shells, 2)
        ):
            self.add(
                "critical_shell_coherence",
                self.shell_coherence_formula(
                    left_center, left_support, right_center, right_support,
                ),
            )

        for apex in ("a0", "a1", "a2"):
            for _, support in critical_shells:
                for triple in itertools.combinations(support, 3):
                    self.add(
                        "rich_apex_critical_shell_intersection",
                        z3.Not(
                            z3.And(
                                self.d(apex, triple[0]) == self.d(apex, triple[1]),
                                self.d(apex, triple[0]) == self.d(apex, triple[2]),
                            )
                        ),
                    )

        seed = shell1 + shell2 + source_support
        escape_support = ("escape", "e2", "e3", "e4")
        self.add(
            "escape_center_in_seed",
            z3.Or(*(self.same("be", point) for point in seed)),
        )
        self.add(
            "escape_outside_seed",
            *(z3.Not(self.same("escape", point)) for point in seed),
        )
        for blocker, support in critical_shells:
            self.add(
                "escape_row_shell_intersection",
                self.shell_coherence_formula(
                    "be", escape_support, blocker, support,
                ),
            )

        if self.escape_arm == "critical":
            self.unique4_projection(
                "critical_escape_unique4", "be", escape_support,
            )
            self.add(
                "critical_escape_center_not_robust_apices",
                *(z3.Not(self.same("be", apex)) for apex in ("a0", "a1", "a2")),
            )
        else:
            self.add(
                "robust_escape_selected4",
                self.selected4_formula("be", escape_support),
            )
            self.add(
                "robust_escape_center_not_critical_blockers",
                *(z3.Not(self.same("be", blocker)) for blocker, _ in critical_shells),
            )

    def _add_first_cap_order(self) -> None:
        """Break dihedral symmetry and retain the proven first-cap interval."""
        self.add(
            "mec_order_symmetry",
            self.rank[self.ix("a0")] < self.rank[self.ix("a1")],
            self.rank[self.ix("a1")] < self.rank[self.ix("a2")],
        )
        for point in ("p1", "p2", "r1", "r2", "source", "b1", "b2"):
            self.add(
                "first_cap_strict_interior_order",
                self.rank[self.ix("a1")] < self.rank[self.ix(point)],
                self.rank[self.ix(point)] < self.rank[self.ix("a2")],
            )
        for point in ("p3", "p4", "r3", "r4"):
            self.add(
                "outside_first_strict_cap_order",
                z3.Or(
                    self.rank[self.ix(point)] <= self.rank[self.ix("a1")],
                    self.rank[self.ix("a2")] <= self.rank[self.ix(point)],
                ),
            )
        for point in ("q", "other", "z", "t"):
            self.add(
                "outside_first_closed_cap_order",
                z3.Or(
                    self.rank[self.ix(point)] < self.rank[self.ix("a1")],
                    self.rank[self.ix("a2")] < self.rank[self.ix(point)],
                ),
            )

    def _add_apex_triple_exclusion(self) -> None:
        """Project the live carrier-wide no-common-apex-circle theorem onto W."""
        for center in self.names:
            if center in ("a0", "a1", "a2"):
                continue
            self.add(
                "apex_triple_exclusion",
                z3.Not(
                    z3.And(
                        self.d(center, "a0") == self.d(center, "a1"),
                        self.d(center, "a0") == self.d(center, "a2"),
                    )
                ),
            )

    def payload(
        self,
        status: z3.CheckSatResult,
        elapsed: float,
        refinements: int,
    ) -> dict[str, object]:
        answer: dict[str, object] = {
            "schema": "p97-aligned-singleton-induced-witness-v2",
            "epistemic_status": "INDUCED_NECESSARY_CONDITION_ONLY",
            "status": str(status).upper(),
            "named_occurrences": self.n,
            "z_branch": self.z_branch,
            "escape_arm": self.escape_arm,
            "geometry": self.geometry,
            "constraint_counts": dict(sorted(self.counts.items())),
            "kalmanson_refinements": refinements,
            "kalmanson_order_cuts": len(self.kalmanson_cuts_seen),
            "elapsed_seconds": elapsed,
            "opaque_or_oracular": [
                "CounterexampleData.K4 outside the explicitly named exact shells",
                "FullyDeletionRobustAt beyond its selected escape row",
                "tri-apex richness beyond critical-shell intersection bounds",
                "minimality and the row-escape producer",
                "noM44",
                "MinimalUniqueFourCover and all carrier-wide cover/cardinality facts",
            ],
            "scope_warning": (
                "W is the quotient of named occurrences, not the full carrier D.A; "
                "exact-four and unique-four projections range only over W."
            ),
        }
        if status == z3.sat:
            model = self.solver.model()
            classes: dict[int, list[str]] = {}
            for i, name in enumerate(self.names):
                value = model.eval(self.rank[i], model_completion=True).as_long()
                classes.setdefault(value, []).append(name)
            answer["alias_classes"] = list(classes.values())
        elif status == z3.unknown:
            answer["reason_unknown"] = self.solver.reason_unknown()
        return answer


def smoke_test() -> None:
    """Known hand-check: strict triangle rejects 1 + 1 = 2."""
    solver = z3.Solver()
    x, y, z = z3.Reals("smoke_x smoke_y smoke_z")
    solver.add(x == 1, y == 1, z == 2, x + y > z)
    if solver.check() != z3.unsat:
        raise RuntimeError("strict-triangle smoke test failed")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--z-branch", choices=("reuse-second", "new"), default="new")
    parser.add_argument("--escape-arm", choices=("critical", "robust"), default="critical")
    parser.add_argument(
        "--geometry",
        choices=("triangle", "kalmanson", "fixed-order-kalmanson", "eager-kalmanson"),
        default="kalmanson",
    )
    parser.add_argument("--max-kalmanson-refinements", type=int, default=8)
    parser.add_argument("--self-test", action="store_true")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.self_test:
        smoke_test()
        print(json.dumps({"self_test": "PASS"}))
        return
    started = time.monotonic()
    encoding = InducedEncoding(
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
        z_branch=args.z_branch,
        escape_arm=args.escape_arm,
        geometry=args.geometry,
    )
    refinements = 0
    while True:
        status = encoding.solver.check()
        if status != z3.sat:
            break
        if args.geometry == "fixed-order-kalmanson" and refinements == 0:
            encoding.freeze_order_and_add_kalmanson(encoding.solver.model())
            refinements = 1
            continue
        if args.geometry == "fixed-order-kalmanson":
            break
        if args.geometry != "kalmanson":
            break
        added = encoding.add_lazy_kalmanson_cuts(encoding.solver.model())
        if added == 0:
            break
        refinements += 1
        if refinements >= args.max_kalmanson_refinements:
            status = z3.unknown
            break
    payload = encoding.payload(status, time.monotonic() - started, refinements)
    if args.geometry == "fixed-order-kalmanson" and status == z3.unsat:
        payload["status"] = "UNKNOWN"
        payload["reason_unknown"] = (
            "first quotient/order probe was UNSAT; other alias/order patterns remain"
        )
    if (
        status == z3.unknown
        and args.geometry == "kalmanson"
        and refinements >= args.max_kalmanson_refinements
    ):
        payload["reason_unknown"] = "lazy Kalmanson refinement budget exhausted"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": payload["status"],
        "named_occurrences": payload["named_occurrences"],
        "elapsed_seconds": payload["elapsed_seconds"],
        "output": str(args.output) if args.output else None,
    }, sort_keys=True))


if __name__ == "__main__":
    main()
