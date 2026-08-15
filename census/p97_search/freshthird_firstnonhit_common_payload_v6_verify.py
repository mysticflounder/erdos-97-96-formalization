# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Read-only external verifier for the completed common-payload v6 SAT run.

The verifier authenticates every source row frozen by the run manifest before
executing the launch runner, then replays the v6 boundary, artifact inventory,
process receipts, complete SAT assignment, and semantic model readback.  It
never launches a process and never writes.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from collections.abc import Iterator, Mapping, Sequence
from contextlib import contextmanager
from pathlib import Path, PurePosixPath
from types import ModuleType
from typing import Any

sys.dont_write_bytecode = True

VERIFY_SCHEMA = "p97-freshthird-firstnonhit-common-payload-v6/external-verifier/v1"
RUN_SCHEMA = "p97-freshthird-firstnonhit-common-payload-v6/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
EXPECTED_REPO_ROOT = Path(
    "/Users/adam/projects/math-projects/erdos-97-96-formalization"
)
VERIFIER_RELATIVE = (
    "census/p97_search/freshthird_firstnonhit_common_payload_v6_verify.py"
)
EXPECTED_RUN_RELATIVE = (
    "scratch/runs/firstnonhit-common-payload-v6/n17-one-shot-audit-approved"
)
EXPECTED_RUN_MANIFEST_SHA256 = (
    "0009d660273a58a9b1c408930e1e99c3fa14e1b248d94dbc039edbb581c4ce5a"
)
EXPECTED_TERMINAL_RECEIPT_FILE_SHA256 = (
    "99daf13f456aef080d4cad33a8e6b41c8cb88321cbb428875044f8b79c38db9e"
)
EXPECTED_TERMINAL_RECEIPT_SELF_SHA256 = (
    "6f5f96d37c943938f3831315a658cdc54b7efb59b172bd7b9bbe457703887c0d"
)
EXPECTED_CNF_SHA256 = (
    "a520b6195e0337b629224835c51aa8a4e6b57088d898a32cc7318e71b0a6e403"
)
EXPECTED_COUNTS = {"variables": 93_280, "clauses": 606_898}
EXPECTED_PROCESS_NAMES = (
    "cadical-version",
    "smoke-sat",
    "smoke-unsat",
    "smoke-unsat-drat-trim",
    "production-cadical",
)
EXPECTED_COMMAND_KEYS = {
    "cadical-version": "cadical_version",
    "smoke-sat": "smoke_sat",
    "smoke-unsat": "smoke_unsat",
    "smoke-unsat-drat-trim": "smoke_unsat_drat_trim",
    "production-cadical": "production",
}
PACKAGE_MODULE = "census"
SEARCH_PACKAGE_MODULE = "census.p97_search"
V2_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_complete_finite_v2"
V3_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_cap_endpoint_v3"
V4_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_all_large_caps_v4"
V5_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_overlap_v5"
V6_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_common_payload_v6"
RUNNER_MODULE = f"{SEARCH_PACKAGE_MODULE}.freshthird_firstnonhit_common_payload_v6_run"
EXPECTED_SOURCE_PATHS = {
    "checkpoint": ".codex/worktree-checkpoints/firstnonhit-common-payload-v6.json",
    "encoder_v5": "census/p97_search/freshthird_firstnonhit_overlap_v5.py",
    "encoder_v6": (
        "census/p97_search/freshthird_firstnonhit_common_payload_v6.py"
    ),
    "runner": (
        "census/p97_search/freshthird_firstnonhit_common_payload_v6_run.py"
    ),
    "runner_v5": "census/p97_search/freshthird_firstnonhit_overlap_v5_run.py",
}
TRANSITIVE_SOURCE_PATHS = {
    "encoder_v2": "census/p97_search/freshthird_firstnonhit_complete_finite_v2.py",
    "encoder_v3": "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3.py",
    "encoder_v4": "census/p97_search/freshthird_firstnonhit_all_large_caps_v4.py",
    "runner_base": (
        "census/p97_search/freshthird_firstnonhit_all_large_caps_v4_run.py"
    ),
}
TRANSITIVE_SOURCE_IDENTITIES = {
    "encoder_v2": {
        "sha256": "31273114c0b7d16505da257ce33e98eed25185b4aad1135b575e88421d47fa61",
        "size": 60_907,
    },
    "encoder_v3": {
        "sha256": "e7ef7ff2e5827f8d8dd1312a1a357dd66abf3dc5efb967cd5bd168cc34f4c034",
        "size": 20_309,
    },
    "encoder_v4": {
        "sha256": "8b528a3fd0269c235775ebc9595866c5ca9c7c99d992237eb17817047eb19e39",
        "size": 22_049,
    },
    "runner_base": {
        "sha256": "8e4ad80ebb4cc9e2e110d59998483e2531bfa2f7a949602f2678d8b85b72abc6",
        "size": 57_309,
    },
}
EXPECTED_SOURCE_IDENTITIES = {
    "checkpoint": {
        "sha256": "180667f893fdf108b1d0363f033717e982c5b099272822f898d3b63a5c086c73",
        "size": 852,
    },
    "encoder_v5": {
        "sha256": "6bf562662f826a51eba2b56d555476faeb84a234603c06ecefac8874501c74c3",
        "size": 28_486,
    },
    "encoder_v6": {
        "sha256": "317967139dfdca861a0e7c2eb28d572a98eab34ac44abe7818a42385613c7d76",
        "size": 33_404,
    },
    "runner": {
        "sha256": "4a49ee7de5a8627168df9db65e145089719974d7b085a819af4054c3eb09d864",
        "size": 24_037,
    },
    "runner_v5": {
        "sha256": "4603445de8f7cc087e4ebf132f003f9eaf284d124ebcb81981f688d9fce4bea4",
        "size": 41_508,
    },
}
EXPECTED_AUDIT = {
    "status": "APPROVED",
    "scope": (
        "exact v6 emitted CNF, all 30 common-payload fields, source map, "
        "independent-surface boundary, runner, and model readback"
    ),
    "counts_expected": EXPECTED_COUNTS,
    "cnf_sha256_expected": EXPECTED_CNF_SHA256,
    "counts_reproduced": EXPECTED_COUNTS,
    "cnf_sha256_reproduced": EXPECTED_CNF_SHA256,
    "payload_field_coverage_reproduced": 30,
    "source_map_audited": True,
    "no_unsound_clause_found": True,
    "launch_authorized": True,
}
EXPECTED_PRODUCTION_PATH = {
    "custody_base": {
        "path": EXPECTED_SOURCE_PATHS["runner_v5"],
        **EXPECTED_SOURCE_IDENTITIES["runner_v5"],
    },
    "predecessor_encoder": {
        "path": EXPECTED_SOURCE_PATHS["encoder_v5"],
        **EXPECTED_SOURCE_IDENTITIES["encoder_v5"],
    },
    "v6_encoder": {
        "path": EXPECTED_SOURCE_PATHS["encoder_v6"],
        **EXPECTED_SOURCE_IDENTITIES["encoder_v6"],
    },
    "v6_common_payload_semantic_readback": True,
}
EXPECTED_LEAN_INGRESS = {
    "commit": "c8063884754baeef54dd64fae255b72f0e9d1d32",
    "sources": {
        "aggregate_hingress": {
            "declaration": "firstNonHitFiniteHingressPayload_nonempty",
            "path": (
                "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                "FirstNonHitFiniteHingressPayload.lean"
            ),
            "sha256": (
                "06ca4a180db7844daf6f2798e93449e7f2b0bceb962d9c64459145f4d80b6462"
            ),
            "size": 4_071,
        },
        "common_payload": {
            "declaration": "FirstNonHitFiniteCommonRadiusPayload.ofWitness",
            "path": (
                "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                "FirstNonHitCommonRadiusFinitePayload.lean"
            ),
            "sha256": (
                "cea8d0d20cf10bc53aa541566c9ada6ad420a95738b4f2b801742d8714010f0b"
            ),
            "size": 20_367,
        },
    },
}


class VerificationError(RuntimeError):
    """The completed run failed closed external authentication."""


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


def _repo_root() -> Path:
    expected = EXPECTED_REPO_ROOT / VERIFIER_RELATIVE
    actual = Path(os.path.abspath(__file__))
    _reject_symlink_ancestors(actual)
    if actual != expected or actual.resolve() != expected:
        raise VerificationError("external verifier module was source-shadowed")
    return EXPECTED_REPO_ROOT


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
    descriptor, _info = _open_regular(path, description)
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
    absolute = Path(os.path.abspath(root if root.is_absolute() else _repo_root() / root))
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


def _authenticate_launch_sources(
    manifest: Mapping[str, object],
) -> dict[str, tuple[Path, bytes]]:
    """Authenticate every manifest source row before any project-code import."""

    rows = manifest.get("source_hashes")
    if type(rows) is not dict or set(rows) != set(EXPECTED_SOURCE_PATHS):
        raise VerificationError("source hash inventory is malformed")
    authenticated: dict[str, tuple[Path, bytes]] = {}
    for name, expected_path in EXPECTED_SOURCE_PATHS.items():
        expected_identity = EXPECTED_SOURCE_IDENTITIES[name]
        expected_row = {"path": expected_path, **expected_identity}
        if rows.get(name) != expected_row:
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
        or checkpoint.get("lane_id") != "firstnonhit-common-payload-v6"
        or checkpoint.get("generated_roots") != [EXPECTED_RUN_RELATIVE]
        or checkpoint.get("manifest_sha256")
        != "0f03992ffef36cba07f14767ea532106b69353e9e0e321a12f3d8b126d51b374"
    ):
        raise VerificationError("frozen checkpoint registration drift")
    return authenticated


def _authenticate_transitive_sources() -> dict[str, tuple[Path, bytes]]:
    authenticated: dict[str, tuple[Path, bytes]] = {}
    for name, relative in TRANSITIVE_SOURCE_PATHS.items():
        identity = TRANSITIVE_SOURCE_IDENTITIES[name]
        path = _repo_root() / relative
        data = _read_regular(path, f"authenticated transitive dependency {name}")
        if _sha256(data) != identity["sha256"] or len(data) != identity["size"]:
            raise VerificationError(f"transitive dependency changed: {name}")
        authenticated[name] = (path, data)
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
    module = ModuleType(module_name)
    module.__file__ = str(path)
    module.__package__ = module_name.rpartition(".")[0]
    sys.modules[module_name] = module
    code = compile(data, str(path), "exec", dont_inherit=True)
    exec(code, module.__dict__)  # noqa: S102 - bytes authenticated above
    return _assert_module_identity(module, path, module_name)


@contextmanager
def _authenticated_runtime(
    launch_sources: Mapping[str, tuple[Path, bytes]],
    transitive_sources: Mapping[str, tuple[Path, bytes]],
) -> Iterator[ModuleType]:
    """Install a synthetic authenticated package tree, then restore all of it."""

    module_sources = (
        (V2_MODULE, *transitive_sources["encoder_v2"]),
        (V3_MODULE, *transitive_sources["encoder_v3"]),
        (V4_MODULE, *transitive_sources["encoder_v4"]),
        (V5_MODULE, *launch_sources["encoder_v5"]),
        (V6_MODULE, *launch_sources["encoder_v6"]),
    )
    for name, path, _data in module_sources:
        existing = sys.modules.get(name)
        if existing is not None:
            _assert_module_identity(existing, path, f"preloaded {name}")

    previous = {
        name: module
        for name, module in sys.modules.items()
        if name == PACKAGE_MODULE or name.startswith(f"{PACKAGE_MODULE}.")
    }

    def restore() -> None:
        for name in tuple(sys.modules):
            if name == PACKAGE_MODULE or name.startswith(f"{PACKAGE_MODULE}."):
                sys.modules.pop(name, None)
        sys.modules.update(previous)

    package = ModuleType(PACKAGE_MODULE)
    package.__package__ = PACKAGE_MODULE
    package.__path__ = [str(_repo_root() / "census")]
    search_package = ModuleType(SEARCH_PACKAGE_MODULE)
    search_package.__package__ = SEARCH_PACKAGE_MODULE
    search_package.__path__ = [str(_repo_root() / "census/p97_search")]
    package.p97_search = search_package
    sys.modules[PACKAGE_MODULE] = package
    sys.modules[SEARCH_PACKAGE_MODULE] = search_package
    try:
        loaded: dict[str, ModuleType] = {}
        for name, path, data in module_sources:
            module = _execute_authenticated_module(name, path, data)
            setattr(search_package, name.rpartition(".")[2], module)
            loaded[name] = module
        if (
            getattr(loaded[V3_MODULE], "v2", None) is not loaded[V2_MODULE]
            or getattr(loaded[V4_MODULE], "v2", None) is not loaded[V2_MODULE]
            or getattr(loaded[V4_MODULE], "v3", None) is not loaded[V3_MODULE]
            or getattr(loaded[V5_MODULE], "v2", None) is not loaded[V2_MODULE]
            or getattr(loaded[V5_MODULE], "v4", None) is not loaded[V4_MODULE]
            or getattr(loaded[V6_MODULE], "v2", None) is not loaded[V2_MODULE]
            or getattr(loaded[V6_MODULE], "v5", None) is not loaded[V5_MODULE]
        ):
            raise VerificationError("authenticated v2-v6 dependency binding drift")
        runner = _execute_authenticated_module(RUNNER_MODULE, *launch_sources["runner"])
        setattr(search_package, RUNNER_MODULE.rpartition(".")[2], runner)
        yield runner
    finally:
        restore()


def _validate_manifest(manifest: Mapping[str, object], root: Path) -> None:
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
        "cross_check_effective": False,
        "timeout_seconds": 3_600,
        "lean_ingress": EXPECTED_LEAN_INGRESS,
        "production_path": EXPECTED_PRODUCTION_PATH,
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


def _validate_artifact_inventory(
    root: Path, terminal: Mapping[str, object]
) -> int:
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


def _validate_receipt_boundary(
    receipt: Mapping[str, object], manifest_data: bytes
) -> None:
    _validate_self_hash(receipt, "terminal_receipt_sha256", "terminal receipt")
    expected = {
        "schema": RECEIPT_SCHEMA,
        "status": "SAT",
        "source_total": False,
        "all_emitted_hard_clauses_source_mapped": True,
        "independent_audit": EXPECTED_AUDIT,
        "no_cegar_successor": True,
        "theorem_bank_search_run": False,
        "cross_check_requested": False,
        "cross_check_effective": False,
        "run_manifest_sha256": _sha256(manifest_data),
        "terminal_receipt_sha256": EXPECTED_TERMINAL_RECEIPT_SELF_SHA256,
    }
    for field, value in expected.items():
        if receipt.get(field) != value:
            raise VerificationError(f"terminal receipt boundary drift: {field}")


def _validate_process_commands(
    root: Path,
    manifest: Mapping[str, object],
    receipt: Mapping[str, object],
) -> tuple[str, ...]:
    summaries = receipt.get("processes")
    if type(summaries) is not list or any(type(row) is not dict for row in summaries):
        raise VerificationError("terminal process list is malformed")
    names = tuple(row.get("name") for row in summaries)
    if names != EXPECTED_PROCESS_NAMES:
        raise VerificationError("terminal process sequence drifted")
    commands = manifest.get("commands")
    if type(commands) is not dict:
        raise VerificationError("run command inventory is malformed")
    for name in names:
        process_data = _read_regular(root / f"{name}.process.json", f"{name} receipt")
        process = _strict_json(process_data, f"{name} receipt")
        if process.get("command") != commands.get(EXPECTED_COMMAND_KEYS[name]):
            raise VerificationError(f"process command boundary drift: {name}")
    return names


def _forbidden_process(*_args: object, **_kwargs: object) -> object:
    raise VerificationError("external verifier attempted a process call")


def _verify_with_authenticated_runner(
    root: Path,
    manifest: Mapping[str, object],
    manifest_data: bytes,
    launch_runner: ModuleType,
) -> dict[str, object]:
    configured: Any = launch_runner._load_authenticated_runner_base()
    configured._run_process = _forbidden_process
    launch_runner.v5_runner._validate_terminal_binaries(manifest, configured)

    receipt_data = _read_regular(root / "terminal-receipt.json", "terminal receipt")
    if _sha256(receipt_data) != EXPECTED_TERMINAL_RECEIPT_FILE_SHA256:
        raise VerificationError("terminal receipt file digest drift")
    receipt = _strict_json(receipt_data, "terminal receipt")
    _validate_receipt_boundary(receipt, manifest_data)
    artifact_count = _validate_artifact_inventory(root, receipt)

    bundle = launch_runner.emitter.Bundle(
        _read_regular(root / "problem.cnf", "problem CNF"),
        _read_regular(root / "problem.map.json", "problem map"),
        _read_regular(root / "problem.sources.json", "problem sources"),
        _read_regular(root / "problem.manifest.json", "problem manifest"),
    )
    encoding_manifest = launch_runner.emitter.validate_bundle(bundle)
    encoding = configured._encoding_summary(encoding_manifest)
    if manifest.get("encoding") != encoding:
        raise VerificationError("v6 encoding metadata does not replay")
    if manifest.get("predecessor_model_control") != (
        launch_runner._predecessor_model_control()
    ):
        raise VerificationError("predecessor-model control does not replay")
    process_names = _validate_process_commands(root, manifest, receipt)
    configured._validate_terminal_evidence(root, receipt, bundle, False)

    result = receipt.get("result")
    if type(result) is not dict or result.get("verdict") != "SAT":
        raise VerificationError("terminal SAT result is malformed")
    model = result.get("model_readback")
    if (
        type(model) is not dict
        or model.get("all_emitted_clauses_satisfied") is not True
        or model.get("v5_semantic_validation") is not True
        or model.get("v6_semantic_validation") is not True
        or model.get("variable_count") != EXPECTED_COUNTS["variables"]
        or model.get("clause_count") != EXPECTED_COUNTS["clauses"]
        or model.get("common_payload_field_count") != 30
        or model.get("common_surface_identified_with_c") is not False
    ):
        raise VerificationError("terminal v6 semantic model boundary drift")
    return {
        "schema": VERIFY_SCHEMA,
        "status": "SAT",
        "verified": True,
        "solver_calls": 0,
        "run_root": str(root),
        "run_manifest_sha256": EXPECTED_RUN_MANIFEST_SHA256,
        "terminal_receipt_file_sha256": EXPECTED_TERMINAL_RECEIPT_FILE_SHA256,
        "terminal_receipt_self_sha256": EXPECTED_TERMINAL_RECEIPT_SELF_SHA256,
        "artifact_count": artifact_count,
        "processes_validated": list(process_names),
        "encoding": encoding,
        "source_identities": EXPECTED_SOURCE_IDENTITIES,
        "model_readback": model,
    }


def verify_run(run_root: Path | None = None) -> dict[str, object]:
    root = _validate_root_identity(
        Path(EXPECTED_RUN_RELATIVE) if run_root is None else run_root
    )
    manifest_data = _read_regular(root / "run-manifest.json", "run manifest")
    if _sha256(manifest_data) != EXPECTED_RUN_MANIFEST_SHA256:
        raise VerificationError("run manifest file digest drift")
    manifest = _strict_json(manifest_data, "run manifest")
    _validate_manifest(manifest, root)
    launch_sources = _authenticate_launch_sources(manifest)
    transitive_sources = _authenticate_transitive_sources()
    with _authenticated_runtime(launch_sources, transitive_sources) as launch_runner:
        return _verify_with_authenticated_runner(
            root, manifest, manifest_data, launch_runner
        )


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path)
    args = parser.parse_args(argv)
    print(json.dumps(verify_run(args.run_root), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
