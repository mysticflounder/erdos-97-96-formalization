"""Read-only external verifier for the completed cap-endpoint v3 SAT run.

The verifier never launches a process and never writes.  It authenticates the
frozen run, regenerates the exact encoder bundle, and independently checks the
complete SAT assignment against every emitted clause and the semantic readback.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from collections import Counter
from collections.abc import Mapping, Sequence
from pathlib import Path, PurePosixPath
from types import ModuleType
from typing import Any

sys.dont_write_bytecode = True

VERIFY_SCHEMA = "p97-freshthird-firstnonhit-cap-endpoint-v3/external-verifier/v1"
RUN_SCHEMA = "p97-freshthird-firstnonhit-cap-endpoint-v3/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
PROCESS_SCHEMA = f"{RUN_SCHEMA}/process-receipt/v1"
BINARY_VERSIONS_SCHEMA = f"{RUN_SCHEMA}/binary-versions/v1"
EXPECTED_RUN_RELATIVE = (
    "scratch/runs/firstnonhit-cap-endpoint-v3/n17-one-shot-audit-approved"
)
EXPECTED_RUN_MANIFEST_SHA256 = (
    "33a74d10a8363ae4183b84e0b93ffdf49fc28fcd617e8cfb4e24e04e4224aaaa"
)
EXPECTED_TERMINAL_RECEIPT_SHA256 = (
    "563cc8f0804895e81e04cd1bc009200dcffc88eee17e851669c87e7623da4fb8"
)
EXPECTED_PROBLEM_SOURCES_SHA256 = (
    "ebdd10676cf2bd8b30ec4021cac6d3e7055627b71f1dcf1e34ba0adcf97f6d3c"
)
EXPECTED_REPO_ROOT = Path(
    "/Users/adam/projects/math-projects/erdos-97-96-formalization"
)
VERIFIER_RELATIVE = "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3_verify.py"
ENCODER_MODULE = "census.p97_search.freshthird_firstnonhit_cap_endpoint_v3"
PREDECESSOR_MODULE = "census.p97_search.freshthird_firstnonhit_complete_finite_v2"
PACKAGE_MODULE = "census"
SEARCH_PACKAGE_MODULE = "census.p97_search"
EXPECTED_PROCESS_NAMES = (
    "cadical-version",
    "smoke-sat",
    "smoke-unsat",
    "smoke-unsat-drat-trim",
    "production-cadical",
)
EXPECTED_RETURN_CODES = {
    "cadical-version": 0,
    "smoke-sat": 10,
    "smoke-unsat": 20,
    "smoke-unsat-drat-trim": 0,
    "production-cadical": 10,
}
EXPECTED_COMMAND_KEYS = {
    "cadical-version": "cadical_version",
    "smoke-sat": "smoke_sat",
    "smoke-unsat": "smoke_unsat",
    "smoke-unsat-drat-trim": "smoke_unsat_drat_trim",
    "production-cadical": "production",
}
EXPECTED_SOURCE_PATHS = {
    "encoder": "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3.py",
    "predecessor_encoder": (
        "census/p97_search/freshthird_firstnonhit_complete_finite_v2.py"
    ),
    "runner": "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3_run.py",
    "checkpoint": ".codex/worktree-checkpoints/firstnonhit-cap-endpoint-v3.json",
}
EXPECTED_SOURCE_IDENTITIES = {
    "encoder": {
        "sha256": "e7ef7ff2e5827f8d8dd1312a1a357dd66abf3dc5efb967cd5bd168cc34f4c034",
        "size": 20309,
    },
    "predecessor_encoder": {
        "sha256": "31273114c0b7d16505da257ce33e98eed25185b4aad1135b575e88421d47fa61",
        "size": 60907,
    },
    "runner": {
        "sha256": "a6beaf28f4838343163145c78dada176e0eb2171712cbdd18692f7efc1c3eba2",
        "size": 49284,
    },
    "checkpoint": {
        "sha256": "5452cfe8c9077756098150aeb99784872c07ccff1feec9b3d0c90d78332743ca",
        "size": 763,
    },
}
EXPECTED_AUDIT = {
    "status": "APPROVED",
    "communicated_utc_date": "2026-08-15",
    "scope": "exact emitted CNF and source map",
    "counts_reproduced": {"variables": 93075, "clauses": 445258},
    "cnf_sha256_reproduced": (
        "efee6f9ff7c95c090f11dd1f8566380e8c832d12641c1baf338e690d032962b3"
    ),
    "no_unsound_clause_found": True,
}
SMOKE_SAT_CNF = b"p cnf 1 1\n1 0\n"
SMOKE_UNSAT_CNF = b"p cnf 1 2\n1 0\n-1 0\n"


class VerificationError(RuntimeError):
    """The completed run failed closed external authentication."""


def _repo_root() -> Path:
    expected = EXPECTED_REPO_ROOT / VERIFIER_RELATIVE
    actual = Path(os.path.abspath(__file__))
    _reject_symlink_ancestors(actual)
    if actual != expected or actual.resolve() != expected:
        raise VerificationError("external verifier module was source-shadowed")
    return EXPECTED_REPO_ROOT


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _reject_symlink_ancestors(path: Path) -> None:
    candidate = path
    while True:
        if candidate.is_symlink():
            raise VerificationError(f"path has a symlinked ancestor: {candidate}")
        if candidate == candidate.parent:
            return
        candidate = candidate.parent


def _open_regular(path: Path, description: str) -> tuple[int, os.stat_result]:
    _reject_symlink_ancestors(path)
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise VerificationError(f"cannot open {description}: {path}") from exc
    info = os.fstat(descriptor)
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        os.close(descriptor)
        raise VerificationError(f"{description} must be a single-link regular file")
    return descriptor, info


def _read_regular(path: Path, description: str) -> bytes:
    descriptor, _ = _open_regular(path, description)
    try:
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _hash_regular(path: Path, description: str) -> tuple[str, int]:
    descriptor, info = _open_regular(path, description)
    digest = hashlib.sha256()
    size = 0
    try:
        while chunk := os.read(descriptor, 1024 * 1024):
            digest.update(chunk)
            size += len(chunk)
    finally:
        os.close(descriptor)
    if size != info.st_size:
        raise VerificationError(f"{description} changed while it was read")
    return digest.hexdigest(), size


def _strict_json(
    data: bytes, description: str, *, require_canonical: bool = True
) -> dict[str, object]:
    class DuplicateKey(ValueError):
        pass

    def pairs(rows: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in rows:
            if key in result:
                raise DuplicateKey(key)
            result[key] = value
        return result

    try:
        value = json.loads(
            data,
            object_pairs_hook=pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, DuplicateKey, ValueError) as exc:
        raise VerificationError(f"malformed {description}: {exc}") from exc
    if type(value) is not dict:
        raise VerificationError(f"{description} is not a JSON object")
    if require_canonical and _canonical_json(value) != data:
        raise VerificationError(f"{description} is not canonical JSON")
    return value


def _validate_self_hash(
    value: Mapping[str, object], field: str, description: str
) -> None:
    unsigned = dict(value)
    digest = unsigned.pop(field, None)
    if type(digest) is not str or digest != _sha256(_canonical_json(unsigned)):
        raise VerificationError(f"invalid {description} self hash: {field}")


def _validate_checkpoint_self_hash(value: Mapping[str, object]) -> None:
    unsigned = dict(value)
    digest = unsigned.pop("manifest_sha256", None)
    canonical = json.dumps(
        unsigned, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode()
    if type(digest) is not str or digest != _sha256(canonical):
        raise VerificationError("invalid frozen checkpoint self hash")


def _validate_root_identity(root: Path) -> Path:
    absolute = Path(
        os.path.abspath(root if root.is_absolute() else _repo_root() / root)
    )
    _reject_symlink_ancestors(absolute)
    if absolute.is_symlink() or not absolute.is_dir():
        raise VerificationError("run root is not a real directory")
    try:
        relative = absolute.relative_to(_repo_root()).as_posix()
    except ValueError as exc:
        raise VerificationError("run root is outside the repository") from exc
    if relative != EXPECTED_RUN_RELATIVE:
        raise VerificationError("run root was relabeled")
    return absolute


def _validate_run_manifest(manifest: Mapping[str, object], root: Path) -> None:
    _validate_self_hash(manifest, "run_manifest_sha256", "run manifest")
    expected_scalars = {
        "schema": RUN_SCHEMA,
        "status": "RUNNING",
        "run_root": EXPECTED_RUN_RELATIVE,
        "n": 17,
        "source_total": False,
        "scope_label": "sound finite relaxation; not a finite-to-universal reduction",
        "all_emitted_hard_clauses_source_mapped": True,
        "independent_audit": EXPECTED_AUDIT,
        "query_is_separate_assumption": True,
        "exactly_one_production_wave": True,
        "no_cegar_successor": True,
        "theorem_bank_search_planned": False,
        "cross_check_requested": False,
        "timeout_seconds": 3600,
    }
    for field, expected in expected_scalars.items():
        if manifest.get(field) != expected:
            raise VerificationError(f"run manifest boundary drift: {field}")
    if root != _repo_root() / EXPECTED_RUN_RELATIVE:
        raise VerificationError("run manifest root binding drift")


def _inventory_rows(root: Path) -> list[dict[str, object]]:
    rows = []
    for path in sorted(root.iterdir(), key=lambda item: item.name):
        if path.name == "terminal-receipt.json":
            continue
        digest, size = _hash_regular(path, f"run artifact {path.name}")
        rows.append({"path": path.name, "sha256": digest, "size": size})
    return rows


def _validate_artifact_inventory(root: Path, terminal: Mapping[str, object]) -> int:
    expected = terminal.get("artifact_inventory")
    if type(expected) is not list or any(type(row) is not dict for row in expected):
        raise VerificationError("terminal artifact inventory is malformed")
    names = [row.get("path") for row in expected]
    if any(type(name) is not str or PurePosixPath(name).name != name for name in names):
        raise VerificationError("terminal artifact inventory path is unsafe")
    if names != sorted(names) or len(names) != len(set(names)):
        raise VerificationError("terminal artifact inventory is not unique and sorted")
    actual_names = sorted(path.name for path in root.iterdir())
    if actual_names != sorted([*names, "terminal-receipt.json"]):
        raise VerificationError("run artifact set has an extra or missing entry")
    actual = _inventory_rows(root)
    if expected != actual:
        raise VerificationError("run artifact inventory digest/size mismatch")
    return len(actual)


def _authenticate_source_files(
    manifest: Mapping[str, object],
) -> dict[str, tuple[Path, bytes]]:
    """Read and authenticate every frozen code dependency before execution."""

    rows = manifest.get("source_hashes")
    if type(rows) is not dict or set(rows) != set(EXPECTED_SOURCE_PATHS):
        raise VerificationError("source hash inventory is malformed")
    authenticated: dict[str, tuple[Path, bytes]] = {}
    for name, expected_path in EXPECTED_SOURCE_PATHS.items():
        row = rows.get(name)
        expected_identity = EXPECTED_SOURCE_IDENTITIES[name]
        if (
            type(row) is not dict
            or row.get("path") != expected_path
            or row.get("sha256") != expected_identity["sha256"]
            or row.get("size") != expected_identity["size"]
        ):
            raise VerificationError(f"source dependency relabeled: {name}")
        path = _repo_root() / expected_path
        data = _read_regular(path, f"frozen source dependency {name}")
        if (
            _sha256(data) != expected_identity["sha256"]
            or len(data) != expected_identity["size"]
        ):
            raise VerificationError(f"frozen source dependency changed: {name}")
        authenticated[name] = (path, data)
    checkpoint = _strict_json(
        authenticated["checkpoint"][1],
        "frozen lane checkpoint",
        require_canonical=False,
    )
    _validate_checkpoint_self_hash(checkpoint)
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != "firstnonhit-cap-endpoint-v3"
        or EXPECTED_RUN_RELATIVE not in checkpoint.get("generated_roots", [])
    ):
        raise VerificationError("frozen checkpoint registration drift")
    return authenticated


def _assert_module_identity(
    module: object, expected_path: Path, description: str
) -> ModuleType:
    if not isinstance(module, ModuleType):
        raise VerificationError(f"{description} module object is malformed")
    file_value = getattr(module, "__file__", None)
    if type(file_value) is not str:
        raise VerificationError(f"{description} module lacks __file__ identity")
    actual = Path(os.path.abspath(file_value))
    _reject_symlink_ancestors(actual)
    if actual != expected_path or actual.resolve() != expected_path:
        raise VerificationError(f"{description} module was source-shadowed")
    return module


def _execute_authenticated_module(
    module_name: str, path: Path, data: bytes
) -> ModuleType:
    """Execute only already-authenticated bytes under their canonical identity."""

    module = ModuleType(module_name)
    module.__file__ = str(path)
    module.__package__ = module_name.rpartition(".")[0]
    previous = sys.modules.get(module_name)
    sys.modules[module_name] = module
    try:
        code = compile(data, str(path), "exec", dont_inherit=True)
        exec(code, module.__dict__)  # noqa: S102 - bytes were hash-authenticated above
        authenticated = _assert_module_identity(module, path, module_name)
    except BaseException:
        if previous is None:
            sys.modules.pop(module_name, None)
        else:
            sys.modules[module_name] = previous
        raise
    return authenticated


def _load_authenticated_encoder(
    sources: Mapping[str, tuple[Path, bytes]],
) -> ModuleType:
    """Reject shadows, then load v2 and v3 solely from authenticated bytes."""

    predecessor_path, predecessor_data = sources["predecessor_encoder"]
    encoder_path, encoder_data = sources["encoder"]
    expected_modules = (
        (PREDECESSOR_MODULE, predecessor_path),
        (ENCODER_MODULE, encoder_path),
    )
    for name, path in expected_modules:
        existing = sys.modules.get(name)
        if existing is not None:
            _assert_module_identity(existing, path, f"preloaded {name}")

    missing = object()
    transaction_names = (
        PACKAGE_MODULE,
        SEARCH_PACKAGE_MODULE,
        PREDECESSOR_MODULE,
        ENCODER_MODULE,
    )
    previous = {name: sys.modules.get(name, missing) for name in transaction_names}
    package = ModuleType(PACKAGE_MODULE)
    package.__package__ = PACKAGE_MODULE
    package.__path__ = [str(_repo_root() / "census")]
    search_package = ModuleType(SEARCH_PACKAGE_MODULE)
    search_package.__package__ = SEARCH_PACKAGE_MODULE
    search_package.__path__ = [str(_repo_root() / "census/p97_search")]
    package.p97_search = search_package
    sys.modules[PACKAGE_MODULE] = package
    sys.modules[SEARCH_PACKAGE_MODULE] = search_package

    def restore(names: Sequence[str]) -> None:
        for name in names:
            old = previous[name]
            if old is missing:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = old

    try:
        predecessor = _execute_authenticated_module(
            PREDECESSOR_MODULE, predecessor_path, predecessor_data
        )
        setattr(
            search_package,
            PREDECESSOR_MODULE.rpartition(".")[2],
            predecessor,
        )
        encoder = _execute_authenticated_module(
            ENCODER_MODULE, encoder_path, encoder_data
        )
        _assert_module_identity(
            predecessor, predecessor_path, "authenticated predecessor"
        )
        _assert_module_identity(encoder, encoder_path, "authenticated encoder")
        if getattr(encoder, "v2", None) is not predecessor:
            raise VerificationError(
                "encoder transitive dependency was not the authenticated v2"
            )
    except BaseException:
        restore(transaction_names)
        raise
    restore((PACKAGE_MODULE, SEARCH_PACKAGE_MODULE))
    return encoder


def _authenticate_and_load_encoder(
    manifest: Mapping[str, object],
) -> tuple[ModuleType, int]:
    sources = _authenticate_source_files(manifest)
    encoder = _load_authenticated_encoder(sources)
    return encoder, len(sources)


def _validate_binary_versions(
    root: Path, manifest: Mapping[str, object], result: Mapping[str, object]
) -> tuple[dict[str, object], int]:
    binaries = manifest.get("binaries")
    if type(binaries) is not dict or set(binaries) != {
        "cadical",
        "drat_trim",
        "kissat",
    }:
        raise VerificationError("binary inventory is malformed")
    if binaries.get("kissat") is not None:
        raise VerificationError("unexpected cross-check binary")
    verified = 0
    for key, binary_name in (("cadical", "cadical"), ("drat_trim", "drat-trim")):
        row = binaries.get(key)
        if type(row) is not dict or row.get("name") != binary_name:
            raise VerificationError(f"binary identity is malformed: {key}")
        path_text = row.get("path")
        if type(path_text) is not str or not Path(path_text).is_absolute():
            raise VerificationError(f"binary path is malformed: {key}")
        path = Path(path_text)
        if path.resolve() != path:
            raise VerificationError(f"binary path was relabeled: {key}")
        digest, size = _hash_regular(path, f"recorded {key} binary")
        if (
            row.get("sha256") != digest
            or row.get("size") != size
            or row.get("version_identity") != f"sha256:{digest}"
        ):
            raise VerificationError(f"recorded binary changed: {key}")
        verified += 1
    data = _read_regular(root / "binary-versions.json", "binary versions")
    versions = _strict_json(data, "binary versions")
    _validate_self_hash(versions, "binary_versions_sha256", "binary versions")
    if versions.get("schema") != BINARY_VERSIONS_SCHEMA:
        raise VerificationError("binary versions schema mismatch")
    identities = versions.get("content_identities")
    expected_identities = {
        key: None if row is None else row["version_identity"]
        for key, row in binaries.items()
    }
    if identities != expected_identities or result.get("binary_versions") != versions:
        raise VerificationError("binary versions are not bound to the terminal result")
    version_rows = versions.get("versions")
    if (
        type(version_rows) is not dict
        or version_rows.get("drat_trim") != expected_identities["drat_trim"]
        or version_rows.get("kissat") is not None
    ):
        raise VerificationError("binary version rows are malformed")
    return versions, verified


def _status_lines(stdout: bytes) -> list[str]:
    try:
        return [
            line
            for line in stdout.decode("ascii").splitlines()
            if line.startswith("s ")
        ]
    except UnicodeDecodeError as exc:
        raise VerificationError("solver stdout is not ASCII") from exc


def _parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    try:
        lines = stdout.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        raise VerificationError("SAT model is not ASCII") from exc
    assignment: dict[int, bool] = {}
    for raw in lines:
        fields = raw.split()
        if not fields or fields[0] != "v":
            continue
        for token in fields[1:]:
            try:
                literal = int(token)
            except ValueError as exc:
                raise VerificationError(f"malformed model token: {token}") from exc
            if literal == 0:
                continue
            identifier = abs(literal)
            if not 1 <= identifier <= variable_count:
                raise VerificationError("model literal is out of range")
            value = literal > 0
            if identifier in assignment and assignment[identifier] != value:
                raise VerificationError("model contains conflicting literals")
            assignment[identifier] = value
    if set(assignment) != set(range(1, variable_count + 1)):
        missing = set(range(1, variable_count + 1)) - set(assignment)
        detail = min(missing) if missing else "duplicate/out-of-domain"
        raise VerificationError(f"model is not exactly complete: {detail}")
    return assignment


def _validate_processes(
    root: Path,
    manifest: Mapping[str, object],
    terminal: Mapping[str, object],
) -> dict[str, bytes]:
    summaries = terminal.get("processes")
    if type(summaries) is not list or any(type(row) is not dict for row in summaries):
        raise VerificationError("terminal process list is malformed")
    names = tuple(row.get("name") for row in summaries)
    if names != EXPECTED_PROCESS_NAMES:
        raise VerificationError(
            "success process set/order is not the designed five-process run"
        )
    commands = manifest.get("commands")
    if type(commands) is not dict:
        raise VerificationError("command manifest is malformed")
    streams: dict[str, bytes] = {}
    for summary in summaries:
        if set(summary) != {
            "name",
            "receipt",
            "receipt_sha256",
            "status",
            "returncode",
        }:
            raise VerificationError("process summary keys drifted")
        name = summary["name"]
        expected_receipt = f"{name}.process.json"
        if (
            summary["receipt"] != expected_receipt
            or summary["status"] != "COMPLETED"
            or summary["returncode"] != EXPECTED_RETURN_CODES[name]
        ):
            raise VerificationError(f"process summary drift: {name}")
        receipt_data = _read_regular(root / expected_receipt, f"{name} receipt")
        if summary["receipt_sha256"] != _sha256(receipt_data):
            raise VerificationError(f"process receipt digest mismatch: {name}")
        receipt = _strict_json(receipt_data, f"{name} receipt")
        _validate_self_hash(receipt, "process_receipt_sha256", f"{name} receipt")
        if (
            receipt.get("schema") != PROCESS_SCHEMA
            or receipt.get("name") != name
            or receipt.get("status") != "COMPLETED"
            or receipt.get("returncode") != EXPECTED_RETURN_CODES[name]
            or receipt.get("command") != commands.get(EXPECTED_COMMAND_KEYS[name])
        ):
            raise VerificationError(f"process receipt relabel/drift: {name}")
        elapsed = receipt.get("elapsed_ms")
        if type(elapsed) is not int or elapsed < 0:
            raise VerificationError(f"process elapsed time is malformed: {name}")
        for stream_name in ("stdout", "stderr"):
            row = receipt.get(stream_name)
            expected_path = f"{name}.{stream_name}"
            if type(row) is not dict or set(row) != {"path", "sha256", "size"}:
                raise VerificationError(
                    f"process stream row malformed: {expected_path}"
                )
            data = _read_regular(root / expected_path, expected_path)
            if (
                row.get("path") != expected_path
                or row.get("sha256") != _sha256(data)
                or row.get("size") != len(data)
            ):
                raise VerificationError(f"process stream drift: {expected_path}")
            streams[expected_path] = data
    if streams["cadical-version.stderr"] or streams["production-cadical.stderr"]:
        raise VerificationError("version/production stderr is not empty")
    if _status_lines(streams["smoke-sat.stdout"]) != ["s SATISFIABLE"]:
        raise VerificationError("SAT smoke did not record SAT")
    if _parse_complete_model(streams["smoke-sat.stdout"], 1) != {1: True}:
        raise VerificationError("SAT smoke model does not satisfy its hand-known CNF")
    if _status_lines(streams["smoke-unsat.stdout"]) != ["s UNSATISFIABLE"]:
        raise VerificationError("UNSAT smoke did not record UNSAT")
    if _status_lines(streams["production-cadical.stdout"]) != ["s SATISFIABLE"]:
        raise VerificationError("production process did not record SAT")
    trim_lines = _status_lines(streams["smoke-unsat-drat-trim.stdout"])
    if trim_lines != ["s VERIFIED"]:
        raise VerificationError("smoke DRAT was not recorded VERIFIED")
    return streams


def _bundle_from_disk(root: Path, encoder: ModuleType) -> Any:
    return encoder.Bundle(
        _read_regular(root / "problem.cnf", "problem CNF"),
        _read_regular(root / "problem.map.json", "problem map"),
        _read_regular(root / "problem.sources.json", "problem sources"),
        _read_regular(root / "problem.manifest.json", "problem manifest"),
    )


def _historical_source_snapshot(
    source_bytes: bytes, encoder: ModuleType
) -> dict[str, object]:
    """Authenticate the stored run-time snapshot without reading live Lean files."""

    if _sha256(source_bytes) != EXPECTED_PROBLEM_SOURCES_SHA256:
        raise VerificationError("historical source snapshot digest changed")
    document = _strict_json(source_bytes, "historical problem sources")
    if (
        document.get("schema") != encoder.SOURCE_SCHEMA
        or document.get("commit") != encoder.LEAN_COMMIT
        or encoder.LEAN_COMMIT != "8a8c2c49528bf2a4521abf94f2d65b4275ef1268"
    ):
        raise VerificationError("historical source snapshot commit/schema drift")
    files = document.get("files")
    expected_hashes = encoder.SOURCE_HASHES
    if type(files) is not list or len(files) != len(expected_hashes):
        raise VerificationError("historical source snapshot inventory drift")
    expected_paths = sorted(expected_hashes)
    actual_paths = [row.get("path") for row in files if type(row) is dict]
    if actual_paths != expected_paths:
        raise VerificationError("historical source snapshot paths drift")
    for row in files:
        if type(row) is not dict or set(row) != {"path", "sha256", "size"}:
            raise VerificationError("historical source snapshot row is malformed")
        path = row["path"]
        if (
            row["sha256"] != expected_hashes[path]
            or type(row["size"]) is not int
            or row["size"] <= 0
        ):
            raise VerificationError("historical source snapshot hash/size drift")
    return document


def _regenerate_bundle(
    root: Path, encoder: ModuleType
) -> tuple[Any, dict[str, object]]:
    recorded = _bundle_from_disk(root, encoder)
    source_document = _historical_source_snapshot(recorded.sources, encoder)
    encoder.run_encoding_controls()
    encoding = encoder.encode(17)
    cnf = encoder._dimacs(encoding)
    variable_map = encoder._canonical_json(encoder._map_document(encoding))
    sources = encoder._canonical_json(source_document)
    family_counts = Counter(clause.family for clause in encoding.clauses)
    manifest = {
        "schema": encoder.MANIFEST_SCHEMA,
        "n": encoding.n,
        "lean_commit": encoder.LEAN_COMMIT,
        "source_total": encoder.SOURCE_TOTAL_CLAIM,
        "launch_enabled": encoder.PRODUCTION_LAUNCH_ENABLED,
        "solver_run": False,
        "solver_verdict": None,
        "generic_cardinality_lift": False,
        "finite_encoding_emitted": True,
        "query_is_separate_assumption": True,
        "query": encoder.QUERY,
        "omitted_relaxations": list(encoder.OMITTED_RELAXATIONS),
        "variables": len(encoding.variables),
        "clauses": len(encoding.clauses),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "predecessor": encoding.semantic_contract["predecessor"],
        "clause_delta": encoder._delta_document(encoding),
        "cnf_sha256": _sha256(cnf),
        "map_sha256": _sha256(variable_map),
        "sources_sha256": _sha256(sources),
    }
    manifest["manifest_sha256"] = _sha256(encoder._canonical_json(manifest))
    regenerated = encoder.Bundle(
        cnf, variable_map, sources, encoder._canonical_json(manifest)
    )
    for name, actual, expected in (
        ("CNF", recorded.cnf, regenerated.cnf),
        ("map", recorded.variable_map, regenerated.variable_map),
        ("sources", recorded.sources, regenerated.sources),
        ("manifest", recorded.manifest, regenerated.manifest),
    ):
        if actual != expected:
            raise VerificationError(
                f"recorded {name} is not byte-identical regeneration"
            )
    manifest = _strict_json(regenerated.manifest, "regenerated problem manifest")
    return regenerated, manifest


def _semantic_readback(
    encoder: ModuleType,
    manifest: Mapping[str, object],
    mapping: Mapping[str, object],
    assignment: Mapping[int, bool],
) -> dict[str, object]:
    variables = mapping.get("variables")
    if type(variables) is not list:
        raise VerificationError("variable map is malformed")
    role_to_id: dict[str, int] = {}
    for row in variables:
        if (
            type(row) is not dict
            or type(row.get("role")) is not str
            or type(row.get("id")) is not int
        ):
            raise VerificationError("variable map row is malformed")
        role_to_id[row["role"]] = row["id"]

    def enabled(role: str) -> bool:
        identifier = role_to_id.get(role)
        if identifier is None:
            raise VerificationError(f"semantic variable is missing: {role}")
        return assignment[identifier]

    n = manifest.get("n")
    if n != 17:
        raise VerificationError("semantic cardinality drift")
    blockers: dict[str, int] = {}
    for source in range(n):
        selected = [
            center for center in range(n) if enabled(f"blocker/{source}/{center}")
        ]
        if len(selected) != 1 or selected[0] == source:
            raise VerificationError(
                "blocker readback violates total/no-fixed semantics"
            )
        blockers[str(source)] = selected[0]
    selected_roles: dict[str, int] = {}
    for role in encoder.ROLES:
        selected = [index for index in range(n) if enabled(f"role/{role}/{index}")]
        if len(selected) != 1:
            raise VerificationError("named-role readback is not exact")
        selected_roles[role] = selected[0]
    row_cards = [
        sum(enabled(f"row/{source}/{x}") for x in range(n)) for source in range(n)
    ]
    if set(row_cards) != {4}:
        raise VerificationError("selected-row readback is not exact-four")
    cap_cards = [sum(enabled(f"cap/{x}/{cap}") for x in range(n)) for cap in range(3)]
    if sum(cap_cards) != n + 3:
        raise VerificationError("cap-sum readback failed")
    escape_support = [x for x in range(n) if enabled(f"escape/support/{x}")]
    escape_witness = [x for x in range(n) if enabled(f"escape/witness/{x}")]
    if len(escape_support) != 4 or len(escape_witness) != 1:
        raise VerificationError("escape readback has malformed cardinality")
    q_overlap = sum(
        enabled(f"escape/support/{x}") and enabled(f"named_row/{encoder.Q1}/{x}")
        for x in range(n)
    )
    if q_overlap > 2:
        raise VerificationError("escape readback violates Q-overlap bound")
    return {
        "all_emitted_clauses_satisfied": True,
        "variable_count": manifest["variables"],
        "clause_count": manifest["clauses"],
        "blocker_centers": blockers,
        "selected_roles": selected_roles,
        "row_cards": row_cards,
        "cap_cards": cap_cards,
        "cap_sum": sum(cap_cards),
        "first_interaction_arms": {
            arm: enabled(f"first_interaction/{arm}") for arm in ("same", "omission")
        },
        "second_interaction_arms": {
            arm: enabled(f"second_interaction/{arm}")
            for arm in ("same", "omission", "different_cap", "same_cap")
        },
        "hingress_arms": {
            "retained": enabled("hingress/retained"),
            "common_payload_free": enabled("hingress/common_payload_free"),
        },
        "escape_support": escape_support,
        "escape_witness": escape_witness[0],
        "escape_q_overlap": q_overlap,
        "source_total": False,
        "semantic_scope": "sound finite relaxation at exact n; no cardinality lift",
    }


def _validate_model_and_delta(
    encoder: ModuleType,
    bundle: Any,
    manifest: Mapping[str, object],
    stdout: bytes,
    expected_readback: object,
) -> tuple[int, int]:
    variable_count = manifest.get("variables")
    clause_count = manifest.get("clauses")
    if variable_count != 93075 or clause_count != 445258:
        raise VerificationError("production encoding count drift")
    assignment = _parse_complete_model(stdout, variable_count)
    mapping = _strict_json(bundle.variable_map, "regenerated problem map")
    clauses = mapping.get("clauses")
    if type(clauses) is not list or len(clauses) != clause_count:
        raise VerificationError("production clause map count drift")
    checked = 0
    for row in clauses:
        if type(row) is not dict or type(row.get("literals")) is not list:
            raise VerificationError("production clause map row is malformed")
        literals = row["literals"]
        if not any(assignment[abs(literal)] == (literal > 0) for literal in literals):
            raise VerificationError(f"SAT model falsifies clause {row.get('id')}")
        checked += 1
    if checked != 445258:
        raise VerificationError("not every production clause was checked")
    delta = manifest.get("clause_delta")
    if (
        type(delta) is not dict
        or delta.get("count") != 6
        or delta.get("all_positive_units") is not True
    ):
        raise VerificationError("six-unit delta metadata drift")
    delta_rows = delta.get("clauses")
    if type(delta_rows) is not list or len(delta_rows) != 6:
        raise VerificationError("six-unit delta rows drift")
    for offset, row in enumerate(delta_rows):
        clause = clauses[encoder.PREDECESSOR_CLAUSES + offset]
        if (
            type(row) is not dict
            or row.get("id") != encoder.PREDECESSOR_CLAUSES + offset + 1
            or clause.get("id") != row.get("id")
            or clause.get("role") != row.get("role")
            or clause.get("family") != "apex_cross_cap_membership"
            or clause.get("literals") != [row.get("literal")]
            or type(row.get("literal")) is not int
            or row["literal"] <= 0
            or assignment[row["literal"]] is not True
        ):
            raise VerificationError("six-unit delta does not replay in the SAT model")
    readback = _semantic_readback(encoder, manifest, mapping, assignment)
    if expected_readback != readback:
        raise VerificationError(
            "terminal semantic readback does not independently replay"
        )
    return checked, len(delta_rows)


def verify_run(run_root: Path | None = None) -> dict[str, object]:
    """Authenticate the frozen successful run using reads and pure computation only."""

    root = _validate_root_identity(
        _repo_root() / EXPECTED_RUN_RELATIVE if run_root is None else run_root
    )
    manifest_data = _read_regular(root / "run-manifest.json", "run manifest")
    if _sha256(manifest_data) != EXPECTED_RUN_MANIFEST_SHA256:
        raise VerificationError("immutable run manifest digest changed")
    manifest = _strict_json(manifest_data, "run manifest")
    _validate_run_manifest(manifest, root)
    terminal_data = _read_regular(root / "terminal-receipt.json", "terminal receipt")
    if _sha256(terminal_data) != EXPECTED_TERMINAL_RECEIPT_SHA256:
        raise VerificationError("immutable terminal receipt digest changed")
    terminal = _strict_json(terminal_data, "terminal receipt")
    _validate_self_hash(terminal, "terminal_receipt_sha256", "terminal receipt")
    if (
        terminal.get("schema") != RECEIPT_SCHEMA
        or terminal.get("status") != "SAT"
        or terminal.get("source_total") is not False
        or terminal.get("all_emitted_hard_clauses_source_mapped") is not True
        or terminal.get("independent_audit") != EXPECTED_AUDIT
        or terminal.get("no_cegar_successor") is not True
        or terminal.get("theorem_bank_search_run") is not False
        or terminal.get("run_manifest_sha256") != _sha256(manifest_data)
    ):
        raise VerificationError("terminal receipt boundary/binding drift")
    artifact_count = _validate_artifact_inventory(root, terminal)
    encoder, source_count = _authenticate_and_load_encoder(manifest)
    result = terminal.get("result")
    if type(result) is not dict or set(result) != {
        "verdict",
        "binary_versions",
        "model_readback",
    }:
        raise VerificationError("terminal SAT result is malformed")
    if result.get("verdict") != "SAT":
        raise VerificationError("terminal result was relabeled")
    versions, binary_count = _validate_binary_versions(root, manifest, result)
    streams = _validate_processes(root, manifest, terminal)
    if (
        streams["cadical-version.stdout"].decode("ascii").strip()
        != versions["versions"]["cadical"]
    ):
        raise VerificationError("CaDiCaL version stream does not bind binary versions")
    if _read_regular(root / "smoke-sat.cnf", "SAT smoke CNF") != SMOKE_SAT_CNF:
        raise VerificationError("hand-known SAT smoke CNF changed")
    if _read_regular(root / "smoke-unsat.cnf", "UNSAT smoke CNF") != SMOKE_UNSAT_CNF:
        raise VerificationError("hand-known UNSAT smoke CNF changed")
    proof = _read_regular(root / "smoke-unsat.drat", "recorded smoke DRAT")
    if not proof:
        raise VerificationError("recorded smoke DRAT is empty")
    bundle, encoding_manifest = _regenerate_bundle(root, encoder)
    expected_encoding = {
        "variables": encoding_manifest["variables"],
        "clauses": encoding_manifest["clauses"],
        "cnf_sha256": encoding_manifest["cnf_sha256"],
        "manifest_sha256": encoding_manifest["manifest_sha256"],
        "source_total": encoding_manifest["source_total"],
        "predecessor": encoding_manifest["predecessor"],
        "clause_delta": encoding_manifest["clause_delta"],
    }
    if manifest.get("encoding") != expected_encoding:
        raise VerificationError("run manifest encoding summary does not regenerate")
    clauses_checked, delta_checked = _validate_model_and_delta(
        encoder,
        bundle,
        encoding_manifest,
        streams["production-cadical.stdout"],
        result.get("model_readback"),
    )
    _validate_artifact_inventory(root, terminal)
    if (
        _read_regular(root / "terminal-receipt.json", "terminal receipt")
        != terminal_data
    ):
        raise VerificationError("terminal receipt changed during verification")
    return {
        "schema": VERIFY_SCHEMA,
        "status": "VERIFIED",
        "verdict": "SAT",
        "solver_calls": 0,
        "writes": 0,
        "run_root": str(root),
        "terminal_receipt_sha256": terminal["terminal_receipt_sha256"],
        "artifact_count": artifact_count,
        "source_dependencies_verified": source_count,
        "binaries_verified": binary_count,
        "processes_verified": list(EXPECTED_PROCESS_NAMES),
        "sat_smoke_verified": True,
        "unsat_smoke_recorded": True,
        "smoke_drat_recorded_verified": True,
        "bundle_byte_identical": True,
        "historical_source_snapshot_verified": True,
        "live_lean_worktree_consulted": False,
        "complete_model_variables": encoding_manifest["variables"],
        "clauses_checked": clauses_checked,
        "delta_units_checked": delta_checked,
        "semantic_readback_verified": True,
        "source_total": False,
        "semantic_scope": "sound finite relaxation at exact n; no cardinality lift",
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path, default=None)
    args = parser.parse_args(argv)
    try:
        report = verify_run(args.run_root)
    except VerificationError as exc:
        parser.error(str(exc))
    print(json.dumps(report, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
