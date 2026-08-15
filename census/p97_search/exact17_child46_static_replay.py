"""Offline source-semantic replay for an authenticated Child46 SAT envelope.

The generic static engine already authenticates the returned assignment against
the sealed raw PIQD model response and the full Child46 CNF.  This module adds
the missing source-facing seam: it requires that registered output, decodes
the same 308 literals through the maintained Exact17 replay machinery, and
returns a deterministic source replay record.  Kalmanson proposal search is
deliberately a later, separately authorized metric mine.
"""

from __future__ import annotations

import hashlib
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Final, Literal

from census.p97_search.cegar_wave_registry import validate_registered_output
from census.p97_search.exact17_source_model_replay import (
    _SOURCE_PREDICATES,
    LEGAL_NEXT_CENTERS,
    POINT_COUNT,
    VARIABLE_COUNT,
    Child44ReplayError,
    DecodedSourceModel,
    _decode_source_model,
    _parse_assignment,
    _validate_decoded_source_model,
    canonical_assignment_sha256,
)
from census.p97_search.phase3_cegar_runtime import capture_exact_regular_file
from census.p97_search.phase3_cegar_wave import canonical_json_bytes
from census.p97_search.phase3_cegar_wave_control import (
    MAX_CONTROL_BYTES,
    load_wave_control,
)
from census.p97_search.phase3_cegar_wave_engine import SAT_OBSERVED

CHILD46_PROFILE_ID: Final = "exact17-child46"
CHILD46_PROFILE_VALIDATOR: Final = CHILD46_PROFILE_ID
CHILD46_PROFILE_SHA256: Final = (
    "0aed6354f041a85c03e29c2642b4869553fb83d8dd0260e7785503f8ec8dd5e0"
)
CHILD46_ROOT_SHA256: Final = (
    "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2"
)
CHILD46_PARENT_SHA256: Final = (
    "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5"
)
CHILD46_SOURCE_SHA256: Final = (
    "b8d285ac9b85821ac7634103d9fa8fe9588747c0a57659a28e6e1dee4a9ae127"
)
CHILD46_RUNNER_SOURCE_MANIFEST_SHA256: Final = (
    "066ef659a47ef250feb821a6a9c06a8845147af0552fac67094a21d55b44be19"
)
CHILD46_VARIABLES: Final = 308
CHILD46_CLAUSES: Final = 5_848_864
CHILD46_REPLAY_SCHEMA: Final = "p97-exact17-child46-static-sat-replay/v1"
METRIC_MINE_DEFERRED: Final = "DEFERRED_EXACT_KALMANSON_PROPOSAL_REPLAY"


class Child46StaticReplayError(ValueError):
    """A control, registered output, assignment, or source replay failed."""


@dataclass(frozen=True)
class Child46StaticSatReplay:
    """Deterministic source replay record suitable for a later wave-only mine."""

    schema: Literal["p97-exact17-child46-static-sat-replay/v1"]
    control_sha256: str
    output_envelope_sha256: str
    root_sha256: str
    parent_sha256: str
    assignment_sha256: str
    source_model: DecodedSourceModel
    source_predicates: tuple[str, ...]
    metric_mine: str
    replay_sha256: str

    def _unsigned_dict(self) -> dict[str, Any]:
        source = self.source_model
        return {
            "assignment_sha256": self.assignment_sha256,
            "control_sha256": self.control_sha256,
            "metric_mine": {
                "disposition": self.metric_mine,
                "entry_point": "verify_exact17_kalmanson_proposal",
                "status": "DEFERRED",
            },
            "output_envelope_sha256": self.output_envelope_sha256,
            "parent_sha256": self.parent_sha256,
            "root_sha256": self.root_sha256,
            "schema": self.schema,
            "source_model": {
                "digest": source.digest,
                "named_order": source.named_order,
                "next_center": source.next_center,
                "rows": [list(row) for row in source.rows],
                "selected_order": list(source.selected_order),
            },
            "source_predicates": list(self.source_predicates),
        }

    def as_dict(self) -> dict[str, Any]:
        """Return the canonical replay object, including its self-hash."""

        unsigned = self._unsigned_dict()
        if hashlib.sha256(canonical_json_bytes(unsigned)).hexdigest() != self.replay_sha256:
            raise Child46StaticReplayError("replay self-hash is inconsistent")
        return {**unsigned, "replay_sha256": self.replay_sha256}

    def json_bytes(self) -> bytes:
        """Serialize the replay object without a trailing newline."""

        return canonical_json_bytes(self.as_dict())


def _absolute_path(path: Path, label: str) -> Path:
    if type(path) is not type(Path()) or not path.is_absolute():
        raise Child46StaticReplayError(f"{label} must be an absolute native Path")
    if Path(os.path.normpath(os.fspath(path))) != path:
        raise Child46StaticReplayError(f"{label} is not normalized")
    return path


def _load_registered_control(path: Path) -> Any:
    try:
        captured = capture_exact_regular_file(
            path,
            max_bytes=MAX_CONTROL_BYTES,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=True,
            label="Child46 control",
        )
    except Exception as error:
        raise Child46StaticReplayError("Child46 control custody capture failed") from error
    if captured.data is None:
        raise Child46StaticReplayError("Child46 control bytes were not retained")
    try:
        return load_wave_control(captured.data)
    except Exception as error:
        raise Child46StaticReplayError("Child46 control failed registered validation") from error


def _require_child46_control(control: Any) -> None:
    registration = getattr(control, "registration", None)
    if (
        getattr(registration, "wave_kind", None) != "STATIC_CNF"
        or getattr(registration, "adapter_id", None) != "static-cnf-piqd"
        or getattr(registration, "schema_version", None) != "v2"
        or getattr(registration, "semantic_validator", None)
        != "p97-static-cnf-semantic-profile/v1"
    ):
        raise Child46StaticReplayError("control is not the registered Child46 STATIC_CNF v2 profile")
    cnf = getattr(control, "cnf", None)
    profile = getattr(control, "semantic_profile", None)
    if getattr(cnf, "sha256", None) != CHILD46_ROOT_SHA256:
        raise Child46StaticReplayError("control CNF is not the authenticated Child46 root")
    if getattr(profile, "sha256", None) != CHILD46_PROFILE_SHA256:
        raise Child46StaticReplayError("control semantic profile is not exact Child46")
    try:
        references = dict(getattr(control, "semantic_artifacts", ()))
    except (TypeError, ValueError) as error:
        raise Child46StaticReplayError("control semantic artifacts are malformed") from error
    parent = references.get("parent_cnf")
    if getattr(parent, "sha256", None) != CHILD46_PARENT_SHA256:
        raise Child46StaticReplayError("control parent CNF is not the authenticated Child45 root")


def _require_child46_envelope(control: Any, envelope: dict[str, Any]) -> dict[str, Any]:
    _require_child46_control(control)
    profile = envelope.get("semantic_profile")
    metadata = profile.get("metadata") if type(profile) is dict else None
    if (
        type(profile) is not dict
        or profile.get("sha256") != CHILD46_PROFILE_SHA256
        or type(metadata) is not dict
        or metadata.get("profile_id") != CHILD46_PROFILE_ID
        or metadata.get("validator") != CHILD46_PROFILE_VALIDATOR
    ):
        raise Child46StaticReplayError("output semantic profile is not exact Child46")
    package = envelope.get("package")
    if type(package) is not dict or package.get("cnf_sha256") != CHILD46_ROOT_SHA256:
        raise Child46StaticReplayError("output package is not bound to the Child46 root")
    manifest = envelope.get("wave_manifest")
    manifest_value = manifest.get("manifest") if type(manifest) is dict else None
    encoding = manifest_value.get("encoding") if type(manifest_value) is dict else None
    if (
        type(encoding) is not dict
        or encoding.get("cnf_sha256") != CHILD46_ROOT_SHA256
        or encoding.get("num_variables") != CHILD46_VARIABLES
        or encoding.get("num_clauses") != CHILD46_CLAUSES
    ):
        raise Child46StaticReplayError("output wave manifest is not bound to Child46")
    source = manifest_value.get("source") if type(manifest_value) is dict else None
    if (
        type(source) is not dict
        or source.get("ingress_hypotheses_sha256") != CHILD46_SOURCE_SHA256
        or source.get("finite_schema") != "p97-exact17-forty-sixth-export-validation/v1"
        or source.get("live_leaf") != "exact17-child46-forty-sixth-model-refinements"
        or source.get("source_theorem")
        != "Problem97.ATailBlockerVExactSeventeenFortySixthModelRefinements.sourceAssign_extendedFortySixthModelRefinementsCnf"
    ):
        raise Child46StaticReplayError("output source manifest is not exact Child46")
    result = envelope.get("result")
    if (
        type(result) is not dict
        or result.get("classification") != SAT_OBSERVED
        or result.get("verdict") != "SAT"
        or result.get("returncode") != 10
    ):
        raise Child46StaticReplayError("Child46 output is not an observed SAT result")
    receipt = envelope.get("receipt")
    if (
        type(receipt) is not dict
        or receipt.get("cnf_sha256") != CHILD46_ROOT_SHA256
        or receipt.get("num_variables") != CHILD46_VARIABLES
        or receipt.get("num_clauses") != CHILD46_CLAUSES
        or type(receipt.get("model_response_sha256")) is not str
        or receipt.get("source_manifest_sha256")
        != CHILD46_RUNNER_SOURCE_MANIFEST_SHA256
    ):
        raise Child46StaticReplayError("Child46 SAT receipt lacks exact model custody")
    return result


def _assignment_from_result(result: dict[str, Any]) -> tuple[int, ...]:
    raw = result.get("assignment")
    if type(raw) is not dict or set(raw) != {str(index) for index in range(1, VARIABLE_COUNT + 1)}:
        raise Child46StaticReplayError("Child46 SAT assignment is not total over 308 variables")
    if any(type(value) is not bool for value in raw.values()):
        raise Child46StaticReplayError("Child46 SAT assignment values are not booleans")
    assignment = tuple(index if raw[str(index)] else -index for index in range(1, VARIABLE_COUNT + 1))
    try:
        _parse_assignment(assignment)
    except Child44ReplayError as error:
        raise Child46StaticReplayError("Child46 SAT assignment is not canonical") from error
    return assignment


def replay_child46_static_sat(
    *, control_path: Path, package_root: Path, output_path: Path
) -> Child46StaticSatReplay:
    """Authenticate and source-replay one published Child46 SAT envelope.

    ``validate_registered_output`` is intentionally mandatory: this function
    never accepts a structural envelope or a caller-supplied model detached
    from the sealed raw response and exact Child46 CNF.
    """

    control_path = _absolute_path(control_path, "control_path")
    package_root = _absolute_path(package_root, "package_root")
    output_path = _absolute_path(output_path, "output_path")
    control = _load_registered_control(control_path)
    try:
        envelope = validate_registered_output(control, package_root, output_path)
    except Exception as error:
        raise Child46StaticReplayError("registered Child46 output validation failed") from error
    if type(envelope) is not dict:
        raise Child46StaticReplayError("registered validator returned a non-object envelope")
    result = _require_child46_envelope(control, envelope)
    assignment = _assignment_from_result(result)
    truth = _parse_assignment(assignment)
    next_centers = tuple(
        center for center in LEGAL_NEXT_CENTERS if truth[290 + center]
    )
    if len(next_centers) != 1:
        raise Child46StaticReplayError("Child46 source replay has no unique legal next center")
    try:
        source = _decode_source_model(truth, next_centers[0])
        _validate_decoded_source_model(source)
    except Child44ReplayError as error:
        raise Child46StaticReplayError("Child46 source-semantic replay failed") from error
    if source.next_center not in LEGAL_NEXT_CENTERS or len(source.rows) != POINT_COUNT:
        raise Child46StaticReplayError("Child46 source replay dimensions are invalid")
    unsigned = {
        "assignment_sha256": canonical_assignment_sha256(assignment),
        "control_sha256": envelope["control"]["sha256"],
        "metric_mine": {
            "disposition": METRIC_MINE_DEFERRED,
            "entry_point": "verify_exact17_kalmanson_proposal",
            "status": "DEFERRED",
        },
        "output_envelope_sha256": envelope["envelope_sha256"],
        "parent_sha256": CHILD46_PARENT_SHA256,
        "root_sha256": CHILD46_ROOT_SHA256,
        "schema": CHILD46_REPLAY_SCHEMA,
        "source_model": {
            "digest": source.digest,
            "named_order": source.named_order,
            "next_center": source.next_center,
            "rows": [list(row) for row in source.rows],
            "selected_order": list(source.selected_order),
        },
        "source_predicates": list(_SOURCE_PREDICATES),
    }
    replay_sha256 = hashlib.sha256(canonical_json_bytes(unsigned)).hexdigest()
    return Child46StaticSatReplay(
        schema=CHILD46_REPLAY_SCHEMA,
        control_sha256=unsigned["control_sha256"],
        output_envelope_sha256=unsigned["output_envelope_sha256"],
        root_sha256=CHILD46_ROOT_SHA256,
        parent_sha256=CHILD46_PARENT_SHA256,
        assignment_sha256=unsigned["assignment_sha256"],
        source_model=source,
        source_predicates=tuple(_SOURCE_PREDICATES),
        metric_mine=METRIC_MINE_DEFERRED,
        replay_sha256=replay_sha256,
    )


def write_child46_static_sat_replay(
    *,
    control_path: Path,
    package_root: Path,
    output_path: Path,
    replay_path: Path,
) -> Child46StaticSatReplay:
    """Replay Child46 and publish its deterministic record exactly once."""

    replay_path = _absolute_path(replay_path, "replay_path")
    result = replay_child46_static_sat(
        control_path=control_path,
        package_root=package_root,
        output_path=output_path,
    )
    raw = result.json_bytes() + b"\n"
    parent_fd = os.open(
        replay_path.parent,
        os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
    )
    file_fd: int | None = None
    try:
        file_fd = os.open(
            replay_path.name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | os.O_NOFOLLOW
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=parent_fd,
        )
        view = memoryview(raw)
        while view:
            written = os.write(file_fd, view)
            if written <= 0:
                raise Child46StaticReplayError("replay publication made no progress")
            view = view[written:]
        os.fsync(file_fd)
        os.fsync(parent_fd)
    except OSError as error:
        raise Child46StaticReplayError("replay publication failed") from error
    finally:
        if file_fd is not None:
            os.close(file_fd)
        os.close(parent_fd)
    return result


__all__ = [
    "CHILD46_CLAUSES",
    "CHILD46_PARENT_SHA256",
    "CHILD46_PROFILE_ID",
    "CHILD46_PROFILE_SHA256",
    "CHILD46_PROFILE_VALIDATOR",
    "CHILD46_REPLAY_SCHEMA",
    "CHILD46_ROOT_SHA256",
    "CHILD46_RUNNER_SOURCE_MANIFEST_SHA256",
    "CHILD46_SOURCE_SHA256",
    "CHILD46_VARIABLES",
    "METRIC_MINE_DEFERRED",
    "Child46StaticReplayError",
    "Child46StaticSatReplay",
    "replay_child46_static_sat",
    "write_child46_static_sat_replay",
]
