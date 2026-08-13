"""Offline, fail-closed validator for a materialized exact-12 arm-static run.

This module intentionally has no PIQD client, solver, daemon, Lean, or network
dependency.  It authenticates bytes already present in a complete workdir and
labels a SAT replay as finite diagnostic evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import stat
from pathlib import Path
from typing import Any

EXPECTED_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_run.v8"
EXPECTED_JOB_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_job.v8"
EXPECTED_CNF_SHA256 = "a69826e5588cad4f42ab1d23edd3e20378ae4a21ff8dc43b616c4e9c4be53c6d"
EXPECTED_VARIABLES = 45_357
EXPECTED_CLAUSES = 645_155
CERTIFICATE_BLOCKER = "CERT-001"

# These are the immutable v21 publication anchors.  Self-hashes in an
# untrusted workdir are not trust anchors: a validator must reject a coherent
# but substituted run.
EXPECTED_JOB_SHA256 = "daa8532b0c5bea5acde90e52a2a6eafd993097f79f10e1170dc1487ea1d0f246"
EXPECTED_JOB_ID = "2c342b3c672e5dc95241a88fb98716bb646689c86c3e841b0e3c536c46e1d29a"
EXPECTED_SURVIVOR_SHA256 = (
    "4ee0e843295f47a961a5256247813e6a97318b882451263f03ede5432afd32f0"
)
EXPECTED_DESCRIPTOR_SHA256 = (
    "9e861219f615815b1ec5136fdad3e8f78d58c1fb7ce9cede6bf23a609ca098e1"
)
EXPECTED_RECEIPT_SHA256 = (
    "05d072bf25d4efab85ac377d54f159f2af4111e11785270e525c60b8c4b5d0e8"
)
EXPECTED_RECEIPT_FILE_SHA256 = (
    "a90c376dbb2780b3f2026132e6ebb906e3a8740846880bc9306d64b472b6d520"
)
EXPECTED_SOURCE_MANIFEST_SHA256 = (
    "331771430d288641c9858c8104080f10d0c3a1fc37a166ee23491a0fecefadc8"
)
EXPECTED_DESCRIPTOR_SOURCES_SHA256 = (
    "7533ebcbeca650e15506b728808603bf648ab6d358f6bcdd6ad92ebb5bc430e3"
)
EXPECTED_PRODUCER_MANIFEST_SHA256 = (
    "f17791b6490153cdfdedafb686b5992ba72a76b40950ee8df5734172aef82c75"
)
EXPECTED_MODEL_SHA256 = (
    "ca3fd907bf0eb2b76f288f5075377e9974fefe2fa6bf151807a4eab0de57482c"
)
EXPECTED_SOLVER_LOG_SHA256 = (
    "bbd5eecc055489fa1b91c756fce4df2f779a399777eedb726635d86be893e804"
)
EXPECTED_SOLVER_IDENTITY_SHA256 = (
    "f25cfc3593f9cf823cb501cfdbb0fd1fed576fba885a4bf25579e5a39176f05c"
)
EXPECTED_VARIABLE_MAP_SHA256 = (
    "ba0225d09e54f506256966e29bb9793d08a515e3653daeae56107f7fa451b0ba"
)
EXPECTED_JOURNAL_SEAL_SHA256 = (
    "2a2d6060271b434d96f8d16bdd766169454405cf8bc19c2d0b5e6365a3de5098"
)
EXPECTED_WAVE_MANIFEST_SHA256 = (
    "945f65c135460702359b3abefe879268ff9a6ad282d7ce58504edb364d6fb2fd"
)
EXPECTED_PIQD_JOB_ID = "88592318-8532-4d9b-96bc-a43c7b7a9827"
EXPECTED_CUSTODY_SEAL_SHA256 = (
    "22d83539b3e8b2fe3088af769bfd62ddfac1a82039a1fba5affaa9d0abf8c4a4"
)
EXPECTED_DIAGNOSTIC_SHA256 = (
    "ed4aec7de66d5511041964ac176fa71173121faf3432f8670b04711f5cbafea5"
)
EXPECTED_MINING_SHA256 = (
    "be527d8fbdc32c0a05eb93cbfa7c34dae2069e7ae0f76e63f9467c9de6c9a04f"
)
MAX_FILE_BYTES = 64 * 1024 * 1024
MAX_JSON_BYTES = 64 * 1024 * 1024
MAX_JSON_DEPTH = 96
MAX_JSON_NODES = 1_000_000
EXPECTED_ARTIFACT_KEYS = frozenset(
    {
        "adjacent_apex_cross_block_family_bank",
        "apex_first_opposite_shared_pair_common_five_family_bank",
        "apex_first_opposite_shared_pair_second_opposite_common_five_family_bank",
        "apex_first_opposite_shared_pair_surplus_common_five_family_bank",
        "apex_first_surplus_second_common_five_family_bank",
        "apex_internal_shared_pair_common_five_family_bank",
        "apex_pair_cross_block_family_bank",
        "apex_shared_pair_cross_block_family_bank",
        "apex_triple_surplus_second_opposite_common_five_family_bank",
        "apex_zero_cross_block_family_bank",
        "arm_suffix",
        "discovery_cnf",
        "job",
        "positive_membership_bank",
        "reciprocal_first_opposite_surplus_second_opposite_common_five_family_bank",
        "second_apex_surplus_second_first_common_five_family_bank",
        "second_cap_apex_surplus_family_bank",
        "source_order_bank",
        "source_order_installation",
        "surplus_apex_pair_family_bank",
        "surplus_pair_second_opposite_apex_pair_common_five_family_bank",
        "surplus_three_triad_family_bank",
        "survivor",
        "zero_center_cross_block_family_bank",
    }
)


class ArmStaticWorkdirValidationError(ValueError):
    """Raised when any authenticated workdir invariant fails."""


def canonical_json_bytes(value: Any) -> bytes:
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


def _json_bytes(value: Any) -> bytes:
    # Top-level canary files use this historical, pretty-json hash.
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")


def _fail(message: str) -> None:
    raise ArmStaticWorkdirValidationError(message)


def _strict_json(raw: bytes, path: Path) -> Any:
    if len(raw) > MAX_JSON_BYTES:
        _fail(f"{path}: JSON exceeds bounded size")
    try:
        value = json.loads(raw.decode("utf-8"), object_pairs_hook=_no_duplicates)
        _check_json_shape(value, path)
        return value
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
        ArmStaticWorkdirValidationError,
    ) as exc:
        _fail(f"{path}: invalid JSON: {exc}")


def _no_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _check_json_shape(
    value: Any, path: Path, depth: int = 0, counter: list[int] | None = None
) -> None:
    """Bound parsed JSON and reject hostile subclasses/non-container keys."""
    if counter is None:
        counter = [0]
    counter[0] += 1
    if counter[0] > MAX_JSON_NODES or depth > MAX_JSON_DEPTH:
        _fail(f"{path}: JSON nesting/node limit exceeded")
    if type(value) is dict:
        for key, item in value.items():
            if type(key) is not str:
                _fail(f"{path}: JSON object key is not a string")
            _check_json_shape(item, path, depth + 1, counter)
    elif type(value) is list:
        for item in value:
            _check_json_shape(item, path, depth + 1, counter)
    elif type(value) not in {str, int, float, bool, type(None)}:
        _fail(f"{path}: hostile JSON value type")
    elif type(value) is float and not math.isfinite(value):
        _fail(f"{path}: non-finite JSON number")


def _open_regular(
    path: Path, maximum_bytes: int = MAX_FILE_BYTES
) -> tuple[int, os.stat_result]:
    """Open every component beneath an fd-anchored root without following links."""
    native = Path(os.path.abspath(os.fspath(path)))
    parts = native.parts
    if not parts or parts[0] != os.sep:
        _fail(f"path is not native absolute: {path}")
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0)
    directory_flags = (
        flags | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    )
    root_fd = os.open(os.sep, directory_flags)
    current = root_fd
    try:
        for component in parts[1:-1]:
            if component in {"", ".", ".."}:
                _fail(f"unsafe path component: {path}")
            next_fd = os.open(component, directory_flags, dir_fd=current)
            info = os.fstat(next_fd)
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                os.close(next_fd)
                _fail(f"path has non-directory or symlinked ancestor: {path}")
            if current != root_fd:
                os.close(current)
            current = next_fd
        leaf = parts[-1]
        if leaf in {"", ".", ".."}:
            _fail(f"unsafe path leaf: {path}")
        fd = os.open(leaf, flags | getattr(os, "O_NOFOLLOW", 0), dir_fd=current)
        info = os.fstat(fd)
        if stat.S_ISLNK(info.st_mode) or not stat.S_ISREG(info.st_mode):
            os.close(fd)
            _fail(f"path is not a regular non-symlink file: {path}")
        if info.st_nlink != 1:
            os.close(fd)
            _fail(f"hard-linked file rejected: {path} (nlink={info.st_nlink})")
        if info.st_size > maximum_bytes:
            os.close(fd)
            _fail(f"file exceeds bounded size: {path}")
        return fd, info
    finally:
        if current != root_fd:
            os.close(current)
        os.close(root_fd)


def _assert_directory(path: Path) -> os.stat_result:
    """Recapture a directory through componentwise O_NOFOLLOW traversal."""
    native = Path(os.path.abspath(os.fspath(path)))
    parts = native.parts
    if not parts or parts[0] != os.sep:
        _fail(f"path is not native absolute: {path}")
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        root_fd = os.open(os.sep, flags)
    except OSError as exc:
        _fail(f"cannot open filesystem root: {exc}")
    current = root_fd
    try:
        try:
            for component in parts[1:]:
                if component in {"", ".", ".."}:
                    _fail(f"unsafe directory component: {path}")
                next_fd = os.open(component, flags, dir_fd=current)
                before = os.fstat(next_fd)
                if not stat.S_ISDIR(before.st_mode) or stat.S_ISLNK(before.st_mode):
                    os.close(next_fd)
                    _fail(f"path has non-directory or symlinked ancestor: {path}")
                after = os.fstat(next_fd)
                if (before.st_dev, before.st_ino, before.st_nlink) != (
                    after.st_dev,
                    after.st_ino,
                    after.st_nlink,
                ):
                    os.close(next_fd)
                    _fail(f"directory identity changed while opening: {path}")
                if current != root_fd:
                    os.close(current)
                current = next_fd
        except OSError as exc:
            _fail(f"cannot traverse directory {path}: {exc}")
        return os.fstat(current)
    finally:
        if current != root_fd:
            os.close(current)
        os.close(root_fd)


def _assert_native_under(path: Path, root: Path) -> None:
    root_native = Path(os.path.abspath(os.fspath(root)))
    path_native = Path(os.path.abspath(os.fspath(path)))
    try:
        if os.path.commonpath((str(root_native), str(path_native))) != str(root_native):
            _fail(f"path escapes source root: {path}")
    except ValueError:
        _fail(f"path escapes source root: {path}")
    _assert_directory(root_native)


def _regular(path: Path) -> os.stat_result:
    try:
        fd, info = _open_regular(path)
    except OSError as exc:
        _fail(f"cannot open {path}: {exc}")
    os.close(fd)
    return info


def _read(path: Path, maximum_bytes: int = MAX_FILE_BYTES) -> bytes:
    try:
        fd, before = _open_regular(path, maximum_bytes)
    except OSError as exc:
        _fail(f"cannot open {path}: {exc}")
    try:
        chunks: list[bytes] = []
        total = 0
        while total <= maximum_bytes:
            chunk = os.read(fd, min(1024 * 1024, maximum_bytes + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        if total > maximum_bytes:
            _fail(f"file exceeds bounded size: {path}")
        after = os.fstat(fd)
        if (before.st_dev, before.st_ino, before.st_nlink, before.st_size) != (
            after.st_dev,
            after.st_ino,
            after.st_nlink,
            after.st_size,
        ):
            _fail(f"file identity changed while reading: {path}")
        return b"".join(chunks)
    except OSError as exc:
        _fail(f"cannot read {path}: {exc}")
    finally:
        os.close(fd)


def _load(workdir: Path, name: str) -> tuple[Any, bytes]:
    path = workdir / name
    raw = _read(path)
    return _strict_json(raw, path), raw


def _same(actual: Any, expected: Any, label: str) -> None:
    if type(expected) in {str, int, float, bool, type(None)} and type(
        actual
    ) is not type(expected):
        _fail(
            f"{label}: expected exact {type(expected).__name__}, got {type(actual).__name__}"
        )
    if actual != expected:
        _fail(f"{label}: expected {expected!r}, got {actual!r}")


def _hash_file(path: Path) -> str:
    return sha256_bytes(_read(path))


def _validate_auxiliary(workdir: Path) -> None:
    for name, expected in (
        ("all_order_diagnostic_certificate.json", EXPECTED_DIAGNOSTIC_SHA256),
        ("all_order_mining_summary.json", EXPECTED_MINING_SHA256),
    ):
        path = workdir / name
        raw = _read(path)
        _same(sha256_bytes(raw), expected, f"{name} SHA-256")
        _strict_json(raw, path)


def _validate_assignment(model: list[Any]) -> set[int]:
    if type(model) is not list or len(model) != EXPECTED_VARIABLES:
        _fail("model is not a total assignment list")
    positives: set[int] = set()
    seen: set[int] = set()
    for item in model:
        if type(item) is not int or item == 0 or abs(item) > EXPECTED_VARIABLES:
            _fail("model contains an invalid signed literal")
        if abs(item) in seen:
            _fail("model contains a duplicate variable or both signs")
        seen.add(abs(item))
        if item > 0:
            positives.add(item)
    if seen != set(range(1, EXPECTED_VARIABLES + 1)):
        _fail("model is not total over the declared variable range")
    return positives


def _validate_dimacs(path: Path, model: list[Any]) -> dict[str, int]:
    raw = _read(path)
    _same(len(raw), 13_133_986, "discovery.cnf byte count")
    _same(sha256_bytes(raw), EXPECTED_CNF_SHA256, "discovery.cnf SHA-256")
    positives = _validate_assignment(model)
    clauses = 0
    header: tuple[int, int] | None = None
    pending: list[int] = []
    try:
        lines = raw.decode("ascii").splitlines()
    except UnicodeDecodeError:
        _fail("DIMACS is not ASCII")
    for line in lines:
        if not line or line.startswith("c"):
            continue
        fields = line.split()
        if not fields:
            continue
        if fields[0] == "p":
            if header is not None or len(fields) != 4 or fields[1] != "cnf":
                _fail("malformed DIMACS header")
            try:
                header = (int(fields[2]), int(fields[3]))
            except ValueError:
                _fail("malformed DIMACS counts")
            continue
        for token in fields:
            try:
                literal = int(token)
            except ValueError:
                _fail("malformed DIMACS literal")
            if literal == 0:
                if not pending:
                    _fail("empty DIMACS clause")
                if not any(
                    (lit > 0 and lit in positives)
                    or (lit < 0 and -lit not in positives)
                    for lit in pending
                ):
                    _fail(f"model does not satisfy clause {clauses + 1}")
                clauses += 1
                pending = []
            else:
                if abs(literal) > EXPECTED_VARIABLES:
                    _fail("DIMACS literal exceeds declared variable count")
                pending.append(literal)
    if pending or header is None:
        _fail("DIMACS is missing a terminated clause or header")
    _same(header, (EXPECTED_VARIABLES, EXPECTED_CLAUSES), "DIMACS header")
    _same(clauses, EXPECTED_CLAUSES, "DIMACS clause count")
    return {"variables": EXPECTED_VARIABLES, "clauses": clauses, "satisfied": clauses}


def _validate_artifacts(workdir: Path, summary: dict[str, Any]) -> int:
    count = 0
    artifacts = summary.get("artifacts")
    if type(artifacts) is not dict:
        _fail("summary.artifacts is not an object")
    if set(artifacts) != EXPECTED_ARTIFACT_KEYS | {"proof", "terminal_cnf"}:
        _fail("summary.artifacts key inventory is not the v21 schema")
    if artifacts.get("proof") is not None or artifacts.get("terminal_cnf") is not None:
        _fail("v21 proof and terminal_cnf artifacts must be absent")
    for key, record in artifacts.items():
        if record is None:
            continue
        if type(record) is not dict or type(record.get("path")) is not str:
            _fail(f"summary.artifacts.{key} is malformed")
        rel = Path(record["path"])
        if rel.is_absolute() or len(rel.parts) != 1 or rel.name != record["path"]:
            _fail(f"artifact {key} path is not a top-level native path")
        if (
            type(record.get("bytes")) is not int
            or record["bytes"] < 0
            or type(record.get("sha256")) is not str
        ):
            _fail(f"artifact {key} digest record is malformed")
        if len(record["sha256"]) != 64 or any(
            c not in "0123456789abcdef" for c in record["sha256"]
        ):
            _fail(f"artifact {key} SHA-256 is malformed")
        path = workdir / rel
        raw = _read(path)
        _same(len(raw), record.get("bytes"), f"artifact {key} byte count")
        _same(sha256_bytes(raw), record.get("sha256"), f"artifact {key} SHA-256")
        count += 1
    return count


def _validate_inventory(workdir: Path, summary: dict[str, Any]) -> dict[str, int]:
    """Reject unaccounted files, links, and unexpected permission classes."""
    top = {
        record["path"] for record in summary["artifacts"].values() if record is not None
    }
    top.update(
        {
            "summary.json",
            "all_order_diagnostic_certificate.json",
            "all_order_mining_summary.json",
        }
    )
    top.add("piqd-journal")
    _assert_directory(workdir)
    actual_top = {path.name for path in workdir.iterdir()}
    _same(actual_top, top, "top-level inventory")
    expected_dirs = {
        "piqd-journal",
        "piqd-journal/attempts",
        "piqd-journal/descriptors",
        "piqd-journal/attempts/attempt-00000000-a69826e5588cad4f",
        "piqd-journal/attempts/attempt-00000000-a69826e5588cad4f/attempt.jsonl.artifacts",
    }
    held_dirs = {".": _assert_directory(workdir)}
    held_dirs.update({rel: _assert_directory(workdir / rel) for rel in expected_dirs})
    actual_dirs = {
        str(path.relative_to(workdir)) for path in workdir.rglob("*") if path.is_dir()
    }
    _same(actual_dirs, expected_dirs, "complete-workdir directory inventory")
    for rel, before in held_dirs.items():
        after = _assert_directory(workdir if rel == "." else workdir / rel)
        if (before.st_dev, before.st_ino, before.st_nlink) != (
            after.st_dev,
            after.st_ino,
            after.st_nlink,
        ):
            _fail(f"directory identity changed during inventory: {rel}")
    regular = 0
    modes: dict[str, int] = {}
    for path in workdir.rglob("*"):
        if path.is_dir():
            if path.is_symlink():
                _fail(f"symlinked directory rejected: {path}")
            continue
        info = _regular(path)
        mode = stat.S_IMODE(info.st_mode)
        if mode not in {0o600, 0o644}:
            _fail(f"unexpected file mode {mode:o}: {path}")
        regular += 1
        modes[f"{mode:o}"] = modes.get(f"{mode:o}", 0) + 1
    _same(regular, 46, "complete-workdir regular-file count")
    return modes


def _validate_sources(job: dict[str, Any], repo_root: Path | None) -> str:
    sources = job.get("sources")
    if type(sources) is not list or len(sources) != 2932:
        _fail("job.sources must contain 2932 entries")
    seen: set[str] = set()
    for index, item in enumerate(sources):
        if type(item) is not dict or type(item.get("path")) is not str:
            _fail(f"job.sources[{index}] malformed")
        rel = item["path"]
        if rel in seen or Path(rel).is_absolute() or ".." in Path(rel).parts:
            _fail(f"job.sources[{index}] path is unsafe or duplicated")
        seen.add(rel)
        if (
            type(item.get("bytes")) is not int
            or item["bytes"] < 0
            or type(item.get("sha256")) is not str
        ):
            _fail(f"job.sources[{index}] digest record malformed")
        if len(item["sha256"]) != 64 or any(
            c not in "0123456789abcdef" for c in item["sha256"]
        ):
            _fail(f"job.sources[{index}] SHA-256 is malformed")
        if repo_root is not None:
            path = repo_root / Path(rel)
            _assert_native_under(path, repo_root)
            raw = _read(path)
            _same(len(raw), item["bytes"], f"live source {rel} byte count")
            _same(sha256_bytes(raw), item["sha256"], f"live source {rel} SHA-256")
    return "verified" if repo_root is not None else "manifest-only"


def _validate_piqd(workdir: Path, job: dict[str, Any]) -> dict[str, Any]:
    attempt_dir = (
        workdir / "piqd-journal" / "attempts" / "attempt-00000000-a69826e5588cad4f"
    )
    journal = attempt_dir / "attempt.jsonl"
    _assert_directory(workdir / "piqd-journal" / "attempts")
    _assert_directory(attempt_dir)
    attempt_dir = journal.parent
    journal_raw = _read(journal)
    lines = journal_raw.splitlines()
    records = [_strict_json(line, journal) for line in lines]
    if len(records) != 6:
        _fail("PIQD journal record count is not six")
    prior: str | None = None
    for index, record in enumerate(records):
        if type(record) is not dict:
            _fail(f"journal[{index}] is not an object")
        _same(
            record.get("schema"),
            "p97-cegar-wave-attempt/v1",
            f"journal[{index}] schema",
        )
        _same(record.get("attempt_index"), index, f"journal[{index}] index")
        _same(record.get("previous_attempt_sha256"), prior, f"journal[{index}] chain")
        _same(record.get("backend"), "cadical", f"journal[{index}] backend")
        _same(record.get("solver_profile"), "sat", f"journal[{index}] solver profile")
        _same(
            record.get("wave_manifest_sha256"),
            EXPECTED_WAVE_MANIFEST_SHA256,
            f"journal[{index}] wave manifest",
        )
        artifacts = record.get("artifacts")
        if type(artifacts) is not dict:
            _fail(f"journal[{index}] artifacts are malformed")
        _same(artifacts.get("cnf_sha256"), EXPECTED_CNF_SHA256, f"journal[{index}] CNF")
        checkpoint = artifacts.get("checkpoint_sha256")
        if type(checkpoint) is not str or len(checkpoint) != 64:
            _fail(f"journal[{index}] checkpoint digest is malformed")
        if index < 5:
            _same(
                artifacts.get("model_sha256"), None, f"journal[{index}] premature model"
            )
        else:
            _same(record.get("outcome"), "STRUCTURAL_SAT", "journal terminal outcome")
            _same(artifacts.get("model_sha256"), EXPECTED_MODEL_SHA256, "journal model")
            _same(
                artifacts.get("solver_log_sha256"),
                EXPECTED_SOLVER_LOG_SHA256,
                "journal solver log",
            )
        unsigned = dict(record)
        record_sha = unsigned.pop("record_sha256", None)
        _same(record_sha, sha256_json(unsigned), f"journal[{index}] record hash")
        prior = record_sha
    seal, seal_raw = _load(attempt_dir, "attempt.jsonl.seal.json")
    _same(seal_raw, canonical_json_bytes(seal) + b"\n", "journal seal canonical bytes")
    unsigned = dict(seal)
    seal_hash = unsigned.pop("seal_sha256", None)
    _same(seal_hash, sha256_json(unsigned), "journal seal hash")
    _same(seal_hash, EXPECTED_JOURNAL_SEAL_SHA256, "preserved journal seal identity")
    _same(seal.get("journal_sha256"), sha256_bytes(journal_raw), "journal seal bytes")
    _same(seal.get("record_count"), 6, "journal seal count")
    _same(seal.get("terminal_attempt_sha256"), prior, "journal terminal hash")
    descriptor_path = (
        workdir
        / "piqd-journal"
        / "descriptors"
        / f"descriptor-{EXPECTED_DESCRIPTOR_SHA256}.json"
    )
    descriptor_raw = _read(descriptor_path)
    descriptor = _strict_json(descriptor_raw, descriptor_path)
    _same(
        descriptor_raw,
        canonical_json_bytes(descriptor) + b"\n",
        "descriptor canonical bytes",
    )
    _same(
        sha256_bytes(descriptor_raw),
        EXPECTED_DESCRIPTOR_SHA256,
        "preserved descriptor identity",
    )
    _same(
        descriptor.get("schema"),
        "p97_rigid221_exact12_next_row_arm_static_piqd_descriptor.v1",
        "descriptor schema",
    )
    _same(descriptor.get("root_job_id"), job["job_id"], "descriptor root job")
    _same(descriptor.get("job_schema"), EXPECTED_JOB_SCHEMA, "descriptor job schema")
    _same(descriptor.get("job_sha256"), sha256_json(job), "descriptor job hash")
    _same(
        descriptor.get("sources_sha256"),
        EXPECTED_DESCRIPTOR_SOURCES_SHA256,
        "descriptor source manifest",
    )
    _same(
        descriptor.get("cnf"),
        {
            "bytes": 13133986,
            "clauses": EXPECTED_CLAUSES,
            "sha256": EXPECTED_CNF_SHA256,
            "variables": EXPECTED_VARIABLES,
        },
        "descriptor CNF identity",
    )
    _same(
        descriptor.get("cnf", {}).get("sha256"), EXPECTED_CNF_SHA256, "descriptor CNF"
    )
    _same(
        descriptor.get("certificate_blocker"), CERTIFICATE_BLOCKER, "descriptor blocker"
    )
    _same(
        descriptor.get("claims", {}).get("universal_lift"),
        False,
        "descriptor universal-lift claim",
    )
    receipt, receipt_raw = _load(attempt_dir, "solver-receipt.json")
    unsigned = dict(receipt)
    receipt_hash = unsigned.pop("receipt_sha256", None)
    _same(receipt_raw, canonical_json_bytes(receipt) + b"\n", "receipt canonical bytes")
    _same(receipt_hash, sha256_json(unsigned), "receipt self hash")
    _same(receipt_hash, EXPECTED_RECEIPT_SHA256, "preserved receipt identity")
    _same(
        sha256_bytes(receipt_raw),
        EXPECTED_RECEIPT_FILE_SHA256,
        "preserved receipt bytes",
    )
    _same(receipt.get("schema"), "p97-piqd-static-solver-receipt/v1", "receipt schema")
    _same(receipt.get("outcome"), "STRUCTURAL_SAT", "receipt outcome")
    _same(receipt.get("cnf_sha256"), EXPECTED_CNF_SHA256, "receipt CNF")
    _same(receipt.get("num_variables"), EXPECTED_VARIABLES, "receipt variable count")
    _same(receipt.get("num_clauses"), EXPECTED_CLAUSES, "receipt clause count")
    _same(receipt.get("adapter_verdict"), "SAT", "receipt verdict")
    _same(receipt.get("certificate_blocker"), CERTIFICATE_BLOCKER, "receipt blocker")
    _same(receipt.get("job_id"), EXPECTED_PIQD_JOB_ID, "receipt PIQD job")
    _same(
        receipt.get("source_manifest_sha256"),
        EXPECTED_SOURCE_MANIFEST_SHA256,
        "receipt source manifest",
    )
    _same(
        receipt.get("producer_manifest_sha256"),
        EXPECTED_PRODUCER_MANIFEST_SHA256,
        "receipt producer manifest",
    )
    _same(receipt.get("model_response_sha256"), EXPECTED_MODEL_SHA256, "receipt model")
    _same(
        receipt.get("seal_sha256"), EXPECTED_JOURNAL_SEAL_SHA256, "receipt journal seal"
    )
    _same(
        receipt.get("terminal_record_sha256"),
        seal.get("terminal_attempt_sha256"),
        "receipt terminal record",
    )
    _same(receipt.get("journal_record_count"), 6, "receipt journal record count")
    _same(
        receipt.get("job_identity", {}).get("cnf_blob_hash"),
        EXPECTED_CNF_SHA256,
        "receipt job identity CNF",
    )
    _same(
        receipt.get("job_identity", {}).get("job_id"),
        EXPECTED_PIQD_JOB_ID,
        "receipt job identity id",
    )
    _same(
        receipt.get("job_identity", {}).get("identity_hash"),
        EXPECTED_SOLVER_IDENTITY_SHA256,
        "receipt solver identity",
    )
    _same(
        receipt.get("terminal_status", {}).get("id"),
        EXPECTED_PIQD_JOB_ID,
        "receipt terminal job",
    )
    _same(
        receipt.get("terminal_status", {}).get("cnf_blob_hash"),
        EXPECTED_CNF_SHA256,
        "receipt terminal CNF",
    )
    _same(
        receipt.get("terminal_status", {}).get("backend"),
        "cadical",
        "receipt terminal backend",
    )
    _same(
        receipt.get("terminal_status", {}).get("result"),
        "SAT",
        "receipt terminal result",
    )
    _same(
        receipt.get("terminal_status", {}).get("project"),
        "p97-exact12-next-row-arm-static-cell6-v8-r1",
        "receipt terminal project",
    )
    _same(
        receipt.get("terminal_status", {}).get("requested_core_limit"),
        1,
        "receipt terminal core limit",
    )
    _same(
        receipt.get("terminal_status", {}).get("attested_solver_processes"),
        1,
        "receipt solver-process attestation",
    )
    _same(
        receipt.get("terminal_status_canonical_sha256"),
        "5b763ec1afdbcddf7c9ad7c69d402da469abc60a22a50398af9953a29b13a1e5",
        "receipt terminal canonical hash",
    )
    _same(
        receipt.get("terminal_status_raw_artifact_sha256"),
        "c0f8f07f34c8042653e495c3f0dc2a2ce06db0791cce40786dd82e412fb7d42d",
        "receipt terminal raw hash",
    )
    custody, custody_raw = _load(attempt_dir, "custody-seal.json")
    _same(
        custody_raw,
        canonical_json_bytes(custody) + b"\n",
        "custody seal canonical bytes",
    )
    unsigned_custody = dict(custody)
    custody_hash = unsigned_custody.pop("custody_seal_sha256", None)
    _same(custody_hash, sha256_json(unsigned_custody), "custody seal self hash")
    _same(custody_hash, EXPECTED_CUSTODY_SEAL_SHA256, "preserved custody seal identity")
    inventory = custody.get("inventory")
    if type(inventory) is not dict:
        _fail("custody inventory is missing")
    journal_info = _regular(journal)
    _same(
        inventory.get("journal_sha256"),
        sha256_bytes(journal_raw),
        "custody journal hash",
    )
    _same(inventory.get("journal_size"), len(journal_raw), "custody journal size")
    _same(inventory.get("journal_inode"), journal_info.st_ino, "custody journal inode")
    _same(
        inventory.get("journal_device"), journal_info.st_dev, "custody journal device"
    )
    lock = attempt_dir / "attempt.jsonl.lock"
    lock_raw = _read(lock)
    lock_info = _regular(lock)
    _same(len(lock_raw), 0, "attempt lock must be empty")
    _same(inventory.get("lock_inode"), lock_info.st_ino, "custody lock inode")
    _same(inventory.get("lock_device"), lock_info.st_dev, "custody lock device")
    attempt_info = _assert_directory(attempt_dir)
    _same(
        custody.get("attempt_directory_inode"),
        attempt_info.st_ino,
        "custody attempt inode",
    )
    _same(
        custody.get("attempt_directory_device"),
        attempt_info.st_dev,
        "custody attempt device",
    )
    artifact_dir = attempt_dir / "attempt.jsonl.artifacts"
    inventory_artifacts = inventory.get("artifacts")
    if type(inventory_artifacts) is not list or len(inventory_artifacts) != 13:
        _fail("custody artifact inventory must contain 13 entries")
    by_name: dict[str, dict[str, Any]] = {}
    for entry in inventory_artifacts:
        if type(entry) is not dict or type(entry.get("sha256")) is not str:
            _fail("malformed custody artifact entry")
        digest = entry["sha256"]
        if (
            len(digest) != 64
            or any(c not in "0123456789abcdef" for c in digest)
            or digest in by_name
        ):
            _fail("duplicate or malformed custody artifact digest")
        if type(entry.get("size")) is not int or entry["size"] < 0:
            _fail("malformed custody artifact size")
        by_name[digest] = entry
    _assert_directory(artifact_dir)
    actual_artifacts = list(artifact_dir.iterdir())
    _same(
        {path.name for path in actual_artifacts},
        set(by_name),
        "PIQD artifact filename inventory",
    )
    for path in actual_artifacts:
        info = _regular(path)
        entry = by_name[path.name]
        artifact_raw = _read(path)
        _same(len(artifact_raw), entry.get("size"), f"custody size {path.name}")
        _same(sha256_bytes(artifact_raw), path.name, f"custody digest {path.name}")
        _same(info.st_ino, entry.get("inode"), f"custody inode {path.name}")
        _same(info.st_dev, entry.get("device"), f"custody device {path.name}")
    source_manifest = _strict_json(
        _read(artifact_dir / EXPECTED_SOURCE_MANIFEST_SHA256),
        artifact_dir / EXPECTED_SOURCE_MANIFEST_SHA256,
    )
    _same(
        source_manifest.get("schema"),
        "p97-piqd-static-source/v1",
        "source manifest schema",
    )
    _same(
        source_manifest.get("source_sha256"),
        EXPECTED_DESCRIPTOR_SHA256,
        "source manifest descriptor",
    )
    _same(
        source_manifest.get("finite_schema"),
        EXPECTED_JOB_SCHEMA,
        "source manifest job schema",
    )
    producer_manifest = _strict_json(
        _read(artifact_dir / EXPECTED_PRODUCER_MANIFEST_SHA256),
        artifact_dir / EXPECTED_PRODUCER_MANIFEST_SHA256,
    )
    _same(
        producer_manifest.get("schema"),
        "p97-piqd-static-producer/v1",
        "producer manifest schema",
    )
    _same(
        producer_manifest.get("source_manifest_sha256"),
        EXPECTED_SOURCE_MANIFEST_SHA256,
        "producer source manifest",
    )
    _same(
        producer_manifest.get("variable_map_sha256"),
        EXPECTED_VARIABLE_MAP_SHA256,
        "producer variable map",
    )
    receipt_info = _regular(attempt_dir / "solver-receipt.json")
    _same(len(receipt_raw), custody.get("receipt_file_size"), "custody receipt size")
    _same(
        sha256_bytes(receipt_raw),
        custody.get("receipt_file_sha256"),
        "custody receipt bytes",
    )
    _same(receipt_info.st_ino, custody.get("receipt_inode"), "custody receipt inode")
    _same(receipt_info.st_dev, custody.get("receipt_device"), "custody receipt device")
    _same(
        custody.get("receipt_sha256"),
        EXPECTED_RECEIPT_SHA256,
        "custody receipt identity",
    )
    model_hash = receipt.get("model_response_sha256")
    if not isinstance(model_hash, str):
        _fail("receipt model hash missing")
    model_path = attempt_dir / "attempt.jsonl.artifacts" / model_hash
    _same(_hash_file(model_path), model_hash, "model artifact hash")
    model = _strict_json(_read(model_path), model_path)
    _same(model.get("result"), "SAT", "model result")
    _same(model.get("num_assigned"), EXPECTED_VARIABLES, "model assignment count")
    _same(model.get("job_id"), receipt.get("job_id"), "model underlying job id")
    return {
        "records": len(records),
        "journal_sha256": sha256_bytes(_read(journal)),
        "descriptor_sha256": sha256_bytes(_read(descriptor_path)),
        "receipt_sha256": sha256_bytes(receipt_raw),
        "model_sha256": model_hash,
        "underlying_job_id": receipt.get("job_id"),
        "custody_seal_sha256": custody_hash,
    }


def validate_arm_static_workdir(
    workdir: Path, *, repo_root: Path | None = None
) -> dict[str, Any]:
    """Validate one complete workdir without transport, solver, daemon, or Lean."""
    workdir = Path(workdir)
    _assert_directory(workdir)
    summary, _summary_raw = _load(workdir, "summary.json")
    job, job_raw = _load(workdir, "job.json")
    _same(sha256_bytes(job_raw), EXPECTED_JOB_SHA256, "preserved job identity")
    _same(summary.get("schema"), EXPECTED_SCHEMA, "summary schema")
    _same(job.get("schema"), EXPECTED_JOB_SCHEMA, "job schema")
    _same(summary.get("status"), "SAT_WITNESS_REPLAYED", "summary status")
    _same(
        summary.get("classification"),
        "STRUCTURALLY_UNRESOLVED",
        "summary classification",
    )
    _same(summary.get("discovery_verdict"), "SAT", "discovery verdict")
    _same(
        summary.get("replay"),
        {
            "added_constraints": True,
            "candidate": True,
            "canonical_static_extension": True,
            "exact_cnf": True,
            "named_deletion_arm": True,
        },
        "replay flags",
    )
    modes = _validate_inventory(workdir, summary)
    _same(job.get("job_id"), summary.get("job_id"), "job id")
    _same(job.get("job_id"), EXPECTED_JOB_ID, "preserved root job id")
    unsigned = dict(job)
    unsigned.pop("job_id", None)
    _same(job.get("job_id"), sha256_bytes(_json_bytes(unsigned)), "job id")
    _same(summary.get("job_sha256"), sha256_bytes(job_raw), "summary job byte hash")
    _same(summary.get("job_sha256"), EXPECTED_JOB_SHA256, "preserved summary job hash")
    cnf = job.get("cnf")
    _same(
        cnf,
        {
            "bytes": 13133986,
            "clauses": EXPECTED_CLAUSES,
            "sha256": EXPECTED_CNF_SHA256,
            "variables": EXPECTED_VARIABLES,
        },
        "job CNF identity",
    )
    _same(_validate_artifacts(workdir, summary), 24, "summary artifact count")
    survivor, survivor_raw = _load(workdir, "survivor.json")
    _same(
        sha256_bytes(survivor_raw),
        EXPECTED_SURVIVOR_SHA256,
        "preserved survivor identity",
    )
    _same(survivor.get("job_id"), job["job_id"], "survivor job id")
    positives = survivor.get("positive_variables")
    if (
        not isinstance(positives, list)
        or len(positives) != 30022
        or positives != sorted(positives)
    ):
        _fail("survivor positive-variable list is malformed")
    _same(
        survivor.get("assignment_sha256"),
        sha256_bytes(_json_bytes(positives)),
        "survivor assignment hash",
    )
    piqd = _validate_piqd(workdir, job)
    _validate_auxiliary(workdir)
    # Use the independently stored model, not a solver/model adapter.
    model_path = (
        workdir
        / "piqd-journal"
        / "attempts"
        / "attempt-00000000-a69826e5588cad4f"
        / "attempt.jsonl.artifacts"
        / EXPECTED_MODEL_SHA256
    )
    model = _strict_json(_read(model_path), model_path)
    dimacs = _validate_dimacs(workdir / "discovery.cnf", model["assignment"])
    sources = _validate_sources(job, repo_root)
    return {
        "valid": True,
        "status": summary["status"],
        "classification": summary["classification"],
        "finite_diagnostic_only": True,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "artifact_count": 24,
        "inventory_modes": modes,
        "source_verification": sources,
        "dimacs": dimacs,
        "piqd": piqd,
        "proof": "absent",
        "lean_ingress": False,
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path)
    args = parser.parse_args(argv)
    try:
        result = validate_arm_static_workdir(args.workdir, repo_root=args.repo_root)
    except ArmStaticWorkdirValidationError as exc:
        print(f"arm-static validation failed: {exc}")
        return 2
    print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
