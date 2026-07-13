#!/usr/bin/env python3
"""Manifest-bound cvc5 cross-engine pilot for ATAIL-FORCE.

This runner submits exactly the seven immutable full-inequality systems from
``inequality_pilot_manifest.json`` to cvc5's nonlinear-coverings engine.  It is
a bounded theorem-discovery diagnostic, not a second surface sweep.  SAT is an
unverified window candidate and UNSAT is an uncertified proposal; neither is a
Lean or geometric claim.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp

from census.atail_force import inequality_pilot as z3_pilot
from census.atail_force import three_center_surface as surface


MANIFEST_SCHEMA = "p97_atail_force_cvc5_pilot_manifest.v2"
RESULT_SCHEMA = "p97_atail_force_cvc5_pilot_results.v2"

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_MANIFEST = HERE / "cvc5_pilot_manifest_v2.json"
DEFAULT_RESULTS = HERE / "cvc5_pilot_results_v2.json"
SOURCE_MANIFEST = HERE / "inequality_pilot_manifest.json"

TIMEOUT_SECONDS = 30
HARD_TIMEOUT_GRACE_SECONDS = 5
TOTAL_WALL_SECONDS = 240
SMOKE_TIMEOUT_SECONDS = 5
ENGINE_PROCESSES = 1
NICE_LEVEL = 10
EXPECTED_CASE_COUNT = 7

_SYMBOL = re.compile(r"[A-Za-z_][A-Za-z0-9_]*\Z")


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


def _read_json(path: Path, context: str) -> dict[str, Any]:
    try:
        with path.open(encoding="utf-8") as handle:
            value = json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise surface.SurfaceError(f"cannot load {context} {path}: {exc}") from exc
    _require(isinstance(value, dict), f"{context} is not a JSON object")
    return value


def _write_atomic(path: Path, content: str, *, exclusive: bool) -> None:
    z3_pilot._write_atomic(path, content, exclusive=exclusive)


def _find_cvc5() -> Path:
    candidate = shutil.which("cvc5") or "/Users/adam/bin/cvc5"
    path = Path(candidate).resolve()
    _require(path.is_file(), f"cvc5 executable not found at {path}")
    return path


def _cvc5_version(cvc5: Path) -> str:
    try:
        completed = subprocess.run(
            (str(cvc5), "--version"),
            capture_output=True,
            text=True,
            timeout=10,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise surface.SurfaceError(f"cannot query cvc5 version: {exc}") from exc
    _require(completed.returncode == 0, "cvc5 --version failed")
    lines = completed.stdout.splitlines()
    _require(bool(lines), "cvc5 --version emitted no output")
    return lines[0].strip()


def _source_manifest() -> dict[str, Any]:
    source = z3_pilot._read_manifest(SOURCE_MANIFEST)
    _require(
        source.get("schema") == z3_pilot.MANIFEST_SCHEMA,
        "source inequality manifest schema drift",
    )
    _require(
        len(source.get("cases", [])) == EXPECTED_CASE_COUNT,
        "source inequality manifest case-count drift",
    )
    for case in source["cases"]:
        z3_pilot._validated_case_system(case)
    return source


def build_manifest() -> dict[str, Any]:
    source = _source_manifest()
    current_source_rebuild = z3_pilot.build_manifest()
    cvc5 = _find_cvc5()
    inputs = (Path(__file__).resolve(), SOURCE_MANIFEST, *z3_pilot.PINNED_INPUTS)
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path) for path in inputs
    }
    cases = [
        {
            "case_id": case["case_id"],
            "class_id": case["class_id"],
            "class_key_sha256": case["class_key_sha256"],
            "interior_points": case["interior_points"],
            "variables": case["variables"],
            "equalities": case["equalities"],
            "weak_inequalities": case["weak_inequalities"],
            "strict_inequalities": case["strict_inequalities"],
            "system_input_sha256": case["system_input_sha256"],
        }
        for case in source["cases"]
    ]
    body = {
        "schema": MANIFEST_SCHEMA,
        "owner": "ATAIL-FORCE cvc5 cross-engine bounded pilot",
        "command": (
            ".venv/bin/python -m census.atail_force.cvc5_pilot --run"
        ),
        "policy": {
            "engine": "cvc5 QF_NRA --nl-cov",
            "engine_version": _cvc5_version(cvc5),
            "engine_path": str(cvc5),
            "engine_sha256": _sha256(cvc5),
            "engine_processes": ENGINE_PROCESSES,
            "parallel_cases": 1,
            "nice_level": NICE_LEVEL,
            "timeout_seconds_per_case": TIMEOUT_SECONDS,
            "hard_timeout_grace_seconds": HARD_TIMEOUT_GRACE_SECONDS,
            "total_wall_stop_seconds": TOTAL_WALL_SECONDS,
            "smoke_timeout_seconds": SMOKE_TIMEOUT_SECONDS,
            "case_count": len(cases),
            "case_selection": (
                "the same seven immutable representatives as the completed "
                "Z3 full-inequality pilot, one per support stratum 6 through 12"
            ),
            "stop_condition": (
                "stop after both smoke queries and all seven cases or the "
                "240-second aggregate wall, whichever occurs first; no "
                "automatic extension, parallel fanout, or surface sweep"
            ),
        },
        "source_manifest_sha256": _sha256(SOURCE_MANIFEST),
        "source_manifest_self_sha256": source["manifest_sha256"],
        "source_provenance": {
            "stored_manifest_matches_current_rebuild": (
                source == current_source_rebuild
            ),
            "all_seven_system_input_digests_replayed_current": True,
            "current_rebuild_input_drift": {
                key: {
                    "stored": source["input_sha256"].get(key),
                    "current": current_source_rebuild["input_sha256"].get(key),
                }
                for key in sorted(
                    set(source["input_sha256"])
                    | set(current_source_rebuild["input_sha256"])
                )
                if source["input_sha256"].get(key)
                != current_source_rebuild["input_sha256"].get(key)
            },
        },
        "cases": cases,
        "verdict_contract": {
            "SAT_CANDIDATE": (
                "cvc5 returned SAT; no independent exact model replay, so no claim"
            ),
            "UNSAT_PROPOSAL": (
                "cvc5 returned UNSAT; no independently replayed certificate, so no claim"
            ),
            "TIMEOUT": "no claim",
            "UNKNOWN": "no claim",
            "ERROR": "no claim",
            "TOTAL_WALL_STOP": "no claim",
        },
        "scope": {
            "cross_engine_same_frozen_cases": True,
            "full_three_center_window_inequalities_included": True,
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
    manifest = _read_json(path, "cvc5-pilot manifest")
    _require(manifest.get("schema") == MANIFEST_SCHEMA, "manifest schema drift")
    stored_digest = manifest.get("manifest_sha256")
    body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    _require(stored_digest == _json_digest(body), "manifest self-digest drift")
    return manifest


def _load_current_manifest(path: Path) -> dict[str, Any]:
    manifest = _read_manifest(path)
    _require(manifest == build_manifest(), "cvc5 pilot manifest is stale")
    return manifest


def _case_by_id(manifest: Mapping[str, Any], case_id: str) -> dict[str, Any]:
    case = next((row for row in manifest["cases"] if row["case_id"] == case_id), None)
    _require(case is not None, f"unknown cvc5 pilot case {case_id!r}")
    return case


def _validated_case_system(case: Mapping[str, Any]) -> Any:
    source = _source_manifest()
    source_case = next(
        row for row in source["cases"] if row["case_id"] == case["case_id"]
    )
    system = z3_pilot._validated_case_system(source_case)
    for field in (
        "class_id",
        "class_key_sha256",
        "interior_points",
        "variables",
        "equalities",
        "weak_inequalities",
        "strict_inequalities",
        "system_input_sha256",
    ):
        _require(case.get(field) == source_case.get(field), f"case {field} drift")
    return system


def _integer_smt2(value: int) -> str:
    return str(value) if value >= 0 else f"(- {abs(value)})"


def _rational_smt2(value: sp.Rational) -> str:
    numerator = int(value.p)
    denominator = int(value.q)
    if denominator == 1:
        return _integer_smt2(numerator)
    return f"(/ {_integer_smt2(numerator)} {denominator})"


def _product_smt2(factors: Sequence[str]) -> str:
    if not factors:
        return "1"
    if len(factors) == 1:
        return factors[0]
    return f"(* {' '.join(factors)})"


def _poly_smt2(expr: sp.Expr, variables: Sequence[sp.Symbol]) -> str:
    try:
        polynomial = sp.Poly(sp.expand(expr), *variables, domain=sp.QQ)
    except sp.PolynomialError as exc:
        raise surface.SurfaceError(f"non-polynomial generator {expr}") from exc
    names = [str(variable) for variable in variables]
    _require(all(_SYMBOL.fullmatch(name) for name in names), "unsafe SMT symbol")
    terms: list[str] = []
    for powers, coefficient in polynomial.terms():
        rational = sp.Rational(coefficient)
        factors: list[str] = []
        for name, power in zip(names, powers, strict=True):
            factors.extend([name] * power)
        monomial = _product_smt2(factors)
        if not factors:
            term = _rational_smt2(rational)
        elif rational == 1:
            term = monomial
        elif rational == -1:
            term = f"(- {monomial})"
        else:
            term = f"(* {_rational_smt2(rational)} {monomial})"
        terms.append(term)
    if not terms:
        return "0"
    if len(terms) == 1:
        return terms[0]
    return f"(+ {' '.join(terms)})"


def build_smt2(case: Mapping[str, Any]) -> tuple[str, dict[str, int]]:
    system = _validated_case_system(case)
    variables = list(system.vars)
    names = [str(variable) for variable in variables]
    _require(all(_SYMBOL.fullmatch(name) for name in names), "unsafe SMT symbol")
    lines = ["(set-logic QF_NRA)"]
    lines.extend(f"(declare-fun {name} () Real)" for name in names)
    for expression in system.eqs:
        lines.append(f"(assert (= {_poly_smt2(expression, variables)} 0))")
    for expression in system.ge:
        lines.append(f"(assert (>= {_poly_smt2(expression, variables)} 0))")
    for expression in system.gt:
        lines.append(f"(assert (> {_poly_smt2(expression, variables)} 0))")
    lines.extend(("(check-sat)", "(exit)"))
    counts = {
        "variables": len(variables),
        "equalities": len(system.eqs),
        "weak_inequalities": len(system.ge),
        "strict_inequalities": len(system.gt),
        "assertions": len(system.eqs) + len(system.ge) + len(system.gt),
    }
    return "\n".join(lines) + "\n", counts


def _parse_status(stdout: str) -> str | None:
    statuses = [
        line.strip().lower()
        for line in stdout.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    return statuses[-1].upper() if statuses else None


def _timeout_diagnostic(text: str) -> bool:
    lowered = text.lower()
    return "interrupted by timeout" in lowered or "timeout" in lowered


def _nice_preflight() -> dict[str, Any]:
    command = (
        "/usr/bin/nice",
        "-n",
        str(NICE_LEVEL),
        sys.executable,
        "-c",
        "import os; print(os.getpriority(os.PRIO_PROCESS, 0))",
    )
    try:
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=10,
            check=False,
            cwd=REPO_ROOT,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return {"passed": False, "detail": str(exc)}
    try:
        effective_nice = int(completed.stdout.strip())
    except ValueError:
        effective_nice = None
    denied = "setpriority" in completed.stderr.lower()
    return {
        "passed": (
            completed.returncode == 0
            and effective_nice is not None
            and effective_nice >= NICE_LEVEL
            and not denied
        ),
        "effective_nice": effective_nice,
        "returncode": completed.returncode,
        "stderr": completed.stderr.strip(),
    }


def _run_smt2(
    cvc5: Path,
    smt2: str,
    *,
    timeout_seconds: float,
    use_nice: bool = True,
) -> dict[str, Any]:
    timeout_ms = max(1, int(timeout_seconds * 1000))
    engine_command = (
        str(cvc5),
        "--lang=smt2",
        "--nl-cov",
        f"--tlimit={timeout_ms}",
        "-",
    )
    command = (
        ("/usr/bin/nice", "-n", str(NICE_LEVEL), *engine_command)
        if use_nice
        else engine_command
    )
    environment = dict(os.environ)
    environment.update(
        {
            "OMP_NUM_THREADS": "1",
            "OPENBLAS_NUM_THREADS": "1",
            "MKL_NUM_THREADS": "1",
        }
    )
    started = time.monotonic()
    try:
        completed = subprocess.run(
            command,
            input=smt2,
            capture_output=True,
            text=True,
            timeout=timeout_seconds + HARD_TIMEOUT_GRACE_SECONDS,
            check=False,
            cwd=REPO_ROOT,
            env=environment,
        )
    except subprocess.TimeoutExpired as exc:
        return {
            "verdict": "TIMEOUT",
            "detail": "parent hard timeout",
            "elapsed_seconds": round(time.monotonic() - started, 3),
            "stdout_suffix": (exc.stdout or "")[-500:],
            "stderr_suffix": (exc.stderr or "")[-500:],
        }
    elapsed = round(time.monotonic() - started, 3)
    status = _parse_status(completed.stdout)
    diagnostics = "\n".join(
        value.strip() for value in (completed.stdout, completed.stderr) if value.strip()
    )
    if use_nice and "setpriority" in completed.stderr.lower():
        verdict = "ERROR"
    elif status == "SAT":
        verdict = "SAT_CANDIDATE"
    elif status == "UNSAT":
        verdict = "UNSAT_PROPOSAL"
    elif status == "UNKNOWN" and _timeout_diagnostic(diagnostics):
        verdict = "TIMEOUT"
    elif status == "UNKNOWN":
        verdict = "UNKNOWN"
    else:
        verdict = "ERROR"
    result: dict[str, Any] = {
        "verdict": verdict,
        "solver_status": status,
        "elapsed_seconds": elapsed,
        "returncode": completed.returncode,
    }
    if verdict in {"TIMEOUT", "UNKNOWN", "ERROR"}:
        result["diagnostic_suffix"] = diagnostics[-1000:]
    if completed.returncode != 0 and verdict not in {"TIMEOUT", "UNKNOWN"}:
        result["verdict"] = "ERROR"
    return result


def _smoke(cvc5: Path, *, use_nice: bool = True) -> dict[str, Any]:
    sat_text = """(set-logic QF_NRA)
(declare-fun x () Real)
(assert (= (* x x) 1))
(check-sat)
(exit)
"""
    unsat_text = """(set-logic QF_NRA)
(declare-fun x () Real)
(assert (> (* x x) 0))
(assert (= x 0))
(check-sat)
(exit)
"""
    sat = _run_smt2(
        cvc5,
        sat_text,
        timeout_seconds=SMOKE_TIMEOUT_SECONDS,
        use_nice=use_nice,
    )
    unsat = _run_smt2(
        cvc5,
        unsat_text,
        timeout_seconds=SMOKE_TIMEOUT_SECONDS,
        use_nice=use_nice,
    )
    passed = sat["verdict"] == "SAT_CANDIDATE" and unsat["verdict"] == "UNSAT_PROPOSAL"
    return {"passed": passed, "sat": sat, "unsat": unsat}


def run_pilot(manifest_path: Path, results_path: Path) -> dict[str, Any]:
    manifest = _load_current_manifest(manifest_path)
    cvc5 = Path(manifest["policy"]["engine_path"])
    started = time.monotonic()
    nice_preflight = _nice_preflight()
    _require(nice_preflight["passed"], f"nice preflight failed: {nice_preflight}")
    smoke = _smoke(cvc5)
    _require(smoke["passed"], "cvc5 smoke gate failed")
    results = []
    for case in manifest["cases"]:
        elapsed_total = time.monotonic() - started
        remaining = TOTAL_WALL_SECONDS - elapsed_total
        if remaining <= HARD_TIMEOUT_GRACE_SECONDS + 1:
            results.append(
                {"case_id": case["case_id"], "verdict": "TOTAL_WALL_STOP"}
            )
            continue
        query_timeout = min(
            float(TIMEOUT_SECONDS), remaining - HARD_TIMEOUT_GRACE_SECONDS
        )
        smt2, counts = build_smt2(case)
        result = _run_smt2(cvc5, smt2, timeout_seconds=query_timeout)
        result.update(
            {
                "case_id": case["case_id"],
                "system_input_sha256": case["system_input_sha256"],
                "smt2_sha256": hashlib.sha256(smt2.encode("utf-8")).hexdigest(),
                "constraint_counts": counts,
            }
        )
        results.append(result)
    document = {
        "schema": RESULT_SCHEMA,
        "manifest_sha256": manifest["manifest_sha256"],
        "engine_version": manifest["policy"]["engine_version"],
        "engine_path": str(cvc5),
        "engine_sha256": _sha256(cvc5),
        "nice_preflight": nice_preflight,
        "smoke": smoke,
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
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    args = parser.parse_args()
    try:
        if args.manifest_write:
            _write_atomic(args.manifest, _canonical(build_manifest()), exclusive=True)
        elif args.manifest_check:
            _load_current_manifest(args.manifest)
        else:
            print(_canonical(run_pilot(args.manifest, args.results)), end="")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
