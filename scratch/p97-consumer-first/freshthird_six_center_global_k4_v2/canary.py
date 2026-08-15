#!/usr/bin/env python3
"""Exact-17 incidence/cap-composition canary for the FreshThird boundary.

This is a bounded theorem-discovery abstraction.  It does not encode Euclidean
realizability, radii, order, or a general-n lift.
"""

from __future__ import annotations

import json
import os
import signal
import subprocess
from collections import Counter
from pathlib import Path
from typing import Any

import z3

ROOT = Path(__file__).resolve().parent
N = 17
DELETED = 0
CENTERS = tuple(range(1, 7))
# B2/B3/B4 are centered at the first opposite, second opposite, and surplus
# Moser apices respectively.
APICES = (CENTERS[2], CENTERS[3], CENTERS[4])
ROLES = ("rho1", "rho2", "p1", "p2", "q_source", "q_other", "source5")


def bsum(bits: list[z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(bit, 1, 0) for bit in bits])


class Canary:
    def __init__(self, n: int = N) -> None:
        self.n = n
        self.constraints: list[z3.BoolRef] = []
        self.blocker = [z3.Int(f"blocker_{q}") for q in range(n)]
        self.shell = [[z3.Bool(f"shell_{q}_{p}") for p in range(n)] for q in range(n)]
        self.row = [[z3.Bool(f"B_{i}_{p}") for p in range(n)] for i in range(6)]
        self.cap = [[z3.Bool(f"cap_{i}_{p}") for p in range(n)] for i in range(3)]
        self.role = {name: z3.Int(name) for name in ROLES}
        self._build()

    def add(self, *items: z3.BoolRef) -> None:
        self.constraints.extend(items)

    def b_at(self, source: z3.ArithRef) -> z3.ArithRef:
        return z3.Sum([z3.If(source == q, self.blocker[q], 0) for q in range(self.n)])

    def shell_at(self, source: z3.ArithRef, point: int | z3.ArithRef) -> z3.BoolRef:
        if isinstance(point, int):
            return z3.Or(
                [z3.And(source == q, self.shell[q][point]) for q in range(self.n)]
            )
        return z3.Or(
            [
                z3.And(source == q, point == p, self.shell[q][p])
                for q in range(self.n)
                for p in range(self.n)
            ]
        )

    def row_at(self, row: int, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or([z3.And(point == p, self.row[row][p]) for p in range(self.n)])

    def cap_at(self, cap: int, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or([z3.And(point == p, self.cap[cap][p]) for p in range(self.n)])

    def pair_intersection(
        self, row: int, x: z3.ArithRef, y: z3.ArithRef
    ) -> z3.ArithRef:
        return bsum(
            [z3.And(self.row[row][p], z3.Or(x == p, y == p)) for p in range(self.n)]
        )

    def cap_interior_count(self, cap: int) -> z3.ArithRef:
        endpoints = {a for j, a in enumerate(APICES) if j != cap}
        return bsum([self.cap[cap][p] for p in range(self.n) if p not in endpoints])

    def first_interior_remainder_count(self) -> z3.ArithRef:
        source5 = self.role["source5"]
        endpoints = {APICES[1], APICES[2]}
        return bsum(
            [
                z3.And(self.cap[0][p], p != DELETED, source5 != p)
                for p in range(self.n)
                if p not in endpoints
            ]
        )

    def six_row_union_count(self) -> z3.ArithRef:
        return bsum([z3.Or([self.row[i][p] for i in range(6)]) for p in range(self.n)])

    def _build(self) -> None:
        n = self.n
        assert n == 17, "the cap-composition ingress is exact-17 only"

        # Exact closed-cap profile from the live cap-source surface plus T.
        self.add(bsum(self.cap[0]) == 8, bsum(self.cap[1]) == 6, bsum(self.cap[2]) == 6)

        # Each Moser apex is absent from its opposite closed cap and belongs to
        # the other two; every other carrier point belongs to exactly one cap.
        for i, apex in enumerate(APICES):
            for k in range(3):
                self.add(self.cap[k][apex] == (k != i))
        for p in range(n):
            if p not in APICES:
                self.add(bsum([self.cap[k][p] for k in range(3)]) == 1)

        for value in self.role.values():
            self.add(0 <= value, value < n)
        for q in range(n):
            self.add(0 <= self.blocker[q], self.blocker[q] < n)
            self.add(self.blocker[q] != q)
            self.add(bsum(self.shell[q]) == 4, self.shell[q][q])
            self.add(
                z3.And(
                    [
                        z3.Implies(self.blocker[q] == p, z3.Not(self.shell[q][p]))
                        for p in range(n)
                    ]
                )
            )

        # Symmetry normalization of points already proved distinct by the
        # boundary.  The deleted cap source has an additional distinct blocker.
        self.add(self.blocker[DELETED] == 7)
        for center in range(n):
            self.add(bsum([self.blocker[q] == center for q in range(n)]) <= 4)

        # Same-center canonical shells are the same physical radius support or
        # disjoint; distinct-center circles meet in at most two physical points.
        for q in range(n):
            for r in range(q + 1, n):
                equal_support = z3.And(
                    [self.shell[q][p] == self.shell[r][p] for p in range(n)]
                )
                intersection = bsum(
                    [z3.And(self.shell[q][p], self.shell[r][p]) for p in range(n)]
                )
                self.add(
                    z3.If(
                        self.blocker[q] == self.blocker[r],
                        z3.Or(equal_support, intersection == 0),
                        intersection <= 2,
                    )
                )

        # Six deleted exact K4 rows at the two collision blockers, three
        # apices, and surviving cap-source blocker.
        for i, center in enumerate(CENTERS):
            self.add(bsum(self.row[i]) == 4)
            self.add(z3.Not(self.row[i][DELETED]), z3.Not(self.row[i][center]))
            self.add(self.blocker[DELETED] != center)

        # Link any actual-blocker row to the carrier-wide canonical shell.
        for i, center in enumerate(CENTERS):
            for q in range(n):
                equal_support = z3.And(
                    [self.row[i][p] == self.shell[q][p] for p in range(n)]
                )
                intersection = bsum(
                    [z3.And(self.row[i][p], self.shell[q][p]) for p in range(n)]
                )
                self.add(
                    z3.If(self.blocker[q] == center, equal_support, intersection <= 2)
                )

        for i in range(6):
            for j in range(i + 1, 6):
                self.add(
                    bsum([z3.And(self.row[i][p], self.row[j][p]) for p in range(n)])
                    <= 2
                )

        rho1, rho2 = self.role["rho1"], self.role["rho2"]
        p1, p2 = self.role["p1"], self.role["p2"]
        q_source, q_other = self.role["q_source"], self.role["q_other"]
        source5 = self.role["source5"]

        self.add(rho1 != rho2, p1 != p2)
        self.add(*[r != p for r in (rho1, rho2) for p in (p1, p2)])
        self.add(self.b_at(rho1) == CENTERS[0], self.b_at(rho2) == CENTERS[0])
        self.add(self.b_at(p1) == CENTERS[1], self.b_at(p2) == CENTERS[1])
        self.add(self.b_at(q_source) == CENTERS[1])
        self.add(*[q_source != x for x in (rho1, rho2, p1, p2)])

        # The two orientations of the boundary are normalized so deleted and
        # source5 are the two distinct C cap sources.  Both lie in the strict
        # first cap and outside both collision pairs.
        self.add(*[x != DELETED for x in (rho1, rho2, p1, p2)])
        self.add(source5 != DELETED)
        self.add(*[source5 != x for x in (rho1, rho2, p1, p2)])
        self.add(self.b_at(source5) == CENTERS[5])
        for source in (z3.IntVal(DELETED), source5):
            self.add(self.cap_at(0, source))
            self.add(z3.Not(self.cap_at(1, source)), z3.Not(self.cap_at(2, source)))

        # Exact B0/B1/B5 provenance.
        self.add(self.row_at(0, rho1), self.row_at(0, rho2))
        for p in range(n):
            self.add(
                self.row[1][p] == z3.Or(p1 == p, p2 == p, q_source == p, q_other == p)
            )
        self.add(self.row_at(5, source5))

        # Newly source-proved physical cuts.  No positive B3/B4 retained-pair
        # incidence is added.
        for row in (3, 4):
            self.add(self.pair_intersection(row, p1, p2) <= 1)
            self.add(self.pair_intersection(row, rho1, rho2) <= 1)

    def solver(
        self, extra: z3.BoolRef | None = None, timeout_ms: int = 30_000
    ) -> z3.Solver:
        s = z3.SolverFor("QF_LIA")
        s.set(timeout=timeout_ms, random_seed=9702)
        s.add(self.constraints)
        if extra is not None:
            s.add(extra)
        return s


def status(solver: z3.Solver) -> tuple[str, z3.ModelRef | None]:
    result = solver.check()
    if result == z3.sat:
        return "sat", solver.model()
    if result == z3.unsat:
        return "unsat", None
    return f"unknown:{solver.reason_unknown()}", None


def eval_int(model: z3.ModelRef, value: z3.ArithRef) -> int:
    return model.eval(value, model_completion=True).as_long()


def eval_bool(model: z3.ModelRef, value: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(value, model_completion=True))


def cvc5_status(solver: z3.Solver, timeout_ms: int = 10_000) -> str:
    try:
        proc = subprocess.Popen(
            ["cvc5", "--lang", "smt2", f"--tlimit-per={timeout_ms}"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
        try:
            stdout, stderr = proc.communicate(
                solver.to_smt2(), timeout=timeout_ms / 1000 + 3
            )
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.communicate()
            return "timeout"
    except FileNotFoundError:
        return "unavailable:FileNotFoundError"
    lines = [line.strip() for line in stdout.splitlines() if line.strip()]
    if lines and lines[-1] in {"sat", "unsat", "unknown"}:
        return lines[-1]
    return f"error:{proc.returncode}:{stderr.strip()[:120]}"


def extract(c: Canary, model: z3.ModelRef) -> dict[str, Any]:
    blockers = [eval_int(model, x) for x in c.blocker]
    shells = [
        [p for p in range(c.n) if eval_bool(model, c.shell[q][p])] for q in range(c.n)
    ]
    rows = [[p for p in range(c.n) if eval_bool(model, c.row[i][p])] for i in range(6)]
    caps = [[p for p in range(c.n) if eval_bool(model, c.cap[i][p])] for i in range(3)]
    roles = {name: eval_int(model, value) for name, value in c.role.items()}
    interiors = [sorted(set(caps[i]) - (set(APICES) - {APICES[i]})) for i in range(3)]
    return {
        "n": c.n,
        "roles": roles,
        "centers": list(CENTERS),
        "apices": list(APICES),
        "blockers": blockers,
        "shells": shells,
        "rows": rows,
        "caps": caps,
        "cap_interiors": interiors,
        "first_interior_remainder": sorted(
            set(interiors[0]) - {DELETED, roles["source5"]}
        ),
        "statistics": {
            "used_blocker_centers": len(set(blockers)),
            "max_blocker_fiber": max(Counter(blockers).values()),
            "six_row_union": len(set().union(*map(set, rows))),
            "max_row_intersection": max(
                len(set(rows[i]) & set(rows[j]))
                for i in range(6)
                for j in range(i + 1, 6)
            ),
        },
    }


def verify_concrete(data: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    n = data["n"]
    b = data["blockers"]
    shells = list(map(set, data["shells"]))
    rows = list(map(set, data["rows"]))
    caps = list(map(set, data["caps"]))
    roles = data["roles"]
    if list(map(len, caps)) != [8, 6, 6]:
        errors.append("bad cap profile")
    for i, apex in enumerate(APICES):
        if any((apex in caps[k]) != (k != i) for k in range(3)):
            errors.append(f"bad apex cap pattern at {apex}")
    for p in range(n):
        if p not in APICES and sum(p in cap for cap in caps) != 1:
            errors.append(f"bad non-Moser cap composition at {p}")
    for source in (DELETED, roles["source5"]):
        if source not in caps[0] or source in caps[1] or source in caps[2]:
            errors.append(f"bad cap-source interior composition at {source}")
    for q in range(n):
        if not (0 <= b[q] < n) or b[q] == q or len(shells[q]) != 4:
            errors.append(f"bad canonical shell q={q}")
        if q not in shells[q] or b[q] in shells[q]:
            errors.append(f"bad source/center membership q={q}")
    if max(Counter(b).values()) > 4:
        errors.append("bad blocker fiber")
    for q in range(n):
        for r in range(q + 1, n):
            inter = len(shells[q] & shells[r])
            if b[q] == b[r] and not (shells[q] == shells[r] or inter == 0):
                errors.append(f"bad same-center alias q={q},r={r}")
            if b[q] != b[r] and inter > 2:
                errors.append(f"bad shell circle intersection q={q},r={r}")
    for i, center in enumerate(CENTERS):
        if len(rows[i]) != 4 or DELETED in rows[i] or center in rows[i]:
            errors.append(f"bad deleted row B{i}")
        for q in range(n):
            inter = len(rows[i] & shells[q])
            if b[q] == center and rows[i] != shells[q]:
                errors.append(f"bad row/shell equality B{i},q={q}")
            if b[q] != center and inter > 2:
                errors.append(f"bad row/shell intersection B{i},q={q}")
    for i in range(6):
        for j in range(i + 1, 6):
            if len(rows[i] & rows[j]) > 2:
                errors.append(f"bad row intersection B{i},B{j}")
    p_pair = {roles["p1"], roles["p2"]}
    rho_pair = {roles["rho1"], roles["rho2"]}
    for i in (3, 4):
        if len(rows[i] & p_pair) > 1 or len(rows[i] & rho_pair) > 1:
            errors.append(f"bad retained-pair cut B{i}")
    if not rho_pair <= rows[0]:
        errors.append("bad B0 provenance")
    expected_b1 = {roles[x] for x in ("p1", "p2", "q_source", "q_other")}
    if rows[1] != expected_b1 or len(expected_b1) != 4:
        errors.append("bad B1 provenance")
    if roles["source5"] not in rows[5]:
        errors.append("bad B5 provenance")
    if list(map(len, data["cap_interiors"])) != [6, 4, 4]:
        errors.append("bad strict-cap profile")
    if len(data["first_interior_remainder"]) != 4:
        errors.append("bad first-interior two-source remainder")
    return errors


def fixed_model_solver(c: Canary, model: z3.ModelRef) -> z3.Solver:
    s = c.solver()
    for value in c.blocker:
        s.add(value == eval_int(model, value))
    for value in c.role.values():
        s.add(value == eval_int(model, value))
    for matrix in (c.shell, c.row, c.cap):
        for line in matrix:
            for bit in line:
                s.add(bit == eval_bool(model, bit))
    return s


def minimal_control_solver(name: str) -> z3.Solver:
    s = z3.SolverFor("QF_LIA")
    if name == "overfull_B0":
        bits = [z3.Bool(f"control_overfull_{i}") for i in range(6)]
        s.add(bsum(bits) == 4, bsum(bits) >= 5)
    elif name == "source_missing_from_own_shell":
        bit = z3.Bool("control_source_mem")
        s.add(bit, z3.Not(bit))
    elif name == "illegal_center_membership":
        bit = z3.Bool("control_center_mem")
        s.add(z3.Not(bit), bit)
    elif name == "circle_intersection_violation_B0_B1":
        bits = [z3.Bool(f"control_inter_{i}") for i in range(6)]
        s.add(bsum(bits) <= 2, bsum(bits) >= 3)
    elif name == "wrong_first_cap_cardinality":
        bits = [z3.Bool(f"control_cap_{i}") for i in range(17)]
        s.add(bsum(bits) == 8, bsum(bits) != 8)
    elif name == "nonmoser_bad_cap_multiplicity":
        bits = [z3.Bool(f"control_comp_{i}") for i in range(3)]
        s.add(bsum(bits) == 1, z3.Or(bsum(bits) == 0, bsum(bits) >= 2))
    elif name == "cap_source_outside_first_interior":
        c0, c1, c2 = z3.Bools("control_source_c0 control_source_c1 control_source_c2")
        s.add(c0, z3.Not(c1), z3.Not(c2), z3.Or(z3.Not(c0), c1, c2))
    elif name == "apex_in_opposite_cap":
        bit = z3.Bool("control_apex_opposite")
        s.add(z3.Not(bit), bit)
    elif name == "B3_contains_both_p_endpoints":
        x, y = z3.Bools("control_B3_p_x control_B3_p_y")
        s.add(bsum([x, y]) <= 1, x, y)
    elif name == "B4_contains_both_rho_endpoints":
        x, y = z3.Bools("control_B4_rho_x control_B4_rho_y")
        s.add(bsum([x, y]) <= 1, x, y)
    else:
        raise ValueError(name)
    return s


def cap15_control() -> z3.Solver:
    a, b, c = z3.Ints("cap15_first cap15_second cap15_surplus")
    s = z3.SolverFor("QF_LIA")
    s.add(a >= 8, b >= 6, c >= 6, a + b + c == 18)
    return s


def fiber_floor_control() -> z3.Solver:
    fibers = [z3.Int(f"fiber_{i}") for i in range(4)]
    s = z3.SolverFor("QF_LIA")
    s.add(*[z3.And(0 <= x, x <= 4) for x in fibers], z3.Sum(fibers) == 17)
    return s


def independent_cap_remainder_control() -> z3.Solver:
    """Negation of: an 8-cap minus two endpoints and two sources has size 4."""
    interior, two_sources, remainder = z3.Ints("interior two_sources remainder")
    s = z3.SolverFor("QF_LIA")
    s.add(interior + 2 == 8, two_sources == 2, remainder == interior - two_sources)
    s.add(remainder != 4)
    return s


def retained_pair_probes(c: Canary) -> dict[str, dict[str, str]]:
    result: dict[str, dict[str, str]] = {}
    pairs = {
        "p": (c.role["p1"], c.role["p2"]),
        "rho": (c.role["rho1"], c.role["rho2"]),
    }
    for row in (3, 4):
        for name, (x, y) in pairs.items():
            count = c.pair_intersection(row, x, y)
            avoid, _ = status(c.solver(count == 0))
            hit, _ = status(c.solver(count == 1))
            result[f"B{row}_{name}"] = {
                "avoid_pair": avoid,
                "hit_exactly_one": hit,
                "forced_positive_hit": "no" if avoid == "sat" else "unresolved",
            }
    for name, (x, y) in pairs.items():
        no_hit = z3.And(
            c.pair_intersection(3, x, y) == 0, c.pair_intersection(4, x, y) == 0
        )
        both_avoid, _ = status(c.solver(no_hit))
        result[f"B3_B4_{name}"] = {
            "both_rows_avoid_pair": both_avoid,
            "forced_hit_across_rows": "no" if both_avoid == "sat" else "unresolved",
        }
    return result


def row_union_projection_solver(row_count: int, universe: int) -> z3.Solver:
    """Abstract four-sets on a fixed universe, pair intersections <=2."""
    row = [
        [z3.Bool(f"union{row_count}_{universe}_B_{i}_{p}") for p in range(universe)]
        for i in range(row_count)
    ]
    s = z3.SolverFor("QF_LIA")
    s.set(timeout=30_000, random_seed=9702)
    for i in range(row_count):
        s.add(bsum(row[i]) == 4)
    for i in range(row_count):
        for j in range(i + 1, row_count):
            s.add(bsum([z3.And(row[i][p], row[j][p]) for p in range(universe)]) <= 2)
    return s


def minimal_row_union_projection() -> dict[str, Any]:
    three_u6 = row_union_projection_solver(3, 6)
    four_u6 = row_union_projection_solver(4, 6)
    four_u7 = row_union_projection_solver(4, 7)
    z_three_u6, _ = status(three_u6)
    z_four_u6, _ = status(four_u6)
    z_four_u7, _ = status(four_u7)
    return {
        "three_rows_on_six_points_minimality_witness": {
            "z3": z_three_u6,
            "cvc5": cvc5_status(three_u6, 30_000),
        },
        "four_rows_union_card_at_most_six": {
            "z3": z_four_u6,
            "cvc5": cvc5_status(four_u6, 30_000),
        },
        "four_rows_on_seven_points_sharpness_witness": {
            "z3": z_four_u7,
            "cvc5": cvc5_status(four_u7, 30_000),
        },
        "candidate_clause": "four exact-four rows with pairwise intersections <=2 have union card >=7",
        "minimality": "three rows can have union card 6; four rows already force card >=7",
        "scope": "pure finite-set projection; candidate general-n Lean lemma, not promoted",
    }


def main() -> None:
    c = Canary()
    base_solver = c.solver()
    base_status, model = status(base_solver)

    control_names = (
        "overfull_B0",
        "source_missing_from_own_shell",
        "illegal_center_membership",
        "circle_intersection_violation_B0_B1",
        "wrong_first_cap_cardinality",
        "nonmoser_bad_cap_multiplicity",
        "cap_source_outside_first_interior",
        "apex_in_opposite_cap",
        "B3_contains_both_p_endpoints",
        "B4_contains_both_rho_endpoints",
    )
    controls: dict[str, dict[str, str]] = {}
    for name in control_names:
        local = minimal_control_solver(name)
        zstatus, _ = status(local)
        controls[name] = {"z3": zstatus, "cvc5": cvc5_status(local, 5_000)}

    model_data: dict[str, Any] | None = None
    readback_errors: list[str] = []
    pinned_cvc5 = "not-run"
    if model is not None:
        model_data = extract(c, model)
        readback_errors = verify_concrete(model_data)
        (ROOT / "model.json").write_text(
            json.dumps(model_data, indent=2, sort_keys=True) + "\n"
        )
        pinned_cvc5 = cvc5_status(fixed_model_solver(c, model), 30_000)

    cap15 = cap15_control()
    cap15_z3, _ = status(cap15)
    fiber = fiber_floor_control()
    fiber_z3, _ = status(fiber)
    remainder = independent_cap_remainder_control()
    remainder_z3, _ = status(remainder)

    strict_profile_negation = z3.Or(
        c.cap_interior_count(0) != 6,
        c.cap_interior_count(1) != 4,
        c.cap_interior_count(2) != 4,
    )
    strict_profile_status, _ = status(c.solver(strict_profile_negation))
    first_remainder_status, _ = status(
        c.solver(c.first_interior_remainder_count() != 4)
    )

    payload = {
        "schema": "freshthird-six-center-global-k4-v2-cap-composition",
        "scope": "exact n=17 bounded incidence/cap-composition abstraction; no geometry/order/general-n lift",
        "solvers": {
            "z3": z3.get_version_string(),
            "cvc5": subprocess.run(
                ["cvc5", "--version"], capture_output=True, text=True, check=False
            ).stdout.splitlines()[0],
        },
        "base": {
            "z3": base_status,
            "cvc5_unpinned_30s": cvc5_status(base_solver, 30_000),
            "cvc5_z3_model_pinned_30s": pinned_cvc5,
            "python_concrete_readback": "verified" if not readback_errors else "failed",
            "readback_errors": readback_errors,
        },
        "controls": controls,
        "n15_invalid_scope_cap_arithmetic": {
            "z3": cap15_z3,
            "cvc5": cvc5_status(cap15, 5_000),
        },
        "forced_clauses": {
            "at_least_five_blocker_centers_negation": {
                "z3": fiber_z3,
                "cvc5": cvc5_status(fiber, 5_000),
            },
            "strict_cap_profile_6_4_4_negation_full_model": strict_profile_status,
            "first_interior_minus_two_sources_card_eq_four_negation_full_model": first_remainder_status,
            "first_interior_minus_two_sources_card_eq_four_negation_arithmetic": {
                "z3": remainder_z3,
                "cvc5": cvc5_status(remainder, 5_000),
            },
        },
        "retained_pair_discovery": retained_pair_probes(c),
        "row_union_projection": minimal_row_union_projection(),
        "model_file": "model.json" if model_data is not None else None,
    }
    (ROOT / "run-results.json").write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "base": payload["base"],
                "forced_clauses": payload["forced_clauses"],
                "retained_pair_discovery": payload["retained_pair_discovery"],
                "row_union_projection": payload["row_union_projection"],
                "controls_all_unsat": all(
                    v["z3"] == "unsat" and v["cvc5"] == "unsat"
                    for v in controls.values()
                ),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
