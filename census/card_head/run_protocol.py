"""Durable event protocol for manifest-pinned AHEAD card-head runs.

The immutable manifest is the run contract.  This module records only an
append-only stream of measurements and derives the current operational state
from that stream.  There is no mutable status file to trust or repair.

Event files are written completely, fsynced, and then hard-linked into their
final sequence name.  The link refuses overwrite, while the hash chain and
strict replay reject gaps, drift, and corruption.  A policy stop is terminal:
no later event can be appended.

Each ``CHUNK_COMPLETED`` event represents one SAT-witness iteration.  Its
``fresh_shape_count`` is measured before certification, matching the historical
``shape_stale = not fresh_shapes`` convergence signal even when certification
does not grow the durable shape bank.

This protocol is operational infrastructure.  In particular,
``ENGINE_EXHAUSTED_UNVERIFIED`` is deliberately not a coverage result.  A
future certification adapter must publish proof-gated artifacts separately.
"""

from __future__ import annotations

import hashlib
import json
import math
import os
import re
import uuid
from collections.abc import Callable, Mapping, Sequence
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from .run_manifest import json_sha256, validate_manifest


EVENT_SCHEMA = "p97_ahead_run_event.v1"
STATE_SCHEMA = "p97_ahead_run_state.v1"
RUN_STARTED = "RUN_STARTED"
CHUNK_COMPLETED = "CHUNK_COMPLETED"
RUN_FINISHED = "RUN_FINISHED"

PLANNED = "PLANNED"
RUNNING = "RUNNING"
STOPPED_BY_POLICY = "STOPPED_BY_POLICY"

STOP_WALL = "WALL_SECONDS"
STOP_BANK_GROWTH = "NEW_BANK_ROWS"
STOP_SHAPE_STALENESS = "CONSECUTIVE_SHAPE_STALE"

ENGINE_EXHAUSTED_UNVERIFIED = "ENGINE_EXHAUSTED_UNVERIFIED"
SAT_WITNESS = "SAT_WITNESS"
INTERRUPTED = "INTERRUPTED"
ERROR = "ERROR"
FINISH_STATUS = {
    ENGINE_EXHAUSTED_UNVERIFIED: ENGINE_EXHAUSTED_UNVERIFIED,
    SAT_WITNESS: SAT_WITNESS,
    INTERRUPTED: INTERRUPTED,
    ERROR: "FAILED",
}
OPERATIONAL_SCOPE = (
    "Derived operational state only; not a checked finite cover or geometric "
    "closure theorem"
)

_EVENT_NAME = re.compile(r"^event-(\d{8,})\.json$")
_SHA256 = re.compile(r"^[0-9a-f]{64}$")


class RunProtocolError(RuntimeError):
    """The event stream is invalid, terminal, or lost an append race."""


def _canonical_bytes(value: Any) -> bytes:
    try:
        encoded = json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        )
    except (TypeError, ValueError) as exc:
        raise RunProtocolError("event is not finite JSON data") from exc
    return encoded.encode("utf-8")


def event_sha256(event: Mapping[str, Any]) -> str:
    """Return the canonical digest used by the append-only hash chain."""

    return hashlib.sha256(_canonical_bytes(event)).hexdigest()


def _utc_now() -> str:
    return (
        datetime.now(timezone.utc)
        .replace(microsecond=0)
        .isoformat()
        .replace("+00:00", "Z")
    )


def _validate_utc(value: Any) -> str:
    if not isinstance(value, str) or not value.endswith("Z"):
        raise RunProtocolError("recorded_utc must be an ISO-8601 UTC string")
    try:
        parsed = datetime.fromisoformat(value[:-1] + "+00:00")
    except ValueError as exc:
        raise RunProtocolError("recorded_utc is not valid ISO-8601") from exc
    if parsed.utcoffset() != timezone.utc.utcoffset(parsed):
        raise RunProtocolError("recorded_utc must use UTC")
    return value


def _nonnegative_int(value: Any, description: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise RunProtocolError(f"{description} must be a nonnegative integer")
    return value


def _nonnegative_number(value: Any, description: str) -> float:
    if (
        isinstance(value, bool)
        or not isinstance(value, (int, float))
        or not math.isfinite(value)
        or value < 0
    ):
        raise RunProtocolError(f"{description} must be a finite nonnegative number")
    return float(value)


def _require_exact_keys(
    value: Mapping[str, Any], required: set[str], description: str
) -> None:
    actual = set(value)
    missing = required - actual
    extra = actual - required
    if missing or extra:
        raise RunProtocolError(
            f"{description} keys differ: "
            f"missing={sorted(missing)}, extra={sorted(extra)}"
        )


def _validate_event(
    value: Mapping[str, Any],
    manifest: Mapping[str, Any],
    *,
    expected_seq: int,
    previous_sha256: str | None,
) -> dict[str, Any]:
    if not isinstance(value, Mapping):
        raise RunProtocolError("event must be a JSON object")
    kind = value.get("kind")
    common = {
        "schema",
        "seq",
        "kind",
        "recorded_utc",
        "run_id",
        "manifest_sha256",
        "previous_event_sha256",
    }
    if kind == RUN_STARTED:
        specific = {"initial_bank_rows", "initial_shape_count"}
    elif kind == CHUNK_COMPLETED:
        specific = {
            "elapsed_seconds",
            "bank_rows_total",
            "shape_count_total",
            "fresh_shape_count",
        }
    elif kind == RUN_FINISHED:
        specific = {
            "elapsed_seconds",
            "bank_rows_total",
            "shape_count_total",
            "outcome",
            "detail",
        }
    else:
        raise RunProtocolError(f"unknown event kind: {kind!r}")
    _require_exact_keys(value, common | specific, "event")

    if value["schema"] != EVENT_SCHEMA:
        raise RunProtocolError(f"event schema must be {EVENT_SCHEMA}")
    if _nonnegative_int(value["seq"], "event seq") != expected_seq:
        raise RunProtocolError(
            f"event seq must be {expected_seq}, got {value['seq']!r}"
        )
    if kind == RUN_STARTED and expected_seq != 0:
        raise RunProtocolError("RUN_STARTED may appear only at seq 0")
    if kind != RUN_STARTED and expected_seq == 0:
        raise RunProtocolError("the event stream must begin with RUN_STARTED")
    _validate_utc(value["recorded_utc"])

    if value["run_id"] != manifest["run_id"]:
        raise RunProtocolError("event run_id does not match the manifest")
    manifest_digest = json_sha256(manifest)
    if value["manifest_sha256"] != manifest_digest:
        raise RunProtocolError("event manifest digest does not match the manifest")
    if value["previous_event_sha256"] != previous_sha256:
        raise RunProtocolError("event hash chain does not match its predecessor")
    if previous_sha256 is not None and _SHA256.fullmatch(previous_sha256) is None:
        raise RunProtocolError("previous event digest is not a SHA-256")

    if kind == RUN_STARTED:
        bank_rows = _nonnegative_int(
            value["initial_bank_rows"], "initial_bank_rows"
        )
        shape_count = _nonnegative_int(
            value["initial_shape_count"], "initial_shape_count"
        )
    else:
        _nonnegative_number(value["elapsed_seconds"], "elapsed_seconds")
        bank_rows = _nonnegative_int(value["bank_rows_total"], "bank_rows_total")
        shape_count = _nonnegative_int(
            value["shape_count_total"], "shape_count_total"
        )
        if kind == CHUNK_COMPLETED:
            _nonnegative_int(value["fresh_shape_count"], "fresh_shape_count")
        if kind == RUN_FINISHED:
            if value["outcome"] not in FINISH_STATUS:
                raise RunProtocolError(
                    "outcome must be one of " + ", ".join(sorted(FINISH_STATUS))
                )
            if not isinstance(value["detail"], str) or not value["detail"]:
                raise RunProtocolError("finish detail must be a nonempty string")
    if shape_count > bank_rows:
        raise RunProtocolError("shape count cannot exceed bank row count")

    try:
        return json.loads(_canonical_bytes(value))
    except json.JSONDecodeError as exc:  # pragma: no cover - encoder round trip
        raise AssertionError("canonical event JSON failed to decode") from exc


def _empty_state(manifest: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": STATE_SCHEMA,
        "scope": OPERATIONAL_SCOPE,
        "run_id": manifest["run_id"],
        "manifest_sha256": json_sha256(manifest),
        "status": PLANNED,
        "terminal": False,
        "event_count": 0,
        "last_event_sha256": None,
        "last_recorded_utc": None,
        "elapsed_seconds": 0.0,
        "initial_bank_rows": None,
        "bank_rows_total": None,
        "new_bank_rows": 0,
        "initial_shape_count": None,
        "shape_count_total": None,
        "last_fresh_shape_count": None,
        "consecutive_shape_stale": 0,
        "triggered_stops": [],
        "engine_outcome": None,
    }


def _policy_stops(
    manifest: Mapping[str, Any], state: Mapping[str, Any]
) -> list[str]:
    stops: list[str] = []
    limits = manifest["stops"]
    if state["elapsed_seconds"] >= limits["wall_seconds"]:
        stops.append(STOP_WALL)
    if state["new_bank_rows"] >= limits["max_new_bank_rows"]:
        stops.append(STOP_BANK_GROWTH)
    if (
        state["consecutive_shape_stale"]
        >= limits["max_consecutive_shape_stale"]
    ):
        stops.append(STOP_SHAPE_STALENESS)
    return stops


def derive_run_state(
    manifest_value: Mapping[str, Any], events: Sequence[Mapping[str, Any]]
) -> dict[str, Any]:
    """Strictly replay ``events`` and derive the sole current run state."""

    manifest = validate_manifest(manifest_value)
    state = _empty_state(manifest)
    previous_sha256: str | None = None

    for expected_seq, raw_event in enumerate(events):
        if state["terminal"]:
            raise RunProtocolError("event appears after terminal run state")
        event = _validate_event(
            raw_event,
            manifest,
            expected_seq=expected_seq,
            previous_sha256=previous_sha256,
        )
        kind = event["kind"]
        if kind == RUN_STARTED:
            state["status"] = RUNNING
            state["initial_bank_rows"] = event["initial_bank_rows"]
            state["bank_rows_total"] = event["initial_bank_rows"]
            state["initial_shape_count"] = event["initial_shape_count"]
            state["shape_count_total"] = event["initial_shape_count"]
        else:
            if event["elapsed_seconds"] < state["elapsed_seconds"]:
                raise RunProtocolError("elapsed_seconds cannot move backwards")
            if event["bank_rows_total"] < state["bank_rows_total"]:
                raise RunProtocolError("bank_rows_total cannot move backwards")
            if event["shape_count_total"] < state["shape_count_total"]:
                raise RunProtocolError("shape_count_total cannot move backwards")

            prior_shape_count = state["shape_count_total"]
            prior_bank_rows = state["bank_rows_total"]
            state["elapsed_seconds"] = event["elapsed_seconds"]
            state["bank_rows_total"] = event["bank_rows_total"]
            state["shape_count_total"] = event["shape_count_total"]
            state["new_bank_rows"] = (
                event["bank_rows_total"] - state["initial_bank_rows"]
            )
            if kind == CHUNK_COMPLETED:
                shape_growth = event["shape_count_total"] - prior_shape_count
                if shape_growth > event["fresh_shape_count"]:
                    raise RunProtocolError(
                        "banked shape growth cannot exceed fresh shapes observed"
                    )
                state["last_fresh_shape_count"] = event["fresh_shape_count"]
                if event["fresh_shape_count"] == 0:
                    state["consecutive_shape_stale"] += 1
                else:
                    state["consecutive_shape_stale"] = 0
            elif kind == RUN_FINISHED:
                if (
                    event["bank_rows_total"] != prior_bank_rows
                    or event["shape_count_total"] != prior_shape_count
                ):
                    raise RunProtocolError(
                        "RUN_FINISHED cannot hide unrecorded bank or shape growth"
                    )
                state["engine_outcome"] = event["outcome"]

            triggered = _policy_stops(manifest, state)
            if triggered:
                state["status"] = STOPPED_BY_POLICY
                state["terminal"] = True
                state["triggered_stops"] = triggered
            elif kind == RUN_FINISHED:
                state["status"] = FINISH_STATUS[event["outcome"]]
                state["terminal"] = True
            else:
                state["status"] = RUNNING

        previous_sha256 = event_sha256(event)
        state["event_count"] = expected_seq + 1
        state["last_event_sha256"] = previous_sha256
        state["last_recorded_utc"] = event["recorded_utc"]

    return state


def _event_files(event_dir: Path) -> list[Path]:
    if not event_dir.exists():
        return []
    if event_dir.is_symlink() or not event_dir.is_dir():
        raise RunProtocolError(f"event path is not a real directory: {event_dir}")
    indexed: list[tuple[int, Path]] = []
    for path in event_dir.iterdir():
        if not path.name.startswith("event-") or path.suffix != ".json":
            continue
        match = _EVENT_NAME.fullmatch(path.name)
        if match is None:
            raise RunProtocolError(f"invalid event filename: {path.name}")
        if path.is_symlink() or not path.is_file():
            raise RunProtocolError(f"event is not a real file: {path}")
        if path.stat().st_mode & 0o222:
            raise RunProtocolError(f"event file is writable: {path}")
        indexed.append((int(match.group(1)), path))
    indexed.sort()
    for expected, (actual, path) in enumerate(indexed):
        if actual != expected:
            raise RunProtocolError(
                f"event sequence gap: expected {expected}, found {path.name}"
            )
    return [path for _, path in indexed]


def read_event_stream(event_dir: Path) -> list[dict[str, Any]]:
    """Read the immutable event files in sequence order."""

    events: list[dict[str, Any]] = []
    for path in _event_files(event_dir):
        try:
            value = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise RunProtocolError(f"cannot read event {path}: {exc}") from exc
        if not isinstance(value, dict):
            raise RunProtocolError(f"event is not a JSON object: {path}")
        events.append(value)
    return events


def default_event_dir(
    repo_root: Path, manifest_value: Mapping[str, Any]
) -> Path:
    """Resolve the manifest-owned event directory without allowing escape."""

    manifest = validate_manifest(manifest_value)
    root = repo_root.resolve()
    event_dir = (root / manifest["artifact_dir"] / "events").resolve()
    try:
        event_dir.relative_to(root)
    except ValueError as exc:
        raise RunProtocolError("manifest event directory escapes repository root") from exc
    return event_dir


def read_run_state(
    manifest_value: Mapping[str, Any], event_dir: Path
) -> dict[str, Any]:
    """Read and replay an event directory into its derived state."""

    return derive_run_state(manifest_value, read_event_stream(event_dir))


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _publish_event(event_dir: Path, event: Mapping[str, Any]) -> None:
    event_dir.mkdir(parents=True, exist_ok=True)
    if event_dir.is_symlink() or not event_dir.is_dir():
        raise RunProtocolError(f"event path is not a real directory: {event_dir}")
    seq = event["seq"]
    target = event_dir / f"event-{seq:08d}.json"
    temporary = event_dir / f".{target.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}"
    payload = _canonical_bytes(event) + b"\n"
    try:
        with open(temporary, "xb") as handle:
            handle.write(payload)
            handle.flush()
            os.fchmod(handle.fileno(), 0o444)
            os.fsync(handle.fileno())
        try:
            os.link(temporary, target)
        except FileExistsError as exc:
            raise RunProtocolError(
                f"concurrent append or existing event at seq {seq}"
            ) from exc
        _fsync_directory(event_dir)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass


def _append_event(
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    *,
    allowed_status: str,
    build: Callable[[int, str | None, Mapping[str, Any]], dict[str, Any]],
) -> dict[str, Any]:
    manifest = validate_manifest(manifest_value)
    events = read_event_stream(event_dir)
    state = derive_run_state(manifest, events)
    if state["status"] != allowed_status or state["terminal"]:
        raise RunProtocolError(
            f"cannot append from run status {state['status']}"
        )
    event = build(len(events), state["last_event_sha256"], manifest)
    normalized = _validate_event(
        event,
        manifest,
        expected_seq=len(events),
        previous_sha256=state["last_event_sha256"],
    )
    next_state = derive_run_state(manifest, [*events, normalized])
    _publish_event(event_dir, normalized)
    return next_state


def _common_event(
    manifest: Mapping[str, Any],
    *,
    seq: int,
    previous_sha256: str | None,
    kind: str,
    recorded_utc: str | None,
) -> dict[str, Any]:
    return {
        "schema": EVENT_SCHEMA,
        "seq": seq,
        "kind": kind,
        "recorded_utc": recorded_utc or _utc_now(),
        "run_id": manifest["run_id"],
        "manifest_sha256": json_sha256(manifest),
        "previous_event_sha256": previous_sha256,
    }


def append_run_started(
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    *,
    initial_bank_rows: int,
    initial_shape_count: int,
    recorded_utc: str | None = None,
) -> dict[str, Any]:
    """Durably start a planned run and bind its initial growth baselines."""

    def build(seq: int, previous: str | None, manifest: Mapping[str, Any]):
        return {
            **_common_event(
                manifest,
                seq=seq,
                previous_sha256=previous,
                kind=RUN_STARTED,
                recorded_utc=recorded_utc,
            ),
            "initial_bank_rows": initial_bank_rows,
            "initial_shape_count": initial_shape_count,
        }

    return _append_event(
        event_dir, manifest_value, allowed_status=PLANNED, build=build
    )


def append_chunk_completed(
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    *,
    elapsed_seconds: float,
    bank_rows_total: int,
    shape_count_total: int,
    fresh_shape_count: int,
    recorded_utc: str | None = None,
) -> dict[str, Any]:
    """Append one SAT-witness iteration and derive any mandatory stop."""

    def build(seq: int, previous: str | None, manifest: Mapping[str, Any]):
        return {
            **_common_event(
                manifest,
                seq=seq,
                previous_sha256=previous,
                kind=CHUNK_COMPLETED,
                recorded_utc=recorded_utc,
            ),
            "elapsed_seconds": elapsed_seconds,
            "bank_rows_total": bank_rows_total,
            "shape_count_total": shape_count_total,
            "fresh_shape_count": fresh_shape_count,
        }

    return _append_event(
        event_dir, manifest_value, allowed_status=RUNNING, build=build
    )


def append_run_finished(
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    *,
    elapsed_seconds: float,
    bank_rows_total: int,
    shape_count_total: int,
    outcome: str,
    detail: str,
    recorded_utc: str | None = None,
) -> dict[str, Any]:
    """Append a non-proof terminal outcome for an otherwise running engine."""

    def build(seq: int, previous: str | None, manifest: Mapping[str, Any]):
        return {
            **_common_event(
                manifest,
                seq=seq,
                previous_sha256=previous,
                kind=RUN_FINISHED,
                recorded_utc=recorded_utc,
            ),
            "elapsed_seconds": elapsed_seconds,
            "bank_rows_total": bank_rows_total,
            "shape_count_total": shape_count_total,
            "outcome": outcome,
            "detail": detail,
        }

    return _append_event(
        event_dir, manifest_value, allowed_status=RUNNING, build=build
    )
