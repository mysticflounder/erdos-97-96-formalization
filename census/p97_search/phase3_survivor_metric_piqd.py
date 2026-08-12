"""Authenticated PIQD Z3 route for one Phase-3 survivor/order system.

This module is finite diagnostic infrastructure.  A SAT answer is retained
only after exact-rational replay of every asserted atom.  An UNSAT answer is
discovery-only because PIQD currently supplies no independently checked proof.
"""

from __future__ import annotations

import argparse
import json
import math
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.endpoint_confinement import metric_realizability_piqd as metric_piqd
from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import realize

RESULT_SCHEMA = "p97-phase3-survivor-metric-piqd-result/v1"
SOURCE_SCHEMA = "p97-phase3-survivor-metric-piqd-source/v1"
DESCRIPTOR_SCHEMA = "p97-phase3-survivor-metric-piqd-query/v1"
PROFILE_SCHEMA = "p97-piqd-z3-qfnra-one-shot/v1"
NORMALIZATION_SCHEMA = "p97-phase3-survivor-metric-smt-normalization/v1"
STAGES = metric_piqd.STAGES

FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
}


class SurvivorMetricPiqdError(RuntimeError):
    """The survivor source, PIQD contract, or offline replay failed closed."""


@dataclass(frozen=True)
class SourceBinding:
    source_dir: Path
    manifest_name: str
    manifest_bytes: bytes
    manifest_sha256: str
    manifest_identity: tuple[int, ...]
    survivor_record_bytes: bytes
    survivors_bytes: bytes
    survivors_sha256: str
    manifest_survivors_sha256: str
    survivors_identity: tuple[int, ...]
    expected_count: int
    running_snapshot: bool
    case: Any


@dataclass(frozen=True)
class PreparedStage:
    stage: str
    order_id: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    query: neutral.SourceSemanticQuery


@dataclass(frozen=True)
class _SourceCapture:
    payload: bytes
    sha256: str
    identity: tuple[int, ...]


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, allow_nan=False, ensure_ascii=True, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def _sha(payload: bytes) -> str:
    return metric_piqd._sha(payload)


def _capture_current(path: Path) -> _SourceCapture:
    descriptor: int | None = None
    rebound_descriptor: int | None = None
    try:
        descriptor = metric_piqd._open_file_nofollow(path)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise SurvivorMetricPiqdError(
                f"source is not a private regular file: {path}"
            )
        if before.st_size > metric_piqd.MAX_SOURCE_BYTES:
            raise SurvivorMetricPiqdError(f"source exceeds byte cap: {path}")
        payload = metric_piqd._read_descriptor(descriptor, metric_piqd.MAX_SOURCE_BYTES)
        after = os.fstat(descriptor)
        identity = metric_piqd._identity(before)
        if (
            len(payload) > metric_piqd.MAX_SOURCE_BYTES
            or len(payload) != before.st_size
            or identity != metric_piqd._identity(after)
        ):
            raise SurvivorMetricPiqdError(f"source changed while read: {path}")
        rebound_descriptor = metric_piqd._open_file_nofollow(path)
        if identity != metric_piqd._identity(os.fstat(rebound_descriptor)):
            raise SurvivorMetricPiqdError(f"source path changed while read: {path}")
        return _SourceCapture(payload, _sha(payload), identity)
    except (OSError, metric_piqd.EndpointMetricPiqdError) as exc:
        raise SurvivorMetricPiqdError(
            f"cannot authenticate current source {path}"
        ) from exc
    finally:
        if rebound_descriptor is not None:
            os.close(rebound_descriptor)
        if descriptor is not None:
            os.close(descriptor)


def _read_current(path: Path) -> bytes:
    return _capture_current(path).payload


def _strict_json_object_bytes(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = json.loads(
            payload.decode("utf-8"),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_driver()._object_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise SurvivorMetricPiqdError(f"invalid JSON in {where}: {exc}") from exc
    if type(value) is not dict:
        raise SurvivorMetricPiqdError(f"{where} is not a JSON object")
    return value


def _manifest_survivors_digest(manifest: dict[str, Any]) -> str:
    artifact_hashes = manifest.get("artifact_hashes")
    if type(artifact_hashes) is not dict:
        raise SurvivorMetricPiqdError("source manifest lacks artifact hashes")
    digest = artifact_hashes.get("survivors.jsonl")
    if type(digest) is not str or len(digest) != 64:
        raise SurvivorMetricPiqdError(
            "source manifest has an invalid survivors.jsonl digest"
        )
    return digest


def _canonical_jsonl_records(
    payload: bytes, *, expected_count: int
) -> tuple[tuple[dict[str, Any], bytes], ...]:
    """Parse exact canonical JSONL bytes without inventing terminators."""

    if b"\r" in payload:
        raise SurvivorMetricPiqdError("survivor journal must use LF, never CRLF")
    if not payload.endswith(b"\n"):
        raise SurvivorMetricPiqdError("survivor journal must end in an exact LF")
    bodies = payload[:-1].split(b"\n")
    if len(bodies) != expected_count:
        raise SurvivorMetricPiqdError("survivor journal line count changed")
    records: list[tuple[dict[str, Any], bytes]] = []
    for line_number, body in enumerate(bodies, start=1):
        if not body:
            raise SurvivorMetricPiqdError(
                f"survivor journal line {line_number} is blank"
            )
        parsed = _strict_json_object_bytes(body, f"survivors.jsonl:{line_number}")
        if body != _canonical(parsed):
            raise SurvivorMetricPiqdError(
                f"survivor journal line {line_number} is not canonical JSON"
            )
        records.append((parsed, body + b"\n"))
    return tuple(records)


def _driver() -> Any:
    from census.p97_search import phase3_survivor_metric_driver as driver

    return driver


def capture_source(
    source_dir: Path,
    *,
    case_index: int,
    expected_count: int,
    running_snapshot: bool,
) -> SourceBinding:
    """Authenticate the current survivor journal and freeze one exact record."""

    bindings = capture_sources(
        source_dir,
        expected_count=expected_count,
        running_snapshot=running_snapshot,
    )
    if type(case_index) is not int or not 0 <= case_index < len(bindings):
        raise SurvivorMetricPiqdError("survivor case index is out of range")
    return bindings[case_index]


def capture_sources(
    source_dir: Path,
    *,
    expected_count: int,
    running_snapshot: bool,
) -> tuple[SourceBinding, ...]:
    """Authenticate the journal once and freeze all survivor bindings."""

    driver = _driver()
    manifest_path = driver._source_manifest_path(
        source_dir, running_snapshot=running_snapshot
    )
    survivors_path = source_dir / "survivors.jsonl"
    ingress_manifest_capture = _capture_current(manifest_path)
    ingress_survivors_capture = _capture_current(survivors_path)
    ingress_manifest_bytes = ingress_manifest_capture.payload
    ingress_survivors_bytes = ingress_survivors_capture.payload
    ingress_manifest_sha256 = ingress_manifest_capture.sha256
    ingress_survivors_sha256 = ingress_survivors_capture.sha256
    ingress_manifest = _strict_json_object_bytes(
        ingress_manifest_bytes, manifest_path.name
    )
    manifest_survivors_sha256 = _manifest_survivors_digest(ingress_manifest)
    if ingress_survivors_sha256 != manifest_survivors_sha256:
        raise SurvivorMetricPiqdError(
            "survivor journal bytes do not match the ingress manifest digest"
        )
    exact_records = _canonical_jsonl_records(
        ingress_survivors_bytes, expected_count=expected_count
    )
    manifest, cases = driver.load_source(
        source_dir,
        expected_count=expected_count,
        running_snapshot=running_snapshot,
    )
    current_manifest_path = driver._source_manifest_path(
        source_dir, running_snapshot=running_snapshot
    )
    current_manifest_capture = _capture_current(current_manifest_path)
    current_survivors_capture = _capture_current(survivors_path)
    current_manifest_bytes = current_manifest_capture.payload
    current_survivors_bytes = current_survivors_capture.payload
    if current_manifest_path != manifest_path:
        raise SurvivorMetricPiqdError(
            "source manifest selection changed during authenticated ingress"
        )
    if (
        current_manifest_bytes != ingress_manifest_bytes
        or current_manifest_capture.sha256 != ingress_manifest_sha256
        or current_manifest_capture.identity != ingress_manifest_capture.identity
        or current_survivors_bytes != ingress_survivors_bytes
        or current_survivors_capture.sha256 != ingress_survivors_sha256
        or current_survivors_capture.identity != ingress_survivors_capture.identity
    ):
        raise SurvivorMetricPiqdError(
            "source bytes changed during authenticated ingress"
        )
    if manifest != ingress_manifest:
        raise SurvivorMetricPiqdError("captured source manifest is crossed")
    current_manifest = _strict_json_object_bytes(
        current_manifest_bytes, current_manifest_path.name
    )
    if (
        _manifest_survivors_digest(current_manifest) != manifest_survivors_sha256
        or _sha(current_survivors_bytes) != manifest_survivors_sha256
    ):
        raise SurvivorMetricPiqdError(
            "current survivor journal is not bound by the ingress manifest"
        )
    bindings: list[SourceBinding] = []
    for case, (parsed, raw_record) in zip(cases, exact_records, strict=True):
        if parsed != case.source_record:
            raise SurvivorMetricPiqdError("captured survivor record is crossed")
        bindings.append(
            SourceBinding(
                source_dir=source_dir,
                manifest_name=manifest_path.name,
                manifest_bytes=ingress_manifest_bytes,
                manifest_sha256=ingress_manifest_sha256,
                manifest_identity=ingress_manifest_capture.identity,
                survivor_record_bytes=raw_record,
                survivors_bytes=ingress_survivors_bytes,
                survivors_sha256=ingress_survivors_sha256,
                manifest_survivors_sha256=manifest_survivors_sha256,
                survivors_identity=ingress_survivors_capture.identity,
                expected_count=expected_count,
                running_snapshot=running_snapshot,
                case=case,
            )
        )
    return tuple(bindings)


def _check_binding_current(binding: SourceBinding) -> None:
    manifest_path = binding.source_dir / binding.manifest_name
    if (
        _driver()._source_manifest_path(
            binding.source_dir, running_snapshot=binding.running_snapshot
        )
        != manifest_path
    ):
        raise SurvivorMetricPiqdError("authenticated source manifest path changed")
    manifest_capture = _capture_current(manifest_path)
    survivors_capture = _capture_current(binding.source_dir / "survivors.jsonl")
    manifest_bytes = manifest_capture.payload
    survivors_bytes = survivors_capture.payload
    if (
        manifest_bytes != binding.manifest_bytes
        or manifest_capture.sha256 != binding.manifest_sha256
        or manifest_capture.identity != binding.manifest_identity
        or survivors_bytes != binding.survivors_bytes
        or survivors_capture.sha256 != binding.survivors_sha256
        or survivors_capture.identity != binding.survivors_identity
    ):
        raise SurvivorMetricPiqdError("survivor source changed after authentication")
    manifest = _strict_json_object_bytes(manifest_bytes, binding.manifest_name)
    if (
        _manifest_survivors_digest(manifest) != binding.manifest_survivors_sha256
        or _sha(survivors_bytes) != binding.manifest_survivors_sha256
    ):
        raise SurvivorMetricPiqdError(
            "current survivor journal is not bound by the authenticated manifest"
        )


def _system(binding: SourceBinding, order_spec: realize.OrderSpec) -> dict[str, Any]:
    record = binding.case.source_record
    return {
        "system_id": (
            f"phase3-survivor-{record['assignment_sha256'][:20]}-{order_spec.order_id}"
        ),
        "n": 10,
        "profile": [4, 4, 5],
        "order": list(order_spec.order),
        "rows": [row.as_dict() for row in binding.case.rows],
        "sources": [
            {
                "schema": "p97-phase3-survivor-source-binding/v1",
                "index": binding.case.index,
                "record_sha256": record["record_sha256"],
                "previous_record_sha256": record["previous_record_sha256"],
                "assignment_sha256": record["assignment_sha256"],
                "manifest_sha256": binding.manifest_sha256,
                "manifest_identity": list(binding.manifest_identity),
                "survivors_bytes": len(binding.survivors_bytes),
                "survivors_sha256": binding.survivors_sha256,
                "manifest_survivors_sha256": binding.manifest_survivors_sha256,
                "survivors_identity": list(binding.survivors_identity),
                "manifest_name": binding.manifest_name,
            }
        ],
    }


def prepare_stage(
    binding: SourceBinding,
    order_spec: realize.OrderSpec,
    stage: str,
    *,
    timeout_ms: int,
) -> PreparedStage:
    """Freeze one authenticated survivor/order/stage PIQD query."""

    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise SurvivorMetricPiqdError("timeout_ms must be in 1..3600000")
    if stage not in STAGES:
        raise SurvivorMetricPiqdError("unknown staged metric query")
    if type(order_spec) is not realize.OrderSpec:
        raise SurvivorMetricPiqdError("order must be an exact OrderSpec")
    if order_spec not in binding.case.orders:
        raise SurvivorMetricPiqdError("order is not authenticated by the survivor")
    _check_binding_current(binding)
    system = metric_piqd._validate_system(_system(binding, order_spec))
    commands, counts = metric_piqd.build_stage_smt2(system, stage)
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    implementation_paths = (
        ("survivor_adapter", Path(__file__)),
        ("survivor_driver", Path(_driver().__file__)),
        ("generic_adapter", Path(neutral.__file__)),
        ("metric_encoder_replayer", Path(metric_piqd.__file__)),
    )
    implementations = [
        (role, path.resolve(), _read_current(path.resolve()))
        for role, path in implementation_paths
    ]
    source_locator = _driver()._portable_source_reference(binding.source_dir)
    source_record = {
        "schema": SOURCE_SCHEMA,
        "system_id": system["system_id"],
        "order_id": order_spec.order_id,
        "stage": stage,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "order_sha256": _sha(_canonical(system["order"])),
        "rows_sha256": _sha(_canonical(system["rows"])),
        "constraint_counts": counts,
        "survivor": {
            "source_locator": source_locator,
            "manifest_name": binding.manifest_name,
            "manifest_bytes": len(binding.manifest_bytes),
            "manifest_sha256": binding.manifest_sha256,
            "manifest_identity": list(binding.manifest_identity),
            "survivor_record_bytes": len(binding.survivor_record_bytes),
            "survivor_record_sha256": _sha(binding.survivor_record_bytes),
            "survivors_bytes": len(binding.survivors_bytes),
            "survivors_sha256": binding.survivors_sha256,
            "manifest_survivors_sha256": binding.manifest_survivors_sha256,
            "survivors_identity": list(binding.survivors_identity),
            "case_index": binding.case.index,
            "expected_count": binding.expected_count,
            "running_snapshot": binding.running_snapshot,
            "record_sha256": binding.case.source_record["record_sha256"],
            "previous_record_sha256": binding.case.source_record[
                "previous_record_sha256"
            ],
        },
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
                "path": os.path.relpath(path, _driver().ROOT),
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
        "claims": dict(FALSE_CLAIMS),
    }
    source_record_bytes = _canonical(source_record) + b"\n"
    snapshots = [
        neutral.SourceSnapshot("0000-source-record.json", source_record_bytes),
        neutral.SourceSnapshot("0001-source-manifest.json", binding.manifest_bytes),
        neutral.SourceSnapshot(
            "0002-survivor-record.json", binding.survivor_record_bytes
        ),
    ]
    snapshots.extend(
        neutral.SourceSnapshot(f"implementation-{index:04d}-{role}.py", payload)
        for index, (role, _path, payload) in enumerate(implementations)
    )
    snapshots.sort(key=lambda item: item.path)
    semantic = {
        "system_id": system["system_id"],
        "order_id": order_spec.order_id,
        "stage": stage,
        "system": system,
        "constraint_counts": counts,
        "fixture_only": False,
        "fixture_pins": [],
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(source_record_bytes),
        "survivor_record_sha256": _sha(binding.survivor_record_bytes),
        "source_manifest_sha256": _sha(binding.manifest_bytes),
    }
    variables = [
        {"id": f"p{point:03d}-{axis}", "term": f"{axis}_{point}", "sort": "Real"}
        for point in range(system["n"])
        for axis in ("x", "y")
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "phase3-survivor-metric", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-stage-replay", "version": "v1"},
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
        stage, order_spec.order_id, source_record, source_record_bytes, query
    )


def _classification(engine: dict[str, Any]) -> str:
    if (
        engine["raw_status"] == "SAT"
        and engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    ):
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if engine["raw_status"] == "UNSAT":
        return "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    if engine["raw_status"] == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    return "INCONCLUSIVE_NO_VERDICT"


def _derive_result(
    system: dict[str, Any], order_id: str, stages: list[dict[str, Any]]
) -> dict[str, Any]:
    final_status = "UNKNOWN"
    decisive_stage = None
    verification = None
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
        "order_id": order_id,
        "order": system["order"],
        "status": final_status,
        "decisive_stage": decisive_stage,
        "stages": stages,
        "route": "piqd-z3-qfnra",
        "workers": 1,
        "local_fallback": False,
        "claims": dict(FALSE_CLAIMS),
    }
    if verification is not None:
        result["verification"] = verification
        result["model"] = verification["coordinates"]
    return result


def run_staged_order(
    binding: SourceBinding,
    order_spec: realize.OrderSpec,
    *,
    timeout_s: float,
    transport: neutral.PiqdTransport,
    output_directory: Path,
) -> dict[str, Any]:
    """Run the exact three-stage protocol in fresh authenticated sessions."""

    if type(output_directory) is not type(Path()):
        raise SurvivorMetricPiqdError("output_directory must be an exact platform Path")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise SurvivorMetricPiqdError("timeout_s must be positive")
    staging = metric_piqd._reserve_output_staging(output_directory)
    timeout_ms = max(1, int(timeout_s * 1000))
    stages: list[dict[str, Any]] = []
    used_session_ids: set[str] = set()
    schedule = ["exact-metric-relaxation", "full-convex"]
    system = _system(binding, order_spec)
    index = 0
    try:
        while index < len(schedule):
            stage = schedule[index]
            prepared = prepare_stage(binding, order_spec, stage, timeout_ms=timeout_ms)
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
    result = _derive_result(system, order_spec.order_id, stages)
    result["output_custody"] = {
        "inventory_sha256": _sha(custody_bytes),
        "entries": len(custody_inventory),
        "publication": "atomic-directory-rename-no-replace",
    }
    return result


def create_output_root(path: Path) -> None:
    """Create one empty create-once PIQD custody root."""

    if type(path) is not type(Path()):
        raise SurvivorMetricPiqdError(
            "PIQD custody root must be an exact platform Path"
        )
    try:
        metric_piqd._create_output_root(path)
    except metric_piqd.EndpointMetricPiqdError as exc:
        raise SurvivorMetricPiqdError("cannot create PIQD custody root") from exc


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
        raise SurvivorMetricPiqdError(f"{where} is not an object")
    if _canonical(value) + b"\n" != payload:
        raise SurvivorMetricPiqdError(f"{where} is not canonical")
    return value


def validate_published_output(
    output_directory: Path, *, source_dir: Path | None = None
) -> dict[str, Any]:
    """Offline-validate the complete staged archive and current survivor source."""

    if type(output_directory) is not type(Path()):
        raise SurvivorMetricPiqdError("published output must be an exact platform Path")
    if source_dir is not None and type(source_dir) is not type(Path()):
        raise SurvivorMetricPiqdError("source_dir must be an exact platform Path")
    capture = metric_piqd._open_published_capture(output_directory)
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
            raise SurvivorMetricPiqdError("published custody inventory is crossed")
        directories = [
            item["path"]
            for item in capture.inventory
            if item["kind"] == "directory" and "/" not in item["path"]
        ]
        expected_dirs = [f"{index:02d}-{stage}" for index, stage in enumerate(STAGES)]
        if (
            not 1 <= len(directories) <= 3
            or directories != expected_dirs[: len(directories)]
        ):
            raise SurvivorMetricPiqdError("published stage directory order is invalid")
        stages: list[dict[str, Any]] = []
        systems: list[dict[str, Any]] = []
        session_ids: list[str] = []
        binding: SourceBinding | None = None
        order_spec: realize.OrderSpec | None = None
        for index, directory in enumerate(directories):
            files = _stage_files(capture.files, directory)
            source_record = _load_json(files["source-record.json"], "source record")
            survivor = source_record.get("survivor")
            if type(survivor) is not dict:
                raise SurvivorMetricPiqdError("published survivor binding is invalid")
            try:
                case_index = survivor["case_index"]
                expected_count = survivor["expected_count"]
                running_snapshot = survivor["running_snapshot"]
                order_id = source_record["order_id"]
                order = source_record["system"]["order"]
                timeout_ms = source_record["solver_profile"]["timeout_ms"]
            except (KeyError, TypeError) as exc:
                raise SurvivorMetricPiqdError(
                    "published source query lacks reconstruction fields"
                ) from exc
            if (
                type(case_index) is not int
                or type(expected_count) is not int
                or expected_count < 1
                or type(running_snapshot) is not bool
                or type(order_id) is not str
                or type(order) is not list
                or len(order) != 10
                or any(type(point) is not int for point in order)
                or type(timeout_ms) is not int
            ):
                raise SurvivorMetricPiqdError(
                    "published source reconstruction fields are invalid"
                )
            selected_source = source_dir
            if selected_source is None:
                locator = survivor.get("source_locator")
                if type(locator) is not str:
                    raise SurvivorMetricPiqdError("published source locator is invalid")
                candidate = Path(locator)
                selected_source = (
                    candidate if candidate.is_absolute() else _driver().ROOT / candidate
                )
            if binding is None:
                binding = capture_source(
                    selected_source,
                    case_index=case_index,
                    expected_count=expected_count,
                    running_snapshot=running_snapshot,
                )
                order_spec = realize.OrderSpec(order_id, tuple(order))
            if order_spec is None or binding is None:
                raise SurvivorMetricPiqdError(
                    "published source reconstruction did not initialize"
                )
            prepared = prepare_stage(
                binding,
                order_spec,
                STAGES[index],
                timeout_ms=timeout_ms,
            )
            if (
                files["source-record.json"] != prepared.source_record_bytes
                or files["descriptor.json"] != prepared.query.descriptor_bytes
            ):
                raise SurvivorMetricPiqdError(
                    "published source query does not reconstruct"
                )
            if (
                files["original.smt2"] != prepared.query.original_smt2
                or files["journal.smt2"] != prepared.query.journal_smt2
            ):
                raise SurvivorMetricPiqdError("published SMT journal is crossed")
            for snapshot in prepared.query.source_files:
                if files.get(f"source-{snapshot.path}") != snapshot.payload:
                    raise SurvivorMetricPiqdError(
                        "published source snapshot is crossed"
                    )
            stage_result = _load_json(files["stage-result.json"], "stage result")
            try:
                engine, engine_paths = metric_piqd._validate_published_engine(
                    files, prepared.query, stage_result.get("engine")
                )
            except metric_piqd.EndpointMetricPiqdError as exc:
                raise SurvivorMetricPiqdError(
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
                raise SurvivorMetricPiqdError("published stage result is crossed")
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
                raise SurvivorMetricPiqdError("published stage inventory is not exact")
            stages.append(stage_result)
            systems.append(prepared.source_record["system"])
            session_ids.append(engine["session_id"])
        if any(system != systems[0] for system in systems[1:]):
            raise SurvivorMetricPiqdError("published stages cross survivor systems")
        if len(session_ids) != len(set(session_ids)):
            raise SurvivorMetricPiqdError("published stages reuse a PIQD session")
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
            raise SurvivorMetricPiqdError("published stage control flow is invalid")
        if order_spec is None:
            raise SurvivorMetricPiqdError("published result has no authenticated order")
        result = _derive_result(systems[0], order_spec.order_id, stages)
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
    result = validate_published_output(args.check, source_dir=args.source)
    print(
        json.dumps(
            {
                "checked": True,
                "status": result["status"],
                "order_id": result["order_id"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
