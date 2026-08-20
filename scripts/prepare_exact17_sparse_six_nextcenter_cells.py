"""Prepare immutable exact-17 sparse-six next-center DIMACS cell packages.

This is a preparation-only command.  It validates the authenticated parent,
creates one parent-plus-singleton-unit CNF for each legal next-center label,
and writes canonical producer, wave, campaign, report, and run-manifest
records.  It never contacts PIQD and never invokes a solver.
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
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-direct-convexfive-fullbank-20260820/"
    "sparse-six-fullbank-v1/artifacts/exact17-sparse-six-fullbank.cnf"
)
PARENT_PRODUCER_PATH = ROOT / (
    "scratch/runs/exact17-direct-convexfive-fullbank-20260820/"
    "sparse-six-fullbank-v1/artifacts/producer-manifest.json"
)
NEXTCENTER_SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointNextCenterCoverage.lean"
)
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
OUTPUT_ROOT = (
    ROOT / "scratch/runs/exact17-sparse-six-nextcenter-split-20260820/cell-campaign-v1"
)

PARENT_SHA256 = "ff41a77a3e6376583b52d378efc268203ad6bb400ed049d05488d6bdf3aef2ac"
PARENT_PRODUCER_SHA256 = (
    "8cf6cb7edcd51786cece857ff27f9219d43c777659b2b8e78bd7d8670d48d29d"
)
PARENT_BYTES = 346_273_431
PARENT_VARIABLES = 308
PARENT_CLAUSES = 7_409_253
NEXTCENTER_SOURCE_SHA256 = (
    "8a238af97422889581196f5ba479d6875c8350305f4ebe881c470bc26b8190d4"
)
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage."
    "sourceAssign_sparseSixPointNextCenterCell"
)
LEGAL_CENTERS = (0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16)
NUM_CELLS = len(LEGAL_CENTERS)
CELL_CLAUSES = PARENT_CLAUSES + 1
ORDER_SHA256 = sha256_bytes(b"exact17-sparse-six-nextcenter-order-v1")
BASE_HEAD = "d345f28395500265068f6273884c04612f5e1945"
RUN_CREATED_UTC = "2026-08-20T00:00:00Z"
SCHEMA = "p97-exact17-sparse-six-nextcenter-preparation/v1"
CAMPAIGN_SCHEMA = "p97-exact17-sparse-six-nextcenter-campaign/v1"
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
        metadata = os.lstat(path)
    except OSError as error:
        raise PreparationError(f"{label} is unavailable: {path}") from error
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise PreparationError(f"{label} must be a regular non-symlink file: {path}")


def _require_dir(path: Path, label: str) -> None:
    try:
        metadata = os.lstat(path)
    except OSError as error:
        raise PreparationError(f"{label} is unavailable: {path}") from error
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISDIR(metadata.st_mode):
        raise PreparationError(f"{label} must be a non-symlink directory: {path}")


def _mkdir_once(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)
    _require_dir(path, "output directory")


def _write_once(path: Path, payload: bytes) -> bool:
    """Create an artifact once, accepting only an exact byte replay."""

    if type(payload) is not bytes:
        raise PreparationError("artifact payload must be bytes")
    _require_dir(path.parent, "artifact parent")
    try:
        metadata = os.lstat(path)
    except FileNotFoundError:
        metadata = None
    except OSError as error:
        raise PreparationError(f"cannot inspect artifact: {path}") from error
    if metadata is not None:
        if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
            raise PreparationError(
                f"refusing to overwrite non-regular artifact: {path}"
            )
        if path.read_bytes() != payload:
            raise PreparationError(f"write-once artifact differs: {path}")
        return False
    try:
        with path.open("xb") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
    except FileExistsError:
        _require_regular(path, "raced artifact")
        if path.read_bytes() != payload:
            raise PreparationError(f"write-once artifact differs: {path}")
        return False
    return True


def _repo_relative(repo_root: Path, path: Path) -> str:
    try:
        return (
            path.resolve(strict=False)
            .relative_to(repo_root.resolve(strict=True))
            .as_posix()
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
        variables, clauses = int(fields[2]), int(fields[3])
    except ValueError as error:
        raise PreparationError(
            "parent DIMACS header counts are not integers"
        ) from error
    return variables, clauses


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
    path: Path = PARENT_PATH,
    *,
    expected_sha256: str = PARENT_SHA256,
    expected_bytes: int = PARENT_BYTES,
    expected_variables: int = PARENT_VARIABLES,
    expected_clauses: int = PARENT_CLAUSES,
) -> dict[str, Any]:
    """Stream-check parent identity, header, clause count, and literal range."""

    _require_regular(path, "parent CNF")
    digest = hashlib.sha256()
    byte_count = 0
    clause_count = 0
    header: bytes | None = None
    with path.open("rb") as handle:
        header = handle.readline()
        digest.update(header)
        byte_count += len(header)
        variables, clauses = _parent_header(header)
        if (variables, clauses) != (expected_variables, expected_clauses):
            raise PreparationError("parent DIMACS header dimensions drifted")
        for line in handle:
            digest.update(line)
            byte_count += len(line)
            _validate_clause(line, variables)
            clause_count += 1
    actual_sha = digest.hexdigest()
    if (actual_sha, byte_count, clause_count) != (
        expected_sha256,
        expected_bytes,
        expected_clauses,
    ):
        raise PreparationError(
            "parent CNF identity, byte count, or clause count drifted"
        )
    return {
        "sha256": actual_sha,
        "bytes": byte_count,
        "variables": variables,
        "clauses": clause_count,
        "header": header.decode("ascii").rstrip("\n"),
    }


def validate_external_inputs(
    *,
    parent_producer_path: Path,
    source_path: Path,
    variable_map_path: Path,
    expected_parent_producer_sha256: str,
    expected_source_sha256: str,
    expected_variable_map_sha256: str,
    expected_parent_sha256: str,
    expected_parent_variables: int,
    expected_parent_clauses: int,
) -> None:
    """Authenticate every file whose digest is asserted by a cell manifest."""

    expected = (
        (
            parent_producer_path,
            "parent producer manifest",
            expected_parent_producer_sha256,
        ),
        (source_path, "Lean source", expected_source_sha256),
        (variable_map_path, "variable map", expected_variable_map_sha256),
    )
    for path, label, digest in expected:
        _require_regular(path, label)
        if _sha256_file(path) != digest:
            raise PreparationError(f"{label} SHA-256 drifted")
    try:
        producer = json.loads(parent_producer_path.read_bytes())
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as error:
        raise PreparationError("parent producer manifest is not valid JSON") from error
    try:
        parent_binding = producer["cnf"]
        map_binding = producer["variable_map"]
    except (KeyError, TypeError) as error:
        raise PreparationError(
            "parent producer manifest lacks required bindings"
        ) from error
    if (
        parent_binding.get("sha256") != expected_parent_sha256
        or parent_binding.get("num_variables") != expected_parent_variables
        or parent_binding.get("num_clauses") != expected_parent_clauses
        or map_binding.get("sha256") != expected_variable_map_sha256
    ):
        raise PreparationError("parent producer manifest bindings drifted")


def cell_id(center: int) -> str:
    if type(center) is not int or center not in LEGAL_CENTERS:
        raise PreparationError(f"illegal next-center label: {center!r}")
    return f"next-center-{center:02d}"


def cell_cnf_bytes(
    parent: bytes, center: int, *, expected_variables: int = PARENT_VARIABLES
) -> bytes:
    """Build a cell from tiny injectable bytes; production uses the streaming writer."""

    if type(parent) is not bytes:
        raise PreparationError("parent must be bytes")
    first, separator, body = parent.partition(b"\n")
    if not separator:
        raise PreparationError("parent DIMACS header is missing")
    variables, clauses = _parent_header(first + separator)
    if variables != expected_variables:
        raise PreparationError("parent variable count drifted")
    if clauses < 0:
        raise PreparationError("parent clause count is negative")
    return (
        f"p cnf {variables} {clauses + 1}\n".encode("ascii")
        + body
        + f"{290 + center} 0\n".encode("ascii")
    )


def _verify_existing_cell(
    output_path: Path, parent_path: Path, center: int, parent: dict[str, Any]
) -> dict[str, Any]:
    digest = hashlib.sha256()
    parent_digest = hashlib.sha256()
    size = 0
    parent_size = 0
    with output_path.open("rb") as target, parent_path.open("rb") as source:
        source_header = source.readline()
        parent_digest.update(source_header)
        parent_size += len(source_header)
        variables, clauses = _parent_header(source_header)
        expected_header = f"p cnf {variables} {clauses + 1}\n".encode("ascii")
        actual_header = target.readline()
        if actual_header != expected_header:
            raise PreparationError(f"existing cell header differs: {output_path}")
        digest.update(actual_header)
        size += len(actual_header)
        for block in iter(lambda: source.read(1024 * 1024), b""):
            parent_digest.update(block)
            parent_size += len(block)
            actual = target.read(len(block))
            if actual != block:
                raise PreparationError(f"existing cell body differs: {output_path}")
            digest.update(actual)
            size += len(actual)
        unit = f"{290 + center} 0\n".encode("ascii")
        if target.read() != unit:
            raise PreparationError(f"existing cell unit differs: {output_path}")
        digest.update(unit)
        size += len(unit)
        if target.read(1):
            raise PreparationError(f"existing cell has trailing bytes: {output_path}")
    if (parent_digest.hexdigest(), parent_size) != (
        parent["sha256"],
        parent["bytes"],
    ):
        raise PreparationError("parent CNF changed during existing-cell validation")
    if size != parent["bytes"] - len(source_header) + len(expected_header) + len(unit):
        raise PreparationError(f"existing cell byte count differs: {output_path}")
    return {
        "path": output_path,
        "sha256": digest.hexdigest(),
        "bytes": size,
        "created": False,
    }


def _write_cell_cnf(
    parent_path: Path, output_path: Path, center: int, parent: dict[str, Any]
) -> dict[str, Any]:
    """Stream one package CNF, changing only the header and appending its unit."""

    _require_regular(parent_path, "parent CNF")
    _require_dir(output_path.parent, "cell artifact directory")
    if type(center) is not int or center not in LEGAL_CENTERS:
        raise PreparationError(f"illegal next-center label: {center!r}")
    try:
        metadata = os.lstat(output_path)
    except FileNotFoundError:
        metadata = None
    if metadata is not None:
        if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
            raise PreparationError(f"cell CNF is not a regular file: {output_path}")
        return _verify_existing_cell(output_path, parent_path, center, parent)

    candidate = output_path.with_name(f".{output_path.name}.candidate")
    if candidate.exists():
        raise PreparationError(f"unexpected stale cell candidate: {candidate}")
    digest = hashlib.sha256()
    parent_digest = hashlib.sha256()
    size = 0
    parent_size = 0
    with parent_path.open("rb") as source, candidate.open("xb") as target:
        header = source.readline()
        parent_digest.update(header)
        parent_size += len(header)
        variables, clauses = _parent_header(header)
        if (variables, clauses) != (parent["variables"], parent["clauses"]):
            raise PreparationError("parent header changed during cell preparation")
        replacement = f"p cnf {variables} {clauses + 1}\n".encode("ascii")
        target.write(replacement)
        digest.update(replacement)
        size += len(replacement)
        for block in iter(lambda: source.read(1024 * 1024), b""):
            parent_digest.update(block)
            parent_size += len(block)
            target.write(block)
            digest.update(block)
            size += len(block)
        unit = f"{290 + center} 0\n".encode("ascii")
        target.write(unit)
        digest.update(unit)
        size += len(unit)
        target.flush()
        os.fsync(target.fileno())
    if (parent_digest.hexdigest(), parent_size) != (
        parent["sha256"],
        parent["bytes"],
    ):
        candidate.unlink()
        raise PreparationError("parent CNF changed during cell creation")
    os.link(candidate, output_path)
    candidate.unlink()
    return {
        "path": output_path,
        "sha256": digest.hexdigest(),
        "bytes": size,
        "created": True,
    }


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


def _campaign_claims() -> dict[str, bool]:
    return {
        "exact17_closed": False,
        "proof_verified": False,
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
    }


def build_producer_manifest(
    center: int,
    cnf_sha256: str,
    cnf_bytes: int,
    *,
    num_variables: int = PARENT_VARIABLES,
    num_clauses: int = CELL_CLAUSES,
) -> bytes:
    identifier = cell_id(center)
    source = {
        "cardinality_scope": f"exactly 17 sparse-six source models in {identifier}",
        "claims": _source_claims(),
        "finite_schema": "p97-exact17-sparse-six-nextcenter-cell/v1",
        "schema": SOURCE_SCHEMA,
        "source_id": f"exact17-sparse-six-{identifier}",
        "source_path": "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSparseSixPointNextCenterCoverage.lean",
        "source_sha256": NEXTCENTER_SOURCE_SHA256,
        "source_theorem": SOURCE_THEOREM,
    }
    producer = {
        "backend": "cadical",
        "claims": _claims(),
        "producer_id": f"exact17-sparse-six-{identifier}-v1",
        "producer_kind": "static-dimacs",
        "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        "schema": PRODUCER_SCHEMA,
        "solver_profile": "unsat",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(canonical_json_bytes(source)),
        "variable_map_sha256": VARIABLE_MAP_SHA256,
    }
    return canonical_json_bytes(producer)


def build_wave_manifest(
    center: int,
    cnf_sha256: str,
    producer_sha256: str,
    shard_index: int,
    *,
    num_variables: int = PARENT_VARIABLES,
    num_clauses: int = CELL_CLAUSES,
) -> bytes:
    identifier = cell_id(center)
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": f"exact17-sparse-six-{identifier}-v1",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.ATailFrontierLiveClosure.card_eq_seventeen_secondCapNine",
            "ingress_hypotheses_sha256": NEXTCENTER_SOURCE_SHA256,
            "finite_schema": "p97-exact17-sparse-six-nextcenter-cell/v1",
            "cardinality_scope": f"exactly 17 physical-class points in the {identifier} cell",
            "source_theorem": SOURCE_THEOREM,
        },
        "encoding": {
            "cnf_sha256": cnf_sha256,
            "variable_map_sha256": VARIABLE_MAP_SHA256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": num_variables,
            "num_clauses": num_clauses,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": shard_index,
            "shard_count": NUM_CELLS,
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


def _reference(root: Path, path: Path, payload: bytes) -> dict[str, Any]:
    return {
        "path": _repo_relative(root, path),
        "sha256": sha256_bytes(payload),
        "bytes": len(payload),
    }


def _file_reference(root: Path, path: Path, sha256: str, size: int) -> dict[str, Any]:
    return {"path": _repo_relative(root, path), "sha256": sha256, "bytes": size}


def _write_empty_dir(path: Path) -> None:
    _mkdir_once(path)


def prepare_campaign(
    *,
    repo_root: Path = ROOT,
    parent_path: Path = PARENT_PATH,
    parent_producer_path: Path = PARENT_PRODUCER_PATH,
    source_path: Path = NEXTCENTER_SOURCE_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    output_root: Path = OUTPUT_ROOT,
    expected_parent_sha256: str = PARENT_SHA256,
    expected_parent_bytes: int = PARENT_BYTES,
    expected_parent_variables: int = PARENT_VARIABLES,
    expected_parent_clauses: int = PARENT_CLAUSES,
    expected_parent_producer_sha256: str = PARENT_PRODUCER_SHA256,
    expected_source_sha256: str = NEXTCENTER_SOURCE_SHA256,
    expected_variable_map_sha256: str = VARIABLE_MAP_SHA256,
) -> dict[str, Any]:
    """Prepare all thirteen cells; all identity inputs are injectable for tests."""

    root = repo_root.resolve(strict=True)
    output = output_root.resolve(strict=False)
    try:
        output.relative_to(root)
    except ValueError as error:
        raise PreparationError("output root must be inside repo_root") from error
    validate_external_inputs(
        parent_producer_path=parent_producer_path,
        source_path=source_path,
        variable_map_path=variable_map_path,
        expected_parent_producer_sha256=expected_parent_producer_sha256,
        expected_source_sha256=expected_source_sha256,
        expected_variable_map_sha256=expected_variable_map_sha256,
        expected_parent_sha256=expected_parent_sha256,
        expected_parent_variables=expected_parent_variables,
        expected_parent_clauses=expected_parent_clauses,
    )
    _mkdir_once(output)
    for name in ("artifacts", "events", "tmp"):
        _mkdir_once(output / name)
    parent = inspect_parent(
        parent_path,
        expected_sha256=expected_parent_sha256,
        expected_bytes=expected_parent_bytes,
        expected_variables=expected_parent_variables,
        expected_clauses=expected_parent_clauses,
    )
    if expected_parent_variables != PARENT_VARIABLES:
        raise PreparationError(
            "cell packages require the authenticated 308-variable map"
        )
    cells: list[dict[str, Any]] = []
    for index, center in enumerate(LEGAL_CENTERS):
        identifier = cell_id(center)
        directory = output / "artifacts" / "cells" / identifier
        _mkdir_once(directory)
        cnf_path = directory / f"{identifier}.cnf"
        cnf_info = _write_cell_cnf(parent_path, cnf_path, center, parent)
        producer = build_producer_manifest(
            center,
            cnf_info["sha256"],
            cnf_info["bytes"],
            num_variables=parent["variables"],
            num_clauses=parent["clauses"] + 1,
        )
        producer_path = directory / "producer-manifest.json"
        _write_once(producer_path, producer)
        wave = build_wave_manifest(
            center,
            cnf_info["sha256"],
            sha256_bytes(producer),
            index,
            num_variables=parent["variables"],
            num_clauses=parent["clauses"] + 1,
        )
        wave_path = directory / "wave-manifest.json"
        _write_once(wave_path, wave)
        cells.append(
            {
                "cell_id": identifier,
                "center": center,
                "assumptions": [290 + center],
                "ordinal": index,
                "cnf": _file_reference(
                    root, cnf_path, cnf_info["sha256"], cnf_info["bytes"]
                ),
                "producer_manifest": _reference(root, producer_path, producer),
                "wave_manifest": _reference(root, wave_path, wave),
                "claims": _campaign_claims(),
            }
        )
    campaign = {
        "schema": CAMPAIGN_SCHEMA,
        "project": "erdos-97-96-formalization",
        "status": "PREPARED_LOCAL_ONLY",
        "claims": _campaign_claims(),
        "parent": {
            "path": _repo_relative(root, parent_path),
            "sha256": parent["sha256"],
            "producer_manifest_sha256": PARENT_PRODUCER_SHA256,
            "bytes": parent["bytes"],
            "num_variables": parent["variables"],
            "num_clauses": parent["clauses"],
        },
        "source_theorem": SOURCE_THEOREM,
        "legal_centers": list(LEGAL_CENTERS),
        "cell_count": NUM_CELLS,
        "cells": cells,
    }
    campaign_bytes = canonical_json_bytes(campaign)
    campaign_path = output / "artifacts" / "campaign-manifest.json"
    _write_once(campaign_path, campaign_bytes)
    report = {
        "schema": SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "production_run": False,
        "parent": parent,
        "cell_count": NUM_CELLS,
        "cells": [
            {
                "cell_id": item["cell_id"],
                "center": item["center"],
                "cnf_sha256": item["cnf"]["sha256"],
                "cnf_bytes": item["cnf"]["bytes"],
            }
            for item in cells
        ],
        "campaign_manifest": _reference(root, campaign_path, campaign_bytes),
        "claims": _campaign_claims(),
    }
    report_bytes = canonical_json_bytes(report)
    report_path = output / "artifacts" / "preparation-report.json"
    _write_once(report_path, report_bytes)
    source_script = Path(__file__).resolve()
    source_digests = (
        {_repo_relative(root, source_script): _sha256_file(source_script)}
        if source_script.is_relative_to(root)
        else {}
    )
    run_manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": "exact17-sparse-six-nextcenter-split-20260820",
        "run_id": "cell-campaign-v1",
        "root": _repo_relative(root, output),
        "owner": "root",
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": source_digests,
        "input_digests": {_repo_relative(root, parent_path): parent["sha256"]},
        "created_utc": RUN_CREATED_UTC,
    }
    run_manifest["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run_manifest))
    _write_once(output / "run_manifest.json", canonical_json_bytes(run_manifest))
    return report


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-root", type=Path, default=OUTPUT_ROOT)
    args = parser.parse_args(argv)
    report = prepare_campaign(output_root=args.output_root)
    print(
        json.dumps(
            {
                "status": report["status"],
                "cell_count": report["cell_count"],
                "campaign": report["campaign_manifest"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
