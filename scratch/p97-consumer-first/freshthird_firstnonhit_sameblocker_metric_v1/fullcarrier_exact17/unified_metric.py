#!/usr/bin/env python3
"""Exact-17 unified Euclidean replay for one direct FreshThird crossed model.

The input incidence assignment is a proposal, not a model.  This program asks
whether its K4 witnesses, actual-blocker selected rows, rich-apex slices, and
the live MEC/cap/cyclic geometry can hold on one set of 17 coordinates.

Every emitted SMT-LIB artifact contains exactly one ``check-sat``.  SAT models
are rechecked by exact substitution; rational models receive an additional
plain-``Fraction`` semantic replay.  This remains an exact-17 diagnostic and
has no general-cardinality lift.
"""

from __future__ import annotations

import argparse
import json
import math
import os
import signal
import subprocess
import time
from collections.abc import Iterable
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
ASSIGNMENT_PATH = HERE / "generated" / "sameblocker_assignment.json"
GENERATED = HERE / "generated"
LOGS = HERE / "logs"
N = 17

STAGES = (
    "geometry_core",
    "cap_classification",
    "k4_witness_equalities",
    "selected_support_equalities",
    "rich_radius_pattern",
    "full_rich_classes",
    "blocker_exactness",
    "named_rows_and_singletons",
)


@dataclass(frozen=True)
class Clause:
    name: str
    formula: z3.BoolRef
    source: str


def load_assignment() -> dict[str, Any]:
    return json.loads(ASSIGNMENT_PATH.read_text())


def role(a: dict[str, Any], name: str) -> int:
    return int(a["roles"][name])


def boundary(a: dict[str, Any]) -> tuple[int, ...]:
    ranks = [int(v) for v in a["rank"]]
    return tuple(sorted(range(N), key=ranks.__getitem__))


def blocker_centers(a: dict[str, Any]) -> tuple[int, ...]:
    return tuple(sorted({int(v) for v in a["blockers"]}))


def unused_k4_centers(a: dict[str, Any]) -> tuple[int, ...]:
    return tuple(sorted(set(range(N)) - set(blocker_centers(a))))


def validate_incidence_proposal(a: dict[str, Any]) -> list[str]:
    """Check the exact facts consumed by the metric replay, without a solver."""
    errors: list[str] = []
    rows = [set(map(int, row)) for row in a["selected_rows"]]
    point_rows = [set(map(int, row)) for row in a["point_k4_rows"]]
    blockers = list(map(int, a["blockers"]))
    caps = [set(map(int, cap)) for cap in a["caps"]]

    def check(test: bool, message: str) -> None:
        if not test:
            errors.append(message)

    check(len(rows) == N and len(point_rows) == N, "17 row families")
    check(sorted(map(int, a["rank"])) == list(range(N)), "rank permutation")
    check(tuple(map(len, caps)) == (8, 6, 6), "cap profile (8,6,6)")
    for center, support in enumerate(point_rows):
        check(len(support) == 4, f"K4 witness cardinality at center {center}")
        check(center not in support, f"positive K4 radius at center {center}")
    for q in range(N):
        check(
            rows[q] == point_rows[blockers[q]],
            f"selected row {q} locks to actual blocker center {blockers[q]}",
        )
        check(q in rows[q], f"source {q} belongs to its selected row")

    r = lambda name: role(a, name)
    if a.get("packet") == "same_blocker":
        shared = {r("c_first"), r("c_second"), r("q_source"), r("q_other")}
        for name in ("c_first", "c_second", "q_source", "q_other"):
            check(rows[r(name)] == shared, f"same-blocker exact shared row at {name}")
        shared_blockers = {
            blockers[r(name)] for name in ("c_first", "c_second", "q_source", "q_other")
        }
        check(len(shared_blockers) == 1, "Q/C same-blocker center equality")
    else:
        expected = {
            r("p1"): {r("p1"), r("p2"), r("q_source"), r("q_other")},
            r("c_first"): {
                r("c_first"),
                r("c_second"),
                r("q_source"),
                r("common_fourth"),
            },
            r("r1"): {r("r1"), r("r2"), r("q_other"), r("opposite_fourth")},
        }
        for source, support in expected.items():
            check(
                rows[source] == support, f"direct crossed exact named row at {source}"
            )
        check(
            rows[r("c_first")] & rows[r("c_second")] == {r("c_first"), r("c_second")},
            "mutual C-row intersection",
        )
        check(r("q_other") not in rows[r("c_first")], "crossed common-row omission")
        check(r("q_source") not in rows[r("r1")], "crossed opposite-row omission")

    first_cap = caps[0]
    first_interior = first_cap - {r("apex1"), r("apex2")}
    for name in ("p1", "p2", "r1", "r2", "c_first", "c_second"):
        check(r(name) in first_interior, f"{name} in first strict cap")
    for name in ("q_source", "q_other", "common_fourth", "opposite_fourth"):
        check(r(name) not in first_cap, f"{name} outside first closed cap")
    check(
        rows[r("c_first")] & first_cap == {r("c_first"), r("c_second")},
        "common row exact first-cap intersection",
    )
    check(
        rows[r("p1")] & first_cap == {r("p1"), r("p2")},
        "first collision row exact first-cap intersection",
    )
    check(
        rows[r("r1")] & first_cap == {r("r1"), r("r2")},
        "opposite row exact first-cap intersection",
    )
    if a.get("packet") != "same_blocker":
        check(
            blockers[r("q_source")] == blockers[r("p1")],
            "Q.source shares first collision blocker",
        )
        check(blockers[r("c_first")] != blockers[r("c_second")], "C blockers distinct")
    else:
        for name in ("p1", "p2", "r1", "r2"):
            check(
                blockers[r(name)] != blockers[r("q_source")],
                f"same-blocker Q/C center differs from retained {name} blocker",
            )

    rich = a["rich_slices"]
    two_arm = list(map(bool, a["rich_two_arm"]))
    apices = (r("apex0"), r("apex1"), r("apex2"))
    endpoints = (
        {r("apex1"), r("apex2")},
        {r("apex2"), r("apex0")},
        {r("apex0"), r("apex1")},
    )
    for j in range(3):
        interior = caps[j] - endpoints[j]
        arms = [set(map(int, xs)) for xs in rich[j]]
        check(arms[0] <= interior and arms[1] <= interior, f"rich cap {j} containment")
        if two_arm[j]:
            check(len(arms[0]) >= 2 and len(arms[1]) >= 2, f"rich cap {j} D44 sizes")
            check(not (arms[0] & arms[1]), f"rich cap {j} D44 disjoint arms")
        else:
            check(len(arms[0]) >= 4 and not arms[1], f"rich cap {j} S6 slice")
        check(apices[j] not in arms[0] | arms[1], f"rich apex {j} positive radii")

    # This assignment already negates both positive consumers structurally.
    candidates = [
        r(k) for k in ("c_first", "c_second", "common_fourth", "opposite_fourth")
    ]
    first_q_row = rows[r("p1")]
    rich_positive = False
    for source in candidates:
        center = blockers[source]
        center_cap = next(
            (j for j in range(3) if center in caps[j] - endpoints[j]), None
        )
        for j in range(3):
            if center_cap == j:
                continue
            for arm, active in zip(rich[j], (True, two_arm[j]), strict=True):
                if active and len(rows[source] & set(map(int, arm))) >= 2:
                    rich_positive = True
    q_positive = any(len(rows[source] & first_q_row) >= 3 for source in candidates)
    check(not rich_positive, "negation of distinct-cap rich-slice positive")
    check(not q_positive, "negation of explicit-Q three-overlap positive")
    return errors


def validate_retained_first_apex_rich(a: dict[str, Any]) -> list[str]:
    """Check the aligned-retained theorem's exact first-apex D44 coupling."""
    roles = a["roles"]
    pair = {int(roles["p1"]), int(roles["p2"])}
    rho_pair = {int(roles["r1"]), int(roles["r2"])}
    arms = [set(map(int, arm)) for arm in a["rich_slices"][0]]
    errors: list[str] = []
    if not bool(a["rich_two_arm"][0]):
        errors.append("aligned-retained first apex is not D44")
    if not (arms == [pair, rho_pair] or arms == [rho_pair, pair]):
        errors.append("first-apex rich slices are not exactly P/Pρ up to swap")
    return errors


def area(
    x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int, c: int
) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (y[b] - y[a]) * (x[c] - x[a])


def d2(x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int) -> z3.ArithRef:
    return (x[a] - x[b]) ** 2 + (y[a] - y[b]) ** 2


class UnifiedEncoding:
    """Source-audited staged coordinate encoding of the frozen proposal."""

    def __init__(self, assignment: dict[str, Any]) -> None:
        self.a = assignment
        self.x = [z3.Real(f"x_{p}") for p in range(N)]
        self.y = [z3.Real(f"y_{p}") for p in range(N)]
        self.rich_r = [
            [z3.Real(f"rich_r_{j}_{arm}") for arm in range(2)] for j in range(3)
        ]
        self.groups: dict[str, list[Clause]] = {stage: [] for stage in STAGES}
        self._build()

    def add(self, stage: str, name: str, formula: z3.BoolRef, source: str) -> None:
        self.groups[stage].append(Clause(name, formula, source))

    def _build(self) -> None:
        a, x, y = self.a, self.x, self.y
        r = lambda name: role(a, name)
        apices = (r("apex0"), r("apex1"), r("apex2"))
        order = boundary(a)
        caps = [set(map(int, cap)) for cap in a["caps"]]
        point_rows = [tuple(map(int, row)) for row in a["point_k4_rows"]]
        selected = [tuple(map(int, row)) for row in a["selected_rows"]]
        blockers = list(map(int, a["blockers"]))

        # Similarity gauge for the shared minimum enclosing circle.
        self.add(
            "geometry_core",
            "gauge_apex2_x",
            x[apices[2]] == 1,
            "Euclidean similarity gauge",
        )
        self.add(
            "geometry_core",
            "gauge_apex2_y",
            y[apices[2]] == 0,
            "Euclidean similarity gauge",
        )
        for apex in apices:
            self.add(
                "geometry_core",
                f"mec_apex_{apex}",
                x[apex] ** 2 + y[apex] ** 2 == 1,
                "CircumscribedMECPacket / Moser apices",
            )
        for p in range(N):
            self.add(
                "geometry_core",
                f"mec_contains_{p}",
                x[p] ** 2 + y[p] ** 2 <= 1,
                "minimum enclosing disk containment",
            )
        for apex, left, right in (
            (apices[0], apices[1], apices[2]),
            (apices[1], apices[2], apices[0]),
            (apices[2], apices[0], apices[1]),
        ):
            dot = (x[left] - x[apex]) * (x[right] - x[apex]) + (y[left] - y[apex]) * (
                y[right] - y[apex]
            )
            self.add(
                "geometry_core",
                f"nonobtuse_at_{apex}",
                dot >= 0,
                "triangleNonObtuse",
            )
        # BoundaryIndexing.boundary_ccw uses the negative determinant sign.
        for i, j, k in combinations(range(N), 3):
            p, q, s = order[i], order[j], order[k]
            self.add(
                "geometry_core",
                f"boundary_ccw_{i}_{j}_{k}",
                area(x, y, p, q, s) < 0,
                "BoundaryIndexing.boundary_ccw",
            )

        # Exact OnArcOpposite membership for each closed cap.
        cap_triples = (
            (apices[0], apices[1], apices[2]),
            (apices[1], apices[2], apices[0]),
            (apices[2], apices[0], apices[1]),
        )
        for j, (opposite, left, right) in enumerate(cap_triples):
            for p in range(N):
                product = area(x, y, p, left, right) * area(x, y, opposite, left, right)
                predicate = product <= 0
                self.add(
                    "cap_classification",
                    f"cap_{j}_{p}",
                    predicate if p in caps[j] else z3.Not(predicate),
                    "CapTriple.arc_membership / OnArcOpposite",
                )

        # D.K4 supplies one four-point positive-radius witness class at every
        # carrier center.  It does not supply exactness at unused centers.
        for center, support in enumerate(point_rows):
            base = support[0]
            radius = d2(x, y, center, base)
            self.add(
                "k4_witness_equalities",
                f"k4_positive_{center}",
                radius > 0,
                "D.K4 four-witness positive radius",
            )
            for p in support[1:]:
                self.add(
                    "k4_witness_equalities",
                    f"k4_equal_{center}_{p}",
                    d2(x, y, center, p) == radius,
                    "D.K4 four-witness common radius",
                )

        # Repeat every selected support equality at its proposed actual
        # blocker.  These are deliberately separate from the K4 witnesses so
        # the unique-four locking ingress is visible in the artifact.
        for source, support in enumerate(selected):
            center = blockers[source]
            base = support[0]
            radius = d2(x, y, center, base)
            self.add(
                "selected_support_equalities",
                f"selected_positive_{source}",
                radius > 0,
                "selectedAt source / actual blocker",
            )
            for p in support[1:]:
                self.add(
                    "selected_support_equalities",
                    f"selected_equal_{source}_{p}",
                    d2(x, y, center, p) == radius,
                    "selected support equality at actual blocker",
                )

        # Materialize the incidence-only rich slices as actual apex-centered
        # radius classes.  Every D44 pair has distinct positive radii.
        for j, apex in enumerate(apices):
            for arm_index, arm_raw in enumerate(a["rich_slices"][j]):
                arm = tuple(map(int, arm_raw))
                active = arm_index == 0 or bool(a["rich_two_arm"][j])
                if not active:
                    continue
                radius = self.rich_r[j][arm_index]
                self.add(
                    "rich_radius_pattern",
                    f"rich_positive_{j}_{arm_index}",
                    radius > 0,
                    "OppositeCapRichClassInteriorPattern positive radius",
                )
                for p in arm:
                    self.add(
                        "rich_radius_pattern",
                        f"rich_equal_{j}_{arm_index}_{p}",
                        d2(x, y, apex, p) == radius,
                        "strict-cap rich slice on a common apex radius",
                    )
                if j == 0:
                    first_interior = caps[0] - {apices[1], apices[2]}
                    for p in sorted(first_interior - set(arm)):
                        self.add(
                            "rich_radius_pattern",
                            f"rich_exact_first_cap_{arm_index}_{p}",
                            d2(x, y, apex, p) != radius,
                            (
                                "hfrontierInteriorEq/hρInteriorEq exact retained "
                                "first-cap slice"
                            ),
                        )
            if bool(a["rich_two_arm"][j]):
                self.add(
                    "rich_radius_pattern",
                    f"rich_distinct_{j}",
                    self.rich_r[j][0] != self.rich_r[j][1],
                    "D44 distinct radii",
                )

        # The live ApexRichClassStructure is stronger than its derived strict-
        # cap pattern: in D44 both ambient SelectedClass supports have size >=4.
        for j, apex in enumerate(apices):
            for arm_index in range(2):
                if arm_index == 1 and not bool(a["rich_two_arm"][j]):
                    continue
                radius = self.rich_r[j][arm_index]
                count = z3.Sum(
                    [z3.If(d2(x, y, apex, p) == radius, 1, 0) for p in range(N)]
                )
                lower = 4 if bool(a["rich_two_arm"][j]) else 6
                self.add(
                    "full_rich_classes",
                    f"rich_full_card_{j}_{arm_index}",
                    count >= lower,
                    "ApexRichClassStructure D44/S6 ambient class cardinality",
                )

        # no_qfree/minimality makes precisely the image of blocker[] unique-
        # four.  No off-support inequality is asserted at an unused K4 center.
        for center in blocker_centers(a):
            support = set(point_rows[center])
            base = min(support)
            radius = d2(x, y, center, base)
            for p in range(N):
                if p not in support:
                    self.add(
                        "blocker_exactness",
                        f"blocker_exact_{center}_{p}",
                        d2(x, y, center, p) != radius,
                        "unique-four at an actual blocker-image center",
                    )

        # The same-blocker packet has no source-entitled C singleton or
        # first-apex C-radius distinction.  Its exact Q/C support and center
        # equality are already represented by selected_rows/blockers above.
        if a.get("packet") != "same_blocker":
            first_apex = apices[0]
            first_interior = caps[0] - {apices[1], apices[2]}
            for source_name in ("c_first", "c_second"):
                source = r(source_name)
                radius = d2(x, y, first_apex, source)
                self.add(
                    "named_rows_and_singletons",
                    f"singleton_positive_{source_name}",
                    radius > 0,
                    "aligned canonical-source first-apex radius",
                )
                for p in sorted(first_interior - {source}):
                    self.add(
                        "named_rows_and_singletons",
                        f"singleton_excludes_{source_name}_{p}",
                        d2(x, y, first_apex, p) != radius,
                        "firstApexRadius_eq_singleton_of_aligned",
                    )
            self.add(
                "named_rows_and_singletons",
                "canonical_source_radii_distinct",
                d2(x, y, first_apex, r("c_first"))
                != d2(x, y, first_apex, r("c_second")),
                "freshThird aligned canonical source radii distinct",
            )

    def clauses_through(self, stage: str) -> list[Clause]:
        limit = STAGES.index(stage)
        return [clause for name in STAGES[: limit + 1] for clause in self.groups[name]]

    def row_preflight_clauses(self) -> list[Clause]:
        return (
            self.groups["k4_witness_equalities"]
            + self.groups["selected_support_equalities"]
        )

    def variables(self) -> list[z3.ArithRef]:
        return [*self.x, *self.y, *(r for pair in self.rich_r for r in pair)]


def one_check_smt2(clauses: Iterable[Clause]) -> str:
    solver = z3.SolverFor("QF_NRA")
    solver.add(*[clause.formula for clause in clauses])
    text = solver.sexpr().rstrip() + "\n(check-sat)\n"
    if text.count("(check-sat)") != 1:
        raise RuntimeError("artifact does not contain exactly one check-sat")
    return text


def classify_z3(result: z3.CheckSatResult, solver: z3.Solver) -> str:
    if result == z3.sat:
        return "SAT"
    if result == z3.unsat:
        return "UNSAT"
    return f"UNKNOWN:{solver.reason_unknown()}"


def exact_value(value: z3.ExprRef) -> dict[str, str]:
    if z3.is_rational_value(value):
        frac = Fraction(value.numerator_as_long(), value.denominator_as_long())
        return {"kind": "rational", "exact": str(frac)}
    if z3.is_algebraic_value(value):
        return {"kind": "algebraic", "exact": value.sexpr()}
    return {"kind": "other", "exact": value.sexpr()}


def exact_substitution_validate(
    encoding: UnifiedEncoding,
    clauses: list[Clause],
    model: z3.ModelRef,
) -> tuple[list[str], dict[str, dict[str, str]]]:
    values: dict[str, z3.ExprRef] = {}
    exported: dict[str, dict[str, str]] = {}
    for variable in encoding.variables():
        value = model.eval(variable, model_completion=True)
        values[variable.decl().name()] = value
        exported[variable.decl().name()] = exact_value(value)
    substitutions = [(v, values[v.decl().name()]) for v in encoding.variables()]
    errors: list[str] = []
    for clause in clauses:
        reduced = z3.simplify(z3.substitute(clause.formula, *substitutions))
        if not z3.is_true(reduced):
            errors.append(f"{clause.name}: {reduced.sexpr()[:180]}")
    return errors, exported


def _fraction_eval(expr: z3.ExprRef, values: dict[str, Fraction]) -> Fraction | bool:
    """Evaluate the emitted quantifier-free polynomial language independently."""
    if z3.is_true(expr):
        return True
    if z3.is_false(expr):
        return False
    if z3.is_rational_value(expr):
        return Fraction(expr.numerator_as_long(), expr.denominator_as_long())
    if z3.is_const(expr) and expr.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return values[expr.decl().name()]

    args = [_fraction_eval(child, values) for child in expr.children()]
    kind = expr.decl().kind()
    if kind == z3.Z3_OP_ADD:
        return sum(args, Fraction(0))  # type: ignore[arg-type]
    if kind == z3.Z3_OP_SUB:
        return args[0] - args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_MUL:
        product = Fraction(1)
        for arg in args:
            product *= arg  # type: ignore[operator]
        return product
    if kind == z3.Z3_OP_UMINUS:
        return -args[0]  # type: ignore[operator]
    if kind == z3.Z3_OP_POWER:
        exponent = args[1]
        if not isinstance(exponent, Fraction) or exponent.denominator != 1:
            raise ValueError(f"non-integral exponent: {expr}")
        return args[0] ** exponent.numerator  # type: ignore[operator]
    if kind == z3.Z3_OP_ITE:
        return args[1] if args[0] else args[2]
    if kind == z3.Z3_OP_EQ:
        return args[0] == args[1]
    if kind == z3.Z3_OP_DISTINCT:
        return len(set(args)) == len(args)
    if kind == z3.Z3_OP_LT:
        return args[0] < args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_LE:
        return args[0] <= args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_GT:
        return args[0] > args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_GE:
        return args[0] >= args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_NOT:
        return not args[0]
    if kind == z3.Z3_OP_AND:
        return all(args)
    if kind == z3.Z3_OP_OR:
        return any(args)
    if kind == z3.Z3_OP_IMPLIES:
        return (not args[0]) or bool(args[1])
    if kind == z3.Z3_OP_TO_REAL:
        return args[0]
    raise ValueError(f"unsupported exact-replay operator {kind}: {expr}")


def fraction_validate(
    encoding: UnifiedEncoding, clauses: list[Clause], model: z3.ModelRef
) -> tuple[str, list[str]]:
    """Replay rational Z3 models without asking either SMT solver."""
    values: dict[str, Fraction] = {}
    for variable in encoding.variables():
        value = model.eval(variable, model_completion=True)
        if not z3.is_rational_value(value):
            return "SKIPPED_ALGEBRAIC", []
        values[variable.decl().name()] = Fraction(
            value.numerator_as_long(), value.denominator_as_long()
        )
    errors: list[str] = []
    for clause in clauses:
        try:
            if _fraction_eval(clause.formula, values) is not True:
                errors.append(clause.name)
        except (KeyError, TypeError, ValueError) as exc:
            errors.append(f"{clause.name}: {exc}")
    return ("PASS" if not errors else "FAIL"), errors


def parse_status(output: str) -> list[str]:
    return [
        line.strip().upper()
        for line in output.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]


def run_cvc5(smt2_path: Path, timeout_ms: int, log_path: Path) -> dict[str, Any]:
    cmd = [
        "cvc5",
        "--lang=smt2",
        "--produce-models",
        "--dump-models",
        "--check-models",
        "--nl-cov",
        f"--tlimit-per={timeout_ms}",
        str(smt2_path),
    ]
    start = time.monotonic()
    try:
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except FileNotFoundError:
        return {"status": "ERROR:unavailable", "seconds": 0.0}
    try:
        stdout, stderr = proc.communicate(timeout=timeout_ms / 1000 + 5)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        stdout, stderr = proc.communicate()
        log_path.write_text(stdout + "\nSTDERR\n" + stderr)
        return {"status": "TIMEOUT", "seconds": round(time.monotonic() - start, 3)}
    log_path.write_text(stdout + "\nSTDERR\n" + stderr)
    statuses = parse_status(stdout)
    if "timeout" in stdout.lower() or "timeout" in stderr.lower():
        status = "TIMEOUT"
    elif proc.returncode != 0:
        status = f"ERROR:exit_{proc.returncode}"
    elif len(statuses) != 1:
        status = f"ERROR:status_count_{len(statuses)}"
    else:
        status = statuses[0]
    return {
        "status": status,
        "seconds": round(time.monotonic() - start, 3),
        "model_checked_by_cvc5": status == "SAT"
        and "model check failure" not in stderr.lower(),
    }


def run_z3_cli(smt2_path: Path, timeout_ms: int, log_path: Path) -> dict[str, Any]:
    """Run the independently installed Z3 binary on the emitted artifact."""
    cmd = ["z3", f"-T:{max(1, math.ceil(timeout_ms / 1000))}", str(smt2_path)]
    start = time.monotonic()
    try:
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except FileNotFoundError:
        return {"status": "ERROR:unavailable", "seconds": 0.0}
    try:
        stdout, stderr = proc.communicate(timeout=timeout_ms / 1000 + 5)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        stdout, stderr = proc.communicate()
        log_path.write_text(stdout + "\nSTDERR\n" + stderr)
        return {"status": "TIMEOUT", "seconds": round(time.monotonic() - start, 3)}
    log_path.write_text(stdout + "\nSTDERR\n" + stderr)
    statuses = parse_status(stdout)
    if "timeout" in stdout.lower() or "timeout" in stderr.lower():
        status = "TIMEOUT"
    elif proc.returncode != 0:
        status = f"ERROR:exit_{proc.returncode}"
    elif len(statuses) != 1:
        status = f"ERROR:status_count_{len(statuses)}"
    else:
        status = statuses[0]
    return {"status": status, "seconds": round(time.monotonic() - start, 3)}


def run_query(
    name: str,
    encoding: UnifiedEncoding,
    clauses: list[Clause],
    timeout_ms: int,
    cvc5_timeout_ms: int,
) -> dict[str, Any]:
    GENERATED.mkdir(parents=True, exist_ok=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    smt2_path = GENERATED / f"{name}.smt2"
    smt2_path.write_text(one_check_smt2(clauses))

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=9717)
    solver.add(*[clause.formula for clause in clauses])
    start = time.monotonic()
    result = solver.check()
    z3_seconds = round(time.monotonic() - start, 3)
    z3_status = classify_z3(result, solver)
    z3_data: dict[str, Any] = {"status": z3_status, "seconds": z3_seconds}
    if result == z3.sat:
        errors, model_data = exact_substitution_validate(
            encoding, clauses, solver.model()
        )
        fraction_status, fraction_errors = fraction_validate(
            encoding, clauses, solver.model()
        )
        model_path = GENERATED / f"{name}_z3_model.json"
        model_path.write_text(json.dumps(model_data, indent=2, sort_keys=True) + "\n")
        z3_data.update(
            {
                "model": str(model_path.relative_to(HERE)),
                "exact_substitution_validation": "PASS" if not errors else "FAIL",
                "validation_errors": errors[:20],
                "fraction_validation": fraction_status,
                "fraction_validation_errors": fraction_errors[:20],
                "all_model_values_rational": all(
                    v["kind"] == "rational" for v in model_data.values()
                ),
            }
        )

    cvc5_data = run_cvc5(
        smt2_path,
        cvc5_timeout_ms,
        LOGS / f"{name}_cvc5.log",
    )
    z3_cli_data = run_z3_cli(
        smt2_path,
        timeout_ms,
        LOGS / f"{name}_z3_cli.log",
    )
    return {
        "query": name,
        "clause_count": len(clauses),
        "artifact": str(smt2_path.relative_to(HERE)),
        "check_sat_count": smt2_path.read_text().count("(check-sat)"),
        "z3": z3_data,
        "z3_cli": z3_cli_data,
        "cvc5": cvc5_data,
    }


def malformed_controls(encoding: UnifiedEncoding) -> dict[str, list[Clause]]:
    a = encoding.a
    r = lambda name: role(a, name)
    order = boundary(a)
    base_geometry = encoding.clauses_through("geometry_core")
    row_base = encoding.row_preflight_clauses()
    rich_base = encoding.groups["rich_radius_pattern"]
    # In the same-blocker packet there are intentionally no C singleton
    # clauses.  Break the actual shared-row equality instead, which is a
    # source-valid malformed incidence control and is contradictory with the
    # selected-support preflight.
    shared_break = Clause(
        "break_same_blocker_row",
        d2(
            encoding.x,
            encoding.y,
            int(encoding.a["blockers"][r("c_first")]),
            r("c_first"),
        )
        != d2(
            encoding.x,
            encoding.y,
            int(encoding.a["blockers"][r("c_first")]),
            r("c_second"),
        ),
        "malformed control",
    )
    shared_eq = Clause(
        "same_blocker_row_equality",
        d2(
            encoding.x,
            encoding.y,
            int(encoding.a["blockers"][r("c_first")]),
            r("c_first"),
        )
        == d2(
            encoding.x,
            encoding.y,
            int(encoding.a["blockers"][r("c_first")]),
            r("c_second"),
        ),
        "selected support equality at actual blocker",
    )
    return {
        "malformed_reversed_boundary": base_geometry
        + [
            Clause(
                "reverse_first_boundary_triple",
                area(encoding.x, encoding.y, order[0], order[1], order[2]) >= 0,
                "malformed control",
            )
        ],
        "malformed_break_k4_equality": row_base
        + [
            Clause(
                "break_center0_row",
                d2(encoding.x, encoding.y, 0, int(a["point_k4_rows"][0][1]))
                != d2(encoding.x, encoding.y, 0, int(a["point_k4_rows"][0][0])),
                "malformed control",
            )
        ],
        "malformed_equal_rich_radii": rich_base
        + [
            Clause(
                "equal_d44_radii",
                encoding.rich_r[0][0] == encoding.rich_r[0][1],
                "malformed control",
            )
        ],
        "malformed_break_singleton": [shared_eq, shared_break],
    }


def minimized_singleton_rich_cores(
    encoding: UnifiedEncoding,
) -> dict[str, list[Clause]]:
    """Three-clause contradictions exposed by the frozen rich-slice choices."""
    by_name = {
        clause.name: clause for group in encoding.groups.values() for clause in group
    }

    def pick(*names: str) -> list[Clause]:
        return [by_name[name] for name in names]

    return {
        "core_c_first_rich_arm": pick(
            "rich_equal_0_1_0",
            "rich_equal_0_1_10",
            "singleton_excludes_c_first_10",
        ),
        "core_c_second_rich_arm": pick(
            "rich_equal_0_0_1",
            "rich_equal_0_0_13",
            "singleton_excludes_c_second_13",
        ),
    }


def run_all(timeout_ms: int, cvc5_timeout_ms: int) -> dict[str, Any]:
    a = load_assignment()
    incidence_errors = validate_incidence_proposal(a)
    if incidence_errors:
        raise RuntimeError("invalid incidence proposal: " + "; ".join(incidence_errors))
    encoding = UnifiedEncoding(a)
    results: dict[str, Any] = {
        "scope": "exact-17 direct crossed constructor only; no universal lift",
        "source_assignment": str(ASSIGNMENT_PATH),
        "incidence_validation": "PASS",
        "fidelity": "SOURCE_INCOMPLETE_EXACT_17_DIRECT_CROSSED_ASSIGNMENT_REJECTION",
        "closure_claim": "NONE",
        "target_positive_negations": (
            "already structural in the frozen incidence proposal; no extra metric clause"
        ),
        "omitted_scope": [
            "the two deletion residual constructors",
            "the reversed crossed constructor",
            "coverage of all exact-17 incidence assignments",
            "every cardinality other than 17",
            "a general-cardinality finite-core lift",
        ],
        "candidate_universal_theorem": (
            "LANDED: Problem97.ATailFrontierLiveClosure."
            "TwoSourceExactCollisionRowsTerminal."
            "freshThird_alignedRetainedConsumerPacket_sources_not_mem_"
            "firstApex_multiPointRadius"
        ),
        "blocker_image_centers": blocker_centers(a),
        "unused_k4_centers_without_exactness": unused_k4_centers(a),
        "queries": [],
        "minimized_cores": [],
        "minimality_controls": [],
        "controls": [],
        "rejected_unsourced_controls": [
            {
                "name": "exactness_at_unused_k4_center",
                "status": "REJECTED_UNSOURCED",
                "centers": unused_k4_centers(a),
                "reason": "D.K4 gives only a four-witness subset there; unique-four exactness is unavailable",
            }
        ],
    }
    for core_name, clauses in minimized_singleton_rich_cores(encoding).items():
        core_result = run_query(
            core_name, encoding, clauses, timeout_ms, cvc5_timeout_ms
        )
        core_result["source_audit"] = [
            {"clause": clause.name, "source": clause.source} for clause in clauses
        ]
        results["minimized_cores"].append(core_result)
        for dropped in range(len(clauses)):
            results["minimality_controls"].append(
                run_query(
                    f"{core_name}_drop_{dropped}",
                    encoding,
                    [
                        clause
                        for index, clause in enumerate(clauses)
                        if index != dropped
                    ],
                    timeout_ms,
                    cvc5_timeout_ms,
                )
            )
    results["queries"].append(
        run_query(
            "row_equalities_only_preflight",
            encoding,
            encoding.row_preflight_clauses(),
            timeout_ms,
            cvc5_timeout_ms,
        )
    )
    for stage in STAGES:
        outcome = run_query(
            stage,
            encoding,
            encoding.clauses_through(stage),
            timeout_ms,
            cvc5_timeout_ms,
        )
        results["queries"].append(outcome)
        if outcome["z3"]["status"] == "UNSAT" and outcome["cvc5"]["status"] == "UNSAT":
            results["first_joint_unsat_stage"] = stage
            break

    for name, clauses in malformed_controls(encoding).items():
        results["controls"].append(
            run_query(name, encoding, clauses, timeout_ms, cvc5_timeout_ms)
        )
    (HERE / "frozen_assignment_results.json").write_text(
        json.dumps(results, indent=2, sort_keys=True) + "\n"
    )
    return results


def print_summary(results: dict[str, Any]) -> None:
    print(f"incidence={results['incidence_validation']}")
    for item in results["minimized_cores"]:
        print(
            f"{item['query']}: z3={item['z3']['status']} "
            f"cvc5={item['cvc5']['status']} clauses={item['clause_count']}"
        )
    drops = results["minimality_controls"]
    print(
        "minimality-controls="
        + str(
            sum(
                i["z3"]["status"] == "SAT" and i["cvc5"]["status"] == "SAT"
                for i in drops
            )
        )
        + f"/{len(drops)} dual-SAT"
    )
    for item in results["queries"]:
        print(
            f"{item['query']}: z3={item['z3']['status']} "
            f"cvc5={item['cvc5']['status']} clauses={item['clause_count']}"
        )
    for item in results["controls"]:
        print(
            f"control {item['query']}: z3={item['z3']['status']} cvc5={item['cvc5']['status']}"
        )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "command", choices=("run", "verify-incidence"), nargs="?", default="run"
    )
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--cvc5-timeout-ms", type=int, default=30_000)
    args = parser.parse_args()
    if args.command == "verify-incidence":
        errors = validate_incidence_proposal(load_assignment())
        print("PASS" if not errors else "FAIL: " + "; ".join(errors))
        raise SystemExit(bool(errors))
    print_summary(run_all(args.timeout_ms, args.cvc5_timeout_ms))


if __name__ == "__main__":
    main()
