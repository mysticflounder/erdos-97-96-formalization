"""Fail-closed control-plane contract for P97 CEGAR mining waves.

This module authenticates what a search attempted and what evidence it returned.
It deliberately does not interpret a SAT model or certify a solver proof; those
checks belong to independent consumers which record their artifacts here.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Mapping, Sequence
from typing import Any

WAVE_SCHEMA = "p97-cegar-wave/v1"
ATTEMPT_SCHEMA = "p97-cegar-wave-attempt/v1"

LOCAL_CERTIFICATE = "LOCAL_CERTIFICATE"
UNIFORM_PRODUCER = "UNIFORM_PRODUCER"
LIFTED_CONSUMER = "LIFTED_CONSUMER"
EVIDENCE_CLASSES = frozenset({LOCAL_CERTIFICATE, UNIFORM_PRODUCER, LIFTED_CONSUMER})

STRUCTURAL_SAT = "STRUCTURAL_SAT"
METRIC_SAT = "METRIC_SAT"
METRIC_UNKNOWN = "METRIC_UNKNOWN"
DISCOVERY_UNSAT = "DISCOVERY_UNSAT"
CERTIFIED_UNSAT = "CERTIFIED_UNSAT"
CHECKPOINT = "CHECKPOINT"
ERROR = "ERROR"
OUTCOMES = frozenset(
    {
        STRUCTURAL_SAT,
        METRIC_SAT,
        METRIC_UNKNOWN,
        DISCOVERY_UNSAT,
        CERTIFIED_UNSAT,
        CHECKPOINT,
        ERROR,
    }
)

SAT_MEANS_COUNTEREXAMPLE = "SAT_MEANS_COUNTEREXAMPLE"
UNSAT_MEANS_OBSTRUCTION = "UNSAT_MEANS_OBSTRUCTION"
QUERY_POLARITIES = frozenset({SAT_MEANS_COUNTEREXAMPLE, UNSAT_MEANS_OBSTRUCTION})

_HEX_DIGITS = frozenset("0123456789abcdef")
_WAVE_KEYS = frozenset(
    {
        "schema",
        "wave_id",
        "iteration",
        "parent_checkpoint_sha256",
        "source",
        "encoding",
        "execution",
        "promotion",
    }
)
_SOURCE_KEYS = frozenset(
    {
        "live_leaf",
        "ingress_hypotheses_sha256",
        "finite_schema",
        "cardinality_scope",
        "source_theorem",
    }
)
_ENCODING_KEYS = frozenset(
    {
        "cnf_sha256",
        "variable_map_sha256",
        "producer_manifest_sha256",
        "num_variables",
        "num_clauses",
        "query_polarity",
    }
)
_EXECUTION_KEYS = frozenset(
    {"backend", "solver_profile", "shard_id", "shard_count", "order_sha256", "seed"}
)
_PROMOTION_KEYS = frozenset(
    {"evidence_classification", "producer_theorem", "lift_theorem", "consumer_theorem"}
)
_ATTEMPT_KEYS = frozenset(
    {
        "schema",
        "attempt_id",
        "attempt_index",
        "wave_manifest_sha256",
        "previous_attempt_sha256",
        "backend",
        "solver_profile",
        "outcome",
        "artifacts",
        "detail",
        "record_sha256",
    }
)
_ARTIFACT_KEYS = frozenset(
    {
        "cnf_sha256",
        "model_sha256",
        "metric_witness_sha256",
        "metric_validation_sha256",
        "solver_log_sha256",
        "proof_sha256",
        "proof_checker_sha256",
        "proof_replay_sha256",
        "checkpoint_sha256",
    }
)


class WaveContractError(ValueError):
    """Raised when a wave manifest or attempt journal violates the contract."""


def canonical_json_bytes(value: Any) -> bytes:
    """Encode JSON deterministically for content addressing."""

    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def sha256_json(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _mapping(value: Any, path: str) -> Mapping[str, Any]:
    if not isinstance(value, Mapping):
        raise WaveContractError(f"{path} must be an object")
    return value


def _exact_keys(value: Mapping[str, Any], expected: frozenset[str], path: str) -> None:
    keys = frozenset(value)
    missing = sorted(expected - keys)
    extra = sorted(keys - expected)
    if missing or extra:
        raise WaveContractError(
            f"{path} keys mismatch: missing={missing}, extra={extra}"
        )


def _nonempty_string(value: Any, path: str) -> str:
    if not isinstance(value, str) or not value.strip():
        raise WaveContractError(f"{path} must be a non-empty string")
    return value


def _optional_nonempty_string(value: Any, path: str) -> str | None:
    if value is None:
        return None
    return _nonempty_string(value, path)


def _nonnegative_int(value: Any, path: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise WaveContractError(f"{path} must be a non-negative integer")
    return value


def _positive_int(value: Any, path: str) -> int:
    result = _nonnegative_int(value, path)
    if result == 0:
        raise WaveContractError(f"{path} must be positive")
    return result


def _sha256(value: Any, path: str, *, optional: bool = False) -> str | None:
    if value is None and optional:
        return None
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(char not in _HEX_DIGITS for char in value)
    ):
        raise WaveContractError(f"{path} must be a lowercase SHA-256 hex digest")
    return value


def validate_wave_manifest(manifest: Mapping[str, Any]) -> None:
    """Validate the complete immutable identity of one CEGAR wave."""

    wave = _mapping(manifest, "manifest")
    _exact_keys(wave, _WAVE_KEYS, "manifest")
    if wave["schema"] != WAVE_SCHEMA:
        raise WaveContractError(f"manifest.schema must be {WAVE_SCHEMA!r}")
    _nonempty_string(wave["wave_id"], "manifest.wave_id")
    iteration = _nonnegative_int(wave["iteration"], "manifest.iteration")
    parent_checkpoint = _sha256(
        wave["parent_checkpoint_sha256"],
        "manifest.parent_checkpoint_sha256",
        optional=True,
    )
    if iteration > 0 and parent_checkpoint is None:
        raise WaveContractError("a nonzero iteration requires parent_checkpoint_sha256")

    source = _mapping(wave["source"], "manifest.source")
    _exact_keys(source, _SOURCE_KEYS, "manifest.source")
    for field in ("live_leaf", "finite_schema", "cardinality_scope", "source_theorem"):
        _nonempty_string(source[field], f"manifest.source.{field}")
    _sha256(
        source["ingress_hypotheses_sha256"],
        "manifest.source.ingress_hypotheses_sha256",
    )

    encoding = _mapping(wave["encoding"], "manifest.encoding")
    _exact_keys(encoding, _ENCODING_KEYS, "manifest.encoding")
    for field in ("cnf_sha256", "variable_map_sha256", "producer_manifest_sha256"):
        _sha256(encoding[field], f"manifest.encoding.{field}")
    _positive_int(encoding["num_variables"], "manifest.encoding.num_variables")
    _nonnegative_int(encoding["num_clauses"], "manifest.encoding.num_clauses")
    if encoding["query_polarity"] not in QUERY_POLARITIES:
        raise WaveContractError(
            f"manifest.encoding.query_polarity must be one of {sorted(QUERY_POLARITIES)}"
        )

    execution = _mapping(wave["execution"], "manifest.execution")
    _exact_keys(execution, _EXECUTION_KEYS, "manifest.execution")
    _nonempty_string(execution["backend"], "manifest.execution.backend")
    _nonempty_string(execution["solver_profile"], "manifest.execution.solver_profile")
    shard_id = _nonnegative_int(execution["shard_id"], "manifest.execution.shard_id")
    shard_count = _positive_int(
        execution["shard_count"], "manifest.execution.shard_count"
    )
    if shard_id >= shard_count:
        raise WaveContractError(
            "manifest.execution.shard_id must be less than shard_count"
        )
    _sha256(execution["order_sha256"], "manifest.execution.order_sha256")
    _nonnegative_int(execution["seed"], "manifest.execution.seed")

    promotion = _mapping(wave["promotion"], "manifest.promotion")
    _exact_keys(promotion, _PROMOTION_KEYS, "manifest.promotion")
    evidence_class = promotion["evidence_classification"]
    if evidence_class not in EVIDENCE_CLASSES:
        raise WaveContractError(
            f"manifest.promotion.evidence_classification must be one of {sorted(EVIDENCE_CLASSES)}"
        )
    producer = _optional_nonempty_string(
        promotion["producer_theorem"], "manifest.promotion.producer_theorem"
    )
    lift = _optional_nonempty_string(
        promotion["lift_theorem"], "manifest.promotion.lift_theorem"
    )
    consumer = _optional_nonempty_string(
        promotion["consumer_theorem"], "manifest.promotion.consumer_theorem"
    )
    if evidence_class in {UNIFORM_PRODUCER, LIFTED_CONSUMER} and (
        producer is None or consumer is None
    ):
        raise WaveContractError(
            "promoted evidence requires both producer_theorem and consumer_theorem"
        )
    if evidence_class == LIFTED_CONSUMER and lift is None:
        raise WaveContractError("lifted evidence requires lift_theorem")


def wave_manifest_sha256(manifest: Mapping[str, Any]) -> str:
    validate_wave_manifest(manifest)
    return sha256_json(manifest)


def _validate_artifacts(
    artifacts_value: Any,
    *,
    outcome: str,
    expected_cnf_sha256: str,
) -> Mapping[str, Any]:
    artifacts = _mapping(artifacts_value, "attempt.artifacts")
    _exact_keys(artifacts, _ARTIFACT_KEYS, "attempt.artifacts")
    if (
        _sha256(artifacts["cnf_sha256"], "attempt.artifacts.cnf_sha256")
        != expected_cnf_sha256
    ):
        raise WaveContractError(
            "attempt.artifacts.cnf_sha256 does not match the wave manifest"
        )
    for field in _ARTIFACT_KEYS - {"cnf_sha256"}:
        _sha256(artifacts[field], f"attempt.artifacts.{field}", optional=True)

    required: dict[str, tuple[str, ...]] = {
        STRUCTURAL_SAT: ("model_sha256",),
        METRIC_SAT: (
            "model_sha256",
            "metric_witness_sha256",
            "metric_validation_sha256",
        ),
        DISCOVERY_UNSAT: ("solver_log_sha256",),
        CERTIFIED_UNSAT: (
            "solver_log_sha256",
            "proof_sha256",
            "proof_checker_sha256",
            "proof_replay_sha256",
        ),
        CHECKPOINT: ("checkpoint_sha256",),
    }
    missing = [field for field in required.get(outcome, ()) if artifacts[field] is None]
    if missing:
        raise WaveContractError(f"{outcome} is missing required artifacts: {missing}")
    return artifacts


def make_attempt_record(
    *,
    manifest: Mapping[str, Any],
    attempt_id: str,
    attempt_index: int,
    outcome: str,
    artifacts: Mapping[str, Any],
    previous_attempt_sha256: str | None = None,
    detail: str | None = None,
) -> dict[str, Any]:
    """Build and authenticate one append-only attempt record."""

    validate_wave_manifest(manifest)
    execution = manifest["execution"]
    record: dict[str, Any] = {
        "schema": ATTEMPT_SCHEMA,
        "attempt_id": attempt_id,
        "attempt_index": attempt_index,
        "wave_manifest_sha256": wave_manifest_sha256(manifest),
        "previous_attempt_sha256": previous_attempt_sha256,
        "backend": execution["backend"],
        "solver_profile": execution["solver_profile"],
        "outcome": outcome,
        "artifacts": dict(artifacts),
        "detail": detail,
    }
    validate_attempt_record(
        record,
        manifest=manifest,
        expected_index=attempt_index,
        expected_previous_sha256=previous_attempt_sha256,
        require_record_sha256=False,
    )
    record["record_sha256"] = sha256_json(record)
    return record


def validate_attempt_record(
    record: Mapping[str, Any],
    *,
    manifest: Mapping[str, Any],
    expected_index: int,
    expected_previous_sha256: str | None,
    require_record_sha256: bool = True,
) -> str:
    """Validate an attempt and return its authenticated record hash."""

    validate_wave_manifest(manifest)
    attempt = _mapping(record, "attempt")
    expected_keys = (
        _ATTEMPT_KEYS if require_record_sha256 else _ATTEMPT_KEYS - {"record_sha256"}
    )
    _exact_keys(attempt, expected_keys, "attempt")
    if attempt["schema"] != ATTEMPT_SCHEMA:
        raise WaveContractError(f"attempt.schema must be {ATTEMPT_SCHEMA!r}")
    _nonempty_string(attempt["attempt_id"], "attempt.attempt_id")
    if (
        _nonnegative_int(attempt["attempt_index"], "attempt.attempt_index")
        != expected_index
    ):
        raise WaveContractError("attempt.attempt_index is not dense and ordered")
    manifest_hash = wave_manifest_sha256(manifest)
    if (
        _sha256(attempt["wave_manifest_sha256"], "attempt.wave_manifest_sha256")
        != manifest_hash
    ):
        raise WaveContractError(
            "attempt.wave_manifest_sha256 does not match the wave manifest"
        )
    previous = _sha256(
        attempt["previous_attempt_sha256"],
        "attempt.previous_attempt_sha256",
        optional=True,
    )
    if previous != expected_previous_sha256:
        raise WaveContractError(
            "attempt.previous_attempt_sha256 breaks the journal chain"
        )
    execution = manifest["execution"]
    if attempt["backend"] != execution["backend"]:
        raise WaveContractError("attempt.backend does not match the wave manifest")
    if attempt["solver_profile"] != execution["solver_profile"]:
        raise WaveContractError(
            "attempt.solver_profile does not match the wave manifest"
        )
    outcome = attempt["outcome"]
    if outcome not in OUTCOMES:
        raise WaveContractError(f"attempt.outcome must be one of {sorted(OUTCOMES)}")
    _validate_artifacts(
        attempt["artifacts"],
        outcome=outcome,
        expected_cnf_sha256=manifest["encoding"]["cnf_sha256"],
    )
    detail = _optional_nonempty_string(attempt["detail"], "attempt.detail")
    if outcome in {METRIC_UNKNOWN, ERROR} and detail is None:
        raise WaveContractError(f"{outcome} requires a non-empty detail")

    unsigned = dict(attempt)
    recorded_hash = unsigned.pop("record_sha256", None)
    computed_hash = sha256_json(unsigned)
    if (
        require_record_sha256
        and _sha256(recorded_hash, "attempt.record_sha256") != computed_hash
    ):
        raise WaveContractError(
            "attempt.record_sha256 does not authenticate the record"
        )
    return computed_hash


def validate_attempt_journal(
    records: Sequence[Mapping[str, Any]],
    *,
    manifest: Mapping[str, Any],
    expected_record_count: int | None = None,
    expected_terminal_sha256: str | None = None,
) -> str | None:
    """Validate order, uniqueness, chaining, and an optional sealed envelope."""

    validate_wave_manifest(manifest)
    if expected_record_count is not None:
        _nonnegative_int(expected_record_count, "expected_record_count")
        if len(records) != expected_record_count:
            raise WaveContractError(
                "attempt journal record count does not match its sealed envelope"
            )
    expected_head = _sha256(
        expected_terminal_sha256, "expected_terminal_sha256", optional=True
    )
    if expected_record_count == 0 and expected_head is not None:
        raise WaveContractError("an empty sealed journal cannot have a terminal hash")

    previous: str | None = None
    attempt_ids: set[str] = set()
    for index, record in enumerate(records):
        attempt_id = record.get("attempt_id") if isinstance(record, Mapping) else None
        if isinstance(attempt_id, str) and attempt_id in attempt_ids:
            raise WaveContractError(f"duplicate attempt_id: {attempt_id}")
        current = validate_attempt_record(
            record,
            manifest=manifest,
            expected_index=index,
            expected_previous_sha256=previous,
        )
        attempt_ids.add(str(attempt_id))
        previous = current

    if expected_head is not None and previous != expected_head:
        raise WaveContractError(
            "attempt journal terminal hash does not match its sealed envelope"
        )
    return previous


def publication_assessment(
    *,
    manifest: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
    expected_record_count: int | None = None,
    expected_terminal_sha256: str | None = None,
) -> dict[str, Any]:
    """Return publication blockers without claiming theorem closure."""

    blockers: list[str] = []
    sealed = expected_record_count is not None and expected_terminal_sha256 is not None
    if not sealed:
        blockers.append("attempt_journal_not_sealed")
    terminal_hash = validate_attempt_journal(
        records,
        manifest=manifest,
        expected_record_count=expected_record_count,
        expected_terminal_sha256=expected_terminal_sha256,
    )
    if not records:
        blockers.append("no_attempts")
    else:
        if records[-1]["outcome"] != CERTIFIED_UNSAT:
            blockers.append("terminal_outcome_not_certified_unsat")
    if manifest["encoding"]["query_polarity"] != UNSAT_MEANS_OBSTRUCTION:
        blockers.append("query_polarity_does_not_make_unsat_an_obstruction")
    if manifest["promotion"]["evidence_classification"] == LOCAL_CERTIFICATE:
        blockers.append("local_certificate_has_no_universal_promotion_contract")
    return {
        "publication_candidate": not blockers,
        "evidence_classification": manifest["promotion"]["evidence_classification"],
        "terminal_attempt_sha256": terminal_hash,
        "blockers": blockers,
    }
