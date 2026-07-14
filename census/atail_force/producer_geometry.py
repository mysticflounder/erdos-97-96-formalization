#!/usr/bin/env python3
"""Named QF_NRA geometry surface for the ATAIL producer miner.

This module is a theorem-discovery encoder, not a proof checker.  Every
constraint is emitted as a small named atom so a bounded solver call can feed
the MARCO layer in :mod:`census.atail_force.producer_mus`.  SAT and UNSAT are
both solver evidence only until independently replayed and translated to a
Lean consumer.

The input is deliberately separate from coordinates.  ``GeometryBlueprint``
records the finite surface selected by ``producer_surface``; this module adds
real coordinate variables and the polynomial meaning of that surface.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import shutil
import subprocess
from typing import Iterable, Literal, Mapping, Sequence

import sympy as sp
import z3

from census.atail_force import producer_surface as surface


Relation = Literal["eq", "ge", "gt", "ne", "or_ne"]
MAX_Z3_TIMEOUT_MS = 30_000
MAX_CVC5_TIMEOUT_SECONDS = 30.0


class GeometryError(ValueError):
    """The finite producer surface cannot be encoded faithfully."""


@dataclass(frozen=True)
class ExactClassSpec:
    """One full exact-radius filter about a carrier apex."""

    apex: str
    class_id: str
    members: tuple[str, ...]


@dataclass(frozen=True)
class PinnedK4Row:
    """Four witnesses selected from one global-K4 radius class."""

    center: str
    row_id: str
    members: tuple[str, str, str, str]


@dataclass(frozen=True)
class GeometryBlueprint:
    """Finite combinatorial data whose Euclidean realization is queried."""

    case_id: str
    labels: tuple[str, ...]
    cyclic_order: tuple[str, ...]
    surplus_apex: str
    opp_apex1: str
    opp_apex2: str
    surplus_cap: frozenset[str]
    opp_cap1: frozenset[str]
    opp_cap2: frozenset[str]
    exact_classes: tuple[ExactClassSpec, ...]
    pinned_k4_rows: tuple[PinnedK4Row, ...]


@dataclass(frozen=True)
class NamedPolynomialAtom:
    """A named QF_NRA assertion.

    ``eq/ge/gt/ne`` apply to the single polynomial in ``polynomials`` relative
    to zero.  ``or_ne`` means that at least one listed polynomial is nonzero.
    """

    name: str
    family: str
    relation: Relation
    polynomials: tuple[sp.Expr, ...]
    lean_source: str

    def __post_init__(self) -> None:
        if not self.name or any(ch.isspace() for ch in self.name):
            raise GeometryError(f"invalid atom name {self.name!r}")
        expected = 2 if self.relation == "or_ne" else 1
        if len(self.polynomials) != expected:
            raise GeometryError(
                f"{self.name}: relation {self.relation} needs {expected} polynomial(s)"
            )


@dataclass(frozen=True)
class GeometrySystem:
    blueprint: GeometryBlueprint
    variables: tuple[sp.Symbol, ...]
    atoms: tuple[NamedPolynomialAtom, ...]
    omitted_ledger: tuple[str, ...]

    def atom_names(self) -> tuple[str, ...]:
        return tuple(atom.name for atom in self.atoms)


OMITTED_LEDGER = (
    "literal hNoM44 over every possible SurplusCapPacket; only a chosen-case cap profile is encoded",
    "the unrelated CounterexampleData.packet is not identified with leafSurplusPacket",
    "arbitrary CriticalShellSystem.centerAt selector diversity and canonicality",
    "critical-blocker deletion failure and choice-invariant blocker outputs (milestone 3)",
    "live U3/U5 dangerous-row and CriticalSourceRows-to-cap coupling (phase 2)",
    "the quantified minimum-radius clause of MEC; the exposed disk/boundary/nonobtuse packet is encoded",
    "rational-coordinate restrictions; one explicit cyclic label order is encoded, but exhaustive order-orbit coverage is not yet claimed",
    "no-removable-vertex, which is not a hypothesis of DoubleApexOffSurplusSharedRadiusPair",
)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise GeometryError(message)


def _safe(label: str) -> str:
    cleaned = "".join(ch if ch.isalnum() or ch == "_" else "_" for ch in label)
    _require(bool(cleaned), f"empty normalized label for {label!r}")
    return cleaned


def _point_symbols(labels: Sequence[str]) -> dict[str, tuple[sp.Symbol, sp.Symbol]]:
    return {
        label: sp.symbols(f"x_{_safe(label)} y_{_safe(label)}", real=True)
        for label in labels
    }


def _d2(
    left: tuple[sp.Expr, sp.Expr], right: tuple[sp.Expr, sp.Expr]
) -> sp.Expr:
    return sp.expand((left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2)


def _signed_area(
    a: tuple[sp.Expr, sp.Expr],
    b: tuple[sp.Expr, sp.Expr],
    c: tuple[sp.Expr, sp.Expr],
) -> sp.Expr:
    return sp.expand(
        (b[0] - a[0]) * (c[1] - a[1])
        - (c[0] - a[0]) * (b[1] - a[1])
    )


def _dot_at(
    vertex: tuple[sp.Expr, sp.Expr],
    left: tuple[sp.Expr, sp.Expr],
    right: tuple[sp.Expr, sp.Expr],
) -> sp.Expr:
    return sp.expand(
        (left[0] - vertex[0]) * (right[0] - vertex[0])
        + (left[1] - vertex[1]) * (right[1] - vertex[1])
    )


def _validate_blueprint(spec: GeometryBlueprint) -> None:
    labels = set(spec.labels)
    _require(len(labels) == len(spec.labels), "carrier labels are not unique")
    _require(len(labels) >= 3, "geometry surface needs at least three labels")
    _require(
        set(spec.cyclic_order) == labels and len(spec.cyclic_order) == len(labels),
        "cyclic order must contain every carrier label exactly once",
    )
    apices = {spec.surplus_apex, spec.opp_apex1, spec.opp_apex2}
    _require(len(apices) == 3 and apices <= labels, "Moser apices must be distinct labels")
    caps = (spec.surplus_cap, spec.opp_cap1, spec.opp_cap2)
    _require(all(cap <= labels for cap in caps), "cap contains a non-carrier label")
    for exact in spec.exact_classes:
        _require(exact.apex in labels, f"unknown exact-class apex {exact.apex}")
        _require(bool(exact.members), f"empty exact class {exact.class_id}")
        _require(set(exact.members) <= labels, f"unknown member in {exact.class_id}")
        _require(
            len(set(exact.members)) == len(exact.members),
            f"duplicate member in {exact.class_id}",
        )
    for row in spec.pinned_k4_rows:
        _require(row.center in labels, f"unknown K4 center {row.center}")
        _require(set(row.members) <= labels, f"unknown member in K4 row {row.row_id}")
        _require(len(set(row.members)) == 4, f"K4 row {row.row_id} is not four-point")


def blueprint_from_surface(
    case: surface.ProducerCase,
    assignment: surface.ApexClassAssignment,
) -> GeometryBlueprint:
    """Lift one validated finite assignment into the polynomial interface.

    The canonical frame labels its three cap interiors in boundary-block
    order.  In the current role gauge the positive cyclic order is
    ``0, int(O2), 1, int(S), 2, int(O1)``.  This is an explicit order choice
    for realizability, not a claim that the finite surface supplied an order.
    """

    surface.validate_assignment(case, assignment)
    negation = surface.encode_no_shared_off_surplus_pair_negation(case, assignment)
    _require(
        negation.holds,
        f"{case.case_id}: assignment does not satisfy the target negation",
    )
    frame = surface.frame_for_case(case)
    _require(
        case.cap_roles == surface.CapRoles("S", "O1", "O2"),
        f"{case.case_id}: no canonical cyclic lift for cap roles {case.cap_roles}",
    )
    labels = tuple(str(label) for label in range(frame.n))
    cyclic = tuple(
        str(label)
        for label in (
            0, *frame.ints["O2"], 1, *frame.ints["S"], 2, *frame.ints["O1"]
        )
    )
    exact_classes = (
        ExactClassSpec(
            str(case.opp_apex1),
            "opp_apex1_exact",
            tuple(str(label) for label in assignment.opp_apex1_exact.support),
        ),
        ExactClassSpec(
            str(case.opp_apex2),
            "opp_apex2_exact",
            tuple(str(label) for label in assignment.opp_apex2_exact.support),
        ),
    )
    pinned_rows = (
        PinnedK4Row(
            str(case.opp_apex1),
            "opp_apex1_selected_four",
            tuple(str(label) for label in assignment.opp_apex1_selected_four.support),
        ),
        PinnedK4Row(
            str(case.opp_apex2),
            "opp_apex2_selected_four",
            tuple(str(label) for label in assignment.opp_apex2_selected_four.support),
        ),
    )
    surplus_endpoints = surface.mc.CAP_VERTS[case.cap_roles.surplus]
    surplus_apexes = surface.mc.MOSER_SET - surplus_endpoints
    _require(len(surplus_apexes) == 1, f"{case.case_id}: malformed surplus apex")
    return GeometryBlueprint(
        case_id=case.case_id,
        labels=labels,
        cyclic_order=cyclic,
        surplus_apex=str(next(iter(surplus_apexes))),
        opp_apex1=str(case.opp_apex1),
        opp_apex2=str(case.opp_apex2),
        surplus_cap=frozenset(str(label) for label in surface.closed_cap(frame, "S")),
        opp_cap1=frozenset(str(label) for label in surface.closed_cap(frame, "O1")),
        opp_cap2=frozenset(str(label) for label in surface.closed_cap(frame, "O2")),
        exact_classes=exact_classes,
        pinned_k4_rows=pinned_rows,
    )


def build_case_geometry(
    case: surface.ProducerCase,
    assignment: surface.ApexClassAssignment,
) -> GeometrySystem:
    """Validated producer-surface to named-polynomial construction."""

    return build_geometry_system(blueprint_from_surface(case, assignment))


def build_geometry_system(spec: GeometryBlueprint) -> GeometrySystem:
    """Emit the milestone-2 named polynomial surface."""

    _validate_blueprint(spec)
    points = _point_symbols(spec.labels)
    mec_x, mec_y, mec_r2 = sp.symbols("mec_x mec_y mec_r2", real=True)
    mec = (mec_x, mec_y)
    variables: list[sp.Symbol] = [
        coordinate for label in spec.labels for coordinate in points[label]
    ] + [mec_x, mec_y, mec_r2]
    atoms: list[NamedPolynomialAtom] = []

    def add(
        name: str,
        family: str,
        relation: Relation,
        polynomial: sp.Expr | tuple[sp.Expr, sp.Expr],
        lean_source: str,
    ) -> None:
        polynomials = polynomial if isinstance(polynomial, tuple) else (polynomial,)
        atoms.append(
            NamedPolynomialAtom(
                name, family, relation,
                tuple(sp.expand(value) for value in polynomials), lean_source,
            )
        )

    # Similarity gauge: the opposite apices determine translation, rotation,
    # and scale.  Their distinctness is already a live Moser fact.
    a1, a2 = spec.opp_apex1, spec.opp_apex2
    add(f"GAUGE_{_safe(a1)}_X", "gauge", "eq", points[a1][0], "hCirc")
    add(f"GAUGE_{_safe(a1)}_Y", "gauge", "eq", points[a1][1], "hCirc")
    add(f"GAUGE_{_safe(a2)}_X", "gauge", "eq", points[a2][0] - 1, "hCirc")
    add(f"GAUGE_{_safe(a2)}_Y", "gauge", "eq", points[a2][1], "hCirc")

    for left_index, left in enumerate(spec.labels):
        for right in spec.labels[left_index + 1 :]:
            add(
                f"DISTINCT_{_safe(left)}_{_safe(right)}",
                "distinctness", "gt", _d2(points[left], points[right]),
                "CounterexampleData.convex / hbase",
            )

    # A fixed strict convex cyclic order: every other vertex is strictly to
    # the left of every directed boundary edge.
    order = spec.cyclic_order
    for index, left in enumerate(order):
        right = order[(index + 1) % len(order)]
        for witness in order:
            if witness in {left, right}:
                continue
            add(
                f"CONVEX_EDGE_{_safe(left)}_{_safe(right)}_{_safe(witness)}",
                "strict-convex-order", "gt",
                _signed_area(points[left], points[right], points[witness]),
                "BoundaryIndexing.boundary_ccw",
            )

    add("MEC_RADIUS_POS", "mec", "gt", mec_r2, "CircumscribedMECPacket.radius_pos")
    for apex in (spec.surplus_apex, spec.opp_apex1, spec.opp_apex2):
        add(
            f"MEC_BOUNDARY_{_safe(apex)}", "mec-boundary", "eq",
            _d2(points[apex], mec) - mec_r2,
            "CircumscribedMECPacket.moser_on_boundary",
        )
    for label in spec.labels:
        add(
            f"MEC_DISK_{_safe(label)}", "mec-disk", "ge",
            mec_r2 - _d2(points[label], mec),
            "CircumscribedMECPacket.disk_contains_A",
        )

    triangle = (spec.surplus_apex, spec.opp_apex1, spec.opp_apex2)
    for index, vertex in enumerate(triangle):
        left = triangle[(index + 1) % 3]
        right = triangle[(index + 2) % 3]
        add(
            f"NONOBT_{_safe(vertex)}", "mec-nonobtuse", "ge",
            _dot_at(points[vertex], points[left], points[right]),
            "NonObtuseCircumscribedMoserTriangle.inner_at_v",
        )

    # The three closed cap predicates are exactly OnArcOpposite.  A member
    # has product <= 0; a nonmember has product > 0.
    cap_specs = (
        ("SURPLUS", spec.surplus_apex, spec.opp_apex1, spec.opp_apex2, spec.surplus_cap),
        ("OPP1", spec.opp_apex1, spec.opp_apex2, spec.surplus_apex, spec.opp_cap1),
        ("OPP2", spec.opp_apex2, spec.surplus_apex, spec.opp_apex1, spec.opp_cap2),
    )
    for cap_name, opposite, base_left, base_right, members in cap_specs:
        opposite_sign = _signed_area(
            points[opposite], points[base_left], points[base_right]
        )
        for label in spec.labels:
            product = sp.expand(
                _signed_area(points[label], points[base_left], points[base_right])
                * opposite_sign
            )
            relation: Relation = "ge" if label in members else "gt"
            polynomial = -product if label in members else product
            add(
                f"CAP_IFF_{cap_name}_{_safe(label)}", "cap-iff-sign", relation,
                polynomial, "CapTriple.arc_membership / OnArcOpposite",
            )

    for exact in spec.exact_classes:
        radius = sp.Symbol(f"radius2_{_safe(exact.class_id)}", real=True)
        variables.append(radius)
        add(
            f"EXACT_RADIUS_POS_{_safe(exact.class_id)}", "exact-apex-filter", "gt",
            radius, "SelectedClass positive radius",
        )
        member_set = set(exact.members)
        for label in spec.labels:
            relation = "eq" if label in member_set else "ne"
            add(
                f"EXACT_FILTER_{_safe(exact.class_id)}_{_safe(label)}",
                "exact-apex-filter", relation,
                _d2(points[exact.apex], points[label]) - radius,
                "full exact-radius filter",
            )

    for row in spec.pinned_k4_rows:
        radius = sp.Symbol(f"k4_radius2_{_safe(row.row_id)}", real=True)
        variables.append(radius)
        add(
            f"K4_RADIUS_POS_{_safe(row.row_id)}", "pinned-global-k4", "gt",
            radius, "CounterexampleData.K4",
        )
        for member in row.members:
            add(
                f"K4_ROW_{_safe(row.row_id)}_{_safe(member)}",
                "pinned-global-k4", "eq",
                _d2(points[row.center], points[member]) - radius,
                "SelectedFourWitness / CounterexampleData.K4",
            )

    off_surplus = tuple(label for label in spec.labels if label not in spec.surplus_cap)
    for left_index, left in enumerate(off_surplus):
        for right in off_surplus[left_index + 1 :]:
            add(
                f"TARGET_NO_JOINT_{_safe(left)}_{_safe(right)}",
                "target-negation", "or_ne",
                (
                    _d2(points[spec.opp_apex1], points[left])
                    - _d2(points[spec.opp_apex1], points[right]),
                    _d2(points[spec.opp_apex2], points[left])
                    - _d2(points[spec.opp_apex2], points[right]),
                ),
                "doubleApexJointFiber_sdiff_surplus_card_le_one",
            )

    names = [atom.name for atom in atoms]
    _require(len(names) == len(set(names)), "named geometry atoms collide")
    return GeometrySystem(spec, tuple(dict.fromkeys(variables)), tuple(atoms), OMITTED_LEDGER)


def _sympy_to_z3(
    expression: sp.Expr,
    variables: Sequence[sp.Symbol],
    z3_variables: Mapping[str, z3.ArithRef],
) -> z3.ArithRef:
    polynomial = sp.Poly(sp.expand(expression), *variables, domain=sp.QQ)
    result: z3.ArithRef = z3.RealVal(0)
    for powers, coefficient in polynomial.terms():
        term: z3.ArithRef = z3.Q(coefficient.p, coefficient.q)
        for variable, power in zip(variables, powers):
            if power:
                term *= z3_variables[str(variable)] ** power
        result += term
    return result


def _atom_to_z3(
    atom: NamedPolynomialAtom,
    variables: Sequence[sp.Symbol],
    z3_variables: Mapping[str, z3.ArithRef],
) -> z3.BoolRef:
    translated = [
        _sympy_to_z3(poly, variables, z3_variables) for poly in atom.polynomials
    ]
    if atom.relation == "eq":
        return translated[0] == 0
    if atom.relation == "ge":
        return translated[0] >= 0
    if atom.relation == "gt":
        return translated[0] > 0
    if atom.relation == "ne":
        return translated[0] != 0
    return z3.Or(*(value != 0 for value in translated))


def build_z3_solver(
    system: GeometrySystem,
    enabled_atoms: Iterable[str] | None = None,
    *,
    timeout_ms: int = 1_000,
    tracked: bool = True,
) -> z3.Solver:
    """Build, but do not run, a bounded QF_NRA solver instance."""

    _require(
        0 < timeout_ms <= MAX_Z3_TIMEOUT_MS,
        f"Z3 timeout must be in 1..{MAX_Z3_TIMEOUT_MS} ms",
    )
    enabled = set(system.atom_names() if enabled_atoms is None else enabled_atoms)
    unknown = enabled - set(system.atom_names())
    _require(not unknown, f"unknown geometry atoms: {sorted(unknown)}")
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    zvars = {str(variable): z3.Real(str(variable)) for variable in system.variables}
    for atom in system.atoms:
        if atom.name not in enabled:
            continue
        assertion = _atom_to_z3(atom, system.variables, zvars)
        if tracked:
            solver.assert_and_track(assertion, z3.Bool(atom.name))
        else:
            solver.add(assertion)
    return solver


def run_z3_bounded(
    system: GeometrySystem,
    enabled_atoms: Iterable[str] | None = None,
    *,
    timeout_ms: int = 1_000,
) -> dict[str, object]:
    """Run one bounded query.  No retry, extension, or automatic sweep."""

    solver = build_z3_solver(system, enabled_atoms, timeout_ms=timeout_ms, tracked=True)
    answer = solver.check()
    status = "SAT" if answer == z3.sat else "UNSAT" if answer == z3.unsat else "UNKNOWN"
    core = sorted(str(item) for item in solver.unsat_core()) if answer == z3.unsat else []
    return {
        "status": status,
        "unsat_core": core,
        "reason_unknown": solver.reason_unknown() if answer == z3.unknown else "",
        "timeout_ms": timeout_ms,
        "evidence_scope": "trusted QF_NRA computation; not a Lean proof",
    }


def _smt_symbol(name: str) -> str:
    return f"|{name.replace('|', '_')}|"


def _poly_to_smt2(expression: sp.Expr) -> str:
    """Translate a SymPy polynomial through Z3's exact SMT-LIB printer."""

    variables = tuple(sorted(expression.free_symbols, key=str))
    if not variables:
        rational = sp.Rational(expression)
        return z3.Q(rational.p, rational.q).sexpr()
    zvars = {str(variable): z3.Real(str(variable)) for variable in variables}
    return _sympy_to_z3(expression, variables, zvars).sexpr()


def build_cvc5_smt2(
    system: GeometrySystem,
    enabled_atoms: Iterable[str] | None = None,
) -> str:
    """Emit a named-assertion QF_NRA query accepted by cvc5."""

    enabled = set(system.atom_names() if enabled_atoms is None else enabled_atoms)
    unknown = enabled - set(system.atom_names())
    _require(not unknown, f"unknown geometry atoms: {sorted(unknown)}")
    lines = ["(set-logic QF_NRA)", "(set-option :produce-unsat-cores true)"]
    lines.extend(f"(declare-fun {_smt_symbol(str(var))} () Real)" for var in system.variables)
    for atom in system.atoms:
        if atom.name not in enabled:
            continue
        values = [_poly_to_smt2(poly) for poly in atom.polynomials]
        if atom.relation == "eq":
            body = f"(= {values[0]} 0)"
        elif atom.relation == "ge":
            body = f"(>= {values[0]} 0)"
        elif atom.relation == "gt":
            body = f"(> {values[0]} 0)"
        elif atom.relation == "ne":
            body = f"(not (= {values[0]} 0))"
        else:
            body = f"(or (not (= {values[0]} 0)) (not (= {values[1]} 0)))"
        lines.append(f"(assert (! {body} :named {_smt_symbol(atom.name)}))")
    lines.extend(("(check-sat)", "(get-unsat-core)", ""))
    return "\n".join(lines)


def run_cvc5_bounded(
    system: GeometrySystem,
    enabled_atoms: Iterable[str] | None = None,
    *,
    cvc5: str | Path | None = None,
    timeout_seconds: float = 1.0,
) -> dict[str, object]:
    """Run exactly one cvc5 query under both internal and host time bounds."""

    _require(
        0 < timeout_seconds <= MAX_CVC5_TIMEOUT_SECONDS,
        f"cvc5 timeout must be at most {MAX_CVC5_TIMEOUT_SECONDS:g} seconds",
    )
    executable = str(cvc5 or shutil.which("cvc5") or "/Users/adam/bin/cvc5")
    _require(Path(executable).is_file(), f"cvc5 executable not found: {executable}")
    smt2 = build_cvc5_smt2(system, enabled_atoms)
    command = [
        executable, "--lang=smt2", "--nl-cov", "--produce-unsat-cores",
        f"--tlimit={max(1, int(timeout_seconds * 1000))}", "-",
    ]
    try:
        completed = subprocess.run(
            command, input=smt2, text=True, capture_output=True,
            timeout=timeout_seconds + 1.0, check=False,
        )
    except subprocess.TimeoutExpired as exc:
        return {
            "status": "UNKNOWN", "reason": "host-timeout",
            "stdout": exc.stdout or "", "stderr": exc.stderr or "",
            "evidence_scope": "trusted QF_NRA computation; not a Lean proof",
        }
    first = next((line.strip() for line in completed.stdout.splitlines() if line.strip()), "")
    status = {"sat": "SAT", "unsat": "UNSAT", "unknown": "UNKNOWN"}.get(first, "ERROR")
    return {
        "status": status,
        "returncode": completed.returncode,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
        "timeout_seconds": timeout_seconds,
        "evidence_scope": "trusted QF_NRA computation; not a Lean proof",
    }


def z3_smoke_gate() -> dict[str, object]:
    """Cheap engine sanity check, independent of any producer case."""

    x = z3.Real("producer_geometry_smoke_x")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set(timeout=1_000)
    sat_solver.add(x * x == 1)
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set(timeout=1_000)
    unsat_solver.add(x * x < 0)
    sat_result, unsat_result = sat_solver.check(), unsat_solver.check()
    return {
        "passed": sat_result == z3.sat and unsat_result == z3.unsat,
        "sat_probe": str(sat_result),
        "unsat_probe": str(unsat_result),
    }


def cvc5_smoke_gate(
    *, cvc5: str | Path | None = None, timeout_seconds: float = 1.0
) -> dict[str, object]:
    """Optional external-engine smoke gate; it performs no producer query."""

    _require(
        0 < timeout_seconds <= MAX_CVC5_TIMEOUT_SECONDS,
        f"cvc5 timeout must be at most {MAX_CVC5_TIMEOUT_SECONDS:g} seconds",
    )
    executable = str(cvc5 or shutil.which("cvc5") or "/Users/adam/bin/cvc5")
    _require(Path(executable).is_file(), f"cvc5 executable not found: {executable}")
    probes = {
        "sat": "(set-logic QF_NRA)\n(declare-fun x () Real)\n(assert (= (* x x) 1))\n(check-sat)\n",
        "unsat": "(set-logic QF_NRA)\n(declare-fun x () Real)\n(assert (< (* x x) 0))\n(check-sat)\n",
    }
    answers: dict[str, str] = {}
    for name, text in probes.items():
        completed = subprocess.run(
            [executable, "--lang=smt2", "--nl-cov", "-"],
            input=text, text=True, capture_output=True,
            timeout=timeout_seconds, check=False,
        )
        answers[name] = next(
            (line.strip() for line in completed.stdout.splitlines() if line.strip()), ""
        )
    return {"passed": answers == {"sat": "sat", "unsat": "unsat"}, **answers}
