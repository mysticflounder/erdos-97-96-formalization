#!/usr/bin/env python3
"""Exact-17 finite diagnostic for the aligned FreshThird boundary packet.

This imports the existing exact17/global incidence canary and adds only the
finite incidence/order projection of
``FreshThirdAlignedMutualBlockerBoundaryPacket``.  It is deliberately not a
Euclidean realization and has no n-to-general lift.
"""

from __future__ import annotations

import importlib.util
import os
import signal
import subprocess
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "freshthird_six_center_global_k4_v2" / "canary.py"
N = 17
APICES = (3, 4, 5)  # cap 0 omits opp1, cap 1 omits opp2, cap 2 omits surplus
OPP1_APEX, OPP2_APEX, SURPLUS_APEX = APICES[0], APICES[1], APICES[2]


def load_base() -> Any:
    spec = importlib.util.spec_from_file_location("freshthird_global", BASE_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {BASE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


BASE = load_base()


def bsum(bits: list[z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(bit, 1, 0) for bit in bits])


def btw(i: z3.ArithRef, j: z3.ArithRef, k: z3.ArithRef) -> z3.BoolRef:
    """The source ``SurplusCOMPGBank.btw`` definition."""
    return z3.Or(z3.And(i < k, k < j), z3.And(j < k, k < i))


class BoundaryCanary:
    def __init__(self, forced_orientation: str | None = None) -> None:
        self.base = BASE.Canary(N)
        self.constraints = self.base.constraints
        self.forced_orientation = forced_orientation
        self.rows = [[z3.Bool(f"aligned_row{r}_{p}") for p in range(N)] for r in range(2)]
        self.slices = [[z3.Bool(f"aligned_slice{r}_{p}") for p in range(N)] for r in range(2)]
        self.pos = [z3.Int(f"boundary_pos_{p}") for p in range(N)]
        self.iv = z3.Int("boundary_opp1_index")
        self.iw = z3.Int("boundary_opp2_index")
        self.direct = z3.Bool("boundary_direct_orientation")
        self.blocker_cap = [z3.Int(f"source_blocker_cap{r}") for r in range(2)]
        self.p_choice = [z3.Int(f"aligned_p_choice{r}") for r in range(2)]
        self.q_choice = [z3.Int(f"aligned_q_choice{r}") for r in range(2)]
        self.radii = [z3.Int(f"aligned_first_apex_radius{r}") for r in range(2)]
        self.source_survival = [z3.Bool(f"aligned_source_row_survival{r}") for r in range(2)]
        self.first_apex_failure = [z3.Bool(f"aligned_source{r}_firstApexFailure") for r in range(2)]
        self.minimal_core_nonempty = [z3.Bool(f"aligned_source{r}_minimalDeletionCoreNonempty") for r in range(2)]
        self._build()

    def add(self, *items: z3.BoolRef) -> None:
        self.constraints.extend(items)

    def role(self, name: str) -> z3.ArithRef:
        return self.base.role[name]

    def row_at(self, row: int, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or([z3.And(point == p, self.rows[row][p]) for p in range(N)])

    def pos_at(self, point: z3.ArithRef) -> z3.ArithRef:
        return z3.Sum([z3.If(point == p, self.pos[p], 0) for p in range(N)])

    def interior(self, cap: int, point: int) -> z3.BoolRef:
        return self.base.cap[cap][point] if point not in APICES else z3.BoolVal(False)

    def interior_at(self, cap: z3.ArithRef, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(
            [
                z3.And(cap == index, point == p, self.interior(index, p))
                for index in range(3)
                for p in range(N)
            ]
        )

    def chosen_endpoint(self, pair: tuple[z3.ArithRef, z3.ArithRef], choice: z3.ArithRef) -> z3.ArithRef:
        return z3.If(choice == 0, pair[0], pair[1])

    def _build(self) -> None:
        b = self.base
        p1, p2 = self.role("p1"), self.role("p2")
        rho1, rho2 = self.role("rho1"), self.role("rho2")
        q_source, q_other = self.role("q_source"), self.role("q_other")
        source5 = self.role("source5")
        # This is the finite role normalization used by the aligned adapter:
        # (firstSource, secondSource)=(q_source,source5), P endpoints=(p1,p2),
        # and P-rho endpoints=(rho1,rho2).  This selects two already distinct
        # blocker fibers in the exact17 ingress (B1 and B5); p1,p2 and
        # rho1,rho2 are the two retained endpoint pairs.  Pair disjointness is
        # explicit because labels are finite.
        roles = [p1, p2, rho1, rho2, q_source, q_other, source5]
        self.add(*[0 != role for role in roles])
        for left in range(len(roles)):
            for right in range(left):
                self.add(roles[left] != roles[right])

        # FreshThirdAlignedRetainedConsumerPacket: unequal radii, singleton
        # first-apex slices, and the opaque retained multi-point fact.
        self.add(self.radii[0] != self.radii[1], z3.Bool("firstCapMultiPointRadiiRetained"))
        for row, source in enumerate((q_source, source5)):
            for point in range(N):
                self.add(self.slices[row][point] == (source == point))
            self.add(bsum(self.slices[row]) == 1)

        # Exact source rows and reciprocal cross-membership.  Both aligned
        # rows carry both firstSource and secondSource; the P endpoint pair
        # remains the independently chosen deletion pair.
        for row in range(2):
            self.add(bsum(self.rows[row]) == 4)
            self.add(self.row_at(row, q_source), self.row_at(row, source5))

        # One fixed deletion-core arm per source.  The row is the finite
        # support proxy for the source's selected four-shell.  The survivor,
        # first-apex failure, and MinimalDeletionCore facts are retained as
        # explicit named obligations; no geometry is inferred from them.
        endpoint_pairs = ((p1, p2), (rho1, rho2))
        for row in range(2):
            self.add(0 <= self.p_choice[row], self.p_choice[row] < 2)
            self.add(0 <= self.q_choice[row], self.q_choice[row] < 2)
            x = self.chosen_endpoint(endpoint_pairs[0], self.p_choice[row])
            y = self.chosen_endpoint(endpoint_pairs[1], self.q_choice[row])
            for point in range(N):
                self.add(z3.Implies(x == point, z3.Not(self.rows[row][point])))
                self.add(z3.Implies(y == point, z3.Not(self.rows[row][point])))
            survivor = [z3.If(z3.And(x != point, y != point), self.rows[row][point], z3.BoolVal(False)) for point in range(N)]
            self.add(bsum(survivor) == 4)
            self.add(self.source_survival[row])
            self.add(self.first_apex_failure[row])
            self.add(self.minimal_core_nonempty[row])

        # FreshThirdAlignedCommonDeletionCorePairPacket: common endpoint is
        # in either P pair or P-rho pair, with the other endpoint unrestricted.
        common_in_p = z3.Bool("common_deletion_endpoint_in_P")
        common_slot = z3.Int("common_deletion_endpoint_slot")
        self.add(0 <= common_slot, common_slot < 2)
        self.add(
            z3.If(
                common_in_p,
                self.p_choice[0] == common_slot,
                self.q_choice[0] == common_slot,
            )
        )
        self.add(
            z3.If(
                common_in_p,
                self.p_choice[1] == common_slot,
                self.q_choice[1] == common_slot,
            )
        )
        self.common_condition = z3.Or(
            self.p_choice[0] == self.p_choice[1],
            self.q_choice[0] == self.q_choice[1],
        )
        self.add(self.common_condition)

        # BoundaryIndexing D.A at the exact-17 diagnostic size.  Distinct
        # positions encode injectivity; with 17 labels this also encodes the
        # boundary image/carrier enumeration.
        self.add(*[0 <= value for value in self.pos], *[value < N for value in self.pos])
        self.add(z3.Distinct(self.pos))
        self.add(self.pos[SURPLUS_APEX] == 0)
        self.add(self.iv == self.pos[OPP1_APEX], self.iw == self.pos[OPP2_APEX])
        self.add(0 < self.iv, self.iv < N, 0 < self.iw, self.iw < N)

        # The packet's i,j witnesses are the two source blocker cap indices;
        # both blockers lie in strict cap interiors and i != j.
        blocker0, blocker1 = b.b_at(q_source), b.b_at(source5)
        self.add(blocker0 != blocker1)
        self.add(0 <= self.blocker_cap[0], self.blocker_cap[0] < 3)
        self.add(0 <= self.blocker_cap[1], self.blocker_cap[1] < 3)
        self.add(self.blocker_cap[0] != self.blocker_cap[1])
        self.add(self.interior_at(self.blocker_cap[0], blocker0))
        self.add(self.interior_at(self.blocker_cap[1], blocker1))

        # DirectBoundaryBlocks / MirrorBoundaryBlocks, literally expanded
        # from Census554.CapSelectedGeometry.lean.  Interior cardinalities are
        # the existing exact17 strict profile (6,4,4).
        self.add(
            *[
                bsum([self.interior(cap, point) for point in range(N)])
                == (6 if cap == 0 else 4)
                for cap in range(3)
            ]
        )
        direct = z3.And(
            0 < self.iv,
            self.iv < self.iw,
            *[
                z3.Implies(self.interior(2, point), z3.And(0 < self.pos[point], self.pos[point] < self.iv))
                for point in range(N)
            ],
            *[
                z3.Implies(self.interior(0, point), z3.And(self.iv < self.pos[point], self.pos[point] < self.iw))
                for point in range(N)
            ],
            *[
                z3.Implies(self.interior(1, point), self.iw < self.pos[point])
                for point in range(N)
            ],
        )
        mirror = z3.And(
            0 < self.iw,
            self.iw < self.iv,
            *[
                z3.Implies(self.interior(1, point), z3.And(0 < self.pos[point], self.pos[point] < self.iw))
                for point in range(N)
            ],
            *[
                z3.Implies(self.interior(0, point), z3.And(self.iw < self.pos[point], self.pos[point] < self.iv))
                for point in range(N)
            ],
            *[
                z3.Implies(self.interior(2, point), self.iv < self.pos[point])
                for point in range(N)
            ],
        )
        self.direct_clause, self.mirror_clause = direct, mirror
        self.add(z3.If(self.direct, direct, mirror))
        if self.forced_orientation == "direct":
            self.add(self.direct)
        elif self.forced_orientation == "mirror":
            self.add(z3.Not(self.direct))

        # Cyclic separation iff, with source btw exactly as in
        # SurplusCOMPGBankSep.lean.  B.indexOf is the position map above.
        blocker0_pos, blocker1_pos = self.pos_at(blocker0), self.pos_at(blocker1)
        self.separation = z3.Xor(
            btw(blocker0_pos, blocker1_pos, self.pos_at(q_source)),
            btw(blocker0_pos, blocker1_pos, self.pos_at(source5)),
        )
        # Xor is equivalent to the source iff: btw(p1) <-> not btw(p2).
        self.add(self.separation)

    def solver(self, extra: z3.BoolRef | None = None) -> z3.Solver:
        solver = z3.SolverFor("QF_LIA")
        solver.set(timeout=30_000, random_seed=9702)
        solver.add(self.constraints)
        if extra is not None:
            solver.add(extra)
        return solver


def concrete_value(model: z3.ModelRef, value: z3.ArithRef) -> int:
    return model.eval(value, model_completion=True).as_long()


def concrete_bool(model: z3.ModelRef, value: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(value, model_completion=True))


def validate(canary: BoundaryCanary, model: z3.ModelRef) -> list[str]:
    errors: list[str] = []
    positions = [concrete_value(model, value) for value in canary.pos]
    iv_value = concrete_value(model, canary.iv)
    iw_value = concrete_value(model, canary.iw)
    if sorted(positions) != list(range(N)):
        errors.append("boundary positions are not a permutation")
    if positions[SURPLUS_APEX] != 0:
        errors.append("wrong surplus zero-cut position")
    if positions[OPP1_APEX] != iv_value:
        errors.append("wrong opp1 position")
    if positions[OPP2_APEX] != iw_value:
        errors.append("wrong opp2 position")
    is_direct = concrete_bool(model, canary.direct)
    if canary.forced_orientation == "direct" and not is_direct:
        errors.append("forced Direct orientation is false")
    if canary.forced_orientation == "mirror" and is_direct:
        errors.append("forced Mirror orientation is false")
    for point in range(N):
        interior = [concrete_bool(model, canary.interior(cap, point)) for cap in range(3)]
        point_pos = positions[point]
        if is_direct:
            expected = ((interior[2] and 0 < point_pos < iv_value) or
                        (interior[0] and iv_value < point_pos < iw_value) or
                        (interior[1] and iw_value < point_pos))
        else:
            expected = ((interior[1] and 0 < point_pos < iw_value) or
                        (interior[0] and iw_value < point_pos < iv_value) or
                        (interior[2] and iv_value < point_pos))
        if any(interior) and not expected:
            errors.append(f"boundary block placement fails at point {point}")
    q_source = concrete_value(model, canary.role("q_source"))
    source5 = concrete_value(model, canary.role("source5"))
    blocker_positions = []
    for row, source in enumerate((q_source, source5)):
        blocker = concrete_value(model, canary.base.b_at(canary.role("q_source" if row == 0 else "source5")))
        cap_index = concrete_value(model, canary.blocker_cap[row])
        if not concrete_bool(model, canary.interior(cap_index, blocker)):
            errors.append(f"source blocker {row} is not in its indexed strict cap")
        blocker_positions.append(positions[blocker])
    def python_btw(left: int, right: int, point: int) -> bool:
        return (left < point < right) or (right < point < left)
    separation = python_btw(blocker_positions[0], blocker_positions[1], positions[q_source]) != python_btw(
        blocker_positions[0], blocker_positions[1], positions[source5]
    )
    if not separation:
        errors.append("cyclic separation fails")
    p_choices = [concrete_value(model, choice) for choice in canary.p_choice]
    q_choices = [concrete_value(model, choice) for choice in canary.q_choice]
    if p_choices[0] != p_choices[1] and q_choices[0] != q_choices[1]:
        errors.append("common deletion endpoint is absent")
    p_pair = [concrete_value(model, canary.role("p1")), concrete_value(model, canary.role("p2"))]
    q_pair = [concrete_value(model, canary.role("rho1")), concrete_value(model, canary.role("rho2"))]
    for row in range(2):
        members = [p for p in range(N) if concrete_bool(model, canary.rows[row][p])]
        if len(members) != 4:
            errors.append(f"row{row} cardinality={len(members)}")
        if not all(concrete_bool(model, field[row]) for field in (canary.source_survival, canary.first_apex_failure, canary.minimal_core_nonempty)):
            errors.append(f"row{row} deletion-core proposition is false")
        x, y = p_pair[p_choices[row]], q_pair[q_choices[row]]
        if concrete_bool(model, canary.rows[row][x]) or concrete_bool(model, canary.rows[row][y]):
            errors.append(f"row{row} retains a selected deletion endpoint")
        survivors = [point for point in members if point not in (x, y)]
        if len(survivors) != 4:
            errors.append(f"row{row} survivor cardinality={len(survivors)}")
        for source in (q_source, source5):
            if not concrete_bool(model, canary.rows[row][source]):
                errors.append(f"row{row} misses source {source}")
    return errors


def cvc5_status(solver: z3.Solver, timeout_ms: int = 15_000) -> str:
    try:
        proc = subprocess.Popen(
            ["cvc5", "--lang", "smt2", f"--tlimit-per={timeout_ms}"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except FileNotFoundError:
        return "unavailable"
    try:
        stdout, stderr = proc.communicate(solver.to_smt2(), timeout=timeout_ms / 1000 + 3)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        try:
            proc.wait(timeout=2)
        except subprocess.TimeoutExpired:
            proc.kill()
        return "timeout"
    lines = [line.strip() for line in stdout.splitlines() if line.strip()]
    if lines and lines[-1] in {"sat", "unsat", "unknown"}:
        return lines[-1]
    return f"error:{proc.returncode}:{stderr.strip()[:120]}"


def run_case(name: str, canary: BoundaryCanary, extra: z3.BoolRef | None, expected: str) -> tuple[str, str, list[str]]:
    solver = canary.solver(extra)
    smt_path = HERE / f"{name}.smt2"
    smt_path.write_text("(set-logic QF_LIA)\n" + solver.to_smt2() + "\n(check-sat)\n", encoding="utf-8")
    result = solver.check()
    actual = "sat" if result == z3.sat else "unsat" if result == z3.unsat else f"unknown:{solver.reason_unknown()}"
    if actual != expected:
        raise RuntimeError(f"{name}: expected {expected}, got {actual}")
    validation: list[str] = []
    witness = ""
    if result == z3.sat:
        model = solver.model()
        validation = validate(canary, model)
        if validation:
            raise RuntimeError(f"{name}: independent validation failed: {validation}")
        witness = " positions=" + ",".join(map(str, [concrete_value(model, x) for x in canary.pos]))
    cvc5 = cvc5_status(solver)
    return actual, cvc5, [f"{name}: z3={actual} cvc5={cvc5}{witness}"]


def main() -> int:
    results: list[str] = ["FreshThird aligned boundary v1: exact-17 finite diagnostic only; no Euclidean realization, universal closure, or n-to-general lift."]
    cases = [
        ("positive_direct", BoundaryCanary("direct"), None, "sat"),
        ("positive_mirror", BoundaryCanary("mirror"), None, "sat"),
        ("negative_overfull_source_row", BoundaryCanary("direct"), None, "sat"),
        ("negative_no_common_omission", BoundaryCanary("direct"), None, "sat"),
        ("negative_boundary_order", BoundaryCanary("direct"), None, "sat"),
        ("negative_cyclic_separation", BoundaryCanary("direct"), None, "sat"),
    ]
    # Controls are added after construction so the positive model remains the
    # exact same ingress contract.
    controls = cases[2:]
    overfull = bsum(cases[2][1].rows[0]) == 5
    no_common = z3.Not(cases[3][1].common_condition)
    bad_point = 8
    # Cap-1 (oppInterior1) must lie strictly after iw in Direct mode;
    # placing a forced interior point at/before iw is therefore malformed.
    bad_order = z3.And(cases[4][1].interior(1, bad_point), cases[4][1].pos[bad_point] <= cases[4][1].iw)
    bad_cyclic = z3.Not(cases[5][1].separation)
    extras = [overfull, no_common, bad_order, bad_cyclic]
    expected_controls = ["unsat"] * 4
    for index, extra in enumerate(extras):
        name, canary, _, _ = controls[index]
        actual, cvc5, lines = run_case(name, canary, extra, expected_controls[index])
        results.extend(lines)
    for name, canary, extra, expected in cases[:2]:
        actual, cvc5, lines = run_case(name, canary, extra, expected)
        results.extend(lines)
    (HERE / "results.txt").write_text("\n".join(results) + "\n", encoding="utf-8")
    print("\n".join(results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
