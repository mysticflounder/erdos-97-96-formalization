"""Governed one-cell runner for the diagnostic B1 exact-12 static model.

This runner deliberately makes no coverage or proof-closure claim.  SAT models
are replayed against the complete CNF and the source-facing structural checks;
UNSAT is accepted only after ``solve_cadical`` verifies the requested DRAT
proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
from collections.abc import Collection, Mapping, Sequence
from itertools import islice
from pathlib import Path
from typing import Any

from .b1_exact12_static_convex import (
    PROMOTION_ELIGIBLE as CONVEX_PROMOTION_ELIGIBLE,
)
from .b1_exact12_static_convex import (
    B1Exact12StaticConvexError,
    canonical_convex_satisfies_delta,
    install_static_convex_extension,
)
from .b1_exact12_static_equality import (
    PROMOTION_ELIGIBLE as STATIC_PROMOTION_ELIGIBLE,
)
from .b1_exact12_static_equality import (
    B1Exact12StaticEqualityError,
    canonical_extension_satisfies_delta,
    install_static_equality_extension,
)
from .b1_exact12_static_geometry import (
    PROMOTION_ELIGIBLE as GEOMETRY_PROMOTION_ELIGIBLE,
)
from .b1_exact12_static_geometry import (
    B1Exact12StaticGeometryError,
    canonical_geometry_satisfies_delta,
    install_static_geometry_extension,
)
from .b1_exact12_structural import (
    PROMOTION_ELIGIBLE as STRUCTURAL_PROMOTION_ELIGIBLE,
)
from .b1_exact12_structural import (
    B1Exact12StructuralError,
    B1SourceSafeCoverInstance,
    cells,
    compile_cell,
    replay_structural_cube,
)
from .candidate_surface import build_model
from .sat_encoding import solve_cadical

SCHEMA = "p97_b1_exact12_static_run.v2"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
SEMANTIC_STATUS = "diagnostic_exact12_single_cell_static_layers_only"
PROMOTION_ELIGIBLE = False
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]


class B1Exact12StaticEqualityRunError(RuntimeError):
    """The governed run request or solver result failed its contract."""


def _canonical_bytes(value: Any) -> bytes:
    return (
        json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
        ).encode("ascii")
        + b"\n"
    )


def _sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _manifest_payload_sha256(manifest: Mapping[str, Any]) -> str:
    payload = dict(manifest)
    payload.pop("manifest_sha256", None)
    return _sha256_bytes(_canonical_bytes(payload).rstrip(b"\n"))


def _load_governed_output_dir(output_dir: Path) -> dict[str, Any]:
    if output_dir.name != "artifacts" or not output_dir.is_dir():
        raise B1Exact12StaticEqualityRunError(
            "output directory must be an existing governed artifacts directory"
        )
    if output_dir.is_symlink() or output_dir.parent.is_symlink():
        raise B1Exact12StaticEqualityRunError(
            "governed output directories must not be symbolic links"
        )
    manifest_path = output_dir.parent / "run_manifest.json"
    if not manifest_path.is_file() or manifest_path.is_symlink():
        raise B1Exact12StaticEqualityRunError(
            "the artifacts parent must contain a regular run_manifest.json"
        )
    try:
        raw = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise B1Exact12StaticEqualityRunError(
            "run_manifest.json is not valid UTF-8 JSON"
        ) from exc
    if not isinstance(raw, dict) or raw.get("schema") != RUN_MANIFEST_SCHEMA:
        raise B1Exact12StaticEqualityRunError(
            "run_manifest.json has the wrong schema"
        )
    if raw.get("output_classes") != ["artifacts", "events", "tmp"]:
        raise B1Exact12StaticEqualityRunError(
            "run_manifest.json does not declare the governed output classes"
        )
    claimed_hash = raw.get("manifest_sha256")
    if (
        not isinstance(claimed_hash, str)
        or claimed_hash != _manifest_payload_sha256(raw)
    ):
        raise B1Exact12StaticEqualityRunError(
            "run_manifest.json has an invalid manifest hash"
        )
    root_value = raw.get("root")
    if not isinstance(root_value, str) or not root_value:
        raise B1Exact12StaticEqualityRunError(
            "run_manifest.json has no governed root"
        )
    claimed_root = Path(root_value)
    if not claimed_root.is_absolute():
        claimed_root = REPOSITORY_ROOT / claimed_root
    if claimed_root.resolve() != output_dir.parent.resolve():
        raise B1Exact12StaticEqualityRunError(
            "output directory does not belong to the manifested run root"
        )
    return raw


def _normalize_profile(profile: Sequence[int]) -> tuple[int, int, int]:
    normalized = tuple(profile)
    if len(normalized) != 3 or any(type(value) is not int for value in normalized):
        raise B1Exact12StaticEqualityRunError(
            "profile must contain exactly three integer cap sizes"
        )
    return normalized


def _select_raw_cell(
    profile: tuple[int, int, int], class_card: int, cell_index: int
) -> Any:
    if class_card not in (5, 6):
        raise B1Exact12StaticEqualityRunError("class_card must be 5 or 6")
    if type(cell_index) is not int or cell_index < 1:
        raise B1Exact12StaticEqualityRunError(
            "cell_index is a one-based positive integer"
        )
    iterator = cells(profiles=(profile,), class_cards=(class_card,))
    try:
        return next(islice(iterator, cell_index - 1, cell_index))
    except StopIteration as exc:
        raise B1Exact12StaticEqualityRunError(
            f"raw cell index {cell_index} is outside the requested schedule"
        ) from exc


def _clause_satisfied(clause: Collection[int], positive: frozenset[int]) -> bool:
    return any(
        literal in positive if literal > 0 else -literal not in positive
        for literal in clause
    )


def _artifact_record(path: Path) -> dict[str, Any] | None:
    if not path.exists():
        return None
    if not path.is_file() or path.is_symlink():
        raise B1Exact12StaticEqualityRunError(
            f"solver artifact is not a regular file: {path.name}"
        )
    return {
        "path": path.name,
        "bytes": path.stat().st_size,
        "sha256": _sha256_file(path),
    }


def _atomic_create_json(path: Path, value: Any) -> None:
    if path.exists():
        raise B1Exact12StaticEqualityRunError(
            f"refusing to overwrite existing artifact: {path.name}"
        )
    payload = _canonical_bytes(value)
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    descriptor = os.open(
        temporary,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL,
        0o600,
    )
    linked = False
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
        os.link(temporary, path)
        linked = True
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass
    if not linked:
        raise B1Exact12StaticEqualityRunError(
            f"could not publish result artifact: {path.name}"
        )


def run_cell(
    output_dir: Path,
    *,
    profile: Sequence[int] = (5, 5, 5),
    class_card: int = 5,
    cell_index: int = 1,
    timeout_seconds: int = 30,
    include_equilateral: bool = False,
    include_perpendicular: bool = False,
) -> dict[str, Any]:
    """Build, solve, replay, and report one raw exact-12 B1 cell."""

    if (
        STRUCTURAL_PROMOTION_ELIGIBLE
        or STATIC_PROMOTION_ELIGIBLE
        or GEOMETRY_PROMOTION_ELIGIBLE
        or CONVEX_PROMOTION_ELIGIBLE
    ):
        raise B1Exact12StaticEqualityRunError(
            "the imported diagnostic encoders unexpectedly claim promotion eligibility"
        )
    if type(timeout_seconds) is not int or timeout_seconds < 1:
        raise B1Exact12StaticEqualityRunError(
            "timeout_seconds must be a positive integer"
        )
    output_dir = Path(output_dir)
    run_manifest = _load_governed_output_dir(output_dir)
    normalized_profile = _normalize_profile(profile)
    cell = _select_raw_cell(normalized_profile, class_card, cell_index)

    instance = B1SourceSafeCoverInstance(build_model(12, normalized_profile))
    compiled = compile_cell(instance, cell)
    layout = install_static_equality_extension(instance, compiled)
    include_geometry = include_equilateral or include_perpendicular
    geometry_layout = (
        install_static_geometry_extension(instance, compiled, layout)
        if include_geometry
        else None
    )
    convex_layout = (
        install_static_convex_extension(
            instance, compiled, layout, geometry_layout
        )
        if include_perpendicular and geometry_layout is not None
        else None
    )
    structural_manifest = compiled.manifest()
    static_manifest = layout.manifest()
    geometry_manifest = (
        geometry_layout.manifest() if geometry_layout is not None else None
    )
    convex_manifest = (
        convex_layout.manifest() if convex_layout is not None else None
    )

    layer_name = (
        "convex"
        if include_perpendicular
        else "geometry"
        if include_geometry
        else "equality"
    )
    stem = (
        f"b1-static-{layer_name}-p{'-'.join(map(str, normalized_profile))}"
        f"-c{class_card}-raw-{cell_index:08d}"
    )
    cnf_path = output_dir / f"{stem}.cnf"
    proof_path = output_dir / f"{stem}.drat"
    result_path = output_dir / f"{stem}.json"
    for artifact in (cnf_path, proof_path, result_path):
        if artifact.exists():
            raise B1Exact12StaticEqualityRunError(
                f"refusing to overwrite existing artifact: {artifact.name}"
            )

    expected_dimacs = instance.dimacs().encode("utf-8")
    solver = solve_cadical(
        instance,
        cnf_path,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )

    persisted_dimacs = cnf_path.read_bytes()
    if persisted_dimacs != expected_dimacs:
        raise B1Exact12StaticEqualityRunError(
            "persisted DIMACS differs from the canonical instance serialization"
        )

    checks: dict[str, bool] = {
        "canonical_dimacs_persisted": True,
        "diagnostic_non_promotable": True,
    }
    cube_payload: dict[str, list[int]] | None = None
    positive_count: int | None = None
    if solver.verdict == "SAT":
        if solver.positive_variables is None or solver.cube is None:
            raise B1Exact12StaticEqualityRunError(
                "SAT result omitted its assignment or decoded cube"
            )
        positive = frozenset(solver.positive_variables)
        if any(
            type(variable) is not int
            or variable < 1
            or variable > instance.cnf.n_variables
            for variable in positive
        ):
            raise B1Exact12StaticEqualityRunError(
                "SAT result contains a variable outside the final CNF"
            )
        if not all(
            _clause_satisfied(clause, positive)
            for clause in instance.cnf.clauses
        ):
            raise B1Exact12StaticEqualityRunError(
                "SAT assignment fails a clause in the complete CNF"
            )
        structural_checks = replay_structural_cube(instance, cell, solver.cube)
        canonical_delta = canonical_extension_satisfies_delta(
            instance,
            compiled,
            layout,
            solver.cube,
            allow_appended_clauses=include_geometry,
        )
        if not canonical_delta:
            raise B1Exact12StaticEqualityRunError(
                "canonical equality extension fails its clause delta"
            )
        checks.update(structural_checks)
        checks.update(
            {
                "solver_assignment_satisfies_full_cnf": True,
                "structural_cube_replayed": True,
                "canonical_extension_satisfies_delta": True,
            }
        )
        if geometry_layout is not None and convex_layout is None:
            if not canonical_geometry_satisfies_delta(
                instance,
                compiled,
                layout,
                geometry_layout,
                solver.cube,
            ):
                raise B1Exact12StaticEqualityRunError(
                    "canonical equality valuation fails the geometry clause delta"
                )
            checks["canonical_geometry_satisfies_delta"] = True
        if convex_layout is not None:
            if not canonical_convex_satisfies_delta(
                instance,
                compiled,
                layout,
                geometry_layout,
                convex_layout,
                solver.cube,
            ):
                raise B1Exact12StaticEqualityRunError(
                    "canonical equality valuation fails the convex clause delta"
                )
            checks["canonical_convex_satisfies_delta"] = True
            checks["canonical_geometry_satisfies_delta"] = True
        cube_payload = {
            str(center): list(solver.cube[center])
            for center in sorted(solver.cube)
        }
        positive_count = len(positive)
    elif solver.verdict == "UNSAT":
        if not solver.proof_verified:
            raise B1Exact12StaticEqualityRunError(
                "UNSAT result lacks a verified DRAT proof"
            )
        checks["drat_proof_verified"] = True
    elif solver.verdict not in {"UNKNOWN", "TIMEOUT"}:
        raise B1Exact12StaticEqualityRunError(
            f"unrecognized solver verdict: {solver.verdict!r}"
        )

    cnf_record = _artifact_record(cnf_path)
    proof_record = _artifact_record(proof_path)
    if cnf_record is None:
        raise B1Exact12StaticEqualityRunError("canonical DIMACS artifact is absent")
    if solver.verdict == "UNSAT" and (
        proof_record is None or proof_record["bytes"] == 0
    ):
        raise B1Exact12StaticEqualityRunError(
            "verified UNSAT result has no nonempty proof artifact"
        )

    report: dict[str, Any] = {
        "schema": SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "closure_claim": False,
        "coverage_claim": False,
        "scope": (
            "one raw exact-12 structural/static cell; diagnostic only"
        ),
        "run": {
            "lane_id": run_manifest.get("lane_id"),
            "run_id": run_manifest.get("run_id"),
            "profile": list(normalized_profile),
            "class_card": class_card,
            "raw_cell_index": cell_index,
            "timeout_seconds": timeout_seconds,
            "static_layer": layer_name,
        },
        "cell": cell.payload(),
        "structural_manifest": structural_manifest,
        "static_equality_manifest": static_manifest,
        "static_geometry_manifest": geometry_manifest,
        "static_convex_manifest": convex_manifest,
        "solver": {
            "verdict": solver.verdict,
            "returncode": solver.returncode,
            "proof_verified": solver.proof_verified,
        },
        "counts": {
            "variables": instance.cnf.n_variables,
            "clauses": len(instance.cnf.clauses),
            "positive_variables": positive_count,
        },
        "checks": checks,
        "cube": cube_payload,
        "artifacts": {
            "cnf": cnf_record,
            "proof": proof_record,
            "result": result_path.name,
        },
    }
    _atomic_create_json(result_path, report)
    return report


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Run one governed diagnostic B1 exact-12 static cell."
    )
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--profile", nargs=3, type=int, default=(5, 5, 5))
    parser.add_argument("--class-card", type=int, choices=(5, 6), default=5)
    parser.add_argument("--cell-index", type=int, default=1)
    parser.add_argument("--timeout", type=int, default=30, dest="timeout_seconds")
    parser.add_argument(
        "--equilateral",
        action="store_true",
        help="append every generic equilateral-bisector collision nogood",
    )
    parser.add_argument(
        "--perpendicular",
        action="store_true",
        help=(
            "append the equilateral layer and every convex "
            "perpendicular-bisector nogood"
        ),
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    parser = _parser()
    arguments = parser.parse_args(argv)
    try:
        report = run_cell(
            arguments.output_dir,
            profile=arguments.profile,
            class_card=arguments.class_card,
            cell_index=arguments.cell_index,
            timeout_seconds=arguments.timeout_seconds,
            include_equilateral=arguments.equilateral,
            include_perpendicular=arguments.perpendicular,
        )
    except (
        B1Exact12StaticEqualityError,
        B1Exact12StaticConvexError,
        B1Exact12StaticGeometryError,
        B1Exact12StaticEqualityRunError,
        B1Exact12StructuralError,
        OSError,
    ) as exc:
        message = str(exc).replace("\n", " ")[:1000]
        print(f"error: {message}", file=sys.stderr)
        return 2
    print(
        json.dumps(
            {
                "schema": report["schema"],
                "verdict": report["solver"]["verdict"],
                "result": report["artifacts"]["result"],
            },
            sort_keys=True,
            separators=(",", ":"),
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
