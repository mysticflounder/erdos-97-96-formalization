"""Replay and classify an authenticated exact-12 next-row successor wave.

This is a theorem-mining audit.  It treats selected supports as ``exact=False``
metric rows, replays every finite successor witness, and checks any detected
order-independent metric core with the independent certificate validator.
It does not prove all-cell UNSAT, a universal lift, or a Lean closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from collections import Counter
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from census.global_confinement import cap_selected_nogood_certificate_probe as certs
from census.global_confinement import metric_realizability_probe as metric

from .candidate_surface import build_model
from .exact12_next_row_cell_run import (
    RUN_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    _build_job,
    cnf_assignment_satisfies,
)
from .exact12_next_row_cell_run import SOURCE_PATHS as CELL_RUN_SOURCE_PATHS
from .exact12_next_row_valuation import (
    added_constraints_hold,
    cells,
    compile_cell,
    decode_blockers,
    decode_distinguished_d,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

POSTWAVE_SCHEMA = "p97_rigid221_exact12_next_row_postwave_theorem_search.v2"
GENERIC_OBSTRUCTION_FAMILY = (
    "Problem97.Census554.GeneralCarrierBridge.MetricCoreAlternative"
)
SOURCE_PATHS = (
    *CELL_RUN_SOURCE_PATHS,
    "census/card_head/exact12_next_row_postwave.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
)


class Exact12NextRowPostwaveError(ValueError):
    """The wave or a theorem-mining replay failed closed."""


MAX_ARTIFACT_BYTES = 64 * 1024 * 1024


def _absolute(path: Path) -> Path:
    return Path(os.path.realpath(os.fspath(path)))


def _reject_unexpected_symlink_components(path: Path, *, include_leaf: bool) -> None:
    """Permit macOS's /var alias but reject user-controlled link components."""

    raw = Path(os.path.abspath(os.fspath(path)))
    parts = raw.parts
    current = Path(parts[0])
    last = len(parts) - 1
    for index, component in enumerate(parts[1:], start=1):
        current /= component
        if index == last and not include_leaf:
            break
        try:
            metadata = current.lstat()
        except FileNotFoundError:
            break
        except OSError as exc:
            raise Exact12NextRowPostwaveError(
                f"cannot inspect path component: {current}"
            ) from exc
        if stat.S_ISLNK(metadata.st_mode) and current not in {
            Path("/var"),
            Path("/tmp"),
        }:
            raise Exact12NextRowPostwaveError(
                f"symlinked path component rejected: {current}"
            )


def _assert_directory(path: Path, *, private: bool = False) -> os.stat_result:
    """Open a directory componentwise, without following symlinks."""

    _reject_unexpected_symlink_components(path, include_leaf=True)
    native = _absolute(path)
    parts = native.parts
    if not parts or parts[0] != os.sep:
        raise Exact12NextRowPostwaveError(f"path is not absolute: {path}")
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        root_fd = os.open(os.sep, flags)
        current = root_fd
    except OSError as exc:
        raise Exact12NextRowPostwaveError(f"cannot open filesystem root: {path}") from exc
    try:
        for component in parts[1:]:
            if component in {"", ".", ".."}:
                raise Exact12NextRowPostwaveError(f"unsafe directory component: {path}")
            try:
                next_fd = os.open(component, flags, dir_fd=current)
            except OSError as exc:
                raise Exact12NextRowPostwaveError(
                    f"cannot traverse directory: {path}"
                ) from exc
            before = os.fstat(next_fd)
            if not stat.S_ISDIR(before.st_mode) or stat.S_ISLNK(before.st_mode):
                os.close(next_fd)
                raise Exact12NextRowPostwaveError(
                    f"symlinked or non-directory ancestor: {path}"
                )
            after = os.fstat(next_fd)
            if (before.st_dev, before.st_ino, before.st_nlink) != (
                after.st_dev,
                after.st_ino,
                after.st_nlink,
            ):
                os.close(next_fd)
                raise Exact12NextRowPostwaveError(
                    f"directory identity changed while opening: {path}"
                )
            if current != root_fd:
                os.close(current)
            current = next_fd
        result = os.fstat(current)
    finally:
        if current != root_fd:
            os.close(current)
        os.close(root_fd)
    if not stat.S_ISDIR(result.st_mode) or stat.S_ISLNK(result.st_mode):
        raise Exact12NextRowPostwaveError(f"path is not a directory: {path}")
    if private and stat.S_IMODE(result.st_mode) != 0o700:
        raise Exact12NextRowPostwaveError(
            f"mutable workdir must have exact mode 0700: {path}"
        )
    return result


def _reject_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _read_bytes(path: Path) -> bytes:
    """Read one immutable-looking regular file without following links."""

    _reject_unexpected_symlink_components(path, include_leaf=True)
    native = _absolute(path)
    parent = native.parent
    _assert_directory(parent)
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        fd = os.open(native, flags)
    except OSError as exc:
        raise Exact12NextRowPostwaveError(f"cannot open artifact: {path}") from exc
    try:
        before = os.fstat(fd)
        if stat.S_ISLNK(before.st_mode) or not stat.S_ISREG(before.st_mode):
            raise Exact12NextRowPostwaveError(f"artifact is not a regular file: {path}")
        if before.st_nlink != 1:
            raise Exact12NextRowPostwaveError(f"hard-linked artifact rejected: {path}")
        if stat.S_IMODE(before.st_mode) & 0o022:
            raise Exact12NextRowPostwaveError(
                f"artifact is mutable by group or other users: {path}"
            )
        if before.st_size > MAX_ARTIFACT_BYTES:
            raise Exact12NextRowPostwaveError(f"artifact is too large: {path}")
        chunks: list[bytes] = []
        total = 0
        while total <= MAX_ARTIFACT_BYTES:
            chunk = os.read(fd, min(1024 * 1024, MAX_ARTIFACT_BYTES + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        if total > MAX_ARTIFACT_BYTES:
            raise Exact12NextRowPostwaveError(f"artifact is too large: {path}")
        after = os.fstat(fd)
        if (before.st_dev, before.st_ino, before.st_nlink, before.st_size) != (
            after.st_dev,
            after.st_ino,
            after.st_nlink,
            after.st_size,
        ):
            raise Exact12NextRowPostwaveError(f"artifact changed while reading: {path}")
        if stat.S_IMODE(after.st_mode) & 0o022:
            raise Exact12NextRowPostwaveError(
                f"artifact became mutable by group or other users: {path}"
            )
        return b"".join(chunks)
    except OSError as exc:
        raise Exact12NextRowPostwaveError(f"cannot read artifact: {path}") from exc
    finally:
        os.close(fd)


def _path_exists(path: Path) -> bool:
    try:
        path.lstat()
    except FileNotFoundError:
        return False
    except OSError as exc:
        raise Exact12NextRowPostwaveError(f"cannot inspect artifact: {path}") from exc
    return True


def _read_json(path: Path) -> Any:
    try:
        return json.loads(
            _read_bytes(path).decode("utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12NextRowPostwaveError(f"invalid JSON artifact: {path}") from exc


def _json_bytes(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    digest.update(_read_bytes(path))
    return digest.hexdigest()


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_json_bytes(value)).hexdigest()


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(_json_bytes(value))
    temporary.replace(path)


def _mapping(value: Any, *, label: str) -> Mapping[str, Any]:
    if type(value) is not dict:
        raise Exact12NextRowPostwaveError(f"{label} must be a JSON object")
    return value


def _artifact_record(path: Path, *, filename: str) -> dict[str, Any]:
    raw = _read_bytes(path)
    return {"path": filename, "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()}


def _verify_artifact(
    cell_dir: Path,
    summary: Mapping[str, Any],
    *,
    key: str,
    filename: str,
    required: bool,
) -> Path | None:
    artifacts = _mapping(summary.get("artifacts"), label="artifacts")
    encoded = artifacts.get(key)
    path = cell_dir / filename
    if encoded is None:
        if required or _path_exists(path):
            raise Exact12NextRowPostwaveError(
                f"cell artifact {key} is missing or unreported"
            )
        return None
    if _mapping(encoded, label=f"artifact {key}").get("path") != filename:
        raise Exact12NextRowPostwaveError(f"cell artifact {key} path failed authentication")
    if encoded != _artifact_record(path, filename=filename):
        raise Exact12NextRowPostwaveError(f"cell artifact {key} failed authentication")
    return path


def _reconstruct_cell_job(
    repo_root: Path, cell_index: int
) -> tuple[dict[str, Any], bytes, SourceFaithfulCoverInstance, Any]:
    schedule = cells()
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, schedule[cell_index])
    cnf_bytes = instance.dimacs().encode("ascii")
    job = _build_job(repo_root, compiled, cnf_bytes)
    payload = {
        **job,
        "sources": _source_manifest(repo_root, paths=CELL_RUN_SOURCE_PATHS),
    }
    return {**payload, "job_id": _sha256_value(payload)}, cnf_bytes, instance, compiled


def _cube_from_assignment(
    instance: SourceFaithfulCoverInstance, positive_variables: list[int]
) -> dict[int, tuple[int, ...]]:
    positive = frozenset(positive_variables)
    cube: dict[int, tuple[int, ...]] = {}
    for center in range(12):
        selected = [
            tuple(row)
            for index, row in enumerate(instance.candidates[center])
            if instance.choice_variables[(center, index)] in positive
        ]
        if len(selected) != 1:
            raise Exact12NextRowPostwaveError(
                f"assignment selects {len(selected)} rows at center {center}"
            )
        cube[center] = selected[0]
    return cube


def _positive_assignment(model: Mapping[str, Any]) -> list[int]:
    value = model.get("positive_variables")
    if type(value) is not list or any(
        type(variable) is not int or variable <= 0 for variable in value
    ) or len(set(value)) != len(value):
        raise Exact12NextRowPostwaveError("model positive assignment is malformed")
    return value


def _source_manifest(
    repo_root: Path, *, paths: tuple[str, ...] = SOURCE_PATHS
) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for relative in paths:
        path = repo_root / relative
        try:
            metadata = path.lstat()
        except OSError as exc:
            raise Exact12NextRowPostwaveError(f"missing source: {relative}") from exc
        if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
            raise Exact12NextRowPostwaveError(f"source is not a regular file: {relative}")
        result.append(
            {
                "path": relative,
                "bytes": metadata.st_size,
                "sha256": _sha256_file(path),
            }
        )
    return result


def _decode_cube(value: Any, *, cell_index: int) -> dict[int, tuple[int, ...]]:
    encoded = _mapping(value, label=f"cell {cell_index} cube")
    if set(encoded) != {str(center) for center in range(12)}:
        raise Exact12NextRowPostwaveError(
            f"cell {cell_index} cube does not contain centers 0..11"
        )
    cube: dict[int, tuple[int, ...]] = {}
    for center in range(12):
        row = encoded[str(center)]
        if type(row) is not list or len(row) != 4:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} center {center} is not a four-point support"
            )
        if any(type(point) is not int or not 0 <= point < 12 for point in row):
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} center {center} has an invalid label"
            )
        if len(set(row)) != 4:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} center {center} repeats a label"
            )
        cube[center] = tuple(row)
    return cube


def _decode_blockers(value: Any, *, cell_index: int) -> dict[int, int]:
    encoded = _mapping(value, label=f"cell {cell_index} blockers")
    blockers: dict[int, int] = {}
    for source, center in encoded.items():
        try:
            source_index = int(source)
        except ValueError as exc:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} has a non-integer blocker source"
            ) from exc
        if str(source_index) != source or type(center) is not int:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} has malformed blocker data"
            )
        blockers[source_index] = center
    return blockers


def analyze_wave(repo_root: Path, wave_dir: Path) -> dict[str, Any]:
    """Authenticate and classify all twelve placement-cell SAT witnesses."""

    _assert_directory(wave_dir, private=True)
    records: list[dict[str, Any]] = []
    stage_counts: Counter[str] = Counter()
    arm_counts: Counter[str] = Counter()
    d_counts: Counter[int] = Counter()
    schedule = cells()
    if len(schedule) != 12:
        raise Exact12NextRowPostwaveError("placement schedule is not twelve cells")

    for cell_index, cell in enumerate(schedule):
        cell_dir = wave_dir / f"cell-{cell_index}"
        _assert_directory(cell_dir, private=True)
        summary_path = cell_dir / "summary.json"
        summary = _mapping(_read_json(summary_path), label="summary")
        if summary.get("schema") != RUN_SCHEMA:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} has the wrong runner schema"
            )
        if summary.get("cell_index") != cell_index:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} summary index mismatch"
            )
        if summary.get("status") != "SAT_WITNESS_REPLAYED":
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} is not a fully replayed SAT witness"
            )
        job_path = _verify_artifact(
            cell_dir, summary, key="job", filename="job.json", required=True
        )
        discovery_cnf_path = _verify_artifact(
            cell_dir,
            summary,
            key="discovery_cnf",
            filename="discovery.cnf",
            required=True,
        )
        model_path = _verify_artifact(
            cell_dir, summary, key="model", filename="model.json", required=True
        )
        assert job_path is not None and discovery_cnf_path is not None
        assert model_path is not None
        job_bytes = _read_bytes(job_path)
        job = _mapping(_read_json(job_path), label="job")
        reconstructed_job, cnf_bytes, instance, compiled = _reconstruct_cell_job(
            repo_root, cell_index
        )
        if job != reconstructed_job:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} job is not bound to the current source manifest"
            )
        if (
            job_bytes != _json_bytes(reconstructed_job)
            or
            summary.get("job_id") != reconstructed_job["job_id"]
            or summary.get("job_sha256") != _sha256_value(reconstructed_job)
            or _read_bytes(discovery_cnf_path) != cnf_bytes
        ):
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} job or exact CNF bytes failed authentication"
            )
        model = _mapping(_read_json(model_path), label="model")
        if model.get("cell_index") != cell_index:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} model index mismatch"
            )

        positive = _positive_assignment(model)
        if not cnf_assignment_satisfies(
            instance.cnf.clauses,
            positive,
            n_variables=instance.cnf.n_variables,
        ):
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} positive assignment does not satisfy reconstructed CNF"
            )
        assigned_cube = _cube_from_assignment(instance, positive)
        cube = _decode_cube(model.get("cube"), cell_index=cell_index)
        if cube != assigned_cube:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} cube is not bound to positive assignment"
            )
        blockers = _decode_blockers(model.get("blockers"), cell_index=cell_index)
        assigned_blockers = decode_blockers(positive, compiled.blocker_variables)
        if blockers != assigned_blockers:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} blockers are not bound to positive assignment"
            )
        d = model.get("distinguished_d")
        assigned_d = decode_distinguished_d(positive, compiled.distinguished_d_variables)
        if d != assigned_d:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} distinguished d is not bound to positive assignment"
            )
        if type(d) is not int or not added_constraints_hold(cell, cube, blockers, d):
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} successor predicate did not replay"
            )

        metric_rows = tuple(
            metric.MetricRow(center, support, False)
            for center, support in sorted(cube.items())
        )
        detection = metric._formalized_metric_core(
            metric_rows,
            12,
            (),
            include_extended=True,
            include_ordered=False,
        )
        if detection is None:
            certificate = None
            stage = "none"
            consumer = None
        else:
            if (
                type(detection) is not dict
                or set(detection) != {"stage", "core"}
                or type(detection["stage"]) is not str
                or type(detection["core"]) is not dict
            ):
                raise Exact12NextRowPostwaveError(
                    f"cell {cell_index} returned malformed detector data"
                )
            certificate = certs._certificate_for_detection(metric_rows, 12, detection)
            if certs._validate_certificate(certificate, n=12) is not True:
                raise Exact12NextRowPostwaveError(
                    f"cell {cell_index} detector certificate failed replay"
                )
            stage = detection["stage"]
            consumer = None

        five_centers = {
            blockers[9],
            blockers[cell.joint_deletion],
            1,
            blockers[cell.v],
            d,
        }
        five_distinct = len(five_centers) == 5
        reciprocal = d == blockers[9] and 7 in cube[blockers[9]]
        arm = "five_distinct" if five_distinct else "reciprocal_collision"
        if five_distinct == reciprocal:
            raise Exact12NextRowPostwaveError(
                f"cell {cell_index} does not select exactly one dichotomy arm"
            )

        stage_counts[stage] += 1
        arm_counts[arm] += 1
        d_counts[d] += 1
        records.append(
            {
                "cell_index": cell_index,
                "job_id": summary.get("job_id"),
                "summary_sha256": _sha256_file(summary_path),
                "model_sha256": _sha256_file(model_path),
                "distinguished_d": d,
                "dichotomy_arm": arm,
                "detection": detection,
                "certificate": certificate,
                "certificate_sha256": (
                    _sha256_value(certificate) if certificate is not None else None
                ),
                "certificate_replayed": certificate is not None,
                "general_lean_consumer": consumer,
                "general_lean_obstruction_family": (
                    GENERIC_OBSTRUCTION_FAMILY if certificate is not None else None
                ),
            }
        )

    return {
        "schema": POSTWAVE_SCHEMA,
        "status": "AUTHENTICATED_THEOREM_SEARCH_COMPLETE",
        "scope": (
            "twelve finite next-row-only-hit SAT witnesses; selected supports "
            "are exact=False metric rows; no UNSAT, universal lift, or Lean closure"
        ),
        "wave_dir": str(wave_dir.relative_to(repo_root)),
        "source_manifest": _source_manifest(repo_root),
        "aggregate": {
            "cells": len(records),
            "stage_counts": dict(sorted(stage_counts.items())),
            "dichotomy_arm_counts": dict(sorted(arm_counts.items())),
            "distinguished_d_counts": {
                str(key): value for key, value in sorted(d_counts.items())
            },
            "certificates_replayed": sum(
                record["certificate_replayed"] for record in records
            ),
        },
        "records": records,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--wave-dir", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    repo_root = args.repo_root.resolve()
    wave_dir = args.wave_dir.resolve()
    output = args.output.resolve()
    try:
        result = analyze_wave(repo_root, wave_dir)
        _write_json(output, result)
    except (Exact12NextRowPostwaveError, OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(result["aggregate"], sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
