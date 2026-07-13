#!/usr/bin/env python3
"""Manifest-bound full-inequality QF_NRA pilot for ATAIL-FORCE.

This is deliberately a seven-case theorem-discovery probe, not a sweep of the
30,997 symmetry-reduced systems.  Solver UNSAT is only a proposal because Z3
does not emit a certificate consumed here.  Solver SAT is promoted to an exact
window realization only when every model coordinate is rational and a separate
SymPy replay verifies every emitted equality and inequality exactly.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
import tempfile
import time
from fractions import Fraction
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp
import z3

from census.atail_force import three_center_surface as surface


MANIFEST_SCHEMA = "p97_atail_force_inequality_pilot_manifest.v1"
RESULT_SCHEMA = "p97_atail_force_inequality_pilot_results.v1"
WORKER_SCHEMA = "p97_atail_force_inequality_pilot_worker.v1"
SEPARATOR_MANIFEST_SCHEMA = "p97_atail_force_separator_pilot_manifest.v1"

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_MANIFEST = HERE / "inequality_pilot_manifest.json"
DEFAULT_RESULTS = HERE / "inequality_pilot_results.json"
SOURCE_CASE_MANIFEST = HERE / "separator_pilot_manifest.json"

TIMEOUT_SECONDS = 30
HARD_TIMEOUT_GRACE_SECONDS = 5
TOTAL_WALL_SECONDS = 240
ENGINE_PROCESSES = 1
INTERIOR_STRATA = tuple(range(6, 13))

PINNED_INPUTS = (
    Path(__file__).resolve(),
    Path(surface.__file__).resolve(),
    HERE / "surface_checkpoint.json",
    SOURCE_CASE_MANIFEST,
    surface.DEFAULT_INVENTORY,
)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise surface.SurfaceError(message)


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
    except OSError as exc:
        raise surface.SurfaceError(f"cannot hash {path}: {exc}") from exc
    return digest.hexdigest()


def _json_digest(value: Any) -> str:
    encoded = json.dumps(value, separators=(",", ":"), sort_keys=True)
    return hashlib.sha256(encoded.encode("utf-8")).hexdigest()


def _canonical(value: Mapping[str, Any]) -> str:
    return json.dumps(value, sort_keys=True, indent=2) + "\n"


def _write_atomic(path: Path, content: str, *, exclusive: bool = False) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if exclusive and path.exists():
        raise surface.SurfaceError(f"refusing to overwrite {path}")
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        if exclusive and path.exists():
            raise surface.SurfaceError(f"refusing to overwrite {path}")
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def _z3_library() -> Path:
    library_dir = Path(z3.__file__).resolve().parent / "lib"
    names = (
        ("libz3.dylib",)
        if sys.platform == "darwin"
        else (("libz3.dll",) if sys.platform == "win32" else ("libz3.so",))
    )
    candidates = [library_dir / name for name in names if (library_dir / name).is_file()]
    _require(len(candidates) == 1, f"expected one platform Z3 library, found {candidates}")
    return candidates[0]


def _read_json(path: Path, context: str) -> dict[str, Any]:
    try:
        with path.open(encoding="utf-8") as handle:
            value = json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise surface.SurfaceError(f"cannot load {context} {path}: {exc}") from exc
    _require(isinstance(value, dict), f"{context} is not a JSON object")
    return value


def _read_source_cases() -> list[dict[str, Any]]:
    source = _read_json(SOURCE_CASE_MANIFEST, "separator-pilot manifest")
    _require(
        source.get("schema") == SEPARATOR_MANIFEST_SCHEMA,
        "separator-pilot manifest schema drift",
    )
    stored_digest = source.get("manifest_sha256")
    body = {key: value for key, value in source.items() if key != "manifest_sha256"}
    _require(stored_digest == _json_digest(body), "separator manifest self-digest drift")
    cases = source.get("cases")
    _require(isinstance(cases, list), "separator manifest cases are malformed")
    _require(len(cases) == 7, "separator manifest case-count drift")
    _require(
        [case.get("interior_points") for case in cases] == list(INTERIOR_STRATA),
        "separator manifest no longer has one case per support stratum",
    )
    return cases


def _order_from_payload(payload: Any) -> surface.OrderDecoration:
    _require(isinstance(payload, dict), "pilot order is malformed")
    return surface.OrderDecoration(
        tuple(payload.get("S", [])),
        tuple(payload.get("O1", [])),
        tuple(payload.get("O2", [])),
    )


def _system_payload(cs: Any) -> dict[str, Any]:
    """Stable exact generator payload used for the per-case input digest."""
    return {
        "variables": [str(variable) for variable in cs.vars],
        "equalities": [sp.srepr(sp.expand(expr)) for expr in cs.eqs],
        "weak_inequalities": [sp.srepr(sp.expand(expr)) for expr in cs.ge],
        "strict_inequalities": [sp.srepr(sp.expand(expr)) for expr in cs.gt],
    }


def _case_system(
    case: Mapping[str, Any],
    classes: Sequence[surface.JointClass] | None = None,
) -> tuple[surface.JointClass, surface.OrderDecoration, Any]:
    if classes is None:
        _report, loaded = surface.load_inventory()
        classes = loaded
    class_id = case.get("class_id")
    _require(
        type(class_id) is int and 0 <= class_id < len(classes),
        f"invalid class id {class_id!r}",
    )
    joint = classes[class_id]
    _require(
        joint.class_key_sha256 == case.get("class_key_sha256"),
        f"class {class_id} digest drift",
    )
    order = _order_from_payload(case.get("order"))
    system = surface.build_system(joint, order)
    return joint, order, system


def _case_record(
    source_case: Mapping[str, Any],
    classes: Sequence[surface.JointClass],
) -> dict[str, Any]:
    joint, order, system = _case_system(source_case, classes)
    expected = surface.expected_system_size(joint)
    payload = _system_payload(system)
    return {
        "case_id": f"ineq_{source_case['case_id']}",
        "source_separator_case_id": source_case["case_id"],
        "class_id": joint.class_id,
        "class_key_sha256": joint.class_key_sha256,
        "interior_points": joint.interior_point_count,
        "variables": len(system.vars),
        "equalities": len(system.eqs),
        "weak_inequalities": len(system.ge),
        "strict_inequalities": len(system.gt),
        "expected_dimensions": expected,
        "order": order.as_json(),
        "system_input_sha256": _json_digest(payload),
    }


def build_manifest() -> dict[str, Any]:
    _report, classes = surface.load_inventory()
    cases = [_case_record(case, classes) for case in _read_source_cases()]
    _require(
        [case["interior_points"] for case in cases] == list(INTERIOR_STRATA),
        "inequality pilot stratum selection drift",
    )
    _require(len({case["case_id"] for case in cases}) == 7, "duplicate pilot case")
    library = _z3_library()
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path) for path in PINNED_INPUTS
    }
    body = {
        "schema": MANIFEST_SCHEMA,
        "owner": "ATAIL-FORCE full-inequality bounded pilot",
        "command": (
            ".venv/bin/python -m census.atail_force.inequality_pilot "
            "--run"
        ),
        "policy": {
            "engine": "Z3 SolverFor(QF_NRA) / nlsat",
            "engine_version": z3.get_version_string(),
            "engine_library_sha256": _sha256(library),
            "engine_processes": ENGINE_PROCESSES,
            "parallel_cases": 1,
            "timeout_seconds_per_case": TIMEOUT_SECONDS,
            "hard_timeout_grace_seconds": HARD_TIMEOUT_GRACE_SECONDS,
            "total_wall_stop_seconds": TOTAL_WALL_SECONDS,
            "case_count": len(cases),
            "case_selection": (
                "the same immutable seven representatives used by the prior "
                "separator pilot, one at each interior-support size 6 through 12"
            ),
            "stop_condition": (
                "stop after all seven cases or the 240-second aggregate wall, "
                "whichever occurs first; no automatic extension or bulk sweep"
            ),
        },
        "cases": cases,
        "verdict_contract": {
            "REALIZED_EXACT_RATIONAL_WINDOW": (
                "all coordinates rational and every emitted generator passed "
                "independent exact SymPy replay; exact only within this window"
            ),
            "SAT_UNVERIFIED": (
                "solver SAT with no independent exact rational replay; no claim"
            ),
            "UNSAT_PROPOSAL": (
                "solver UNSAT without an independently replayed certificate; no claim"
            ),
            "TIMEOUT": "no claim",
            "UNKNOWN": "no claim",
            "ERROR": "no claim",
            "TOTAL_WALL_STOP": "no claim",
        },
        "scope": {
            "full_three_center_window_inequalities_included": True,
            "disk_nonobtuse_cap_and_global_order_included": True,
            "case_count": 7,
            "symmetry_reduced_surface_coverage_claim": False,
            "full_inventory_coverage_claim": False,
            "full_configuration_claim": False,
            "full_filter_shared_radius_pair_claim": False,
            "lean_claim": False,
        },
        "input_sha256": dict(sorted(input_digests.items())),
    }
    return {**body, "manifest_sha256": _json_digest(body)}


def _read_manifest(path: Path) -> dict[str, Any]:
    manifest = _read_json(path, "inequality-pilot manifest")
    _require(manifest.get("schema") == MANIFEST_SCHEMA, "manifest schema drift")
    stored_digest = manifest.get("manifest_sha256")
    body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    _require(stored_digest == _json_digest(body), "manifest self-digest drift")
    return manifest


def _load_current_manifest(path: Path) -> dict[str, Any]:
    manifest = _read_manifest(path)
    _require(manifest == build_manifest(), "inequality pilot manifest is stale")
    return manifest


def _case_by_id(manifest: Mapping[str, Any], case_id: str) -> dict[str, Any]:
    case = next((row for row in manifest["cases"] if row["case_id"] == case_id), None)
    _require(case is not None, f"unknown pilot case {case_id!r}")
    return case


def _validated_case_system(case: Mapping[str, Any]) -> Any:
    _joint, _order, system = _case_system(case)
    _require(
        _json_digest(_system_payload(system)) == case.get("system_input_sha256"),
        f"case {case.get('case_id')} generator digest drift",
    )
    expected_counts = {
        "variables": len(system.vars),
        "equalities": len(system.eqs),
        "weak_inequalities": len(system.ge),
        "strict_inequalities": len(system.gt),
    }
    for field, count in expected_counts.items():
        _require(case.get(field) == count, f"case {case.get('case_id')} {field} drift")
    return system


def _poly_to_z3(
    expr: sp.Expr,
    sympy_variables: Sequence[sp.Symbol],
    z3_variables: Sequence[z3.ArithRef],
) -> z3.ArithRef:
    try:
        polynomial = sp.Poly(sp.expand(expr), *sympy_variables, domain=sp.QQ)
    except sp.PolynomialError as exc:
        raise surface.SurfaceError(f"non-polynomial generator {expr}") from exc
    result: z3.ArithRef = z3.RealVal(0)
    for powers, coefficient in polynomial.terms():
        rational = sp.Rational(coefficient)
        term: z3.ArithRef = z3.Q(rational.p, rational.q)
        for variable, power in zip(z3_variables, powers):
            if power:
                term = term * (variable**power)
        result = result + term
    return result


def _build_z3_solver(system: Any) -> tuple[z3.Solver, list[z3.ArithRef]]:
    sympy_variables = list(system.vars)
    z3_variables = [z3.Real(str(variable)) for variable in sympy_variables]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=TIMEOUT_SECONDS * 1000, random_seed=0)
    for expression in system.eqs:
        solver.add(_poly_to_z3(expression, sympy_variables, z3_variables) == 0)
    for expression in system.ge:
        solver.add(_poly_to_z3(expression, sympy_variables, z3_variables) >= 0)
    for expression in system.gt:
        solver.add(_poly_to_z3(expression, sympy_variables, z3_variables) > 0)
    return solver, z3_variables


def _z3_value_text(value: z3.ExprRef) -> str:
    if z3.is_rational_value(value):
        numerator = value.numerator_as_long()
        denominator = value.denominator_as_long()
        return str(numerator) if denominator == 1 else f"{numerator}/{denominator}"
    return value.sexpr()


def _verify_rational_model(
    system: Any,
    assignments: Mapping[str, str],
) -> tuple[bool, dict[str, Any]]:
    required = {str(variable) for variable in system.vars}
    if set(assignments) != required:
        return False, {
            "kind": "variable_mismatch",
            "missing": sorted(required - set(assignments)),
            "extra": sorted(set(assignments) - required),
        }
    try:
        substitutions = {
            sp.Symbol(name, real=True): sp.Rational(Fraction(value))
            for name, value in assignments.items()
        }
    except (ValueError, ZeroDivisionError) as exc:
        return False, {"kind": "non_rational_assignment", "detail": str(exc)}

    families = (
        ("equality", system.eqs, lambda value: value == 0),
        ("weak_inequality", system.ge, lambda value: value >= 0),
        ("strict_inequality", system.gt, lambda value: value > 0),
    )
    checked = {}
    for family, expressions, predicate in families:
        for index, expression in enumerate(expressions):
            value = sp.expand(expression.subs(substitutions))
            if value.is_Rational is not True:
                return False, {
                    "kind": family,
                    "index": index,
                    "detail": f"non-rational replay value {value}",
                }
            if not bool(predicate(value)):
                return False, {
                    "kind": family,
                    "index": index,
                    "value": str(value),
                }
        checked[family] = len(expressions)
    return True, {"checked": checked}


def run_worker(manifest_path: Path, case_id: str) -> dict[str, Any]:
    manifest = _read_manifest(manifest_path)
    case = _case_by_id(manifest, case_id)
    system = _validated_case_system(case)
    solver, variables = _build_z3_solver(system)
    started = time.monotonic()
    answer = solver.check()
    elapsed = round(time.monotonic() - started, 3)
    base = {
        "schema": WORKER_SCHEMA,
        "case_id": case_id,
        "system_input_sha256": case["system_input_sha256"],
        "elapsed_seconds": elapsed,
    }
    if answer == z3.sat:
        model = solver.model()
        values = {
            str(variable): _z3_value_text(model.eval(variable, model_completion=True))
            for variable in variables
        }
        rational = all(
            z3.is_rational_value(model.eval(variable, model_completion=True))
            for variable in variables
        )
        if rational:
            verified, replay = _verify_rational_model(system, values)
            verdict = "REALIZED_EXACT_RATIONAL_WINDOW" if verified else "ERROR"
        else:
            verified = False
            replay = {
                "checked": {},
                "reason": "at least one Z3 model coordinate is non-rational",
            }
            verdict = "SAT_UNVERIFIED"
        return {
            **base,
            "verdict": verdict,
            "all_coordinates_rational": rational,
            "independent_exact_replay": verified,
            "replay": replay,
            "model": values,
            "model_sha256": _json_digest(values),
        }
    if answer == z3.unsat:
        return {
            **base,
            "verdict": "UNSAT_PROPOSAL",
            "independent_certificate_replay": False,
        }
    reason = solver.reason_unknown()
    verdict = "TIMEOUT" if "timeout" in reason.lower() else "UNKNOWN"
    return {**base, "verdict": verdict, "reason_unknown": reason}


def _parse_worker_output(raw: str, case_id: str) -> dict[str, Any]:
    try:
        result = json.loads(raw)
    except json.JSONDecodeError as exc:
        return {
            "case_id": case_id,
            "verdict": "ERROR",
            "detail": f"worker emitted invalid JSON: {exc}",
            "output_prefix": raw[:500],
        }
    if not isinstance(result, dict) or result.get("schema") != WORKER_SCHEMA:
        return {
            "case_id": case_id,
            "verdict": "ERROR",
            "detail": "worker schema drift",
            "output_prefix": raw[:500],
        }
    if result.get("case_id") != case_id:
        return {
            "case_id": case_id,
            "verdict": "ERROR",
            "detail": "worker case-id drift",
        }
    return result


def run_pilot(manifest_path: Path, results_path: Path) -> dict[str, Any]:
    manifest = _load_current_manifest(manifest_path)
    started = time.monotonic()
    results = []
    for case in manifest["cases"]:
        elapsed_total = time.monotonic() - started
        remaining = TOTAL_WALL_SECONDS - elapsed_total
        if remaining <= 0:
            results.append(
                {"case_id": case["case_id"], "verdict": "TOTAL_WALL_STOP"}
            )
            continue
        command = [
            sys.executable,
            "-m",
            "census.atail_force.inequality_pilot",
            "--worker-case",
            case["case_id"],
            "--manifest",
            str(manifest_path),
        ]
        environment = dict(os.environ)
        environment.update(
            {
                "OMP_NUM_THREADS": "1",
                "OPENBLAS_NUM_THREADS": "1",
                "MKL_NUM_THREADS": "1",
            }
        )
        hard_timeout = min(TIMEOUT_SECONDS + HARD_TIMEOUT_GRACE_SECONDS, remaining)
        case_started = time.monotonic()
        try:
            completed = subprocess.run(
                command,
                capture_output=True,
                text=True,
                timeout=hard_timeout,
                check=False,
                cwd=REPO_ROOT,
                env=environment,
            )
            if completed.returncode == 0:
                result = _parse_worker_output(completed.stdout, case["case_id"])
            else:
                result = {
                    "case_id": case["case_id"],
                    "verdict": "ERROR",
                    "returncode": completed.returncode,
                    "stdout_prefix": completed.stdout[:500],
                    "stderr_prefix": completed.stderr[:500],
                }
        except subprocess.TimeoutExpired as exc:
            result = {
                "case_id": case["case_id"],
                "verdict": "TIMEOUT",
                "detail": "parent hard timeout",
                "stdout_prefix": (exc.stdout or "")[:500],
                "stderr_prefix": (exc.stderr or "")[:500],
            }
        result["wall_seconds"] = round(time.monotonic() - case_started, 3)
        result["system_input_sha256"] = case["system_input_sha256"]
        results.append(result)

    library = _z3_library()
    document = {
        "schema": RESULT_SCHEMA,
        "manifest_sha256": manifest["manifest_sha256"],
        "engine_version": z3.get_version_string(),
        "engine_library": str(library),
        "engine_library_sha256": _sha256(library),
        "total_elapsed_seconds": round(time.monotonic() - started, 3),
        "results": results,
        "scope": manifest["scope"],
        "verdict_contract": manifest["verdict_contract"],
    }
    _write_atomic(results_path, _canonical(document), exclusive=True)
    return document


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--manifest-write", action="store_true")
    mode.add_argument("--manifest-check", action="store_true")
    mode.add_argument("--run", action="store_true")
    mode.add_argument("--worker-case")
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    args = parser.parse_args()
    try:
        if args.manifest_write:
            _write_atomic(args.manifest, _canonical(build_manifest()), exclusive=True)
        elif args.manifest_check:
            _read_manifest(args.manifest)
        elif args.worker_case:
            print(_canonical(run_worker(args.manifest, args.worker_case)), end="")
        else:
            print(_canonical(run_pilot(args.manifest, args.results)), end="")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
