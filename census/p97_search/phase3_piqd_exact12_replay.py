"""Fail-closed replay of one piqd SAT model for an exact12 v14 source job.

This is a source-semantic replay boundary, not a certificate or coverage
claim.  The source job, current source files, discovery DIMACS, and piqd model
are all authenticated before the independent exact12 predicates are run.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

from census.card_head.exact12_v14_bound_jobs import (
    BOUND_JOB_SCHEMA,
    Exact12V14BoundJobError,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_cell_run import cnf_assignment_satisfies
from census.card_head.exact12_v14_schedule import build_manifest, json_sha256
from census.card_head.exact12_v14_valuation import (
    Exact12V14ValuationError,
    added_constraints_hold,
    decode_blockers,
)
from census.card_head.source_faithful_candidate_surface import (
    source_faithful_cube_ok,
)
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, parse_dimacs

REPLAY_SCHEMA = "p97_rigid221_exact12_full_v14_piqd_model_replay.v1"
REPLAY_STATUS = "FINITE_SOURCE_SEMANTIC_REPLAY"
REPLAY_SCOPE = (
    "one authenticated finite normalized-v14 cell; source-semantic SAT-model "
    "replay only; no aggregate coverage, universal lift, or Lean closure"
)
_MODEL_KEYS = frozenset({"job_id", "result", "num_assigned", "assignment"})


class Exact12PiqdReplayError(ValueError):
    """An input failed the finite exact12 source-semantic replay contract."""

    def __init__(self, message: str, *, receipt: Mapping[str, Any] | None = None):
        super().__init__(message)
        self.receipt = dict(receipt) if receipt is not None else None


def canonical_json_bytes(value: Any) -> bytes:
    """Return the receipt's canonical JSON encoding."""

    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _read_bytes(path: Path, label: str) -> bytes:
    try:
        return path.read_bytes()
    except OSError as exc:
        raise Exact12PiqdReplayError(f"cannot read {label}: {path}") from exc


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            parse_constant=reject_constant,
            object_pairs_hook=reject_duplicates,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12PiqdReplayError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise Exact12PiqdReplayError(f"{source} must contain a JSON object")
    return value


def _gate(
    gates: dict[str, Any], name: str, ok: bool, detail: str | None = None
) -> None:
    item: dict[str, Any] = {"ok": bool(ok)}
    if detail is not None:
        item["detail"] = detail
    gates[name] = item


def _assignment(
    assignment: Any, num_assigned: Any, n_variables: int
) -> tuple[int, ...]:
    if isinstance(num_assigned, bool) or not isinstance(num_assigned, int):
        raise Exact12PiqdReplayError("model.num_assigned must be an integer")
    if not isinstance(assignment, list):
        raise Exact12PiqdReplayError("model.assignment must be an array")
    if num_assigned != len(assignment) or num_assigned != n_variables:
        raise Exact12PiqdReplayError(
            "model assignment is not a full assignment of the DIMACS variables"
        )
    values: dict[int, int] = {}
    for literal in assignment:
        if isinstance(literal, bool) or not isinstance(literal, int) or literal == 0:
            raise Exact12PiqdReplayError(
                "model assignment must contain nonzero signed integers"
            )
        variable = abs(literal)
        if variable < 1 or variable > n_variables:
            raise Exact12PiqdReplayError(
                f"model literal {literal} is outside 1..={n_variables}"
            )
        if variable in values:
            raise Exact12PiqdReplayError(
                f"model assigns variable {variable} more than once"
            )
        values[variable] = literal
    if set(values) != set(range(1, n_variables + 1)):
        raise Exact12PiqdReplayError("model does not assign every DIMACS variable")
    return tuple(assignment)


def replay_exact12_model_snapshot(
    repo_root: Path,
    *,
    source_job_path: Path,
    source_job_bytes: bytes,
    discovery_cnf_path: Path,
    discovery_cnf_bytes: bytes,
    model_path: Path,
    model_bytes: bytes,
    expected_piqd_job_id: str,
) -> dict[str, Any]:
    """Replay immutable input snapshots and return a canonical finite-cell receipt.

    Any failed gate raises :class:`Exact12PiqdReplayError`.  The exception's
    ``receipt`` contains the failed gate whenever validation got far enough to
    construct one.  The paths are identity labels retained verbatim in the
    receipt; this function never opens them.
    """

    repo_root = Path(repo_root)
    source_job_path = Path(source_job_path)
    discovery_cnf_path = Path(discovery_cnf_path)
    model_path = Path(model_path)
    if not isinstance(expected_piqd_job_id, str) or not expected_piqd_job_id.strip():
        raise Exact12PiqdReplayError("expected_piqd_job_id must be a non-empty string")
    snapshots = {
        "source job": source_job_bytes,
        "discovery CNF": discovery_cnf_bytes,
        "piqd model": model_bytes,
    }
    for label, payload in snapshots.items():
        if not isinstance(payload, bytes):
            raise Exact12PiqdReplayError(f"{label} snapshot must be immutable bytes")
    job_raw = source_job_bytes
    cnf_raw = discovery_cnf_bytes
    model_raw = model_bytes
    gates: dict[str, Any] = {}
    input_hashes = {
        "source_job_sha256": _sha256(job_raw),
        "discovery_cnf_sha256": _sha256(cnf_raw),
        "model_sha256": _sha256(model_raw),
    }
    receipt: dict[str, Any] = {
        "schema": REPLAY_SCHEMA,
        "semantic_status": REPLAY_STATUS,
        "scope": REPLAY_SCOPE,
        "inputs": {
            "source_job": str(source_job_path),
            "discovery_cnf": str(discovery_cnf_path),
            "model": str(model_path),
            "expected_piqd_job_id": expected_piqd_job_id,
        },
        "hashes": input_hashes,
        "gates": gates,
    }

    try:
        job = _strict_json(job_raw, source="source job")
        model = _strict_json(model_raw, source="piqd model")
        _gate(gates, "strict_json", True)
    except Exact12PiqdReplayError as exc:
        _gate(gates, "strict_json", False, str(exc))
        receipt["status"] = "REJECTED"
        receipt["failure"] = str(exc)
        exc.receipt = receipt
        raise

    if set(model) != _MODEL_KEYS:
        error = "piqd model keys differ from the exact model schema"
        _gate(gates, "model_schema", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        exc = Exact12PiqdReplayError(error, receipt=receipt)
        raise exc
    _gate(gates, "model_schema", True)

    job_id = job.get("job_id")
    if job.get("schema") != BOUND_JOB_SCHEMA or not isinstance(job_id, str):
        error = "source job is not a typed exact12 v14 bound job"
        _gate(gates, "job_schema", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "job_schema", True)
    receipt["job"] = {
        "source_job_id": job_id,
        "piqd_job_id": expected_piqd_job_id,
        "cell_index": job.get("cell_index"),
        "job_sha256": json_sha256(job),
    }

    if model["result"] != "SAT":
        error = "piqd model result is not SAT"
        _gate(gates, "sat_result", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "sat_result", True)
    if model["job_id"] != expected_piqd_job_id:
        error = "piqd model job_id does not match expected piqd job ID"
        _gate(gates, "piqd_job_id", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "piqd_job_id", True)

    try:
        expected_cnf = job["cnf"]
        if (
            not isinstance(expected_cnf, Mapping)
            or expected_cnf.get("encoding") != "DIMACS"
            or _sha256(cnf_raw) != expected_cnf.get("sha256")
            or len(cnf_raw) != expected_cnf.get("bytes")
        ):
            raise Exact12PiqdReplayError(
                "discovery CNF hash or byte count differs from job"
            )
        n_variables, clauses = parse_dimacs(cnf_raw)
        expected_variables = expected_cnf.get("n_variables")
        expected_clauses = expected_cnf.get("n_clauses")
        if n_variables != expected_variables or len(clauses) != expected_clauses:
            raise Exact12PiqdReplayError("discovery CNF dimensions differ from job")
        receipt["cnf"] = {
            "n_variables": n_variables,
            "n_clauses": len(clauses),
            "bytes": len(cnf_raw),
        }
        _gate(gates, "cnf_identity", True)
    except (Exact12PiqdReplayError, PiqdOracleError, KeyError, TypeError) as exc:
        error = str(exc)
        _gate(gates, "cnf_identity", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt) from exc

    try:
        assignment = _assignment(
            model["assignment"], model["num_assigned"], n_variables
        )
    except Exact12PiqdReplayError as exc:
        _gate(gates, "total_assignment", False, str(exc))
        receipt["status"] = "REJECTED"
        receipt["failure"] = str(exc)
        exc.receipt = receipt
        raise
    _gate(gates, "total_assignment", True)
    positive = frozenset(literal for literal in assignment if literal > 0)

    try:
        schedule_manifest = build_manifest(repo_root)
        materialized = instantiate_validated_bound_job(
            job, schedule_manifest, repo_root
        )
        rebuilt_cnf = materialized.instance.dimacs().encode("ascii")
        if rebuilt_cnf != cnf_raw:
            raise Exact12PiqdReplayError(
                "current source rebuild differs from discovery CNF"
            )
        receipt["source"] = {
            "schedule_manifest_sha256": json_sha256(schedule_manifest),
            "rebuilt_cnf_sha256": _sha256(rebuilt_cnf),
        }
        _gate(gates, "current_source_rebuild", True)
    except (
        Exact12PiqdReplayError,
        Exact12V14BoundJobError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        error = str(exc)
        _gate(gates, "current_source_rebuild", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt) from exc

    exact_cnf = cnf_assignment_satisfies(
        materialized.instance.cnf.clauses,
        positive,
        n_variables=materialized.instance.cnf.n_variables,
    )
    _gate(gates, "exact_cnf", exact_cnf)
    try:
        cube = materialized.instance.decode_model(positive)
        candidate = source_faithful_cube_ok(materialized.instance.model, cube)
    except (ValueError, TypeError, KeyError) as exc:
        cube = None
        candidate = False
        _gate(gates, "source_faithful_candidate", False, str(exc))
    else:
        _gate(gates, "source_faithful_candidate", candidate)

    try:
        blockers = decode_blockers(positive, materialized.compiled.blocker_variables)
        _gate(gates, "blocker_decoding", True)
    except (Exact12V14ValuationError, ValueError, TypeError) as exc:
        blockers = None
        _gate(gates, "blocker_decoding", False, str(exc))

    added = False
    if blockers is not None and cube is not None:
        added = added_constraints_hold(materialized.compiled.cell, cube, blockers)
    _gate(gates, "added_constraints", added)

    overall = all(item["ok"] for item in gates.values())
    receipt["status"] = "ACCEPTED" if overall else "REJECTED"
    if cube is not None:
        receipt["decoded"] = {"cube_sha256": json_sha256(cube)}
    if blockers is not None:
        receipt["decoded"]["blockers"] = {
            str(source): center for source, center in sorted(blockers.items())
        }
    receipt["assignment"] = {
        "num_variables": n_variables,
        "num_assigned": len(assignment),
        "positive_count": len(positive),
    }
    if not overall:
        error = "one or more source-semantic replay gates failed"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    return receipt


def replay_exact12_model(
    repo_root: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
    model_path: Path,
    expected_piqd_job_id: str,
) -> dict[str, Any]:
    """Read the three public path inputs once and delegate to snapshot replay."""

    source_job_path = Path(source_job_path)
    discovery_cnf_path = Path(discovery_cnf_path)
    model_path = Path(model_path)
    return replay_exact12_model_snapshot(
        repo_root,
        source_job_path=source_job_path,
        source_job_bytes=_read_bytes(source_job_path, "source job"),
        discovery_cnf_path=discovery_cnf_path,
        discovery_cnf_bytes=_read_bytes(discovery_cnf_path, "discovery CNF"),
        model_path=model_path,
        model_bytes=_read_bytes(model_path, "piqd model"),
        expected_piqd_job_id=expected_piqd_job_id,
    )


def _open_receipt_parent(absolute: Path) -> int:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        parent_fd = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise Exact12PiqdReplayError(
            f"receipt parent contains a symlink or cannot be opened: {absolute.parent}"
        ) from exc
    try:
        for component in absolute.parts[1:-1]:
            try:
                next_fd = os.open(component, flags, dir_fd=parent_fd)
            except OSError as exc:
                raise Exact12PiqdReplayError(
                    f"receipt parent contains a symlink or cannot be opened: {absolute.parent}"
                ) from exc
            os.close(parent_fd)
            parent_fd = next_fd
    except BaseException:
        os.close(parent_fd)
        raise
    return parent_fd


def _open_receipt_temp(parent_fd: int, prefix: str) -> tuple[int, str]:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    for _ in range(128):
        name = f".{prefix}.{os.urandom(16).hex()}.tmp"
        try:
            return os.open(name, flags, 0o600, dir_fd=parent_fd), name
        except FileExistsError:
            continue
        except OSError as exc:
            raise Exact12PiqdReplayError(
                "cannot create temporary receipt in its parent directory"
            ) from exc
    raise Exact12PiqdReplayError("cannot create a unique temporary receipt")


def write_receipt(path: Path, receipt: Mapping[str, Any]) -> None:
    """Write a canonical receipt using descriptor-relative atomic replacement."""

    payload = canonical_json_bytes(dict(receipt)) + b"\n"
    absolute = Path(os.path.abspath(os.fspath(path)))
    parent_fd: int | None = None
    temporary: str | None = None
    try:
        parent_fd = _open_receipt_parent(absolute)
        try:
            target_stat = os.stat(
                absolute.name, dir_fd=parent_fd, follow_symlinks=False
            )
        except FileNotFoundError:
            target_stat = None
        except OSError as exc:
            raise Exact12PiqdReplayError(
                f"cannot inspect receipt target: {absolute}"
            ) from exc
        if target_stat is not None and stat.S_ISLNK(target_stat.st_mode):
            raise Exact12PiqdReplayError(f"receipt target is a symlink: {absolute}")

        fd, temporary = _open_receipt_temp(parent_fd, absolute.name or "receipt")
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(
            temporary,
            absolute.name,
            src_dir_fd=parent_fd,
            dst_dir_fd=parent_fd,
        )
        temporary = None
        os.fsync(parent_fd)
    except Exact12PiqdReplayError:
        raise
    except (OSError, ValueError) as exc:
        raise Exact12PiqdReplayError(f"cannot write receipt: {absolute}") from exc
    finally:
        if parent_fd is not None:
            if temporary is not None:
                try:
                    os.unlink(temporary, dir_fd=parent_fd)
                except FileNotFoundError:
                    pass
            os.close(parent_fd)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--source-job", type=Path, required=True)
    parser.add_argument("--discovery-cnf", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--expected-piqd-job-id", required=True)
    parser.add_argument("--receipt", type=Path)
    args = parser.parse_args(argv)
    try:
        receipt = replay_exact12_model(
            args.repo_root,
            args.source_job,
            args.discovery_cnf,
            args.model,
            args.expected_piqd_job_id,
        )
        code = 0
    except Exact12PiqdReplayError as exc:
        receipt = exc.receipt or {
            "schema": REPLAY_SCHEMA,
            "semantic_status": REPLAY_STATUS,
            "scope": REPLAY_SCOPE,
            "status": "REJECTED",
            "failure": str(exc),
        }
        code = 2
    if args.receipt is not None:
        write_receipt(args.receipt, receipt)
    else:
        sys.stdout.buffer.write(canonical_json_bytes(receipt) + b"\n")
    return code


if __name__ == "__main__":
    raise SystemExit(main())
