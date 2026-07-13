#!/usr/bin/env python3
"""Manifest-bound separator-saturated equality pilot for ATAIL-FORCE."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any, Mapping

import sympy as sp

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


MANIFEST_SCHEMA = "p97_atail_force_separator_pilot_manifest.v1"
RESULT_SCHEMA = "p97_atail_force_separator_pilot_results.v1"
HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_MANIFEST = HERE / "separator_pilot_manifest.json"
DEFAULT_RESULTS = HERE / "separator_pilot_results.json"

TIMEOUT_SECONDS = 20
TOTAL_WALL_SECONDS = 180
ENGINE_THREADS = 1
INTERIOR_STRATA = tuple(range(6, 13))

PINNED_INPUTS = (
    Path(__file__).resolve(),
    Path(surface.__file__).resolve(),
    Path(reduction.__file__).resolve(),
    HERE / "surface_checkpoint.json",
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


def _equality_orbits(
    classes: tuple[surface.JointClass, ...],
) -> list[reduction.EqualitySignature]:
    return sorted(
        {
            reduction.canonical_equality_signature(
                reduction.equality_signature(joint)
            )
            for joint in classes
        }
    )


def _representative_for_orbit(
    classes: tuple[surface.JointClass, ...],
    orbit: reduction.EqualitySignature,
) -> surface.JointClass:
    candidates = [
        joint
        for joint in classes
        if reduction.canonical_equality_signature(
            reduction.equality_signature(joint)
        )
        == orbit
    ]
    _require(bool(candidates), "equality orbit has no class representative")
    return min(
        candidates,
        key=lambda joint: (
            reduction.equality_signature(joint) != orbit,
            joint.class_id,
        ),
    )


def _case_record(
    joint: surface.JointClass,
    orbit_id: int,
) -> dict[str, Any]:
    order = surface.canonical_decoration(joint)
    system = surface.build_equality_system(joint, order)
    separators = surface.equality_separators(system)
    signature = reduction.equality_signature(joint)
    return {
        "case_id": (
            f"m{joint.interior_point_count:02d}_"
            f"e{orbit_id:02d}_c{joint.class_id:04d}"
        ),
        "equality_orbit_id": orbit_id,
        "class_id": joint.class_id,
        "class_key_sha256": joint.class_key_sha256,
        "raw_equality_signature_sha256": _json_digest(signature),
        "interior_points": joint.interior_point_count,
        "base_variables": len(system.vars),
        "base_equalities": len(system.eqs),
        "separators": len(separators),
        "augmented_variables": len(system.vars) + len(separators),
        "augmented_equalities": len(system.eqs) + len(separators),
        "order": order.as_json(),
    }


def build_manifest() -> dict[str, Any]:
    _report, classes = surface.load_inventory()
    orbits = _equality_orbits(classes)
    _require(len(orbits) == 70, "S3 equality-orbit count drift")
    cases = []
    for interior_points in INTERIOR_STRATA:
        orbit_id, orbit = next(
            (index, signature)
            for index, signature in enumerate(orbits)
            if sum(count for _mask, count in signature[1]) == interior_points
        )
        representative = _representative_for_orbit(classes, orbit)
        case = _case_record(representative, orbit_id)
        _require(
            case["interior_points"] == interior_points,
            f"stratum {interior_points} selected the wrong representative",
        )
        cases.append(case)
    _require(len({case["case_id"] for case in cases}) == 7, "duplicate pilot case")
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path) for path in PINNED_INPUTS
    }
    body = {
        "schema": MANIFEST_SCHEMA,
        "policy": {
            "engine": "msolve",
            "engine_threads": ENGINE_THREADS,
            "timeout_seconds_per_case": TIMEOUT_SECONDS,
            "total_wall_stop_seconds": TOTAL_WALL_SECONDS,
            "case_count": len(cases),
            "case_selection": (
                "lexicographically first S3 equality orbit in each interior-"
                "support stratum 6 through 12"
            ),
            "saturation": (
                "one Rabinowitsch variable per pairwise-distinctness or "
                "triangle-area separator"
            ),
        },
        "cases": cases,
        "verdict_contract": {
            "C_EMPTY_PROPOSAL": (
                "engine proposal only; requires independent exact replay"
            ),
            "POSITIVE_DIMENSION_SIGNAL": "complex-algebraic signal, not a witness",
            "ZERO_DIMENSION_SIGNAL": "complex-algebraic signal, not a witness",
            "TIMEOUT": "no claim",
            "ERROR": "no claim",
            "UNPARSED": "no claim",
        },
        "scope": {
            "bare_equalities_skipped_due_to_exact_witnesses": True,
            "separator_saturated": True,
            "full_inequalities_included": False,
            "coverage_claim": False,
            "lean_claim": False,
        },
        "input_sha256": dict(sorted(input_digests.items())),
    }
    return {**body, "manifest_sha256": _json_digest(body)}


def _read_manifest(path: Path) -> dict[str, Any]:
    try:
        with path.open(encoding="utf-8") as handle:
            manifest = json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise surface.SurfaceError(f"cannot load pilot manifest {path}: {exc}") from exc
    _require(manifest.get("schema") == MANIFEST_SCHEMA, "manifest schema drift")
    stored_digest = manifest.get("manifest_sha256")
    body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    _require(stored_digest == _json_digest(body), "manifest self-digest drift")
    return manifest


def _load_current_manifest(path: Path) -> dict[str, Any]:
    manifest = _read_manifest(path)
    _require(manifest == build_manifest(), "separator pilot manifest is stale")
    return manifest


def _system_for_case(
    case: Mapping[str, Any],
) -> tuple[surface.JointClass, surface.OrderDecoration, Any]:
    _report, classes = surface.load_inventory()
    class_id = case.get("class_id")
    _require(
        type(class_id) is int and 0 <= class_id < len(classes),
        f"invalid class id {class_id!r}",
    )
    joint = classes[class_id]
    order_payload = case.get("order")
    _require(isinstance(order_payload, dict), "pilot order is malformed")
    order = surface.OrderDecoration(
        tuple(order_payload.get("S", [])),
        tuple(order_payload.get("O1", [])),
        tuple(order_payload.get("O2", [])),
    )
    system = surface.build_equality_system(joint, order)
    _require(joint.class_key_sha256 == case["class_key_sha256"], "class drift")
    return joint, order, system


def build_msolve_input(case: Mapping[str, Any]) -> str:
    _joint, _order, system = _system_for_case(case)
    separators = surface.equality_separators(system)
    variables = [str(variable) for variable in system.vars]
    polynomials = [str(sp.expand(equation)) for equation in system.eqs]
    for index, separator in enumerate(separators):
        variable = f"sep_inv_{index}"
        variables.append(variable)
        polynomials.append(
            str(sp.expand(separator * sp.Symbol(variable) - 1))
        )
    _require(len(variables) == case["augmented_variables"], "variable-count drift")
    _require(
        len(polynomials) == case["augmented_equalities"],
        "polynomial-count drift",
    )
    polynomials = [polynomial.replace("**", "^") for polynomial in polynomials]
    return ",".join(variables) + "\n0\n" + ",\n".join(polynomials) + "\n"


def _classify(raw: str, returncode: int) -> str:
    if returncode != 0:
        return "ERROR"
    stripped = raw.strip()
    if stripped.startswith("[-1]"):
        return "C_EMPTY_PROPOSAL"
    if stripped.startswith("[1,"):
        return "POSITIVE_DIMENSION_SIGNAL"
    if stripped.startswith("[0,"):
        return "ZERO_DIMENSION_SIGNAL"
    return "UNPARSED"


def run_pilot(manifest_path: Path, results_path: Path) -> dict[str, Any]:
    manifest = _load_current_manifest(manifest_path)
    engine = shutil.which("msolve")
    _require(engine is not None, "msolve is not available")
    engine_path = Path(engine).resolve()
    started = time.monotonic()
    results = []
    for case in manifest["cases"]:
        if time.monotonic() - started >= TOTAL_WALL_SECONDS:
            results.append(
                {"case_id": case["case_id"], "verdict": "TOTAL_WALL_STOP"}
            )
            continue
        input_text = build_msolve_input(case)
        case_started = time.monotonic()
        with tempfile.TemporaryDirectory(prefix="atail-separator-pilot-") as tmp:
            input_path = Path(tmp) / "case.in"
            output_path = Path(tmp) / "case.out"
            input_path.write_text(input_text, encoding="utf-8")
            try:
                completed = subprocess.run(
                    [
                        str(engine_path),
                        "-f",
                        str(input_path),
                        "-o",
                        str(output_path),
                        "-t",
                        str(ENGINE_THREADS),
                    ],
                    capture_output=True,
                    text=True,
                    timeout=TIMEOUT_SECONDS,
                    check=False,
                )
                raw = (
                    output_path.read_text(encoding="utf-8")
                    if output_path.exists()
                    else ""
                )
                verdict = _classify(raw, completed.returncode)
                returncode: int | None = completed.returncode
                stderr_prefix = completed.stderr[:500]
            except subprocess.TimeoutExpired:
                raw = (
                    output_path.read_text(encoding="utf-8")
                    if output_path.exists()
                    else ""
                )
                verdict = "TIMEOUT"
                returncode = None
                stderr_prefix = ""
        results.append(
            {
                "case_id": case["case_id"],
                "verdict": verdict,
                "elapsed_seconds": round(time.monotonic() - case_started, 3),
                "returncode": returncode,
                "input_sha256": hashlib.sha256(input_text.encode("utf-8")).hexdigest(),
                "output_sha256": hashlib.sha256(raw.encode("utf-8")).hexdigest(),
                "output_prefix": raw[:500],
                "stderr_prefix": stderr_prefix,
            }
        )
    document = {
        "schema": RESULT_SCHEMA,
        "manifest_sha256": manifest["manifest_sha256"],
        "engine": str(engine_path),
        "engine_sha256": _sha256(engine_path),
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
    mode.add_argument("--emit-input", metavar="CASE_ID")
    mode.add_argument("--run", action="store_true")
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    try:
        if args.manifest_write:
            _write_atomic(
                args.manifest,
                _canonical(build_manifest()),
                exclusive=True,
            )
        elif args.manifest_check:
            _read_manifest(args.manifest)
        elif args.emit_input:
            manifest = _read_manifest(args.manifest)
            case = next(
                (row for row in manifest["cases"] if row["case_id"] == args.emit_input),
                None,
            )
            _require(case is not None, f"unknown pilot case {args.emit_input!r}")
            content = build_msolve_input(case)
            if args.output is None:
                print(content, end="")
            else:
                _write_atomic(args.output, content)
        else:
            document = run_pilot(args.manifest, args.results)
            print(_canonical(document), end="")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
