#!/usr/bin/env python3
"""Source-faithful bounded global-ingress probe for the FreshThird residual.

This tests the exact n=17 cap profile ``(6, 8, 6)`` and the larger n=19 profile
``(6, 10, 6)``.  The existential Q sources remain free carrier selectors: the
source hypotheses do not put them in the indexed cap.  In particular, the
literal points named ``q1`` and ``q2`` are anonymous cap slots and do not force
a C/Q coincidence at n=17.

In addition to the chosen-row consequence of deletion minimality, the probe
now encodes the two exact retained first-apex classes: each has four points in
the whole carrier, its indexed-cap interior is exactly its named endpoint
pair, and the two radii are distinct.  It then follows the source dichotomy
explicitly: either every repeated indexed-cap-interior radius is retained
(``aligned``), or the two selected C sources share a new radius (``common``).

For chosen-row closure, starting from every carrier point, repeatedly adjoin
the four points in the chosen K4 row at every reached center.  The closure must
be the whole carrier.  If a proper nonempty closure existed, the source theorem
that every proper subset has a center whose every selected four-class escapes
would contradict closure under the chosen rows.

All results remain external bounded-model evidence.  In particular this file
does not provide Lean ingress, exact Euclidean realizability, or a lift to
arbitrary carrier cardinality.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3

import n17_freshthird_incidence_probe as base


ROOT = Path(__file__).resolve().parent
OUT = ROOT / "artifacts-n19-global-ingress"
OUT_N17 = ROOT / "artifacts-n17-global-ingress"


def configure_n17() -> None:
    """Restore the exact n=17 profile with anonymous leftover cap slots."""
    base.N = 17
    base.PROFILE = (6, 8, 6)
    base.NAMES = (
        "a1", "t1", "t2", "t3", "t4", "a2",
        "p1", "p2", "r1", "r2", "q1", "q2", "a3",
        "s1", "s2", "s3", "s4",
    )
    base.IDX = {name: i for i, name in enumerate(base.NAMES)}
    base.APEXES = tuple(base.IDX[x] for x in ("a1", "a2", "a3"))
    base.FIRST_INTERIOR = frozenset(
        base.IDX[x] for x in ("p1", "p2", "r1", "r2", "q1", "q2")
    )
    base.FIRST_CAP = frozenset({base.IDX["a2"], base.IDX["a3"], *base.FIRST_INTERIOR})
    base.P_PAIR = (base.IDX["p1"], base.IDX["p2"])
    base.R_PAIR = (base.IDX["r1"], base.IDX["r2"])
    base.ENDPOINTS = frozenset((*base.P_PAIR, *base.R_PAIR))
    base.ALL = tuple(range(base.N))


def configure_n19() -> None:
    """Configure the generic packet before constructing any model."""
    base.N = 19
    base.PROFILE = (6, 10, 6)
    base.NAMES = (
        "a1", "t1", "t2", "t3", "t4", "a2",
        "p1", "p2", "r1", "r2", "q1", "q2", "x1", "x2",
        "a3", "s1", "s2", "s3", "s4",
    )
    base.IDX = {name: i for i, name in enumerate(base.NAMES)}
    base.APEXES = tuple(base.IDX[x] for x in ("a1", "a2", "a3"))
    base.FIRST_INTERIOR = frozenset(
        base.IDX[x] for x in ("p1", "p2", "r1", "r2", "q1", "q2", "x1", "x2")
    )
    base.FIRST_CAP = frozenset({base.IDX["a2"], base.IDX["a3"], *base.FIRST_INTERIOR})
    base.P_PAIR = (base.IDX["p1"], base.IDX["p2"])
    base.R_PAIR = (base.IDX["r1"], base.IDX["r2"])
    base.ENDPOINTS = frozenset((*base.P_PAIR, *base.R_PAIR))
    base.ALL = tuple(range(base.N))


class FreshThirdN19Global(base.FreshThirdN17):
    """Generic FreshThird packet plus the chosen-row minimality consequence."""

    def __init__(self, timeout_ms: int, *, cyclic_metric: bool = False) -> None:
        assert (base.N, base.PROFILE) in ((17, (6, 8, 6)), (19, (6, 10, 6))), (
            "call configure_n17() or configure_n19() before constructing the global probe"
        )
        super().__init__(timeout_ms=timeout_ms, cyclic_metric=cyclic_metric)
        self._encode_retained_first_apex_classes()
        self._encode_other_apex_rich_classes()
        self._encode_opposite_cap_rich_interior_patterns()
        self._encode_all_source_blocker_cap_localization()
        self._encode_rich_cap_slice_row_localization()
        self._encode_two_circle_intersection_bound()
        self._encode_center_cap_row_hit_bound()
        self._encode_global_chosen_row_closure()

    def _encode_retained_first_apex_classes(self) -> None:
        """Encode the two exact retained classes at ``oppApex1 = a1``.

        These are direct translations of ``hfrontierFour``, ``hρfour``,
        ``hfrontierInteriorEq``, ``hρInteriorEq``, and ``hρne``.  The
        earlier n=17 packet carried generic radius equivalence variables but
        did not connect them to these named source hypotheses.
        """
        a1 = base.IDX["a1"]
        p1, p2 = base.P_PAIR
        r1, r2 = base.R_PAIR
        self.add("retained_P_radius", self.E(a1, p1, p2))
        self.add("retained_R_radius", self.E(a1, r1, r2))
        self.add("retained_radii_distinct", z3.Not(self.E(a1, p1, r1)))
        self.add(
            "retained_P_exact_four",
            z3.PbEq([(self.E(a1, p1, z), 1) for z in base.ALL if z != a1], 4),
        )
        self.add(
            "retained_R_exact_four",
            z3.PbEq([(self.E(a1, r1, z), 1) for z in base.ALL if z != a1], 4),
        )
        for z in base.FIRST_INTERIOR:
            self.add(
                "retained_P_indexed_interior_exact",
                self.E(a1, p1, z) == (z in base.P_PAIR),
            )
            self.add(
                "retained_R_indexed_interior_exact",
                self.E(a1, r1, z) == (z in base.R_PAIR),
            )

    def apex_rich(self, center: int):
        """Exact finite translation of ``ApexRichClassStructure``.

        Every carrier point other than ``center`` determines a positive-radius
        class.  Richness says that one such class has size at least six, or
        that two representatives from distinct classes each have class size
        at least four.
        """
        targets = [point for point in base.ALL if point != center]
        class_ge_six = z3.Or(*(
            z3.PbGe([(self.E(center, anchor, point), 1) for point in targets], 6)
            for anchor in targets
        ))
        two_classes_ge_four = z3.Or(*(
            z3.And(
                z3.Not(self.E(center, left, right)),
                z3.PbGe([(self.E(center, left, point), 1) for point in targets], 4),
                z3.PbGe([(self.E(center, right, point), 1) for point in targets], 4),
            )
            for left, right in itertools.combinations(targets, 2)
        ))
        return z3.Or(class_ge_six, two_classes_ge_four)

    def _encode_other_apex_rich_classes(self) -> None:
        # In this normalized indexing cap 1 is oppIndex1, so cap 0 is the
        # surplus cap opposite a2 and cap 2 is oppIndex2 opposite a3.
        # Richness at a1 already follows from the exact retained classes.
        self.add("surplusApex_rich", self.apex_rich(base.IDX["a2"]))
        self.add("oppApex2_rich", self.apex_rich(base.IDX["a3"]))

    def opposite_cap_rich_interior_pattern(self, center: int, cap_index: int):
        """Branch-preserving rich-class strict-cap pattern.

        The convex-cap theorem uses the same S6/D44 witnesses as full-carrier
        richness: either an at-least-six class contains all four strict-cap
        points, or two distinct at-least-four classes contain exactly two
        strict-cap points each.
        """
        interior_by_cap = {
            0: [base.IDX[f"s{i}"] for i in range(1, 5)],
            1: sorted(base.FIRST_INTERIOR),
            2: [base.IDX[f"t{i}"] for i in range(1, 5)],
        }
        interior = interior_by_cap[cap_index]
        one_radius_four = z3.Or(*(
            z3.And(
                z3.PbGe([
                    (self.E(center, anchor, point), 1)
                    for point in base.ALL if point != center
                ], 6),
                z3.PbEq([(self.E(center, anchor, point), 1) for point in interior], 4),
            )
            for anchor in interior
        ))
        two_radii_two_each = z3.Or(*(
            z3.And(
                z3.Not(self.E(center, left, right)),
                z3.PbGe([
                    (self.E(center, left, point), 1)
                    for point in base.ALL if point != center
                ], 4),
                z3.PbGe([
                    (self.E(center, right, point), 1)
                    for point in base.ALL if point != center
                ], 4),
                z3.PbEq([(self.E(center, left, point), 1) for point in interior], 2),
                z3.PbEq([(self.E(center, right, point), 1) for point in interior], 2),
            )
            for left, right in itertools.combinations(interior, 2)
        ))
        return z3.Or(one_radius_four, two_radii_two_each)

    def _encode_opposite_cap_rich_interior_patterns(self) -> None:
        # cap 0 is the surplus cap opposite a2; cap 2 is the second
        # non-surplus cap opposite a3.
        self.add(
            "surplusApex_oppositeCapRichClassInteriorPattern",
            self.opposite_cap_rich_interior_pattern(base.IDX["a2"], 0),
        )
        self.add(
            "oppApex2_oppositeCapRichClassInteriorPattern",
            self.opposite_cap_rich_interior_pattern(base.IDX["a3"], 2),
        )

    def _encode_all_source_blocker_cap_localization(self) -> None:
        # The three rich apices make every actual blocker avoid the Moser
        # triangle.  The cap partition then puts it in exactly one strict cap.
        for source in base.ALL:
            for center in base.ALL:
                guard = self.b[source, center]
                for cap_index in range(3):
                    self.add(
                        "all_source_blocker_cap_localization",
                        z3.Implies(
                            guard,
                            self.row_cap_is[source, cap_index]
                            == self.cap_interior[cap_index, center],
                        ),
                    )

    def _encode_rich_cap_slice_row_localization(self) -> None:
        rich_caps = ((base.IDX["a2"], 0), (base.IDX["a3"], 2))
        for source in base.ALL:
            for apex, cap_index in rich_caps:
                interior = [
                    point for point in base.ALL
                    if (cap_index == 0 and base.NAMES[point].startswith("s"))
                    or (cap_index == 2 and base.NAMES[point].startswith("t"))
                ]
                for anchor in base.ALL:
                    if anchor == apex:
                        continue
                    full_class_hits = [
                        (z3.And(
                            self.source_row[source, point],
                            self.E(apex, anchor, point),
                        ), 1)
                        for point in base.ALL if point != apex
                    ]
                    cap_slice_hits = [
                        (z3.And(
                            self.source_row[source, point],
                            self.E(apex, anchor, point),
                        ), 1)
                        for point in interior
                    ]
                    self.add(
                        "criticalShell_inter_richClass_card_le_two",
                        z3.PbLe(full_class_hits, 2),
                    )
                    self.add(
                        "two_rich_cap_slice_hits_localize_blocker",
                        z3.Implies(
                            z3.PbGe(cap_slice_hits, 2),
                            self.row_cap_is[source, cap_index],
                        ),
                    )

    def aligned_radii(self):
        """No unnamed first-apex radius has two indexed-cap interior points."""
        a1 = base.IDX["a1"]
        p1 = base.P_PAIR[0]
        r1 = base.R_PAIR[0]
        clauses = []
        for x, y in itertools.combinations(base.FIRST_INTERIOR, 2):
            retained_pair = z3.Or(
                z3.And(self.E(a1, p1, x), self.E(a1, p1, y)),
                z3.And(self.E(a1, r1, x), self.E(a1, r1, y)),
            )
            clauses.append(z3.Implies(self.E(a1, x, y), retained_pair))
        return z3.And(*clauses)

    def aligned_canonical_source_first_apex_singletons(self):
        """Exact indexed-cap intersection of each canonical C-source radius.

        This is the finite translation of
        ``firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned``.  It is
        deliberately added only in the aligned branch.  The clauses are
        logically implied by ``aligned_radii`` together with the retained
        exact-intersection and C-source witness constraints, but recording the
        checked Lean consequence explicitly both tightens propagation and
        keeps the computational ingress contract auditable.
        """
        a1 = base.IDX["a1"]
        clauses = []
        for slot in (0, 1):
            for source in base.ALL:
                chosen = self.c_source_is[slot, source]
                for point in base.FIRST_INTERIOR:
                    clauses.append(
                        z3.Implies(
                            chosen,
                            self.E(a1, source, point) == (point == source),
                        )
                    )
        return z3.And(*clauses)

    def common_new_radius(self):
        """The two chosen C sources share a new first-apex radius."""
        a1 = base.IDX["a1"]
        p1 = base.P_PAIR[0]
        r1 = base.R_PAIR[0]
        clauses = []
        for s, t in itertools.product(base.ALL, repeat=2):
            chosen = z3.And(self.c_source_is[0, s], self.c_source_is[1, t])
            clauses.append(z3.Implies(chosen, self.E(a1, s, t)))
            clauses.append(z3.Implies(chosen, z3.Not(self.E(a1, p1, s))))
            clauses.append(z3.Implies(chosen, z3.Not(self.E(a1, r1, s))))
        return z3.And(*clauses)

    def retained_first_apex_deletion_core(self):
        """Exact finite content of the aligned retained-deletion producer.

        Choose one P endpoint and one Pρ endpoint omitted from C.firstSource's
        selected row.  After deleting them, every first-apex radius class has
        cardinality at most three, while the C row survives because both
        deleted endpoints were outside its exact four-point support.
        """
        a1 = base.IDX["a1"]
        cases = []
        for x in base.P_PAIR:
            for y in base.R_PAIR:
                remaining = [p for p in base.ALL if p not in (a1, x, y)]
                no_first_apex_k4 = z3.And(*(
                    z3.PbLe([(self.E(a1, anchor, p), 1) for p in remaining], 3)
                    for anchor in remaining
                ))
                cases.append(z3.And(
                    z3.Not(self.c_source_row[0, x]),
                    z3.Not(self.c_source_row[0, y]),
                    no_first_apex_k4,
                ))
        return z3.Or(*cases)

    def _encode_global_chosen_row_closure(self) -> None:
        reach = {
            (root, step, p): z3.Bool(f"reach_{root}_{step}_{p}")
            for root in base.ALL for step in range(base.N + 1) for p in base.ALL
        }
        for root in base.ALL:
            for p in base.ALL:
                self.add("minimality_seed", reach[root, 0, p] == (p == root))
            for step in range(base.N):
                for p in base.ALL:
                    generated = z3.Or(*(
                        z3.And(reach[root, step, center], self.m[center, p])
                        for center in base.ALL
                    ))
                    self.add(
                        "minimality_chosen_row_closure",
                        reach[root, step + 1, p]
                        == z3.Or(reach[root, step, p], generated),
                    )
            for p in base.ALL:
                self.add("minimality_no_proper_closure", reach[root, base.N, p])

    def _encode_two_circle_intersection_bound(self) -> None:
        # `SelectedFourClass.inter_card_le_two`: exact selected circles with
        # distinct carrier centers share at most two carrier points.
        for left, right in itertools.combinations(base.ALL, 2):
            self.add(
                "selected_row_inter_card_le_two",
                z3.PbLe([
                    (z3.And(self.m[left, p], self.m[right, p]), 1)
                    for p in base.ALL
                ], 2),
            )

    def _encode_center_cap_row_hit_bound(self) -> None:
        # `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`:
        # if a selected-row center lies in a closed indexed cap, at most two
        # support points of that row lie in the same cap.
        for center in base.ALL:
            for cap_index in range(3):
                self.add(
                    "center_cap_selected_row_hit_le_two",
                    z3.Implies(
                        self.cap[cap_index, center],
                        z3.PbLe([
                            (z3.And(self.m[center, p], self.cap[cap_index, p]), 1)
                            for p in base.ALL
                        ], 2),
                    ),
                )

    def no_named_ingress(self):
        """Negation of the currently proposed named C/Q ingress facts."""
        clauses = []
        for slot in (0, 1):
            for source in base.ALL:
                selected = self.c_source_is[slot, source]
                clauses.extend((
                    z3.Implies(selected, z3.Not(self.q1_row[source])),
                    z3.Implies(selected, self.row_center[source] != self.q1_center),
                    z3.Implies(selected, z3.Not(self.q1_is[source])),
                    z3.Implies(selected, z3.Not(self.q2_is[source])),
                ))
        return z3.And(*clauses)


def status_name(status: z3.CheckSatResult) -> str:
    return "SAT" if status == z3.sat else "UNSAT" if status == z3.unsat else "UNKNOWN"


def run_arm(
    arm: str,
    radius_mode: str,
    timeout_ms: int,
    *,
    cyclic_metric: bool = False,
) -> dict[str, object]:
    probe = FreshThirdN19Global(timeout_ms, cyclic_metric=cyclic_metric)
    probe.add("selected_residual_arm", probe.residual[arm])
    probe.add(
        "selected_radius_mode",
        probe.aligned_radii() if radius_mode == "aligned" else probe.common_new_radius(),
    )
    if radius_mode == "aligned":
        probe.add(
            "aligned_C_source_first_apex_singletons",
            probe.aligned_canonical_source_first_apex_singletons(),
        )
        probe.add(
            "retained_first_apex_deletion_core",
            probe.retained_first_apex_deletion_core(),
        )
    probe.add("negated_named_ingress", probe.no_named_ingress())
    started = time.monotonic()
    status = probe.solver.check()
    row: dict[str, object] = {
        "arm": arm,
        "radius_mode": radius_mode,
        "status": status_name(status),
        "elapsed_ms": int((time.monotonic() - started) * 1000),
        "timeout_ms": timeout_ms,
        "n": base.N,
        "cap_profile": list(base.PROFILE),
        "query": (
            "exact retained first-apex classes, selected aligned/common radius mode, "
            "global chosen-row closure, pairwise selected-row intersection <= 2, "
            "center-cap row-hit <= 2, distinct collision blockers, free Q selectors, "
            "retained-source mutual omissions, no center covering all apices, "
            "exact rich-class alternatives at the second and surplus apices, "
            "their branch-preserving strict-cap patterns and canonical-row localization rules, "
            "aligned retained first-apex deletion core when applicable, and no named C/Q ingress"
        ),
        "constraint_counts": dict(sorted(probe.counts.items())),
        "trust_boundary": (
            f"external Z3 only; bounded n={base.N}; no Lean or universal claim"
        ),
        "cyclic_metric": cyclic_metric,
    }
    if status == z3.sat:
        model = probe.solver.model()
        row["C_sources"] = [
            base.NAMES[next(
                s for s in base.ALL
                if z3.is_true(model.eval(probe.c_source_is[slot, s], model_completion=True))
            )]
            for slot in (0, 1)
        ]
        row["Q_sources"] = [
            base.NAMES[next(
                s for s in base.ALL
                if z3.is_true(model.eval(selector[s], model_completion=True))
            )]
            for selector in (probe.q1_is, probe.q2_is)
        ]
        row["C_centers"] = [
            model.eval(probe.c_center[slot], model_completion=True).as_long()
            for slot in (0, 1)
        ]
        row["Q_center"] = model.eval(probe.q1_center, model_completion=True).as_long()
        if cyclic_metric:
            row["cyclic_order"] = [
                base.NAMES[point]
                for point in sorted(
                    base.ALL,
                    key=lambda point: model.eval(
                        probe.position[point], model_completion=True
                    ).as_long(),
                )
            ]
    elif status == z3.unknown:
        row["reason_unknown"] = probe.solver.reason_unknown()
    return row


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, choices=(17, 19), default=19)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument(
        "--arm",
        choices=base.FreshThirdN17.RESIDUALS,
        help="run only one normalized residual arm",
    )
    parser.add_argument("--radius-mode", choices=("aligned", "common"))
    parser.add_argument(
        "--cyclic-metric",
        action="store_true",
        help="include the source-clean abstract cyclic-order/metric relaxation",
    )
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    if args.n == 17:
        configure_n17()
    else:
        configure_n19()
    out = args.out if args.out is not None else (OUT_N17 if args.n == 17 else OUT)
    arms = (args.arm,) if args.arm else base.FreshThirdN17.RESIDUALS
    radius_modes = (args.radius_mode,) if args.radius_mode else ("aligned", "common")
    rows = [
        run_arm(
            arm,
            mode,
            args.timeout_ms,
            cyclic_metric=args.cyclic_metric,
        )
        for mode in radius_modes
        for arm in arms
    ]
    out.mkdir(parents=True, exist_ok=True)
    artifact = out / f"{time.strftime('%Y%m%dT%H%M%SZ')}.json"
    artifact.write_text(json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "artifact": str(artifact),
        "cases": len(rows),
        "statuses": sorted({row["status"] for row in rows}),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
