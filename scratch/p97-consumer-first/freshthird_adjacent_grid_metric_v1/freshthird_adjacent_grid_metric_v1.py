#!/usr/bin/env python3
"""Exact-17 Euclidean replay of the FreshThird adjacent-grid abstraction.

The finite master is imported from ``freshthird_aligned_boundary_v2``.  A
complete structural model is frozen before each QF_NRA replay.  The replay
uses exact Real coordinates and polynomial squared-distance identities.

This is a bounded diagnostic, not a proof of P97 and not a general-n lift.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
import signal
import subprocess
import time
from dataclasses import dataclass, asdict
from itertools import combinations
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
V2_PATH = HERE.parent / "freshthird_aligned_boundary_v2" / "freshthird_aligned_boundary_v2.py"
N = 17
APICES = (3, 4, 5)  # (v1,v2,v3); cap k is opposite APICES[k]


def load_v2() -> Any:
    spec = importlib.util.spec_from_file_location("freshthird_boundary_v2", V2_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {V2_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


V2 = load_v2()


def zbool(model: z3.ModelRef, term: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(term, model_completion=True))


def zint(model: z3.ModelRef, term: z3.ArithRef) -> int:
    return model.eval(term, model_completion=True).as_long()


@dataclass(frozen=True)
class Signature:
    orientation: str
    radial_branch: int
    roles: dict[str, int]
    blockers: tuple[int, int]
    positions: tuple[int, ...]
    caps: tuple[tuple[int, ...], ...]
    rows: tuple[tuple[int, ...], tuple[int, ...]]
    radius_supports: tuple[tuple[int, ...], tuple[int, ...]]
    grid_hits: tuple[tuple[int, int], tuple[int, int]]  # radius -> (left,right)

    @property
    def boundary(self) -> tuple[int, ...]:
        return tuple(sorted(range(N), key=self.positions.__getitem__))


def hit_position(canary: Any, radius: int, side: int) -> z3.ArithRef:
    return z3.Sum(
        [z3.If(canary.grid_hits[radius][side][p], canary.pos[p], 0) for p in range(N)]
    )


def radial_order_formula(canary: Any, branch: int) -> z3.BoolRef:
    """The four arms of SharedBoundaryRadialOrder.direct_or_mirror.

    Branch 0/1 has retained radius0 < radius1; branch 2/3 reverses it.
    """
    r0l, r0r = hit_position(canary, 0, 0), hit_position(canary, 0, 1)
    r1l, r1r = hit_position(canary, 1, 0), hit_position(canary, 1, 1)
    arms = (
        z3.And(r1l < r0l, r0l < r0r, r0r < r1r),
        z3.And(r1r < r0r, r0r < r0l, r0l < r1l),
        z3.And(r0l < r1l, r1l < r1r, r1r < r0r),
        z3.And(r0r < r1r, r1r < r1l, r1l < r0l),
    )
    return arms[branch]


def corrected_joint_solver(
    canary: Any, orientation: str, branch: int
) -> tuple[z3.Solver, list[z3.ArithRef]]:
    """Solve incidence and the corrected live boundary packet together.

    The predecessor embeds its own boundary variables and the obsolete cap
    permutation.  Remove exactly the conjuncts mentioning those variables,
    retain all incidence/cap/cardinality constraints, and attach a fresh copy
    of the live normalized boundary clauses.  This avoids freezing an
    arbitrary incidence model before asking whether its boundary can be laid
    out.
    """
    old_names = {
        value.decl().name()
        for value in (*canary.pos, canary.iv, canary.iw, canary.direct)
    }

    def mentions_old_boundary(term: z3.ExprRef) -> bool:
        stack = [term]
        while stack:
            node = stack.pop()
            if z3.is_const(node) and node.num_args() == 0 and node.decl().name() in old_names:
                return True
            stack.extend(node.children())
        return False

    retained = [term for term in canary.constraints if not mentions_old_boundary(term)]
    if len(retained) == len(canary.constraints):
        raise RuntimeError("failed to isolate predecessor boundary constraints")

    pos = [z3.Int(f"live_{orientation}_b{branch}_pos_{p}") for p in range(N)]
    solver = z3.SolverFor("QF_LIA")
    solver.set(timeout=30_000, random_seed=9717 + branch)
    solver.add(*retained)
    # CEGAR refinement from exact SelectedClass semantics: unequal radii have
    # disjoint supports.  The predecessor required only the two named hits on
    # each side to be disjoint, which admitted a shared non-grid label and led
    # to the artificial equation radius0_sq = radius1_sq.
    for point in range(N):
        solver.add(
            z3.Not(
                z3.And(canary.radius_points[0][point], canary.radius_points[1][point])
            )
        )
    solver.add(z3.Distinct(pos), *[z3.And(0 <= q, q < N) for q in pos])
    solver.add(pos[APICES[2]] == 0)
    iv, iw = pos[APICES[0]], pos[APICES[1]]

    def interior(cap: int, point: int) -> z3.BoolRef:
        return canary.interior(cap, point)

    if orientation == "direct":
        solver.add(0 < iv, iv < iw)
        for point in range(N):
            solver.add(z3.Implies(interior(1, point), z3.And(0 < pos[point], pos[point] < iv)))
            solver.add(z3.Implies(interior(2, point), z3.And(iv < pos[point], pos[point] < iw)))
            solver.add(z3.Implies(interior(0, point), iw < pos[point]))
    else:
        solver.add(0 < iw, iw < iv)
        for point in range(N):
            solver.add(z3.Implies(interior(0, point), z3.And(0 < pos[point], pos[point] < iw)))
            solver.add(z3.Implies(interior(2, point), z3.And(iw < pos[point], pos[point] < iv)))
            solver.add(z3.Implies(interior(1, point), iv < pos[point]))

    def pos_at(point: z3.ArithRef) -> z3.ArithRef:
        return z3.Sum([z3.If(point == p, pos[p], 0) for p in range(N)])

    q_source, source5 = canary.role("q_source"), canary.role("source5")
    blocker0, blocker1 = canary.base.b_at(q_source), canary.base.b_at(source5)
    solver.add(
        z3.Xor(
            V2.btw(pos_at(blocker0), pos_at(blocker1), pos_at(q_source)),
            V2.btw(pos_at(blocker0), pos_at(blocker1), pos_at(source5)),
        )
    )
    hit_pos = lambda radius, side: z3.Sum(
        [z3.If(canary.grid_hits[radius][side][p], pos[p], 0) for p in range(N)]
    )
    r0l, r0r = hit_pos(0, 0), hit_pos(0, 1)
    r1l, r1r = hit_pos(1, 0), hit_pos(1, 1)
    arms = (
        z3.And(r1l < r0l, r0l < r0r, r0r < r1r),
        z3.And(r1r < r0r, r0r < r0l, r0l < r1l),
        z3.And(r0l < r1l, r1l < r1r, r1r < r0r),
        z3.And(r0r < r1r, r1r < r1l, r1l < r0l),
    )
    solver.add(arms[branch])
    return solver, pos


def freeze_signature(orientation: str, branch: int) -> Signature | None:
    canary = V2.BoundaryCanary(orientation)
    # Retain v2's incidence model, replace its mis-permuted boundary conjuncts,
    # and solve the corrected order jointly with incidence and radial order.
    solver, corrected_pos = corrected_joint_solver(canary, orientation, branch)
    result = solver.check()
    if result != z3.sat:
        return None
    model = solver.model()
    roles = {name: zint(model, value) for name, value in canary.base.role.items()}
    sources = (canary.role("q_source"), canary.role("source5"))
    blockers = tuple(zint(model, canary.base.b_at(source)) for source in sources)
    caps = tuple(
        tuple(p for p in range(N) if zbool(model, canary.base.cap[k][p]))
        for k in range(3)
    )
    rows = tuple(
        tuple(p for p in range(N) if zbool(model, canary.rows[row][p]))
        for row in range(2)
    )
    supports = tuple(
        tuple(p for p in range(N) if zbool(model, canary.radius_points[r][p]))
        for r in range(2)
    )
    hits = tuple(
        tuple(
            next(p for p in range(N) if zbool(model, canary.grid_hits[r][side][p]))
            for side in range(2)
        )
        for r in range(2)
    )
    positions = tuple(zint(model, q) for q in corrected_pos)
    sig = Signature(
        orientation, branch, roles, blockers, positions, caps, rows, supports, hits
    )
    validate_signature(sig)
    return sig


def validate_signature(sig: Signature) -> None:
    assert sorted(sig.positions) == list(range(N))
    assert sig.positions[APICES[2]] == 0
    assert tuple(map(len, sig.caps)) == (8, 6, 6)
    assert all(len(row) == 4 for row in sig.rows)
    assert all(len(support) == 4 for support in sig.radius_supports)
    assert set(sig.radius_supports[0]).isdisjoint(sig.radius_supports[1])
    assert sig.blockers[0] != sig.blockers[1]
    source_pair = {sig.roles["q_source"], sig.roles["source5"]}
    assert all(source_pair <= set(row) for row in sig.rows)
    for r in range(2):
        for side, cap in enumerate((1, 2)):
            assert set(sig.radius_supports[r]) & set(sig.caps[cap]) == {
                sig.grid_hits[r][side]
            }
    assert all(
        any(sig.grid_hits[r][side] not in APICES for r in range(2))
        for side in range(2)
    )
    pos = sig.positions
    r0l, r0r = sig.grid_hits[0]
    r1l, r1r = sig.grid_hits[1]
    arms = (
        pos[r1l] < pos[r0l] < pos[r0r] < pos[r1r],
        pos[r1r] < pos[r0r] < pos[r0l] < pos[r1l],
        pos[r0l] < pos[r1l] < pos[r1r] < pos[r0r],
        pos[r0r] < pos[r1r] < pos[r1l] < pos[r0l],
    )
    assert arms[sig.radial_branch]
    interiors = [set(cap) - set(APICES) for cap in sig.caps]
    boundary = sig.boundary
    assert boundary[0] == APICES[2]
    iv, iw = pos[APICES[0]], pos[APICES[1]]
    if sig.orientation == "direct":
        assert 0 < iv < iw
        assert all(0 < pos[p] < iv for p in interiors[1])
        assert all(iv < pos[p] < iw for p in interiors[2])
        assert all(iw < pos[p] for p in interiors[0])
    else:
        assert 0 < iw < iv
        assert all(0 < pos[p] < iw for p in interiors[0])
        assert all(iw < pos[p] < iv for p in interiors[2])
        assert all(iv < pos[p] for p in interiors[1])

    def between(i: int, j: int, k: int) -> bool:
        return (i < k < j) or (j < k < i)

    s0, s1 = sig.roles["q_source"], sig.roles["source5"]
    b0, b1 = sig.blockers
    assert between(pos[b0], pos[b1], pos[s0]) != between(pos[b0], pos[b1], pos[s1])


def area(x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int, c: int) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (x[c] - x[a]) * (y[b] - y[a])


def d2_expr(x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int) -> z3.ArithRef:
    return (x[a] - x[b]) ** 2 + (y[a] - y[b]) ** 2


def on_arc_product(
    x: list[z3.ArithRef], y: list[z3.ArithRef], opposite: int, left: int, right: int, p: int
) -> z3.ArithRef:
    return area(x, y, p, left, right) * area(x, y, opposite, left, right)


class MetricReplay:
    """One frozen structural signature with staged exact Euclidean constraints."""

    STAGES = (
        "geometry",
        "grid_members",
        "grid_exact",
        "rows",
        "source_slices",
        "kalmanson",
    )

    def __init__(self, sig: Signature, timeout_ms: int) -> None:
        self.sig = sig
        self.timeout_ms = timeout_ms
        self.x = [z3.Real(f"x_{p}") for p in range(N)]
        self.y = [z3.Real(f"y_{p}") for p in range(N)]
        active = set(APICES) | set(sig.blockers)
        active |= set(sig.rows[0]) | set(sig.rows[1])
        active |= set(sig.radius_supports[0]) | set(sig.radius_supports[1])
        active |= set(sig.grid_hits[0]) | set(sig.grid_hits[1])
        active |= {sig.roles["q_source"], sig.roles["source5"]}
        self.active = tuple(sorted(active))
        self.d2: dict[tuple[int, int], z3.ArithRef] = {
            (a, b): z3.Real(f"d2_{a}_{b}") for a, b in combinations(self.active, 2)
        }
        self.groups: dict[str, list[z3.BoolRef]] = {stage: [] for stage in self.STAGES}
        self._build()

    def D2(self, a: int, b: int) -> z3.ArithRef:
        if a == b:
            return z3.RealVal(0)
        key = (a, b) if a < b else (b, a)
        if key in self.d2:
            return self.d2[key]
        return d2_expr(self.x, self.y, a, b)

    def _build(self) -> None:
        s = self.sig
        g = self.groups
        boundary = s.boundary

        # Similarity gauge: the MEC center is the origin, squared radius is 1,
        # and v1 is fixed at (1,0).  This loses no Euclidean realizations.
        v1, v2, v3 = APICES
        g["geometry"] += [self.x[v1] == 1, self.y[v1] == 0]
        for apex in APICES:
            g["geometry"].append(self.x[apex] ** 2 + self.y[apex] ** 2 == 1)
        for p in range(N):
            g["geometry"].append(self.x[p] ** 2 + self.y[p] ** 2 <= 1)

        # Non-obtuse circumscribed Moser triangle.
        for a, b, c in ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2)):
            dot = (self.x[b] - self.x[a]) * (self.x[c] - self.x[a]) + (
                self.y[b] - self.y[a]
            ) * (self.y[c] - self.y[a])
            g["geometry"].append(dot >= 0)

        # BoundaryIndexing.boundary_ccw uses negative signed areas.
        for ia, ib, ic in combinations(range(N), 3):
            a, b, c = boundary[ia], boundary[ib], boundary[ic]
            g["geometry"].append(area(self.x, self.y, a, b, c) < 0)

        # Exact CapTriple.arc_membership for all 17 carrier labels.
        cap_triples = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
        for k, (opp, left, right) in enumerate(cap_triples):
            members = set(s.caps[k])
            for p in range(N):
                prod = on_arc_product(self.x, self.y, opp, left, right, p)
                g["geometry"].append(prod <= 0 if p in members else prod > 0)

        # Named squared distances are explicitly linked to coordinates.
        for (a, b), variable in self.d2.items():
            g["geometry"].append(variable == d2_expr(self.x, self.y, a, b))
            g["geometry"].append(variable > 0)

        # First add the positive radii, all eight coordinate-linked member
        # equations, and the supplied radial order.  Nonmember exclusions are
        # kept in the next stage so an UNKNOWN can be localized precisely.
        grid_q = [z3.Real("grid_radius0_sq"), z3.Real("grid_radius1_sq")]
        for r in range(2):
            support = set(s.radius_supports[r])
            g["grid_members"].append(grid_q[r] > 0)
            for p in range(N):
                equality = d2_expr(self.x, self.y, v1, p) == grid_q[r]
                if p in support:
                    g["grid_members"].append(equality)
                else:
                    g["grid_exact"].append(z3.Not(equality))
        if s.radial_branch < 2:
            g["grid_members"].append(grid_q[0] < grid_q[1])
        else:
            g["grid_members"].append(grid_q[1] < grid_q[0])

        # Each aligned canonical source row is an exact SelectedClass centered
        # at its named blocker, not merely four free equalities.
        row_q = [z3.Real("source_row0_sq"), z3.Real("source_row1_sq")]
        for r in range(2):
            center = s.blockers[r]
            support = set(s.rows[r])
            g["rows"].append(row_q[r] > 0)
            for p in range(N):
                equality = d2_expr(self.x, self.y, center, p) == row_q[r]
                g["rows"].append(equality if p in support else z3.Not(equality))

        # FreshThird singleton first-apex slices are only singleton after
        # intersection with the own strict cap (cap 0 minus v2,v3).
        source0, source1 = s.roles["q_source"], s.roles["source5"]
        own_interior = set(s.caps[0]) - {v2, v3}
        g["source_slices"].append(
            d2_expr(self.x, self.y, v1, source0) != d2_expr(self.x, self.y, v1, source1)
        )
        for source in (source0, source1):
            source_q = d2_expr(self.x, self.y, v1, source)
            for p in own_interior - {source}:
                g["source_slices"].append(d2_expr(self.x, self.y, v1, p) != source_q)

        # Polynomially linked distance variables instantiate the live strict
        # cross-distance conclusion; the inequality is not a free symbol.
        r0l, r0r = s.grid_hits[0]
        r1l, r1r = s.grid_hits[1]
        pairs = ((r0l, r0r), (r1l, r1r), (r0l, r1r), (r1l, r0r))
        lengths = [z3.Real(f"cross_dist_{a}_{b}") for a, b in pairs]
        for length, (a, b) in zip(lengths, pairs, strict=True):
            g["kalmanson"] += [length > 0, length * length == d2_expr(self.x, self.y, a, b)]
        g["kalmanson"].append(lengths[0] + lengths[1] < lengths[2] + lengths[3])

    def solver(self, through: str) -> z3.Solver:
        solver = z3.SolverFor("QF_NRA")
        solver.set(timeout=self.timeout_ms, random_seed=9717)
        limit = self.STAGES.index(through)
        for stage in self.STAGES[: limit + 1]:
            solver.add(self.groups[stage])
        return solver

    def validate(self, through: str, model: z3.ModelRef) -> list[str]:
        """Recompute the semantic constraints from the frozen signature."""
        errors: list[str] = []

        def holds(term: z3.BoolRef) -> bool:
            return z3.is_true(model.eval(term, model_completion=True))

        # This deliberately rebuilds formulas rather than replaying group lists.
        v1, v2, v3 = APICES
        if not holds(self.x[v1] == 1) or not holds(self.y[v1] == 0):
            errors.append("similarity gauge mismatch")
        for apex in APICES:
            if not holds(self.x[apex] ** 2 + self.y[apex] ** 2 == 1):
                errors.append(f"apex {apex} is not on the MEC circle")
        for point in range(N):
            if not holds(self.x[point] ** 2 + self.y[point] ** 2 <= 1):
                errors.append(f"point {point} lies outside the MEC disk")
        for a, b_apex, c in ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2)):
            dot = (self.x[b_apex] - self.x[a]) * (self.x[c] - self.x[a]) + (
                self.y[b_apex] - self.y[a]
            ) * (self.y[c] - self.y[a])
            if not holds(dot >= 0):
                errors.append(f"obtuse apex triangle at {a}")
        b = self.sig.boundary
        for i, j, k in combinations(range(N), 3):
            if not holds(area(self.x, self.y, b[i], b[j], b[k]) < 0):
                errors.append(f"non-strict boundary triple {i},{j},{k}")
                break
        cap_triples = ((3, 4, 5), (4, 5, 3), (5, 3, 4))
        for cap, (opp, left, right) in enumerate(cap_triples):
            members = set(self.sig.caps[cap])
            for p in range(N):
                pred = on_arc_product(self.x, self.y, opp, left, right, p) <= 0
                if holds(pred) != (p in members):
                    errors.append(f"cap{cap} classification mismatch at p{p}")
                    break
        for pair, variable in self.d2.items():
            if not holds(variable == d2_expr(self.x, self.y, *pair)):
                errors.append(f"d2 link mismatch {pair}")
                break
            if not holds(variable > 0):
                errors.append(f"nonpositive named d2 {pair}")
                break
        limit = self.STAGES.index(through)
        for stage in self.STAGES[1 : limit + 1]:
            for index, term in enumerate(self.groups[stage]):
                if not holds(term):
                    errors.append(f"{stage} constraint {index} false")
                    break
        return errors


def status(result: z3.CheckSatResult, solver: z3.Solver) -> str:
    if result == z3.sat:
        return "sat"
    if result == z3.unsat:
        return "unsat"
    return f"unknown:{solver.reason_unknown()}"


def cvc5_status(smt2: str, timeout_ms: int) -> str:
    try:
        proc = subprocess.Popen(
            ["cvc5", "--lang", "smt2", "--produce-models", f"--tlimit-per={timeout_ms}"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except FileNotFoundError:
        return "unavailable"
    try:
        stdout, stderr = proc.communicate(smt2 + "\n(check-sat)\n", timeout=timeout_ms / 1000 + 3)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait(timeout=2)
        return "timeout"
    answers = [
        line.strip()
        for line in stdout.splitlines()
        if line.strip() in {"sat", "unsat", "unknown"}
    ]
    return answers[-1] if answers else f"error:{proc.returncode}:{stderr.strip()[:120]}"


def smoke_tests(timeout_ms: int) -> list[dict[str, str]]:
    """Known exact convex SAT instance plus three malformed UNSAT controls."""
    x = [z3.Real(f"smoke_x_{i}") for i in range(6)]
    y = [z3.Real(f"smoke_y_{i}") for i in range(6)]
    base = z3.SolverFor("QF_NRA")
    base.set(timeout=timeout_ms)
    # Six rational points on y=-x^2, traversed clockwise.
    for i, t in enumerate((-3, -2, -1, 1, 2, 3)):
        base.add(x[i] == t, y[i] == -(t * t))
    for i, j, k in combinations(range(6), 3):
        base.add(area(x, y, i, j, k) < 0)

    cases = {
        "smoke_convex_hexagon": ([], "sat"),
        "control_collinear": ([area(x, y, 0, 1, 2) == 0], "unsat"),
        "control_bad_d2": (
            [
                z3.Real("smoke_bad_d2") == d2_expr(x, y, 0, 1),
                z3.Real("smoke_bad_d2") < 0,
            ],
            "unsat",
        ),
        "control_reversed_turn": ([area(x, y, 0, 1, 2) > 0], "unsat"),
    }
    out: list[dict[str, str]] = []
    for name, (extra, expected) in cases.items():
        solver = z3.SolverFor("QF_NRA")
        solver.set(timeout=timeout_ms)
        solver.add(base.assertions(), *extra)
        z3_result = status(solver.check(), solver)
        if z3_result != expected:
            raise RuntimeError(f"{name}: expected {expected}, got {z3_result}")
        cvc5_result = cvc5_status(solver.to_smt2(), timeout_ms)
        out.append({"case": name, "z3": z3_result, "cvc5": cvc5_result})
    return out


def write_smt(name: str, solver: z3.Solver) -> Path:
    path = HERE / f"{name}.smt2"
    path.write_text("(set-logic QF_NRA)\n" + solver.to_smt2() + "\n(check-sat)\n", encoding="utf-8")
    return path


def run(timeout_ms: int, cvc5_timeout_ms: int) -> dict[str, Any]:
    report: dict[str, Any] = {
        "classification": "bounded exact-17 CEGAR diagnostic; not P97 closure",
        "smoke": smoke_tests(min(timeout_ms, 10_000)),
        "signatures": [],
    }
    # The v2 finite master determines which orientation/linear radial arms are
    # structurally possible.  Each SAT arm supplies one complete signature.
    for orientation in ("direct", "mirror"):
        for branch in range(4):
            sig = freeze_signature(orientation, branch)
            if sig is None:
                report["signatures"].append(
                    {"orientation": orientation, "radial_branch": branch, "structural": "unsat"}
                )
                continue
            entry: dict[str, Any] = {
                "orientation": orientation,
                "radial_branch": branch,
                "structural": "sat",
                "signature": asdict(sig),
                "stages": [],
            }
            replay = MetricReplay(sig, timeout_ms)
            terminal_solver: z3.Solver | None = None
            for stage in MetricReplay.STAGES:
                solver = replay.solver(stage)
                start = time.monotonic()
                result = solver.check()
                elapsed = time.monotonic() - start
                result_name = status(result, solver)
                stage_entry: dict[str, Any] = {
                    "stage": stage,
                    "z3": result_name,
                    "seconds": round(elapsed, 3),
                }
                write_smt(f"{orientation}_b{branch}_{stage}", solver)
                if result == z3.sat:
                    errors = replay.validate(stage, solver.model())
                    stage_entry["independent_validation"] = "pass" if not errors else errors
                    if errors:
                        raise RuntimeError(f"model validation failed: {errors}")
                entry["stages"].append(stage_entry)
                terminal_solver = solver
                if result != z3.sat:
                    break
            if terminal_solver is not None:
                entry["terminal_cvc5"] = cvc5_status(terminal_solver.to_smt2(), cvc5_timeout_ms)
            report["signatures"].append(entry)
    return report


def render_results(report: dict[str, Any]) -> str:
    lines = [
        "FreshThird adjacent-grid exact metric v1",
        "Classification: bounded exact-17 diagnostic; SAT is not a P97 "
        "counterexample; unknown is not UNSAT.",
        "",
        "Smoke tests:",
    ]
    for item in report["smoke"]:
        lines.append(f"- {item['case']}: z3={item['z3']} cvc5={item['cvc5']}")
    lines += ["", "Frozen-signature replays:"]
    for entry in report["signatures"]:
        prefix = f"- {entry['orientation']} branch {entry['radial_branch']}"
        if entry["structural"] != "sat":
            lines.append(f"{prefix}: structural={entry['structural']}")
            continue
        stages = ", ".join(
            f"{s['stage']}={s['z3']}[{s['seconds']}s; "
            f"validation={s.get('independent_validation','n/a')}]"
            for s in entry["stages"]
        )
        lines.append(f"{prefix}: structural=sat; {stages}; terminal cvc5={entry['terminal_cvc5']}")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--cvc5-timeout-ms", type=int, default=30_000)
    args = parser.parse_args()
    report = run(args.timeout_ms, args.cvc5_timeout_ms)
    (HERE / "results.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    rendered = render_results(report)
    (HERE / "results.txt").write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
