#!/usr/bin/env python3
# ruff: noqa: EXE001
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Create, verify, and scan B1 alternate-executor theorem-mine receipts.

The receipt is deliberately a bookkeeping and custody object.  It proves neither
the mathematical observations it records nor the completeness of a semantic
search.  All referenced wave evidence is digest checked and confined to the
declared wave root.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import sys
from collections.abc import Mapping, Sequence
from datetime import UTC, datetime
from pathlib import Path, PurePosixPath
from typing import Any, NoReturn

SCHEMA = "p97-b1-postwave-theorem-mine/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
SCOPE = "CURRENT_WAVE_ONLY"
RECEIPT_NAME = "postwave_theorem_mine.json"
PROJECT_CORPUS = "erdos-97-96-formalization-lean"
CROSS_PROJECT_CORPUS = "ALL_CONFIGURED_LEAN_CORPORA"
PROJECT_SEARCH_TOOL = "PROOF_BLUEPRINT_SEARCH"
CROSS_PROJECT_SEARCH_TOOL = "NTHDEGREE_DOCS_SEARCH"

MAX_JSON_BYTES = 16 * 1024 * 1024
READ_CHUNK_BYTES = 1024 * 1024

TERMINAL_VERDICTS = frozenset(
    {
        "SAT",
        "UNSAT",
        "UNKNOWN",
        "TIMEOUT",
        "BUDGET_EXHAUSTED",
        "ENUMERATION_COMPLETE",
        "ALGEBRA_COMPLETE",
    }
)
ARTIFACT_ROLES = frozenset(
    {
        "TERMINAL_EVIDENCE",
        "MINE_INPUT",
        "PROJECT_SEARCH_RESULT",
        "CROSS_PROJECT_SEARCH_RESULT",
        "OTHER_WAVE_DATA",
    }
)
GATE_EFFECTS = {
    "HISTORICAL_BACKFILL_NON_AUTHORIZING": ("NON_AUTHORIZING_HISTORICAL_RECORD"),
    "CURRENT_GATE": "SATISFIES_CURRENT_POSTWAVE_MINE_ONLY",
}

_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")
_SHA256 = re.compile(r"^[0-9a-f]{64}$")
_COMMIT = re.compile(r"^[0-9a-f]{40}$")
_UTC = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$")

_TOP_LEVEL_KEYS = {
    "schema",
    "created_utc",
    "campaign_id",
    "wave",
    "scope",
    "gate",
    "wave_artifacts",
    "terminal",
    "observations",
    "outcome",
    "immediate_consumer",
    "claim_boundary",
    "trust_boundary",
}
_RUN_MANIFEST_KEYS = {
    "schema",
    "lane_id",
    "run_id",
    "root",
    "owner",
    "base_head",
    "output_classes",
    "source_digests",
    "input_digests",
    "created_utc",
    "manifest_sha256",
}


class TheoremMineError(ValueError):
    """Raised when theorem-mine custody or schema validation fails."""


def _fail(message: str) -> NoReturn:
    raise TheoremMineError(message)


def _required_open_flag(name: str) -> int:
    flag = getattr(os, name, None)
    if type(flag) is not int or flag == 0:
        _fail(f"platform lacks required open flag {name}")
    return flag


def _best_effort_close(fd: int | None) -> None:
    if fd is None:
        return
    try:
        os.close(fd)
    except Exception:  # noqa: BLE001 - cleanup must not mask custody failures
        return


def canonical_json_bytes(value: Any) -> bytes:
    """Return the repository's deterministic compact JSON encoding."""

    try:
        return json.dumps(
            value,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise TheoremMineError("value is not canonical-JSON encodable") from exc


def _reject_constant(value: str) -> NoReturn:
    _fail(f"non-finite JSON constant is forbidden: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _parse_json(raw: bytes, *, label: str) -> dict[str, Any]:
    if len(raw) > MAX_JSON_BYTES:
        _fail(f"{label} exceeds the JSON size bound")
    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise TheoremMineError(f"{label} is not strict UTF-8 JSON") from exc
    if type(value) is not dict:
        _fail(f"{label} must be a JSON object")
    return value


def _exact_keys(value: Mapping[str, Any], expected: set[str], *, label: str) -> None:
    actual = set(value)
    missing = expected - actual
    extra = actual - expected
    if missing or extra:
        _fail(f"{label} keys differ: missing={sorted(missing)}, extra={sorted(extra)}")


def _string(value: Any, *, label: str, maximum: int = 16_384) -> str:
    if type(value) is not str or not value.strip() or len(value) > maximum:
        _fail(f"{label} must be a nonempty string of at most {maximum} characters")
    return value


def _identifier(value: Any, *, label: str) -> str:
    text = _string(value, label=label, maximum=128)
    if _ID.fullmatch(text) is None:
        _fail(f"{label} has an unsafe identifier form")
    return text


def _sha256(value: Any, *, label: str) -> str:
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail(f"{label} must be a lowercase SHA-256 digest")
    return value


def _commit(value: Any, *, label: str) -> str:
    if type(value) is not str or _COMMIT.fullmatch(value) is None:
        _fail(f"{label} must be a lowercase 40-hex commit")
    return value


def _created_utc(value: Any, *, label: str) -> str:
    text = _string(value, label=label, maximum=20)
    if _UTC.fullmatch(text) is None:
        _fail(f"{label} must use second-resolution UTC form YYYY-MM-DDTHH:MM:SSZ")
    try:
        parsed = datetime.fromisoformat(text.removesuffix("Z") + "+00:00")
    except ValueError as exc:
        raise TheoremMineError(f"{label} is not a valid UTC timestamp") from exc
    if parsed.utcoffset() != UTC.utcoffset(parsed):
        _fail(f"{label} must use UTC")
    return text


def _relative_path(value: Any, *, label: str) -> PurePosixPath:
    text = _string(value, label=label, maximum=4096)
    if "\\" in text or "\x00" in text:
        _fail(f"{label} is not a normalized repository-relative path")
    path = PurePosixPath(text)
    if (
        path.is_absolute()
        or path.as_posix() != text
        or not path.parts
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        _fail(f"{label} is not a normalized repository-relative path")
    return path


def _repo_root(path: Path) -> Path:
    try:
        root = path.resolve(strict=True)
    except OSError as exc:
        raise TheoremMineError(f"repository root cannot be resolved: {path}") from exc
    if not root.is_dir():
        _fail(f"repository root is not a directory: {path}")
    return root


def _open_directory(root: Path, relative: PurePosixPath) -> int:
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0)
    directory_flags = (
        flags | _required_open_flag("O_DIRECTORY") | _required_open_flag("O_NOFOLLOW")
    )
    current = os.open(root, directory_flags)
    try:
        for component in relative.parts:
            try:
                next_fd = os.open(component, directory_flags, dir_fd=current)
            except OSError as exc:
                raise TheoremMineError(
                    f"cannot open non-symlink directory: {relative.as_posix()}"
                ) from exc
            info = os.fstat(next_fd)
            if not stat.S_ISDIR(info.st_mode):
                os.close(next_fd)
                _fail(f"path ancestor is not a directory: {relative.as_posix()}")
            _best_effort_close(current)
            current = next_fd
        return current
    except Exception:
        _best_effort_close(current)
        raise


def _open_regular(root: Path, relative: PurePosixPath) -> int:
    parent = PurePosixPath(*relative.parts[:-1])
    parent_fd = _open_directory(root, parent)
    flags = (
        os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | _required_open_flag("O_NOFOLLOW")
    )
    try:
        try:
            fd = os.open(relative.name, flags, dir_fd=parent_fd)
        except OSError as exc:
            raise TheoremMineError(
                f"cannot open repository-relative regular file: {relative.as_posix()}"
            ) from exc
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode):
            _best_effort_close(fd)
            _fail(f"path is not a regular file: {relative.as_posix()}")
        if info.st_nlink != 1:
            _best_effort_close(fd)
            _fail(f"path must have exactly one hard link: {relative.as_posix()}")
        return fd
    finally:
        _best_effort_close(parent_fd)


def _file_snapshot(info: os.stat_result) -> tuple[int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _require_path_still_names(
    root: Path,
    relative: PurePosixPath,
    expected: os.stat_result,
    *,
    action: str,
) -> None:
    current_fd = _open_regular(root, relative)
    try:
        current = os.fstat(current_fd)
    finally:
        _best_effort_close(current_fd)
    if (current.st_dev, current.st_ino) != (expected.st_dev, expected.st_ino):
        _fail(f"file pathname changed after it was {action}: {relative.as_posix()}")
    if _file_snapshot(current) != _file_snapshot(expected):
        _fail(f"file changed after it was {action}: {relative.as_posix()}")


def _read_regular(root: Path, relative: PurePosixPath, *, maximum: int) -> bytes:
    fd = _open_regular(root, relative)
    try:
        before = os.fstat(fd)
        if before.st_size > maximum:
            _fail(f"file exceeds size bound: {relative.as_posix()}")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(fd, min(READ_CHUNK_BYTES, maximum - total + 1))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > maximum:
                _fail(f"file exceeds size bound: {relative.as_posix()}")
        after = os.fstat(fd)
        if _file_snapshot(before) != _file_snapshot(after):
            _fail(f"file changed while it was read: {relative.as_posix()}")
        _require_path_still_names(root, relative, after, action="read")
        return b"".join(chunks)
    finally:
        _best_effort_close(fd)


def _hash_regular(root: Path, relative: PurePosixPath) -> str:
    fd = _open_regular(root, relative)
    digest = hashlib.sha256()
    try:
        before = os.fstat(fd)
        while True:
            chunk = os.read(fd, READ_CHUNK_BYTES)
            if not chunk:
                break
            digest.update(chunk)
        after = os.fstat(fd)
        if _file_snapshot(before) != _file_snapshot(after):
            _fail(f"file changed while it was hashed: {relative.as_posix()}")
        _require_path_still_names(root, relative, after, action="hashed")
        return digest.hexdigest()
    finally:
        _best_effort_close(fd)


def _is_under(path: PurePosixPath, root: PurePosixPath) -> bool:
    return (
        len(path.parts) > len(root.parts)
        and path.parts[: len(root.parts)] == root.parts
    )


def _digest_map(value: Any, *, root: Path, label: str) -> None:
    if type(value) is not dict or not value:
        _fail(f"{label} must be a nonempty JSON object")
    for raw_path, raw_digest in value.items():
        path = _relative_path(raw_path, label=f"{label} path")
        digest = _sha256(raw_digest, label=f"{label}[{raw_path}]")
        if _hash_regular(root, path) != digest:
            _fail(f"{label} digest mismatch: {path.as_posix()}")


def _manifest_self_hash(value: Mapping[str, Any]) -> str:
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return hashlib.sha256(canonical_json_bytes(unsigned)).hexdigest()


def _validate_run_manifest(
    value: Any,
    *,
    root: Path,
    campaign_id: str,
    run_id: str,
    wave_root: PurePosixPath,
    reference_sha256: str,
    reference_manifest_sha256: str,
) -> None:
    if type(value) is not dict:
        _fail("run manifest must be a JSON object")
    _exact_keys(value, _RUN_MANIFEST_KEYS, label="run manifest")
    if value["schema"] != RUN_MANIFEST_SCHEMA:
        _fail(f"run manifest schema must be {RUN_MANIFEST_SCHEMA}")
    if value["lane_id"] != campaign_id:
        _fail("run manifest lane_id does not match campaign_id")
    if value["run_id"] != run_id:
        _fail("run manifest run_id does not match wave.run_id")
    if value["root"] != wave_root.as_posix():
        _fail("run manifest root does not match wave.root")
    if value["base_head"] is None:
        _fail("run manifest base_head is missing")
    _commit(value["base_head"], label="run manifest base_head")
    _created_utc(value["created_utc"], label="run manifest created_utc")
    _identifier(value["owner"], label="run manifest owner")
    if value["output_classes"] != ["artifacts", "events", "tmp"]:
        _fail("run manifest output_classes differ from governed policy")
    internal = _sha256(value["manifest_sha256"], label="run manifest self hash")
    if internal != reference_manifest_sha256:
        _fail("run manifest self hash differs from receipt reference")
    if internal != _manifest_self_hash(value):
        _fail("run manifest manifest_sha256 mismatch")
    _digest_map(value["source_digests"], root=root, label="run manifest source_digests")
    _digest_map(value["input_digests"], root=root, label="run manifest input_digests")
    if (
        reference_sha256
        != hashlib.sha256(
            _read_regular(
                root,
                wave_root / "run_manifest.json",
                maximum=MAX_JSON_BYTES,
            )
        ).hexdigest()
    ):
        _fail("run manifest file digest mismatch")


def _artifact_reference(
    value: Any,
    *,
    root: Path,
    wave_root: PurePosixPath,
    seen_ids: set[str],
) -> tuple[str, str]:
    if type(value) is not dict:
        _fail("wave artifact must be a JSON object")
    _exact_keys(
        value,
        {"artifact_id", "role", "path", "sha256"},
        label="wave artifact",
    )
    artifact_id = _identifier(value["artifact_id"], label="artifact_id")
    if artifact_id in seen_ids:
        _fail(f"duplicate artifact_id: {artifact_id}")
    seen_ids.add(artifact_id)
    role = _string(value["role"], label=f"artifact {artifact_id} role", maximum=64)
    if role not in ARTIFACT_ROLES:
        _fail(f"artifact {artifact_id} has an unsupported role")
    path = _relative_path(value["path"], label=f"artifact {artifact_id} path")
    if not _is_under(path, wave_root):
        _fail(f"artifact {artifact_id} is outside the named wave root")
    if path == wave_root / "run_manifest.json":
        _fail("wave run manifest cannot be listed as a wave artifact")
    digest = _sha256(value["sha256"], label=f"artifact {artifact_id} sha256")
    if _hash_regular(root, path) != digest:
        _fail(f"artifact digest mismatch: {path.as_posix()}")
    return artifact_id, role


def _artifact_ids(value: Any, *, label: str, known: Mapping[str, str]) -> list[str]:
    if type(value) is not list or not value:
        _fail(f"{label} must be a nonempty JSON list")
    result: list[str] = []
    for index, raw in enumerate(value):
        artifact_id = _identifier(raw, label=f"{label}[{index}]")
        if artifact_id not in known:
            _fail(f"{label} references unknown artifact_id: {artifact_id}")
        result.append(artifact_id)
    if len(result) != len(set(result)):
        _fail(f"{label} contains duplicate artifact ids")
    return result


def _search_record(
    value: Any,
    *,
    label: str,
    scope: str,
    tool: str,
    corpus: str,
    evidence_role: str,
    artifacts: Mapping[str, str],
) -> str:
    if type(value) is not dict:
        _fail(f"{label} must be a JSON object")
    _exact_keys(
        value,
        {
            "scope",
            "tool",
            "query",
            "corpus",
            "corpus_revision",
            "result_summary",
            "first_missing_antecedent_or_circularity",
            "evidence",
        },
        label=label,
    )
    if value["scope"] != scope:
        _fail(f"{label}.scope must be {scope}")
    if value["tool"] != tool:
        _fail(f"{label}.tool must be {tool}")
    if value["corpus"] != corpus:
        _fail(f"{label}.corpus must be {corpus}")
    _string(value["query"], label=f"{label}.query")
    _string(value["corpus_revision"], label=f"{label}.corpus_revision")
    _string(value["result_summary"], label=f"{label}.result_summary")
    _string(
        value["first_missing_antecedent_or_circularity"],
        label=f"{label}.first_missing_antecedent_or_circularity",
    )
    evidence = _identifier(value["evidence"], label=f"{label}.evidence")
    if artifacts.get(evidence) != evidence_role:
        _fail(f"{label}.evidence must name a {evidence_role} artifact")
    return evidence


def _claim_boundary(value: Any) -> None:
    if type(value) is not dict:
        _fail("claim_boundary must be a JSON object")
    _exact_keys(
        value,
        {"rigor", "establishes", "does_not_establish"},
        label="claim_boundary",
    )
    if value["rigor"] != "EMPIRICALLY_VERIFIED":
        _fail("claim_boundary.rigor must be EMPIRICALLY_VERIFIED")
    _string(value["establishes"], label="claim_boundary.establishes")
    _string(value["does_not_establish"], label="claim_boundary.does_not_establish")


def _trust_boundary(value: Any) -> None:
    if type(value) is not dict:
        _fail("trust_boundary must be a JSON object")
    _exact_keys(
        value,
        {"solver_evidence", "semantic_review", "statement"},
        label="trust_boundary",
    )
    if value["solver_evidence"] != "EXTERNAL_DIAGNOSTIC":
        _fail("trust_boundary.solver_evidence must be EXTERNAL_DIAGNOSTIC")
    if value["semantic_review"] != "HUMAN_ATTESTED":
        _fail("trust_boundary.semantic_review must be HUMAN_ATTESTED")
    _string(value["statement"], label="trust_boundary.statement")


def _validate_unsigned(value: Mapping[str, Any], *, repo_root: Path) -> dict[str, Any]:
    _exact_keys(value, _TOP_LEVEL_KEYS, label="theorem-mine input")
    if value["schema"] != SCHEMA:
        _fail(f"schema must be {SCHEMA}")
    _created_utc(value["created_utc"], label="created_utc")
    campaign_id = _identifier(value["campaign_id"], label="campaign_id")
    if value["scope"] != SCOPE:
        _fail(f"scope must be {SCOPE}")

    wave = value["wave"]
    if type(wave) is not dict:
        _fail("wave must be a JSON object")
    _exact_keys(
        wave,
        {"run_id", "root", "base_head", "run_manifest"},
        label="wave",
    )
    run_id = _identifier(wave["run_id"], label="wave.run_id")
    wave_root = _relative_path(wave["root"], label="wave.root")
    expected_root = PurePosixPath("scratch", "runs", campaign_id, run_id)
    if wave_root != expected_root:
        _fail("wave.root must be scratch/runs/<campaign_id>/<run_id>")
    base_head = _commit(wave["base_head"], label="wave.base_head")

    manifest_ref = wave["run_manifest"]
    if type(manifest_ref) is not dict:
        _fail("wave.run_manifest must be a JSON object")
    _exact_keys(
        manifest_ref,
        {"path", "sha256", "manifest_sha256"},
        label="wave.run_manifest",
    )
    manifest_path = _relative_path(manifest_ref["path"], label="wave.run_manifest.path")
    if manifest_path != wave_root / "run_manifest.json":
        _fail("wave.run_manifest.path must name the wave root run_manifest.json")
    manifest_file_sha256 = _sha256(
        manifest_ref["sha256"], label="wave.run_manifest.sha256"
    )
    manifest_self_sha256 = _sha256(
        manifest_ref["manifest_sha256"],
        label="wave.run_manifest.manifest_sha256",
    )
    manifest_raw = _read_regular(repo_root, manifest_path, maximum=MAX_JSON_BYTES)
    if hashlib.sha256(manifest_raw).hexdigest() != manifest_file_sha256:
        _fail("run manifest file digest mismatch")
    manifest = _parse_json(manifest_raw, label="run manifest")
    if manifest.get("base_head") != base_head:
        _fail("run manifest base_head does not match wave.base_head")
    _validate_run_manifest(
        manifest,
        root=repo_root,
        campaign_id=campaign_id,
        run_id=run_id,
        wave_root=wave_root,
        reference_sha256=manifest_file_sha256,
        reference_manifest_sha256=manifest_self_sha256,
    )

    gate = value["gate"]
    if type(gate) is not dict:
        _fail("gate must be a JSON object")
    _exact_keys(gate, {"status", "effect"}, label="gate")
    status_value = _string(gate["status"], label="gate.status", maximum=64)
    if status_value not in GATE_EFFECTS:
        _fail("gate.status is unsupported")
    if gate["effect"] != GATE_EFFECTS[status_value]:
        _fail("gate.effect does not match gate.status")

    raw_artifacts = value["wave_artifacts"]
    if type(raw_artifacts) is not list or not raw_artifacts:
        _fail("wave_artifacts must be a nonempty JSON list")
    seen_ids: set[str] = set()
    artifacts: dict[str, str] = {}
    for raw_artifact in raw_artifacts:
        artifact_id, role = _artifact_reference(
            raw_artifact,
            root=repo_root,
            wave_root=wave_root,
            seen_ids=seen_ids,
        )
        artifacts[artifact_id] = role

    terminal = value["terminal"]
    if type(terminal) is not dict:
        _fail("terminal must be a JSON object")
    _exact_keys(
        terminal,
        {"executor", "verdict", "summary", "evidence"},
        label="terminal",
    )
    _string(terminal["executor"], label="terminal.executor", maximum=128)
    verdict = _string(terminal["verdict"], label="terminal.verdict", maximum=64)
    if verdict not in TERMINAL_VERDICTS:
        _fail("terminal.verdict is unsupported")
    _string(terminal["summary"], label="terminal.summary")
    used_artifacts = set(
        _artifact_ids(terminal["evidence"], label="terminal.evidence", known=artifacts)
    )
    if any(artifacts[item] != "TERMINAL_EVIDENCE" for item in used_artifacts):
        _fail("terminal.evidence must name only TERMINAL_EVIDENCE artifacts")

    observations = value["observations"]
    if type(observations) is not list or not observations:
        _fail("observations must be a nonempty JSON list")
    observation_ids: set[str] = set()
    for index, observation in enumerate(observations):
        if type(observation) is not dict:
            _fail(f"observations[{index}] must be a JSON object")
        _exact_keys(
            observation,
            {"observation_id", "statement", "evidence"},
            label=f"observations[{index}]",
        )
        observation_id = _identifier(
            observation["observation_id"],
            label=f"observations[{index}].observation_id",
        )
        if observation_id in observation_ids:
            _fail(f"duplicate observation_id: {observation_id}")
        observation_ids.add(observation_id)
        _string(observation["statement"], label=f"observations[{index}].statement")
        used_artifacts.update(
            _artifact_ids(
                observation["evidence"],
                label=f"observations[{index}].evidence",
                known=artifacts,
            )
        )

    outcome = value["outcome"]
    if type(outcome) is not dict:
        _fail("outcome must be a JSON object")
    _exact_keys(outcome, {"kind", "rationale", "candidates"}, label="outcome")
    kind = _string(outcome["kind"], label="outcome.kind", maximum=32)
    _string(outcome["rationale"], label="outcome.rationale")
    candidates = outcome["candidates"]
    if type(candidates) is not list:
        _fail("outcome.candidates must be a JSON list")
    if kind == "NO_NEW_PATTERN":
        if candidates:
            _fail("NO_NEW_PATTERN requires an empty candidate list")
    elif kind == "CANDIDATES":
        if not candidates:
            _fail("CANDIDATES requires at least one concrete candidate")
    else:
        _fail("outcome.kind must be NO_NEW_PATTERN or CANDIDATES")

    candidate_ids: set[str] = set()
    for index, candidate in enumerate(candidates):
        label = f"outcome.candidates[{index}]"
        if type(candidate) is not dict:
            _fail(f"{label} must be a JSON object")
        _exact_keys(
            candidate,
            {
                "candidate_id",
                "statement",
                "immediate_consumer",
                "claim_boundary",
                "trust_boundary",
                "project_search",
                "cross_project_search",
            },
            label=label,
        )
        candidate_id = _identifier(
            candidate["candidate_id"], label=f"{label}.candidate_id"
        )
        if candidate_id in candidate_ids:
            _fail(f"duplicate candidate_id: {candidate_id}")
        candidate_ids.add(candidate_id)
        _string(candidate["statement"], label=f"{label}.statement")
        _string(
            candidate["immediate_consumer"],
            label=f"{label}.immediate_consumer",
        )
        _string(candidate["claim_boundary"], label=f"{label}.claim_boundary")
        _string(candidate["trust_boundary"], label=f"{label}.trust_boundary")
        used_artifacts.add(
            _search_record(
                candidate["project_search"],
                label=f"{label}.project_search",
                scope="PROJECT",
                tool=PROJECT_SEARCH_TOOL,
                corpus=PROJECT_CORPUS,
                evidence_role="PROJECT_SEARCH_RESULT",
                artifacts=artifacts,
            )
        )
        used_artifacts.add(
            _search_record(
                candidate["cross_project_search"],
                label=f"{label}.cross_project_search",
                scope="CROSS_PROJECT",
                tool=CROSS_PROJECT_SEARCH_TOOL,
                corpus=CROSS_PROJECT_CORPUS,
                evidence_role="CROSS_PROJECT_SEARCH_RESULT",
                artifacts=artifacts,
            )
        )

    _string(value["immediate_consumer"], label="immediate_consumer")
    _claim_boundary(value["claim_boundary"])
    _trust_boundary(value["trust_boundary"])
    unused = set(artifacts) - used_artifacts
    if unused:
        _fail(f"wave_artifacts contains unreferenced artifacts: {sorted(unused)}")
    return dict(value)


def receipt_self_hash(unsigned: Mapping[str, Any]) -> str:
    """Hash the canonical unsigned receipt body, including its newline."""

    return hashlib.sha256(canonical_json_bytes(unsigned) + b"\n").hexdigest()


def build_receipt(unsigned: Mapping[str, Any], *, repo_root: Path) -> dict[str, Any]:
    """Validate a declarative one-wave input and add its self hash."""

    root = _repo_root(repo_root)
    normalized = _validate_unsigned(unsigned, repo_root=root)
    return {**normalized, "receipt_sha256": receipt_self_hash(normalized)}


def _expected_receipt_path(receipt: Mapping[str, Any]) -> PurePosixPath:
    wave = receipt.get("wave")
    if type(wave) is not dict:
        _fail("receipt wave is missing")
    wave_root = _relative_path(wave.get("root"), label="wave.root")
    return wave_root / "artifacts" / RECEIPT_NAME


def _invalidate_created_receipt(
    root: Path,
    relative: PurePosixPath,
    owned_identity: tuple[int, int],
) -> None:
    """Truncate the still-owned canonical path without moving or replacing it."""

    parent_fd = _open_directory(root, PurePosixPath(*relative.parts[:-1]))
    flags = (
        os.O_WRONLY | getattr(os, "O_CLOEXEC", 0) | _required_open_flag("O_NOFOLLOW")
    )
    fd: int | None = None
    try:
        try:
            fd = os.open(relative.name, flags, dir_fd=parent_fd)
        except OSError as exc:
            raise TheoremMineError(
                f"cannot reopen retained receipt for invalidation: {relative.as_posix()}"
            ) from exc
        opened = os.fstat(fd)
        if not stat.S_ISREG(opened.st_mode):
            _fail("retained receipt is no longer a regular file")
        if opened.st_nlink != 1:
            _fail("retained receipt no longer has single-link custody")
        if (opened.st_dev, opened.st_ino) != owned_identity:
            _fail("retained receipt path no longer names the created inode")
        os.ftruncate(fd, 0)
        truncated = os.fstat(fd)
        if (
            (truncated.st_dev, truncated.st_ino) != owned_identity
            or truncated.st_nlink != 1
            or truncated.st_size != 0
        ):
            _fail("retained receipt inode was not structurally invalidated")
        current = os.stat(relative.name, dir_fd=parent_fd, follow_symlinks=False)
        if (
            (current.st_dev, current.st_ino) != owned_identity
            or current.st_nlink != 1
            or current.st_size != 0
        ):
            _fail("retained receipt path was not structurally invalidated")
    finally:
        _best_effort_close(fd)
        _best_effort_close(parent_fd)


def _create_regular_exclusive(
    root: Path, relative: PurePosixPath, payload: bytes
) -> None:
    parent_fd = _open_directory(root, PurePosixPath(*relative.parts[:-1]))
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | _required_open_flag("O_NOFOLLOW")
    )
    fd: int | None = None
    created = False
    owned_identity: tuple[int, int] | None = None
    failure: BaseException | None = None

    try:
        try:
            fd = os.open(relative.name, flags, 0o644, dir_fd=parent_fd)
            created = True
        except FileExistsError as exc:
            raise TheoremMineError(
                f"refusing to overwrite existing receipt: {relative.as_posix()}"
            ) from exc
        except OSError as exc:
            raise TheoremMineError(
                f"cannot exclusively create receipt: {relative.as_posix()}"
            ) from exc
        opened = os.fstat(fd)
        if not stat.S_ISREG(opened.st_mode) or opened.st_nlink != 1:
            _fail("new receipt does not have single-link regular-file custody")
        owned_identity = (opened.st_dev, opened.st_ino)
        view = memoryview(payload)
        written = 0
        while written < len(view):
            count = os.write(fd, view[written:])
            if count <= 0:
                _fail("receipt write made no progress")
            written += count
        os.fsync(fd)
        current = os.stat(
            relative.name,
            dir_fd=parent_fd,
            follow_symlinks=False,
        )
        if (
            (current.st_dev, current.st_ino) != owned_identity
            or not stat.S_ISREG(current.st_mode)
            or current.st_nlink != 1
        ):
            _fail("receipt path changed while the owned descriptor was written")
        os.fsync(parent_fd)
        os.close(parent_fd)
        parent_fd = None
        os.close(fd)
        fd = None
    except BaseException as exc:  # noqa: BLE001 - every post-create failure poisons
        failure = exc

    if failure is None:
        return

    invalidation_failure: BaseException | None = None
    if created:
        if owned_identity is None and fd is not None:
            try:
                opened = os.fstat(fd)
                owned_identity = (opened.st_dev, opened.st_ino)
            except OSError as exc:
                invalidation_failure = exc
        if owned_identity is not None and invalidation_failure is None:
            try:
                _invalidate_created_receipt(root, relative, owned_identity)
            except BaseException as exc:  # noqa: BLE001 - report invalidation boundary
                invalidation_failure = exc

    _best_effort_close(fd)
    _best_effort_close(parent_fd)

    if invalidation_failure is not None:
        error = TheoremMineError(
            "receipt creation failed and retained-path invalidation could not be "
            f"confirmed: {relative.as_posix()}"
        )
        error.add_note(f"invalidation failure: {invalidation_failure!r}")
        raise error from failure
    if isinstance(failure, TheoremMineError):
        raise failure
    if not isinstance(failure, Exception):
        raise failure
    raise TheoremMineError(
        f"cannot durably create receipt: {relative.as_posix()}"
    ) from failure


def create_receipt(
    *, repo_root: Path, input_path: str, output_path: str
) -> dict[str, Any]:
    """Create one canonical receipt without replacing any existing path."""

    root = _repo_root(repo_root)
    input_relative = _relative_path(input_path, label="input path")
    raw_input = _read_regular(root, input_relative, maximum=MAX_JSON_BYTES)
    unsigned = _parse_json(raw_input, label="theorem-mine input")
    if "receipt_sha256" in unsigned:
        _fail("create input must be unsigned and omit receipt_sha256")
    receipt = build_receipt(unsigned, repo_root=root)
    output_relative = _relative_path(output_path, label="output path")
    if output_relative != _expected_receipt_path(receipt):
        _fail(f"output path must be the wave's canonical artifacts/{RECEIPT_NAME} path")
    _create_regular_exclusive(
        root,
        output_relative,
        canonical_json_bytes(receipt) + b"\n",
    )
    return receipt


def load_receipt(*, repo_root: Path, receipt_path: str) -> dict[str, Any]:
    """Load and fully verify one canonical theorem-mine receipt."""

    root = _repo_root(repo_root)
    relative = _relative_path(receipt_path, label="receipt path")
    raw = _read_regular(root, relative, maximum=MAX_JSON_BYTES)
    value = _parse_json(raw, label="theorem-mine receipt")
    _exact_keys(value, _TOP_LEVEL_KEYS | {"receipt_sha256"}, label="receipt")
    declared_hash = _sha256(value["receipt_sha256"], label="receipt_sha256")
    unsigned = {key: item for key, item in value.items() if key != "receipt_sha256"}
    if declared_hash != receipt_self_hash(unsigned):
        _fail("receipt_sha256 mismatch")
    if raw != canonical_json_bytes(value) + b"\n":
        _fail("theorem-mine receipt is not canonical JSON plus one newline")
    normalized = _validate_unsigned(unsigned, repo_root=root)
    receipt = {**normalized, "receipt_sha256": declared_hash}
    if relative != _expected_receipt_path(receipt):
        _fail("receipt is not stored at its canonical wave-relative path")
    return receipt


def _directory_entries(root: Path, relative: PurePosixPath) -> list[str] | None:
    parent = PurePosixPath(*relative.parts[:-1])
    parent_fd = _open_directory(root, parent)
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | _required_open_flag("O_DIRECTORY")
        | _required_open_flag("O_NOFOLLOW")
    )
    fd: int | None = None
    try:
        try:
            fd = os.open(relative.name, flags, dir_fd=parent_fd)
        except FileNotFoundError:
            return None
        except OSError as exc:
            raise TheoremMineError(
                f"campaign path is not a non-symlink directory: {relative.as_posix()}"
            ) from exc
        before = os.fstat(fd)
        if not stat.S_ISDIR(before.st_mode):
            _fail(f"campaign path is not a directory: {relative.as_posix()}")
        entries = sorted(os.listdir(fd))
        after = os.fstat(fd)
        if _file_snapshot(before) != _file_snapshot(after):
            _fail(f"campaign path changed while it was listed: {relative.as_posix()}")

        current_fd = _open_directory(root, relative)
        try:
            current_before = os.fstat(current_fd)
            current_entries = sorted(os.listdir(current_fd))
            current_after = os.fstat(current_fd)
        finally:
            _best_effort_close(current_fd)
        if (
            _file_snapshot(current_before) != _file_snapshot(current_after)
            or _file_snapshot(current_after) != _file_snapshot(after)
            or current_entries != entries
        ):
            _fail(f"campaign pathname changed after listing: {relative.as_posix()}")
        return entries
    finally:
        _best_effort_close(fd)
        _best_effort_close(parent_fd)


def scan_campaign(
    *,
    repo_root: Path,
    campaign_root: str,
    waves: Sequence[str],
    no_run: Sequence[str] = (),
) -> dict[str, Any]:
    """Fail closed when a specified registered wave lacks a valid receipt."""

    root = _repo_root(repo_root)
    campaign = _relative_path(campaign_root, label="campaign root")
    if len(campaign.parts) != 3 or campaign.parts[:2] != ("scratch", "runs"):
        _fail("campaign root must be scratch/runs/<campaign_id>")
    campaign_id = _identifier(campaign.parts[2], label="campaign_id")
    if _directory_entries(root, campaign) is None:
        _fail("campaign root is not an existing non-symlink directory")
    if not waves:
        _fail("scan requires at least one --wave")
    normalized_waves = [_identifier(wave, label="scan wave") for wave in waves]
    if len(normalized_waves) != len(set(normalized_waves)):
        _fail("scan waves must be unique")
    exemptions = {_identifier(wave, label="NO_RUN wave") for wave in no_run}
    if not exemptions.issubset(normalized_waves):
        _fail("every --no-run value must also be named by --wave")

    records: list[dict[str, str]] = []
    for run_id in normalized_waves:
        wave_root = campaign / run_id
        receipt_path = wave_root / "artifacts" / RECEIPT_NAME
        if run_id in exemptions:
            entries = _directory_entries(root, wave_root)
            if entries:
                _fail(f"NO_RUN exemption conflicts with existing wave data: {run_id}")
            records.append({"run_id": run_id, "status": "NO_RUN"})
            continue
        try:
            receipt = load_receipt(
                repo_root=root,
                receipt_path=receipt_path.as_posix(),
            )
        except TheoremMineError as exc:
            raise TheoremMineError(
                f"wave {run_id} is missing an authentic theorem-mine receipt: {exc}"
            ) from exc
        if receipt["campaign_id"] != campaign_id:
            _fail(f"wave {run_id} receipt campaign_id mismatch")
        if receipt["wave"]["run_id"] != run_id:
            _fail(f"wave {run_id} receipt run_id mismatch")
        if receipt["wave"]["root"] != wave_root.as_posix():
            _fail(f"wave {run_id} receipt root mismatch")
        records.append(
            {
                "run_id": run_id,
                "status": "VALID_RECEIPT",
                "gate_status": receipt["gate"]["status"],
            }
        )
    return {
        "schema": "p97-b1-postwave-theorem-mine-scan/v1",
        "status": "PASS",
        "campaign_root": campaign.as_posix(),
        "waves": records,
    }


def _summary(receipt: Mapping[str, Any], path: str) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "status": "VALID",
        "path": path,
        "campaign_id": receipt["campaign_id"],
        "run_id": receipt["wave"]["run_id"],
        "gate_status": receipt["gate"]["status"],
        "receipt_sha256": receipt["receipt_sha256"],
    }


def _main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)

    create = subparsers.add_parser("create", help="create one receipt")
    create.add_argument("--repo-root", type=Path, default=Path.cwd())
    create.add_argument("--input", required=True)
    create.add_argument("--output", required=True)

    verify = subparsers.add_parser("verify", help="verify one receipt")
    verify.add_argument("--repo-root", type=Path, default=Path.cwd())
    verify.add_argument("--receipt", required=True)

    scan = subparsers.add_parser("scan", help="scan specified campaign waves")
    scan.add_argument("--repo-root", type=Path, default=Path.cwd())
    scan.add_argument("--campaign-root", required=True)
    scan.add_argument("--wave", action="append", required=True)
    scan.add_argument("--no-run", action="append", default=[])

    args = parser.parse_args(argv)
    try:
        if args.command == "create":
            receipt = create_receipt(
                repo_root=args.repo_root,
                input_path=args.input,
                output_path=args.output,
            )
            result = _summary(receipt, args.output)
        elif args.command == "verify":
            receipt = load_receipt(
                repo_root=args.repo_root,
                receipt_path=args.receipt,
            )
            result = _summary(receipt, args.receipt)
        else:
            result = scan_campaign(
                repo_root=args.repo_root,
                campaign_root=args.campaign_root,
                waves=args.wave,
                no_run=args.no_run,
            )
    except TheoremMineError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(_main())
