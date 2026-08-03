#!/usr/bin/env python3
"""Faithful n=17 incidence probe for the generic FreshThird residual.

This is a bounded external-Z3 model, not a Lean theorem.  It keeps the live
``C`` (two cap sources) and ``Q`` (fresh blocker fiber) packets separate.  In
particular it does not impose the strong-arm exact first-apex classes,
pairwise first-apex radius disequalities, q-shell cap intersection, or the
five-center deletion selector used by the older same-blocker model.

The model is deliberately incidence-first.  It records all fields needed by
``CapSourceThirdCanonicalRowWitness``, ``FreshThirdBlockerFiber``,
``FreshThirdCapSourceInteraction``, and ``FreshThirdNormalizedResidualCase``.
The optional cyclic/metric refinement is labelled separately and never gets
promoted to a Lean claim.  SAT/UNSAT/UNKNOWN is external evidence only.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parent
OUT = ROOT / "artifacts-n17-generic"
N = 17
PROFILE = (6, 8, 6)
NAMES = (
    "a1", "t1", "t2", "t3", "t4", "a2",
    "p1", "p2", "r1", "r2", "q1", "q2", "a3",
    "s1", "s2", "s3", "s4",
)
IDX = {name: i for i, name in enumerate(NAMES)}
APEXES = (IDX["a1"], IDX["a2"], IDX["a3"])
FIRST_INTERIOR = frozenset(IDX[x] for x in ("p1", "p2", "r1", "r2", "q1", "q2"))
FIRST_CAP = frozenset({IDX["a2"], IDX["a3"], *FIRST_INTERIOR})
P_PAIR = (IDX["p1"], IDX["p2"])
R_PAIR = (IDX["r1"], IDX["r2"])
ENDPOINTS = frozenset((*P_PAIR, *R_PAIR))
ALL = tuple(range(N))


def exactly(solver: z3.Solver, terms, k: int) -> None:
    solver.add(z3.PbEq([(term, 1) for term in terms], k))


class FreshThirdN17:
    """The generic n=17 packet with explicit residual tags."""

    TAGS = ("sameBlocker", "sourceRowOmission", "distinctBlockersDifferentCaps",
            "sameCapWithInternalFiberSource")
    RESIDUALS = ("firstNonHit", "secondNonHit", "equalCrossRowCenters")

    def __init__(self, timeout_ms: int = 60_000, cyclic_metric: bool = False) -> None:
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms)
        self.cyclic_metric = cyclic_metric
        self.m = {(c, p): z3.Bool(f"m_{c}_{p}") for c in ALL for p in ALL}
        self.b = {(s, c): z3.Bool(f"b_{s}_{c}") for s in ALL for c in ALL}
        # ``m[c,p]`` is the selected four-class at carrier center ``c``.
        # A source ``s`` uses the row at its actual blocker center, not the
        # row whose center happens to have index ``s``.  Keeping this
        # projection explicit avoids conflating source and blocker vertices.
        self.source_row = {
            (s, p): z3.Bool(f"source_row_{s}_{p}") for s in ALL for p in ALL
        }
        self.eq = {
            (c, x, y): z3.Bool(f"eq_{c}_{x}_{y}")
            for c in ALL for x, y in itertools.combinations((p for p in ALL if p != c), 2)
        }
        self.row_center = {s: z3.Int(f"row_center_{s}") for s in ALL}
        self.row_cap = {s: z3.Int(f"row_cap_{s}") for s in ALL}
        self.row_cap_is = {
            (s, i): z3.Bool(f"row_cap_is_{s}_{i}")
            for s in ALL for i in range(3)
        }
        self.cap = {(i, p): z3.Bool(f"cap_{i}_{p}") for i in range(3) for p in ALL}
        self.cap_interior = {
            (i, p): z3.Bool(f"cap_interior_{i}_{p}") for i in range(3) for p in ALL
        }
        self.q1_is = {s: z3.Bool(f"Q1_is_{s}") for s in ALL}
        self.q2_is = {s: z3.Bool(f"Q2_is_{s}") for s in ALL}
        self.q1_blocker = {c: z3.Bool(f"Q1_blocker_{c}") for c in ALL}
        self.q2_blocker = {c: z3.Bool(f"Q2_blocker_{c}") for c in ALL}
        self.q1_row = {p: z3.Bool(f"Q1_row_{p}") for p in ALL}
        self.q2_row = {p: z3.Bool(f"Q2_row_{p}") for p in ALL}
        self.q1_center = z3.Int("Q1_center")
        self.q2_center = z3.Int("Q2_center")
        self.q1_cap = z3.Int("Q1_cap")
        self.q2_cap = z3.Int("Q2_cap")
        self.interaction = {
            (source, tag): z3.Bool(f"interaction_{source}_{tag}")
            for source in (IDX["q1"], IDX["q2"]) for tag in self.TAGS
        }
        self.residual = {tag: z3.Bool(f"residual_{tag}") for tag in self.RESIDUALS}
        self.cross_hit = {source: z3.Bool(f"cross_hit_{source}")
                          for source in (IDX["q1"], IDX["q2"])}
        # C.firstSource/C.secondSource are independent selectors; they are
        # deliberately not identified with Q.source1/Q.source2.
        self.c_source_is = {
            (slot, s): z3.Bool(f"C{slot + 1}_source_is_{s}")
            for slot in (0, 1) for s in ALL
        }
        self.c_source_row = {
            (slot, p): z3.Bool(f"C{slot + 1}_source_row_{p}")
            for slot in (0, 1) for p in ALL
        }
        self.c_center = {slot: z3.Int(f"C{slot + 1}_center") for slot in (0, 1)}
        self.c_cap = {slot: z3.Int(f"C{slot + 1}_cap") for slot in (0, 1)}
        self.c_survives = {
            (slot, pair): z3.Bool(f"C{slot + 1}_survives_{pair}")
            for slot in (0, 1) for pair in ("P", "R")
        }
        self.deleted = {
            slot: {which: z3.Bool(f"deleted_C{slot + 1}_{which}") for which in ("Q1", "Q2")}
            for slot in (0, 1)
        }
        self.deletion_survives = {
            (slot, which): z3.Bool(f"deletion_survives_C{slot + 1}_{which}")
            for slot in (0, 1) for which in ("Q1", "Q2")
        }
        self.position = {
            v: z3.Int(f"cyclic_position_{v}") for v in ALL
        } if cyclic_metric else {}
        self.distance = {
            (x, y): z3.Real(f"distance_{x}_{y}")
            for x, y in itertools.combinations(ALL, 2)
        } if cyclic_metric else {}
        self.counts: dict[str, int] = {}
        self._encode()

    def add(self, label: str, *constraints) -> None:
        self.solver.add(*constraints)
        self.counts[label] = self.counts.get(label, 0) + len(constraints)

    def E(self, c: int, x: int, y: int):
        if x == y:
            return z3.BoolVal(True)
        if c in (x, y):
            return z3.BoolVal(False)
        return self.eq[c, min(x, y), max(x, y)]

    def dist(self, x: int, y: int):
        if x == y:
            return z3.RealVal(0)
        return self.distance[min(x, y), max(x, y)]

    def crow(self, slot: int, p: int):
        return self.c_source_row[slot, p]

    def same_blocker(self, s: int, t: int, label: str) -> None:
        for c in ALL:
            self.add(label, self.b[s, c] == self.b[t, c])

    def support(self, c: int):
        return {p for p in ALL if p != c}

    def _encode_radius_partitions(self) -> None:
        for c in ALL:
            targets = [p for p in ALL if p != c]
            for x, y, z in itertools.combinations(targets, 3):
                xy, xz, yz = self.E(c, x, y), self.E(c, x, z), self.E(c, y, z)
                self.add("radius_partition", z3.Or(z3.Not(xy), z3.Not(yz), xz))
                self.add("radius_partition", z3.Or(z3.Not(xy), z3.Not(xz), yz))
                self.add("radius_partition", z3.Or(z3.Not(xz), z3.Not(yz), xy))

    def _encode_global_rows_and_blockers(self) -> None:
        for c in ALL:
            self.add("global_K4", z3.Not(self.m[c, c]))
            exactly(self.solver, (self.m[c, p] for p in ALL if p != c), 4)
            self.counts["global_K4"] = self.counts.get("global_K4", 0) + 1
            for x, y in itertools.combinations((p for p in ALL if p != c), 2):
                self.add("global_K4", z3.Or(z3.Not(self.m[c, x]), z3.Not(self.m[c, y]), self.E(c, x, y)))

        for s in ALL:
            exactly(self.solver, (self.b[s, c] for c in ALL if c != s), 1)
            self.counts["critical_blocker_total"] = self.counts.get("critical_blocker_total", 0) + 1
            self.add("critical_blocker_nonself", z3.Not(self.b[s, s]))
            # The chosen critical-shell center is exactly the unique blocker
            # selected by ``b``.  It is a carrier vertex and cannot equal its
            # source (the Lean ``center_mem`` field is an erase witness).
            self.add("blocker_center_range", self.row_center[s] >= 0,
                     self.row_center[s] < N, self.row_center[s] != s)
            for c in ALL:
                self.add("blocker_center_selector",
                         self.b[s, c] == (self.row_center[s] == c))
            for p in ALL:
                self.add(
                    "source_row_projection",
                    self.source_row[s, p] == z3.Or(
                        *(z3.And(self.b[s, c], self.m[c, p]) for c in ALL)
                    ),
                )
            for c in ALL:
                if c == s:
                    continue
                guard = self.b[s, c]
                self.add("critical_support_exact", z3.Or(z3.Not(guard), self.m[c, s]))
                for p in ALL:
                    if p == c:
                        continue
                    rhs = z3.BoolVal(True) if p == s else self.E(c, s, p)
                    self.add("critical_support_exact", z3.Or(z3.Not(guard), self.m[c, p] == rhs))
                remaining = [p for p in ALL if p not in (c, s)]
                for anchor_index, anchor in enumerate(remaining[:-3]):
                    tail = remaining[anchor_index + 1:]
                    self.add(
                        "critical_no_K4_after_source_deletion",
                        z3.Or(z3.Not(guard), z3.PbLe([(self.E(c, anchor, p), 1) for p in tail], 2)),
                    )

    def _encode_caps(self) -> None:
        # Fixed cap labels are the concrete n=17 (6,8,6) specialization.
        cap_sets = (
            {IDX["a1"], *[IDX[f"s{i}"] for i in range(1, 5)], IDX["a3"]},
            set(FIRST_CAP),
            {IDX["a1"], *[IDX[f"t{i}"] for i in range(1, 5)], IDX["a2"]},
        )
        for i, points in enumerate(cap_sets):
            exactly(self.solver, (self.cap[i, p] for p in ALL), len(points))
            for p in ALL:
                self.add("cap_partition", self.cap[i, p] == (p in points))
                self.add("cap_interior_definition", self.cap_interior[i, p] == (p in points and p not in APEXES))
        for p in ALL:
            # Closed caps overlap exactly at the three named apices; every
            # non-apex belongs to one cap and every apex to two caps.
            self.add("cap_partition", z3.PbEq([(self.cap[i, p], 1) for i in range(3)], 2 if p in APEXES else 1))
        self.add("indexed_cap_card_ge_eight", z3.PbGe([(self.cap[1, p], 1) for p in ALL], 8))
        for s in ALL:
            self.add("row_cap_total", z3.And(self.row_cap[s] >= 0, self.row_cap[s] < 3))
            exactly(self.solver, (self.row_cap_is[s, i] for i in range(3)), 1)
            for i in range(3):
                # ``row_cap`` is an abstract cap label for the geometric row
                # center, not the cap membership of the carrier source.  The
                # live Lean packet only asks for center-in-cap data under the
                # two guarded interaction constructors; making this selector
                # iff carrier membership would overconstrain centers (which
                # need not be carrier vertices).
                self.add("row_cap_selector", (self.row_cap[s] == i) == self.row_cap_is[s, i])

    def _encode_q_fiber(self) -> None:
        q1, q2 = IDX["q1"], IDX["q2"]
        # C's two source selectors are independent from Q's fresh-fiber
        # selectors.  In this concrete (6,8,6) lane the admissible carrier
        # choices happen to be q1/q2, but that fact is derived by these
        # selectors and cap/freshness predicates rather than identification.
        exactly(self.solver, (self.c_source_is[0, s] for s in ALL), 1)
        exactly(self.solver, (self.c_source_is[1, s] for s in ALL), 1)
        self.counts["C_source_selectors"] = 2
        for s in ALL:
            self.add("C_source_not_endpoint",
                     z3.Or(z3.Not(self.c_source_is[0, s]), z3.BoolVal(s not in ENDPOINTS)))
            self.add("C_source_not_endpoint",
                     z3.Or(z3.Not(self.c_source_is[1, s]), z3.BoolVal(s not in ENDPOINTS)))
            self.add("C_sources_ne", z3.Or(z3.Not(self.c_source_is[0, s]), z3.Not(self.c_source_is[1, s])))
            self.add("C_source_in_indexed_cap",
                     z3.Or(z3.Not(self.c_source_is[0, s]), self.cap_interior[1, s]))
            self.add("C_source_in_indexed_cap",
                     z3.Or(z3.Not(self.c_source_is[1, s]), self.cap_interior[1, s]))
            for slot in (0, 1):
                self.add("C_source_row_projection",
                         self.c_source_row[slot, s] == z3.Or(
                             *(z3.And(self.c_source_is[slot, t], self.source_row[t, s]) for t in ALL)))
                self.add("C_center_projection",
                         z3.Or(z3.Not(self.c_source_is[slot, s]),
                               self.c_center[slot] == self.row_center[s]))
                self.add("C_cap_projection",
                         z3.Or(z3.Not(self.c_source_is[slot, s]),
                               self.c_cap[slot] == self.row_cap[s]))
        self.same_blocker(IDX["p1"], IDX["p2"], "p_blocker_collision")
        self.same_blocker(IDX["r1"], IDX["r2"], "r_blocker_collision")
        self.add("collision_blockers_distinct", z3.Or(*(
            z3.Or(z3.Not(self.b[IDX["p1"], c]), z3.Not(self.b[IDX["r1"], c])) for c in ALL
        )))

        exactly(self.solver, self.q1_is.values(), 1)
        exactly(self.solver, self.q2_is.values(), 1)
        self.counts["Q_source_selectors"] = 2
        for s in ALL:
            self.add("Q_source_not_endpoint", z3.Or(z3.Not(self.q1_is[s]), z3.BoolVal(s not in ENDPOINTS)))
            self.add("Q_source_not_endpoint", z3.Or(z3.Not(self.q2_is[s]), z3.BoolVal(s not in ENDPOINTS)))
            self.add("Q_sources_ne", z3.Or(z3.Not(self.q1_is[s]), z3.Not(self.q2_is[s])))
            for c in ALL:
                self.add("Q_blocker_projection", self.q1_blocker[c] == z3.Or(*(z3.And(self.q1_is[t], self.b[t, c]) for t in ALL)))
                self.add("Q_blocker_projection", self.q2_blocker[c] == z3.Or(*(z3.And(self.q2_is[t], self.b[t, c]) for t in ALL)))
            self.add("Q_center_projection", z3.Or(z3.Not(self.q1_is[s]), self.q1_center == self.row_center[s]))
            self.add("Q_center_projection", z3.Or(z3.Not(self.q2_is[s]), self.q2_center == self.row_center[s]))
            self.add("Q_cap_projection", z3.Or(z3.Not(self.q1_is[s]), self.q1_cap == self.row_cap[s]))
            self.add("Q_cap_projection", z3.Or(z3.Not(self.q2_is[s]), self.q2_cap == self.row_cap[s]))
            for p in ALL:
                self.add("Q_row_projection", self.q1_row[p] == z3.Or(*(z3.And(self.q1_is[t], self.source_row[t, p]) for t in ALL)))
                self.add("Q_row_projection", self.q2_row[p] == z3.Or(*(z3.And(self.q2_is[t], self.source_row[t, p]) for t in ALL)))
        for c in ALL:
            self.add("Q_equal_actual_blocker", self.q1_blocker[c] == self.q2_blocker[c])
            self.add("Q_blocker_ne_P", z3.Or(z3.Not(self.q1_blocker[c]), z3.Not(self.b[IDX["p1"], c])))
            self.add("Q_blocker_ne_R", z3.Or(z3.Not(self.q1_blocker[c]), z3.Not(self.b[IDX["r1"], c])))
        # Mutual shell membership is explicit, rather than derived from a
        # fixed q-shell intersection.
        self.add("Q_mutual_shell_membership", z3.Or(*(z3.And(self.q1_is[s], self.q2_is[t], self.source_row[s, t]) for s in ALL for t in ALL)))
        self.add("Q_mutual_shell_membership", z3.Or(*(z3.And(self.q2_is[s], self.q1_is[t], self.source_row[s, t]) for s in ALL for t in ALL)))

    def _encode_canonical_sources(self) -> None:
        for slot in (0, 1):
            for source in ALL:
                guard = self.c_source_is[slot, source]
                self.add("C_source_row_card", z3.Or(z3.Not(guard), z3.PbEq([(self.source_row[source, p], 1) for p in ALL], 4)))
                # The source-row center is distinct from both retained
                # blockers and both named robust apices.
                for other in (IDX["p1"], IDX["r1"], IDX["a1"], IDX["a3"]):
                    self.add("C_center_inequalities", z3.Or(z3.Not(guard), self.row_center[source] != self.row_center[other]))
            # CrossPairDeletionView survival is represented explicitly as a
            # named predicate, equivalent to omission of at least one pair
            # endpoint from the selected source row.
            self.add("C_cross_pair_deletion_P",
                     self.c_survives[slot, "P"] == z3.Or(*(z3.Not(self.c_source_row[slot, e]) for e in P_PAIR)))
            self.add("C_cross_pair_deletion_R",
                     self.c_survives[slot, "R"] == z3.Or(*(z3.Not(self.c_source_row[slot, e]) for e in R_PAIR)))
            self.add("C_cross_pair_deletion_P", self.c_survives[slot, "P"])
            self.add("C_cross_pair_deletion_R", self.c_survives[slot, "R"])
            self.add("C_center_range", z3.And(self.c_center[slot] >= 0, self.c_center[slot] < N + 4))

    def _guarded_interaction(self, source: int, tag: str):
        return self.interaction[source, tag]

    def _encode_interactions(self) -> None:
        q1, q2 = IDX["q1"], IDX["q2"]
        for slot, source in enumerate((q1, q2)):
            exactly(self.solver, (self.interaction[source, tag] for tag in self.TAGS), 1)
            same = self._guarded_interaction(source, "sameBlocker")
            omission = self._guarded_interaction(source, "sourceRowOmission")
            distinct = self._guarded_interaction(source, "distinctBlockersDifferentCaps")
            same_cap = self._guarded_interaction(source, "sameCapWithInternalFiberSource")
            q1_in = z3.Or(*(z3.And(self.q1_is[s], self.c_source_row[slot, s]) for s in ALL))
            q2_in = z3.Or(*(z3.And(self.q2_is[s], self.c_source_row[slot, s]) for s in ALL))
            cross_hit = self.cross_hit[source]
            self.add("cross_hit_definition", cross_hit == z3.And(self.c_center[slot] != self.q1_center, q1_in, q2_in))
            self.add("sameBlocker_guard", z3.Or(z3.Not(same), self.c_center[slot] == self.q1_center))
            for p in ALL:
                self.add("sameBlocker_support_eq", z3.Or(z3.Not(same), self.c_source_row[slot, p] == self.q1_row[p]))
            self.add("sourceRowOmission_guard", z3.Or(z3.Not(omission), z3.Or(z3.Not(q1_in), z3.Not(q2_in))))
            self.add("distinct_caps_guard", z3.Or(z3.Not(distinct), self.c_cap[slot] != self.q1_cap))
            # Expand the symbolic cap lookup into three finite cases.
            q1_in_cap = z3.Or(*(z3.And(self.c_cap[slot] == i, self.q1_is[s], self.cap[i, s]) for i in range(3) for s in ALL))
            q2_in_cap = z3.Or(*(z3.And(self.c_cap[slot] == i, self.q2_is[s], self.cap[i, s]) for i in range(3) for s in ALL))
            self.add("same_cap_guard", z3.Or(z3.Not(same_cap), self.c_cap[slot] == self.q1_cap))
            self.add("same_cap_internal_source", z3.Or(z3.Not(same_cap), q1_in_cap, q2_in_cap))
            self.add("omission_deleted_selector", z3.Or(z3.Not(omission), z3.PbEq([(term, 1) for term in self.deleted[slot].values()], 1)))
            self.add("omission_deleted_source_row", z3.Or(z3.Not(omission), z3.Not(self.deleted[slot]["Q1"]), z3.Not(q1_in)))
            self.add("omission_deleted_source_row", z3.Or(z3.Not(omission), z3.Not(self.deleted[slot]["Q2"]), z3.Not(q2_in)))
            # Positive deletion-survival predicates are explicit packet data:
            # deleting the omitted Q point leaves the canonical four-row
            # class at this C center untouched.
            self.add("deletion_survival_Q1", self.deletion_survives[slot, "Q1"] == z3.Not(q1_in))
            self.add("deletion_survival_Q2", self.deletion_survives[slot, "Q2"] == z3.Not(q2_in))
            self.add("omission_deletion_survives", z3.Or(z3.Not(omission),
                z3.And(self.deleted[slot]["Q1"], self.deletion_survives[slot, "Q1"]) ,
                       z3.And(self.deleted[slot]["Q2"], self.deletion_survives[slot, "Q2"])))
            for tag in ("distinctBlockersDifferentCaps", "sameCapWithInternalFiberSource"):
                guard = self.interaction[source, tag]
                self.add("positive_cross_row_membership", z3.Or(z3.Not(guard), q1_in, q2_in))
                for p in ALL:
                    q_endpoint = z3.Or(self.q1_is[p], self.q2_is[p])
                    self.add("positive_overlap_exact", z3.Or(z3.Not(guard), z3.Not(self.c_source_row[slot, p]), z3.Not(self.q1_row[p]), q_endpoint))
            self.add("interaction_nonhit_exclusion", z3.Or(z3.Not(same), z3.Not(omission), z3.Not(cross_hit)))

    def _encode_residual(self) -> None:
        q1, q2 = IDX["q1"], IDX["q2"]
        exactly(self.solver, self.residual.values(), 1)
        first_nonhit, second_nonhit, equal_centers = (self.residual[x] for x in self.RESIDUALS)
        self.add("residual_first_nonhit", z3.Or(z3.Not(first_nonhit), z3.Or(self.interaction[q1, "sameBlocker"], self.interaction[q1, "sourceRowOmission"])))
        self.add("residual_second_nonhit", z3.Or(z3.Not(second_nonhit), z3.Or(self.interaction[q2, "sameBlocker"], self.interaction[q2, "sourceRowOmission"])))
        # The equal-center constructor is a positive packet: both C-source
        # rows must be genuine cross-row hits, and their centers must agree.
        self.add("residual_equal_centers", z3.Or(z3.Not(equal_centers), self.cross_hit[q1]))
        self.add("residual_equal_centers", z3.Or(z3.Not(equal_centers), self.cross_hit[q2]))
        self.add("residual_equal_centers", z3.Or(z3.Not(equal_centers), self.c_center[0] == self.c_center[1]))

    def _between(self, left: int, right: int, point: int):
        """Open-arc membership in the normalized linear cut of the cycle."""
        return z3.Or(
            z3.And(self.position[left] < self.position[point],
                   self.position[point] < self.position[right]),
            z3.And(self.position[right] < self.position[point],
                   self.position[point] < self.position[left]),
        )

    def _encode_cyclic_metric(self) -> None:
        """Add the bounded convex-order/metric refinement for one n=17 lane.

        The cap blocks are normalized only up to their internal order.  The
        shared-pair separator is the source-clean alternating-order
        consequence of two selected four-classes.  The two guarded strict
        Kalmanson inequalities are restricted to the equal-center,
        both-cross-hit arm and the two valid consecutive-center orientations;
        interleaving orders remain in the model.
        """
        for v in ALL:
            self.add("cyclic_position_range", self.position[v] >= 0,
                     self.position[v] < N)
        self.add("cyclic_position_permutation", z3.Distinct(*self.position.values()))
        self.add("cyclic_position_fixed_apex", self.position[APEXES[0]] == 0)
        self.add("cyclic_position_fixed_apex", self.position[APEXES[1]] == 5)
        self.add("cyclic_position_fixed_apex", self.position[APEXES[2]] == 12)
        blocks = (
            (tuple(IDX[f"t{i}"] for i in range(1, 5)), 1, 4),
            (tuple(IDX[x] for x in ("p1", "p2", "r1", "r2", "q1", "q2")), 6, 11),
            (tuple(IDX[f"s{i}"] for i in range(1, 5)), 13, 16),
        )
        for block, lower, upper in blocks:
            for v in block:
                self.add("cyclic_position_cap_block", self.position[v] >= lower,
                         self.position[v] <= upper)
            self.add("cyclic_position_cap_block", z3.Distinct(*(self.position[v] for v in block)))

        # Every Boolean radius equality is realized by the metric relaxation.
        # The reverse implication is intentionally omitted: this is a
        # fail-closed relaxation, so SAT cannot be mistaken for Euclidean
        # realizability while an UNSAT result still reflects the added cut.
        for c in ALL:
            for x, y in itertools.combinations((p for p in ALL if p != c), 2):
                self.add("metric_radius_equality",
                         z3.Or(z3.Not(self.E(c, x, y)),
                               self.dist(c, x) == self.dist(c, y)))
        for x, y in itertools.combinations(ALL, 2):
            self.add("metric_positive_distance", self.dist(x, y) > 0)
        for x, y, z in itertools.permutations(ALL, 3):
            self.add("metric_triangle",
                     self.dist(x, z) <= self.dist(x, y) + self.dist(y, z))

        # Source-clean selected-row shared-pair alternation.  This is kept
        # separate from the targeted Kalmanson consumer below.
        for c, d in itertools.combinations(ALL, 2):
            for x, y in itertools.combinations((p for p in ALL if p not in (c, d)), 2):
                common = z3.And(self.m[c, x], self.m[c, y],
                                self.m[d, x], self.m[d, y])
                self.add(
                    "cyclic_shared_pair_separator",
                    z3.Or(z3.Not(common),
                          z3.Xor(self._between(c, d, x),
                                 self._between(c, d, y))),
                )

        # Equal-center residual: c is the common C-row blocker, q is the Q
        # blocker, and u/v are the fresh pair.  Only c<q<u<v and its reversal
        # are the consecutive-center orders consumed by the strict Kalmanson
        # theorem; no blanket dihedral relabelling is imposed.
        q1, q2 = IDX["q1"], IDX["q2"]
        u, v = q1, q2
        for c, q in itertools.permutations(ALL, 2):
            center_guard = z3.And(
                self.residual["equalCrossRowCenters"],
                self.c_center[0] == c,
                self.c_center[1] == c,
                self.q1_center == q,
                self.q1_row[u], self.q1_row[v],
                self.c_source_row[0, u], self.c_source_row[0, v],
                self.c_source_row[1, u], self.c_source_row[1, v],
            )
            self.add(
                "metric_kalmanson_equal_center_forward",
                z3.Implies(
                    z3.And(center_guard,
                          self.position[c] < self.position[q],
                          self.position[q] < self.position[u],
                          self.position[u] < self.position[v]),
                    self.dist(q, u) + self.dist(c, v) <
                    self.dist(c, u) + self.dist(q, v),
                ),
            )
            self.add(
                "metric_kalmanson_equal_center_reverse",
                z3.Implies(
                    z3.And(center_guard,
                          self.position[q] < self.position[c],
                          self.position[c] < self.position[v],
                          self.position[v] < self.position[u]),
                    self.dist(c, v) + self.dist(q, u) <
                    self.dist(q, v) + self.dist(c, u),
                ),
            )

    def _encode(self) -> None:
        self._encode_radius_partitions()
        self._encode_caps()
        self._encode_global_rows_and_blockers()
        self._encode_q_fiber()
        self._encode_canonical_sources()
        self._encode_interactions()
        self._encode_residual()
        if self.cyclic_metric:
            self._encode_cyclic_metric()

    def run(self, run_dir: Path) -> dict[str, object]:
        started = time.monotonic()
        status = self.solver.check()
        status_name = "SAT" if status == z3.sat else "UNSAT" if status == z3.unsat else "UNKNOWN"
        result: dict[str, object] = {
            "schema": "p97-freshthird-n17-generic-incidence-v2",
            "status": status_name,
            "n": N,
            "cap_profile": list(PROFILE),
            "constraint_counts": dict(sorted(self.counts.items())),
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "trust_boundary": {
                "lean_kernel_proof": False,
                "external_solver_only": True,
                "universal_n_claim": False,
            },
            "omitted": ["coordinates", "QF_NRA geometry", "Lean ingress", "universal_n"],
            "cyclic_metric": self.cyclic_metric,
        }
        if status == z3.sat:
            model = self.solver.model()
            result["residual_mode"] = next(tag for tag, term in self.residual.items() if z3.is_true(model.eval(term, model_completion=True)))
            result["C_sources"] = [
                NAMES[next(s for s in ALL if z3.is_true(model.eval(self.c_source_is[slot, s], model_completion=True)))]
                for slot in (0, 1)
            ]
            result["Q_sources"] = [
                NAMES[next(s for s in ALL if z3.is_true(model.eval(self.q1_is[s], model_completion=True)))],
                NAMES[next(s for s in ALL if z3.is_true(model.eval(self.q2_is[s], model_completion=True)))],
            ]
        run_dir.mkdir(parents=True, exist_ok=True)
        (run_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
        return result


def self_check() -> dict[str, object]:
    assert N == 17 and PROFILE == (6, 8, 6)
    assert len(FIRST_INTERIOR - ENDPOINTS) == 2
    assert FIRST_INTERIOR - ENDPOINTS == {IDX["q1"], IDX["q2"]}
    return {"status": "PASS", "carrier": N, "profile": PROFILE, "C_selectors": "independent"}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--cyclic-metric", action="store_true")
    args = parser.parse_args()
    if not (args.self_check or args.run):
        parser.error("choose --self-check or --run")
    print(json.dumps(self_check(), sort_keys=True))
    if args.run:
        result = FreshThirdN17(args.timeout_ms, cyclic_metric=args.cyclic_metric).run(OUT / time.strftime("%Y%m%dT%H%M%SZ"))
        print(json.dumps({"status": result["status"], "artifact": str(OUT)}, sort_keys=True))


if __name__ == "__main__":
    main()
