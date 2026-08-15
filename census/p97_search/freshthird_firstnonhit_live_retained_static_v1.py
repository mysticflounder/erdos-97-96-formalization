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
import contextlib
import fcntl
import hashlib
import itertools
import json
import os
import stat
import subprocess
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

from census.p97_search import freshthird_firstnonhit_live_retained_v1 as packet

RUN_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-run/v1"
CELL_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-cell/v1"
PROBE_SCHEMA = "p97-freshthird-firstnonhit-live-retained-counterfactual/v1"
RUN_STATE_SCHEMA = "p97-freshthird-firstnonhit-live-retained-run-state/v1"
RECEIPT_SCHEMA = "p97-freshthird-firstnonhit-live-retained-single-wave/v1"
GIT_TIMEOUT_SECONDS = 30
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


def _require_single_link_file(path: Path, description: str) -> None:
    if path.is_symlink() or not path.is_file():
        raise StaticRunnerError(f"{description} is not a regular file")
    if path.stat(follow_symlinks=False).st_nlink != 1:
        raise StaticRunnerError(f"{description} must have exactly one hard link")


def _fsync_directory(path: Path) -> None:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0)
    descriptor = os.open(path, flags)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _mkdir_durable(path: Path) -> None:
    missing: list[Path] = []
    candidate = path
    while not candidate.exists():
        if candidate.is_symlink():
            raise StaticRunnerError(f"directory path is a symlink: {candidate}")
        missing.append(candidate)
        if candidate == candidate.parent:
            raise StaticRunnerError(f"cannot find existing directory ancestor: {path}")
        candidate = candidate.parent
    _reject_symlink_ancestors(candidate)
    if not candidate.is_dir():
        raise StaticRunnerError(f"directory ancestor is not a directory: {candidate}")
    for directory in reversed(missing):
        directory.mkdir()
        _fsync_directory(directory.parent)


def _atomic_write(path: Path, payload: bytes) -> str:
    _mkdir_durable(path.parent)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    try:
        with temporary.open("xb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
        _fsync_directory(path.parent)
    finally:
        if temporary.exists():
            temporary.unlink()
    return _sha256_bytes(payload)


def _atomic_json(path: Path, value: object) -> str:
    return _atomic_write(path, _canonical_json(value))


def _read_canonical_json(path: Path, description: str) -> dict[str, object]:
    _require_single_link_file(path, description)
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
    try:
        completed = subprocess.run(
            ["git", *args],
            cwd=packet.REPO_ROOT,
            check=True,
            capture_output=True,
            text=True,
            timeout=GIT_TIMEOUT_SECONDS,
        )
    except subprocess.TimeoutExpired as exc:
        raise StaticRunnerError(f"git command timed out: {args}") from exc
    return completed.stdout.strip()


def _git_bytes(args: Sequence[str]) -> bytes:
    try:
        completed = subprocess.run(
            ["git", *args],
            cwd=packet.REPO_ROOT,
            check=True,
            capture_output=True,
            timeout=GIT_TIMEOUT_SECONDS,
        )
    except subprocess.TimeoutExpired as exc:
        raise StaticRunnerError(f"git command timed out: {args}") from exc
    return completed.stdout


def _git_blob_oid(payload: bytes) -> str:
    try:
        completed = subprocess.run(
            ["git", "hash-object", "--stdin"],
            cwd=packet.REPO_ROOT,
            check=True,
            input=payload,
            capture_output=True,
            text=False,
            timeout=GIT_TIMEOUT_SECONDS,
        )
    except subprocess.TimeoutExpired as exc:
        raise StaticRunnerError("git hash-object timed out") from exc
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


def _validate_production_snapshot(snapshot: Mapping[str, object]) -> None:
    git_head = snapshot.get("git_head")
    if git_head != _git(["rev-parse", "refs/remotes/origin/main"]):
        raise StaticRunnerError("production Git head is not pushed origin/main")
    rows = snapshot.get("files")
    if not isinstance(rows, list) or any(
        not isinstance(row, Mapping) or row.get("clean") is not True for row in rows
    ):
        raise StaticRunnerError("production source snapshot contains dirty inputs")
    if _git(["status", "--porcelain=v1", "--untracked-files=no"]):
        raise StaticRunnerError("production tracked worktree is not clean")


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
        elif git_status.startswith("?? "):
            if index_blob_oid is not None:
                raise StaticRunnerError(
                    f"untracked source unexpectedly has an index blob: {relative}"
                )
        else:
            if not isinstance(index_blob_oid, str):
                raise StaticRunnerError(
                    f"tracked dirty source lacks an index blob: {relative}"
                )
            try:
                object_type = _git(["cat-file", "-t", index_blob_oid])
            except subprocess.CalledProcessError as exc:
                raise StaticRunnerError(
                    f"dirty source index blob is absent: {relative}"
                ) from exc
            if object_type != "blob":
                raise StaticRunnerError(
                    f"dirty source index object is not a blob: {relative}"
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
    _require_single_link_file(resolved, f"source {relative}")
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
    loader_path = Path(z3.z3core.__file__).resolve()
    library_dir = Path(z3.z3core._z3_lib_resource_path).resolve()
    library_name = {
        "darwin": "libz3.dylib",
        "linux": "libz3.so",
        "win32": "libz3.dll",
    }.get(sys.platform)
    if library_name is None:
        raise StaticRunnerError(
            f"unsupported platform for native Z3 binding: {sys.platform}"
        )
    expected_native_path = (library_dir / library_name).resolve(strict=True)
    defaults = getattr(z3.z3core.Z3_get_full_version, "__defaults__", None)
    if not isinstance(defaults, tuple) or len(defaults) != 1:
        raise StaticRunnerError("cannot recover the active native Z3 handle")
    function = getattr(defaults[0], "f", None)
    objects = getattr(function, "_objects", None)
    loaded_libraries = (
        [
            value
            for value in objects.values()
            if hasattr(value, "_name") and isinstance(value._name, str)
        ]
        if isinstance(objects, Mapping)
        else []
    )
    if len(loaded_libraries) != 1:
        raise StaticRunnerError("active native Z3 handle is ambiguous")
    native_path = Path(loaded_libraries[0]._name).resolve(strict=True)
    if native_path != expected_native_path:
        raise StaticRunnerError("active native Z3 library is not the bundled library")
    _require_single_link_file(native_path, "active native Z3 library")
    return {
        "name": "z3py",
        "version": z3.get_version_string(),
        "module_path": str(module_path),
        "module_sha256": _sha256_file(module_path),
        "loader_path": str(loader_path),
        "loader_sha256": _sha256_file(loader_path),
        "native_path": str(native_path),
        "native_sha256": _sha256_file(native_path),
        "native_size": native_path.stat().st_size,
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
    directories: set[str] = set()
    for path in sorted(artifacts.rglob("*")):
        if path.is_symlink():
            raise StaticRunnerError(f"artifact is a symlink: {path}")
        relative = path.relative_to(artifacts).as_posix()
        if path.is_dir():
            directories.add(relative)
            continue
        if not path.is_file():
            raise StaticRunnerError(f"artifact is not a regular file: {path}")
        _require_single_link_file(path, f"artifact {path}")
        rows.append(
            {
                "path": relative,
                "sha256": _sha256_file(path),
                "size": path.stat().st_size,
            }
        )
    if directories != _expected_artifact_directories():
        raise StaticRunnerError("artifact directory path set is not closed")
    return rows


def _expected_artifact_paths() -> set[str]:
    expected = {
        "encoding-manifest.json",
        "source-snapshot/manifest.json",
        *(f"source-snapshot/{relative}" for relative in _snapshot_paths()),
    }
    for cell in plan_wave():
        cell_root = f"cell-{cell['cell_id']}"
        expected.add(f"{cell_root}/query.smt2")
        expected.add(f"{cell_root}/result.json")
        for predicate_row in packet.SYNCHRONIZATION_PREDICATES:
            predicate_name = predicate_row["id"]
            for polarity in ("true", "false"):
                probe_root = f"{cell_root}/counterfactuals/{predicate_name}/{polarity}"
                expected.add(f"{probe_root}/query.smt2")
                expected.add(f"{probe_root}/result.json")
    return expected


def _expected_artifact_directories() -> set[str]:
    directories: set[str] = set()
    for relative in _expected_artifact_paths():
        parent = Path(relative).parent
        while parent != Path("."):
            directories.add(parent.as_posix())
            parent = parent.parent
    return directories


def _run_state_value(
    *,
    run_id: str,
    status: str,
    source_snapshot_sha256: str,
    encoding_manifest_sha256: str,
    completed_cells: int,
    error: dict[str, str] | None,
    run_manifest_sha256: str | None,
) -> dict[str, object]:
    planned_cells = len(plan_wave())
    probes_per_cell = len(packet.SYNCHRONIZATION_PREDICATES) * 2
    value: dict[str, object] = {
        "schema": RUN_STATE_SCHEMA,
        "run_id": run_id,
        "status": status,
        "source_snapshot_sha256": source_snapshot_sha256,
        "encoding_manifest_sha256": encoding_manifest_sha256,
        "planned_cells": planned_cells,
        "planned_counterfactuals": planned_cells * probes_per_cell,
        "completed_cells": completed_cells,
        "completed_counterfactuals": completed_cells * probes_per_cell,
        "error": error,
        "run_manifest_sha256": run_manifest_sha256,
        "false_claims": packet.FALSE_CLAIMS,
    }
    value["state_sha256"] = _sha256_bytes(_canonical_json(value))
    return value


def _write_run_state(
    output_dir: Path,
    *,
    run_id: str,
    status: str,
    source_snapshot_sha256: str,
    encoding_manifest_sha256: str,
    completed_cells: int,
    error: dict[str, str] | None,
    run_manifest_sha256: str | None,
) -> dict[str, object]:
    state = _run_state_value(
        run_id=run_id,
        status=status,
        source_snapshot_sha256=source_snapshot_sha256,
        encoding_manifest_sha256=encoding_manifest_sha256,
        completed_cells=completed_cells,
        error=error,
        run_manifest_sha256=run_manifest_sha256,
    )
    _atomic_json(output_dir / "run_state.json", state)
    return state


def _validate_run_state(
    output_dir: Path, expected_status: str | None = None
) -> dict[str, object]:
    state = _read_canonical_json(output_dir / "run_state.json", "run state")
    _require_exact_fields(
        state,
        {
            "schema",
            "run_id",
            "status",
            "source_snapshot_sha256",
            "encoding_manifest_sha256",
            "planned_cells",
            "planned_counterfactuals",
            "completed_cells",
            "completed_counterfactuals",
            "error",
            "run_manifest_sha256",
            "false_claims",
            "state_sha256",
        },
        "run state",
    )
    _validate_self_hash(state, "state_sha256")
    if state.get("schema") != RUN_STATE_SCHEMA:
        raise StaticRunnerError("run state schema mismatch")
    status = state.get("status")
    if status not in {"RUNNING", "FAILED", "COMPLETE"}:
        raise StaticRunnerError("run state status is malformed")
    run_id = state.get("run_id")
    source_digest = state.get("source_snapshot_sha256")
    encoding_digest = state.get("encoding_manifest_sha256")
    if (
        not isinstance(run_id, str)
        or not run_id
        or "/" in run_id
        or not isinstance(source_digest, str)
        or len(source_digest) != 64
        or any(character not in "0123456789abcdef" for character in source_digest)
        or not isinstance(encoding_digest, str)
        or len(encoding_digest) != 64
        or any(character not in "0123456789abcdef" for character in encoding_digest)
    ):
        raise StaticRunnerError("run state identity or digest is malformed")
    if expected_status is not None and status != expected_status:
        raise StaticRunnerError(f"run state is not {expected_status}")
    planned_cells = len(plan_wave())
    probes_per_cell = len(packet.SYNCHRONIZATION_PREDICATES) * 2
    completed_cells = state.get("completed_cells")
    completed_counterfactuals = state.get("completed_counterfactuals")
    if (
        state.get("planned_cells") != planned_cells
        or state.get("planned_counterfactuals") != planned_cells * probes_per_cell
        or type(completed_cells) is not int
        or not 0 <= completed_cells <= planned_cells
        or completed_counterfactuals != completed_cells * probes_per_cell
        or state.get("false_claims") != packet.FALSE_CLAIMS
    ):
        raise StaticRunnerError(
            "run state counts or false-claim boundary are malformed"
        )
    error = state.get("error")
    manifest_sha256 = state.get("run_manifest_sha256")
    if status == "COMPLETE":
        if (
            completed_cells != planned_cells
            or error is not None
            or not isinstance(manifest_sha256, str)
            or len(manifest_sha256) != 64
            or any(character not in "0123456789abcdef" for character in manifest_sha256)
        ):
            raise StaticRunnerError("complete run state is malformed")
    elif status == "RUNNING":
        if error is not None or manifest_sha256 is not None:
            raise StaticRunnerError("running run state is malformed")
    else:
        if (
            not isinstance(error, Mapping)
            or set(error) != {"type", "message"}
            or not all(isinstance(value, str) for value in error.values())
            or manifest_sha256 is not None
        ):
            raise StaticRunnerError("failed run state is malformed")
    return state


def _validate_complete_topology(output_dir: Path) -> None:
    expected = {"artifacts", "run_manifest.json", "run_state.json"}
    actual = {path.name for path in output_dir.iterdir()}
    if actual != expected:
        raise StaticRunnerError("run root path set is not closed")


def _terminal_reentry(output_dir: Path) -> dict[str, object]:
    """Authenticate a completed run without launching any solver session."""
    _reject_symlink_ancestors(output_dir)
    if output_dir.is_symlink() or not output_dir.is_dir():
        raise StaticRunnerError("terminal run root is not a regular directory")
    _validate_complete_topology(output_dir)
    state = _validate_run_state(output_dir, "COMPLETE")
    manifest = _read_canonical_json(output_dir / "run_manifest.json", "run manifest")
    _require_exact_fields(
        manifest,
        {
            "schema",
            "run_id",
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
        "terminal run manifest",
    )
    _validate_self_hash(manifest, "run_manifest_sha256")
    if manifest.get("schema") != RUN_SCHEMA:
        raise StaticRunnerError("terminal run schema mismatch")
    if (
        manifest.get("packet_schema") != packet.SCHEMA
        or manifest.get("promotion_ready") is not False
        or manifest.get("false_claims") != packet.FALSE_CLAIMS
        or manifest.get("scope")
        != "live retained arm packet only; not full FirstNonHit"
        or manifest.get("predicate_panel") != list(packet.SYNCHRONIZATION_PREDICATES)
        or manifest.get("counterfactual_contract") != packet.COUNTERFACTUAL_CONTRACT
    ):
        raise StaticRunnerError("terminal run boundary mismatch")
    if state.get("run_id") != manifest.get("run_id"):
        raise StaticRunnerError("terminal run id mismatch")
    if state.get("run_manifest_sha256") != manifest.get("run_manifest_sha256"):
        raise StaticRunnerError("terminal run manifest binding mismatch")
    source_snapshot = manifest.get("source_snapshot")
    if not isinstance(source_snapshot, Mapping):
        raise StaticRunnerError("terminal source snapshot is missing")
    if state.get("source_snapshot_sha256") != source_snapshot.get("snapshot_sha256"):
        raise StaticRunnerError("terminal source snapshot binding mismatch")
    if state.get("encoding_manifest_sha256") != manifest.get(
        "encoding_manifest_sha256"
    ):
        raise StaticRunnerError("terminal encoding manifest binding mismatch")
    _validate_snapshot_self_hash(source_snapshot)
    if _source_snapshot().get("snapshot_sha256") != source_snapshot.get(
        "snapshot_sha256"
    ):
        raise StaticRunnerError("current source or Git state differs from terminal run")
    artifacts = output_dir / "artifacts"
    _validate_inventory(artifacts, manifest.get("artifact_inventory"))
    _validate_source_archive(artifacts, source_snapshot)
    encoding_manifest = _read_canonical_json(
        artifacts / "encoding-manifest.json", "encoding manifest"
    )
    if encoding_manifest != packet.manifest():
        raise StaticRunnerError("terminal encoding manifest differs from live packet")
    if manifest.get("solver") != _solver_identity():
        raise StaticRunnerError("terminal solver identity mismatch")
    if manifest.get("cell_plan") != plan_wave():
        raise StaticRunnerError("terminal cell plan mismatch")
    cell_results = manifest.get("cell_results")
    if not isinstance(cell_results, list) or len(cell_results) != len(plan_wave()):
        raise StaticRunnerError("terminal cell result summary is malformed")
    return manifest


def _receipt_value(
    *,
    run_id: str,
    output_dir: Path,
    status: str,
    run_state_sha256: str | None,
    error: dict[str, str] | None,
) -> dict[str, object]:
    value: dict[str, object] = {
        "schema": RECEIPT_SCHEMA,
        "run_id": run_id,
        "output_dir": str(output_dir.resolve(strict=False)),
        "status": status,
        "run_state_sha256": run_state_sha256,
        "error": error,
    }
    value["receipt_sha256"] = _sha256_bytes(_canonical_json(value))
    return value


def _validate_receipt(path: Path) -> dict[str, object]:
    receipt = _read_canonical_json(path, "single-wave receipt")
    _require_exact_fields(
        receipt,
        {
            "schema",
            "run_id",
            "output_dir",
            "status",
            "run_state_sha256",
            "error",
            "receipt_sha256",
        },
        "single-wave receipt",
    )
    _validate_self_hash(receipt, "receipt_sha256")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise StaticRunnerError("single-wave receipt schema mismatch")
    status = receipt.get("status")
    if status not in {"CLAIMED", "FAILED", "COMPLETE"}:
        raise StaticRunnerError("single-wave receipt status is malformed")
    if (
        not isinstance(receipt.get("run_id"), str)
        or not receipt.get("run_id")
        or not isinstance(receipt.get("output_dir"), str)
    ):
        raise StaticRunnerError("single-wave receipt identity is malformed")
    if status == "CLAIMED":
        if (
            receipt.get("run_state_sha256") is not None
            or receipt.get("error") is not None
        ):
            raise StaticRunnerError("claimed single-wave receipt is malformed")
    elif status == "COMPLETE":
        if (
            not isinstance(receipt.get("run_state_sha256"), str)
            or len(receipt["run_state_sha256"]) != 64
            or any(
                character not in "0123456789abcdef"
                for character in receipt["run_state_sha256"]
            )
            or receipt.get("error") is not None
        ):
            raise StaticRunnerError("complete single-wave receipt is malformed")
    else:
        error = receipt.get("error")
        if (
            not isinstance(error, Mapping)
            or set(error) != {"type", "message"}
            or not all(isinstance(value, str) for value in error.values())
        ):
            raise StaticRunnerError("failed single-wave receipt is malformed")
    return receipt


def _write_receipt(
    path: Path,
    *,
    run_id: str,
    output_dir: Path,
    status: str,
    run_state_sha256: str | None,
    error: dict[str, str] | None,
) -> dict[str, object]:
    receipt = _receipt_value(
        run_id=run_id,
        output_dir=output_dir,
        status=status,
        run_state_sha256=run_state_sha256,
        error=error,
    )
    _atomic_json(path, receipt)
    return receipt


@contextlib.contextmanager
def _wave_lock(output_dir: Path, allow_test_output: bool):
    lock_root = output_dir.parent if allow_test_output else DEFAULT_RUN_PARENT
    _reject_symlink_ancestors(lock_root)
    _mkdir_durable(lock_root)
    lock_path = lock_root / ".freshthird-firstnonhit-live-retained-v1.lock"
    _reject_symlink_ancestors(lock_path)
    flags = os.O_RDWR | os.O_CREAT | getattr(os, "O_CLOEXEC", 0)
    nofollow = getattr(os, "O_NOFOLLOW", None)
    if nofollow is None:
        raise StaticRunnerError("platform lacks no-follow lock-file opening")
    try:
        descriptor = os.open(lock_path, flags | nofollow, 0o600)
    except OSError as exc:
        raise StaticRunnerError("single-wave lock cannot be opened safely") from exc
    try:
        metadata = os.fstat(descriptor)
        if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
            raise StaticRunnerError(
                "single-wave lock must be a singly-linked regular file"
            )
        os.fsync(descriptor)
        _fsync_directory(lock_root)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            raise StaticRunnerError(
                "another retained-arm wave holds the run lock"
            ) from exc
        yield
    finally:
        with contextlib.suppress(OSError):
            fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def _run_wave_locked(
    output_dir: Path, allow_test_output: bool = False
) -> dict[str, object]:
    """Execute exactly one authenticated 24-cell discovery wave."""
    output_dir = Path(output_dir)
    if output_dir.exists() or output_dir.is_symlink():
        if output_dir.is_symlink() or not output_dir.is_dir():
            raise StaticRunnerError("existing output root is not a regular directory")
        return _terminal_reentry(output_dir)
    output_dir = _validate_output_root(output_dir, allow_test_output)
    source_snapshot = _source_snapshot()
    _validate_snapshot_self_hash(source_snapshot)
    if not allow_test_output:
        _validate_production_snapshot(source_snapshot)
    packet_manifest = packet.manifest()
    _validate_packet_manifest_source_binding(packet_manifest, source_snapshot)
    packet_manifest_sha256 = _sha256_bytes(_canonical_json(packet_manifest))
    solver_identity = _solver_identity()
    cells = plan_wave()
    run_id = output_dir.name
    completed_cells = 0
    _mkdir_durable(output_dir)
    artifacts = output_dir / "artifacts"
    _mkdir_durable(artifacts)
    _write_run_state(
        output_dir,
        run_id=run_id,
        status="RUNNING",
        source_snapshot_sha256=str(source_snapshot["snapshot_sha256"]),
        encoding_manifest_sha256=packet_manifest_sha256,
        completed_cells=0,
        error=None,
        run_manifest_sha256=None,
    )
    results: list[dict[str, object]] = []
    try:
        written_manifest_sha256 = _atomic_json(
            artifacts / "encoding-manifest.json", packet_manifest
        )
        if written_manifest_sha256 != packet_manifest_sha256:
            raise StaticRunnerError("encoding manifest write digest mismatch")
        _source_archive(artifacts, source_snapshot)
        for cell in cells:
            results.append(
                _cell_result(
                    cell,
                    artifacts,
                    source_snapshot,
                    packet_manifest_sha256,
                    solver_identity,
                )
            )
            completed_cells += 1
            _write_run_state(
                output_dir,
                run_id=run_id,
                status="RUNNING",
                source_snapshot_sha256=str(source_snapshot["snapshot_sha256"]),
                encoding_manifest_sha256=packet_manifest_sha256,
                completed_cells=completed_cells,
                error=None,
                run_manifest_sha256=None,
            )
        post_snapshot = _source_snapshot()
        _validate_snapshot_self_hash(post_snapshot)
        if not allow_test_output:
            _validate_production_snapshot(post_snapshot)
        if post_snapshot["snapshot_sha256"] != source_snapshot["snapshot_sha256"]:
            raise StaticRunnerError("source or Git state drifted during the wave")
        statuses = [str(result["status"]) for result in results]
        aggregate = _aggregate_status(statuses)
        run_manifest: dict[str, object] = {
            "schema": RUN_SCHEMA,
            "run_id": run_id,
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
        run_manifest["run_manifest_sha256"] = _sha256_bytes(
            _canonical_json(run_manifest)
        )
        _atomic_json(output_dir / "run_manifest.json", run_manifest)
        _write_run_state(
            output_dir,
            run_id=run_id,
            status="COMPLETE",
            source_snapshot_sha256=str(source_snapshot["snapshot_sha256"]),
            encoding_manifest_sha256=packet_manifest_sha256,
            completed_cells=completed_cells,
            error=None,
            run_manifest_sha256=str(run_manifest["run_manifest_sha256"]),
        )
        return run_manifest
    except BaseException as exc:
        error = {"type": type(exc).__name__, "message": str(exc)[:500]}
        _write_run_state(
            output_dir,
            run_id=run_id,
            status="FAILED",
            source_snapshot_sha256=str(source_snapshot["snapshot_sha256"]),
            encoding_manifest_sha256=packet_manifest_sha256,
            completed_cells=completed_cells,
            error=error,
            run_manifest_sha256=None,
        )
        raise


def run_wave(output_dir: Path, allow_test_output: bool = False) -> dict[str, object]:
    """Execute one wave, or authenticate its completed zero-solver reentry."""
    output_dir = Path(output_dir)
    with _wave_lock(output_dir, allow_test_output):
        if allow_test_output:
            return _run_wave_locked(output_dir, allow_test_output=True)
        receipt_path = DEFAULT_RUN_PARENT / "single-wave-receipt.json"
        run_id = output_dir.name
        if receipt_path.exists() or receipt_path.is_symlink():
            receipt = _validate_receipt(receipt_path)
            same_run = receipt.get("run_id") == run_id and receipt.get(
                "output_dir"
            ) == str(output_dir.resolve(strict=False))
            if same_run and receipt.get("status") in {"CLAIMED", "COMPLETE"}:
                try:
                    manifest = _terminal_reentry(output_dir)
                    state = _validate_run_state(output_dir, "COMPLETE")
                except StaticRunnerError as exc:
                    if receipt.get("status") == "CLAIMED":
                        raise StaticRunnerError(
                            "claimed production wave is not recoverably complete"
                        ) from exc
                    raise
                if receipt.get("status") == "COMPLETE":
                    if receipt.get("run_state_sha256") != state.get("state_sha256"):
                        raise StaticRunnerError(
                            "single-wave receipt state binding mismatch"
                        )
                else:
                    _write_receipt(
                        receipt_path,
                        run_id=run_id,
                        output_dir=output_dir,
                        status="COMPLETE",
                        run_state_sha256=str(state["state_sha256"]),
                        error=None,
                    )
                return manifest
            raise StaticRunnerError(
                "a production retained-arm wave is already recorded"
            )
        _validate_output_root(output_dir, allow_test_output=False)
        _write_receipt(
            receipt_path,
            run_id=run_id,
            output_dir=output_dir,
            status="CLAIMED",
            run_state_sha256=None,
            error=None,
        )
        try:
            manifest = _run_wave_locked(output_dir, allow_test_output=False)
        except BaseException as exc:
            state_sha256: str | None = None
            if (output_dir / "run_state.json").is_file():
                claimed_state_sha256 = _read_canonical_json(
                    output_dir / "run_state.json", "failed run state"
                ).get("state_sha256")
                if isinstance(claimed_state_sha256, str):
                    state_sha256 = claimed_state_sha256
            _write_receipt(
                receipt_path,
                run_id=run_id,
                output_dir=output_dir,
                status="FAILED",
                run_state_sha256=state_sha256,
                error={"type": type(exc).__name__, "message": str(exc)[:500]},
            )
            raise
        state = _validate_run_state(output_dir, "COMPLETE")
        _write_receipt(
            receipt_path,
            run_id=run_id,
            output_dir=output_dir,
            status="COMPLETE",
            run_state_sha256=str(state["state_sha256"]),
            error=None,
        )
        return manifest


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
        _require_single_link_file(path, f"source archive {relative}")
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
    if set(expected) != _expected_artifact_paths():
        raise StaticRunnerError("artifact inventory path set is not closed")
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
    _validate_complete_topology(output_dir)
    run_state = _validate_run_state(output_dir, "COMPLETE")
    manifest_value = _read_canonical_json(
        output_dir / "run_manifest.json", "run manifest"
    )
    _require_exact_fields(
        manifest_value,
        {
            "schema",
            "run_id",
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
    if run_state.get("run_id") != manifest_value.get("run_id"):
        raise StaticRunnerError("run-state id binding mismatch")
    if run_state.get("run_manifest_sha256") != manifest_value.get(
        "run_manifest_sha256"
    ):
        raise StaticRunnerError("run-state manifest binding mismatch")
    if run_state.get("encoding_manifest_sha256") != manifest_value.get(
        "encoding_manifest_sha256"
    ):
        raise StaticRunnerError("run-state encoding binding mismatch")
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
    if run_state.get("source_snapshot_sha256") != source_snapshot.get(
        "snapshot_sha256"
    ):
        raise StaticRunnerError("run-state source snapshot binding mismatch")
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
    if current.get("snapshot_sha256") != source_snapshot.get("snapshot_sha256"):
        raise StaticRunnerError(
            "current source bytes or Git metadata differ from captured source"
        )
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
