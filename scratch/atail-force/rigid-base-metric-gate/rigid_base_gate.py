#!/usr/bin/env python3
"""Rigid-base (6,6,6) metric-realizability gate at n=15 for Erdos 97.

The rigid base case of the all-large-caps terminal is: 15 points in strictly
convex position, an inscribed non-obtuse Moser triangle whose three chords cut
the carrier into three caps of cardinality exactly 6, the global K4 property
(every point has at least four other points equidistant from it), and full
deletion robustness at two of the three triangle apices.

This script decides whether that configuration admits an EXACT RATIONAL
ABSTRACT-DISTANCE SHADOW: an assignment of positive rationals to the 105
unordered pairs that satisfies every strict triangle inequality, both strict
Kalmanson inequalities on every cyclic quadruple of the boundary order, and all
co-radiality equations forced by a Boolean incidence model.

Kalmanson plus triangle are NECESSARY but NOT SUFFICIENT for strictly convex
planar realizability.  A SAT verdict is therefore an exact rational
abstract-distance shadow and nothing more: not a planar Euclidean realization,
not a counterexample to Erdos 97.  An UNSAT verdict is a bounded solver verdict
over exactly the encoded surface listed in the result payload.  UNKNOWN means
timeout and is reported as UNKNOWN.

Run `--mode smoke` first.  Every downstream verdict is void if the smoke
battery does not pass.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import time
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence

import z3

# ---------------------------------------------------------------------------
# Configuration of the rigid base case.
# ---------------------------------------------------------------------------

N = 15
VERTICES = tuple(range(N))

# Boundary cyclic order is 0,1,...,14.  The three Moser-triangle apices sit at
# 0, 5, 10, so each closed cap is a contiguous block of six boundary vertices
# and |P1| + |P2| + |P3| = 18 = |A| + 3.
APICES = (0, 5, 10)
CAP_A = (0, 1, 2, 3, 4, 5)          # endpoints 0, 5   ; opposite apex 10
CAP_B = (5, 6, 7, 8, 9, 10)         # endpoints 5, 10  ; opposite apex 0
CAP_C = (10, 11, 12, 13, 14, 0)     # endpoints 10, 0  ; opposite apex 5
CAPS = {"C_A": CAP_A, "C_B": CAP_B, "C_C": CAP_C}
CAP_ENDPOINTS = {"C_A": (0, 5), "C_B": (5, 10), "C_C": (10, 0)}
CAP_INTERIOR = {name: tuple(p for p in block if p not in CAP_ENDPOINTS[name])
                for name, block in CAPS.items()}

# Cap opposite each apex, and that cap's four interior points.
OPPOSITE_CAP = {0: "C_B", 5: "C_C", 10: "C_A"}
# Caps having the apex as a chord endpoint.
ADJACENT_CAPS = {0: ("C_A", "C_C"), 5: ("C_A", "C_B"), 10: ("C_B", "C_C")}

# The two apices carrying full deletion robustness.  Under the order-5 rotation
# 0 -> 5 -> 10 -> 0 the abstract encoding is symmetric, so every unordered pair
# of apices is equivalent; {0, 5} is therefore without loss of generality.
ROBUST_APICES = (0, 5)

HERE = Path(__file__).resolve().parent
MINED_BANK = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)


# ---------------------------------------------------------------------------
# Small helpers.
# ---------------------------------------------------------------------------


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance edge loop")
    return (left, right) if left < right else (right, left)


def qval(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def qstr(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def bounded_ms(default_ms: int, deadline: float) -> int | None:
    remaining = int((deadline - time.monotonic()) * 1000)
    if remaining <= 0:
        return None
    return max(1, min(default_ms, remaining))


def cap_of_point(point: int) -> tuple[str, ...]:
    return tuple(name for name, block in CAPS.items() if point in block)


# ---------------------------------------------------------------------------
# Boolean incidence layer.
# ---------------------------------------------------------------------------
#
# Variables (all Boolean, keyed by hashable tuples so that metric-layer unsat
# cores can be lifted back to Boolean literals):
#
#   ("m", c, p)      : p belongs to the selected K4 co-radial row at center c
#   ("rA", u, p)     : p belongs to the first selected radius class at apex u
#   ("rB", u, p)     : p belongs to the second selected radius class at apex u
#   ("single", u)    : apex u is in SINGLE mode (one class of size >= 5)
#
# Robustness at an apex u says: for every deleted z, A \ {z} still contains four
# points equidistant from u.  Since radius classes at u are disjoint, this holds
# iff u carries a class of size >= 5 or two distinct classes each of size >= 4.
# (=>) if every class has size <= 4 and at most one has size 4, delete a member
# of that class; (<=) a class of size >= 5 survives any single deletion, and of
# two disjoint classes of size >= 4 at most one can be hit.  The Boolean layer
# therefore carries SINGLE mode (|rA| >= 5, rB empty) or TWIN mode
# (|rA| = |rB| = 4, disjoint).  Two disjoint co-radial 4-sets with a common
# radius merge into a class of size 8 >= 5, so TWIN mode is sound even without
# asserting that the two radii differ; exactness (see below) does assert it.
#
# The literal quantifier-for-quantifier statement is re-checked exactly, on the
# concrete rational model, in `verify_exact_shadow`.


class Outer:
    """Boolean incidence model for the rigid base case."""

    def __init__(
        self,
        timeout_ms: int,
        random_seed: int,
        engine: str = "qffd",
        use_cap_hit_bounds: bool = True,
        use_bisector_alternation: bool = True,
        use_cap_injectivity: bool = True,
        row_centers: Iterable[int] | None = None,
    ) -> None:
        self.solver = z3.SolverFor("QF_FD") if engine == "qffd" else z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.use_cap_hit_bounds = use_cap_hit_bounds
        self.use_bisector_alternation = use_bisector_alternation
        self.use_cap_injectivity = use_cap_injectivity
        # Centers at which the K4 hypothesis is actually imposed.  Dropping a
        # center is a sound RELAXATION: every solution of the full problem
        # yields one of the relaxation by emptying the dropped rows, so UNSAT of
        # a relaxation transfers upward to the full problem.  SAT of a
        # relaxation transfers nowhere.
        self.row_centers = (frozenset(VERTICES) if row_centers is None
                            else frozenset(row_centers))
        self.vars: dict[tuple, z3.BoolRef] = {}
        for c in VERTICES:
            for p in VERTICES:
                self.vars[("m", c, p)] = z3.Bool(f"m_{c}_{p}")
        for u in ROBUST_APICES:
            for p in VERTICES:
                self.vars[("rA", u, p)] = z3.Bool(f"rA_{u}_{p}")
                self.vars[("rB", u, p)] = z3.Bool(f"rB_{u}_{p}")
            self.vars[("single", u)] = z3.Bool(f"single_{u}")
        self._add_base()

    def v(self, key: tuple) -> z3.BoolRef:
        return self.vars[key]

    # -- base structural constraints -------------------------------------

    def _add_base(self) -> None:
        s = self.solver
        m = lambda c, p: self.vars[("m", c, p)]

        # (B1) K4 hypothesis: one selected co-radial 4-row at every center.
        for c in VERTICES:
            s.add(z3.Not(m(c, c)))
            if c in self.row_centers:
                s.add(z3.PbEq([(m(c, p), 1) for p in VERTICES], 4))
            else:
                for p in VERTICES:
                    s.add(z3.Not(m(c, p)))

        # (B2) Two distinct centers determine two distinct circles, which meet
        # in at most two points.
        for c1, c2 in itertools.combinations(VERTICES, 2):
            s.add(z3.PbLe([(z3.And(m(c1, p), m(c2, p)), 1) for p in VERTICES], 2))

        # (B3) Centers equidistant from a fixed pair lie on that pair's
        # perpendicular bisector, a line, which meets a strictly convex point
        # set in at most two points.
        for p1, p2 in itertools.combinations(VERTICES, 2):
            s.add(z3.PbLe([(z3.And(m(c, p1), m(c, p2)), 1) for c in VERTICES], 2))

        # (B4) If c1 and c2 both bisect the pair {p1, p2}, the line c1c2 is that
        # perpendicular bisector and separates p1 from p2, so exactly one of
        # p1, p2 lies on the open boundary arc from c1 to c2.
        if self.use_bisector_alternation:
            for c1, c2 in itertools.combinations(VERTICES, 2):
                rest = [p for p in VERTICES if p not in (c1, c2)]
                for p1, p2 in itertools.combinations(rest, 2):
                    if (c1 < p1 < c2) == (c1 < p2 < c2):
                        s.add(z3.Not(z3.And(m(c1, p1), m(c1, p2),
                                            m(c2, p1), m(c2, p2))))

        # (B5) Cap-local row-hit bounds (imported premise; see REPORT.md).
        #   - a co-radial class centred inside a cap meets that cap in <= 2 pts
        #   - a co-radial class centred at a chord endpoint of a cap meets that
        #     cap in <= 1 point
        if self.use_cap_hit_bounds:
            for name, block in CAPS.items():
                ends = CAP_ENDPOINTS[name]
                for c in block:
                    bound = 1 if c in ends else 2
                    s.add(z3.PbLe([(m(c, p), 1) for p in block if p != c], bound))
                # (B6) Two centers of one cap cannot share a pair outside that
                # cap.  This is (B4) restated for the wrap-around cap block.
                outside = [p for p in VERTICES if p not in block]
                for c1, c2 in itertools.combinations(block, 2):
                    for p1, p2 in itertools.combinations(outside, 2):
                        s.add(z3.Not(z3.And(m(c1, p1), m(c1, p2),
                                            m(c2, p1), m(c2, p2))))

        # (B5') Boolean projection of one-sided cap-distance injectivity: a
        # co-radial class at a center c of a cap chain has at most one member
        # strictly before c and at most one strictly after c within that chain.
        # This subsumes (B5) and also forbids same-side pairs, which a pure
        # counting bound cannot express.
        if self.use_cap_injectivity:
            for name, chain in CAPS.items():
                for pos, c in enumerate(chain):
                    for members in (chain[:pos], chain[pos + 1:]):
                        for r, t in itertools.combinations(members, 2):
                            s.add(z3.Not(z3.And(m(c, r), m(c, t))))

        # (B7) Full deletion robustness at the two designated apices.
        for u in ROBUST_APICES:
            rA = lambda p, u=u: self.vars[("rA", u, p)]
            rB = lambda p, u=u: self.vars[("rB", u, p)]
            single = self.vars[("single", u)]
            s.add(z3.Not(rA(u)), z3.Not(rB(u)))
            s.add(z3.Implies(single, z3.PbGe([(rA(p), 1) for p in VERTICES], 5)))
            for p in VERTICES:
                s.add(z3.Implies(single, z3.Not(rB(p))))
            s.add(z3.Implies(z3.Not(single),
                             z3.PbEq([(rA(p), 1) for p in VERTICES], 4)))
            s.add(z3.Implies(z3.Not(single),
                             z3.PbEq([(rB(p), 1) for p in VERTICES], 4)))
            for p in VERTICES:
                s.add(z3.Implies(z3.Not(single), z3.Not(z3.And(rA(p), rB(p)))))
            # The selected K4 row at u is a 4-subset of a radius class at u; we
            # name the class containing it rA.
            for p in VERTICES:
                s.add(z3.Implies(m(u, p), rA(p)))
            if self.use_cap_hit_bounds:
                # A class at the chord endpoint u meets each adjacent cap in at
                # most one point.
                for cap_name in ADJACENT_CAPS[u]:
                    block = [p for p in CAPS[cap_name] if p != u]
                    s.add(z3.PbLe([(rA(p), 1) for p in block], 1))
                    s.add(z3.PbLe([(rB(p), 1) for p in block], 1))
                # (B2) and (B3) transferred to the complete apex classes.
                for c in VERTICES:
                    if c == u:
                        continue
                    s.add(z3.PbLe([(z3.And(rA(p), m(c, p)), 1)
                                   for p in VERTICES], 2))
                    s.add(z3.PbLe([(z3.And(rB(p), m(c, p)), 1)
                                   for p in VERTICES], 2))
            if self.use_cap_injectivity:
                for name, chain in CAPS.items():
                    if u not in chain:
                        continue
                    pos = chain.index(u)
                    for members in (chain[:pos], chain[pos + 1:]):
                        for r, t in itertools.combinations(members, 2):
                            s.add(z3.Not(z3.And(rA(r), rA(t))))
                            s.add(z3.Not(z3.And(rB(r), rB(t))))
            if self.use_bisector_alternation:
                for c in VERTICES:
                    if c == u:
                        continue
                    lo, hi = (u, c) if u < c else (c, u)
                    for p1, p2 in itertools.combinations(
                        [p for p in VERTICES if p not in (u, c)], 2
                    ):
                        if (lo < p1 < hi) == (lo < p2 < hi):
                            s.add(z3.Not(z3.And(rA(p1), rA(p2),
                                                m(c, p1), m(c, p2))))
                            s.add(z3.Not(z3.And(rB(p1), rB(p2),
                                                m(c, p1), m(c, p2))))

    # -- decoding and cuts ------------------------------------------------

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        def truth(key: tuple) -> bool:
            return z3.is_true(model.eval(self.vars[key], model_completion=True))

        rows = {}
        for c in VERTICES:
            support = tuple(p for p in VERTICES if truth(("m", c, p)))
            expected = 4 if c in self.row_centers else 0
            if len(support) != expected or c in support:
                raise AssertionError(f"bad selected row at {c}: {support}")
            if support:
                rows[c] = support
        apex = {}
        for u in ROBUST_APICES:
            single = truth(("single", u))
            a = tuple(p for p in VERTICES if truth(("rA", u, p)))
            b = () if single else tuple(p for p in VERTICES if truth(("rB", u, p)))
            apex[u] = {"mode": "SINGLE" if single else "TWIN", "A": a, "B": b}
        return {"rows": rows, "apex": apex,
                "row_centers": tuple(sorted(self.row_centers))}

    def add_literal_cut(self, literals: Iterable[tuple[tuple, bool]]) -> None:
        disjuncts = []
        for key, polarity in sorted(set(literals)):
            var = self.vars[key]
            disjuncts.append(z3.Not(var) if polarity else var)
        if not disjuncts:
            raise AssertionError("empty cut would close the search vacuously")
        self.solver.add(z3.Or(*disjuncts))

    def add_membership_closure(
        self, applications: Sequence[tuple[tuple[int, int], ...]]
    ) -> None:
        batch: list[z3.BoolRef] = []
        for memberships in applications:
            batch.append(z3.Or(*(
                z3.Not(self.vars[("m", c, p)]) for c, p in memberships
            )))
            if len(batch) >= 2000:
                self.solver.add(*batch)
                batch.clear()
        if batch:
            self.solver.add(*batch)

    def block_complete(self, decoded: dict[str, object]) -> None:
        literals: list[tuple[tuple, bool]] = []
        for c, support in decoded["rows"].items():
            for p in VERTICES:
                literals.append((("m", c, p), p in support))
        for u, record in decoded["apex"].items():
            literals.append((("single", u), record["mode"] == "SINGLE"))
            for p in VERTICES:
                literals.append((("rA", u, p), p in record["A"]))
                literals.append((("rB", u, p), p in record["B"]))
        self.add_literal_cut(literals)


# ---------------------------------------------------------------------------
# Exact metric layer over the rationals (QF_LRA).
# ---------------------------------------------------------------------------
#
# All constraints are homogeneous of degree one in the distances, so scaling a
# strict solution makes every strict slack at least 1.  Normalizing to integral
# slack >= 1 is therefore without loss of generality and keeps the whole solve
# inside exact linear rational arithmetic.


def distance_table() -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (a, b): z3.Real(f"d_{a}_{b}")
        for a, b in itertools.combinations(VERTICES, 2)
    }


def dist(table, a: int, b: int):
    if a == b:
        return z3.RealVal(0)
    return table[edge(a, b)]


class Tracked:
    __slots__ = ("name", "formula", "kind", "literals")

    def __init__(self, name, formula, kind, literals=()):
        self.name = name
        self.formula = formula
        self.kind = kind
        self.literals = tuple(literals)


def base_surface(table) -> list[Tracked]:
    """Positivity, strict triangle, both strict Kalmanson.  Model independent."""
    out: list[Tracked] = []
    for (a, b), var in table.items():
        out.append(Tracked(f"pos_{a}_{b}", var >= 1, "positivity"))
    for a, b, c in itertools.combinations(VERTICES, 3):
        out.append(Tracked(f"tri0_{a}_{b}_{c}",
                           dist(table, a, b) + dist(table, b, c)
                           >= dist(table, a, c) + 1, "strict_triangle"))
        out.append(Tracked(f"tri1_{a}_{b}_{c}",
                           dist(table, a, c) + dist(table, b, c)
                           >= dist(table, a, b) + 1, "strict_triangle"))
        out.append(Tracked(f"tri2_{a}_{b}_{c}",
                           dist(table, a, b) + dist(table, a, c)
                           >= dist(table, b, c) + 1, "strict_triangle"))
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diag = dist(table, a, c) + dist(table, b, d)
        out.append(Tracked(f"kal1_{a}_{b}_{c}_{d}",
                           diag >= dist(table, a, b) + dist(table, c, d) + 1,
                           "kalmanson_first"))
        out.append(Tracked(f"kal2_{a}_{b}_{c}_{d}",
                           diag >= dist(table, a, d) + dist(table, b, c) + 1,
                           "kalmanson_second"))
    return out


def cap_injectivity_surface(table) -> list[Tracked]:
    """One-sided cap-distance injectivity, radius generic and model independent.

    Imported premise, proven sorry-free in the production Lean tree as
    `Problem97.CGN.CGN6c_oneSidedDistanceInjective`
    (`lean/Erdos9796Proof/P97/CGN/CGN6.lean:1505`), transported to an
    unnormalized ordered cap by
    `Problem97.CGN.oneSidedDistanceInjective_of_mecCapPacket`
    (`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:29`):

        j < r < s  ->  dist(p_j, p_r) != dist(p_j, p_s)
        r < s < j  ->  dist(p_j, p_r) != dist(p_j, p_s)

    for indices along one ordered cap chain.  The geometric source is that a
    minor-cap chain is nonacute at every middle vertex, which is where the
    non-obtuse Moser triangle hypothesis enters this encoding.  It implies both
    Boolean cap-hit bounds (at most two cap hits from a center inside the cap,
    at most one from a chord endpoint) and is strictly stronger.
    """
    out: list[Tracked] = []
    for name, chain in CAPS.items():
        for pos, center in enumerate(chain):
            for side, members in (("after", chain[pos + 1:]),
                                  ("before", chain[:pos])):
                for r, s in itertools.combinations(members, 2):
                    out.append(Tracked(
                        f"capinj_{name}_{center}_{side}_{r}_{s}",
                        dist(table, center, r) != dist(table, center, s),
                        "one_sided_cap_injectivity",
                    ))
    return out


def model_equalities(decoded, table) -> list[Tracked]:
    """Co-radiality equations forced by the Boolean incidence model."""
    out: list[Tracked] = []
    for c, support in decoded["rows"].items():
        ref = support[0]
        for p in support[1:]:
            out.append(Tracked(
                f"row_{c}_{ref}_{p}",
                dist(table, c, p) == dist(table, c, ref),
                "selected_row_equality",
                ((("m", c, ref), True), (("m", c, p), True)),
            ))
    for u, record in decoded["apex"].items():
        for tag, members in (("rA", record["A"]), ("rB", record["B"])):
            if len(members) < 2:
                continue
            ref = members[0]
            for p in members[1:]:
                out.append(Tracked(
                    f"apex{tag}_{u}_{ref}_{p}",
                    dist(table, u, p) == dist(table, u, ref),
                    "apex_class_equality",
                    (((tag, u, ref), True), ((tag, u, p), True)),
                ))
    return out


def model_exactness(decoded, table) -> list[Tracked]:
    """The two robust-apex classes are FULL radius classes.

    Sound as a necessary condition: given robustness at u, choose rA (and rB)
    to be complete radius classes of u.  A class of size >= 5 gives SINGLE
    mode; two complete classes of size >= 4 give TWIN mode, and the cap-hit
    bound then pins both to size exactly 4.
    """
    out: list[Tracked] = []
    for u, record in decoded["apex"].items():
        classes = [("rA", record["A"])]
        if record["mode"] == "TWIN":
            classes.append(("rB", record["B"]))
        for tag, members in classes:
            ref = members[0]
            for p in VERTICES:
                if p == u or p in members:
                    continue
                out.append(Tracked(
                    f"exact{tag}_{u}_{p}",
                    dist(table, u, p) != dist(table, u, ref),
                    "apex_class_exactness",
                    (((tag, u, ref), True), ((tag, u, p), False)),
                ))
        if record["mode"] == "TWIN":
            out.append(Tracked(
                f"apexsplit_{u}",
                dist(table, u, record["A"][0]) != dist(table, u, record["B"][0]),
                "apex_class_split",
                ((("rA", u, record["A"][0]), True),
                 (("rB", u, record["B"][0]), True),
                 (("single", u), False)),
            ))
    return out


def solve_tracked(
    constraints: Sequence[Tracked],
    timeout_ms: int,
    random_seed: int,
    want_core: bool,
) -> dict[str, object]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=random_seed)
    index = {}
    for item in constraints:
        index[item.name] = item
        if want_core:
            solver.assert_and_track(item.formula, z3.Bool(item.name))
        else:
            solver.add(item.formula)
    status = solver.check()
    if status == z3.unsat:
        core = tuple(sorted(str(x) for x in solver.unsat_core())) if want_core else ()
        return {"status": "UNSAT", "core": core, "index": index}
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    return {"status": "SAT", "model": solver.model()}


def minimize_core(
    core: Sequence[str],
    index: dict[str, Tracked],
    deadline: float,
    random_seed: int,
) -> tuple[str, ...]:
    """Deterministic forward/backward deletion minimization inside budget."""
    active = list(core)
    for name in list(core):
        if name not in active:
            continue
        budget = bounded_ms(3000, deadline)
        if budget is None:
            break
        trial = [x for x in active if x != name]
        replay = z3.Solver()
        replay.set(timeout=budget, random_seed=random_seed)
        replay.add(*(index[x].formula for x in trial))
        if replay.check() == z3.unsat:
            active = trial
    return tuple(sorted(active))


# ---------------------------------------------------------------------------
# Core transport (canonical boundary-order schemas).
# ---------------------------------------------------------------------------


def reflected_schema(k: int, schema: Sequence[tuple[int, int]]):
    return tuple(sorted((k - 1 - c, k - 1 - p) for c, p in schema))


def canonical_row_schema(
    core: Sequence[str], index: dict[str, Tracked]
) -> dict[str, object] | None:
    """Canonical boundary-order schema of a core, or None if it cannot transport.

    A core transports to every increasing embedding and to the reflection only
    when every constraint in it is invariant under order-preserving relabelling
    of the boundary: positivity, strict triangle, both strict Kalmanson, and
    selected-row equalities.  Cap-injectivity constraints are attached to a
    specific cap block and apex-class constraints to a specific apex, so a core
    touching either is NOT transportable -- it still yields a sound literal cut,
    just not a schema closure.
    """
    TRANSPORTABLE = {"positivity", "strict_triangle", "kalmanson_first",
                     "kalmanson_second", "selected_row_equality"}
    memberships: set[tuple[int, int]] = set()
    used: set[int] = set()
    for name in core:
        item = index[name]
        if item.kind not in TRANSPORTABLE:
            return None
        if item.kind == "selected_row_equality":
            for key, polarity in item.literals:
                if not polarity or key[0] != "m":
                    return None
                memberships.add((key[1], key[2]))
        fields = name.split("_")
        for field in fields[1:]:
            if field.lstrip("-").isdigit():
                used.add(int(field))
    if not memberships:
        return None
    vertices = tuple(sorted(used))
    role = {v: i for i, v in enumerate(vertices)}
    schema = tuple(sorted((role[c], role[p]) for c, p in memberships))
    reflected = reflected_schema(len(vertices), schema)
    return {
        "core_vertex_count": len(vertices),
        "order_schema": min(schema, reflected),
        "source_vertices": vertices,
    }


def expand_schema(record: dict[str, object]) -> tuple[tuple[tuple[int, int], ...], ...]:
    k = int(record["core_vertex_count"])
    schema = tuple(tuple(x) for x in record["order_schema"])
    out = set()
    for embedding in itertools.combinations(VERTICES, k):
        for oriented in (schema, reflected_schema(k, schema)):
            out.add(tuple(sorted((embedding[c], embedding[p]) for c, p in oriented)))
    return tuple(sorted(out))


def load_mined_bank(path: Path, max_k: int) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-allcenter-minimized-metric-schema-bank-v1":
        raise ValueError("unexpected mined bank schema")
    chosen = [r for r in payload["schemas"] if int(r["core_vertex_count"]) <= max_k]
    apps: set[tuple[tuple[int, int], ...]] = set()
    for record in chosen:
        apps.update(expand_schema({
            "core_vertex_count": int(record["core_vertex_count"]),
            "order_schema": tuple(sorted(tuple(x) for x in record["order_schema"])),
        }))
    return {
        "path": str(path),
        "sha256": sha256_bytes(path.read_bytes()),
        "max_vertex_count": max_k,
        "selected_schema_count": len(chosen),
        "application_count": len(apps),
        "applications": tuple(sorted(apps)),
        "schemas": chosen,
    }


# ---------------------------------------------------------------------------
# Exact rational replay of a SAT model.
# ---------------------------------------------------------------------------


def dvalue(distances: dict[str, Fraction], a: int, b: int) -> Fraction:
    if a == b:
        return Fraction(0)
    x, y = edge(a, b)
    return distances[f"{x},{y}"]


def radius_classes(distances, center: int) -> dict[Fraction, tuple[int, ...]]:
    buckets: dict[Fraction, list[int]] = defaultdict(list)
    for p in VERTICES:
        if p == center:
            continue
        buckets[dvalue(distances, center, p)].append(p)
    return {r: tuple(v) for r, v in buckets.items()}


def verify_exact_shadow(decoded, distances, exactness: bool) -> dict[str, object]:
    """Independent exact-Fraction replay of every asserted family, plus the
    literal quantifier-for-quantifier robustness statement."""
    errors: list[str] = []

    for (a, b) in itertools.combinations(VERTICES, 2):
        if dvalue(distances, a, b) < 1:
            errors.append(f"positivity failed {a},{b}")
    for a, b, c in itertools.combinations(VERTICES, 3):
        if dvalue(distances, a, b) + dvalue(distances, b, c) < dvalue(distances, a, c) + 1:
            errors.append(f"strict triangle 0 failed {a},{b},{c}")
        if dvalue(distances, a, c) + dvalue(distances, b, c) < dvalue(distances, a, b) + 1:
            errors.append(f"strict triangle 1 failed {a},{b},{c}")
        if dvalue(distances, a, b) + dvalue(distances, a, c) < dvalue(distances, b, c) + 1:
            errors.append(f"strict triangle 2 failed {a},{b},{c}")
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diag = dvalue(distances, a, c) + dvalue(distances, b, d)
        if diag < dvalue(distances, a, b) + dvalue(distances, c, d) + 1:
            errors.append(f"Kalmanson first failed {a},{b},{c},{d}")
        if diag < dvalue(distances, a, d) + dvalue(distances, b, c) + 1:
            errors.append(f"Kalmanson second failed {a},{b},{c},{d}")

    # K4 at every center where the hypothesis was actually imposed, read off
    # the exact rational distances.
    imposed = set(decoded.get("row_centers", VERTICES)) | set(ROBUST_APICES)
    k4_sizes = {}
    for z in VERTICES:
        sizes = [len(v) for v in radius_classes(distances, z).values()]
        k4_sizes[z] = max(sizes)
        if z in imposed and max(sizes) < 4:
            errors.append(f"K4 failed at {z}")

    # Selected rows really are co-radial.
    for c, support in decoded["rows"].items():
        if len({dvalue(distances, c, p) for p in support}) != 1:
            errors.append(f"selected row not co-radial at {c}")

    # Literal quantifier-for-quantifier robustness at each designated apex.
    robustness = {}
    for u in ROBUST_APICES:
        classes = radius_classes(distances, u)
        per_z = {}
        for zdel in VERTICES:
            best = max(
                (len([p for p in members if p != zdel]) for members in classes.values()),
                default=0,
            )
            per_z[zdel] = best
            if best < 4:
                errors.append(f"robustness at apex {u} failed for deletion {zdel}")
        sizes = sorted((len(v) for v in classes.values()), reverse=True)
        robustness[u] = {
            "class_sizes": sizes,
            "min_surviving_class_size_over_deletions": min(per_z.values()),
            "matches_declared_mode": (
                (sizes[0] >= 5) if decoded["apex"][u]["mode"] == "SINGLE"
                else (len([s for s in sizes if s >= 4]) >= 2)
            ),
        }
        if exactness:
            record = decoded["apex"][u]
            declared = [set(record["A"])] + ([set(record["B"])] if record["B"] else [])
            actual = [set(v) for v in classes.values()]
            for want in declared:
                if want not in actual:
                    errors.append(f"declared apex class at {u} is not a full class")

    # Cap-hit bounds actually observed (these are the imported premise; the
    # replay records whether the produced model happens to satisfy them).
    cap_hit_violations = []
    for name, block in CAPS.items():
        ends = CAP_ENDPOINTS[name]
        for c in (p for p in block if p in imposed):
            bound = 1 if c in ends else 2
            for radius, members in radius_classes(distances, c).items():
                hits = [p for p in members if p in block]
                if len(hits) > bound:
                    cap_hit_violations.append({
                        "cap": name, "center": c, "bound": bound,
                        "radius": qstr(radius), "hits": hits,
                    })

    one_sided_violations = []
    for name, chain in CAPS.items():
        for pos, center in enumerate(chain):
            for side, members in (("after", chain[pos + 1:]),
                                  ("before", chain[:pos])):
                for r0, s0 in itertools.combinations(members, 2):
                    if dvalue(distances, center, r0) == dvalue(distances, center, s0):
                        one_sided_violations.append(
                            {"cap": name, "center": center, "side": side,
                             "points": [r0, s0]})

    if errors:
        raise AssertionError("; ".join(sorted(set(errors))[:20]))
    return {
        "status": "EXACT_RATIONAL_REPLAY_PASS",
        "one_sided_cap_injectivity_violations": one_sided_violations,
        "distance_count": len(distances),
        "minimum_distance": qstr(min(distances.values())),
        "maximum_distance": qstr(max(distances.values())),
        "k4_max_class_size_per_point": k4_sizes,
        "robustness": robustness,
        "cap_hit_bound_violations_in_full_classes": cap_hit_violations,
    }


# ---------------------------------------------------------------------------
# Smoke battery.
# ---------------------------------------------------------------------------

SQRT_SCALE = 10 ** 40


def rat_sqrt(x: Fraction) -> Fraction:
    """Deterministic rational under-approximation of sqrt(x).

    Depends only on the reduced numerator/denominator, so equal squared
    distances always produce byte-identical distances.  Exactness of the
    co-radiality relation is therefore preserved.
    """
    p, q = x.numerator, x.denominator
    return Fraction(math.isqrt(p * q * SQRT_SCALE * SQRT_SCALE), q * SQRT_SCALE)


def cross(o, a, b) -> Fraction:
    return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])


def convex_hull_order(points: Sequence[tuple[Fraction, Fraction]]) -> tuple[int, ...]:
    """Exact monotone chain.  Returns the counter-clockwise hull order and
    raises if any input point is not a strict hull vertex."""
    order = sorted(range(len(points)), key=lambda i: (points[i][0], points[i][1]))
    def build(seq):
        chain = []
        for i in seq:
            while len(chain) >= 2 and cross(points[chain[-2]], points[chain[-1]], points[i]) <= 0:
                chain.pop()
            chain.append(i)
        return chain
    lower = build(order)
    upper = build(reversed(order))
    hull = lower[:-1] + upper[:-1]
    if len(hull) != len(points):
        raise AssertionError(f"not strictly convex position: hull has {len(hull)} of {len(points)}")
    return tuple(hull)


def unit_circle_point(t: Fraction) -> tuple[Fraction, Fraction]:
    d = 1 + t * t
    return ((1 - t * t) / d, (2 * t) / d)


def config_center_and_arc() -> dict[str, object]:
    """v0 at the origin plus 14 rational points on the unit circle about v0,
    spread over an arc of well under 180 degrees.  Strictly convex position,
    v0 a hull vertex, and v0 carries an exact co-radial class of size 14."""
    ts = [Fraction(k, 40) for k in range(-14, 14, 2)]  # angles in (-38, +38) deg
    pts = [(Fraction(0), Fraction(0))] + [unit_circle_point(t) for t in ts]
    return {"name": "center_and_arc", "points": pts}


def config_two_radii() -> dict[str, object]:
    """v0 at the origin, with several exact co-radial classes of size four.

    Fourteen rational points sit on four circles about v0, at radii 2, 9/5,
    8/5 and 6/5, in nested angular bands of increasing angle and decreasing
    radius.  The whole 15-point set is strictly convex with v0 a hull vertex,
    so v0 carries three disjoint exact co-radial classes of size four -- the
    incidence shape of TWIN mode at a robust apex.
    """
    # (radius, polar angles in degrees).  A junction from radius R1 at angle a1
    # to radius R2 at angle a2 keeps the chain convex when cos(a2 - a1) is below
    # min(R1, R2) / max(R1, R2); the gaps below satisfy that with margin, and
    # `planar_shadow` re-checks strict convex position exactly.
    bands = [
        (Fraction(2), [0, 4, 8, 12]),
        (Fraction(9, 5), [40, 44]),
        (Fraction(8, 5), [74, 78, 82, 86]),
        (Fraction(6, 5), [130, 134, 138, 142]),
    ]
    pts = [(Fraction(0), Fraction(0))]
    for radius, degrees in bands:
        for deg in degrees:
            t = Fraction(math.tan(math.radians(deg / 2))).limit_denominator(1000)
            x, y = unit_circle_point(t)
            pts.append((radius * x, radius * y))
    return {"name": "two_radii", "points": pts}


def planar_shadow(points: Sequence[tuple[Fraction, Fraction]]) -> dict[str, object]:
    """Exact convex-position check plus a scaled rational distance matrix."""
    hull = convex_hull_order(points)
    # Relabel so the boundary cyclic order is 0,1,...,n-1.
    relabel = {old: new for new, old in enumerate(hull)}
    pts = [None] * len(points)
    for old, new in relabel.items():
        pts[new] = points[old]
    n = len(pts)
    sq = {}
    for a, b in itertools.combinations(range(n), 2):
        sq[(a, b)] = (pts[a][0] - pts[b][0]) ** 2 + (pts[a][1] - pts[b][1]) ** 2
    raw = {key: rat_sqrt(value) for key, value in sq.items()}

    def slacks(scale: Fraction):
        out = []
        d = lambda a, b: (Fraction(0) if a == b else raw[edge(a, b)] * scale)
        for a, b in itertools.combinations(range(n), 2):
            out.append(d(a, b))
        for a, b, c in itertools.combinations(range(n), 3):
            out.append(d(a, b) + d(b, c) - d(a, c))
            out.append(d(a, c) + d(b, c) - d(a, b))
            out.append(d(a, b) + d(a, c) - d(b, c))
        for a, b, c, e in itertools.combinations(range(n), 4):
            diag = d(a, c) + d(b, e)
            out.append(diag - d(a, b) - d(c, e))
            out.append(diag - d(a, e) - d(b, c))
        return out

    base = min(slacks(Fraction(1)))
    if base <= 0:
        raise AssertionError(f"planar control has non-positive slack {base}")
    scale = Fraction(math.ceil(2 / base))
    final = {f"{a},{b}": raw[(a, b)] * scale for a, b in itertools.combinations(range(n), 2)}
    return {
        "n": n,
        "relabel": relabel,
        "boundary_order": tuple(range(n)),
        "squared_distances": sq,
        "scale": scale,
        "minimum_unscaled_slack": base,
        "distances": final,
    }


def exact_classes_from_shadow(shadow) -> dict[int, list[list[int]]]:
    """Exact co-radial classes read off the *squared* rational distances."""
    n = shadow["n"]
    sq = shadow["squared_distances"]

    def s(a, b):
        return sq[edge(a, b)]

    out = {}
    for c in range(n):
        buckets = defaultdict(list)
        for p in range(n):
            if p != c:
                buckets[s(c, p)].append(p)
        out[c] = [sorted(v) for v in buckets.values()]
    return out


def smoke(timeout_ms: int, random_seed: int) -> dict[str, object]:
    results: list[dict[str, object]] = []
    table = distance_table()
    base = base_surface(table)

    # --- P0: the pure LRA surface admits a solution at all. ---------------
    r = solve_tracked(base, timeout_ms, random_seed, want_core=False)
    results.append({
        "id": "P0_pure_lra_surface_sat",
        "expected": "SAT", "actual": r["status"],
        "pass": r["status"] == "SAT",
        "note": "strict triangle + both strict Kalmanson on 15 boundary points",
    })

    # --- P1/P2: genuine strictly convex rational planar configurations. ---
    for builder in (config_center_and_arc, config_two_radii):
        record = builder()
        shadow = planar_shadow(record["points"])
        if shadow["n"] != N:
            raise AssertionError(f"{record['name']} has {shadow['n']} points")
        distances = {k: v for k, v in shadow["distances"].items()}
        classes = exact_classes_from_shadow(shadow)

        # Independent exact-Fraction replay of the whole encoded surface.
        viol = []
        for a, b in itertools.combinations(VERTICES, 2):
            if dvalue(distances, a, b) < 1:
                viol.append(f"pos {a},{b}")
        for a, b, c in itertools.combinations(VERTICES, 3):
            if dvalue(distances, a, b) + dvalue(distances, b, c) < dvalue(distances, a, c) + 1:
                viol.append(f"tri0 {a},{b},{c}")
            if dvalue(distances, a, c) + dvalue(distances, b, c) < dvalue(distances, a, b) + 1:
                viol.append(f"tri1 {a},{b},{c}")
            if dvalue(distances, a, b) + dvalue(distances, a, c) < dvalue(distances, b, c) + 1:
                viol.append(f"tri2 {a},{b},{c}")
        for a, b, c, d in itertools.combinations(VERTICES, 4):
            diag = dvalue(distances, a, c) + dvalue(distances, b, d)
            if diag < dvalue(distances, a, b) + dvalue(distances, c, d) + 1:
                viol.append(f"kal1 {a},{b},{c},{d}")
            if diag < dvalue(distances, a, d) + dvalue(distances, b, c) + 1:
                viol.append(f"kal2 {a},{b},{c},{d}")
        largest = {c: max(len(x) for x in v) for c, v in classes.items()}
        results.append({
            "id": f"P_planar_replay_{record['name']}",
            "expected": "no violation", "actual": f"{len(viol)} violations",
            "pass": not viol,
            "note": ("exact-Fraction replay of a genuine strictly convex rational "
                     "planar 15-point set against the full encoded LRA surface"),
            "largest_exact_coradial_class_per_point": largest,
            "scale": str(shadow["scale"]),
            "violations": viol[:8],
        })

        # SMT positive control: assert EVERY exact co-radial equality the real
        # configuration satisfies; the real matrix is a witness, so SAT.
        eqs = []
        for c, groups in classes.items():
            for group in groups:
                if len(group) < 2:
                    continue
                ref = group[0]
                for p in group[1:]:
                    eqs.append(Tracked(
                        f"ctl_{c}_{ref}_{p}",
                        dist(table, c, p) == dist(table, c, ref),
                        "control_equality",
                    ))
        r = solve_tracked(base + eqs, timeout_ms, random_seed, want_core=False)
        results.append({
            "id": f"P_smt_accepts_{record['name']}",
            "expected": "SAT", "actual": r["status"],
            "pass": r["status"] == "SAT",
            "note": (f"full LRA surface + all {len(eqs)} exact co-radial equalities "
                     "of the genuine planar configuration"),
        })

        # --- N: relabelling that breaks the boundary cyclic order. --------
        if record["name"] == "center_and_arc":
            swapped = dict(distances)
            i, j = 3, 9
            perm = {i: j, j: i}
            swapped = {}
            for a, b in itertools.combinations(VERTICES, 2):
                pa, pb = perm.get(a, a), perm.get(b, b)
                swapped[f"{a},{b}"] = dvalue(distances, pa, pb)
            pinned = [Tracked(f"pin_{a}_{b}",
                              dist(table, a, b) == z3.RatVal(
                                  swapped[f"{a},{b}"].numerator,
                                  swapped[f"{a},{b}"].denominator),
                              "pinned_distance")
                      for a, b in itertools.combinations(VERTICES, 2)]
            r = solve_tracked(base + pinned, timeout_ms, random_seed, want_core=False)
            bad = []
            for a, b, c, d in itertools.combinations(VERTICES, 4):
                diag = dvalue(swapped, a, c) + dvalue(swapped, b, d)
                if diag < dvalue(swapped, a, b) + dvalue(swapped, c, d) + 1:
                    bad.append(("kal1", a, b, c, d))
                if diag < dvalue(swapped, a, d) + dvalue(swapped, b, c) + 1:
                    bad.append(("kal2", a, b, c, d))
            results.append({
                "id": "N_wrong_cyclic_order_rejected",
                "expected": "UNSAT", "actual": r["status"],
                "pass": r["status"] == "UNSAT",
                "note": ("same planar distance matrix, boundary labels 3 and 9 "
                         "transposed, so the declared cyclic order is wrong"),
                "directly_violated_kalmanson_count": len(bad),
                "first_violations": [list(x) for x in bad[:5]],
            })

    # --- One-sided cap-distance injectivity layer. ------------------------
    capinj = cap_injectivity_surface(table)
    r = solve_tracked(base + capinj, timeout_ms, random_seed, want_core=False)
    results.append({
        "id": "P_cap_injectivity_layer_not_vacuous",
        "expected": "SAT", "actual": r["status"],
        "pass": r["status"] == "SAT",
        "note": (f"LRA surface + all {len(capinj)} one-sided cap-distance "
                 "injectivity disequalities is satisfiable"),
    })
    for tag, (c, p, q), want in (
        ("same_side_after", (0, 1, 2), "UNSAT"),
        ("same_side_before", (3, 1, 2), "UNSAT"),
        ("opposite_sides", (3, 2, 4), "SAT"),
    ):
        probe = base + capinj + [Tracked(
            f"probe_{tag}", dist(table, c, p) == dist(table, c, q),
            "negative_control")]
        r = solve_tracked(probe, timeout_ms, random_seed, want_core=False)
        results.append({
            "id": f"C_cap_injectivity_{tag}",
            "expected": want, "actual": r["status"],
            "pass": r["status"] == want,
            "note": (f"d({c},{p}) = d({c},{q}) with {c},{p},{q} all in cap "
                     f"C_A = {list(CAP_A)}"),
        })

    # --- R: only order-invariant cores may transport to other embeddings.
    #        Regression: cap-injectivity constraints are attached to a specific
    #        cap block and apex-class constraints to a specific apex, so a core
    #        touching either must NOT produce a schema closure.  Transporting
    #        such a core produced a spurious UNSAT before this guard existed. --
    probe_index = {t.name: t for t in base + capinj}
    fake_row = Tracked("row_4_1_2", dist(table, 4, 2) == dist(table, 4, 1),
                       "selected_row_equality",
                       ((("m", 4, 1), True), (("m", 4, 2), True)))
    probe_index[fake_row.name] = fake_row
    fake_apex = Tracked("apexrA_0_6_7", dist(table, 0, 7) == dist(table, 0, 6),
                        "apex_class_equality",
                        ((("rA", 0, 6), True), (("rA", 0, 7), True)))
    probe_index[fake_apex.name] = fake_apex
    transport_cases = [
        ("pure_row_core_transports",
         ("row_4_1_2",), True),
        ("cap_injectivity_core_blocked",
         ("capinj_C_A_4_before_1_2", "row_4_1_2"), False),
        ("apex_class_core_blocked",
         ("apexrA_0_6_7", "row_4_1_2"), False),
        ("kalmanson_plus_row_core_transports",
         ("kal1_0_1_2_3", "row_4_1_2"), True),
    ]
    transport_results = []
    for tag, core, should_transport in transport_cases:
        got = canonical_row_schema(core, probe_index) is not None
        transport_results.append({"case": tag, "transported": got,
                                  "expected": should_transport,
                                  "pass": got == should_transport})
    results.append({
        "id": "R_core_transport_guard",
        "expected": "only order-invariant cores transport",
        "actual": f"{sum(1 for x in transport_results if x['pass'])}/"
                  f"{len(transport_results)} correct",
        "pass": all(x["pass"] for x in transport_results),
        "note": ("regression guard: transporting a core that references a "
                 "specific cap block or apex is unsound"),
        "cases": transport_results,
    })

    # --- N: triangle inequality violation must be rejected. ---------------
    bad_tri = base + [Tracked(
        "bad_triangle",
        dist(table, 0, 2) >= dist(table, 0, 1) + dist(table, 1, 2),
        "negative_control",
    )]
    r = solve_tracked(bad_tri, timeout_ms, random_seed, want_core=False)
    results.append({
        "id": "N_triangle_violation_rejected",
        "expected": "UNSAT", "actual": r["status"],
        "pass": r["status"] == "UNSAT",
        "note": "d(0,2) >= d(0,1) + d(1,2) against the strict triangle family",
    })

    # --- N: independently mined LRA-UNSAT row schema, replayed at n=15. ---
    if MINED_BANK.exists():
        payload = json.loads(MINED_BANK.read_text(encoding="utf-8"))
        compact = sorted(
            (r0 for r0 in payload["schemas"] if int(r0["core_vertex_count"]) == 5),
            key=lambda r0: str(r0["order_schema"]),
        )[:4]
        sub = []
        for idx, record in enumerate(compact):
            k = int(record["core_vertex_count"])
            memberships = [tuple(x) for x in record["order_schema"]]
            embedding = tuple(range(k))
            byc = defaultdict(list)
            for c, p in memberships:
                byc[embedding[c]].append(embedding[p])
            eqs = []
            for c, ps in byc.items():
                ps = sorted(ps)
                for p in ps[1:]:
                    eqs.append(Tracked(
                        f"bank{idx}_{c}_{ps[0]}_{p}",
                        dist(table, c, p) == dist(table, c, ps[0]),
                        "mined_bank_equality",
                    ))
            r = solve_tracked(base + eqs, timeout_ms, random_seed, want_core=False)
            sub.append({
                "schema_index": idx,
                "core_vertex_count": k,
                "order_schema": [list(x) for x in memberships],
                "expected": "UNSAT", "actual": r["status"],
                "pass": r["status"] == "UNSAT",
            })
        results.append({
            "id": "N_mined_bank_schemas_still_unsat_at_n15",
            "expected": "UNSAT (all)",
            "actual": f"{sum(1 for x in sub if x['pass'])}/{len(sub)} UNSAT",
            "pass": all(x["pass"] for x in sub),
            "note": ("deletion-minimal exact-LRA-UNSAT row schemas mined "
                     "independently by the n=14 exact6-allcenter lane, embedded "
                     "increasingly into the n=15 boundary order"),
            "mined_bank_sha256": sha256_bytes(MINED_BANK.read_bytes()),
            "cases": sub,
        })
    else:
        results.append({
            "id": "N_mined_bank_schemas_still_unsat_at_n15",
            "expected": "UNSAT (all)", "actual": "SKIPPED (bank missing)",
            "pass": False, "note": str(MINED_BANK),
        })

    # --- N: Boolean-layer cap-hit control. --------------------------------
    outer = Outer(timeout_ms, random_seed)
    outer.solver.push()
    # Force the apex-0 class rA to hold two points of the adjacent cap C_A.
    outer.solver.add(outer.v(("rA", 0, 1)), outer.v(("rA", 0, 2)))
    st = outer.solver.check()
    outer.solver.pop()
    results.append({
        "id": "N_boolean_cap_hit_bound_rejects_two_adjacent_cap_points",
        "expected": "unsat", "actual": str(st),
        "pass": st == z3.unsat,
        "note": ("a radius class at chord endpoint 0 may meet the adjacent cap "
                 "C_A = {0..5} in at most one point"),
    })

    # --- P: the Boolean layer alone is satisfiable (else report it). ------
    st = outer.solver.check()
    results.append({
        "id": "B_boolean_layer_status",
        "expected": "(informational)", "actual": str(st),
        "pass": st == z3.sat or st == z3.unsat,
        "note": ("status of the incidence layer with no metric constraints; "
                 "unsat here would already be a purely combinatorial verdict"),
    })

    # --- X: the staged and the integrated encodings must agree on any pinned
    #        Boolean incidence model.  This cross-validates two independent
    #        code paths for the same mathematical surface. ------------------
    agreement = []
    if st == z3.sat:
        probe = Outer(timeout_ms, random_seed)
        for trial in range(4):
            if probe.solver.check() != z3.sat:
                break
            decoded = probe.decode(probe.solver.model())
            use_capinj = bool(trial % 2)
            staged_base = base + (capinj if use_capinj else [])
            staged = solve_tracked(
                staged_base + model_equalities(decoded, table)
                + model_exactness(decoded, table),
                timeout_ms, random_seed, want_core=False,
            )
            pinned = Outer(timeout_ms, random_seed)
            for c, support in decoded["rows"].items():
                for p in VERTICES:
                    lit = pinned.v(("m", c, p))
                    pinned.solver.add(lit if p in support else z3.Not(lit))
            for u, record in decoded["apex"].items():
                pinned.solver.add(
                    pinned.v(("single", u)) if record["mode"] == "SINGLE"
                    else z3.Not(pinned.v(("single", u)))
                )
                for p in VERTICES:
                    la = pinned.v(("rA", u, p))
                    pinned.solver.add(la if p in record["A"] else z3.Not(la))
                    if record["mode"] == "TWIN":
                        lb = pinned.v(("rB", u, p))
                        pinned.solver.add(lb if p in record["B"] else z3.Not(lb))
            isolver = build_integrated_solver(
                pinned, distance_table(), True, timeout_ms, random_seed,
                cap_injectivity=use_capinj,
            )
            ist = isolver.check()
            istatus = ("SAT" if ist == z3.sat else "UNSAT" if ist == z3.unsat
                       else "UNKNOWN")
            agreement.append({
                "trial": trial,
                "cap_injectivity": use_capinj,
                "staged": staged["status"],
                "integrated": istatus,
                "agree": staged["status"] == istatus,
            })
            probe.block_complete(decoded)
    results.append({
        "id": "X_staged_and_integrated_encodings_agree",
        "expected": "agree on every pinned Boolean model",
        "actual": f"{sum(1 for a in agreement if a['agree'])}/{len(agreement)} agree",
        "pass": bool(agreement) and all(a["agree"] for a in agreement),
        "note": ("independent cross-validation of the CEGAR metric stages "
                 "against the single-model integrated encoding"),
        "trials": agreement,
    })

    return {
        "schema": "p97-rigid-base-metric-gate-smoke-v1",
        "all_pass": all(bool(x["pass"]) for x in results),
        "timeout_ms": timeout_ms,
        "results": results,
    }


# ---------------------------------------------------------------------------
# CEGAR driver.
# ---------------------------------------------------------------------------


def run_gate(args) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    centers = parse_row_centers(args.row_centers)
    outer = Outer(
        args.outer_timeout_ms,
        args.random_seed,
        engine=args.outer_engine,
        use_cap_hit_bounds=not args.no_cap_hit_bounds,
        use_bisector_alternation=not args.no_bisector_alternation,
        use_cap_injectivity=not args.no_cap_injectivity,
        row_centers=centers,
    )
    table = distance_table()
    base = base_surface(table)
    if not args.no_cap_injectivity:
        base = base + cap_injectivity_surface(table)

    bank_record = None
    if args.mined_bank and MINED_BANK.exists():
        bank = load_mined_bank(MINED_BANK, args.mined_max_k)
        outer.add_membership_closure(bank["applications"])
        bank_record = {k: bank[k] for k in
                       ("path", "sha256", "max_vertex_count",
                        "selected_schema_count", "application_count")}

    counters: dict[str, int] = defaultdict(int)
    cut_ledger: list[dict[str, object]] = []
    schema_ledger: list[dict[str, object]] = []
    seen_schemas: set[tuple] = set()
    asserted: set[tuple] = set()
    result: dict[str, object] | None = None
    attempts = 0

    for attempt in range(1, args.max_attempts + 1):
        attempts = attempt
        budget = bounded_ms(args.outer_timeout_ms, deadline)
        if budget is None:
            result = {"status": "UNKNOWN", "reason": "wall budget exhausted"}
            break
        outer.solver.set(timeout=budget)
        st = outer.solver.check()
        if st == z3.unsat:
            result = {"status": "UNSAT_BOOLEAN_PLUS_LEARNED_METRIC_CUTS"}
            break
        if st == z3.unknown:
            result = {"status": "UNKNOWN",
                      "reason": f"outer: {outer.solver.reason_unknown()}"}
            break
        decoded = outer.decode(outer.solver.model())

        # Stage 1: equalities only (pure necessary conditions).
        budget = bounded_ms(args.metric_timeout_ms, deadline)
        if budget is None:
            result = {"status": "UNKNOWN", "reason": "wall budget exhausted"}
            break
        eqs = model_equalities(decoded, table)
        stage1 = solve_tracked(base + eqs, budget, args.random_seed + attempt, True)

        if stage1["status"] == "UNKNOWN":
            result = {"status": "UNKNOWN", "reason": f"stage1: {stage1['reason']}"}
            break
        if stage1["status"] == "UNSAT":
            counters["stage1_unsat"] += 1
            core = stage1["core"]
            index = stage1["index"]
            if args.minimize_cores:
                core = minimize_core(core, index, deadline, args.random_seed)
            literals = sorted({lit for name in core for lit in index[name].literals})
            record = {
                "attempt": attempt, "stage": 1,
                "core_size": len(core), "core": list(core),
                "core_kinds": sorted({index[n].kind for n in core}),
                "literals": [[list(k), pol] for k, pol in literals],
            }
            if literals:
                outer.add_literal_cut(literals)
            else:
                outer.block_complete(decoded)
                record["blocked_complete_model"] = True
            if len(cut_ledger) < args.store_cuts:
                cut_ledger.append(record)
            counters["stage1_cuts"] += 1

            if args.transport_cores:
                canonical = canonical_row_schema(core, index)
                if canonical is not None:
                    key = (canonical["core_vertex_count"],
                           tuple(canonical["order_schema"]))
                    if key not in seen_schemas:
                        seen_schemas.add(key)
                        apps = expand_schema(canonical)
                        fresh = tuple(a for a in apps if a not in asserted)
                        if fresh:
                            outer.add_membership_closure(fresh)
                            asserted.update(fresh)
                        counters["transported_applications"] += len(fresh)
                        schema_ledger.append({
                            "attempt": attempt,
                            "core_vertex_count": canonical["core_vertex_count"],
                            "order_schema": [list(x) for x in canonical["order_schema"]],
                            "source_vertices": list(canonical["source_vertices"]),
                            "source_core": list(core),
                            "application_count": len(apps),
                            "new_application_count": len(fresh),
                        })
            if attempt % args.log_every == 0:
                print(json.dumps({"attempt": attempt, "phase": "stage1_unsat",
                                  "counters": dict(counters)}), flush=True)
            continue

        # Stage 2: add robust-apex class exactness.
        stage2 = stage1
        if not args.no_apex_exactness:
            budget = bounded_ms(args.metric_timeout_ms, deadline)
            if budget is None:
                result = {"status": "UNKNOWN", "reason": "wall budget exhausted"}
                break
            ex = model_exactness(decoded, table)
            stage2 = solve_tracked(base + eqs + ex, budget,
                                   args.random_seed + attempt, True)
            if stage2["status"] == "UNKNOWN":
                result = {"status": "UNKNOWN", "reason": f"stage2: {stage2['reason']}"}
                break
            if stage2["status"] == "UNSAT":
                counters["stage2_unsat"] += 1
                core = stage2["core"]
                index = stage2["index"]
                literals = sorted({lit for name in core
                                   for lit in index[name].literals})
                record = {
                    "attempt": attempt, "stage": 2,
                    "core_size": len(core), "core": list(core),
                    "core_kinds": sorted({index[n].kind for n in core}),
                    "literals": [[list(k), pol] for k, pol in literals],
                }
                if literals:
                    outer.add_literal_cut(literals)
                else:
                    outer.block_complete(decoded)
                    record["blocked_complete_model"] = True
                if len(cut_ledger) < args.store_cuts:
                    cut_ledger.append(record)
                counters["stage2_cuts"] += 1
                if attempt % args.log_every == 0:
                    print(json.dumps({"attempt": attempt, "phase": "stage2_unsat",
                                      "counters": dict(counters)}), flush=True)
                continue

        model = stage2["model"]
        distances = {
            f"{a},{b}": qval(model.eval(var, model_completion=True))
            for (a, b), var in table.items()
        }
        verification = verify_exact_shadow(
            decoded, distances, exactness=not args.no_apex_exactness
        )
        result = {
            "status": "SAT_EXACT_RATIONAL_ABSTRACT_DISTANCE_SHADOW",
            "decoded": {
                "rows": {str(c): list(v) for c, v in decoded["rows"].items()},
                "apex": {str(u): {"mode": r["mode"], "A": list(r["A"]),
                                  "B": list(r["B"])}
                         for u, r in decoded["apex"].items()},
            },
            "distances": {k: qstr(v) for k, v in distances.items()},
            "verification": verification,
        }
        break
    else:
        result = {"status": "UNKNOWN", "reason": "attempt budget exhausted"}

    result.update({
        "schema": "p97-rigid-base-metric-gate-v1",
        "n": N,
        "cap_profile": [6, 6, 6],
        "boundary_order": list(VERTICES),
        "apices": list(APICES),
        "robust_apices": list(ROBUST_APICES),
        "caps": {k: list(v) for k, v in CAPS.items()},
        "per_solve_timeout_ms": args.metric_timeout_ms,
        "outer_timeout_ms": args.outer_timeout_ms,
        "wall_seconds": args.wall_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "attempts": attempts,
        "counters": dict(counters),
        "options": {
            "apex_exactness": not args.no_apex_exactness,
            "cap_hit_bounds": not args.no_cap_hit_bounds,
            "bisector_alternation": not args.no_bisector_alternation,
            "core_minimization": bool(args.minimize_cores),
            "core_transport": bool(args.transport_cores),
            "one_sided_cap_injectivity": not args.no_cap_injectivity,
            "mined_bank_preload": bank_record,
            "row_centers": sorted(centers),
            "is_relaxation": sorted(centers) != list(VERTICES),
        },
        "encoded": [
            "one selected co-radial K4 4-row at every one of the 15 centers",
            "contiguous (6,6,6) cap blocks on the boundary order 0..14",
            "cap-local row-hit bounds (imported premise)",
            "two-circle and perpendicular-bisector-line incidence bounds",
            "strict convex bisector alternation on shared bisected pairs",
            "full deletion robustness at apices 0 and 5 via the proven "
            "class-of-5 / two-disjoint-classes-of-4 normal form",
            "exactness of the two robust-apex radius classes",
            "positivity and strict triangle inequalities on every triple",
            "both strict Kalmanson inequalities on every cyclic quadruple",
            "exact rational arithmetic throughout (QF_LRA, slack normalized "
            "to integral >= 1)",
        ],
        "not_encoded": [
            "planar Euclidean coordinate realizability (rank-two Gram / CM "
            "determinant conditions)",
            "minimal-enclosing-circle containment",
            "the non-obtuse condition on the Moser triangle",
            "the orientation content of 'far side of the chord' beyond "
            "contiguity of the cap blocks",
            "Ptolemy and other higher-order convex-position inequalities",
            "concyclicity of any radius class",
            "any Lean-side consumer",
        ],
        "epistemic_label": (
            "SAT = EXACT RATIONAL ABSTRACT-DISTANCE SHADOW ONLY. NOT a planar "
            "Euclidean realization and NOT a counterexample to Erdos 97. "
            "Kalmanson + triangle are necessary, not sufficient, for strictly "
            "convex planar realizability. UNSAT = bounded solver verdict over "
            "exactly the constraints listed under 'encoded'. UNKNOWN = timeout."
        ),
        "cut_ledger_stored": len(cut_ledger),
        "cut_ledger": cut_ledger,
        "transported_schema_count": len(schema_ledger),
        "transported_schemas": schema_ledger,
    })
    return result


# ---------------------------------------------------------------------------


def run_lra_only(args) -> dict[str, object]:
    """The universal surface alone, with no incidence model."""
    table = distance_table()
    base = base_surface(table)
    started = time.monotonic()
    r = solve_tracked(base, args.metric_timeout_ms, args.random_seed, False)
    return {
        "schema": "p97-rigid-base-metric-gate-lra-only-v1",
        "status": r["status"],
        "constraint_count": len(base),
        "elapsed_seconds": time.monotonic() - started,
        "per_solve_timeout_ms": args.metric_timeout_ms,
        "note": "positivity + strict triangle + both strict Kalmanson, n=15",
    }


def run_integrated(args) -> dict[str, object]:
    """Decide the Boolean incidence model and the exact rational distances in
    one solver, with no cut bank and no outer/inner split.

    Each center c carries a real selected radius rad[c]; membership in the
    selected K4 row forces d(c,p) = rad[c].  Each robust apex carries radA/radB
    for its one or two designated radius classes.  UNSAT here is a verdict over
    the WHOLE encoded space, not over one enumerated Boolean model.
    """
    started = time.monotonic()
    exactness = not args.no_apex_exactness
    centers = parse_row_centers(args.row_centers)
    outer = Outer(
        args.outer_timeout_ms, args.random_seed, engine="smt",
        use_cap_hit_bounds=not args.no_cap_hit_bounds,
        use_bisector_alternation=not args.no_bisector_alternation,
        use_cap_injectivity=not args.no_cap_injectivity,
        row_centers=centers,
    )
    table = distance_table()
    solver = build_integrated_solver(
        outer, table, exactness, args.metric_timeout_ms, args.random_seed,
        cap_injectivity=not args.no_cap_injectivity,
    )
    st = solver.check()
    payload: dict[str, object] = {
        "schema": "p97-rigid-base-metric-gate-integrated-v1",
        "elapsed_seconds": time.monotonic() - started,
        "per_solve_timeout_ms": args.metric_timeout_ms,
        "assertion_count": len(solver.assertions()),
        "options": {
            "apex_exactness": exactness,
            "cap_hit_bounds": not args.no_cap_hit_bounds,
            "bisector_alternation": not args.no_bisector_alternation,
            "one_sided_cap_injectivity": not args.no_cap_injectivity,
            "row_centers": sorted(centers),
            "is_relaxation": sorted(centers) != list(VERTICES),
        },
    }
    if st == z3.unsat:
        payload["status"] = ("UNSAT_INTEGRATED_ENCODED_SURFACE"
                             if sorted(centers) == list(VERTICES)
                             else "UNSAT_INTEGRATED_RELAXATION_TRANSFERS_UPWARD")
    elif st == z3.unknown:
        payload["status"] = "UNKNOWN"
        payload["reason"] = solver.reason_unknown()
    else:
        model = solver.model()
        decoded = outer.decode(model)
        distances = {
            f"{a},{b}": qval(model.eval(var, model_completion=True))
            for (a, b), var in table.items()
        }
        payload["status"] = "SAT_EXACT_RATIONAL_ABSTRACT_DISTANCE_SHADOW"
        payload["decoded"] = {
            "rows": {str(c): list(v) for c, v in decoded["rows"].items()},
            "apex": {str(u): {"mode": r["mode"], "A": list(r["A"]),
                              "B": list(r["B"])}
                     for u, r in decoded["apex"].items()},
        }
        payload["distances"] = {k: qstr(v) for k, v in distances.items()}
        payload["verification"] = verify_exact_shadow(decoded, distances, exactness)
    payload["epistemic_label"] = (
        "SAT = EXACT RATIONAL ABSTRACT-DISTANCE SHADOW ONLY (not a planar "
        "Euclidean realization, not a counterexample to Erdos 97). UNSAT = "
        "bounded solver verdict over the encoded surface, quantified over the "
        "entire Boolean incidence space. UNKNOWN = timeout."
    )
    return payload


def build_integrated_solver(outer, table, exactness, timeout_ms, seed,
                            cap_injectivity=True):
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=seed)
    solver.add(*outer.solver.assertions())
    for item in base_surface(table):
        solver.add(item.formula)
    if cap_injectivity:
        for item in cap_injectivity_surface(table):
            solver.add(item.formula)

    rad = {c: z3.Real(f"rad_{c}") for c in VERTICES}
    radA = {u: z3.Real(f"radA_{u}") for u in ROBUST_APICES}
    radB = {u: z3.Real(f"radB_{u}") for u in ROBUST_APICES}
    for c in VERTICES:
        solver.add(rad[c] >= 1)
        for p in VERTICES:
            if p == c:
                continue
            solver.add(z3.Implies(outer.v(("m", c, p)), dist(table, c, p) == rad[c]))
    for u in ROBUST_APICES:
        single = outer.v(("single", u))
        solver.add(radA[u] >= 1, radB[u] >= 1)
        for p in VERTICES:
            if p == u:
                continue
            solver.add(z3.Implies(outer.v(("rA", u, p)),
                                  dist(table, u, p) == radA[u]))
            solver.add(z3.Implies(z3.And(z3.Not(single), outer.v(("rB", u, p))),
                                  dist(table, u, p) == radB[u]))
            if exactness:
                solver.add(z3.Implies(z3.Not(outer.v(("rA", u, p))),
                                      dist(table, u, p) != radA[u]))
                solver.add(z3.Implies(
                    z3.And(z3.Not(single), z3.Not(outer.v(("rB", u, p)))),
                    dist(table, u, p) != radB[u]))
        if exactness:
            solver.add(z3.Implies(z3.Not(single), radA[u] != radB[u]))
    return solver


ROW_CENTER_PRESETS = {
    "all": tuple(VERTICES),
    "none": (),
    "apex3": (0, 5, 10),
    "apex3+opp0": (0, 5, 10, 6, 7, 8, 9),
    "apex3+opp0+opp5": (0, 5, 10, 6, 7, 8, 9, 11, 12, 13, 14),
    "interiors": (1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14),
}


def parse_row_centers(spec: str) -> frozenset[int]:
    if spec in ROW_CENTER_PRESETS:
        return frozenset(ROW_CENTER_PRESETS[spec])
    return frozenset(int(x) for x in spec.split(",") if x.strip())


def run_boolean_only(args) -> dict[str, object]:
    started = time.monotonic()
    outer = Outer(
        args.outer_timeout_ms, args.random_seed, engine=args.outer_engine,
        use_cap_hit_bounds=not args.no_cap_hit_bounds,
        use_bisector_alternation=not args.no_bisector_alternation,
        use_cap_injectivity=not args.no_cap_injectivity,
    )
    st = outer.solver.check()
    payload = {
        "schema": "p97-rigid-base-metric-gate-boolean-only-v1",
        "status": ("SAT" if st == z3.sat else "UNSAT" if st == z3.unsat
                   else "UNKNOWN"),
        "elapsed_seconds": time.monotonic() - started,
        "outer_timeout_ms": args.outer_timeout_ms,
        "options": {
            "cap_hit_bounds": not args.no_cap_hit_bounds,
            "bisector_alternation": not args.no_bisector_alternation,
            "one_sided_cap_injectivity": not args.no_cap_injectivity,
        },
    }
    if st == z3.sat:
        payload["first_model"] = {
            "rows": {str(c): list(v)
                     for c, v in outer.decode(outer.solver.model())["rows"].items()},
        }
    return payload


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mode", choices=("smoke", "gate", "integrated",
                                           "lra-only", "boolean-only"),
                        default="gate")
    parser.add_argument("--wall-seconds", type=float, default=600.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=60_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=300_000,
                        help="per-solve timeout for the exact metric stages")
    parser.add_argument("--outer-engine", choices=("smt", "qffd"), default="qffd")
    parser.add_argument("--max-attempts", type=int, default=1_000_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--log-every", type=int, default=5)
    parser.add_argument("--store-cuts", type=int, default=200)
    parser.add_argument("--no-apex-exactness", action="store_true")
    parser.add_argument("--no-cap-hit-bounds", action="store_true")
    parser.add_argument("--no-cap-injectivity", action="store_true",
                        help="drop the one-sided cap-distance injectivity layer")
    parser.add_argument("--no-bisector-alternation", action="store_true")
    parser.add_argument("--minimize-cores", action="store_true", default=True)
    parser.add_argument("--no-minimize-cores", dest="minimize_cores",
                        action="store_false")
    parser.add_argument("--transport-cores", action="store_true", default=True)
    parser.add_argument("--no-transport-cores", dest="transport_cores",
                        action="store_false")
    parser.add_argument("--mined-bank", action="store_true", default=False,
                        help="preload the n=14 lane's mined LRA-UNSAT row schemas")
    parser.add_argument("--mined-max-k", type=int, default=6)
    parser.add_argument("--row-centers", default="all",
                        help=("centers at which the K4 row hypothesis is "
                              "imposed: a preset ("
                              + ", ".join(sorted(ROW_CENTER_PRESETS))
                              + ") or a comma list.  Anything other than 'all' "
                                "is a sound relaxation whose UNSAT transfers "
                                "upward to the full problem."))
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.mode == "smoke":
        payload = smoke(min(args.metric_timeout_ms, 120_000), args.random_seed)
    elif args.mode == "lra-only":
        payload = run_lra_only(args)
    elif args.mode == "boolean-only":
        payload = run_boolean_only(args)
    elif args.mode == "integrated":
        payload = run_integrated(args)
    else:
        payload = run_gate(args)

    rendered = json.dumps(payload, indent=2, sort_keys=True, default=str) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
        print(json.dumps({
            "mode": args.mode,
            "status": payload.get("status", payload.get("all_pass")),
            "output": str(args.output),
        }, sort_keys=True))
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()
