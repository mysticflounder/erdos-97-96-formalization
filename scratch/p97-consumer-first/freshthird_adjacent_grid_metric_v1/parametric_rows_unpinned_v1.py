#!/usr/bin/env python3
"""Unpinned exact-NRA replay for one corrected FreshThird mutual-C leaf.

This diagnostic fixes only a finite direct/orientation-0 incidence signature.
The Euclidean coordinates remain Real variables.  In particular, no previous
rational coordinate witness is pinned.  The Q row is the imported actual
canonical shell.  The imported finite canary only exposes the post-deletion
B5 row, which forbids label 0, so the two C rows are explicitly fresh
pre-deletion exact-four support choices centered at the imported blockers.

The script is an exact-17 frozen-signature probe, not a universal FreshThird
producer and not a proof of Erdos 97.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import signal
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_adjacent_grid_metric_v1 as core  # noqa: E402

BASE = core.V2.BASE
N = core.N
APICES = core.APICES
OUT = HERE / "parametric_rows_unpinned_v1_results.json"
REPORT = HERE / "parametric_rows_unpinned_v1_RESULTS.md"
PREFIX = "parametric_rows_unpinned_v1_"

# Preserve the already-audited seven non-C labels while correcting which
# labels play C.firstSource and C.secondSource.  Structural supports, caps,
# blockers' cap locations, grid supports, and boundary positions are solved.
ROLE_LABELS = {
    "rho1": 6,
    "rho2": 2,
    "p1": 5,
    "p2": 13,
    "q_source": 4,
    "q_other": 1,
    "source5": 15,
}


def bsum(bits: list[z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(bit, 1, 0) for bit in bits])


def status(result: z3.CheckSatResult, solver: z3.Solver) -> str:
    if result == z3.sat:
        return "sat"
    if result == z3.unsat:
        return "unsat"
    return f"unknown:{solver.reason_unknown()}"


CHECK_SAT_RE = re.compile(r"(?im)^\s*\(check-sat(?:-assuming)?(?:\s|\))")


def check_sat_count(smt2: str) -> int:
    """Count executable check-sat queries in an SMT-LIB serialization."""
    return len(CHECK_SAT_RE.findall(smt2))


def one_query_smt2(smt2: str) -> str:
    """Return SMT-LIB with exactly one query, adding it only when absent."""
    count = check_sat_count(smt2)
    if count > 1:
        raise ValueError(f"expected at most one check-sat query, got {count}")
    if count == 0:
        return smt2.rstrip() + "\n(check-sat)\n"
    return smt2 if smt2.endswith("\n") else smt2 + "\n"


def classify_cvc5_output(stdout: str, stderr: str, returncode: int) -> str:
    """Classify cvc5 only after process and explicit error checks."""
    if returncode != 0:
        return f"error:exit:{returncode}:{stderr.strip()[:160]}"
    if "(error" in stdout.lower() or "error" in stderr.lower():
        detail = (stderr.strip() or stdout.strip())[:160]
        return f"error:cvc5:{detail}"
    answers = [
        line.strip()
        for line in stdout.splitlines()
        if line.strip() in {"sat", "unsat", "unknown"}
    ]
    if len(answers) != 1:
        return f"error:protocol:expected_one_result_got_{len(answers)}"
    return answers[0]


def cvc5_status(smt2: str, timeout_ms: int, nonlinear: bool = True) -> str:
    query_count = check_sat_count(smt2)
    if query_count != 1:
        return f"error:protocol:expected_one_check_sat_got_{query_count}"
    command = ["cvc5", "--lang", "smt2", "--tlimit", str(timeout_ms)]
    if nonlinear:
        command.extend(["--nl-cov", "--force-logic=QF_NRA"])
    else:
        command.append("--force-logic=QF_LIA")
    try:
        process = subprocess.Popen(
            command,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except FileNotFoundError:
        return "unavailable:FileNotFoundError"
    try:
        stdout, stderr = process.communicate(
            smt2, timeout=timeout_ms / 1000 + 20
        )
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.communicate()
        return "timeout"
    if process.returncode != 0:
        return classify_cvc5_output(stdout, stderr, process.returncode)
    if "interrupted by timeout" in stderr.lower():
        return "unknown:timeout"
    return classify_cvc5_output(stdout, stderr, process.returncode)


class StructuralLeaf:
    """Corrected direct-0 finite packet over the exact-17 incidence canary."""

    def __init__(self, timeout_ms: int) -> None:
        self.base = BASE.Canary(N)
        self.solver = z3.SolverFor("QF_LIA")
        self.solver.set(timeout=timeout_ms, random_seed=9721)
        self.solver.add(self.base.constraints)
        b = self.base

        for name, point in ROLE_LABELS.items():
            self.solver.add(b.role[name] == point)
        roles = list(b.role.values())
        self.solver.add(z3.Distinct(roles), *[role != 0 for role in roles])

        self.first_source = z3.IntVal(0)
        self.second_source = b.role["source5"]
        self.q_source = b.role["q_source"]
        self.c_blockers = (b.b_at(self.first_source), b.b_at(self.second_source))
        self.q_blocker = b.b_at(self.q_source)

        # The imported B5 is post-deletion and cannot contain label 0.  It is
        # not the mutual branch's pre-deletion C shell.  Represent both live C
        # supports explicitly: exact four, mutually source-entitled, centered
        # later at b_at(0)/b_at(source5), and intersecting exactly in the pair.
        self.solver.add(self.c_blockers[0] != self.c_blockers[1])
        self.c_rows = [
            [z3.Bool(f"unpinned_c_row_{row}_{point}") for point in range(N)]
            for row in range(2)
        ]
        for row in range(2):
            self.solver.add(bsum(self.c_rows[row]) == 4)
            self.solver.add(
                self.c_rows[row][0], self.c_rows[row][ROLE_LABELS["source5"]]
            )
        for point in range(N):
            self.solver.add(
                z3.And(self.c_rows[0][point], self.c_rows[1][point])
                == z3.Or(point == 0, point == ROLE_LABELS["source5"])
            )
            for row in range(2):
                self.solver.add(
                    z3.Implies(
                        self.c_blockers[row] == point,
                        z3.Not(self.c_rows[row][point]),
                    )
                )

        # The separate Q.B1 row is already linked by BASE to shell[q_source]
        # at its actual blocker and equals {p1,p2,q_source,q_other}.
        self.q_support = [
            b.shell[ROLE_LABELS["q_source"]][point] for point in range(N)
        ]

        # Two exact four-point radii centered later at first apex APICES[0].
        self.radius_points = [
            [z3.Bool(f"unpinned_radius_{r}_{p}") for p in range(N)]
            for r in range(2)
        ]
        self.grid_hits = [
            [
                [z3.Bool(f"unpinned_hit_{r}_{side}_{p}") for p in range(N)]
                for side in range(2)
            ]
            for r in range(2)
        ]
        for radius in range(2):
            self.solver.add(bsum(self.radius_points[radius]) == 4)
        for point in range(N):
            self.solver.add(
                z3.Not(
                    z3.And(self.radius_points[0][point], self.radius_points[1][point])
                )
            )
        for radius in range(2):
            for side, cap in enumerate((1, 2)):
                for point in range(N):
                    self.solver.add(
                        self.grid_hits[radius][side][point]
                        == z3.And(self.radius_points[radius][point], b.cap[cap][point])
                    )
                self.solver.add(bsum(self.grid_hits[radius][side]) == 1)
        for side, cap in enumerate((1, 2)):
            self.solver.add(
                z3.Or(
                    *[
                        z3.And(
                            self.grid_hits[radius][side][point],
                            self.interior(cap, point),
                        )
                        for radius in range(2)
                        for point in range(N)
                    ]
                )
            )

        # The frozen centers of C0, C15, Q.B1, and the two grid radii are
        # pairwise distinct except for the grid pair itself.  Distinct circles
        # have support intersection at most two; the grid pair is disjoint.
        for c_row in self.c_rows:
            self.solver.add(
                bsum([z3.And(c_row[p], self.q_support[p]) for p in range(N)]) <= 2
            )
            for grid in self.radius_points:
                self.solver.add(
                    bsum([z3.And(c_row[p], grid[p]) for p in range(N)]) <= 2
                )
        for grid in self.radius_points:
            self.solver.add(
                bsum([z3.And(grid[p], self.q_support[p]) for p in range(N)]) <= 2
            )

        # Structural consequence of the later first-apex singleton slices:
        # if a C source lies on one of the exact grid radii, no other point of
        # C's own strict cap may lie on that same grid support.  The first
        # attempted leaf violated this twice and was exactly UNSAT at slices.
        for source in (0, ROLE_LABELS["source5"]):
            for grid in self.radius_points:
                for point in range(N):
                    if point != source:
                        self.solver.add(
                            z3.Implies(
                                grid[source],
                                z3.Not(z3.And(grid[point], self.interior(0, point))),
                            )
                        )

        # Distinct blocker strict-cap witnesses from the aligned boundary
        # packet, now attached to C's actual sources 0 and source5.
        self.blocker_caps = z3.Ints("unpinned_c_blocker_cap0 unpinned_c_blocker_cap1")
        self.solver.add(
            *[z3.And(0 <= cap, cap < 3) for cap in self.blocker_caps],
            self.blocker_caps[0] != self.blocker_caps[1],
            self.interior_at(self.blocker_caps[0], self.c_blockers[0]),
            self.interior_at(self.blocker_caps[1], self.c_blockers[1]),
        )

        # Fresh direct boundary clauses and corrected cyclic separation.
        self.positions = [z3.Int(f"unpinned_pos_{p}") for p in range(N)]
        self.solver.add(
            z3.Distinct(self.positions),
            *[z3.And(0 <= value, value < N) for value in self.positions],
            self.positions[APICES[2]] == 0,
        )
        iv, iw = self.positions[APICES[0]], self.positions[APICES[1]]
        self.solver.add(0 < iv, iv < iw)
        for point in range(N):
            self.solver.add(
                z3.Implies(
                    self.interior(1, point),
                    z3.And(0 < self.positions[point], self.positions[point] < iv),
                ),
                z3.Implies(
                    self.interior(2, point),
                    z3.And(iv < self.positions[point], self.positions[point] < iw),
                ),
                z3.Implies(self.interior(0, point), iw < self.positions[point]),
            )
        b0, b1 = map(self.position_at, self.c_blockers)
        s0, s1 = self.positions[0], self.position_at(self.second_source)
        self.separation = z3.Xor(core.V2.btw(b0, b1, s0), core.V2.btw(b0, b1, s1))
        self.solver.add(self.separation)

        # Frozen direct radial-order arm 0.
        r0l, r0r = self.hit_position(0, 0), self.hit_position(0, 1)
        r1l, r1r = self.hit_position(1, 0), self.hit_position(1, 1)
        self.solver.add(r1l < r0l, r0l < r0r, r0r < r1r)

    def interior(self, cap: int, point: int) -> z3.BoolRef:
        endpoints = {apex for index, apex in enumerate(APICES) if index != cap}
        return z3.And(self.base.cap[cap][point], z3.BoolVal(point not in endpoints))

    def interior_at(self, cap: z3.ArithRef, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(
            *[
                z3.And(cap == index, point == label, self.interior(index, label))
                for index in range(3)
                for label in range(N)
            ]
        )

    def position_at(self, point: z3.ArithRef) -> z3.ArithRef:
        return z3.Sum(
            [z3.If(point == label, self.positions[label], 0) for label in range(N)]
        )

    def hit_position(self, radius: int, side: int) -> z3.ArithRef:
        return z3.Sum(
            [
                z3.If(self.grid_hits[radius][side][point], self.positions[point], 0)
                for point in range(N)
            ]
        )

    @staticmethod
    def _bool(model: z3.ModelRef, value: z3.BoolRef) -> bool:
        return z3.is_true(model.eval(value, model_completion=True))

    @staticmethod
    def _int(model: z3.ModelRef, value: z3.ArithRef) -> int:
        return model.eval(value, model_completion=True).as_long()

    def extract(self, model: z3.ModelRef) -> dict[str, Any]:
        b = self.base
        roles = {name: self._int(model, value) for name, value in b.role.items()}
        sources = (0, roles["source5"])
        c_rows = [
            [point for point in range(N) if self._bool(model, self.c_rows[row][point])]
            for row in range(2)
        ]
        q_support = [
            point
            for point in range(N)
            if self._bool(model, b.shell[roles["q_source"]][point])
        ]
        supports = [
            [
                point
                for point in range(N)
                if self._bool(model, self.radius_points[radius][point])
            ]
            for radius in range(2)
        ]
        hits = [
            [
                next(
                    point
                    for point in range(N)
                    if self._bool(model, self.grid_hits[radius][side][point])
                )
                for side in range(2)
            ]
            for radius in range(2)
        ]
        return {
            "orientation": "direct",
            "radial_branch": 0,
            "roles": roles,
            "c_sources": list(sources),
            "c_blockers": [self._int(model, value) for value in self.c_blockers],
            "q_blocker": self._int(model, self.q_blocker),
            "c_rows": c_rows,
            "q_row": q_support,
            "positions": [self._int(model, value) for value in self.positions],
            "caps": [
                [
                    point
                    for point in range(N)
                    if self._bool(model, b.cap[cap][point])
                ]
                for cap in range(3)
            ],
            "blocker_caps": [self._int(model, value) for value in self.blocker_caps],
            "radius_supports": supports,
            "grid_hits": hits,
        }

    def block_c_support_pair(self, signature: dict[str, Any]) -> None:
        terms: list[z3.BoolRef] = []
        for row, support in enumerate(signature["c_rows"]):
            selected = set(support)
            terms.extend(
                self.c_rows[row][point] == (point in selected) for point in range(N)
            )
        self.solver.add(z3.Not(z3.And(*terms)))


def validate_structural(signature: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    sources = set(signature["c_sources"])
    rows = list(map(set, signature["c_rows"]))
    if sources != {0, ROLE_LABELS["source5"]}:
        errors.append("wrong C source pair")
    if any(len(row) != 4 or not sources <= row for row in rows):
        errors.append("C row is not exact-four and mutually source-entitled")
    if rows[0] & rows[1] != sources:
        errors.append("C row intersection is not exactly the source pair")
    if signature["q_row"] != sorted(
        ROLE_LABELS[name] for name in ("p1", "p2", "q_source", "q_other")
    ):
        errors.append("Q.B1 support mismatch")
    if signature["c_blockers"][0] == signature["c_blockers"][1]:
        errors.append("C blockers are not distinct")
    if set(signature["radius_supports"][0]) & set(signature["radius_supports"][1]):
        errors.append("unequal grid radii have intersecting supports")
    if sorted(signature["positions"]) != list(range(N)):
        errors.append("boundary positions are not a permutation")
    return errors


def enumerate_structural(timeout_ms: int, limit: int) -> tuple[str, str, list[dict[str, Any]]]:
    leaf = StructuralLeaf(timeout_ms)
    structural_smt2 = one_query_smt2(leaf.solver.to_smt2())
    (HERE / f"{PREFIX}structural.smt2").write_text(structural_smt2)
    cvc5 = cvc5_status(structural_smt2, timeout_ms, nonlinear=False)
    candidates: list[dict[str, Any]] = []
    terminal = "unknown:not-run"
    for _ in range(limit):
        result = leaf.solver.check()
        terminal = status(result, leaf.solver)
        if result != z3.sat:
            break
        signature = leaf.extract(leaf.solver.model())
        errors = validate_structural(signature)
        signature["validation"] = "pass" if not errors else errors
        candidates.append(signature)
        leaf.block_c_support_pair(signature)
    return terminal, cvc5, candidates


class CorrectedReplay(core.MetricReplay):
    """Core Euclidean replay with corrected actual Q/C exact rows."""

    def __init__(self, signature: dict[str, Any], timeout_ms: int) -> None:
        core_signature = core.Signature(
            orientation=signature["orientation"],
            radial_branch=signature["radial_branch"],
            roles=signature["roles"],
            blockers=tuple(signature["c_blockers"]),
            positions=tuple(signature["positions"]),
            caps=tuple(tuple(cap) for cap in signature["caps"]),
            rows=tuple(tuple(row) for row in signature["c_rows"]),
            radius_supports=tuple(tuple(row) for row in signature["radius_supports"]),
            grid_hits=tuple(tuple(row) for row in signature["grid_hits"]),
        )
        super().__init__(core_signature, timeout_ms)
        self.source_signature = signature
        self._replace_corrected_groups()

    def _replace_corrected_groups(self) -> None:
        sig = self.source_signature
        rows = (
            (sig["q_blocker"], set(sig["q_row"]), "q"),
            (sig["c_blockers"][0], set(sig["c_rows"][0]), "c_first"),
            (sig["c_blockers"][1], set(sig["c_rows"][1]), "c_second"),
        )
        corrected: list[z3.BoolRef] = []
        self.row_radii: list[z3.ArithRef] = []
        for center, support, name in rows:
            radius = z3.Real(f"unpinned_{name}_row_sq")
            self.row_radii.append(radius)
            corrected.append(radius > 0)
            for point in range(N):
                equality = core.d2_expr(self.x, self.y, center, point) == radius
                corrected.append(equality if point in support else z3.Not(equality))
        self.groups["rows"] = corrected

        # The FreshThird singleton slices belong to the two C sources, not to
        # q_source.  Singleton is relative to C's own strict cap.
        v1, v2, v3 = APICES
        sources = tuple(sig["c_sources"])
        own_interior = set(sig["caps"][0]) - {v2, v3}
        slices = [
            core.d2_expr(self.x, self.y, v1, sources[0])
            != core.d2_expr(self.x, self.y, v1, sources[1])
        ]
        for source in sources:
            source_distance = core.d2_expr(self.x, self.y, v1, source)
            for point in own_interior - {source}:
                slices.append(
                    core.d2_expr(self.x, self.y, v1, point) != source_distance
                )
        self.groups["source_slices"] = slices


def exact_rational_coordinates(
    replay: CorrectedReplay, model: z3.ModelRef
) -> dict[int, list[str]] | None:
    coordinates: dict[int, list[str]] = {}
    for point in range(N):
        pair: list[str] = []
        for value in (model.eval(replay.x[point], model_completion=True), model.eval(replay.y[point], model_completion=True)):
            if not z3.is_rational_value(value):
                return None
            pair.append(value.as_fraction().__str__())
        coordinates[point] = pair
    return coordinates


def pin_coordinates(
    solver: z3.Solver, replay: CorrectedReplay, coordinates: dict[int, list[str]]
) -> None:
    for point, (x_value, y_value) in coordinates.items():
        solver.add(replay.x[point] == z3.RealVal(x_value))
        solver.add(replay.y[point] == z3.RealVal(y_value))


def solve_stage(replay: CorrectedReplay, stage: str, timeout_ms: int) -> dict[str, Any]:
    solver = replay.solver(stage)
    smt2 = one_query_smt2(solver.to_smt2())
    artifact = HERE / f"{PREFIX}{stage}.smt2"
    artifact.write_text(smt2)
    started = time.monotonic()
    with ThreadPoolExecutor(max_workers=2) as pool:
        cvc_future = pool.submit(cvc5_status, smt2, timeout_ms, True)
        result = solver.check()
        z3_status = status(result, solver)
        cvc_status = cvc_future.result()
    record: dict[str, Any] = {
        "stage": stage,
        "z3": z3_status,
        "cvc5": cvc_status,
        "seconds": round(time.monotonic() - started, 3),
        "smt2": artifact.name,
        "assertions": len(solver.assertions()),
    }
    if result == z3.sat:
        errors = replay.validate(stage, solver.model())
        record["z3_exact_model_validation"] = "pass" if not errors else errors
        coordinates = exact_rational_coordinates(replay, solver.model())
        if coordinates is None:
            record["common_exact_witness"] = "not_rebuilt:z3_model_contains_algebraic_values"
        else:
            pinned = replay.solver(stage)
            pin_coordinates(pinned, replay, coordinates)
            pinned_result = pinned.check()
            pinned_z3 = status(pinned_result, pinned)
            pinned_cvc5 = cvc5_status(one_query_smt2(pinned.to_smt2()), timeout_ms, True)
            record["common_exact_witness"] = {
                "coordinates": coordinates,
                "z3_replay": pinned_z3,
                "cvc5_replay": pinned_cvc5,
                "claimed": pinned_z3 == "sat" and pinned_cvc5 == "sat",
            }
    return record


def control_solver(name: str, timeout_ms: int) -> tuple[z3.Solver, str]:
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    if name == "sat_rational_circle":
        x, y, radius = z3.Reals("control_x control_y control_radius")
        solver.add(x == 3, y == 4, radius == 25, x * x + y * y == radius)
        expected = "sat"
    elif name == "stale_row15_missing_cross_source":
        member = z3.Bool("control_row15_contains_0")
        solver.add(member, z3.Not(member))
        expected = "unsat"
    elif name == "positive_row_contains_its_center":
        radius = z3.Real("control_positive_row_radius")
        solver.add(radius > 0, z3.RealVal(0) == radius)
        expected = "unsat"
    elif name == "ordered_grid_supports_overlap":
        r0, r1, distance = z3.Reals("control_r0 control_r1 control_shared_d2")
        solver.add(r0 > 0, r1 > 0, r0 < r1, distance == r0, distance == r1)
        expected = "unsat"
    else:
        raise ValueError(name)
    return solver, expected


def run_controls(timeout_ms: int) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for name in (
        "sat_rational_circle",
        "stale_row15_missing_cross_source",
        "positive_row_contains_its_center",
        "ordered_grid_supports_overlap",
    ):
        solver, expected = control_solver(name, timeout_ms)
        result = solver.check()
        z3_status = status(result, solver)
        cvc_status = cvc5_status(one_query_smt2(solver.to_smt2()), timeout_ms, True)
        records.append(
            {
                "name": name,
                "expected": expected,
                "z3": z3_status,
                "cvc5": cvc_status,
                "pass": z3_status == expected and cvc_status == expected,
            }
        )
    return records


def run_protocol_controls() -> list[dict[str, Any]]:
    """Check that malformed/error cvc5 output is never promoted to SAT."""
    duplicate = "(set-logic QF_LIA)\n(assert true)\n(check-sat)\n(check-sat)\n"
    duplicate_status = cvc5_status(duplicate, 1_000, nonlinear=False)
    nonzero_status = classify_cvc5_output("sat\n", "(error \"bad query\")\n", 1)
    stderr_status = classify_cvc5_output("sat\n", "cvc5 error: bad query\n", 0)
    return [
        {
            "name": "duplicate_check_sat",
            "expected_prefix": "error:protocol:expected_one_check_sat_got_2",
            "status": duplicate_status,
            "pass": duplicate_status.startswith(
                "error:protocol:expected_one_check_sat_got_2"
            ),
        },
        {
            "name": "nonzero_exit_with_sat_stdout",
            "expected_prefix": "error:exit:1",
            "status": nonzero_status,
            "pass": nonzero_status.startswith("error:exit:1"),
        },
        {
            "name": "cvc5_error_with_sat_stdout",
            "expected_prefix": "error:cvc5:",
            "status": stderr_status,
            "pass": stderr_status.startswith("error:cvc5:"),
        },
    ]


def choose_candidate(candidates: list[dict[str, Any]]) -> int:
    """Prefer fewer cross-row/grid overlaps; break ties lexicographically."""
    def key(index: int) -> tuple[Any, ...]:
        candidate = candidates[index]
        c_rows = list(map(set, candidate["c_rows"]))
        q_row = set(candidate["q_row"])
        grids = list(map(set, candidate["radius_supports"]))
        overlap = sum(len(row & q_row) for row in c_rows)
        overlap += sum(len(row & grid) for row in c_rows for grid in grids)
        return overlap, candidate["c_rows"], candidate["radius_supports"]

    return min(range(len(candidates)), key=key)


def write_report(data: dict[str, Any]) -> None:
    selected = data.get("selected_signature")
    lines = [
        "# FreshThird corrected mutual-C unpinned replay v1",
        "",
        "## Scope",
        "",
        "This is one exact-17, direct-orientation, radial-branch-0 frozen structural leaf. "
        "It is a bounded diagnostic, not a universal FreshThird producer, a general-n lift, "
        "or a proof of Erdos 97. Euclidean coordinates are unpinned Real variables.",
        "",
        "The roles are distinct: `C.firstSource=0`, `C.secondSource=source5`, "
        "`Q.source=q_source`, and `Q.otherOutsidePoint=q_other`. The imported canary's "
        "post-deletion B5 row cannot represent the mutual C shell because it forbids label "
        "0. The C supports are therefore enumerated pre-deletion exact-four choices: both "
        "contain both C sources and intersect exactly in the source pair. Q.B1 remains a "
        "third, separate imported canonical shell.",
        "",
    ]
    if "structural" in data:
        lines += [
            "## Structural selection",
            "",
            f"- Z3 enumeration terminal: `{data['structural']['z3_terminal']}`",
            f"- cvc5 structural-existence replay: `{data['structural']['cvc5']}`",
            f"- Enumerated source-entitled C support pairs: {len(data['structural']['candidates'])}",
            f"- Enumeration complete: `{data['structural']['enumeration_complete']}`",
        ]
    else:
        lines += ["## Structural selection", "", "Not run in smoke-only mode."]
    if selected:
        lines += [
            f"- Selected C sources: `{selected['c_sources']}`; blockers: `{selected['c_blockers']}`",
            f"- Selected C rows: `{selected['c_rows']}`; exact intersection: `{sorted(set(selected['c_rows'][0]) & set(selected['c_rows'][1]))}`",
            f"- Separate Q row at blocker {selected['q_blocker']}: `{selected['q_row']}`",
            f"- Grid supports: `{selected['radius_supports']}`",
        ]
    lines += [
        "",
        "## CEGAR refinements",
        "",
        "- Source fidelity: reject the imported post-deletion B5 support as a live mutual-C "
        "support because it omits label 0; enumerate pre-deletion source-entitled supports.",
        "- Slice compatibility: reject any grid support containing a C source together with "
        "another point of C's own strict cap. Such a leaf is exactly contradictory to the "
        "later first-apex singleton slice and is a genuine structural cut, not a numerical cut.",
    ]
    lines += ["", "## cvc5 protocol controls", ""]
    for control in data["protocol_controls"]:
        lines.append(
            f"- `{control['name']}` expected `{control['expected_prefix']}...`: "
            f"status `{control['status']}`; pass={control['pass']}"
        )
    lines += ["", "## Malformed controls", ""]
    for control in data["controls"]:
        lines.append(
            f"- `{control['name']}` expected `{control['expected']}`: "
            f"Z3 `{control['z3']}`, cvc5 `{control['cvc5']}`; pass={control['pass']}"
        )
    lines += ["", "## Incremental exact NRA", ""]
    for stage in data.get("stages", []):
        witness = stage.get("common_exact_witness", "none")
        claim = witness.get("claimed") if isinstance(witness, dict) else witness
        lines.append(
            f"- `{stage['stage']}`: Z3 `{stage['z3']}`, cvc5 `{stage['cvc5']}` "
            f"({stage['seconds']}s); common exact witness={claim}"
        )
    lines += [
        "",
        "## Omitted hypotheses / claim boundary",
        "",
        "- Only one selected finite support/cap/order leaf is replayed; support enumeration is not exhaustive.",
        "- No numerical proposal is treated as evidence; this version uses exact unpinned SMT directly.",
        "- No general-cardinality lift, universal support choice, Lean proof, or end-to-end FreshThird consumer is supplied.",
        "- SAT is claimed for a common coordinate witness only when rational coordinates are rebuilt exactly and both Z3 and cvc5 replay that pinned witness as SAT.",
        "- UNKNOWN/timeout is not interpreted as UNSAT. The old pinned rational witness failing the row stage is not used as a cut.",
        "- cvc5 `error:*` statuses are fail-closed process/protocol failures, not SAT or UNSAT.",
        "",
    ]
    REPORT.write_text("\n".join(lines))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--enumerate", type=int, default=6)
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()

    controls = run_controls(min(args.timeout_ms, 5_000))
    protocol_controls = run_protocol_controls()
    data: dict[str, Any] = {
        "scope": "exact-17 frozen direct-0 structural leaf; not universal",
        "coordinate_mode": "unpinned exact Real variables",
        "timeout_ms_per_engine": args.timeout_ms,
        "role_contract": {
            "C.firstSource": 0,
            "C.secondSource": "source5",
            "Q.source": "q_source",
            "Q.otherOutsidePoint": "q_other",
        },
        "controls": controls,
        "protocol_controls": protocol_controls,
        "cegar_refinements": [
            {
                "kind": "source_fidelity",
                "cut": "post-deletion B5 omits 0 and cannot instantiate mutual C cross-membership",
            },
            {
                "kind": "source_slice_structural",
                "cut": "if a grid support contains a C source, it contains no other own-strict-cap point",
                "justification": "otherwise exact grid radius equality contradicts the singleton first-apex slice",
            },
        ],
        "stages": [],
    }
    if not all(control["pass"] for control in controls + protocol_controls):
        data["terminal"] = "control failure; large run skipped"
        OUT.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
        write_report(data)
        return 2
    if args.smoke_only:
        data["terminal"] = "smoke controls passed; structural/NRA run intentionally omitted"
        OUT.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
        write_report(data)
        return 0

    terminal, cvc5, candidates = enumerate_structural(args.timeout_ms, args.enumerate)
    data["structural"] = {
        "z3_terminal": terminal,
        "cvc5": cvc5,
        "candidates": candidates,
        "enumeration_complete": terminal == "unsat",
    }
    if not candidates:
        data["terminal"] = "no corrected structural leaf selected"
        OUT.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
        write_report(data)
        return 1

    selected_index = choose_candidate(candidates)
    selected = candidates[selected_index]
    data["selected_candidate_index"] = selected_index
    data["selected_signature"] = selected
    replay = CorrectedReplay(selected, args.timeout_ms)
    for stage in core.MetricReplay.STAGES:
        stage_record = solve_stage(replay, stage, args.timeout_ms)
        data["stages"].append(stage_record)
        OUT.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
    data["terminal"] = "incremental run complete"
    OUT.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
    write_report(data)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
