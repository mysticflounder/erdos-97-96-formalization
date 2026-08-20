"""Prepare source-covered exact-17 sparse-six physical-slice cells.

The command is preparation-only: it never contacts PIQD and never invokes a
solver.  Each of the thirteen authenticated next-center packages is refined
by the source-valid physical slice categories (no hit, or one non-self hit).
The output root is explicit so importing or testing this module never creates
the production run root.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

ROOT = Path(__file__).resolve().parents[1]
INPUT_ROOT = (
    ROOT / "scratch/runs/exact17-sparse-six-nextcenter-split-20260820/cell-campaign-v1"
)
SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage.lean"
)
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
EXPECTED_SOURCE_SHA256 = (
    "aa63481cdbb4562a470cbb6206f4ad946a40477787d1b90bb4dcba0f04189bc9"
)
EXPECTED_VARIABLE_MAP_SHA256 = (
    "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
)
EXPECTED_PARENT_CAMPAIGN_SHA256 = (
    "99cbff60f0276dee96bc458e6d2421a8b839eddddd20585d0a47586f7719df95"
)
EXPECTED_PARENT_RUN_SHA256 = (
    "12e74e4dada473652bb17b192389c3fb7c8abf3764af57211b6a54127552da2e"
)
LEGAL_CENTERS = (0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16)
PHYSICAL_POINTS = (6, 7, 8, 9, 10)
PARENT_VARIABLES = 308
NEXTCENTER_CLAUSES = 7_409_254
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointNextCenterPhysicalSliceCell"
)
ORDER_SHA256 = sha256_bytes(b"exact17-sparse-six-physical-slice-order-v1")
SCHEMA = "p97-exact17-sparse-six-physical-slice-preparation/v1"
CAMPAIGN_SCHEMA = "p97-exact17-sparse-six-physical-slice-campaign/v1"
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
SOURCE_SCHEMA = "p97-piqd-static-source/v1"
WAVE_SCHEMA = "p97-cegar-wave/v1"


class PreparationError(ValueError):
    """A requested package failed its immutable preparation contract."""


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _require_regular(path: Path, label: str) -> None:
    try:
        mode = os.lstat(path).st_mode
    except OSError as error:
        raise PreparationError(f"{label} is unavailable: {path}") from error
    if stat.S_ISLNK(mode) or not stat.S_ISREG(mode):
        raise PreparationError(f"{label} must be a regular non-symlink file: {path}")


def _require_dir(path: Path, label: str) -> None:
    try:
        mode = os.lstat(path).st_mode
    except OSError as error:
        raise PreparationError(f"{label} is unavailable: {path}") from error
    if stat.S_ISLNK(mode) or not stat.S_ISDIR(mode):
        raise PreparationError(f"{label} must be a non-symlink directory: {path}")


def _mkdir_once(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)
    _require_dir(path, "output directory")


def _write_once(path: Path, payload: bytes) -> None:
    _require_dir(path.parent, "artifact parent")
    try:
        mode = os.lstat(path).st_mode
    except FileNotFoundError:
        mode = None
    if mode is not None:
        if stat.S_ISLNK(mode) or not stat.S_ISREG(mode):
            raise PreparationError(
                f"refusing to overwrite non-regular artifact: {path}"
            )
        if path.read_bytes() != payload:
            raise PreparationError(f"write-once artifact differs: {path}")
        return
    try:
        with path.open("xb") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
    except FileExistsError:
        _require_regular(path, "raced artifact")
        if path.read_bytes() != payload:
            raise PreparationError(f"write-once artifact differs: {path}")


def _repo_relative(root: Path, path: Path) -> str:
    try:
        return (
            path.resolve(strict=False).relative_to(root.resolve(strict=True)).as_posix()
        )
    except ValueError as error:
        raise PreparationError(f"artifact escapes repository: {path}") from error


def _parent_header(line: bytes) -> tuple[int, int]:
    if not line.endswith(b"\n"):
        raise PreparationError("parent DIMACS header is unterminated")
    fields = line[:-1].split()
    if len(fields) != 4 or fields[:2] != [b"p", b"cnf"]:
        raise PreparationError("parent DIMACS header is not canonical")
    try:
        return int(fields[2]), int(fields[3])
    except ValueError as error:
        raise PreparationError(
            "parent DIMACS header counts are not integers"
        ) from error


def _validate_clause(line: bytes, variables: int) -> None:
    if not line.endswith(b"\n"):
        raise PreparationError("parent DIMACS body has an unterminated clause")
    try:
        values = tuple(int(token) for token in line[:-1].split())
    except ValueError as error:
        raise PreparationError(
            "parent DIMACS body contains a non-integer token"
        ) from error
    if not values or values[-1] != 0:
        raise PreparationError("parent DIMACS clause lacks its zero terminator")
    if any(value == 0 or abs(value) > variables for value in values[:-1]):
        raise PreparationError("parent DIMACS literal is outside its variable range")


def inspect_parent(
    path: Path,
    *,
    expected_sha256: str,
    expected_bytes: int,
    expected_variables: int = PARENT_VARIABLES,
    expected_clauses: int = NEXTCENTER_CLAUSES,
) -> dict[str, Any]:
    """Authenticate one prepared next-center CNF, including all clauses."""
    _require_regular(path, "parent CNF")
    digest = hashlib.sha256()
    size = 0
    count = 0
    with path.open("rb") as handle:
        header = handle.readline()
        digest.update(header)
        size += len(header)
        variables, clauses = _parent_header(header)
        if (variables, clauses) != (expected_variables, expected_clauses):
            raise PreparationError("parent DIMACS header dimensions drifted")
        for line in handle:
            digest.update(line)
            size += len(line)
            _validate_clause(line, variables)
            count += 1
    if (digest.hexdigest(), size, count) != (
        expected_sha256,
        expected_bytes,
        expected_clauses,
    ):
        raise PreparationError(
            "parent CNF identity, byte count, or clause count drifted"
        )
    return {
        "sha256": expected_sha256,
        "bytes": size,
        "variables": variables,
        "clauses": count,
        "header": f"p cnf {variables} {clauses}",
    }


def _read_json(path: Path, label: str) -> dict[str, Any]:
    _require_regular(path, label)
    try:
        value = json.loads(path.read_bytes())
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as error:
        raise PreparationError(f"{label} is not valid JSON") from error
    if not isinstance(value, dict):
        raise PreparationError(f"{label} must be a JSON object")
    return value


def _physical_categories(center: int) -> tuple[str, ...]:
    if type(center) is not int or center not in LEGAL_CENTERS:
        raise PreparationError(f"illegal next-center label: {center!r}")
    return ("none",) + tuple(
        f"unique-{point:02d}" for point in PHYSICAL_POINTS if point != center
    )


def category_id(center: int, category: str) -> str:
    if category not in _physical_categories(center):
        raise PreparationError(
            f"invalid physical category for center {center}: {category!r}"
        )
    return f"next-center-{center:02d}-physical-{category}"


def hit_variable(center: int, point: int) -> int:
    if center not in LEGAL_CENTERS or point not in PHYSICAL_POINTS:
        raise PreparationError("hit endpoint is outside the physical slice")
    variable = 1 + 17 * center + point
    if variable > PARENT_VARIABLES:
        raise PreparationError("hit variable exceeds the authenticated variable map")
    return variable


def category_units(center: int, category: str) -> tuple[int, ...]:
    if category == "none":
        return tuple(-hit_variable(center, point) for point in PHYSICAL_POINTS)
    try:
        point = int(category.removeprefix("unique-"))
    except ValueError as error:
        raise PreparationError(f"invalid physical category: {category!r}") from error
    if point not in PHYSICAL_POINTS or point == center:
        raise PreparationError("unique category must be a non-self physical point")
    return tuple(
        hit_variable(center, other) if other == point else -hit_variable(center, other)
        for other in PHYSICAL_POINTS
    )


def cell_cnf_bytes(parent: bytes, center: int, category: str) -> bytes:
    """Injectable cell builder; changes only the header and category suffix."""
    first, separator, body = parent.partition(b"\n")
    if not separator:
        raise PreparationError("parent DIMACS header is missing")
    variables, clauses = _parent_header(first + separator)
    if variables != PARENT_VARIABLES:
        raise PreparationError("parent variable count drifted")
    units = category_units(center, category)
    suffix = b"".join(f"{unit} 0\n".encode("ascii") for unit in units)
    return f"p cnf {variables} {clauses + len(units)}\n".encode("ascii") + body + suffix


def _cell_from_parent(
    parent_path: Path,
    output_path: Path,
    center: int,
    category: str,
    parent: dict[str, Any],
) -> dict[str, Any]:
    _require_regular(parent_path, "parent CNF")
    _require_dir(output_path.parent, "cell artifact directory")
    if output_path.exists() or output_path.is_symlink():
        _require_regular(output_path, "existing cell CNF")
        inspect_parent(
            parent_path,
            expected_sha256=parent["sha256"],
            expected_bytes=parent["bytes"],
            expected_variables=parent["variables"],
            expected_clauses=parent["clauses"],
        )
        consumed_parent = parent_path.read_bytes()
        if (
            sha256_bytes(consumed_parent),
            len(consumed_parent),
        ) != (parent["sha256"], parent["bytes"]):
            raise PreparationError("parent CNF changed during existing-cell replay")
        expected = cell_cnf_bytes(consumed_parent, center, category)
        if output_path.read_bytes() != expected:
            raise PreparationError(f"existing cell differs: {output_path}")
        return {
            "path": output_path,
            "sha256": sha256_bytes(expected),
            "bytes": len(expected),
        }
    candidate = output_path.with_name(f".{output_path.name}.candidate")
    if candidate.exists() or candidate.is_symlink():
        raise PreparationError(f"unexpected stale cell candidate: {candidate}")
    digest = hashlib.sha256()
    parent_digest = hashlib.sha256()
    size = 0
    with parent_path.open("rb") as source, candidate.open("xb") as target:
        header = source.readline()
        parent_digest.update(header)
        variables, clauses = _parent_header(header)
        if (variables, clauses) != (parent["variables"], parent["clauses"]):
            raise PreparationError("parent header changed during cell preparation")
        units = category_units(center, category)
        replacement = f"p cnf {variables} {clauses + len(units)}\n".encode("ascii")
        target.write(replacement)
        digest.update(replacement)
        size += len(replacement)
        for block in iter(lambda: source.read(1024 * 1024), b""):
            parent_digest.update(block)
            target.write(block)
            digest.update(block)
            size += len(block)
        suffix = b"".join(f"{unit} 0\n".encode("ascii") for unit in units)
        target.write(suffix)
        digest.update(suffix)
        size += len(suffix)
        target.flush()
        os.fsync(target.fileno())
    if (parent_digest.hexdigest(), parent_path.stat().st_size) != (
        parent["sha256"],
        parent["bytes"],
    ):
        candidate.unlink()
        raise PreparationError("parent CNF changed during cell creation")
    os.link(candidate, output_path)
    candidate.unlink()
    return {"path": output_path, "sha256": digest.hexdigest(), "bytes": size}


def _claims() -> dict[str, bool]:
    return {
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
        "one_process": False,
        "one_core": False,
    }


def _source_claims() -> dict[str, bool]:
    return {
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
    }


def build_producer(
    center: int,
    category: str,
    cnf: dict[str, Any],
    source_sha256: str,
    variable_map_sha256: str,
    source_path: str,
) -> bytes:
    source = {
        "cardinality_scope": f"exactly 17 sparse-six models in {category_id(center, category)}",
        "claims": _source_claims(),
        "finite_schema": "p97-exact17-sparse-six-physical-slice/v1",
        "schema": SOURCE_SCHEMA,
        "source_id": category_id(center, category),
        "source_path": source_path,
        "source_sha256": source_sha256,
        "source_theorem": SOURCE_THEOREM,
    }
    producer = {
        "backend": "cadical",
        "claims": _claims(),
        "producer_id": f"{category_id(center, category)}-v1",
        "producer_kind": "static-dimacs",
        "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        "schema": PRODUCER_SCHEMA,
        "solver_profile": "unsat",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(canonical_json_bytes(source)),
        "variable_map_sha256": variable_map_sha256,
    }
    return canonical_json_bytes(producer)


def build_wave(
    center: int,
    category: str,
    cnf_sha256: str,
    producer_sha256: str,
    shard_index: int,
    source_sha256: str,
    variable_map_sha256: str,
    clauses: int,
) -> bytes:
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": f"{category_id(center, category)}-v1",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.ATailFrontierLiveClosure.card_eq_seventeen_secondCapNine",
            "ingress_hypotheses_sha256": source_sha256,
            "finite_schema": "p97-exact17-sparse-six-physical-slice/v1",
            "cardinality_scope": f"exactly 17 physical-class points in {category_id(center, category)}",
            "source_theorem": SOURCE_THEOREM,
        },
        "encoding": {
            "cnf_sha256": cnf_sha256,
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": PARENT_VARIABLES,
            "num_clauses": clauses,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": shard_index,
            "shard_count": 76,
            "order_sha256": ORDER_SHA256,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    validate_wave_manifest(wave)
    return canonical_json_bytes(wave)


def _ref(root: Path, path: Path, payload: bytes) -> dict[str, Any]:
    return {
        "path": _repo_relative(root, path),
        "sha256": sha256_bytes(payload),
        "bytes": len(payload),
    }


def _file_ref(root: Path, path: Path, digest: str, size: int) -> dict[str, Any]:
    return {"path": _repo_relative(root, path), "sha256": digest, "bytes": size}


def _load_parent_cell(
    input_root: Path, center: int, variable_map_sha256: str
) -> tuple[Path, dict[str, Any], dict[str, Any], dict[str, Any]]:
    parent_dir = input_root / "artifacts" / "cells" / f"next-center-{center:02d}"
    cnf_path = parent_dir / f"next-center-{center:02d}.cnf"
    producer_path = parent_dir / "producer-manifest.json"
    wave_path = parent_dir / "wave-manifest.json"
    producer = _read_json(producer_path, "parent producer manifest")
    wave = _read_json(wave_path, "parent wave manifest")
    try:
        validate_wave_manifest(wave)
        expected_sha = wave["encoding"]["cnf_sha256"]
        expected_bytes = cnf_path.stat().st_size
        if _sha256_file(producer_path) != wave["encoding"]["producer_manifest_sha256"]:
            raise PreparationError("parent producer manifest hash disagrees with wave")
        if (
            producer.get("variable_map_sha256")
            != wave["encoding"]["variable_map_sha256"]
        ):
            raise PreparationError("parent variable-map hash disagrees with wave")
        if producer.get("variable_map_sha256") != variable_map_sha256:
            raise PreparationError("prepared parent variable-map hash drifted")
        expected_producer_fields = {
            "schema": PRODUCER_SCHEMA,
            "producer_kind": "static-dimacs",
            "backend": "cadical",
            "solver_profile": "unsat",
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        }
        if any(
            producer.get(key) != value
            for key, value in expected_producer_fields.items()
        ):
            raise PreparationError("prepared parent producer schema drifted")
        source_manifest = producer.get("source_manifest")
        if not isinstance(source_manifest, dict) or sha256_bytes(
            canonical_json_bytes(source_manifest)
        ) != producer.get("source_manifest_sha256"):
            raise PreparationError("prepared parent source manifest binding drifted")
        if wave["encoding"]["num_variables"] != PARENT_VARIABLES:
            raise PreparationError("parent variable-map dimensions drifted")
    except (KeyError, OSError) as error:
        raise PreparationError("prepared next-center manifest is incomplete") from error
    parent = inspect_parent(
        cnf_path,
        expected_sha256=expected_sha,
        expected_bytes=expected_bytes,
        expected_variables=PARENT_VARIABLES,
        expected_clauses=wave["encoding"]["num_clauses"],
    )
    return cnf_path, parent, producer, wave


def prepare_campaign(
    *,
    repo_root: Path = ROOT,
    input_root: Path = INPUT_ROOT,
    output_root: Path,
    source_path: Path = SOURCE_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
) -> dict[str, Any]:
    """Prepare all 76 categories from the authenticated 13 parent cells."""
    root = repo_root.resolve(strict=True)
    output = output_root.resolve(strict=False)
    try:
        output.relative_to(root)
    except ValueError as error:
        raise PreparationError("output root must be inside repository") from error
    _require_dir(input_root, "prepared next-center input root")
    parent_campaign_path = input_root / "artifacts" / "campaign-manifest.json"
    parent_run_path = input_root / "run_manifest.json"
    _require_regular(parent_campaign_path, "parent campaign manifest")
    _require_regular(parent_run_path, "parent run manifest")
    if _sha256_file(parent_campaign_path) != EXPECTED_PARENT_CAMPAIGN_SHA256:
        raise PreparationError("parent campaign manifest digest drifted")
    if _sha256_file(parent_run_path) != EXPECTED_PARENT_RUN_SHA256:
        raise PreparationError("parent run manifest digest drifted")
    _require_regular(source_path, "physical-slice Lean source")
    _require_regular(variable_map_path, "variable map")
    source_sha = _sha256_file(source_path)
    variable_sha = _sha256_file(variable_map_path)
    if source_sha != EXPECTED_SOURCE_SHA256:
        raise PreparationError("physical-slice Lean source digest drifted")
    if variable_sha != EXPECTED_VARIABLE_MAP_SHA256:
        raise PreparationError("variable-map digest drifted")
    _mkdir_once(output)
    for name in ("artifacts", "events", "tmp"):
        _mkdir_once(output / name)
    cells: list[dict[str, Any]] = []
    input_digests: dict[str, str] = {}
    input_digests[_repo_relative(root, parent_campaign_path)] = (
        EXPECTED_PARENT_CAMPAIGN_SHA256
    )
    input_digests[_repo_relative(root, parent_run_path)] = EXPECTED_PARENT_RUN_SHA256
    shard = 0
    for center in LEGAL_CENTERS:
        parent_path, parent, _producer, parent_wave = _load_parent_cell(
            input_root, center, variable_sha
        )
        parent_dir = parent_path.parent
        input_digests[_repo_relative(root, parent_path)] = parent["sha256"]
        for manifest_name in ("producer-manifest.json", "wave-manifest.json"):
            manifest_path = parent_dir / manifest_name
            input_digests[_repo_relative(root, manifest_path)] = _sha256_file(
                manifest_path
            )
        for category in _physical_categories(center):
            identifier = category_id(center, category)
            directory = output / "artifacts" / "cells" / identifier
            _mkdir_once(directory)
            cnf_path = directory / f"{identifier}.cnf"
            cnf = _cell_from_parent(parent_path, cnf_path, center, category, parent)
            producer = build_producer(
                center,
                category,
                cnf,
                source_sha,
                variable_sha,
                _repo_relative(root, source_path),
            )
            producer_path = directory / "producer-manifest.json"
            _write_once(producer_path, producer)
            wave = build_wave(
                center,
                category,
                cnf["sha256"],
                sha256_bytes(producer),
                shard,
                source_sha,
                variable_sha,
                parent["clauses"] + len(category_units(center, category)),
            )
            wave_path = directory / "wave-manifest.json"
            _write_once(wave_path, wave)
            cells.append(
                {
                    "cell_id": identifier,
                    "center": center,
                    "category": category,
                    "ordinal": shard,
                    "parent_wave_id": parent_wave["wave_id"],
                    "cnf": _file_ref(root, cnf_path, cnf["sha256"], cnf["bytes"]),
                    "producer_manifest": _ref(root, producer_path, producer),
                    "wave_manifest": _ref(root, wave_path, wave),
                    "claims": _claims(),
                }
            )
            shard += 1
    campaign = {
        "schema": CAMPAIGN_SCHEMA,
        "project": "erdos-97-96-formalization",
        "status": "PREPARED_LOCAL_ONLY",
        "claims": {
            "exact17_closed": False,
            "proof_verified": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        },
        "source": {
            "path": _repo_relative(root, source_path),
            "sha256": source_sha,
            "variable_map_path": _repo_relative(root, variable_map_path),
            "variable_map_sha256": variable_sha,
        },
        "cell_count": len(cells),
        "cells": cells,
    }
    campaign_bytes = canonical_json_bytes(campaign)
    campaign_path = output / "artifacts" / "campaign-manifest.json"
    _write_once(campaign_path, campaign_bytes)
    report = {
        "schema": SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "production_run": False,
        "cell_count": len(cells),
        "cells": [
            {
                "cell_id": item["cell_id"],
                "center": item["center"],
                "category": item["category"],
                "cnf_sha256": item["cnf"]["sha256"],
            }
            for item in cells
        ],
        "campaign_manifest": _ref(root, campaign_path, campaign_bytes),
        "claims": campaign["claims"],
    }
    report_bytes = canonical_json_bytes(report)
    report_path = output / "artifacts" / "preparation-report.json"
    _write_once(report_path, report_bytes)
    script_path = Path(__file__).resolve()
    source_digests = {
        _repo_relative(root, source_path): source_sha,
        _repo_relative(root, variable_map_path): variable_sha,
    }
    if script_path.is_relative_to(root):
        source_digests[_repo_relative(root, script_path)] = _sha256_file(script_path)
    run = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": "exact17-sparse-six-nextcenter-split-20260820",
        "run_id": "physical-slice-full-campaign-v1",
        "root": _repo_relative(root, output),
        "owner": "root",
        "base_head": "d345f28395500265068f6273884c04612f5e1945",
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": source_digests,
        "input_digests": input_digests,
        "created_utc": "2026-08-20T00:00:00Z",
    }
    run["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run))
    _write_once(output / "run_manifest.json", canonical_json_bytes(run))
    return report


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input-root", type=Path, default=INPUT_ROOT)
    parser.add_argument("--output-root", type=Path, required=True)
    args = parser.parse_args(argv)
    report = prepare_campaign(input_root=args.input_root, output_root=args.output_root)
    print(
        json.dumps(
            {"status": report["status"], "cell_count": report["cell_count"]},
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
