#!/usr/bin/env python3
"""Source-faithful exact-17 named-row metric feasibility probe.

This is a scratch diagnostic.  It imports the corrected v2 finite ingress,
obtains one deterministic incidence proposal, and replays that exact proposal
against shared Euclidean coordinates.  It never treats a frozen proposal as
coverage of an ingress tag or as a universal result.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import shutil
import subprocess
import sys
import time
from dataclasses import asdict
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
V2_PATH = REPO / "scratch/p97-consumer-first/freshthird_five_survivor_alias_aware_v2/run_query.py"
N = 17
POINTS = tuple(range(N))


def load_v2() -> Any:
    spec = importlib.util.spec_from_file_location("five_survivor_v2", V2_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {V2_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


V2 = load_v2()


def conjunction(parts: list[str]) -> str:
    if not parts:
        return "true"
    if len(parts) == 1:
        return parts[0]
    return f"(and {' '.join(parts)})"


def rows_equal(left: str, right: str) -> list[str]:
    return [f"(= {V2.sym(left, i)} {V2.sym(right, i)})" for i in POINTS]


def row_center_omissions() -> list[str]:
    """Every selected witness support omits its own center."""
    return [f"(not {V2.at(row, center)})" for row, center in V2.selected_row_pairs()]


def exact_blocker_alias_constraints() -> list[str]:
    """Canonical unique-four shells agree when blocker images alias.

    This is the finite form of
    `uniqueFourClass_centerAt_eq_selectedAt_support`; it is not arbitrary
    center/support injectivity.
    """
    exact = (
        ("PRow", "CP"),
        ("PRhoRow", "C1"),
        ("S0Row", "CS0"),
        ("S1Row", "CS1"),
        ("DBRow", "DB"),
    )
    out: list[str] = []
    for i, (left_row, left_center) in enumerate(exact):
        for right_row, right_center in exact[i + 1 :]:
            out.append(
                f"(=> (= {left_center} {right_center}) "
                f"{conjunction(rows_equal(left_row, right_row))})"
            )
    return out


def emit_incidence(tag: Any, malformed: bool = False) -> tuple[str, list[str]]:
    assertions = list(V2.base_assertions(tag))
    assertions.extend(row_center_omissions())
    assertions.extend(exact_blocker_alias_constraints())
    if malformed:
        assertions.append(V2.at("B3", "C3"))
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    lines.extend(f"(declare-fun {role} () Int)" for role in V2.ROLES)
    for row in V2.ROWS:
        lines.extend(f"(declare-fun {V2.sym(row, i)} () Bool)" for i in POINTS)
    lines.extend(f"(assert {a})" for a in assertions)
    lines.append("(check-sat)")
    values = list(V2.ROLES) + [
        V2.sym(row, i) for row in V2.ROWS for i in POINTS
    ]
    lines.append(f"(get-value ({' '.join(values)}))")
    return "\n".join(lines) + "\n", assertions


def run_binary(binary: str, smt: str, timeout_s: int, nonlinear: bool) -> tuple[str, str, float]:
    name = Path(binary).name
    if name == "cvc5":
        args = [
            binary,
            "--lang=smt2",
            "--produce-models",
            f"--tlimit={timeout_s * 1000}",
        ]
        if nonlinear:
            args.append("--nl-cov")
    else:
        args = [binary, "-in", f"-T:{timeout_s}"]
    started = time.monotonic()
    try:
        proc = subprocess.run(
            args,
            input=smt,
            text=True,
            capture_output=True,
            timeout=timeout_s + 10,
            check=False,
        )
        output = proc.stdout + proc.stderr
    except subprocess.TimeoutExpired as exc:
        output = (exc.stdout or "") + (exc.stderr or "") + "\nprocess-timeout\n"
    elapsed = time.monotonic() - started
    status = next(
        (line.strip() for line in output.splitlines() if line.strip() in {"sat", "unsat", "unknown"}),
        "timeout" if "timeout" in output.lower() else "error",
    )
    return status, output, elapsed


def incidence_candidate(tag: Any, z3_bin: str, cvc5_bin: str) -> tuple[dict[str, Any], dict[str, Any]]:
    smt, assertions = emit_incidence(tag)
    path = ROOT / "candidate_000_incidence.smt2"
    path.write_text(smt)
    results: dict[str, Any] = {
        "assertions": len(assertions),
        "sha256": hashlib.sha256(smt.encode()).hexdigest(),
        "tag": asdict(tag),
        "solvers": {},
    }
    models: dict[str, dict[str, int | bool]] = {}
    for binary in (z3_bin, cvc5_bin):
        solver = Path(binary).name
        status, output, elapsed = run_binary(binary, smt, 45, nonlinear=False)
        (ROOT / f"candidate_000_incidence.{solver}.log").write_text(output)
        entry: dict[str, Any] = {"status": status, "elapsed_s": round(elapsed, 3)}
        if status == "sat":
            model = V2.parse_assignment(output)
            failures = list(V2.validate_assignment(tag, "base", model))
            for row, center in V2.selected_row_pairs():
                if model[center] in {
                    i for i in POINTS if model.get(V2.sym(row, i)) is True
                }:
                    failures.append(f"{row} contains center {center}")
            models[solver] = model
            entry["validator"] = "pass" if not failures else "fail"
            entry["validator_failures"] = failures
        results["solvers"][solver] = entry
    if any(results["solvers"][s]["status"] != "sat" for s in ("z3", "cvc5")):
        raise RuntimeError(f"incidence proposal not dual-SAT: {results['solvers']}")
    if any(results["solvers"][s].get("validator") != "pass" for s in ("z3", "cvc5")):
        raise RuntimeError(f"incidence validator failure: {results['solvers']}")
    return models["z3"], results


def candidate_rows(model: dict[str, Any]) -> dict[str, set[int]]:
    return {
        row: {i for i in POINTS if model[V2.sym(row, i)] is True}
        for row in V2.ROWS
    }


def d2(i: int, j: int) -> str:
    dx = f"(- x{i} x{j})"
    dy = f"(- y{i} y{j})"
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def d2_center(i: int) -> str:
    dx = f"(- x{i} mec_x)"
    dy = f"(- y{i} mec_y)"
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def area(i: int, j: int, k: int) -> str:
    return (
        f"(- (* (- x{j} x{i}) (- y{k} y{i})) "
        f"(* (- x{k} x{i}) (- y{j} y{i})))"
    )


def dot_at(a: int, b: int, c: int) -> str:
    return (
        f"(+ (* (- x{b} x{a}) (- x{c} x{a})) "
        f"(* (- y{b} y{a}) (- y{c} y{a})))"
    )


def metric_groups(model: dict[str, Any]) -> tuple[dict[str, list[str]], list[str], dict[str, Any]]:
    role = {name: int(model[name]) for name in V2.ROLES}
    rows = candidate_rows(model)
    groups: dict[str, list[str]] = {}

    groups["gauge"] = ["(= x0 0)", "(= y0 0)", "(= y1 0)", "(> x1 0)"]
    groups["carrier_distinct"] = [
        f"(or (not (= x{i} x{j})) (not (= y{i} y{j})))"
        for i in POINTS
        for j in range(i + 1, N)
    ]

    convex: list[str] = []
    for i in POINTS:
        convex.append(f"(> (+ (* sep_a{i} x{i}) (* sep_b{i} y{i})) sep_c{i})")
        for j in POINTS:
            if i != j:
                convex.append(f"(<= (+ (* sep_a{i} x{j}) (* sep_b{i} y{j})) sep_c{i})")
    groups["convex_independent"] = convex

    c2, c3, c4 = role["C2"], role["C3"], role["C4"]
    groups["mec_boundary"] = ["(> mec_r2 0)"] + [
        f"(<= {d2_center(i)} mec_r2)" for i in POINTS
    ] + [f"(= {d2_center(i)} mec_r2)" for i in (c2, c3, c4)]
    groups["triangle_nonobtuse"] = [
        f"(>= {dot_at(c2, c3, c4)} 0)",
        f"(>= {dot_at(c3, c4, c2)} 0)",
        f"(>= {dot_at(c4, c2, c3)} 0)",
    ]
    apex_area = area(c2, c3, c4)
    cap_assertions: list[str] = []
    cap = rows["Cap"]
    for i in POINTS:
        product = f"(* {area(i, c3, c4)} {apex_area})"
        cap_assertions.append(f"({'<=' if i in cap else '>'} {product} 0)")
    groups["first_cap_on_arc_opposite"] = cap_assertions

    selected = (
        ("PRow", "CP"),
        ("PRhoRow", "C1"),
        ("S0Row", "CS0"),
        ("S1Row", "CS1"),
        ("R", "C2"),
        ("Rh", "C2"),
        ("B3", "C3"),
        ("B4", "C4"),
        ("DBRow", "DB"),
    )
    radii: list[str] = []
    for row, center_name in selected:
        center = role[center_name]
        radii.append(f"rad_{row}")
        groups[f"row_{row}"] = [f"(> rad_{row} 0)"] + [
            f"(= {d2(center, i)} rad_{row})" for i in sorted(rows[row])
        ]
    groups["retained_radii_distinct"] = ["(not (= rad_R rad_Rh))"]

    exact = ("PRow", "PRhoRow", "S0Row", "S1Row", "DBRow")
    exact_centers = {row: role[center] for row, center in selected if row in exact}
    for row in exact:
        center = exact_centers[row]
        groups[f"exact_offsupport_{row}"] = [
            f"(not (= {d2(center, i)} rad_{row}))"
            for i in POINTS
            if i not in rows[row]
        ]

    real_vars = [f"x{i}" for i in POINTS] + [f"y{i}" for i in POINTS]
    real_vars += [f"sep_a{i}" for i in POINTS]
    real_vars += [f"sep_b{i}" for i in POINTS]
    real_vars += [f"sep_c{i}" for i in POINTS]
    real_vars += ["mec_x", "mec_y", "mec_r2"] + radii
    metadata = {
        "roles": role,
        "rows": {row: sorted(values) for row, values in rows.items()},
        "exact_offsupport_rows": list(exact),
    }
    return groups, real_vars, metadata


def emit_metric(groups: dict[str, list[str]], real_vars: list[str], active: list[str] | None = None) -> str:
    chosen = active if active is not None else list(groups)
    lines = ["(set-logic QF_NRA)"]
    lines.extend(f"(declare-fun {name} () Real)" for name in real_vars)
    for label in chosen:
        lines.append(f"(assert (! {conjunction(groups[label])} :named {label}))")
    lines.append("(check-sat)")
    return "\n".join(lines) + "\n"


def z3_solve_exact(smt: str, real_vars: list[str], timeout_s: int) -> tuple[str, dict[str, Fraction], list[str], float]:
    solver = z3.Solver()
    solver.set(timeout=timeout_s * 1000, unsat_core=True)
    solver.from_string(smt)
    started = time.monotonic()
    result = solver.check()
    elapsed = time.monotonic() - started
    if result == z3.unsat:
        return "unsat", {}, [str(x) for x in solver.unsat_core()], elapsed
    if result == z3.unknown:
        return "unknown", {}, [], elapsed
    model = solver.model()
    exact: dict[str, Fraction] = {}
    for name in real_vars:
        value = model.eval(z3.Real(name), model_completion=True)
        if not z3.is_rational_value(value):
            return "sat_nonrational", {}, [], elapsed
        exact[name] = Fraction(value.numerator_as_long(), value.denominator_as_long())
    return "sat", exact, [], elapsed


def validate_metric(values: dict[str, Fraction], metadata: dict[str, Any]) -> list[str]:
    failures: list[str] = []
    role = metadata["roles"]
    rows = {name: set(indices) for name, indices in metadata["rows"].items()}

    def x(i: int) -> Fraction:
        return values[f"x{i}"]

    def y(i: int) -> Fraction:
        return values[f"y{i}"]

    def dist2(i: int, j: int) -> Fraction:
        return (x(i) - x(j)) ** 2 + (y(i) - y(j)) ** 2

    def signed(i: int, j: int, k: int) -> Fraction:
        return (x(j) - x(i)) * (y(k) - y(i)) - (x(k) - x(i)) * (y(j) - y(i))

    def need(condition: bool, message: str) -> None:
        if not condition:
            failures.append(message)

    need(x(0) == 0 and y(0) == 0 and y(1) == 0 and x(1) > 0, "gauge")
    for i in POINTS:
        for j in range(i + 1, N):
            need((x(i), y(i)) != (x(j), y(j)), f"duplicate carrier points {i},{j}")
    for i in POINTS:
        a, b, c = values[f"sep_a{i}"], values[f"sep_b{i}"], values[f"sep_c{i}"]
        need(a * x(i) + b * y(i) > c, f"separator misses point {i}")
        for j in POINTS:
            if i != j:
                need(a * x(j) + b * y(j) <= c, f"separator {i} fails at {j}")

    mx, my, mr = values["mec_x"], values["mec_y"], values["mec_r2"]
    need(mr > 0, "nonpositive MEC radius squared")
    center_d2 = lambda i: (x(i) - mx) ** 2 + (y(i) - my) ** 2
    for i in POINTS:
        need(center_d2(i) <= mr, f"point {i} outside MEC")
    c2, c3, c4 = role["C2"], role["C3"], role["C4"]
    for i in (c2, c3, c4):
        need(center_d2(i) == mr, f"apex {i} off MEC boundary")
    dot = lambda a, b, c: (x(b) - x(a)) * (x(c) - x(a)) + (y(b) - y(a)) * (y(c) - y(a))
    need(dot(c2, c3, c4) >= 0, "obtuse at C2")
    need(dot(c3, c4, c2) >= 0, "obtuse at C3")
    need(dot(c4, c2, c3) >= 0, "obtuse at C4")

    apex_area = signed(c2, c3, c4)
    for i in POINTS:
        on_opposite = signed(i, c3, c4) * apex_area <= 0
        need(on_opposite == (i in rows["Cap"]), f"cap mismatch at {i}")

    selected = (
        ("PRow", "CP"), ("PRhoRow", "C1"), ("S0Row", "CS0"),
        ("S1Row", "CS1"), ("R", "C2"), ("Rh", "C2"),
        ("B3", "C3"), ("B4", "C4"), ("DBRow", "DB"),
    )
    for row, center_name in selected:
        radius = values[f"rad_{row}"]
        need(radius > 0, f"nonpositive radius {row}")
        for i in rows[row]:
            need(dist2(role[center_name], i) == radius, f"row equation {row}/{i}")
    need(values["rad_R"] != values["rad_Rh"], "retained radii equal")
    for row in metadata["exact_offsupport_rows"]:
        center_name = dict(selected)[row]
        for i in POINTS:
            if i not in rows[row]:
                need(dist2(role[center_name], i) != values[f"rad_{row}"], f"off-support {row}/{i}")
    return failures


def smoke_controls(z3_bin: str, cvc5_bin: str) -> dict[str, Any]:
    tag = V2.Tag("first", "qsource", "radius")
    malformed_smt, _ = emit_incidence(tag, malformed=True)
    (ROOT / "control_incidence_center_in_row_unsat.smt2").write_text(malformed_smt)
    controls: dict[str, Any] = {}
    for binary in (z3_bin, cvc5_bin):
        name = Path(binary).name
        status, output, elapsed = run_binary(binary, malformed_smt, 30, nonlinear=False)
        (ROOT / f"control_incidence_center_in_row_unsat.{name}.log").write_text(output)
        controls.setdefault("incidence_center_in_row_unsat", {})[name] = {
            "status": status, "elapsed_s": round(elapsed, 3)
        }

    known = """(set-logic QF_NRA)
(declare-fun x0 () Real)
(declare-fun y0 () Real)
(declare-fun x1 () Real)
(declare-fun y1 () Real)
(declare-fun r2 () Real)
(assert (= x0 0))
(assert (= y0 0))
(assert (= x1 1))
(assert (= y1 0))
(assert (= r2 1))
(assert (= (+ (* (- x1 x0) (- x1 x0)) (* (- y1 y0) (- y1 y0))) r2))
(check-sat)
"""
    malformed = known.replace("(check-sat)", "(assert (= x1 x0))\n(check-sat)")
    for case, smt, expected in (("metric_known_sat", known, "sat"), ("metric_duplicate_unsat", malformed, "unsat")):
        (ROOT / f"control_{case}.smt2").write_text(smt)
        for binary in (z3_bin, cvc5_bin):
            name = Path(binary).name
            status, output, elapsed = run_binary(binary, smt, 30, nonlinear=True)
            (ROOT / f"control_{case}.{name}.log").write_text(output)
            controls.setdefault(case, {})[name] = {
                "status": status, "expected": expected, "elapsed_s": round(elapsed, 3)
            }
    return controls


def minimize_groups(groups: dict[str, list[str]], real_vars: list[str], initial: list[str]) -> list[str]:
    active = list(initial)
    for label in list(active):
        trial = [x for x in active if x != label]
        smt = emit_metric(groups, real_vars, trial)
        status, _, _, _ = z3_solve_exact(smt, real_vars, 12)
        if status == "unsat":
            active = trial
    return active


def minimize_atoms(
    groups: dict[str, list[str]], real_vars: list[str], initial: list[str]
) -> tuple[dict[str, list[str]], list[str]]:
    atoms = {
        f"{label}__point_{i}" if label == "first_cap_on_arc_opposite"
        else f"{label}__atom_{i}": [assertion]
        for label in initial
        for i, assertion in enumerate(groups[label])
    }
    active = list(atoms)
    for label in list(active):
        trial = [x for x in active if x != label]
        smt = emit_metric(atoms, real_vars, trial)
        status, _, _, _ = z3_solve_exact(smt, real_vars, 12)
        if status == "unsat":
            active = trial
    return atoms, active


def main() -> int:
    z3_bin = shutil.which("z3")
    cvc5_bin = shutil.which("cvc5")
    if not z3_bin or not cvc5_bin:
        raise RuntimeError("z3 and cvc5 are required")
    controls = smoke_controls(z3_bin, cvc5_bin)
    controls_ok = all(
        entry[solver]["status"] == entry[solver].get("expected", "unsat")
        for entry in controls.values()
        for solver in ("z3", "cvc5")
    )
    if not controls_ok:
        raise RuntimeError(f"smoke control failure: {controls}")

    # Deterministic first tag.  Per the lane guardrail, stop after the first
    # exact SAT motif or first dual-solver UNSAT; do not sweep a larger matrix.
    tag = V2.Tag("first", "qsource", "radius")
    incidence, incidence_result = incidence_candidate(tag, z3_bin, cvc5_bin)
    (ROOT / "candidate_000_incidence_model.json").write_text(
        json.dumps(incidence, indent=2, sort_keys=True) + "\n"
    )

    groups, real_vars, metadata = metric_groups(incidence)
    metric_smt = emit_metric(groups, real_vars)
    metric_path = ROOT / "candidate_000_named_metric.smt2"
    metric_path.write_text(metric_smt)
    z3_status, exact_values, z3_core, z3_elapsed = z3_solve_exact(metric_smt, real_vars, 180)
    z3_log: dict[str, Any] = {
        "status": z3_status,
        "elapsed_s": round(z3_elapsed, 3),
        "unsat_core": z3_core,
    }
    validator_failures: list[str] = []
    if z3_status == "sat":
        validator_failures = validate_metric(exact_values, metadata)
        z3_log["exact_fraction_validator"] = "pass" if not validator_failures else "fail"
        z3_log["validator_failures"] = validator_failures
        (ROOT / "candidate_000_named_metric.exact-model.json").write_text(
            json.dumps({k: str(v) for k, v in exact_values.items()}, indent=2, sort_keys=True) + "\n"
        )
    (ROOT / "candidate_000_named_metric.z3.json").write_text(
        json.dumps(z3_log, indent=2, sort_keys=True) + "\n"
    )

    cvc5_status, cvc5_output, cvc5_elapsed = run_binary(cvc5_bin, metric_smt, 180, nonlinear=True)
    (ROOT / "candidate_000_named_metric.cvc5.log").write_text(cvc5_output)

    minimized: list[str] | None = None
    minimized_atoms: list[str] | None = None
    minimized_atom_assertions: dict[str, str] | None = None
    minimized_cvc5: str | None = None
    if z3_status == "unsat" and cvc5_status == "unsat":
        minimized = minimize_groups(groups, real_vars, z3_core or list(groups))
        atom_groups, minimized_atoms = minimize_atoms(groups, real_vars, minimized)
        minimized_atom_assertions = {
            label: atom_groups[label][0] for label in minimized_atoms
        }
        minimized_smt = emit_metric(atom_groups, real_vars, minimized_atoms)
        (ROOT / "candidate_000_named_metric.minimized.smt2").write_text(minimized_smt)
        minimized_cvc5, output, _ = run_binary(cvc5_bin, minimized_smt, 180, nonlinear=True)
        (ROOT / "candidate_000_named_metric.minimized.cvc5.log").write_text(output)

    if z3_status == "sat" and cvc5_status == "sat" and not validator_failures:
        classification = "EXACT_RATIONAL_SAT_FROZEN_MOTIF_ONLY"
    elif z3_status == "unsat" and cvc5_status == "unsat":
        classification = "DUAL_UNSAT_FROZEN_MOTIF_ONLY"
    else:
        classification = "INCONCLUSIVE"

    core_witness: dict[str, Any] | None = None
    if minimized_atoms and len(minimized_atoms) == 1:
        prefix = "first_cap_on_arc_opposite__point_"
        if minimized_atoms[0].startswith(prefix):
            point = int(minimized_atoms[0][len(prefix):])
            roles_here = sorted(
                name for name, value in metadata["roles"].items() if value == point
            )
            core_witness = {
                "carrier_slot": point,
                "roles_at_slot": roles_here,
                "incidence_marks_first_cap": point in set(metadata["rows"]["Cap"]),
                "source_reason": (
                    "the frozen proposal aliases an outside-Q role with a closed-cap "
                    "endpoint apex, making the strict nonmembership atom identically false"
                ),
            }

    record = {
        "classification": classification,
        "scope": "one frozen exact-17 incidence proposal; no tag coverage or universal lift",
        "tag": asdict(tag),
        "incidence": incidence_result,
        "metric": {
            "assertion_groups": list(groups),
            "sha256": hashlib.sha256(metric_smt.encode()).hexdigest(),
            "z3": z3_log,
            "cvc5": {"status": cvc5_status, "elapsed_s": round(cvc5_elapsed, 3)},
            "minimized_groups": minimized,
            "minimized_atoms": minimized_atoms,
            "minimized_atom_assertions": minimized_atom_assertions,
            "core_witness": core_witness,
            "minimized_cvc5_status": minimized_cvc5,
        },
        "controls": controls,
        "omissions": [
            "crossed-three-row arms",
            "anonymous global K4 rows",
            "FiveRowCircleIntersectionOrderCore role/closure/orientation producer",
            "general-cardinality ingress and lift",
        ],
    }
    (ROOT / "results.json").write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
    manifest = {
        "runner": str(Path(__file__).relative_to(REPO)),
        "v2_ingress": str(V2_PATH.relative_to(REPO)),
        "commands": [
            f"uv run python {Path(__file__).relative_to(REPO)}",
            f"uv run python -m unittest discover -s {ROOT.relative_to(REPO)} -p 'test_*.py'",
        ],
        "solvers": {
            "z3_python": z3.get_version_string(),
            "z3_binary": subprocess.run([z3_bin, "--version"], capture_output=True, text=True).stdout.strip(),
            "cvc5": subprocess.run([cvc5_bin, "--version"], capture_output=True, text=True).stdout.splitlines()[0],
        },
        "metric_sha256": record["metric"]["sha256"],
        "deterministic_tag": asdict(tag),
    }
    (ROOT / "manifest.json").write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    summary = f"""# Results

Classification: **{classification}**.

- Exact scope: one frozen exact-17 incidence proposal for tag `{tag.name}`.
- Incidence: z3 `{incidence_result['solvers']['z3']['status']}`, cvc5 `{incidence_result['solvers']['cvc5']['status']}`; both independent incidence validators passed.
- Named metric: z3 `{z3_status}`, cvc5 `{cvc5_status}`.
- Exact Fraction replay: `{z3_log.get('exact_fraction_validator', 'not applicable')}`.
- Minimized source atom(s): `{minimized_atoms}`.
- Frozen-role witness: `{core_witness}`.
- Complete `FiveRowCircleIntersectionOrderCore` map: **absent**, so no order-core query was emitted.

This result classifies only the emitted frozen motif.  It is not coverage of
the other seven tags, not a P97 counterexample, not a universal contradiction,
and not Lean closure.  See `results.json` for timings, hashes, omissions, and
any minimized source-labeled core.
"""
    (ROOT / "RESULTS.md").write_text(summary)
    print(json.dumps({
        "classification": classification,
        "results": str((ROOT / 'results.json').relative_to(REPO)),
        "metric_z3": z3_status,
        "metric_cvc5": cvc5_status,
        "exact_validator": z3_log.get("exact_fraction_validator"),
    }, sort_keys=True))
    return 0 if classification != "INCONCLUSIVE" else 2


if __name__ == "__main__":
    raise SystemExit(main())
