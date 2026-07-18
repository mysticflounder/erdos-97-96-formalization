#!/usr/bin/env python3
"""Bounded planar-coordinate probe for one fully-disjoint period-three cell.

This is a theorem-discovery probe, not a proof.  It replaces the abstract
distance variables of ``period-three-full-role-identity-quotient`` by 25
points in ``R^2`` while retaining exactly the fixed labelled cell used there.
Every solver call is bounded.  SAT is accepted only when an exported model
can be substituted into every named atom; UNSAT remains an uncertified
external-solver result; UNKNOWN is no verdict.
"""

from __future__ import annotations

import argparse
from collections import Counter
from dataclasses import dataclass
from fractions import Fraction
import hashlib
import json
from pathlib import Path
import re
import subprocess
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent

FIRST = "first"
SECOND = "second"
SURPLUS = "surplus"

T0 = ("q", "w", "t0i", "t0s")
T1 = ("t1i0", "t1i1", "t1i2", "t1o")

CYCLE = ("c0", "c1", "c2")
PHYSICAL_FIVE = (*CYCLE, "nS", "nI")
BLOCKERS = ("b0", "b1", "b2")
TARGET_PAIRS = (("x0", "y0"), ("x1", "y1"), ("x2", "y2"))

SURPLUS_PRIVATE = ("t0s", "nS")
FIRST_PRIVATE = (
    "q", "w", "t0i", "t1i0", "t1i1", "t1i2", "nI",
    "x0", "y0", "x1", "y1", "x2", "y2",
)
PHYSICAL_PRIVATE = (
    "c0", "b0", "b2", "c1", "b1", "c2", "t1o",
)
BOUNDARY = (
    FIRST,
    *SURPLUS_PRIVATE,
    SECOND,
    *FIRST_PRIVATE,
    SURPLUS,
    *PHYSICAL_PRIVATE,
)
POINTS = BOUNDARY

Point = tuple[z3.ArithRef, z3.ArithRef]


def sq(value: z3.ArithRef) -> z3.ArithRef:
    return value * value


def sqdist(first: Point, second: Point) -> z3.ArithRef:
    return sq(first[0] - second[0]) + sq(first[1] - second[1])


def cross(first: Point, second: Point, third: Point) -> z3.ArithRef:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def dot(origin: Point, first: Point, second: Point) -> z3.ArithRef:
    return (
        (first[0] - origin[0]) * (second[0] - origin[0])
        + (first[1] - origin[1]) * (second[1] - origin[1])
    )


@dataclass(frozen=True)
class NamedAtom:
    name: str
    family: str
    assertion: z3.BoolRef


@dataclass
class CoordinateSystem:
    phase: str
    variables: dict[str, z3.ArithRef]
    points: dict[str, Point]
    atoms: list[NamedAtom]

    @property
    def assertions(self) -> list[z3.BoolRef]:
        return [atom.assertion for atom in self.atoms]

    def solver(self) -> z3.Solver:
        solver = z3.SolverFor("QF_NRA")
        solver.add(*self.assertions)
        return solver

    def smt2(self, *, get_values: bool) -> str:
        lines = [
            line
            for line in self.solver().to_smt2().splitlines()
            if line.strip() != "(check-sat)"
            and not line.strip().startswith("(set-logic ")
        ]
        commands = ["(set-logic QF_NRA)", *lines, "(check-sat)"]
        if get_values:
            commands.append(
                "(get-value (" + " ".join(self.variables) + "))"
            )
        return "\n".join(commands) + "\n"


class Builder:
    def __init__(
        self,
        *,
        mec: bool,
        exact_scope: str,
        explicit_distinctness: bool,
        row_prefix: str,
    ) -> None:
        self.mec = mec
        self.exact_scope = exact_scope
        self.explicit_distinctness = explicit_distinctness
        self.row_prefix = row_prefix
        self.variables: dict[str, z3.ArithRef] = {}
        self.points: dict[str, Point] = {
            FIRST: (z3.RealVal(0), z3.RealVal(0)),
            SECOND: (z3.RealVal(1), z3.RealVal(0)),
        }
        self.atoms: list[NamedAtom] = []

    def var(self, name: str) -> z3.ArithRef:
        assert name not in self.variables
        value = z3.Real(name)
        self.variables[name] = value
        return value

    def point(self, name: str) -> Point:
        assert name not in self.points
        value = (self.var(f"x__{name}"), self.var(f"y__{name}"))
        self.points[name] = value
        return value

    def add(self, name: str, family: str, assertion: z3.BoolRef) -> None:
        self.atoms.append(NamedAtom(name, family, assertion))

    def equal_shell(
        self,
        *,
        family: str,
        center_name: str,
        support: tuple[str, ...],
        exact_named: bool,
    ) -> None:
        center = self.points[center_name]
        pivot = support[0]
        radius = sqdist(center, self.points[pivot])
        self.add(f"{family}__radius_positive", family, radius > 0)
        for member in support[1:]:
            self.add(
                f"{family}__equal__{pivot}__{member}",
                family,
                sqdist(center, self.points[member]) == radius,
            )
        if exact_named:
            for point_name in POINTS:
                if point_name == center_name or point_name in support:
                    continue
                self.add(
                    f"{family}__exclude__{point_name}",
                    family + "-exact-named-exclusion",
                    sqdist(center, self.points[point_name]) != radius,
                )

    def exact_enabled(self, family: str) -> bool:
        levels = {
            "none": set(),
            "physical": {"physical"},
            "physical-reverse0": {"physical", "reverse0"},
            "physical-reverse01": {"physical", "reverse0", "reverse1"},
            "all": {"physical", "reverse0", "reverse1", "reverse2"},
        }
        return family in levels[self.exact_scope]

    def row_enabled(self, family: str) -> bool:
        levels = {
            "first": {"T0", "T1"},
            "physical": {"T0", "T1", "physical"},
            "reverse0": {"T0", "T1", "physical", "reverse0"},
            "reverse01": {
                "T0", "T1", "physical", "reverse0", "reverse1"
            },
            "all": {
                "T0", "T1", "physical", "reverse0", "reverse1", "reverse2"
            },
        }
        return family in levels[self.row_prefix]

    def build(self) -> CoordinateSystem:
        assert len(POINTS) == len(set(POINTS)) == 25
        assert set(T0).isdisjoint(T1)
        assert set((*T0, *T1)).isdisjoint((*PHYSICAL_FIVE, *BLOCKERS))
        assert set().union(*map(set, TARGET_PAIRS)).isdisjoint(
            (*T0, *T1, *PHYSICAL_FIVE, *BLOCKERS)
        )

        for name in POINTS:
            if name not in self.points:
                self.point(name)

        # Explicit distinctness is redundant under the strict edge-side
        # constraints.  The full query keeps it; the diagnostic ladder may
        # omit these duplicate atoms without weakening strict convexity.
        if self.explicit_distinctness:
            for left_index, left in enumerate(POINTS):
                for right in POINTS[left_index + 1 :]:
                    self.add(
                        f"distinct__{left}__{right}",
                        "pairwise-distinct",
                        sqdist(self.points[left], self.points[right]) > 0,
                    )

        # One fixed strict convex cyclic word: every other named point lies
        # strictly left of every directed boundary edge.  This is sufficient
        # for all named vertices to form the displayed strict convex polygon.
        for index, left in enumerate(BOUNDARY):
            right = BOUNDARY[(index + 1) % len(BOUNDARY)]
            for witness in BOUNDARY:
                if witness in (left, right):
                    continue
                self.add(
                    f"convex_edge__{left}__{right}__{witness}",
                    "fixed-strict-convex-order",
                    cross(
                        self.points[left],
                        self.points[right],
                        self.points[witness],
                    ) > 0,
                )

        # T0/T1 are selected first-apex rows, not exact radius classes.
        self.equal_shell(
            family="T0", center_name=FIRST, support=T0, exact_named=False
        )
        self.equal_shell(
            family="T1", center_name=FIRST, support=T1, exact_named=False
        )
        self.add(
            "T0_T1_unequal_radius",
            "first-apex-unequal-radii",
            sqdist(self.points[FIRST], self.points[T0[0]])
            != sqdist(self.points[FIRST], self.points[T1[0]]),
        )

        # The physical row and the three reverse rows are exact among every
        # named role in this fixed projection.
        if self.row_enabled("physical"):
            self.equal_shell(
                family="physical",
                center_name=SECOND,
                support=PHYSICAL_FIVE,
                exact_named=self.exact_enabled("physical"),
            )
            self.add(
                "second_q_ne_second_w",
                "second-apex-frontier",
                sqdist(self.points[SECOND], self.points["q"])
                != sqdist(self.points[SECOND], self.points["w"]),
            )
        for row in range(3):
            if not self.row_enabled(f"reverse{row}"):
                continue
            support = (
                CYCLE[row],
                CYCLE[(row + 1) % 3],
                *TARGET_PAIRS[row],
            )
            self.equal_shell(
                family=f"reverse{row}",
                center_name=BLOCKERS[row],
                support=support,
                exact_named=self.exact_enabled(f"reverse{row}"),
            )

        if self.mec:
            mec_center = (self.var("mec__x"), self.var("mec__y"))
            mec_radius_sq = self.var("mec__radius_sq")
            self.add("mec_radius_positive", "mec", mec_radius_sq > 0)
            for vertex in (FIRST, SECOND, SURPLUS):
                self.add(
                    f"mec_boundary__{vertex}",
                    "mec",
                    sqdist(mec_center, self.points[vertex]) == mec_radius_sq,
                )
            for point_name in POINTS:
                self.add(
                    f"mec_contains__{point_name}",
                    "mec",
                    sqdist(mec_center, self.points[point_name]) <= mec_radius_sq,
                )
            self.add(
                "support_nonobtuse__first",
                "nonobtuse-support-triangle",
                dot(
                    self.points[FIRST],
                    self.points[SECOND],
                    self.points[SURPLUS],
                ) >= 0,
            )
            self.add(
                "support_nonobtuse__second",
                "nonobtuse-support-triangle",
                dot(
                    self.points[SECOND],
                    self.points[FIRST],
                    self.points[SURPLUS],
                ) >= 0,
            )
            self.add(
                "support_nonobtuse__surplus",
                "nonobtuse-support-triangle",
                dot(
                    self.points[SURPLUS],
                    self.points[FIRST],
                    self.points[SECOND],
                ) >= 0,
            )

        names = [atom.name for atom in self.atoms]
        assert len(names) == len(set(names))
        return CoordinateSystem(
            phase="coordinate-plus-mec" if self.mec else "coordinate-only",
            variables=self.variables,
            points=self.points,
            atoms=self.atoms,
        )


def exact_value(value: z3.ExprRef) -> dict[str, str]:
    result = {"exact": value.sexpr()}
    if hasattr(value, "as_decimal"):
        result["decimal_30"] = value.as_decimal(30)
    return result


def replay_z3_model(
    system: CoordinateSystem, model: z3.ModelRef
) -> tuple[bool, list[str], dict[str, z3.ExprRef]]:
    values = {
        name: model.eval(variable, model_completion=True)
        for name, variable in system.variables.items()
    }
    substitutions = [
        (system.variables[name], value) for name, value in values.items()
    ]
    failures = []
    for atom in system.atoms:
        replayed = z3.simplify(z3.substitute(atom.assertion, *substitutions))
        if not z3.is_true(replayed):
            failures.append(atom.name)
    return not failures, failures, values


def system_audit(system: CoordinateSystem) -> dict[str, Any]:
    family_counts = Counter(atom.family for atom in system.atoms)
    return {
        "phase": system.phase,
        "point_count": len(POINTS),
        "free_real_variable_count": len(system.variables),
        "named_atom_count": len(system.atoms),
        "family_counts": dict(sorted(family_counts.items())),
        "boundary": list(BOUNDARY),
        "normalization": {
            FIRST: ["0", "0"],
            SECOND: ["1", "0"],
        },
        "exact_support_scope": next(
            (
                scope
                for scope, count in (
                    ("all", 79),
                    ("physical-reverse01", 59),
                    ("physical-reverse0", 39),
                    ("physical", 19),
                    ("none", 0),
                )
                if sum(
                    value
                    for family, value in family_counts.items()
                    if family.endswith("-exact-named-exclusion")
                ) == count
            ),
            "unexpected",
        ),
        "row_prefix": next(
            (
                prefix
                for prefix, required in (
                    ("all", {"reverse2"}),
                    ("reverse01", {"reverse1"}),
                    ("reverse0", {"reverse0"}),
                    ("physical", {"physical"}),
                    ("first", {"T0", "T1"}),
                )
                if required.issubset(family_counts)
            ),
            "unexpected",
        ),
        "distinctness": (
            "explicit pairwise squared-distance positivity"
            if family_counts.get("pairwise-distinct", 0)
            else "derived from strict edge-side convexity"
        ),
        "first_rows": {"T0": list(T0), "T1": list(T1)},
        "physical_exact_five": list(PHYSICAL_FIVE),
        "reverse_rows": [
            {
                "center": BLOCKERS[row],
                "support": [
                    CYCLE[row],
                    CYCLE[(row + 1) % 3],
                    *TARGET_PAIRS[row],
                ],
            }
            for row in range(3)
        ],
        "omitted_ledger": (
            [
                "MEC disk and nonobtuse support-triangle constraints",
                "total critical-shell map outside the six named rows",
                "source-by-source deletion failure beyond the named exact supports",
                "parent minimality and noM44 hypotheses",
            ]
            if system.phase == "coordinate-only"
            else [
                "total critical-shell map outside the six named rows",
                "source-by-source deletion failure beyond the named exact supports",
                "parent minimality and noM44 hypotheses",
            ]
        ),
    }


def local_smoke_test() -> dict[str, Any]:
    square: dict[str, Point] = {
        "a": (z3.RealVal(0), z3.RealVal(0)),
        "b": (z3.RealVal(1), z3.RealVal(0)),
        "c": (z3.RealVal(1), z3.RealVal(1)),
        "d": (z3.RealVal(0), z3.RealVal(1)),
    }
    good_order = ("a", "b", "c", "d")
    bad_order = ("a", "b", "d", "c")

    def fixed_order_status(order: tuple[str, ...]) -> str:
        solver = z3.SolverFor("QF_NRA")
        for index, left in enumerate(order):
            right = order[(index + 1) % len(order)]
            for witness in order:
                if witness not in (left, right):
                    solver.add(
                        cross(square[left], square[right], square[witness]) > 0
                    )
        return str(solver.check())

    center = (z3.RealVal(0), z3.RealVal(0))
    unit = (
        (z3.RealVal(1), z3.RealVal(0)),
        (z3.RealVal(0), z3.RealVal(1)),
        (z3.RealVal(-1), z3.RealVal(0)),
        (z3.RealVal(0), z3.RealVal(-1)),
    )
    bad = (*unit[:3], (z3.RealVal(0), z3.RealVal(-2)))

    def shell_status(support: tuple[Point, ...]) -> str:
        solver = z3.SolverFor("QF_NRA")
        radius = sqdist(center, support[0])
        solver.add(*(sqdist(center, point) == radius for point in support[1:]))
        return str(solver.check())

    answers = {
        "ccw_square": fixed_order_status(good_order),
        "wrong_square_order": fixed_order_status(bad_order),
        "unit_shell": shell_status(unit),
        "non_equidistant_shell": shell_status(bad),
    }
    expected = {
        "ccw_square": "sat",
        "wrong_square_order": "unsat",
        "unit_shell": "sat",
        "non_equidistant_shell": "unsat",
    }
    return {"passed": answers == expected, **answers}


def run_z3(system: CoordinateSystem, timeout_seconds: float) -> dict[str, Any]:
    solver = system.solver()
    solver.set("timeout", int(timeout_seconds * 1000))
    answer = solver.check()
    result: dict[str, Any] = {
        "engine": f"z3py {z3.get_version_string()} SolverFor(QF_NRA)",
        "timeout_seconds": timeout_seconds,
    }
    if answer == z3.unknown:
        result.update(status="UNKNOWN", reason_unknown=solver.reason_unknown())
        return result
    if answer == z3.unsat:
        result.update(status="UNSAT_UNCERTIFIED_EXTERNAL_SOLVER")
        return result

    model = solver.model()
    passed, failures, values = replay_z3_model(system, model)
    coordinates = {}
    for point_name in POINTS:
        if point_name == FIRST:
            coordinates[point_name] = {"x": {"exact": "0"}, "y": {"exact": "0"}}
        elif point_name == SECOND:
            coordinates[point_name] = {"x": {"exact": "1"}, "y": {"exact": "0"}}
        else:
            coordinates[point_name] = {
                "x": exact_value(values[f"x__{point_name}"]),
                "y": exact_value(values[f"y__{point_name}"]),
            }
    result.update(
        status=(
            "SAT_EXACT_Z3_SUBSTITUTION_REPLAY"
            if passed
            else "SAT_CANDIDATE_MODEL_REPLAY_FAILED"
        ),
        model_replay={
            "passed": passed,
            "checked_atom_count": len(system.atoms),
            "failed_atoms": failures,
        },
        coordinates=coordinates if passed else {},
    )
    if system.phase == "coordinate-plus-mec" and passed:
        result["mec"] = {
            name: exact_value(values[name])
            for name in ("mec__x", "mec__y", "mec__radius_sq")
        }
    return result


def parse_status(output: str) -> tuple[str, str]:
    lines = output.splitlines()
    for index, line in enumerate(lines):
        value = line.strip()
        if value in ("sat", "unsat", "unknown"):
            return value, "\n".join(lines[index + 1 :])
    return "no-verdict", output


def tokenize_sexpr(text: str) -> list[str]:
    return re.findall(r"\(|\)|[^\s()]+", text)


def parse_one_sexpr(tokens: list[str], index: int = 0) -> tuple[Any, int]:
    if index >= len(tokens):
        raise ValueError("unexpected end of S-expression")
    token = tokens[index]
    if token != "(":
        return token, index + 1
    values = []
    index += 1
    while index < len(tokens) and tokens[index] != ")":
        value, index = parse_one_sexpr(tokens, index)
        values.append(value)
    if index >= len(tokens):
        raise ValueError("unterminated S-expression")
    return values, index + 1


def sexpr_fraction(value: Any) -> Fraction:
    if isinstance(value, str):
        if value.endswith("?"):
            raise ValueError("approximate decimal is not exact")
        return Fraction(value)
    if not isinstance(value, list) or not value:
        raise ValueError(f"not a rational value: {value!r}")
    if value[0] == "-" and len(value) == 2:
        return -sexpr_fraction(value[1])
    if value[0] == "/" and len(value) == 3:
        return sexpr_fraction(value[1]) / sexpr_fraction(value[2])
    if value[0] == "+" and len(value) >= 2:
        return sum((sexpr_fraction(item) for item in value[1:]), Fraction(0))
    raise ValueError(f"unsupported exact value: {value!r}")


def replay_cvc5_rational_values(
    system: CoordinateSystem, model_text: str
) -> tuple[bool, list[str], dict[str, Fraction], str | None]:
    try:
        parsed, _ = parse_one_sexpr(tokenize_sexpr(model_text))
        if not isinstance(parsed, list):
            raise ValueError("get-value response is not a list")
        rational_values = {
            str(pair[0]): sexpr_fraction(pair[1])
            for pair in parsed
            if isinstance(pair, list) and len(pair) == 2
        }
        missing = sorted(set(system.variables) - set(rational_values))
        if missing:
            raise ValueError(f"missing variables: {missing}")
        substitutions = [
            (
                variable,
                z3.RealVal(f"{rational_values[name].numerator}/{rational_values[name].denominator}"),
            )
            for name, variable in system.variables.items()
        ]
        failures = [
            atom.name
            for atom in system.atoms
            if not z3.is_true(
                z3.simplify(z3.substitute(atom.assertion, *substitutions))
            )
        ]
        return not failures, failures, rational_values, None
    except (ValueError, ZeroDivisionError) as error:
        return False, [], {}, str(error)


def run_cvc5(system: CoordinateSystem, timeout_seconds: float) -> dict[str, Any]:
    smt2 = system.smt2(get_values=True)
    try:
        process = subprocess.run(
            [
                "cvc5",
                "--lang", "smt2",
                "--nl-cov",
                "--produce-models",
                "--tlimit", str(int(timeout_seconds * 1000)),
            ],
            input=smt2,
            text=True,
            capture_output=True,
            timeout=timeout_seconds + 20,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "engine": "cvc5 --nl-cov",
            "timeout_seconds": timeout_seconds,
            "status": "UNKNOWN_SUBPROCESS_TIMEOUT",
        }
    status, model_text = parse_status(process.stdout)
    result: dict[str, Any] = {
        "engine": "cvc5 1.3.3 --nl-cov",
        "timeout_seconds": timeout_seconds,
        "query_smt2_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
        "returncode": process.returncode,
        "stderr_tail": process.stderr[-2000:],
    }
    if status == "unknown":
        result["status"] = "UNKNOWN"
    elif status == "unsat":
        result["status"] = "UNSAT_UNCERTIFIED_EXTERNAL_SOLVER"
    elif status == "sat":
        passed, failures, values, error = replay_cvc5_rational_values(
            system, model_text
        )
        result["status"] = (
            "SAT_EXACT_RATIONAL_SUBSTITUTION_REPLAY"
            if passed
            else "SAT_CANDIDATE_NO_EXACT_SUBSTITUTION_REPLAY"
        )
        result["model_replay"] = {
            "passed": passed,
            "checked_atom_count": len(system.atoms) if passed else 0,
            "failed_atoms": failures,
            "parse_or_replay_error": error,
        }
        if passed:
            result["rational_model"] = {
                name: str(value) for name, value in sorted(values.items())
            }
    else:
        result.update(
            status="UNKNOWN_NO_VERDICT",
            stdout_tail=process.stdout[-2000:],
        )
    return result


def cvc5_smoke_test(timeout_seconds: float) -> dict[str, Any]:
    def decide(body: str) -> str:
        query = "(set-logic QF_NRA)\n" + body + "\n(check-sat)\n"
        process = subprocess.run(
            [
                "cvc5", "--lang", "smt2", "--nl-cov",
                "--tlimit", str(max(1, int(timeout_seconds * 1000))),
            ],
            input=query,
            text=True,
            capture_output=True,
            timeout=timeout_seconds + 5,
            check=False,
        )
        return parse_status(process.stdout)[0]

    answers = {
        "positive_square_root": decide(
            "(declare-fun x () Real)\n(assert (= (* x x) 1))\n(assert (> x 0))"
        ),
        "inconsistent_order": decide(
            "(declare-fun x () Real)\n(assert (> x 0))\n(assert (<= x 0))"
        ),
    }
    return {
        "passed": answers == {
            "positive_square_root": "sat",
            "inconsistent_order": "unsat",
        },
        **answers,
    }


def classify(engine: str, result: dict[str, Any]) -> str:
    status = str(result["status"])
    if status.startswith("SAT_EXACT"):
        return "VERIFIED_SAT_MODEL_FOR_ENCODED_FIXED_CELL"
    if status.startswith("SAT_CANDIDATE"):
        return "SAT_CANDIDATE_NOT_ACCEPTED_WITHOUT_MODEL_REPLAY"
    if status.startswith("UNSAT"):
        return "UNSAT_FIXED_CELL_UNCERTIFIED_NOT_PROOF_NOT_COVERAGE"
    if status.startswith("UNKNOWN"):
        return "UNKNOWN_NO_VERDICT"
    return f"{engine.upper()}_UNCLASSIFIED"


def run(
    engine: str,
    phase: str,
    timeout_seconds: float,
    exact_scope: str,
    explicit_distinctness: bool,
    row_prefix: str,
) -> dict[str, Any]:
    system = Builder(
        mec=phase == "mec",
        exact_scope=exact_scope,
        explicit_distinctness=explicit_distinctness,
        row_prefix=row_prefix,
    ).build()
    smoke = local_smoke_test()
    assert smoke["passed"], smoke
    cvc_smoke = None
    if engine == "cvc5":
        cvc_smoke = cvc5_smoke_test(min(timeout_seconds, 2.0))
        assert cvc_smoke["passed"], cvc_smoke
    # This digest binds the declarations and assertions.  Z3 consumes those
    # assertions in memory.  cvc5 consumes the same serialized formula plus
    # a post-check get-value command whose separate digest is returned by
    # run_cvc5; the model command is not part of the mathematical formula.
    formula_smt2 = system.smt2(get_values=False)
    atom_manifest = json.dumps(
        [
            (atom.name, atom.family, atom.assertion.sexpr())
            for atom in system.atoms
        ],
        separators=(",", ":"),
    )
    result = (
        run_z3(system, timeout_seconds)
        if engine == "z3"
        else run_cvc5(system, timeout_seconds)
    )
    return {
        "schema": "period-three-rank2-fixed-cell-qf-nra-v1",
        "epistemic_status": (
            "BOUNDED_EXTERNAL_QF_NRA_DISCOVERY_NOT_LEAN_NOT_PROOF"
        ),
        "engine": engine,
        "phase": phase,
        "exact_scope": exact_scope,
        "explicit_distinctness": explicit_distinctness,
        "row_prefix": row_prefix,
        "timeout_seconds": timeout_seconds,
        "encoding_audit": system_audit(system),
        "asserted_formula_smt2_sha256": hashlib.sha256(
            formula_smt2.encode()
        ).hexdigest(),
        "named_atom_manifest_sha256": hashlib.sha256(
            atom_manifest.encode()
        ).hexdigest(),
        "smoke_tests": {
            "local_encoding": smoke,
            "cvc5": cvc_smoke,
        },
        "solver": result,
        "classification": classify(engine, result),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--engine", choices=("z3", "cvc5"), required=True)
    parser.add_argument("--phase", choices=("coordinate", "mec"), default="coordinate")
    parser.add_argument("--timeout-seconds", type=float, default=120.0)
    parser.add_argument(
        "--exact-scope",
        choices=(
            "none",
            "physical",
            "physical-reverse0",
            "physical-reverse01",
            "all",
        ),
        default="all",
    )
    parser.add_argument("--derive-distinctness-from-convexity", action="store_true")
    parser.add_argument(
        "--row-prefix",
        choices=("first", "physical", "reverse0", "reverse01", "all"),
        default="all",
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not (0 < args.timeout_seconds <= 120):
        raise ValueError("timeout must be in (0, 120]")
    payload = run(
        args.engine,
        args.phase,
        args.timeout_seconds,
        args.exact_scope,
        not args.derive_distinctness_from_convexity,
        args.row_prefix,
    )
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
