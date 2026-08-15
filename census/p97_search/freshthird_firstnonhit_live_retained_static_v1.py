"""Authenticated one-wave runner for the live FreshThird retained packet.

The runner is intentionally discovery-only.  It records all 24 constructor
and global-row-origin cells, binds the exact source and encoder bytes, stores
the complete SMT query and abstract assignment, and independently replays
every SAT assignment.  It also solves both polarities of a fixed retained-row
predicate panel; forced/refuted classifications apply only to this finite
packet.  No result from this module is a Lean theorem or a general-cardinality
closure certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import subprocess
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

from census.p97_search import freshthird_firstnonhit_live_retained_v1 as packet

RUN_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-run/v1"
CELL_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-cell/v1"
PROBE_SCHEMA = "p97-freshthird-firstnonhit-live-retained-counterfactual/v1"
DEFAULT_RUN_PARENT = (
    packet.REPO_ROOT / "scratch/runs/freshthird-firstnonhit-live-retained-v1"
)
RUNNER_RELATIVE = "census/p97_search/freshthird_firstnonhit_live_retained_static_v1.py"
ENCODER_RELATIVE = "census/p97_search/freshthird_firstnonhit_live_retained_v1.py"
TEST_RELATIVES = (
    "census/p97_search/tests/test_freshthird_firstnonhit_live_retained_v1.py",
    "census/p97_search/tests/test_freshthird_firstnonhit_live_retained_static_v1.py",
)


class StaticRunnerError(RuntimeError):
    """Raised when custody, execution, or replay fails closed."""


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(value, allow_nan=False, sort_keys=True, separators=(",", ":")) + "\n"
    ).encode()


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _atomic_write(path: Path, payload: bytes) -> str:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    with temporary.open("xb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)
    return _sha256_bytes(payload)


def _atomic_json(path: Path, value: object) -> str:
    return _atomic_write(path, _canonical_json(value))


def _read_canonical_json(path: Path, description: str) -> dict[str, object]:
    if path.is_symlink() or not path.is_file():
        raise StaticRunnerError(f"{description} is not a regular file")
    payload = path.read_bytes()
    try:
        value = json.loads(payload, parse_constant=_reject_json_constant)
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StaticRunnerError(f"{description} is not valid JSON") from exc
    if not isinstance(value, dict):
        raise StaticRunnerError(f"{description} must be a JSON object")
    if _canonical_json(value) != payload:
        raise StaticRunnerError(f"{description} is not canonical JSON")
    return value


def _git(args: Sequence[str]) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=packet.REPO_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return completed.stdout.strip()


def _git_bytes(args: Sequence[str]) -> bytes:
    completed = subprocess.run(
        ["git", *args],
        cwd=packet.REPO_ROOT,
        check=True,
        capture_output=True,
    )
    return completed.stdout


def _git_blob_oid(payload: bytes) -> str:
    completed = subprocess.run(
        ["git", "hash-object", "--stdin"],
        cwd=packet.REPO_ROOT,
        check=True,
        input=payload,
        capture_output=True,
        text=False,
    )
    return completed.stdout.decode("ascii").strip()


def _index_blob_oid(relative: str) -> str | None:
    output = _git(["ls-files", "--stage", "--", relative])
    if not output:
        return None
    lines = output.splitlines()
    if len(lines) != 1:
        raise StaticRunnerError(f"source has noncanonical index stages: {relative}")
    metadata, indexed_path = lines[0].split("\t", 1)
    _mode, oid, stage = metadata.split()
    if stage != "0" or indexed_path != relative:
        raise StaticRunnerError(f"source has noncanonical index entry: {relative}")
    return oid


def _snapshot_paths() -> tuple[str, ...]:
    return tuple(
        dict.fromkeys(
            (*packet.SOURCE_FILES, ENCODER_RELATIVE, RUNNER_RELATIVE, *TEST_RELATIVES)
        )
    )


def _source_snapshot() -> dict[str, object]:
    rows: list[dict[str, object]] = []
    for relative in _snapshot_paths():
        path = _validated_source_path(relative)
        payload = path.read_bytes()
        status = _git(["status", "--porcelain=v1", "--", relative])
        rows.append(
            {
                "path": relative,
                "sha256": _sha256_bytes(payload),
                "size": len(payload),
                "git_blob_oid": _git_blob_oid(payload),
                "index_blob_oid": _index_blob_oid(relative),
                "git_status": status,
                "clean": not bool(status),
            }
        )
    snapshot: dict[str, object] = {
        "git_head": _git(["rev-parse", "HEAD"]),
        "files": rows,
    }
    snapshot["source_content_sha256"] = _source_content_sha256(snapshot)
    snapshot["snapshot_sha256"] = _sha256_bytes(_canonical_json(snapshot))
    return snapshot


def _source_content_sha256(snapshot: Mapping[str, object]) -> str:
    rows = snapshot.get("files")
    if not isinstance(rows, list):
        raise StaticRunnerError("source snapshot files must be a list")
    content_rows: list[dict[str, object]] = []
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        relative = row.get("path")
        digest = row.get("sha256")
        size = row.get("size")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or type(size) is not int
        ):
            raise StaticRunnerError("source snapshot row is malformed")
        content_rows.append({"path": relative, "sha256": digest, "size": size})
    return _sha256_bytes(_canonical_json(content_rows))


def _snapshot_file_bindings(
    snapshot: Mapping[str, object],
) -> dict[str, tuple[str, int]]:
    rows = snapshot.get("files")
    if not isinstance(rows, list):
        raise StaticRunnerError("source snapshot files must be a list")
    bindings: dict[str, tuple[str, int]] = {}
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        relative = row.get("path")
        digest = row.get("sha256")
        size = row.get("size")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or type(size) is not int
            or relative in bindings
        ):
            raise StaticRunnerError("source snapshot row is malformed")
        bindings[relative] = (digest, size)
    return bindings


def _validate_packet_manifest_source_binding(
    packet_manifest: Mapping[str, object], snapshot: Mapping[str, object]
) -> None:
    source_files = packet_manifest.get("source_files")
    if not isinstance(source_files, Mapping):
        raise StaticRunnerError("encoding manifest source files are malformed")
    if set(source_files) != set(packet.SOURCE_FILES):
        raise StaticRunnerError("encoding manifest source path set mismatch")
    bindings = _snapshot_file_bindings(snapshot)
    for relative in packet.SOURCE_FILES:
        binding = bindings.get(relative)
        if binding is None or source_files.get(relative) != binding[0]:
            raise StaticRunnerError(
                f"encoding manifest source binding mismatch: {relative}"
            )


def _validate_snapshot_self_hash(snapshot: Mapping[str, object]) -> None:
    if set(snapshot) != {
        "git_head",
        "files",
        "source_content_sha256",
        "snapshot_sha256",
    }:
        raise StaticRunnerError("source snapshot fields are malformed")
    claimed = snapshot.get("snapshot_sha256")
    if not isinstance(claimed, str):
        raise StaticRunnerError("source snapshot digest is missing")
    body = dict(snapshot)
    del body["snapshot_sha256"]
    if _sha256_bytes(_canonical_json(body)) != claimed:
        raise StaticRunnerError("source snapshot digest mismatch")
    git_head = snapshot.get("git_head")
    if (
        not isinstance(git_head, str)
        or len(git_head) != 40
        or any(character not in "0123456789abcdef" for character in git_head)
    ):
        raise StaticRunnerError("source snapshot git head is malformed")
    try:
        _git(["cat-file", "-e", f"{git_head}^{{commit}}"])
    except subprocess.CalledProcessError as exc:
        raise StaticRunnerError("captured git head is not a local commit") from exc
    rows = snapshot.get("files")
    if not isinstance(rows, list):
        raise StaticRunnerError("source snapshot files must be a list")
    expected_paths = list(_snapshot_paths())
    actual_paths: list[str] = []
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        if set(row) != {
            "path",
            "sha256",
            "size",
            "git_blob_oid",
            "index_blob_oid",
            "git_status",
            "clean",
        }:
            raise StaticRunnerError("source snapshot row fields are malformed")
        relative = row.get("path")
        digest = row.get("sha256")
        size = row.get("size")
        git_blob_oid = row.get("git_blob_oid")
        index_blob_oid = row.get("index_blob_oid")
        git_status = row.get("git_status")
        clean = row.get("clean")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or len(digest) != 64
            or any(character not in "0123456789abcdef" for character in digest)
            or type(size) is not int
            or size < 0
            or not isinstance(git_blob_oid, str)
            or len(git_blob_oid) != 40
            or any(character not in "0123456789abcdef" for character in git_blob_oid)
            or (
                index_blob_oid is not None
                and (
                    not isinstance(index_blob_oid, str)
                    or len(index_blob_oid) != 40
                    or any(
                        character not in "0123456789abcdef"
                        for character in index_blob_oid
                    )
                )
            )
            or not isinstance(git_status, str)
            or not isinstance(clean, bool)
            or clean != (git_status == "")
        ):
            raise StaticRunnerError("source snapshot row is malformed")
        actual_paths.append(relative)
        if clean:
            try:
                committed = _git_bytes(["show", f"{git_head}:{relative}"])
            except subprocess.CalledProcessError as exc:
                raise StaticRunnerError(
                    f"clean source is absent from captured commit: {relative}"
                ) from exc
            if _sha256_bytes(committed) != digest or len(committed) != size:
                raise StaticRunnerError(
                    f"clean source differs from captured commit: {relative}"
                )
            if (
                _git_blob_oid(committed) != git_blob_oid
                or index_blob_oid != git_blob_oid
            ):
                raise StaticRunnerError(
                    f"clean source Git-blob binding mismatch: {relative}"
                )
    if actual_paths != expected_paths:
        raise StaticRunnerError("source snapshot path set or order mismatch")
    content_digest = snapshot.get("source_content_sha256")
    if not isinstance(content_digest, str) or content_digest != _source_content_sha256(
        snapshot
    ):
        raise StaticRunnerError("source content digest mismatch")


def _reject_symlink_ancestors(path: Path) -> None:
    for candidate in (path, *path.parents):
        if candidate.is_symlink():
            raise StaticRunnerError(f"path has a symlinked ancestor: {candidate}")


def _validated_source_path(relative: str) -> Path:
    relative_path = Path(relative)
    if relative_path.is_absolute() or ".." in relative_path.parts:
        raise StaticRunnerError(f"source path is not repository-relative: {relative}")
    candidate = packet.REPO_ROOT / relative_path
    _reject_symlink_ancestors(candidate)
    try:
        resolved = candidate.resolve(strict=True)
        resolved.relative_to(packet.REPO_ROOT.resolve(strict=True))
    except (FileNotFoundError, ValueError) as exc:
        raise StaticRunnerError(f"source path escapes repository: {relative}") from exc
    if not resolved.is_file():
        raise StaticRunnerError(f"source path is not a regular file: {relative}")
    return resolved


def _validate_output_root(output_dir: Path, allow_test_output: bool) -> Path:
    if output_dir.exists() or output_dir.is_symlink():
        raise StaticRunnerError("output directory must not already exist")
    resolved_parent = output_dir.parent.resolve()
    _reject_symlink_ancestors(output_dir.parent)
    if not allow_test_output:
        try:
            resolved_parent.relative_to(DEFAULT_RUN_PARENT.resolve())
        except ValueError as exc:
            raise StaticRunnerError(
                f"production output must be under {DEFAULT_RUN_PARENT}"
            ) from exc
    return output_dir


def plan_wave() -> list[dict[str, object]]:
    """Return the explicit stable 24-cell plan."""
    cells: list[dict[str, object]] = []
    for index, (nonhit, interaction, origin) in enumerate(
        itertools.product(
            packet.NONHIT_BRANCHES,
            packet.INTERACTION_BRANCHES,
            packet.ORIGIN_BRANCHES,
        )
    ):
        cells.append(
            {
                "cell_id": f"{index:02d}",
                "nonhit": nonhit,
                "interaction": interaction,
                "origin": origin,
            }
        )
    if len(cells) != 24 or len({row["cell_id"] for row in cells}) != 24:
        raise StaticRunnerError("live retained plan is not exactly 24 unique cells")
    return cells


def _aggregate_status(statuses: Sequence[str]) -> str:
    if not statuses:
        raise StaticRunnerError("cannot aggregate an empty cell plan")
    unsupported = set(statuses) - {"SAT_ABSTRACTION", "UNSAT_RELAXATION"}
    if unsupported:
        raise StaticRunnerError(f"unsupported cell statuses: {sorted(unsupported)}")
    if all(status == "SAT_ABSTRACTION" for status in statuses):
        return "SAT_ABSTRACTION"
    if all(status == "UNSAT_RELAXATION" for status in statuses):
        return "UNSAT_RELAXATION"
    return "MIXED_RELAXATION"


def _source_archive(
    artifacts: Path, snapshot: Mapping[str, object]
) -> dict[str, object]:
    files = snapshot.get("files")
    if not isinstance(files, list):
        raise StaticRunnerError("source snapshot is missing files")
    archived: list[dict[str, object]] = []
    for row in files:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        relative = row.get("path")
        expected = row.get("sha256")
        if not isinstance(relative, str) or not isinstance(expected, str):
            raise StaticRunnerError("source snapshot row is malformed")
        source_path = _validated_source_path(relative)
        payload = source_path.read_bytes()
        expected_size = row.get("size")
        expected_blob_oid = row.get("git_blob_oid")
        if (
            _sha256_bytes(payload) != expected
            or len(payload) != expected_size
            or _git_blob_oid(payload) != expected_blob_oid
        ):
            raise StaticRunnerError(f"source changed before archive: {relative}")
        archive_path = artifacts / "source-snapshot" / relative
        digest = _atomic_write(archive_path, payload)
        archived.append(
            {
                "path": relative,
                "archive_path": archive_path.relative_to(artifacts).as_posix(),
                "sha256": digest,
                "size": len(payload),
                "git_blob_oid": expected_blob_oid,
            }
        )
    archive_manifest = {
        "schema": f"{RUN_SCHEMA}/source-archive",
        "source_snapshot_sha256": snapshot["snapshot_sha256"],
        "archived": archived,
    }
    _atomic_json(artifacts / "source-snapshot" / "manifest.json", archive_manifest)
    return archive_manifest


def _solver_identity() -> dict[str, object]:
    module_path = Path(z3.__file__).resolve()
    return {
        "name": "z3py",
        "version": z3.get_version_string(),
        "module_path": str(module_path),
        "module_sha256": _sha256_file(module_path),
    }


def _query_bytes(solver: z3.Solver) -> bytes:
    return ("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n").encode()


def _counterfactual_classification(
    base_status: str, true_status: str, false_status: str
) -> str:
    pair = (true_status, false_status)
    if base_status == "UNSAT_RELAXATION":
        if pair != ("UNSAT_RELAXATION", "UNSAT_RELAXATION"):
            raise StaticRunnerError("UNSAT base has a SAT counterfactual")
        return "BASE_UNSAT"
    if base_status != "SAT_ABSTRACTION":
        raise StaticRunnerError(f"unsupported base status: {base_status}")
    if pair == ("SAT_ABSTRACTION", "SAT_ABSTRACTION"):
        return "UNDETERMINED_IN_FINITE_PACKET"
    if pair == ("SAT_ABSTRACTION", "UNSAT_RELAXATION"):
        return "FORCED_TRUE_IN_FINITE_PACKET"
    if pair == ("UNSAT_RELAXATION", "SAT_ABSTRACTION"):
        return "FORCED_FALSE_IN_FINITE_PACKET"
    raise StaticRunnerError("SAT base has two UNSAT counterfactuals")


def _predicate_summary(
    results: Sequence[Mapping[str, object]],
) -> list[dict[str, object]]:
    classifications = (
        "FORCED_TRUE_IN_FINITE_PACKET",
        "FORCED_FALSE_IN_FINITE_PACKET",
        "UNDETERMINED_IN_FINITE_PACKET",
        "BASE_UNSAT",
    )
    counts = {
        str(row["id"]): {classification: 0 for classification in classifications}
        for row in packet.SYNCHRONIZATION_PREDICATES
    }
    for result in results:
        rows = result.get("counterfactuals")
        if not isinstance(rows, list):
            raise StaticRunnerError("cell counterfactual summary is malformed")
        for row in rows:
            if not isinstance(row, Mapping):
                raise StaticRunnerError("counterfactual summary must be an object")
            predicate_name = row.get("predicate")
            classification = row.get("classification")
            if (
                not isinstance(predicate_name, str)
                or predicate_name not in counts
                or not isinstance(classification, str)
                or classification not in counts[predicate_name]
            ):
                raise StaticRunnerError("counterfactual classification is malformed")
            counts[predicate_name][classification] += 1
    return [
        {"predicate": str(row["id"]), "classifications": counts[str(row["id"])]}
        for row in packet.SYNCHRONIZATION_PREDICATES
    ]


def _counterfactual_result(
    cell: Mapping[str, object],
    predicate_name: str,
    required_value: bool,
    cell_dir: Path,
    source_snapshot: Mapping[str, object],
    encoding_manifest_sha256: str,
    solver_identity: Mapping[str, object],
) -> dict[str, object]:
    solver, context = packet.build_packet(
        str(cell["nonhit"]), str(cell["interaction"]), str(cell["origin"])
    )
    predicates = packet.synchronization_predicates(context)
    if predicate_name not in predicates:
        raise StaticRunnerError(f"unknown counterfactual predicate: {predicate_name}")
    polarity = "true" if required_value else "false"
    probe_dir = cell_dir / "counterfactuals" / predicate_name / polarity
    predicate = predicates[predicate_name]
    solver.add(predicate if required_value else z3.Not(predicate))
    query_payload = _query_bytes(solver)
    query_sha256 = _atomic_write(probe_dir / "query.smt2", query_payload)
    check = solver.check()
    if check == z3.sat:
        signature = packet.validate_model(solver.model(), context)
        packet.replay_signature(
            signature,
            required_predicate=predicate_name,
            required_value=required_value,
        )
        status = "SAT_ABSTRACTION"
    elif check == z3.unsat:
        signature = None
        status = "UNSAT_RELAXATION"
    else:
        raise StaticRunnerError(
            f"counterfactual solver returned nonterminal status: {cell} "
            f"{predicate_name}={required_value}"
        )
    result: dict[str, object] = {
        "schema": PROBE_SCHEMA,
        "cell": dict(cell),
        "predicate": predicate_name,
        "required_value": required_value,
        "status": status,
        "signature": signature,
        "query_sha256": query_sha256,
        "query_size": len(query_payload),
        "source_snapshot_sha256": source_snapshot["snapshot_sha256"],
        "encoding_manifest_sha256": encoding_manifest_sha256,
        "solver": dict(solver_identity),
        "false_claims": packet.FALSE_CLAIMS,
    }
    result["result_sha256"] = _sha256_bytes(_canonical_json(result))
    _atomic_json(probe_dir / "result.json", result)
    return result


def _cell_result(
    cell: Mapping[str, object],
    artifacts: Path,
    source_snapshot: Mapping[str, object],
    encoding_manifest_sha256: str,
    solver_identity: Mapping[str, object],
) -> dict[str, object]:
    nonhit = str(cell["nonhit"])
    interaction = str(cell["interaction"])
    origin = str(cell["origin"])
    solver, context = packet.build_packet(nonhit, interaction, origin)
    query_payload = _query_bytes(solver)
    cell_dir = artifacts / f"cell-{cell['cell_id']}"
    query_sha256 = _atomic_write(cell_dir / "query.smt2", query_payload)
    check = solver.check()
    if check == z3.sat:
        signature = packet.validate_model(solver.model(), context)
        packet.replay_signature(signature)
        status = "SAT_ABSTRACTION"
    elif check == z3.unsat:
        signature = None
        status = "UNSAT_RELAXATION"
    else:
        raise StaticRunnerError(f"solver returned nonterminal status for cell {cell}")
    counterfactuals: list[dict[str, object]] = []
    for predicate_row in packet.SYNCHRONIZATION_PREDICATES:
        predicate_name = str(predicate_row["id"])
        true_result = _counterfactual_result(
            cell,
            predicate_name,
            True,
            cell_dir,
            source_snapshot,
            encoding_manifest_sha256,
            solver_identity,
        )
        false_result = _counterfactual_result(
            cell,
            predicate_name,
            False,
            cell_dir,
            source_snapshot,
            encoding_manifest_sha256,
            solver_identity,
        )
        counterfactuals.append(
            {
                "predicate": predicate_name,
                "classification": _counterfactual_classification(
                    status,
                    str(true_result["status"]),
                    str(false_result["status"]),
                ),
                "true_status": true_result["status"],
                "false_status": false_result["status"],
                "true_result_sha256": true_result["result_sha256"],
                "false_result_sha256": false_result["result_sha256"],
            }
        )
    result: dict[str, object] = {
        "schema": CELL_SCHEMA,
        "cell": dict(cell),
        "status": status,
        "signature": signature,
        "query_sha256": query_sha256,
        "query_size": len(query_payload),
        "source_snapshot_sha256": source_snapshot["snapshot_sha256"],
        "encoding_manifest_sha256": encoding_manifest_sha256,
        "solver": dict(solver_identity),
        "false_claims": packet.FALSE_CLAIMS,
        "counterfactuals": counterfactuals,
    }
    result["result_sha256"] = _sha256_bytes(_canonical_json(result))
    _atomic_json(cell_dir / "result.json", result)
    return result


def _artifact_inventory(artifacts: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for path in sorted(artifacts.rglob("*")):
        if path.is_symlink():
            raise StaticRunnerError(f"artifact is a symlink: {path}")
        if not path.is_file():
            continue
        rows.append(
            {
                "path": path.relative_to(artifacts).as_posix(),
                "sha256": _sha256_file(path),
                "size": path.stat().st_size,
            }
        )
    return rows


def run_wave(output_dir: Path, allow_test_output: bool = False) -> dict[str, object]:
    """Execute exactly one authenticated 24-cell discovery wave."""
    output_dir = _validate_output_root(Path(output_dir), allow_test_output)
    source_snapshot = _source_snapshot()
    _validate_snapshot_self_hash(source_snapshot)
    output_dir.mkdir(parents=True)
    artifacts = output_dir / "artifacts"
    artifacts.mkdir()
    packet_manifest = packet.manifest()
    _validate_packet_manifest_source_binding(packet_manifest, source_snapshot)
    packet_manifest_sha256 = _atomic_json(
        artifacts / "encoding-manifest.json", packet_manifest
    )
    _source_archive(artifacts, source_snapshot)
    solver_identity = _solver_identity()
    cells = plan_wave()
    results = [
        _cell_result(
            cell,
            artifacts,
            source_snapshot,
            packet_manifest_sha256,
            solver_identity,
        )
        for cell in cells
    ]
    post_snapshot = _source_snapshot()
    _validate_snapshot_self_hash(post_snapshot)
    if post_snapshot["snapshot_sha256"] != source_snapshot["snapshot_sha256"]:
        raise StaticRunnerError("source or Git state drifted during the wave")
    statuses = [str(result["status"]) for result in results]
    aggregate = _aggregate_status(statuses)
    run_manifest: dict[str, object] = {
        "schema": RUN_SCHEMA,
        "packet_schema": packet.SCHEMA,
        "status": aggregate,
        "promotion_ready": False,
        "cell_plan": cells,
        "cell_results": [
            {
                "cell_id": result["cell"]["cell_id"],
                "status": result["status"],
                "result_sha256": result["result_sha256"],
            }
            for result in results
        ],
        "predicate_panel": list(packet.SYNCHRONIZATION_PREDICATES),
        "predicate_summary": _predicate_summary(results),
        "counterfactual_contract": packet.COUNTERFACTUAL_CONTRACT,
        "source_snapshot": source_snapshot,
        "postflight_source_snapshot_sha256": post_snapshot["snapshot_sha256"],
        "postflight_source_content_sha256": post_snapshot["source_content_sha256"],
        "encoding_manifest_sha256": packet_manifest_sha256,
        "solver": solver_identity,
        "artifact_inventory": _artifact_inventory(artifacts),
        "false_claims": packet.FALSE_CLAIMS,
        "scope": "live retained arm packet only; not full FirstNonHit",
    }
    run_manifest["run_manifest_sha256"] = _sha256_bytes(_canonical_json(run_manifest))
    _atomic_json(output_dir / "run_manifest.json", run_manifest)
    return run_manifest


def _validate_self_hash(value: Mapping[str, object], field: str) -> None:
    claimed = value.get(field)
    if not isinstance(claimed, str):
        raise StaticRunnerError(f"missing {field}")
    body = dict(value)
    del body[field]
    if _sha256_bytes(_canonical_json(body)) != claimed:
        raise StaticRunnerError(f"{field} mismatch")


def _require_exact_fields(
    value: Mapping[str, object], expected: set[str], description: str
) -> None:
    if set(value) != expected:
        raise StaticRunnerError(f"{description} fields are malformed")


def _validate_signature_cell(
    signature: Mapping[str, object], cell: Mapping[str, object]
) -> None:
    for field in ("nonhit", "interaction", "origin"):
        if signature.get(field) != cell.get(field):
            raise StaticRunnerError(f"SAT signature {field} differs from outer cell")


def _validate_counterfactual_result(
    artifacts: Path,
    cell: Mapping[str, object],
    predicate_name: str,
    required_value: bool,
    source_snapshot: Mapping[str, object],
    encoding_manifest_sha256: object,
    solver_identity: Mapping[str, object],
) -> dict[str, object]:
    polarity = "true" if required_value else "false"
    probe_dir = (
        artifacts
        / f"cell-{cell['cell_id']}"
        / "counterfactuals"
        / predicate_name
        / polarity
    )
    result = _read_canonical_json(probe_dir / "result.json", "counterfactual result")
    _require_exact_fields(
        result,
        {
            "schema",
            "cell",
            "predicate",
            "required_value",
            "status",
            "signature",
            "query_sha256",
            "query_size",
            "source_snapshot_sha256",
            "encoding_manifest_sha256",
            "solver",
            "false_claims",
            "result_sha256",
        },
        "counterfactual result",
    )
    _validate_self_hash(result, "result_sha256")
    if result.get("schema") != PROBE_SCHEMA:
        raise StaticRunnerError("counterfactual schema mismatch")
    if result.get("cell") != cell:
        raise StaticRunnerError("counterfactual cell mismatch")
    if result.get("predicate") != predicate_name:
        raise StaticRunnerError("counterfactual predicate mismatch")
    if result.get("required_value") is not required_value:
        raise StaticRunnerError("counterfactual polarity mismatch")
    if result.get("source_snapshot_sha256") != source_snapshot.get("snapshot_sha256"):
        raise StaticRunnerError("counterfactual source binding mismatch")
    if result.get("encoding_manifest_sha256") != encoding_manifest_sha256:
        raise StaticRunnerError("counterfactual encoding binding mismatch")
    if result.get("solver") != solver_identity:
        raise StaticRunnerError("counterfactual solver identity mismatch")
    if result.get("false_claims") != packet.FALSE_CLAIMS:
        raise StaticRunnerError("counterfactual false-claim boundary mismatch")
    solver, context = packet.build_packet(
        str(cell["nonhit"]), str(cell["interaction"]), str(cell["origin"])
    )
    predicates = packet.synchronization_predicates(context)
    if predicate_name not in predicates:
        raise StaticRunnerError("counterfactual predicate is not in the packet panel")
    predicate = predicates[predicate_name]
    solver.add(predicate if required_value else z3.Not(predicate))
    query_payload = _query_bytes(solver)
    query_path = probe_dir / "query.smt2"
    _reject_symlink_ancestors(query_path)
    if query_path.is_symlink() or not query_path.is_file():
        raise StaticRunnerError("counterfactual query is invalid")
    if query_path.read_bytes() != query_payload:
        raise StaticRunnerError("counterfactual query differs from fresh encoding")
    if result.get("query_sha256") != _sha256_bytes(query_payload):
        raise StaticRunnerError("counterfactual query digest mismatch")
    if result.get("query_size") != len(query_payload):
        raise StaticRunnerError("counterfactual query size mismatch")
    check = solver.check()
    status = result.get("status")
    if status == "SAT_ABSTRACTION":
        if check != z3.sat:
            raise StaticRunnerError("SAT counterfactual does not replay as SAT")
        signature = result.get("signature")
        if not isinstance(signature, Mapping):
            raise StaticRunnerError("SAT counterfactual signature is missing")
        _validate_signature_cell(signature, cell)
        packet.replay_signature(
            signature,
            required_predicate=predicate_name,
            required_value=required_value,
        )
    elif status == "UNSAT_RELAXATION":
        if check != z3.unsat:
            raise StaticRunnerError("UNSAT counterfactual does not replay as UNSAT")
        if result.get("signature") is not None:
            raise StaticRunnerError("UNSAT counterfactual unexpectedly has a signature")
    else:
        raise StaticRunnerError(f"unsupported counterfactual status: {status}")
    return result


def _validate_source_archive(
    artifacts: Path, source_snapshot: Mapping[str, object]
) -> None:
    archive = _read_canonical_json(
        artifacts / "source-snapshot" / "manifest.json", "source archive manifest"
    )
    if archive.get("schema") != f"{RUN_SCHEMA}/source-archive":
        raise StaticRunnerError("source archive schema mismatch")
    if set(archive) != {"schema", "source_snapshot_sha256", "archived"}:
        raise StaticRunnerError("source archive fields are malformed")
    if archive.get("source_snapshot_sha256") != source_snapshot.get("snapshot_sha256"):
        raise StaticRunnerError("source archive snapshot binding mismatch")
    rows = archive.get("archived")
    if not isinstance(rows, list):
        raise StaticRunnerError("source archive rows must be a list")
    expected_archived: dict[str, tuple[str, int, str]] = {}
    snapshot_rows = source_snapshot.get("files")
    if not isinstance(snapshot_rows, list):
        raise StaticRunnerError("source snapshot files must be a list")
    for snapshot_row in snapshot_rows:
        if not isinstance(snapshot_row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        relative = snapshot_row.get("path")
        if not isinstance(relative, str):
            raise StaticRunnerError("source snapshot path is malformed")
        source_digest = snapshot_row.get("sha256")
        source_size = snapshot_row.get("size")
        source_blob_oid = snapshot_row.get("git_blob_oid")
        if (
            not isinstance(source_digest, str)
            or type(source_size) is not int
            or not isinstance(source_blob_oid, str)
        ):
            raise StaticRunnerError("source snapshot digest is malformed")
        expected_archived[relative] = (
            source_digest,
            source_size,
            source_blob_oid,
        )
    actual_archived: set[str] = set()
    archive_paths: set[str] = set()
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source archive row must be an object")
        if set(row) != {"path", "archive_path", "sha256", "size", "git_blob_oid"}:
            raise StaticRunnerError("source archive row fields are malformed")
        relative = row.get("archive_path")
        digest = row.get("sha256")
        size = row.get("size")
        git_blob_oid = row.get("git_blob_oid")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or type(size) is not int
            or size < 0
            or not isinstance(git_blob_oid, str)
        ):
            raise StaticRunnerError("source archive row is malformed")
        source_relative = row.get("path")
        if not isinstance(source_relative, str):
            raise StaticRunnerError("source archive source path is malformed")
        if source_relative in actual_archived:
            raise StaticRunnerError(f"duplicate source archive path: {source_relative}")
        actual_archived.add(source_relative)
        if relative in archive_paths:
            raise StaticRunnerError(f"duplicate archive destination: {relative}")
        archive_paths.add(relative)
        if relative != f"source-snapshot/{source_relative}":
            raise StaticRunnerError(
                f"source archive destination mismatch: {source_relative}"
            )
        if (digest, size, git_blob_oid) != expected_archived.get(source_relative):
            raise StaticRunnerError(
                f"source archive digest is not snapshot-bound: {source_relative}"
            )
        path = artifacts / relative
        try:
            path.resolve().relative_to(artifacts.resolve())
        except ValueError as exc:
            raise StaticRunnerError(
                f"source archive path escapes artifacts: {relative}"
            ) from exc
        _reject_symlink_ancestors(path)
        if path.is_symlink() or not path.is_file():
            raise StaticRunnerError(f"source archive path is invalid: {relative}")
        payload = path.read_bytes()
        if (
            _sha256_bytes(payload) != digest
            or len(payload) != size
            or _git_blob_oid(payload) != git_blob_oid
        ):
            raise StaticRunnerError(f"source archive bytes mismatch: {relative}")
    if actual_archived != set(expected_archived):
        raise StaticRunnerError("source archive is not complete for captured sources")


def _validate_inventory(artifacts: Path, rows: object) -> None:
    if not isinstance(rows, list):
        raise StaticRunnerError("artifact inventory must be a list")
    expected: dict[str, tuple[str, int]] = {}
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("artifact inventory row must be an object")
        if set(row) != {"path", "sha256", "size"}:
            raise StaticRunnerError("artifact inventory row fields are malformed")
        relative = row.get("path")
        digest = row.get("sha256")
        size = row.get("size")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or type(size) is not int
            or size < 0
        ):
            raise StaticRunnerError("artifact inventory row is malformed")
        if relative in expected:
            raise StaticRunnerError(f"duplicate artifact inventory path: {relative}")
        expected[relative] = (digest, size)
    actual = {
        row["path"]: (row["sha256"], row["size"])
        for row in _artifact_inventory(artifacts)
    }
    if actual != expected:
        raise StaticRunnerError("artifact inventory mismatch")


def validate_run(output_dir: Path) -> dict[str, object]:
    """Authenticate artifacts and replay every cell in fresh solver sessions."""
    output_dir = Path(output_dir)
    _reject_symlink_ancestors(output_dir)
    if output_dir.is_symlink() or not output_dir.is_dir():
        raise StaticRunnerError("run root is not a regular directory")
    manifest_value = _read_canonical_json(
        output_dir / "run_manifest.json", "run manifest"
    )
    _require_exact_fields(
        manifest_value,
        {
            "schema",
            "packet_schema",
            "status",
            "promotion_ready",
            "cell_plan",
            "cell_results",
            "predicate_panel",
            "predicate_summary",
            "counterfactual_contract",
            "source_snapshot",
            "postflight_source_snapshot_sha256",
            "postflight_source_content_sha256",
            "encoding_manifest_sha256",
            "solver",
            "artifact_inventory",
            "false_claims",
            "scope",
            "run_manifest_sha256",
        },
        "run manifest",
    )
    if manifest_value.get("schema") != RUN_SCHEMA:
        raise StaticRunnerError("run schema mismatch")
    _validate_self_hash(manifest_value, "run_manifest_sha256")
    if manifest_value.get("packet_schema") != packet.SCHEMA:
        raise StaticRunnerError("packet schema mismatch")
    if manifest_value.get("promotion_ready") is not False:
        raise StaticRunnerError("discovery run must not be promotion-ready")
    if manifest_value.get("false_claims") != packet.FALSE_CLAIMS:
        raise StaticRunnerError("run false-claim boundary mismatch")
    if manifest_value.get("scope") != (
        "live retained arm packet only; not full FirstNonHit"
    ):
        raise StaticRunnerError("run scope mismatch")
    if manifest_value.get("predicate_panel") != list(packet.SYNCHRONIZATION_PREDICATES):
        raise StaticRunnerError("counterfactual predicate panel mismatch")
    if manifest_value.get("counterfactual_contract") != packet.COUNTERFACTUAL_CONTRACT:
        raise StaticRunnerError("counterfactual contract mismatch")
    artifacts = output_dir / "artifacts"
    if artifacts.is_symlink() or not artifacts.is_dir():
        raise StaticRunnerError("artifacts root is invalid")
    _validate_inventory(artifacts, manifest_value.get("artifact_inventory"))
    source_snapshot = manifest_value.get("source_snapshot")
    if not isinstance(source_snapshot, Mapping):
        raise StaticRunnerError("source snapshot is missing")
    _validate_snapshot_self_hash(source_snapshot)
    _validate_source_archive(artifacts, source_snapshot)
    if manifest_value.get("postflight_source_snapshot_sha256") != source_snapshot.get(
        "snapshot_sha256"
    ):
        raise StaticRunnerError("postflight source snapshot binding mismatch")
    if manifest_value.get("postflight_source_content_sha256") != source_snapshot.get(
        "source_content_sha256"
    ):
        raise StaticRunnerError("postflight source content binding mismatch")
    current = _source_snapshot()
    _validate_snapshot_self_hash(current)
    if current.get("source_content_sha256") != source_snapshot.get(
        "source_content_sha256"
    ):
        raise StaticRunnerError("current source bytes differ from captured source")
    encoding_manifest = _read_canonical_json(
        artifacts / "encoding-manifest.json", "encoding manifest"
    )
    if _sha256_bytes(_canonical_json(encoding_manifest)) != manifest_value.get(
        "encoding_manifest_sha256"
    ):
        raise StaticRunnerError("encoding manifest digest mismatch")
    if encoding_manifest != packet.manifest():
        raise StaticRunnerError("encoding manifest differs from current packet")
    _validate_packet_manifest_source_binding(encoding_manifest, source_snapshot)
    solver_identity = _solver_identity()
    if manifest_value.get("solver") != solver_identity:
        raise StaticRunnerError("solver identity mismatch")
    plan = plan_wave()
    if manifest_value.get("cell_plan") != plan:
        raise StaticRunnerError("cell plan mismatch")
    summaries = manifest_value.get("cell_results")
    if not isinstance(summaries, list) or len(summaries) != len(plan):
        raise StaticRunnerError("cell result summary is malformed")
    replayed_statuses: list[str] = []
    replayed_cell_results: list[Mapping[str, object]] = []
    for cell, summary in zip(plan, summaries, strict=True):
        if not isinstance(summary, Mapping):
            raise StaticRunnerError("cell summary must be an object")
        _require_exact_fields(
            summary,
            {"cell_id", "status", "result_sha256"},
            "cell summary",
        )
        cell_dir = artifacts / f"cell-{cell['cell_id']}"
        result = _read_canonical_json(cell_dir / "result.json", "cell result")
        _require_exact_fields(
            result,
            {
                "schema",
                "cell",
                "status",
                "signature",
                "query_sha256",
                "query_size",
                "source_snapshot_sha256",
                "encoding_manifest_sha256",
                "solver",
                "false_claims",
                "counterfactuals",
                "result_sha256",
            },
            "cell result",
        )
        _validate_self_hash(result, "result_sha256")
        if result.get("schema") != CELL_SCHEMA:
            raise StaticRunnerError("cell schema mismatch")
        if result.get("cell") != cell:
            raise StaticRunnerError("cell identity mismatch")
        if summary.get("cell_id") != cell["cell_id"]:
            raise StaticRunnerError("cell summary identity mismatch")
        if summary.get("result_sha256") != result.get("result_sha256"):
            raise StaticRunnerError("cell summary digest mismatch")
        if summary.get("status") != result.get("status"):
            raise StaticRunnerError("cell summary status mismatch")
        if result.get("source_snapshot_sha256") != source_snapshot.get(
            "snapshot_sha256"
        ):
            raise StaticRunnerError("cell source snapshot binding mismatch")
        if result.get("encoding_manifest_sha256") != manifest_value.get(
            "encoding_manifest_sha256"
        ):
            raise StaticRunnerError("cell encoding binding mismatch")
        if result.get("solver") != solver_identity:
            raise StaticRunnerError("cell solver identity mismatch")
        if result.get("false_claims") != packet.FALSE_CLAIMS:
            raise StaticRunnerError("cell false-claim boundary mismatch")
        solver, _context = packet.build_packet(
            str(cell["nonhit"]), str(cell["interaction"]), str(cell["origin"])
        )
        query_payload = _query_bytes(solver)
        query_path = cell_dir / "query.smt2"
        if query_path.is_symlink() or not query_path.is_file():
            raise StaticRunnerError("cell query is invalid")
        if query_path.read_bytes() != query_payload:
            raise StaticRunnerError("cell query bytes differ from fresh encoding")
        if result.get("query_sha256") != _sha256_bytes(query_payload):
            raise StaticRunnerError("cell query digest mismatch")
        if result.get("query_size") != len(query_payload):
            raise StaticRunnerError("cell query size mismatch")
        check = solver.check()
        status = result.get("status")
        if not isinstance(status, str):
            raise StaticRunnerError("cell status is malformed")
        replayed_statuses.append(status)
        if status == "SAT_ABSTRACTION":
            if check != z3.sat:
                raise StaticRunnerError("SAT cell does not replay as SAT")
            signature = result.get("signature")
            if not isinstance(signature, Mapping):
                raise StaticRunnerError("SAT cell signature is missing")
            _validate_signature_cell(signature, cell)
            packet.replay_signature(signature)
        elif status == "UNSAT_RELAXATION":
            if check != z3.unsat:
                raise StaticRunnerError("UNSAT cell does not replay as UNSAT")
            if result.get("signature") is not None:
                raise StaticRunnerError("UNSAT cell unexpectedly carries a signature")
        else:
            raise StaticRunnerError(f"unsupported cell status: {status}")
        counterfactuals = result.get("counterfactuals")
        if not isinstance(counterfactuals, list) or len(counterfactuals) != len(
            packet.SYNCHRONIZATION_PREDICATES
        ):
            raise StaticRunnerError("cell counterfactual summaries are malformed")
        for predicate_row, counterfactual in zip(
            packet.SYNCHRONIZATION_PREDICATES,
            counterfactuals,
            strict=True,
        ):
            if not isinstance(counterfactual, Mapping):
                raise StaticRunnerError("cell counterfactual summary is malformed")
            _require_exact_fields(
                counterfactual,
                {
                    "predicate",
                    "classification",
                    "true_status",
                    "false_status",
                    "true_result_sha256",
                    "false_result_sha256",
                },
                "cell counterfactual summary",
            )
            predicate_name = str(predicate_row["id"])
            if counterfactual.get("predicate") != predicate_name:
                raise StaticRunnerError("cell counterfactual predicate order mismatch")
            true_result = _validate_counterfactual_result(
                artifacts,
                cell,
                predicate_name,
                True,
                source_snapshot,
                manifest_value.get("encoding_manifest_sha256"),
                solver_identity,
            )
            false_result = _validate_counterfactual_result(
                artifacts,
                cell,
                predicate_name,
                False,
                source_snapshot,
                manifest_value.get("encoding_manifest_sha256"),
                solver_identity,
            )
            if counterfactual.get("true_status") != true_result.get("status"):
                raise StaticRunnerError("true counterfactual status mismatch")
            if counterfactual.get("false_status") != false_result.get("status"):
                raise StaticRunnerError("false counterfactual status mismatch")
            if counterfactual.get("true_result_sha256") != true_result.get(
                "result_sha256"
            ):
                raise StaticRunnerError("true counterfactual digest mismatch")
            if counterfactual.get("false_result_sha256") != false_result.get(
                "result_sha256"
            ):
                raise StaticRunnerError("false counterfactual digest mismatch")
            expected_classification = _counterfactual_classification(
                status,
                str(true_result["status"]),
                str(false_result["status"]),
            )
            if counterfactual.get("classification") != expected_classification:
                raise StaticRunnerError("counterfactual classification mismatch")
        replayed_cell_results.append(result)
    expected_aggregate = _aggregate_status(replayed_statuses)
    if manifest_value.get("status") != expected_aggregate:
        raise StaticRunnerError("aggregate status mismatch")
    if manifest_value.get("predicate_summary") != _predicate_summary(
        replayed_cell_results
    ):
        raise StaticRunnerError("predicate summary mismatch")
    return manifest_value


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", required=True)
    run_parser = subparsers.add_parser("run")
    run_parser.add_argument("--out", type=Path, required=True)
    validate_parser = subparsers.add_parser("validate")
    validate_parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.command == "run":
        value = run_wave(args.out)
    else:
        value = validate_run(args.out)
    print(json.dumps(value, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
