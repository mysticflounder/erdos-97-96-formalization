"""Authenticated one-worker PIQD/Z3 route for A-core metric projections.

This is finite diagnostic infrastructure.  SAT is retained only after the
endpoint metric replayer checks every asserted atom over exact rationals.
PIQD's proofless QF_NRA UNSAT is diagnostic only; UNKNOWN and every error are
inconclusive.  This module never invokes a local solver and has no fallback.
"""

from __future__ import annotations

import argparse
import json
import math
import os
import stat
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

from census.endpoint_confinement import metric_realizability_piqd as metric_piqd
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

RESULT_SCHEMA = "p97-a-core-metric-piqd-result/v1"
SOURCE_SCHEMA = "p97-a-core-metric-piqd-source/v1"
DESCRIPTOR_SCHEMA = "p97-a-core-metric-piqd-query/v1"
PROFILE_SCHEMA = "p97-a-core-piqd-z3-qfnra-one-shot/v1"
NORMALIZATION_SCHEMA = "p97-a-core-metric-smt-normalization/v1"
STAGES = metric_piqd.STAGES
MAX_CAPTURED_FILES = 16

PROOF_BLUEPRINT = {
    "session_id": "019fdf9c",
    "state": "OPEN",
    "relation": "OFF_SPINE",
    "changed": False,
}
FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
}


class ACoreMetricPiqdError(RuntimeError):
    """The A-core source, PIQD contract, or offline replay failed closed."""


@dataclass(frozen=True)
class _Capture:
    payload: bytes
    sha256: str
    identity: tuple[int, ...]


@dataclass(frozen=True)
class SourceBinding:
    a_core_dir: Path
    run: str
    cube: dict[str, Any]
    adaptation: dict[str, Any]
    captures: tuple[tuple[str, _Capture], ...]


@dataclass(frozen=True)
class PreparedStage:
    run: str
    order_index: int
    stage: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    query: neutral.SourceSemanticQuery


def _driver() -> Any:
    from census.p97_search import a_core_metric_driver as driver

    return driver


def _canonical(value: object) -> bytes:
    try:
        metric_piqd._validate_builtin_tree(value, "canonical artifact")
        return json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    except (TypeError, ValueError, metric_piqd.EndpointMetricPiqdError) as exc:
        raise ACoreMetricPiqdError("value is not canonical builtin JSON") from exc


def _source_canonical(value: object) -> bytes:
    """Canonicalize already parsed external JSON for a binding digest only."""

    try:
        return json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise ACoreMetricPiqdError("source value is not finite JSON") from exc


def _sha(payload: bytes) -> str:
    return metric_piqd._sha(payload)


def _require_path(value: object, where: str) -> None:
    if type(value) is not type(Path()):
        raise ACoreMetricPiqdError(f"{where} must be an exact platform Path")


def _capture_current(path: Path) -> _Capture:
    _require_path(path, "source")
    descriptor: int | None = None
    rebound: int | None = None
    try:
        descriptor = metric_piqd._open_file_nofollow(path)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise ACoreMetricPiqdError(f"source is not a private regular file: {path}")
        if before.st_size > metric_piqd.MAX_SOURCE_BYTES:
            raise ACoreMetricPiqdError(f"source exceeds byte cap: {path}")
        payload = metric_piqd._read_descriptor(descriptor, metric_piqd.MAX_SOURCE_BYTES)
        after = os.fstat(descriptor)
        identity = metric_piqd._identity(before)
        if len(payload) != before.st_size or metric_piqd._identity(after) != identity:
            raise ACoreMetricPiqdError(f"source changed while read: {path}")
        rebound = metric_piqd._open_file_nofollow(path)
        if metric_piqd._identity(os.fstat(rebound)) != identity:
            raise ACoreMetricPiqdError(f"source path changed while read: {path}")
        return _Capture(payload, _sha(payload), identity)
    except (OSError, metric_piqd.EndpointMetricPiqdError) as exc:
        raise ACoreMetricPiqdError(f"cannot authenticate source: {path}") from exc
    finally:
        if rebound is not None:
            os.close(rebound)
        if descriptor is not None:
            os.close(descriptor)


def _strict_json_bytes(payload: bytes, where: str) -> object:
    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    def reject_constant(value: str) -> None:
        raise ValueError(f"non-finite constant {value}")

    try:
        return json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=reject_duplicates,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise ACoreMetricPiqdError(f"{where} is not strict UTF-8 JSON") from exc


def _safe_relative(value: object, where: str) -> str:
    if type(value) is not str or not value or "\\" in value:
        raise ACoreMetricPiqdError(f"{where} is not a safe relative path")
    path = PurePosixPath(value)
    if (
        path.is_absolute()
        or str(path) != value
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        raise ACoreMetricPiqdError(f"{where} is not a safe relative path")
    return value


def _source_paths_from_manifest(
    a_core_dir: Path, manifest_capture: _Capture
) -> tuple[tuple[str, Path], ...]:
    manifest = _strict_json_bytes(manifest_capture.payload, "A-core manifest")
    if type(manifest) is not list:
        raise ACoreMetricPiqdError("A-core manifest must be an array")
    by_run = {
        item.get("run"): item
        for item in manifest
        if type(item) is dict and type(item.get("run")) is str
    }
    paths: list[tuple[str, Path]] = [
        ("out/manifest.json", a_core_dir / "out/manifest.json"),
        ("RESULTS.md", a_core_dir / "RESULTS.md"),
        (
            "../A-CORE-ENCODING-SPEC.md",
            a_core_dir.parent / "A-CORE-ENCODING-SPEC.md",
        ),
    ]
    for run in _driver().PHYSICAL_LEAF_BLOCKER:
        record = by_run.get(run)
        if type(record) is not dict:
            raise ACoreMetricPiqdError(f"manifest lacks physical leaf {run}")
        relative = _safe_relative(record.get("model_file"), f"{run}.model_file")
        paths.append((relative, a_core_dir / relative))
    if len(paths) > MAX_CAPTURED_FILES:
        raise ACoreMetricPiqdError("A-core source packet exceeds file-count cap")
    labels = [label for label, _path in paths]
    if len(labels) != len(set(labels)):
        raise ACoreMetricPiqdError("A-core source packet repeats a path")
    return tuple(paths)


def capture_sources(a_core_dir: Path) -> tuple[SourceBinding, ...]:
    """Authenticate current A-core bytes and freeze all five physical leaves."""

    _require_path(a_core_dir, "a_core_dir")
    manifest_path = a_core_dir / "out/manifest.json"
    manifest_capture = _capture_current(manifest_path)
    paths = _source_paths_from_manifest(a_core_dir, manifest_capture)
    captures = tuple((label, _capture_current(path)) for label, path in paths)
    cubes, _provenance = _driver().load_current_physical_cubes(a_core_dir)
    recaptured = tuple((label, _capture_current(path)) for label, path in paths)
    if recaptured != captures:
        raise ACoreMetricPiqdError("A-core source changed during authenticated ingress")
    manifest_by_label = dict(captures)["out/manifest.json"]
    if manifest_by_label != manifest_capture:
        raise ACoreMetricPiqdError("A-core manifest capture crossed ingress")
    bindings: list[SourceBinding] = []
    for cube in cubes:
        adaptation = _driver().adapt_physical_cube(cube["run"], cube["model"])
        if adaptation.get("status") != "READY_NAMED_PROJECTION":
            raise ACoreMetricPiqdError(
                f"A-core physical leaf {cube['run']} is not ready"
            )
        model_path = _driver().REPO_ROOT / cube["model_path"]
        try:
            model_relative = str(model_path.relative_to(a_core_dir))
        except ValueError as exc:
            raise ACoreMetricPiqdError("model path escaped A-core source root") from exc
        model_capture = dict(captures).get(model_relative)
        if model_capture is None or model_capture.sha256 != cube["model_sha256"]:
            raise ACoreMetricPiqdError("driver model digest crossed captured source")
        bindings.append(
            SourceBinding(a_core_dir, cube["run"], cube, adaptation, captures)
        )
    return tuple(bindings)


def capture_source(a_core_dir: Path, *, run: str) -> SourceBinding:
    bindings = capture_sources(a_core_dir)
    matches = [binding for binding in bindings if binding.run == run]
    if len(matches) != 1:
        raise ACoreMetricPiqdError("A-core run is not uniquely authenticated")
    return matches[0]


def _check_binding_current(binding: SourceBinding) -> None:
    current = []
    for label, expected in binding.captures:
        path = (
            binding.a_core_dir.parent / "A-CORE-ENCODING-SPEC.md"
            if label == "../A-CORE-ENCODING-SPEC.md"
            else binding.a_core_dir / label
        )
        current.append((label, _capture_current(path)))
    if tuple(current) != binding.captures:
        raise ACoreMetricPiqdError("A-core source changed after authentication")


def _system(binding: SourceBinding, order_index: int) -> dict[str, Any]:
    orders = binding.adaptation["orders"]
    if type(order_index) is not int or not 0 <= order_index < len(orders):
        raise ACoreMetricPiqdError("A-core order index is out of range")
    rows = [
        {
            "center": row["center"],
            "support": list(row["support"]),
            "exact": row["exact"],
        }
        for row in binding.adaptation["metric_rows"]
    ]
    model_path = _driver().REPO_ROOT / binding.cube["model_path"]
    model_capture = dict(binding.captures)[
        str(model_path.relative_to(binding.a_core_dir))
    ]
    return {
        "system_id": f"a-core-{binding.run}-order-{order_index:05d}",
        "n": binding.adaptation["n_vertices"],
        "profile": [len(row["support"]) for row in rows],
        "order": list(orders[order_index]),
        "rows": rows,
        "sources": [
            {
                "schema": "p97-a-core-metric-source-binding/v1",
                "run": binding.run,
                "order_index": order_index,
                "model_path": binding.cube["model_path"],
                "model_sha256": model_capture.sha256,
                "manifest_sha256": dict(binding.captures)["out/manifest.json"].sha256,
            }
        ],
    }


def _source_locator(a_core_dir: Path) -> str:
    absolute = Path(os.path.abspath(os.fspath(a_core_dir)))
    root = _driver().REPO_ROOT
    try:
        return str(absolute.relative_to(root))
    except ValueError:
        return str(absolute)


def prepare_stage(
    binding: SourceBinding,
    order_index: int,
    stage: str,
    *,
    timeout_ms: int,
) -> PreparedStage:
    """Freeze one authenticated A-core order/stage source-semantic query."""

    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise ACoreMetricPiqdError("timeout_ms must be in 1..3600000")
    if stage not in STAGES:
        raise ACoreMetricPiqdError("unknown staged metric query")
    _check_binding_current(binding)
    system = metric_piqd._validate_system(_system(binding, order_index))
    commands, counts = metric_piqd.build_stage_smt2(system, stage)
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    implementation_paths = (
        ("a_core_adapter", Path(__file__).resolve()),
        ("a_core_driver", Path(_driver().__file__).resolve()),
        ("generic_adapter", Path(neutral.__file__).resolve()),
        ("metric_encoder_replayer", Path(metric_piqd.__file__).resolve()),
    )
    implementations = [
        (role, path, _capture_current(path).payload)
        for role, path in implementation_paths
    ]
    source_record = {
        "schema": SOURCE_SCHEMA,
        "system_id": system["system_id"],
        "run": binding.run,
        "order_index": order_index,
        "stage": stage,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "task": {
            "schema": "p97-a-core-metric-task/v1",
            "run": binding.run,
            "order_index": order_index,
            "order_sha256": _sha(_canonical(system["order"])),
            "rows_sha256": _sha(_canonical(system["rows"])),
            "n_vertices": system["n"],
        },
        "a_core": {
            "source_locator": _source_locator(binding.a_core_dir),
            "captured_files": [
                {
                    "path": label,
                    "bytes": len(capture.payload),
                    "sha256": capture.sha256,
                    "identity": list(capture.identity),
                }
                for label, capture in binding.captures
            ],
            "manifest_record_sha256": _sha(
                _source_canonical(binding.cube["manifest_record"])
            ),
            "model_path": binding.cube["model_path"],
            "model_sha256": binding.cube["model_sha256"],
        },
        "constraint_counts": counts,
        "normalization": {
            "schema": NORMALIZATION_SCHEMA,
            "encoding": "utf-8",
            "line_endings": "LF",
            "state_commands_only": True,
            "journal_sha256": _sha(journal),
        },
        "implementation_sources": [
            {
                "role": role,
                "path": os.path.relpath(path, _driver().REPO_ROOT),
                "bytes": len(payload),
                "sha256": _sha(payload),
            }
            for role, path, payload in implementations
        ],
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solver": "z3",
            "lane": "smt",
            "logic": "QF_NRA",
            "fresh_session": True,
            "solve_count": 1,
            "workers": 1,
            "timeout_ms": timeout_ms,
            "local_fallback": False,
        },
        "proof_blueprint": dict(PROOF_BLUEPRINT),
        "claims": dict(FALSE_CLAIMS),
    }
    source_record_bytes = _canonical(source_record) + b"\n"
    snapshots = [neutral.SourceSnapshot("0000-source-record.json", source_record_bytes)]
    snapshots.extend(
        neutral.SourceSnapshot(f"source-{index:04d}.bin", capture.payload)
        for index, (_label, capture) in enumerate(binding.captures, start=1)
    )
    snapshots.extend(
        neutral.SourceSnapshot(f"implementation-{index:04d}-{role}.py", payload)
        for index, (role, _path, payload) in enumerate(implementations)
    )
    snapshots.sort(key=lambda item: item.path)
    semantic = {
        "system_id": system["system_id"],
        "run": binding.run,
        "order_index": order_index,
        "stage": stage,
        "system": system,
        "constraint_counts": counts,
        "fixture_only": False,
        "fixture_pins": [],
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(source_record_bytes),
        "source_packet_sha256": _sha(
            _canonical(
                [
                    {"path": label, "sha256": capture.sha256}
                    for label, capture in binding.captures
                ]
            )
        ),
    }
    variables = [
        {"id": f"p{point:03d}-{axis}", "term": f"{axis}_{point}", "sort": "Real"}
        for point in range(system["n"])
        for axis in ("x", "y")
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-a-core-metric", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-every-asserted-atom-replay",
            "version": "v1",
        },
        "stage_id": stage,
        "query_id": f"{system['system_id']}-{stage}",
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "original.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["z3"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = _canonical(descriptor) + b"\n"
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(snapshots),
    )
    query = neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    return PreparedStage(
        binding.run, order_index, stage, source_record, source_record_bytes, query
    )


def _classification(engine: Mapping[str, object]) -> str:
    if (
        engine.get("raw_status") == "SAT"
        and engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED"
    ):
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if engine.get("raw_status") == "UNSAT":
        return "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    if engine.get("raw_status") == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    return "ERROR_OR_REPLAY_REJECTION_INCONCLUSIVE"


def _derive_result(
    system: Mapping[str, Any], stages: list[dict[str, Any]]
) -> dict[str, Any]:
    final_status = "UNKNOWN"
    decisive_stage: str | None = None
    verification: object | None = None
    for stage in stages:
        if stage["status"] == "UNSAT":
            final_status = "UNSAT"
            decisive_stage = stage["stage"]
            break
        if (
            stage["stage"] == "full-convex"
            and stage["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
        ):
            final_status = "SAT"
            decisive_stage = "full-convex"
            verification = stage["engine"]["semantic_replay"]["evidence"]
            break
    result: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "system_id": system["system_id"],
        "run": system["sources"][0]["run"],
        "order_index": system["sources"][0]["order_index"],
        "order": system["order"],
        "status": final_status,
        "decisive_stage": decisive_stage,
        "stages": stages,
        "route": "piqd-z3-qfnra",
        "workers": 1,
        "local_fallback": False,
        "proof_blueprint": dict(PROOF_BLUEPRINT),
        "claims": dict(FALSE_CLAIMS),
    }
    if verification is not None:
        result["verification"] = verification
        result["model"] = verification["coordinates"]
    return result


def run_staged_order(
    binding: SourceBinding,
    order_index: int,
    *,
    timeout_s: float,
    transport: neutral.PiqdTransport,
    output_directory: Path,
) -> dict[str, Any]:
    """Run exact/full/conditional-convex-only in fresh PIQD sessions."""

    _require_path(output_directory, "output_directory")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise ACoreMetricPiqdError("timeout_s must be positive")
    staging = metric_piqd._reserve_output_staging(output_directory)
    timeout_ms = max(1, int(timeout_s * 1000))
    stages: list[dict[str, Any]] = []
    used_session_ids: set[str] = set()
    schedule = ["exact-metric-relaxation", "full-convex"]
    system = _system(binding, order_index)
    index = 0
    try:
        while index < len(schedule):
            stage = schedule[index]
            prepared = prepare_stage(binding, order_index, stage, timeout_ms=timeout_ms)
            stage_dir = f"{index:02d}-{stage}"
            os.mkdir(stage_dir, 0o700, dir_fd=staging.staging_fd)
            stage_fd = os.open(
                stage_dir,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=staging.staging_fd,
            )
            try:
                metric_piqd._write_immutable(
                    stage_fd, "source-record.json", prepared.source_record_bytes
                )
                metric_piqd._write_immutable(
                    stage_fd, "descriptor.json", prepared.query.descriptor_bytes
                )
                metric_piqd._write_immutable(
                    stage_fd, "original.smt2", prepared.query.original_smt2
                )
                metric_piqd._write_immutable(
                    stage_fd, "journal.smt2", prepared.query.journal_smt2
                )
                for snapshot in prepared.query.source_files:
                    metric_piqd._write_immutable(
                        stage_fd, f"source-{snapshot.path}", snapshot.payload
                    )
                engine = neutral.run_authenticated_single_solver_query(
                    prepared.query,
                    solver="z3",
                    descriptor_schema=DESCRIPTOR_SCHEMA,
                    solver_profile_schema=PROFILE_SCHEMA,
                    authenticated_journal_commands=prepared.query.journal_commands,
                    transport=transport,
                    semantic_verifier=metric_piqd.verify_sat_model,
                    output_fd=stage_fd,
                    used_session_ids=used_session_ids,
                )
                stage_result = {
                    "stage": stage,
                    "status": engine["raw_status"],
                    "effective_status": engine["effective_status"],
                    "classification": _classification(engine),
                    "source_record_sha256": _sha(prepared.source_record_bytes),
                    "journal_sha256": _sha(prepared.query.journal_smt2),
                    "engine": engine,
                }
                metric_piqd._write_immutable(
                    stage_fd, "stage-result.json", _canonical(stage_result) + b"\n"
                )
            finally:
                os.close(stage_fd)
            stages.append(stage_result)
            raw = engine["raw_status"]
            effective = engine["effective_status"]
            if raw == "UNSAT":
                break
            if effective != "SAT_SEMANTICALLY_REPLAYED" and raw != "UNKNOWN":
                break
            if stage == "full-convex":
                if effective == "SAT_SEMANTICALLY_REPLAYED":
                    break
                if raw == "UNKNOWN":
                    schedule.append("convex-only-relaxation")
            index += 1
        _check_binding_current(binding)
        custody_bytes, custody_inventory = metric_piqd._publish_output(staging)
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)
    result = _derive_result(system, stages)
    result["output_custody"] = {
        "inventory_sha256": _sha(custody_bytes),
        "entries": len(custody_inventory),
        "publication": "atomic-directory-rename-no-replace",
    }
    return result


def create_output_root(path: Path) -> None:
    """Create one empty create-once PIQD custody root."""

    _require_path(path, "PIQD custody root")
    try:
        metric_piqd._create_output_root(path)
    except metric_piqd.EndpointMetricPiqdError as exc:
        raise ACoreMetricPiqdError("cannot create PIQD custody root") from exc


def _stage_files(files: dict[str, bytes], directory: str) -> dict[str, bytes]:
    prefix = f"{directory}/"
    return {
        path[len(prefix) :]: payload
        for path, payload in files.items()
        if path.startswith(prefix)
    }


def _load_json(payload: bytes, where: str) -> dict[str, Any]:
    value = metric_piqd._strict_json_artifact(payload, where, endpoint=True)
    if type(value) is not dict:
        raise ACoreMetricPiqdError(f"{where} is not an object")
    if _canonical(value) + b"\n" != payload:
        raise ACoreMetricPiqdError(f"{where} is not canonical")
    return value


def validate_published_output(
    output_directory: Path, *, a_core_dir: Path | None = None
) -> dict[str, Any]:
    """Offline-validate the staged archive and its current A-core sources."""

    _require_path(output_directory, "published output")
    if a_core_dir is not None:
        _require_path(a_core_dir, "a_core_dir")
    try:
        capture = metric_piqd._open_published_capture(output_directory)
    except metric_piqd.EndpointMetricPiqdError as exc:
        raise ACoreMetricPiqdError("cannot open published custody") from exc
    try:
        custody = _load_json(
            capture.files["custody-inventory.json"], "custody inventory"
        )
        payload_inventory = [
            item
            for item in capture.inventory
            if item["path"] != "custody-inventory.json"
        ]
        if custody != {
            "schema": "p97-endpoint-metric-piqd-custody/v1",
            "payload_inventory": payload_inventory,
            "publication": "atomic-directory-rename-no-replace",
        }:
            raise ACoreMetricPiqdError("published custody inventory is crossed")
        directories = [
            item["path"]
            for item in capture.inventory
            if item["kind"] == "directory" and "/" not in item["path"]
        ]
        expected_dirs = [f"{index:02d}-{stage}" for index, stage in enumerate(STAGES)]
        if (
            not 1 <= len(directories) <= len(STAGES)
            or directories != expected_dirs[: len(directories)]
        ):
            raise ACoreMetricPiqdError("published stage directory order is invalid")

        stages: list[dict[str, Any]] = []
        systems: list[dict[str, Any]] = []
        session_ids: list[str] = []
        binding: SourceBinding | None = None
        order_index: int | None = None
        for index, directory in enumerate(directories):
            files = _stage_files(capture.files, directory)
            source_record = _load_json(files["source-record.json"], "source record")
            try:
                run = source_record["run"]
                published_order_index = source_record["order_index"]
                timeout_ms = source_record["solver_profile"]["timeout_ms"]
                source_locator = source_record["a_core"]["source_locator"]
            except (KeyError, TypeError) as exc:
                raise ACoreMetricPiqdError(
                    "published source query lacks reconstruction fields"
                ) from exc
            if (
                type(run) is not str
                or type(published_order_index) is not int
                or type(timeout_ms) is not int
                or type(source_locator) is not str
            ):
                raise ACoreMetricPiqdError(
                    "published source reconstruction fields are invalid"
                )
            selected_source = a_core_dir
            if selected_source is None:
                candidate = Path(source_locator)
                selected_source = (
                    candidate
                    if candidate.is_absolute()
                    else _driver().REPO_ROOT / candidate
                )
            if binding is None:
                binding = capture_source(selected_source, run=run)
                order_index = published_order_index
            if binding.run != run or order_index != published_order_index:
                raise ACoreMetricPiqdError("published stages cross A-core bindings")
            prepared = prepare_stage(
                binding,
                published_order_index,
                STAGES[index],
                timeout_ms=timeout_ms,
            )
            if (
                files["source-record.json"] != prepared.source_record_bytes
                or files["descriptor.json"] != prepared.query.descriptor_bytes
            ):
                raise ACoreMetricPiqdError(
                    "published source query does not reconstruct"
                )
            if (
                files["original.smt2"] != prepared.query.original_smt2
                or files["journal.smt2"] != prepared.query.journal_smt2
            ):
                raise ACoreMetricPiqdError("published SMT journal is crossed")
            for snapshot in prepared.query.source_files:
                if files.get(f"source-{snapshot.path}") != snapshot.payload:
                    raise ACoreMetricPiqdError("published source snapshot is crossed")
            stage_result = _load_json(files["stage-result.json"], "stage result")
            try:
                engine, engine_paths = metric_piqd._validate_published_engine(
                    files, prepared.query, stage_result.get("engine")
                )
            except metric_piqd.EndpointMetricPiqdError as exc:
                raise ACoreMetricPiqdError(
                    "published PIQD lifecycle is invalid"
                ) from exc
            expected_stage = {
                "stage": STAGES[index],
                "status": engine["raw_status"],
                "effective_status": engine["effective_status"],
                "classification": _classification(engine),
                "source_record_sha256": _sha(prepared.source_record_bytes),
                "journal_sha256": _sha(prepared.query.journal_smt2),
                "engine": engine,
            }
            if stage_result != expected_stage:
                raise ACoreMetricPiqdError("published stage result is crossed")
            expected_files = {
                "source-record.json",
                "descriptor.json",
                "original.smt2",
                "journal.smt2",
                "stage-result.json",
                *engine_paths,
                *(f"source-{item.path}" for item in prepared.query.source_files),
            }
            if set(files) != expected_files:
                raise ACoreMetricPiqdError("published stage inventory is not exact")
            stages.append(stage_result)
            systems.append(prepared.source_record["system"])
            session_ids.append(engine["session_id"])

        if any(system != systems[0] for system in systems[1:]):
            raise ACoreMetricPiqdError("published stages cross metric systems")
        if len(session_ids) != len(set(session_ids)):
            raise ACoreMetricPiqdError("published stages reuse a PIQD session")
        names = [stage["stage"] for stage in stages]
        expected_names = ["exact-metric-relaxation"]
        if stages[0]["status"] != "UNSAT" and (
            stages[0]["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
            or stages[0]["status"] == "UNKNOWN"
        ):
            expected_names.append("full-convex")
            if len(stages) >= 2 and stages[1]["status"] == "UNKNOWN":
                expected_names.append("convex-only-relaxation")
        if names != expected_names:
            raise ACoreMetricPiqdError("published stage control flow is invalid")
        if order_index is None:
            raise ACoreMetricPiqdError("published result has no authenticated order")
        result = _derive_result(systems[0], stages)
        result["output_custody"] = {
            "inventory_sha256": _sha(capture.files["custody-inventory.json"]),
            "entries": len(capture.inventory),
            "publication": "atomic-directory-rename-no-replace",
        }
        metric_piqd._finalize_published_capture(capture)
        return result
    finally:
        os.close(capture.root_fd)
        os.close(capture.parent_fd)


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", required=True, type=Path)
    parser.add_argument("--source", type=Path)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    result = validate_published_output(args.check, a_core_dir=args.source)
    print(
        json.dumps(
            {
                "checked": True,
                "status": result["status"],
                "run": result["run"],
                "order_index": result["order_index"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
