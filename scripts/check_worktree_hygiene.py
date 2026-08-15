#!/usr/bin/env python3
"""Read-only, owner-scoped worktree hygiene checks.

The checker deliberately treats Git and the filesystem as untrusted inputs.  It
never stages, cleans, moves, deletes, or writes a file.  Its only output is one
canonical JSON document on stdout.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import subprocess
import sys
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path, PurePosixPath
from typing import Any

CHECKPOINT_SCHEMA = "worktree-lane-checkpoint/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
REPORT_SCHEMA = "worktree-hygiene-report/v1"
CARD_HEAD_SCHEMA = "p97_ahead_head_run_manifest.v1"
PUBLICATION_LIMIT_BYTES = 100 * 1024 * 1024
GENERATED_OUTPUT_CLASSES = ("artifacts", "events", "tmp")

_CHECKPOINT_KEYS = {
    "schema",
    "lane_id",
    "owner",
    "base_head",
    "owned_paths",
    "generated_roots",
    "durable_paths",
    "created_utc",
    "manifest_sha256",
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
_CARD_HEAD_KEYS = {
    "schema",
    "status",
    "run_id",
    "created_utc",
    "cardinality",
    "profile",
    "proof_tier",
    "admissibility_contract",
    "cut_contract",
    "cut_contract_sha256",
    "resources",
    "stops",
    "command",
    "artifact_dir",
    "source_digests",
    "evidence_scope",
}
_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")
_HEX40 = re.compile(r"^[0-9a-f]{40}$")
_HEX64 = re.compile(r"^[0-9a-f]{64}$")
_GLOB_CHARS = frozenset("*?[]{}")
_DURABLE_SUFFIXES = frozenset(
    {
        ".c",
        ".cc",
        ".cpp",
        ".csv",
        ".h",
        ".hpp",
        ".js",
        ".json",
        ".md",
        ".rs",
        ".sh",
        ".toml",
        ".ts",
        ".txt",
        ".yaml",
        ".yml",
    }
)
_GENERATED_SUFFIXES = frozenset(
    {
        ".cnf",
        ".drat",
        ".err",
        ".log",
        ".lrat",
        ".model",
        ".out",
        ".stderr",
        ".stdout",
    }
)
_CARD_HEAD_CUT_SHA256 = (
    "8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf"
)
_CARD_HEAD_EVIDENCE_SCOPE = (
    "EMPIRICALLY VERIFIED within one labeled finite card-head abstraction; "
    "not a geometric closure theorem"
)


class HygieneError(ValueError):
    """A policy input or Git observation is malformed."""


class _DuplicateJsonKey(HygieneError):
    pass


@dataclass(frozen=True)
class StatusEntry:
    xy: str
    path: str
    original_path: str | None = None

    @property
    def tracked(self) -> bool:
        return self.xy not in {"??", "!!"}

    @property
    def staged(self) -> bool:
        return self.tracked and self.xy[0] not in {" ", "?", "!"}

    @property
    def renamed(self) -> bool:
        return self.original_path is not None

    @property
    def unmerged(self) -> bool:
        return self.xy in {"AA", "AU", "DD", "DU", "UA", "UD", "UU"}


@dataclass(frozen=True)
class Checkpoint:
    path: str
    lane_id: str
    owner: str
    base_head: str
    owned_paths: tuple[str, ...]
    generated_roots: tuple[str, ...]
    durable_paths: tuple[str, ...]
    raw_sha256: str


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def manifest_self_hash(value: Mapping[str, Any]) -> str:
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return hashlib.sha256(canonical_json_bytes(unsigned)).hexdigest()


def _pairs_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise _DuplicateJsonKey(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _load_json_object(data: bytes, description: str) -> dict[str, Any]:
    try:
        value = json.loads(data, object_pairs_hook=_pairs_object)
    except (UnicodeDecodeError, json.JSONDecodeError, _DuplicateJsonKey) as exc:
        raise HygieneError(f"{description} is not strict UTF-8 JSON: {exc}") from exc
    if type(value) is not dict:
        raise HygieneError(f"{description} must be a JSON object")
    return value


def _validate_utc(value: Any, description: str) -> None:
    if not isinstance(value, str) or not value.endswith("Z"):
        raise HygieneError(f"{description} must be an ISO-8601 UTC string ending in Z")
    try:
        parsed = datetime.fromisoformat(value)
    except ValueError as exc:
        raise HygieneError(f"{description} is not valid ISO-8601") from exc
    if parsed.utcoffset() is None or parsed.utcoffset().total_seconds() != 0:
        raise HygieneError(f"{description} must use UTC")


def validate_relative_path(value: Any, description: str) -> str:
    if not isinstance(value, str) or not value or "\x00" in value:
        raise HygieneError(f"{description} must be a nonempty relative path")
    if "\\" in value or any(char in value for char in _GLOB_CHARS):
        raise HygieneError(f"{description} must be exact and contain no glob syntax")
    path = PurePosixPath(value)
    if (
        path.is_absolute()
        or value.endswith("/")
        or value.startswith("./")
        or str(path) != value
        or not path.parts
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        raise HygieneError(
            f"{description} is not a normalized repository-relative path"
        )
    return value


def _validate_exact_keys(
    value: Mapping[str, Any], expected: set[str], description: str
) -> None:
    actual = set(value)
    if actual != expected:
        raise HygieneError(
            f"{description} keys differ: "
            f"missing={sorted(expected - actual)}, extra={sorted(actual - expected)}"
        )


def _validate_id(value: Any, description: str) -> str:
    if not isinstance(value, str) or _ID.fullmatch(value) is None:
        raise HygieneError(f"{description} has an invalid form")
    return value


def _validate_path_list(value: Any, description: str) -> tuple[str, ...]:
    if type(value) is not list:
        raise HygieneError(f"{description} must be a JSON list")
    paths = tuple(
        validate_relative_path(path, f"{description} entry") for path in value
    )
    if len(paths) != len(set(paths)):
        raise HygieneError(f"{description} contains duplicate paths")
    if list(paths) != sorted(paths):
        raise HygieneError(f"{description} must be sorted")
    return paths


def _run_git(repo: Path, args: Sequence[str], *, check: bool = True) -> bytes:
    environment = os.environ.copy()
    # Even read-only porcelain commands may otherwise opportunistically refresh
    # and rewrite the index stat cache.
    environment["GIT_OPTIONAL_LOCKS"] = "0"
    try:
        result = subprocess.run(
            ["git", *args],
            cwd=repo,
            check=check,
            capture_output=True,
            env=environment,
        )
    except (OSError, subprocess.SubprocessError) as exc:
        raise HygieneError(f"git command failed: git {' '.join(args)}") from exc
    return result.stdout


def _verify_repo(repo: Path) -> Path:
    root = repo.resolve()
    raw = _run_git(root, ["rev-parse", "--show-toplevel"])
    try:
        git_root = Path(os.fsdecode(raw.rstrip(b"\n"))).resolve()
    except OSError as exc:
        raise HygieneError("cannot resolve Git worktree root") from exc
    if git_root != root:
        raise HygieneError("--repo-root must name the exact Git worktree root")
    return root


def _head(repo: Path) -> str:
    value = _run_git(repo, ["rev-parse", "HEAD"]).decode("ascii").strip()
    if _HEX40.fullmatch(value) is None:
        raise HygieneError("HEAD is not a 40-hex commit")
    return value


def _base_is_ancestor(repo: Path, base_head: str) -> bool:
    environment = os.environ.copy()
    environment["GIT_OPTIONAL_LOCKS"] = "0"
    result = subprocess.run(
        ["git", "merge-base", "--is-ancestor", base_head, "HEAD"],
        cwd=repo,
        check=False,
        capture_output=True,
        env=environment,
    )
    if result.returncode not in {0, 1}:
        raise HygieneError("cannot validate checkpoint base_head")
    return result.returncode == 0


def _status(repo: Path) -> tuple[StatusEntry, ...]:
    raw = _run_git(
        repo,
        [
            "status",
            "--porcelain=v1",
            "-z",
            "--untracked-files=all",
            "--ignored=matching",
        ],
    )
    fields = raw.split(b"\0")
    if not fields or fields[-1] != b"":
        raise HygieneError("Git porcelain output is not NUL terminated")
    entries: list[StatusEntry] = []
    index = 0
    while index < len(fields) - 1:
        field = fields[index]
        index += 1
        if len(field) < 4 or field[2:3] != b" ":
            raise HygieneError("malformed NUL-delimited Git porcelain row")
        try:
            xy = field[:2].decode("ascii")
        except UnicodeDecodeError as exc:
            raise HygieneError("non-ASCII Git porcelain status") from exc
        path = os.fsdecode(field[3:])
        original: str | None = None
        if "R" in xy or "C" in xy:
            if index >= len(fields) - 1:
                raise HygieneError("rename/copy porcelain row omits its original path")
            original = os.fsdecode(fields[index])
            index += 1
        entries.append(StatusEntry(xy=xy, path=path, original_path=original))
    return tuple(
        sorted(entries, key=lambda row: (row.path, row.xy, row.original_path or ""))
    )


def _path_is_under(path: str, root: str) -> bool:
    normalized = path.rstrip("/")
    return normalized == root or normalized.startswith(root + "/")


def _checkpoint_control(path: str, checkpoint_path: str) -> bool:
    normalized = path.rstrip("/")
    if normalized == checkpoint_path:
        return True
    if path.endswith("/"):
        return checkpoint_path.startswith(normalized + "/")
    return False


def _directory_flags() -> int:
    if not hasattr(os, "O_NOFOLLOW") or not hasattr(os, "O_DIRECTORY"):
        raise HygieneError("platform lacks no-follow directory traversal support")
    return os.O_RDONLY | os.O_NOFOLLOW | os.O_DIRECTORY


def _open_relative(repo: Path, relative: str, final_flags: int) -> int:
    """Open an exact path without following any intermediate symlink."""

    validate_relative_path(relative, "file path")
    directory_flags = _directory_flags()
    try:
        descriptor = os.open(repo, directory_flags)
    except OSError as exc:
        raise HygieneError("cannot open repository root") from exc
    try:
        parts = PurePosixPath(relative).parts
        for index, part in enumerate(parts):
            flags = final_flags if index == len(parts) - 1 else directory_flags
            try:
                child = os.open(part, flags, dir_fd=descriptor)
            except OSError as exc:
                raise HygieneError(
                    f"cannot open exact path without following links: {relative}"
                ) from exc
            os.close(descriptor)
            descriptor = child
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _observe_descriptor(
    descriptor: int, relative: str, *, collect_bytes: bool
) -> tuple[str, int, bytes | None]:
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise HygieneError(f"declared path is not a regular file: {relative}")
        if before.st_nlink != 1:
            raise HygieneError(f"declared path is hard-linked: {relative}")
        digest = hashlib.sha256()
        chunks: list[bytes] | None = [] if collect_bytes else None
        size = 0
        while True:
            chunk = os.read(descriptor, 1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
            size += len(chunk)
            if chunks is not None:
                chunks.append(chunk)
        after = os.fstat(descriptor)
        if (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_mtime_ns,
            before.st_ctime_ns,
            before.st_nlink,
            before.st_mode,
        ) != (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
            after.st_nlink,
            after.st_mode,
        ):
            raise HygieneError(f"file changed while being read: {relative}")
        return (
            digest.hexdigest(),
            size,
            b"".join(chunks) if chunks is not None else None,
        )
    finally:
        os.close(descriptor)


def _observe_file(
    repo: Path, relative: str, *, collect_bytes: bool
) -> tuple[str, int, bytes | None]:
    if not hasattr(os, "O_NOFOLLOW"):
        raise HygieneError("platform lacks no-follow file traversal support")
    descriptor = _open_relative(repo, relative, os.O_RDONLY | os.O_NOFOLLOW)
    return _observe_descriptor(descriptor, relative, collect_bytes=collect_bytes)


def _read_file_bytes(repo: Path, relative: str) -> bytes:
    _digest, _size, data = _observe_file(repo, relative, collect_bytes=True)
    assert data is not None
    return data


def _file_digest_size(repo: Path, relative: str) -> tuple[str, int]:
    digest, size, _data = _observe_file(repo, relative, collect_bytes=False)
    return digest, size


def _path_kind(repo: Path, relative: str) -> tuple[str, os.stat_result | None]:
    validate_relative_path(relative, "declared path")
    cursor = repo
    try:
        for part in PurePosixPath(relative).parts:
            cursor = cursor / part
            info = cursor.lstat()
            if stat.S_ISLNK(info.st_mode):
                return "symlink", info
        if stat.S_ISREG(info.st_mode):
            return "file", info
        if stat.S_ISDIR(info.st_mode):
            return "directory", info
        return "special", info
    except FileNotFoundError:
        return "missing", None
    except OSError as exc:
        raise HygieneError(f"cannot inspect path: {relative}") from exc


def _load_checkpoint(repo: Path, path: str, lane: str) -> Checkpoint:
    validate_relative_path(path, "checkpoint path")
    kind, info = _path_kind(repo, path)
    if kind != "file" or info is None:
        raise HygieneError(f"checkpoint is not a regular non-symlink file: {path}")
    if info.st_nlink != 1:
        raise HygieneError(f"checkpoint is hard-linked: {path}")
    raw = _read_file_bytes(repo, path)
    value = _load_json_object(raw, "checkpoint")
    _validate_exact_keys(value, _CHECKPOINT_KEYS, "checkpoint")
    if value["schema"] != CHECKPOINT_SCHEMA:
        raise HygieneError(f"checkpoint schema must be {CHECKPOINT_SCHEMA}")
    lane_id = _validate_id(value["lane_id"], "lane_id")
    if lane_id != lane:
        raise HygieneError("checkpoint lane_id does not match --lane")
    owner = _validate_id(value["owner"], "owner")
    base_head = value["base_head"]
    if not isinstance(base_head, str) or _HEX40.fullmatch(base_head) is None:
        raise HygieneError("base_head must be a lowercase 40-hex commit")
    _validate_utc(value["created_utc"], "created_utc")
    owned = _validate_path_list(value["owned_paths"], "owned_paths")
    generated = _validate_path_list(value["generated_roots"], "generated_roots")
    durable = _validate_path_list(value["durable_paths"], "durable_paths")
    all_exact = owned + durable
    if len(all_exact) != len(set(all_exact)):
        raise HygieneError("owned_paths and durable_paths overlap")
    for root in generated:
        parts = PurePosixPath(root).parts
        standard = len(parts) == 4 and parts[:3] == ("scratch", "runs", lane_id)
        card_head = len(parts) == 4 and parts[:3] == ("census", "card_head", "runs")
        if not (standard or card_head):
            raise HygieneError(
                f"generated root is not a registered fixed-policy root: {root}"
            )
    for left_index, left in enumerate(generated):
        for right in generated[left_index + 1 :]:
            if _path_is_under(left, right) or _path_is_under(right, left):
                raise HygieneError("generated_roots overlap")
    for owned_path in owned:
        if any(_path_is_under(owned_path, root) for root in generated):
            raise HygieneError("owned_paths may not claim generated-root members")
    for durable_path in durable:
        for root in generated:
            if not _path_is_under(durable_path, root):
                continue
            descendant = PurePosixPath(durable_path).relative_to(PurePosixPath(root))
            if not descendant.parts:
                raise HygieneError(
                    "durable_paths may not claim a generated root directory"
                )
            if descendant.parts[0] in GENERATED_OUTPUT_CLASSES:
                raise HygieneError(
                    "durable_paths may not relabel bulk generated output as durable"
                )
    digest = value["manifest_sha256"]
    if not isinstance(digest, str) or _HEX64.fullmatch(digest) is None:
        raise HygieneError("manifest_sha256 must be lowercase 64-hex")
    if digest != manifest_self_hash(value):
        raise HygieneError("checkpoint manifest_sha256 mismatch")
    return Checkpoint(
        path=path,
        lane_id=lane_id,
        owner=owner,
        base_head=base_head,
        owned_paths=owned,
        generated_roots=generated,
        durable_paths=durable,
        raw_sha256=hashlib.sha256(raw).hexdigest(),
    )


def _validate_digest_map(
    repo: Path, value: Any, description: str
) -> tuple[tuple[str, str], ...]:
    if type(value) is not dict or not value:
        raise HygieneError(f"{description} must be a nonempty JSON object")
    rows: list[tuple[str, str]] = []
    for raw_path, digest in value.items():
        path = validate_relative_path(raw_path, f"{description} path")
        if not isinstance(digest, str) or _HEX64.fullmatch(digest) is None:
            raise HygieneError(f"{description} has an invalid SHA-256 for {path}")
        kind, info = _path_kind(repo, path)
        if kind != "file" or info is None or info.st_nlink != 1:
            raise HygieneError(
                f"{description} path is not a unique regular file: {path}"
            )
        actual, _size = _file_digest_size(repo, path)
        if actual != digest:
            raise HygieneError(f"{description} digest mismatch: {path}")
        rows.append((path, digest))
    return tuple(sorted(rows))


def _validate_standard_run_manifest(
    repo: Path, root: str, checkpoint: Checkpoint, raw: bytes
) -> tuple[dict[str, Any], tuple[str, ...]]:
    value = _load_json_object(raw, f"{root}/run_manifest.json")
    _validate_exact_keys(value, _RUN_MANIFEST_KEYS, "run manifest")
    if value["schema"] != RUN_MANIFEST_SCHEMA:
        raise HygieneError(f"run manifest schema must be {RUN_MANIFEST_SCHEMA}")
    lane_id = _validate_id(value["lane_id"], "run manifest lane_id")
    run_id = _validate_id(value["run_id"], "run_id")
    if lane_id != checkpoint.lane_id:
        raise HygieneError("run manifest owner lane differs from checkpoint lane")
    expected_root = f"scratch/runs/{lane_id}/{run_id}"
    if root != expected_root or value["root"] != expected_root:
        raise HygieneError("run manifest root does not match its exact registered root")
    if value["owner"] != checkpoint.owner:
        raise HygieneError("run manifest owner differs from checkpoint owner")
    if value["base_head"] != checkpoint.base_head:
        raise HygieneError("run manifest base_head differs from checkpoint base_head")
    _validate_utc(value["created_utc"], "run manifest created_utc")
    if value["output_classes"] != list(GENERATED_OUTPUT_CLASSES):
        raise HygieneError("run manifest output_classes differ from fixed policy")
    sources = _validate_digest_map(repo, value["source_digests"], "source_digests")
    inputs = _validate_digest_map(repo, value["input_digests"], "input_digests")
    digest = value["manifest_sha256"]
    if not isinstance(digest, str) or _HEX64.fullmatch(digest) is None:
        raise HygieneError("run manifest manifest_sha256 must be lowercase 64-hex")
    if digest != manifest_self_hash(value):
        raise HygieneError("run manifest manifest_sha256 mismatch")
    return value, tuple(path for path, _digest in sources + inputs)


def _validate_card_head_run_manifest(
    repo: Path, root: str, raw: bytes
) -> tuple[dict[str, Any], tuple[str, ...]]:
    value = _load_json_object(raw, f"{root}/run_manifest.json")
    _validate_exact_keys(value, _CARD_HEAD_KEYS, "card-head run manifest")
    if value["schema"] != CARD_HEAD_SCHEMA or value["status"] != "PLANNED":
        raise HygieneError("card-head manifest schema/status mismatch")
    run_id = _validate_id(value["run_id"], "card-head run_id")
    expected_root = f"census/card_head/runs/{run_id}"
    if root != expected_root or value["artifact_dir"] != expected_root:
        raise HygieneError("card-head artifact_dir does not match its exact run root")
    _validate_utc(value["created_utc"], "card-head created_utc")
    cardinality = value["cardinality"]
    profile = value["profile"]
    if isinstance(cardinality, bool) or cardinality not in {12, 13, 14}:
        raise HygieneError("card-head cardinality must be 12, 13, or 14")
    if (
        type(profile) is not list
        or len(profile) != 3
        or any(isinstance(item, bool) or not isinstance(item, int) for item in profile)
        or profile[0] < 5
        or profile[1] < 5
        or profile[2] < 4
        or sum(profile) != cardinality + 3
    ):
        raise HygieneError("card-head profile is not admissible")
    if value["proof_tier"] != "PROVEN":
        raise HygieneError("card-head proof_tier must be PROVEN")
    if value["admissibility_contract"] != "p97_ahead_head_admissibility.v1":
        raise HygieneError("card-head admissibility contract mismatch")
    if value["cut_contract"] != "p97_ahead_proven_cuts_post_sub2.v1":
        raise HygieneError("card-head cut contract mismatch")
    if value["cut_contract_sha256"] != _CARD_HEAD_CUT_SHA256:
        raise HygieneError("card-head cut contract digest mismatch")
    resources = value["resources"]
    if type(resources) is not dict or set(resources) != {"max_workers", "nice"}:
        raise HygieneError("card-head resources keys differ")
    workers = resources["max_workers"]
    nice = resources["nice"]
    if (
        isinstance(workers, bool)
        or not isinstance(workers, int)
        or not 1 <= workers <= 4
        or isinstance(nice, bool)
        or not isinstance(nice, int)
        or not 1 <= nice <= 19
    ):
        raise HygieneError("card-head resources are outside their fixed bounds")
    stops = value["stops"]
    stop_keys = {
        "wall_seconds",
        "max_new_bank_rows",
        "max_consecutive_shape_stale",
    }
    if type(stops) is not dict or set(stops) != stop_keys:
        raise HygieneError("card-head stops keys differ")
    if any(
        isinstance(stops[key], bool)
        or not isinstance(stops[key], int)
        or stops[key] <= 0
        for key in stop_keys
    ):
        raise HygieneError("card-head stops must be positive integers")
    expected_command = [
        "nice",
        "-n",
        str(nice),
        "uv",
        "run",
        "python",
        "-m",
        "census.card_head.runner",
        "execute",
        f"{root}/run_manifest.json",
    ]
    if value["command"] != expected_command:
        raise HygieneError("card-head command is not the manifest-pinned entrypoint")
    if value["evidence_scope"] != _CARD_HEAD_EVIDENCE_SCOPE:
        raise HygieneError("card-head evidence_scope mismatch")
    sources = _validate_digest_map(repo, value["source_digests"], "source_digests")
    return value, tuple(path for path, _digest in sources)


def _walk_root(repo: Path, root: str) -> tuple[dict[str, Any], ...]:
    """Return a content-addressed, symlink/hardlink-rejecting root snapshot."""

    kind, info = _path_kind(repo, root)
    if kind != "directory" or info is None:
        raise HygieneError(f"generated root is not a non-symlink directory: {root}")
    rows: list[dict[str, Any]] = []

    def visit(relative_dir: str, descriptor: int) -> None:
        try:
            with os.scandir(descriptor) as iterator:
                children = sorted(iterator, key=lambda item: os.fsencode(item.name))
        except OSError as exc:
            raise HygieneError(
                f"cannot enumerate generated root: {relative_dir}"
            ) from exc
        for child in children:
            relative = f"{relative_dir}/{child.name}"
            try:
                child_info = child.stat(follow_symlinks=False)
            except OSError as exc:
                raise HygieneError(
                    f"cannot inspect generated path: {relative}"
                ) from exc
            if stat.S_ISLNK(child_info.st_mode):
                raise HygieneError(f"generated root contains a symlink: {relative}")
            if stat.S_ISDIR(child_info.st_mode):
                try:
                    child_descriptor = os.open(
                        child.name, _directory_flags(), dir_fd=descriptor
                    )
                except OSError as exc:
                    raise HygieneError(
                        f"generated directory changed while traversing: {relative}"
                    ) from exc
                opened_info = os.fstat(child_descriptor)
                if (opened_info.st_dev, opened_info.st_ino, opened_info.st_mode) != (
                    child_info.st_dev,
                    child_info.st_ino,
                    child_info.st_mode,
                ):
                    os.close(child_descriptor)
                    raise HygieneError(
                        f"generated directory changed while traversing: {relative}"
                    )
                rows.append({"kind": "directory", "path": relative})
                try:
                    visit(relative, child_descriptor)
                finally:
                    os.close(child_descriptor)
            elif stat.S_ISREG(child_info.st_mode):
                if child_info.st_nlink != 1:
                    raise HygieneError(
                        f"generated root contains a hardlink: {relative}"
                    )
                if not hasattr(os, "O_NOFOLLOW"):
                    raise HygieneError(
                        "platform lacks no-follow file traversal support"
                    )
                try:
                    child_descriptor = os.open(
                        child.name,
                        os.O_RDONLY | os.O_NOFOLLOW,
                        dir_fd=descriptor,
                    )
                except OSError as exc:
                    raise HygieneError(
                        f"generated file changed while traversing: {relative}"
                    ) from exc
                opened_info = os.fstat(child_descriptor)
                if (opened_info.st_dev, opened_info.st_ino, opened_info.st_mode) != (
                    child_info.st_dev,
                    child_info.st_ino,
                    child_info.st_mode,
                ):
                    os.close(child_descriptor)
                    raise HygieneError(
                        f"generated file changed while traversing: {relative}"
                    )
                digest, size, _data = _observe_descriptor(
                    child_descriptor, relative, collect_bytes=False
                )
                rows.append(
                    {
                        "kind": "file",
                        "path": relative,
                        "sha256": digest,
                        "size": size,
                    }
                )
            else:
                raise HygieneError(
                    f"generated root contains a special file: {relative}"
                )

    root_descriptor = _open_relative(repo, root, _directory_flags())
    try:
        visit(root, root_descriptor)
    finally:
        os.close(root_descriptor)
    return tuple(sorted(rows, key=lambda row: (row["path"], row["kind"])))


def _validate_generated_root(
    repo: Path, root: str, checkpoint: Checkpoint
) -> tuple[dict[str, Any], tuple[str, ...], tuple[dict[str, Any], ...]]:
    manifest_path = f"{root}/run_manifest.json"
    kind, info = _path_kind(repo, manifest_path)
    if kind != "file" or info is None or info.st_nlink != 1:
        raise HygieneError(
            f"generated root lacks a unique regular run_manifest.json: {root}"
        )
    raw = _read_file_bytes(repo, manifest_path)
    if root.startswith("scratch/runs/"):
        manifest, source_paths = _validate_standard_run_manifest(
            repo, root, checkpoint, raw
        )
    else:
        manifest, source_paths = _validate_card_head_run_manifest(repo, root, raw)
    rows = _walk_root(repo, root)
    manifest_path = f"{root}/run_manifest.json"
    manifest_row = next(
        (row for row in rows if row["path"] == manifest_path and row["kind"] == "file"),
        None,
    )
    if (
        manifest_row is None
        or manifest_row["sha256"] != hashlib.sha256(raw).hexdigest()
    ):
        raise HygieneError(f"run manifest changed while validating: {manifest_path}")
    for row in rows:
        path = row["path"]
        in_output_class = any(
            _path_is_under(path, f"{root}/{output_class}")
            for output_class in GENERATED_OUTPUT_CLASSES
        )
        declared_durable = any(
            path == durable
            or durable.startswith(path + "/")
            or path.startswith(durable + "/")
            for durable in checkpoint.durable_paths
        )
        if path != manifest_path and not in_output_class and not declared_durable:
            raise HygieneError(f"generated root has an unregistered member: {path}")
    return manifest, source_paths, rows


def _scope_snapshot(
    repo: Path,
    checkpoint: Checkpoint,
    statuses: tuple[StatusEntry, ...],
    *,
    staged: bool,
) -> tuple[dict[str, Any], dict[str, tuple[dict[str, Any], ...]]]:
    files: list[dict[str, Any]] = []
    declared = checkpoint.owned_paths + checkpoint.durable_paths + (checkpoint.path,)
    for relative in sorted(declared):
        kind, info = _path_kind(repo, relative)
        row: dict[str, Any] = {"kind": kind, "path": relative}
        if kind == "file" and info is not None:
            digest, size = _file_digest_size(repo, relative)
            if relative == checkpoint.path and digest != checkpoint.raw_sha256:
                raise HygieneError("checkpoint changed after manifest validation")
            row.update(
                {
                    "nlink": info.st_nlink,
                    "sha256": digest,
                    "size": size,
                }
            )
        files.append(row)
    roots: dict[str, tuple[dict[str, Any], ...]] = {}
    for root in checkpoint.generated_roots:
        _manifest, source_paths, rows = _validate_generated_root(repo, root, checkpoint)
        roots[root] = rows
        for source in sorted(set(source_paths)):
            if source not in declared:
                kind, info = _path_kind(repo, source)
                if kind == "file" and info is not None:
                    digest, size = _file_digest_size(repo, source)
                    files.append(
                        {
                            "kind": kind,
                            "nlink": info.st_nlink,
                            "path": source,
                            "sha256": digest,
                            "size": size,
                        }
                    )
    relevant_status = []
    for row in statuses:
        relevant = row.path in declared or any(
            _path_is_under(row.path, root) for root in checkpoint.generated_roots
        )
        if staged and row.staged:
            relevant = True
        if relevant:
            relevant_status.append(
                {"original_path": row.original_path, "path": row.path, "xy": row.xy}
            )
    index = _staged_snapshot(repo, statuses) if staged else ()
    return (
        {
            "files": sorted(files, key=lambda row: row["path"]),
            "index": index,
            "relevant_status": relevant_status,
            "roots": {root: list(rows) for root, rows in sorted(roots.items())},
        },
        roots,
    )


def _staged_blob(repo: Path, path: str) -> tuple[str, int] | None:
    raw = _run_git(
        repo, ["--literal-pathspecs", "ls-files", "--stage", "-z", "--", path]
    )
    records = [record for record in raw.split(b"\0") if record]
    matches: list[tuple[str, int]] = []
    for record in records:
        try:
            metadata, raw_path = record.split(b"\t", 1)
            mode, object_id, stage = metadata.decode("ascii").split(" ")
        except (ValueError, UnicodeDecodeError) as exc:
            raise HygieneError(f"malformed staged index row for {path}") from exc
        if os.fsdecode(raw_path) == path and stage == "0":
            size_raw = _run_git(repo, ["cat-file", "-s", object_id])
            try:
                size = int(size_raw.decode("ascii").strip())
            except (UnicodeDecodeError, ValueError) as exc:
                raise HygieneError(f"invalid staged blob size for {path}") from exc
            matches.append((f"{mode}:{object_id}", size))
    if len(matches) > 1:
        raise HygieneError(f"multiple stage-zero index entries for {path}")
    return matches[0] if matches else None


def _staged_snapshot(
    repo: Path, statuses: tuple[StatusEntry, ...]
) -> tuple[dict[str, Any], ...]:
    rows = []
    for status_row in statuses:
        if not status_row.staged:
            continue
        blob = _staged_blob(repo, status_row.path)
        rows.append(
            {
                "blob": blob[0] if blob else None,
                "original_path": status_row.original_path,
                "path": status_row.path,
                "size": blob[1] if blob else None,
                "unmerged": status_row.unmerged,
                "xy": status_row.xy,
            }
        )
    return tuple(sorted(rows, key=lambda row: (row["path"], row["xy"])))


def _issue(reason: str, path: str, detail: str) -> dict[str, Any]:
    return {"blocking": True, "detail": detail, "path": path, "reason": reason}


def _status_classification(
    row: StatusEntry,
    checkpoint: Checkpoint,
    valid_roots: set[str],
    *,
    staged_check: bool,
) -> dict[str, Any]:
    path = row.path.rstrip("/")
    owned = path in checkpoint.owned_paths or path in checkpoint.durable_paths
    generated_root = next(
        (root for root in checkpoint.generated_roots if _path_is_under(path, root)),
        None,
    )
    if row.staged and staged_check and not owned:
        classification, reason, blocking = "foreign_staged", "FOREIGN_STAGED", True
    elif _checkpoint_control(row.path, checkpoint.path):
        classification, reason, blocking = (
            "checkpoint_control",
            "CHECKPOINT_CONTROL",
            False,
        )
    elif row.renamed and (owned or row.staged):
        classification, reason, blocking = "unsafe_rename", "RENAME_UNSUPPORTED", True
    elif owned:
        classification, reason, blocking = "owner_source", "OWNER_PATH", False
    elif generated_root is not None:
        if generated_root in valid_roots:
            classification = "registered_generated"
            reason, blocking = "REGISTERED_GENERATED", False
        else:
            classification = "unregistered_generated"
            reason, blocking = "UNREGISTERED_GENERATED", True
    elif row.tracked:
        classification, reason, blocking = "foreign_dirty", "FOREIGN_DIRTY", False
    else:
        candidate = PurePosixPath(path)
        name_lower = candidate.name.lower()
        suffix = candidate.suffix.lower()
        root_spill = suffix in {".lean", ".py"} or (
            len(candidate.parts) == 1
            and (
                candidate.name.startswith("-")
                or suffix in _GENERATED_SUFFIXES
                or candidate.stem.lower().startswith(("output", "scratch", "tmp"))
            )
        )
        durable = suffix in _DURABLE_SUFFIXES or any(
            token in name_lower
            for token in ("conclusion", "index", "manifest", "receipt", "report")
        )
        if root_spill:
            classification, reason = "root_spill", "UNTRACKED_ROOT_SPILL"
        elif durable:
            classification, reason = "durable_untracked", "DURABLE_UNTRACKED"
        else:
            classification, reason = "unregistered_generated", "UNREGISTERED_GENERATED"
        # Report mode is the global backlog gate.  Staged mode is deliberately
        # owner-scoped so a lane can publish an exact-path commit while foreign
        # *unstaged* work remains visible in a shared worktree.  Any such path
        # entering the index is caught above as FOREIGN_STAGED.
        blocking = not staged_check
    result: dict[str, Any] = {
        "blocking": blocking,
        "class": classification,
        "path": path,
        "reason": reason,
        "status": row.xy,
    }
    if row.original_path is not None:
        result["original_path"] = row.original_path
    return result


def inspect_worktree(
    repo_root: Path,
    *,
    lane: str,
    checkpoint_path: str | None = None,
    staged: bool = False,
    between_scans: Callable[[], None] | None = None,
) -> dict[str, Any]:
    """Return one deterministic report; ``between_scans`` exists for race tests."""

    repo = _verify_repo(repo_root)
    lane_id = _validate_id(lane, "--lane")
    if checkpoint_path is None:
        checkpoint_path = f".codex/worktree-checkpoints/{lane_id}.json"
    checkpoint_path = validate_relative_path(checkpoint_path, "checkpoint path")
    head = _head(repo)
    issues: list[dict[str, Any]] = []
    try:
        checkpoint = _load_checkpoint(repo, checkpoint_path, lane_id)
    except HygieneError as exc:
        return _finalize_report(
            lane=lane_id,
            checkpoint_path=checkpoint_path,
            head=head,
            staged=staged,
            entries=[],
            issues=[_issue("CHECKPOINT_INVALID", checkpoint_path, str(exc))],
        )
    if not _base_is_ancestor(repo, checkpoint.base_head):
        issues.append(
            _issue(
                "BASE_HEAD_NOT_ANCESTOR",
                checkpoint.path,
                "checkpoint base_head is not an ancestor of HEAD",
            )
        )
    first_status = _status(repo)
    valid_roots: set[str] = set()
    try:
        first_snapshot, first_roots = _scope_snapshot(
            repo, checkpoint, first_status, staged=staged
        )
        valid_roots.update(first_roots)
    except HygieneError as exc:
        first_snapshot = None
        issues.append(_issue("DECLARED_SCOPE_INVALID", checkpoint.path, str(exc)))

    if between_scans is not None:
        between_scans()

    second_status = _status(repo)
    try:
        second_snapshot, second_roots = _scope_snapshot(
            repo, checkpoint, second_status, staged=staged
        )
        valid_roots.intersection_update(second_roots)
    except HygieneError as exc:
        second_snapshot = None
        valid_roots.clear()
        issues.append(_issue("DECLARED_SCOPE_INVALID", checkpoint.path, str(exc)))

    if first_snapshot != second_snapshot:
        issues.append(
            _issue(
                "RACE_DETECTED",
                checkpoint.path,
                "owned, generated, source/input, or staged membership/bytes changed between scans",
            )
        )

    deleted = {
        row.path
        for row in second_status
        if row.tracked and "D" in row.xy and row.original_path is None
    }
    for path in checkpoint.owned_paths + checkpoint.durable_paths:
        kind, info = _path_kind(repo, path)
        if kind == "missing" and path not in deleted:
            issues.append(
                _issue("OWNED_PATH_MISSING", path, "declared path is missing")
            )
        elif kind == "directory":
            issues.append(
                _issue(
                    "OWNED_PATH_NOT_FILE",
                    path,
                    "owned declarations must name exact files",
                )
            )
        elif kind == "symlink":
            issues.append(
                _issue("SYMLINK_DECLARATION", path, "declared path is a symlink")
            )
        elif kind == "special":
            issues.append(
                _issue("OWNED_PATH_NOT_FILE", path, "declared path is special")
            )
        elif kind == "file" and info is not None and info.st_nlink != 1:
            issues.append(
                _issue("HARDLINK_DECLARATION", path, "declared path is hard-linked")
            )

    entries = [
        _status_classification(row, checkpoint, valid_roots, staged_check=staged)
        for row in second_status
    ]
    if staged and second_snapshot is not None:
        for index_row in second_snapshot["index"]:
            size = index_row["size"]
            if index_row["unmerged"]:
                issues.append(
                    _issue(
                        "UNMERGED_INDEX",
                        index_row["path"],
                        f"staged index status is unmerged: {index_row['xy']}",
                    )
                )
            elif size is None and index_row["xy"][0] != "D":
                issues.append(
                    _issue(
                        "STAGED_BLOB_MISSING",
                        index_row["path"],
                        "non-deleted staged path has no stage-zero blob",
                    )
                )
            if size is not None and size >= PUBLICATION_LIMIT_BYTES:
                issues.append(
                    _issue(
                        "OVERSIZE_STAGED",
                        index_row["path"],
                        f"staged blob is {size} bytes; limit is {PUBLICATION_LIMIT_BYTES}",
                    )
                )
    return _finalize_report(
        lane=lane_id,
        checkpoint_path=checkpoint_path,
        head=head,
        staged=staged,
        entries=entries,
        issues=issues,
    )


def _finalize_report(
    *,
    lane: str,
    checkpoint_path: str,
    head: str,
    staged: bool,
    entries: list[dict[str, Any]],
    issues: list[dict[str, Any]],
) -> dict[str, Any]:
    entries.sort(
        key=lambda row: (
            row["path"],
            row["reason"],
            row["status"],
            row.get("original_path", ""),
        )
    )
    unique_issues = {(row["reason"], row["path"], row["detail"]): row for row in issues}
    issues = [unique_issues[key] for key in sorted(unique_issues)]
    reasons = Counter(row["reason"] for row in entries)
    reasons.update(row["reason"] for row in issues)
    blocking = any(row["blocking"] for row in entries) or bool(issues)
    return {
        "blocking": blocking,
        "checkpoint": checkpoint_path,
        "counts": {
            "entries": len(entries),
            "issues": len(issues),
            "reasons": dict(sorted(reasons.items())),
        },
        "entries": entries,
        "head": head,
        "issues": issues,
        "lane_id": lane,
        "publication_limit_bytes": PUBLICATION_LIMIT_BYTES,
        "schema": REPORT_SCHEMA,
        "staged_check": staged,
    }


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("report", "check"))
    parser.add_argument("--lane", required=True)
    parser.add_argument("--checkpoint")
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--staged", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        report = inspect_worktree(
            args.repo_root,
            lane=args.lane,
            checkpoint_path=args.checkpoint,
            staged=args.staged,
        )
    except HygieneError as exc:
        report = {
            "blocking": True,
            "counts": {"entries": 0, "issues": 1, "reasons": {"CHECKER_ERROR": 1}},
            "entries": [],
            "issues": [
                {
                    "blocking": True,
                    "detail": str(exc),
                    "path": "",
                    "reason": "CHECKER_ERROR",
                }
            ],
            "lane_id": args.lane,
            "publication_limit_bytes": PUBLICATION_LIMIT_BYTES,
            "schema": REPORT_SCHEMA,
            "staged_check": args.staged,
        }
    sys.stdout.buffer.write(canonical_json_bytes(report) + b"\n")
    return 1 if args.command == "check" and report["blocking"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
