#!/usr/bin/env python3
"""Test the saved (6,5,4) shadow as a full Problem 97 counterexample.

The finite shadow already assigns one equidistant row to every one of its
12 labels.  This probe adds exactly the geometric hypotheses needed by
``Problem97.IsCounterexample``:

* real plane coordinates for all 12 labels;
* pairwise distinctness;
* strict convex position in the saved cyclic order; and
* all 37 squared-distance equalities in the saved rows.

The query deliberately does not add cap, MEC, critical-blocker, deletion, or
exact-radius-filter predicates.  Those are relevant to the ATAIL derivation,
but not to whether the coordinates themselves would be a Problem 97
counterexample.

Verdicts are trusted QF_NRA computations, not Lean proofs.  A SAT verdict is
accepted only after every named atom is evaluated to true in the exact Z3
model and the same SMT-LIB query is submitted independently to cvc5.
"""

from __future__ import annotations

import argparse
from collections import Counter
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess
import sys
from typing import Any

import sympy as sp
import z3

from census.atail_force import producer_geometry as geometry


N = 12
PROFILE = (6, 5, 4)
CYCLIC_ORDER = (0, 10, 11, 1, 3, 4, 5, 6, 2, 7, 8, 9)
ROWS = (
    (0, (3, 5, 9, 10)),
    (1, (0, 4, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (3, (1, 5, 6, 7)),
    (4, (2, 3, 5, 8)),
    (5, (2, 4, 7, 11)),
    (6, (1, 4, 5, 8)),
    (7, (4, 6, 9, 10)),
    (8, (3, 7, 9, 11)),
    (9, (0, 2, 3, 4)),
    (10, (1, 2, 6, 9)),
    (11, (3, 6, 8, 10)),
)
EXPECTED_EQUALITY_SHA256 = (
    "2476ead343e748e4edb2147ea81c03ed94280245cd82ea7dd7128eff4ed06750"
)
ROOT = Path(__file__).resolve().parents[3]
ORACLE_PATH = ROOT / "scratch/atail-force/second_center_metric_oracle/oracle.py"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def load_metric_oracle() -> Any:
    spec = importlib.util.spec_from_file_location("p97_654_metric_oracle", ORACLE_PATH)
    require(spec is not None and spec.loader is not None, "metric oracle import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def d2(
    left: tuple[sp.Expr, sp.Expr], right: tuple[sp.Expr, sp.Expr]
) -> sp.Expr:
    return sp.expand((left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2)


def signed_area(
    a: tuple[sp.Expr, sp.Expr],
    b: tuple[sp.Expr, sp.Expr],
    c: tuple[sp.Expr, sp.Expr],
) -> sp.Expr:
    return sp.expand(
        (b[0] - a[0]) * (c[1] - a[1])
        - (c[0] - a[0]) * (b[1] - a[1])
    )


def build_system() -> geometry.GeometrySystem:
    labels = tuple(str(label) for label in range(N))
    points = {
        label: sp.symbols(f"x_{label} y_{label}", real=True)
        for label in range(N)
    }
    variables = tuple(
        coordinate for label in range(N) for coordinate in points[label]
    )
    blueprint = geometry.GeometryBlueprint(
        case_id="card12_profile_654_saved_counterexample_test",
        labels=labels,
        cyclic_order=tuple(str(label) for label in CYCLIC_ORDER),
        surplus_apex="2",
        opp_apex1="0",
        opp_apex2="1",
        surplus_cap=frozenset(),
        opp_cap1=frozenset(),
        opp_cap2=frozenset(),
        exact_classes=(),
        pinned_k4_rows=(),
    )
    atoms: list[geometry.NamedPolynomialAtom] = []

    def add(
        name: str,
        family: str,
        relation: geometry.Relation,
        polynomial: sp.Expr,
        lean_source: str,
    ) -> None:
        atoms.append(
            geometry.NamedPolynomialAtom(
                name=name,
                family=family,
                relation=relation,
                polynomials=(sp.expand(polynomial),),
                lean_source=lean_source,
            )
        )

    # Similarity gauge.  Since labels 0 and 1 are constrained distinct, every
    # realization is similar (possibly after reflection) to one in this gauge.
    add("GAUGE_0_X", "gauge", "eq", points[0][0], "similarity normalization")
    add("GAUGE_0_Y", "gauge", "eq", points[0][1], "similarity normalization")
    add("GAUGE_1_X", "gauge", "eq", points[1][0] - 1, "similarity normalization")
    add("GAUGE_1_Y", "gauge", "eq", points[1][1], "similarity normalization")

    # Use the first support as the radius pivot, matching the exact-CAS
    # equality oracle whose digest is checked below.
    for center, support in ROWS:
        pivot = support[0]
        for member in support[1:]:
            add(
                f"ROW_{center}_{pivot}_{member}",
                "equidistant-row",
                "eq",
                d2(points[center], points[pivot])
                - d2(points[center], points[member]),
                "Erdos97.HasNEquidistantProperty",
            )

    for left in range(N):
        for right in range(left + 1, N):
            add(
                f"DISTINCT_{left}_{right}",
                "distinctness",
                "gt",
                d2(points[left], points[right]),
                "Finset carrier injection",
            )

    # A fixed strict convex cyclic order: every other point is strictly left
    # of every directed boundary edge.  Reflection lets us choose this sign.
    for index, left in enumerate(CYCLIC_ORDER):
        right = CYCLIC_ORDER[(index + 1) % N]
        for witness in CYCLIC_ORDER:
            if witness in {left, right}:
                continue
            add(
                f"CONVEX_EDGE_{left}_{right}_{witness}",
                "strict-convex-order",
                "gt",
                signed_area(points[left], points[right], points[witness]),
                "Problem97.ConvexIndep boundary certificate",
            )

    names = [atom.name for atom in atoms]
    require(len(names) == len(set(names)), "named atoms are not unique")
    return geometry.GeometrySystem(
        blueprint=blueprint,
        variables=variables,
        atoms=tuple(atoms),
        omitted_ledger=(
            "cap and MEC predicates: unnecessary for Problem97.IsCounterexample",
            "critical-blocker and deletion predicates: unnecessary for Problem97.IsCounterexample",
            "full radius-class exactness: HasNEquidistantProperty only needs four witnesses",
        ),
    )


def equality_digest(metric_oracle: Any) -> str:
    # The saved audit serialized the distinguished five-row first and then
    # the remaining centers in numeric order.  Preserve that order because
    # the digest intentionally binds the ordered polynomial stream.
    ordered_rows = (ROWS[1],) + ROWS[:1] + ROWS[2:]
    metric_rows = tuple(
        metric_oracle.MetricRow(center, support, exact=False)
        for center, support in ordered_rows
    )
    return metric_oracle.canonical_sha256(
        list(metric_oracle.serialized_system(N, metric_rows))
    )


def encoding_audit(system: geometry.GeometrySystem, digest: str) -> dict[str, Any]:
    centers = tuple(center for center, _support in ROWS)
    require(centers == tuple(range(N)), "rows do not cover every center exactly once")
    for center, support in ROWS:
        require(center not in support, f"row {center} contains its center")
        require(len(set(support)) == len(support), f"row {center} repeats a witness")
        require(len(support) >= 4, f"row {center} has fewer than four witnesses")
        require(all(0 <= member < N for member in support), f"row {center} is out of range")
    require(set(CYCLIC_ORDER) == set(range(N)), "cyclic order is not a permutation")
    require(digest == EXPECTED_EQUALITY_SHA256, "saved equality-system digest drifted")

    family_counts = Counter(atom.family for atom in system.atoms)
    expected = {
        "gauge": 4,
        "equidistant-row": 37,
        "distinctness": 66,
        "strict-convex-order": 120,
    }
    require(dict(family_counts) == expected, "unexpected named-atom ledger")
    require(len(system.variables) == 24, "unexpected coordinate-variable count")
    require(
        all(sp.Poly(atom.polynomials[0], *system.variables).total_degree() <= 2
            for atom in system.atoms),
        "encoding left quadratic arithmetic",
    )
    return {
        "passed": True,
        "profile": list(PROFILE),
        "n": N,
        "cyclic_order": list(CYCLIC_ORDER),
        "row_centers": list(centers),
        "row_support_sizes": {str(c): len(s) for c, s in ROWS},
        "equality_count": 37,
        "expanded_polynomial_sha256": digest,
        "variable_count": len(system.variables),
        "atom_count": len(system.atoms),
        "family_counts": dict(family_counts),
        "problem97_implication": (
            "SAT gives 12 distinct strictly convex points and at least four "
            "positive-radius equidistant witnesses at every carrier point"
        ),
    }


def normalize_gauge(system: geometry.GeometrySystem) -> geometry.GeometrySystem:
    """Substitute the four similarity-gauge equations before QF_NRA."""

    substitutions = {
        next(var for var in system.variables if str(var) == "x_0"): sp.Integer(0),
        next(var for var in system.variables if str(var) == "y_0"): sp.Integer(0),
        next(var for var in system.variables if str(var) == "x_1"): sp.Integer(1),
        next(var for var in system.variables if str(var) == "y_1"): sp.Integer(0),
    }
    variables = tuple(var for var in system.variables if var not in substitutions)
    atoms = tuple(
        geometry.NamedPolynomialAtom(
            name=atom.name,
            family=atom.family,
            relation=atom.relation,
            polynomials=tuple(
                sp.expand(poly.subs(substitutions)) for poly in atom.polynomials
            ),
            lean_source=atom.lean_source,
        )
        for atom in system.atoms
        if atom.family != "gauge"
    )
    require(
        all(not poly.free_symbols.intersection(substitutions)
            for atom in atoms for poly in atom.polynomials),
        "gauge substitution left fixed variables in the query",
    )
    return geometry.GeometrySystem(
        blueprint=system.blueprint,
        variables=variables,
        atoms=atoms,
        omitted_ledger=system.omitted_ledger,
    )


def local_encoding_smoke() -> dict[str, Any]:
    """Exercise the row and strict-order formulas on exact fixed examples."""

    def zd2(left: tuple[Any, Any], right: tuple[Any, Any]) -> Any:
        return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2

    def zarea(a: tuple[Any, Any], b: tuple[Any, Any], c: tuple[Any, Any]) -> Any:
        return (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])

    square = ((0, 0), (1, 0), (1, 1), (0, 1))
    good_convex = z3.SolverFor("QF_NRA")
    bad_convex = z3.SolverFor("QF_NRA")
    for order, solver in (((0, 1, 2, 3), good_convex), ((0, 1, 3, 2), bad_convex)):
        for index, left in enumerate(order):
            right = order[(index + 1) % 4]
            for witness in order:
                if witness not in {left, right}:
                    solver.add(zarea(square[left], square[right], square[witness]) > 0)

    center = (0, 0)
    unit_support = ((1, 0), (0, 1), (-1, 0), (0, -1))
    bad_support = ((1, 0), (0, 1), (-1, 0), (0, -2))
    good_row = z3.SolverFor("QF_NRA")
    bad_row = z3.SolverFor("QF_NRA")
    for support, solver in ((unit_support, good_row), (bad_support, bad_row)):
        pivot = zd2(center, support[0])
        solver.add(*(pivot == zd2(center, member) for member in support[1:]))

    answers = {
        "ccw_square": str(good_convex.check()),
        "wrong_square_order": str(bad_convex.check()),
        "unit_circle_row": str(good_row.check()),
        "non_equidistant_row": str(bad_row.check()),
    }
    expected = {
        "ccw_square": "sat",
        "wrong_square_order": "unsat",
        "unit_circle_row": "sat",
        "non_equidistant_row": "unsat",
    }
    return {"passed": answers == expected, **answers}


def z3_value(value: z3.ExprRef) -> dict[str, str]:
    return {"exact": value.sexpr(), "decimal": value.as_decimal(24)}


def run_z3(
    system: geometry.GeometrySystem,
    timeout_seconds: float,
    *,
    enabled_atoms: set[str],
    tracked: bool,
) -> dict[str, Any]:
    solver = geometry.build_z3_solver(
        system,
        enabled_atoms,
        timeout_ms=max(1, int(timeout_seconds * 1000)),
        tracked=tracked,
    )
    answer = solver.check()
    status = "SAT" if answer == z3.sat else "UNSAT" if answer == z3.unsat else "UNKNOWN"
    result: dict[str, Any] = {
        "status": status,
        "timeout_seconds": timeout_seconds,
        "engine": f"z3py {z3.get_version_string()} SolverFor(QF_NRA)",
        "evidence_scope": "trusted QF_NRA computation; not a Lean proof",
    }
    if answer == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    elif answer == z3.unsat:
        if tracked:
            result["unsat_core"] = sorted(str(item) for item in solver.unsat_core())
    elif answer == z3.sat:
        model = solver.model()
        zvars = {
            str(variable): z3.Real(str(variable)) for variable in system.variables
        }
        failures = []
        for atom in system.atoms:
            assertion = geometry._atom_to_z3(atom, system.variables, zvars)
            if not z3.is_true(model.eval(assertion, model_completion=True)):
                failures.append(atom.name)
        coordinates = {}
        for label in range(N):
            if label == 0:
                x_value, y_value = z3.RealVal(0), z3.RealVal(0)
            elif label == 1:
                x_value, y_value = z3.RealVal(1), z3.RealVal(0)
            else:
                x_value = model.eval(zvars[f"x_{label}"], model_completion=True)
                y_value = model.eval(zvars[f"y_{label}"], model_completion=True)
            coordinates[str(label)] = {
                "x": z3_value(x_value),
                "y": z3_value(y_value),
            }
        result["model_replay"] = {
            "passed": not failures,
            "checked_atom_count": len(system.atoms),
            "failed_atoms": failures,
        }
        result["coordinates"] = coordinates
    else:
        raise AssertionError(f"unexpected Z3 answer: {answer}")
    return result


def cvc5_version(executable: str) -> str:
    completed = subprocess.run(
        [executable, "--version"], text=True, capture_output=True, timeout=2.0, check=False
    )
    return next((line.strip() for line in completed.stdout.splitlines() if line.strip()), "")


def classify(z3_result: dict[str, Any], cvc5_result: dict[str, Any]) -> str:
    left, right = z3_result["status"], cvc5_result["status"]
    replayed = bool(z3_result.get("model_replay", {}).get("passed"))
    if left == right == "SAT" and replayed:
        return "CROSSCHECKED_SAT_EXACT_MODEL_REPLAYED"
    if left == right == "UNSAT":
        return "CROSSCHECKED_UNSAT_FIXED_CONFIGURATION"
    if left == "SAT" and replayed and right == "UNKNOWN":
        return "Z3_SAT_EXACT_MODEL_REPLAYED_CVC5_UNKNOWN"
    if left != "UNKNOWN" and right != "UNKNOWN" and left != right:
        return "SOLVER_DISAGREEMENT_NO_VERDICT"
    return "NO_DECISIVE_CROSSCHECKED_VERDICT"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=float, default=30.0)
    parser.add_argument("--drop-redundant-distinctness", action="store_true")
    parser.add_argument("--untracked-z3", action="store_true")
    args = parser.parse_args()
    require(0 < args.timeout_seconds <= 1800.0, "timeout must be in (0, 1800]")
    # The shared production geometry helpers intentionally cap routine probes
    # at 30 seconds.  This isolated scratch driver also supports explicitly
    # requested long races without changing that production policy.
    geometry.MAX_Z3_TIMEOUT_MS = max(
        geometry.MAX_Z3_TIMEOUT_MS,
        int(args.timeout_seconds * 1000),
    )
    geometry.MAX_CVC5_TIMEOUT_SECONDS = max(
        geometry.MAX_CVC5_TIMEOUT_SECONDS,
        args.timeout_seconds,
    )

    metric_oracle = load_metric_oracle()
    source_system = build_system()
    digest = equality_digest(metric_oracle)
    audit = encoding_audit(source_system, digest)
    system = normalize_gauge(source_system)
    enabled_atoms = {
        atom.name for atom in system.atoms
        if not (
            args.drop_redundant_distinctness and atom.family == "distinctness"
        )
    }
    z3_smoke = geometry.z3_smoke_gate()
    cvc5_path = str(shutil.which("cvc5") or "/Users/adam/bin/cvc5")
    cvc5_smoke = geometry.cvc5_smoke_gate(
        cvc5=cvc5_path, timeout_seconds=1.0
    )
    local_smoke = local_encoding_smoke()
    require(z3_smoke["passed"], "Z3 smoke gate failed")
    require(cvc5_smoke["passed"], "cvc5 smoke gate failed")
    require(local_smoke["passed"], "local encoding smoke gate failed")

    smt2 = geometry.build_cvc5_smt2(system, enabled_atoms)
    import hashlib

    smt2_sha256 = hashlib.sha256(smt2.encode("utf-8")).hexdigest()
    z3_result = run_z3(
        system,
        args.timeout_seconds,
        enabled_atoms=enabled_atoms,
        tracked=not args.untracked_z3,
    )
    cvc5_result = geometry.run_cvc5_bounded(
        system,
        enabled_atoms,
        cvc5=cvc5_path,
        timeout_seconds=args.timeout_seconds,
    )
    if (
        cvc5_result.get("status") == "ERROR"
        and "timeout" in str(cvc5_result.get("stderr", "")).lower()
    ):
        cvc5_result["status"] = "UNKNOWN"
        cvc5_result["reason"] = "internal-timeout"
    cvc5_result["engine"] = cvc5_version(cvc5_path)
    result = {
        "schema": "p97-654-full-counterexample-realizability-v1",
        "candidate": audit,
        "smoke_gates": {
            "z3": z3_smoke,
            "cvc5": cvc5_smoke,
            "encoding": local_smoke,
        },
        "query": {
            "logic": "QF_NRA",
            "smt2_sha256": smt2_sha256,
            "same_named_atoms_for_both_engines": True,
            "normalized_variable_count": len(system.variables),
            "enabled_atom_count": len(enabled_atoms),
            "z3_assertions_tracked": not args.untracked_z3,
            "distinctness_encoding": (
                "derived: any equal pair makes one strict boundary-edge area zero"
                if args.drop_redundant_distinctness
                else "explicit pairwise squared-distance positivity"
            ),
            "omitted_ledger": list(system.omitted_ledger),
        },
        "z3": z3_result,
        "cvc5": cvc5_result,
        "classification": classify(z3_result, cvc5_result),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
