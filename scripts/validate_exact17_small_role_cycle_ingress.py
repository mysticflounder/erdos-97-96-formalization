"""Independent fail-closed ingress for the exact-17 small-role-cycle package.

The receipt is evidence, not authority.  This gate retains descriptors for the
package root and every package member, replays the committed independent CNF
validator against the retained child descriptor, and reconstructs every JSON
object without importing the publisher.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import subprocess
import sys
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from types import ModuleType
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-small-role-cycle-package-v2"
PUBLISHER_PATH = ROOT / "scripts/publish_exact17_small_role_cycle_root.py"
VALIDATOR_PATH = ROOT / "scripts/validate_exact17_small_role_cycle_export.py"

PACKAGE_ENTRIES = frozenset(
    {
        "exact17-small-role-cycle.cnf",
        "independent-audit-report.json",
        "coverage-ledger.json",
        "export-receipt.json",
    }
)

INGRESS_SCHEMA = "p97-exact17-small-role-cycle-package-ingress/v1"
VALIDATION_SCHEMA = "p97-exact17-small-role-cycle-export-validation/v1"
AUDIT_SCHEMA = "p97-exact17-small-role-cycle-independent-audit/v1"
COVERAGE_SCHEMA = "p97-exact17-small-role-cycle-coverage-ledger/v2"
RECEIPT_SCHEMA = "p97-exact17-small-role-cycle-immutable-export-receipt/v2"
PROFILE_ID = "exact17-small-role-cycle"
LEAN_MEMORY_LIMIT = "-M32768"


class IngressValidationError(ValueError):
    """The package failed an identity, schema, replay, or custody check."""


class UnprovisionedError(IngressValidationError):
    """The production package has not yet been published."""


@dataclass(frozen=True)
class FilePin:
    sha256: str
    bytes: int
    commit: str | None = None


@dataclass(frozen=True)
class IngressPaths:
    package_root: Path = PACKAGE_ROOT
    parent: Path = (
        ROOT / "scratch/exact17-current-root-two-kalmanson-successor-package-v2/"
        "exact17-current-root-two-kalmanson-successor.cnf"
    )
    publisher: Path = PUBLISHER_PATH
    validator: Path = VALIDATOR_PATH
    lean_root: Path = (
        ROOT / "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenSmallRoleCycleRefinements.lean"
    )
    lean_export: Path = (
        ROOT / "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenSmallRoleCycleRefinementsExport.lean"
    )
    kalmanson_helper: Path = (
        ROOT / "lean/Erdos9796Proof/P97/ATail/KalmansonSmallRoleCycleSchemas.lean"
    )
    parent_lean_root: Path = (
        ROOT / "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements.lean"
    )
    parent_lean_export: Path = (
        ROOT / "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinementsExport.lean"
    )
    parent_model_receipt: Path = (
        ROOT / "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/"
        "successor-v1/artifacts/piqd-attempts/"
        "attempt-00000000-c2d5a4472eea7831/solver-receipt.json"
    )
    parent_model: Path = (
        ROOT / "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/"
        "successor-v1/artifacts/piqd-attempts/"
        "attempt-00000000-c2d5a4472eea7831/attempt.jsonl.artifacts/"
        "eb2ec98e3a8102a98174e592daa703c06aeccd7db2af4a980e7df580d8e913ec"
    )

    @property
    def child(self) -> Path:
        return self.package_root / "exact17-small-role-cycle.cnf"

    @property
    def audit_report(self) -> Path:
        return self.package_root / "independent-audit-report.json"

    @property
    def coverage_ledger(self) -> Path:
        return self.package_root / "coverage-ledger.json"

    @property
    def receipt(self) -> Path:
        return self.package_root / "export-receipt.json"


@dataclass(frozen=True)
class IngressSpec:
    source_commit: str
    parent_source_commit: str
    source_baseline_sha256: str
    publisher: FilePin
    validator: FilePin
    parent: FilePin
    child: FilePin
    lean_root: FilePin
    lean_export: FilePin
    kalmanson_helper: FilePin
    parent_lean_root: FilePin
    parent_lean_export: FilePin
    parent_model: FilePin
    parent_model_receipt: FilePin
    variables: int
    parent_clauses: int
    child_clauses: int
    suffix_sha256: str
    suffix_bytes: int
    suffix_clauses: int
    five_role_offset_choices: int
    four_role_offset_choices: int
    five_role_clauses: int
    four_role_clauses: int
    parent_subsuming_clauses: int
    parent_subsumed_suffix_clauses: int
    nonredundant_suffix_clauses: int
    shortest_parent_length_distribution: tuple[tuple[str, int], ...]
    family_shortest_parent_length_distribution: tuple[tuple[str, int, int], ...]
    parent_exact_duplicate_suffix_clauses: int
    redundancy_witness_sha256: str
    redundancy_witness_bytes: int
    model_falsified_nonredundant_indices: tuple[int, ...]


PRODUCTION_PATHS = IngressPaths()
PRODUCTION_SPEC = IngressSpec(
    source_commit="f05c5699b50e64c559f58a9fea62192f1a51983d",
    parent_source_commit="057ea2af8df5755c7130f23f52c35907d49ae5a5",
    source_baseline_sha256=(
        "3c7e053d0cc4f33bff804b80900cdf7d309ca4b340d50e2402f63430f4a1e68d"
    ),
    publisher=FilePin(
        "eca9bf297387e2feb258b6ef7c85a032cb00875fc02f4f2777ce93cb691cad11",
        53_805,
        "b08ffa990154be39546350683eda2c38ec567706",
    ),
    validator=FilePin(
        "d30660888cb713f2a0744039146197da5c38639c5cdcdfafa0bda772b82ed836",
        36_158,
        "fef0b6d8e62ff78466e18f93069fef102bb6efc1",
    ),
    parent=FilePin(
        "c2d5a4472eea783152919078da45083ad31835a407a75e22150bf2eae63cd3e8",
        333_050_318,
    ),
    child=FilePin(
        "4c47a61712cd4c1d465ea7984189e938b5a2422553adc3e962b7209ee285430d",
        338_644_740,
    ),
    lean_root=FilePin(
        "3c7e053d0cc4f33bff804b80900cdf7d309ca4b340d50e2402f63430f4a1e68d",
        20_762,
        "f05c5699b50e64c559f58a9fea62192f1a51983d",
    ),
    lean_export=FilePin(
        "6216598203f0cd96d380b1391368b1a366400610d8b2a7f79edc39c7b337a8b6",
        1_262,
        "f05c5699b50e64c559f58a9fea62192f1a51983d",
    ),
    kalmanson_helper=FilePin(
        "176f894b9698bb50c763b73440c86a0b622c2fb747987348769ad080e5744028",
        19_361,
        "f05c5699b50e64c559f58a9fea62192f1a51983d",
    ),
    parent_lean_root=FilePin(
        "0fb8317d17a0085334f7a2885361c0ea51da52ec1e2c8cfc857dfb641d2c1638",
        146_300,
        "057ea2af8df5755c7130f23f52c35907d49ae5a5",
    ),
    parent_lean_export=FilePin(
        "eb4c9e5e2878079ed5d60e096fefb5d198e6b663e4c7098bcbd03eefb9bbf033",
        1_362,
        "057ea2af8df5755c7130f23f52c35907d49ae5a5",
    ),
    parent_model=FilePin(
        "eb2ec98e3a8102a98174e592daa703c06aeccd7db2af4a980e7df580d8e913ec",
        1_503,
    ),
    parent_model_receipt=FilePin(
        "d17cdb7b58aabedd9163cf51aa9ae8245f2f8a4ee14fac5b986bc7982bdf0ba7",
        33_117,
    ),
    variables=308,
    parent_clauses=7_037_500,
    child_clauses=7_198_388,
    suffix_sha256=("acb18958281bc2f97ba41b873e7f503cd81a68b8d4a82f2b78b292a7584d8d37"),
    suffix_bytes=5_594_422,
    suffix_clauses=160_888,
    five_role_offset_choices=1_820,
    four_role_offset_choices=546,
    five_role_clauses=123_760,
    four_role_clauses=37_128,
    parent_subsuming_clauses=276,
    parent_subsumed_suffix_clauses=64_097,
    nonredundant_suffix_clauses=96_791,
    shortest_parent_length_distribution=(("1", 62_537), ("2", 1_416), ("7", 144)),
    family_shortest_parent_length_distribution=(
        ("five", 1, 48_519),
        ("five", 2, 1_056),
        ("five", 7, 101),
        ("four", 1, 14_018),
        ("four", 2, 360),
        ("four", 7, 43),
    ),
    parent_exact_duplicate_suffix_clauses=204,
    redundancy_witness_sha256=(
        "379840e715642dd76adbb64a7ee11ac00805d3aff2a45e30ef1dbfba64900a03"
    ),
    redundancy_witness_bytes=850_436,
    model_falsified_nonredundant_indices=(
        87_731,
        94_189,
        106_818,
        109_198,
        149_786,
        154_928,
        156_728,
    ),
)


@dataclass(frozen=True)
class FileState:
    device: int
    inode: int
    mode: int
    nlink: int
    size: int
    mtime_ns: int
    ctime_ns: int


@dataclass
class BoundFile:
    path: Path
    fd: int
    state: FileState
    sha256: str
    bytes: int
    closed: bool = False


@dataclass
class PackageBinding:
    path: Path
    ancestor_fd: int
    root_fd: int
    ancestor_identity: tuple[int, int]
    root_state: FileState
    files: dict[str, BoundFile]
    closed: bool = False


GitReader = Callable[[str, Path], bytes]
Replay = Callable[
    [IngressPaths, IngressSpec, dict[str, BoundFile], dict[str, BoundFile], bytes],
    dict[str, Any],
]


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise IngressValidationError(message)


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(path))


def canonical_json_bytes(value: object) -> bytes:
    return (
        json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
        + "\n"
    ).encode()


def _type_exact_equal(observed: object, expected: object) -> bool:
    """Compare JSON-like values without Python's bool/int/float aliases."""

    if type(observed) is not type(expected):
        return False
    if isinstance(expected, dict):
        if len(observed) != len(expected):
            return False
        return all(
            key in observed and _type_exact_equal(observed[key], value)
            for key, value in expected.items()
        )
    if isinstance(expected, (list, tuple)):
        return len(observed) == len(expected) and all(
            _type_exact_equal(observed_value, expected_value)
            for observed_value, expected_value in zip(observed, expected, strict=True)
        )
    return observed == expected


def _is_lower_hex(value: object, length: int) -> bool:
    return (
        type(value) is str
        and len(value) == length
        and all(character in "0123456789abcdef" for character in value)
    )


def _validate_pin(pin: FilePin, label: str) -> None:
    _require(_is_lower_hex(pin.sha256, 64), f"{label} SHA-256 pin is malformed")
    _require(type(pin.bytes) is int and pin.bytes >= 0, f"{label} byte pin is invalid")
    if pin.commit is not None:
        _require(_is_lower_hex(pin.commit, 40), f"{label} commit pin is malformed")


def _validate_spec(spec: IngressSpec) -> None:
    _require(_is_lower_hex(spec.source_commit, 40), "source commit pin is malformed")
    _require(
        _is_lower_hex(spec.parent_source_commit, 40),
        "parent source commit pin is malformed",
    )
    _require(
        _is_lower_hex(spec.source_baseline_sha256, 64),
        "source baseline pin is malformed",
    )
    for label in (
        "publisher",
        "validator",
        "parent",
        "child",
        "lean_root",
        "lean_export",
        "kalmanson_helper",
        "parent_lean_root",
        "parent_lean_export",
        "parent_model",
        "parent_model_receipt",
    ):
        _validate_pin(getattr(spec, label), label.replace("_", " "))
    _require(spec.publisher.commit is not None, "publisher commit pin is required")
    _require(spec.validator.commit is not None, "validator commit pin is required")
    _require(
        spec.lean_root.commit == spec.source_commit
        and spec.lean_export.commit == spec.source_commit
        and spec.kalmanson_helper.commit == spec.source_commit,
        "child Lean source commit pins disagree",
    )
    _require(
        spec.parent_lean_root.commit == spec.parent_source_commit
        and spec.parent_lean_export.commit == spec.parent_source_commit,
        "parent Lean source commit pins disagree",
    )
    _require(
        spec.source_baseline_sha256 == spec.lean_root.sha256,
        "source baseline does not bind the Lean root",
    )
    _require(
        len(spec.model_falsified_nonredundant_indices) == 7,
        "exactly seven parent-model cut indices are required",
    )
    _require(
        tuple(sorted(spec.model_falsified_nonredundant_indices))
        == spec.model_falsified_nonredundant_indices,
        "parent-model cut indices must be strictly ordered",
    )


def _required_open_flag(name: str) -> int:
    value = getattr(os, name, None)
    if type(value) is not int or value == 0:
        raise IngressValidationError(f"required open flag {name} is unavailable")
    return value


def _directory_flags() -> int:
    return (
        os.O_RDONLY
        | _required_open_flag("O_DIRECTORY")
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC")
    )


def _file_flags() -> int:
    return (
        os.O_RDONLY
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC")
    )


def _state(fd: int) -> FileState:
    value = os.fstat(fd)
    return FileState(
        value.st_dev,
        value.st_ino,
        value.st_mode,
        value.st_nlink,
        value.st_size,
        value.st_mtime_ns,
        value.st_ctime_ns,
    )


def _open_directory_nofollow(path: Path) -> int:
    absolute = _absolute(path)
    parts = absolute.parts
    _require(bool(parts) and absolute.anchor, f"unsafe directory path: {path}")
    flags = _directory_flags()
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in parts[1:]:
            child: int | None = None
            try:
                child = os.open(component, flags, dir_fd=descriptor)
                named = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
                opened = os.fstat(child)
                _require(stat.S_ISDIR(opened.st_mode), f"not a directory: {path}")
                _require(
                    (named.st_dev, named.st_ino) == (opened.st_dev, opened.st_ino),
                    f"directory component changed while opening: {path}",
                )
                os.close(descriptor)
                descriptor = child
                child = None
            finally:
                if child is not None:
                    os.close(child)
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _open_regular_at(directory_fd: int, name: str, path: Path) -> int:
    descriptor: int | None = None
    try:
        descriptor = os.open(name, _file_flags(), dir_fd=directory_fd)
        named = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        opened = os.fstat(descriptor)
        _require(stat.S_ISREG(opened.st_mode), f"not a regular file: {path}")
        _require(opened.st_nlink == 1, f"file is not singly linked: {path}")
        _require(
            (named.st_dev, named.st_ino) == (opened.st_dev, opened.st_ino),
            f"file changed while opening: {path}",
        )
        result = descriptor
        descriptor = None
        return result
    except OSError as error:
        raise IngressValidationError(
            f"cannot open without following links: {path}"
        ) from error
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _open_regular_nofollow(path: Path) -> int:
    absolute = _absolute(path)
    parent = _open_directory_nofollow(absolute.parent)
    try:
        return _open_regular_at(parent, absolute.name, absolute)
    finally:
        os.close(parent)


def _hash_fd(fd: int, label: str) -> tuple[FileState, str, int]:
    before = _state(fd)
    _require(stat.S_ISREG(before.mode), f"{label} is not a regular file")
    _require(before.nlink == 1, f"{label} is not singly linked")
    digest = hashlib.sha256()
    offset = 0
    while block := os.pread(fd, 1 << 20, offset):
        digest.update(block)
        offset += len(block)
    after = _state(fd)
    _require(before == after, f"{label} changed while hashing")
    _require(offset == before.size, f"{label} byte count changed while hashing")
    return before, digest.hexdigest(), offset


def _bind_fd(path: Path, fd: int, label: str) -> BoundFile:
    state, sha256, byte_count = _hash_fd(fd, label)
    return BoundFile(_absolute(path), fd, state, sha256, byte_count)


def _close_bound(bound: BoundFile) -> None:
    if not bound.closed:
        os.close(bound.fd)
        bound.closed = True


def _open_package(path: Path) -> PackageBinding:
    absolute = _absolute(path)
    try:
        ancestor_fd = _open_directory_nofollow(absolute.parent)
    except FileNotFoundError as error:
        raise UnprovisionedError(
            f"UNPROVISIONED: package ancestor is absent: {absolute.parent}"
        ) from error
    root_fd: int | None = None
    files: dict[str, BoundFile] = {}
    try:
        try:
            root_fd = os.open(absolute.name, _directory_flags(), dir_fd=ancestor_fd)
        except FileNotFoundError as error:
            raise UnprovisionedError(
                f"UNPROVISIONED: package is absent: {absolute}"
            ) from error
        named = os.stat(absolute.name, dir_fd=ancestor_fd, follow_symlinks=False)
        opened = os.fstat(root_fd)
        _require(
            stat.S_ISDIR(opened.st_mode), f"package root is not a directory: {absolute}"
        )
        _require(
            (named.st_dev, named.st_ino) == (opened.st_dev, opened.st_ino),
            "package root changed while opening",
        )
        observed = os.listdir(root_fd)
        _require(
            len(observed) == len(PACKAGE_ENTRIES) and set(observed) == PACKAGE_ENTRIES,
            "package must contain exactly the four authorized entries",
        )
        for name in sorted(PACKAGE_ENTRIES):
            member_path = absolute / name
            member_fd = _open_regular_at(root_fd, name, member_path)
            files[name] = _bind_fd(member_path, member_fd, f"package entry {name}")
        return PackageBinding(
            absolute,
            ancestor_fd,
            root_fd,
            (os.fstat(ancestor_fd).st_dev, os.fstat(ancestor_fd).st_ino),
            _state(root_fd),
            files,
        )
    except BaseException:
        for bound in files.values():
            _close_bound(bound)
        if root_fd is not None:
            os.close(root_fd)
        os.close(ancestor_fd)
        raise


def _close_package(package: PackageBinding) -> None:
    if package.closed:
        return
    for bound in package.files.values():
        _close_bound(bound)
    os.close(package.root_fd)
    os.close(package.ancestor_fd)
    package.closed = True


def _assert_file_rebound(bound: BoundFile, *, rehash: bool) -> None:
    _require(not bound.closed, f"closed descriptor for {bound.path}")
    current = _state(bound.fd)
    _require(current == bound.state, f"retained file changed: {bound.path}")
    reopened = _open_regular_nofollow(bound.path)
    try:
        named_state = _state(reopened)
        _require(
            (named_state.device, named_state.inode)
            == (bound.state.device, bound.state.inode),
            f"file pathname rebound: {bound.path}",
        )
    finally:
        os.close(reopened)
    if rehash:
        state, sha256, byte_count = _hash_fd(bound.fd, str(bound.path))
        _require(
            (state, sha256, byte_count) == (bound.state, bound.sha256, bound.bytes),
            f"file content mutated: {bound.path}",
        )


def _assert_package_rebound(package: PackageBinding) -> None:
    ancestor_now = os.fstat(package.ancestor_fd)
    _require(
        (ancestor_now.st_dev, ancestor_now.st_ino) == package.ancestor_identity,
        "retained package ancestor changed",
    )
    reopened_ancestor = _open_directory_nofollow(package.path.parent)
    try:
        reopened_identity = (
            os.fstat(reopened_ancestor).st_dev,
            os.fstat(reopened_ancestor).st_ino,
        )
        _require(
            reopened_identity == package.ancestor_identity,
            "package ancestor pathname rebound",
        )
        for parent_fd in (package.ancestor_fd, reopened_ancestor):
            named = os.stat(package.path.name, dir_fd=parent_fd, follow_symlinks=False)
            _require(
                (named.st_dev, named.st_ino)
                == (package.root_state.device, package.root_state.inode),
                "package root pathname rebound",
            )
    finally:
        os.close(reopened_ancestor)
    _require(_state(package.root_fd) == package.root_state, "package root changed")
    observed = os.listdir(package.root_fd)
    _require(
        len(observed) == len(PACKAGE_ENTRIES) and set(observed) == PACKAGE_ENTRIES,
        "package allowlist changed after validation",
    )
    for name in sorted(PACKAGE_ENTRIES):
        bound = package.files[name]
        named = os.stat(name, dir_fd=package.root_fd, follow_symlinks=False)
        _require(
            (named.st_dev, named.st_ino) == (bound.state.device, bound.state.inode),
            f"package entry rebound after validation: {name}",
        )
        _assert_file_rebound(bound, rehash=True)


def _git_show(commit: str, path: Path) -> bytes:
    try:
        relative = path.relative_to(ROOT)
        result = subprocess.run(
            ["git", "show", f"{commit}:{relative}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        )
    except (subprocess.CalledProcessError, ValueError) as error:
        raise IngressValidationError(
            f"committed source is unavailable: {path} at {commit}"
        ) from error
    return result.stdout


def _input_definitions(
    paths: IngressPaths, spec: IngressSpec
) -> tuple[tuple[str, Path, FilePin], ...]:
    return (
        ("parent_cnf", paths.parent, spec.parent),
        ("publisher_script", paths.publisher, spec.publisher),
        ("independent_audit_script", paths.validator, spec.validator),
        ("lean_root", paths.lean_root, spec.lean_root),
        ("lean_export", paths.lean_export, spec.lean_export),
        ("kalmanson_helper", paths.kalmanson_helper, spec.kalmanson_helper),
        ("parent_lean_root", paths.parent_lean_root, spec.parent_lean_root),
        ("parent_lean_export", paths.parent_lean_export, spec.parent_lean_export),
        ("parent_model", paths.parent_model, spec.parent_model),
        ("parent_model_receipt", paths.parent_model_receipt, spec.parent_model_receipt),
    )


def _authenticate_inputs(
    paths: IngressPaths, spec: IngressSpec, git_reader: GitReader
) -> tuple[dict[str, BoundFile], dict[str, bytes]]:
    bindings: dict[str, BoundFile] = {}
    committed: dict[str, bytes] = {}
    try:
        for key, path, pin in _input_definitions(paths, spec):
            descriptor = _open_regular_nofollow(path)
            bound = _bind_fd(path, descriptor, key.replace("_", " "))
            bindings[key] = bound
            _require(
                (bound.sha256, bound.bytes) == (pin.sha256, pin.bytes),
                f"{key.replace('_', ' ')} live identity drifted",
            )
            if pin.commit is not None:
                raw = git_reader(pin.commit, _absolute(path))
                _require(
                    (hashlib.sha256(raw).hexdigest(), len(raw))
                    == (pin.sha256, pin.bytes),
                    f"{key.replace('_', ' ')} committed identity drifted",
                )
                committed[key] = raw
        return bindings, committed
    except BaseException:
        for bound in bindings.values():
            _close_bound(bound)
        raise


def _close_inputs(bindings: dict[str, BoundFile]) -> None:
    for bound in bindings.values():
        _close_bound(bound)


def _record(bound: BoundFile) -> dict[str, object]:
    return {
        "path": str(bound.path),
        "sha256": bound.sha256,
        "bytes": bound.bytes,
    }


def _expected_redundancy(spec: IngressSpec) -> dict[str, object]:
    return {
        "parent_subsuming_clauses": spec.parent_subsuming_clauses,
        "parent_subsumed_suffix_clauses": spec.parent_subsumed_suffix_clauses,
        "nonredundant_suffix_clauses": spec.nonredundant_suffix_clauses,
        "shortest_parent_length_distribution": dict(
            spec.shortest_parent_length_distribution
        ),
        "family_shortest_parent_length_distribution": [
            {"family": family, "length": length, "count": count}
            for family, length, count in spec.family_shortest_parent_length_distribution
        ],
        "parent_exact_duplicate_suffix_clauses": (
            spec.parent_exact_duplicate_suffix_clauses
        ),
        "witness_serialization": (
            "ASCII `<suffix_index> <minimal-length-then-first-parent-index>\\n`, "
            "suffix index ascending"
        ),
        "witness_rows": spec.parent_subsumed_suffix_clauses,
        "witness_bytes": spec.redundancy_witness_bytes,
        "witness_sha256": spec.redundancy_witness_sha256,
    }


def _expected_validation(paths: IngressPaths, spec: IngressSpec) -> dict[str, Any]:
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "source_baseline_sha256": spec.source_baseline_sha256,
        "source_commit": spec.source_commit,
        "parent_source_commit": spec.parent_source_commit,
        "variables": spec.variables,
        "parent": {
            "path": str(_absolute(paths.parent)),
            "sha256": spec.parent.sha256,
            "bytes": spec.parent.bytes,
            "clauses": spec.parent_clauses,
        },
        "child": {
            "path": str(_absolute(paths.child)),
            "sha256": spec.child.sha256,
            "bytes": spec.child.bytes,
            "clauses": spec.child_clauses,
        },
        "suffix": {
            "sha256": spec.suffix_sha256,
            "bytes": spec.suffix_bytes,
            "clauses": spec.suffix_clauses,
            "generator": "independent-python-exact17-small-role-cycle-generator/v1",
            "five_role_clauses": spec.five_role_clauses,
            "four_role_clauses": spec.four_role_clauses,
            "five_role_offset_choices": spec.five_role_offset_choices,
            "four_role_offset_choices": spec.four_role_offset_choices,
            "named_orders": 2,
            "directions": 2,
            "cuts": 17,
            "semantic_duplicates": 0,
            "redundancy": _expected_redundancy(spec),
        },
        "parent_model": {
            "path": str(_absolute(paths.parent_model)),
            "sha256": spec.parent_model.sha256,
            "bytes": spec.parent_model.bytes,
            "receipt_path": str(_absolute(paths.parent_model_receipt)),
            "receipt_sha256": spec.parent_model_receipt.sha256,
            "receipt_bytes": spec.parent_model_receipt.bytes,
            "independently_satisfies_parent": True,
            "falsified_nonredundant_suffix_indices": list(
                spec.model_falsified_nonredundant_indices
            ),
        },
        "lean": {
            "root_sha256": spec.lean_root.sha256,
            "export_sha256": spec.lean_export.sha256,
            "kalmanson_helper_sha256": spec.kalmanson_helper.sha256,
        },
        "parent_lean": {
            "root_sha256": spec.parent_lean_root.sha256,
            "export_sha256": spec.parent_lean_export.sha256,
        },
    }


def _expected_audit(
    validation: dict[str, Any], inputs: dict[str, BoundFile]
) -> dict[str, Any]:
    return {
        "schema": AUDIT_SCHEMA,
        "status": "PASS",
        "validator": _record(inputs["independent_audit_script"]),
        "validation": validation,
    }


def _expected_ledger(validation: dict[str, Any], spec: IngressSpec) -> dict[str, Any]:
    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": PROFILE_ID,
        "source": {
            "commit": spec.source_commit,
            "baseline_sha256": spec.source_baseline_sha256,
            "lean_root_sha256": spec.lean_root.sha256,
            "lean_export_sha256": spec.lean_export.sha256,
            "kalmanson_helper_sha256": spec.kalmanson_helper.sha256,
            "theorem": (
                "Problem97.ATailBlockerVExactSeventeenSmallRoleCycleRefinements."
                "sourceAssign_extendedSmallRoleCycleCnf"
            ),
            "terminal_adapter": (
                "Problem97.ATailBlockerVExactSeventeenSmallRoleCycleRefinements."
                "false_of_sourceRealization_of_extendedSmallRoleCycleCnf_unsat"
            ),
        },
        "parent": {
            "source_commit": spec.parent_source_commit,
            "sha256": spec.parent.sha256,
            "bytes": spec.parent.bytes,
            "clauses": spec.parent_clauses,
        },
        "child": validation["child"],
        "enumeration": {
            "five_role_offset_choices": spec.five_role_offset_choices,
            "four_role_offset_choices": spec.four_role_offset_choices,
            "five_role_clauses": spec.five_role_clauses,
            "four_role_clauses": spec.four_role_clauses,
            "clauses": spec.suffix_clauses,
            "bytes": spec.suffix_bytes,
            "ordered_suffix_sha256": spec.suffix_sha256,
            "named_orders": 2,
            "directions": 2,
            "cuts": 17,
        },
        "redundancy": validation["suffix"]["redundancy"],
        "parent_model_cuts": {
            "model_sha256": validation["parent_model"]["sha256"],
            "model_receipt_sha256": validation["parent_model"]["receipt_sha256"],
            "falsified_nonredundant_suffix_indices": validation["parent_model"][
                "falsified_nonredundant_suffix_indices"
            ],
        },
        "lean_export": {"memory_limit": LEAN_MEMORY_LIMIT, "direct_export": True},
        "tooling": {
            "validator_source_commit": spec.validator.commit,
            "validator_sha256": spec.validator.sha256,
            "validator_bytes": spec.validator.bytes,
            "publisher_source_commit": spec.publisher.commit,
            "publisher_sha256": spec.publisher.sha256,
            "publisher_bytes": spec.publisher.bytes,
        },
        "claims": {
            "source_entitlement": True,
            "theorem_coverage": True,
            "parent_model_cut_count": 7,
            "exact17_closure": False,
            "lean_closure": False,
            "universal_lift": False,
        },
    }


def _expected_receipt(
    paths: IngressPaths,
    spec: IngressSpec,
    validation: dict[str, Any],
    inputs: dict[str, BoundFile],
    package: PackageBinding,
) -> dict[str, Any]:
    artifacts = {
        key: _record(inputs[key])
        for key in (
            "parent_cnf",
            "lean_root",
            "lean_export",
            "kalmanson_helper",
            "parent_model",
            "parent_model_receipt",
            "publisher_script",
            "independent_audit_script",
        )
    }
    artifacts.update(
        {
            "child_cnf": _record(package.files[paths.child.name]),
            "independent_audit_report": _record(package.files[paths.audit_report.name]),
            "coverage_ledger": _record(package.files[paths.coverage_ledger.name]),
        }
    )
    return {
        "schema": RECEIPT_SCHEMA,
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "profile_id": PROFILE_ID,
        "source_commit": spec.source_commit,
        "source_baseline_sha256": spec.source_baseline_sha256,
        "parent_source_commit": spec.parent_source_commit,
        "validator_source_commit": spec.validator.commit,
        "publisher_source_commit": spec.publisher.commit,
        "parent": validation["parent"],
        "child": validation["child"],
        "ordered_suffix": validation["suffix"],
        "parent_model": validation["parent_model"],
        "ingress_policy": {
            "receipt_alone_sufficient": False,
            "directory_enumeration": "retained-fd-exact-allowlist",
            "required_package_entries": sorted(PACKAGE_ENTRIES),
        },
        "artifacts": artifacts,
        "source_imports": {
            "parent_lean_root": _record(inputs["parent_lean_root"]),
            "parent_lean_export": _record(inputs["parent_lean_export"]),
        },
        "coverage_ledger": {
            "schema": COVERAGE_SCHEMA,
            "sha256": package.files[paths.coverage_ledger.name].sha256,
        },
        "lean_export": {
            "memory_limit": LEAN_MEMORY_LIMIT,
            "command_shape": "lake env lean -M32768 --run <exporter> <output>",
        },
        "policy": {
            "direct_lean_export": True,
            "exact_parent_body_prefix": True,
            "independent_suffix_replay": True,
            "exact_redundancy_census": True,
            "authenticated_parent_model_cuts": True,
            "final_child_revalidated": True,
            "component_wise_nofollow": True,
            "candidate_reserved_inode": True,
            "candidate_private_workspace": True,
            "candidate_fsynced_before_exclusive_commit": True,
            "atomic_exclusive_commit": True,
            "unsafe_pathname_rollback": False,
            "publisher_committed_baseline": True,
            "validator_committed_baseline": True,
            "create_once": True,
            "receipt_written_last": True,
            "ingress_requires_exact_package_allowlist": True,
            "receipt_is_not_standalone_ingress_authority": True,
            "new_solver_result_claimed": False,
        },
    }


def _strict_canonical_json(raw: bytes, label: str) -> dict[str, Any]:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise IngressValidationError(f"{label} has duplicate key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(
                IngressValidationError(f"{label} has invalid constant {value}")
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        raise IngressValidationError(f"{label} is not strict JSON") from error
    _require(type(value) is dict, f"{label} must be a JSON object")
    _require(raw == canonical_json_bytes(value), f"{label} is not canonical JSON")
    return value


def _read_bound(bound: BoundFile) -> bytes:
    return os.pread(bound.fd, bound.bytes + 1, 0)


def _load_committed_validator(raw: bytes, path: Path) -> ModuleType:
    name = f"_exact17_small_role_committed_{hashlib.sha256(raw).hexdigest()[:16]}"
    module = ModuleType(name)
    module.__file__ = str(path)
    module.__package__ = ""
    sys.modules[name] = module
    try:
        # Execute the already SHA-256/byte/commit-authenticated source bytes;
        # reopening the live pathname here would reintroduce a validation race.
        exec(compile(raw, str(path), "exec"), module.__dict__)  # noqa: S102
    except BaseException:
        sys.modules.pop(name, None)
        raise
    return module


def _committed_replay(
    paths: IngressPaths,
    _spec: IngressSpec,
    package_files: dict[str, BoundFile],
    inputs: dict[str, BoundFile],
    validator_raw: bytes,
) -> dict[str, Any]:
    module = _load_committed_validator(validator_raw, paths.validator)
    original_open = getattr(module, "_open_regular_nofollow", None)
    _require(callable(original_open), "committed validator lacks nofollow opener")
    mapping = {
        str(bound.path): bound
        for bound in (*inputs.values(), package_files[paths.child.name])
    }

    def retained_open(path: Path) -> Any:
        bound = mapping.get(str(_absolute(path)))
        if bound is None:
            return original_open(path)
        _require(_state(bound.fd) == bound.state, f"validator input changed: {path}")
        os.lseek(bound.fd, 0, os.SEEK_SET)
        return os.fdopen(os.dup(bound.fd), "rb", closefd=True)

    module._open_regular_nofollow = retained_open
    try:
        validate = getattr(module, "_validate_export", None)
        production_spec = getattr(module, "PRODUCTION_SPEC", None)
        _require(
            callable(validate), "committed validator lacks full replay entry point"
        )
        result = validate(
            paths.parent,
            paths.child,
            check_support=True,
            spec=production_spec,
        )
    finally:
        module._open_regular_nofollow = original_open
        sys.modules.pop(module.__name__, None)
    _require(type(result) is dict, "committed validator returned a non-object")
    return result


def _validate_core(
    paths: IngressPaths,
    spec: IngressSpec,
    *,
    git_reader: GitReader,
    replay: Replay,
) -> dict[str, Any]:
    _validate_spec(spec)
    package = _open_package(paths.package_root)
    inputs: dict[str, BoundFile] = {}
    try:
        child = package.files[paths.child.name]
        _require(
            (child.sha256, child.bytes) == (spec.child.sha256, spec.child.bytes),
            "published child identity drifted",
        )
        inputs, committed = _authenticate_inputs(paths, spec, git_reader)
        validator_raw = committed.get("independent_audit_script")
        _require(validator_raw is not None, "committed validator bytes are unavailable")
        try:
            validation = replay(paths, spec, package.files, inputs, validator_raw)
        except IngressValidationError:
            raise
        except Exception as error:
            raise IngressValidationError("committed validator replay failed") from error
        expected_validation = _expected_validation(paths, spec)
        _require(
            _type_exact_equal(validation, expected_validation),
            "committed validator result is not the exact authorized census",
        )

        # This is deliberately after the expensive parent/CNF replay.
        _assert_package_rebound(package)
        for bound in inputs.values():
            _assert_file_rebound(bound, rehash=True)

        audit = _strict_canonical_json(
            _read_bound(package.files[paths.audit_report.name]), "audit report"
        )
        ledger = _strict_canonical_json(
            _read_bound(package.files[paths.coverage_ledger.name]), "coverage ledger"
        )
        receipt = _strict_canonical_json(
            _read_bound(package.files[paths.receipt.name]), "export receipt"
        )
        _require(
            _type_exact_equal(audit, _expected_audit(expected_validation, inputs)),
            "audit report object or schema drifted",
        )
        _require(
            _type_exact_equal(ledger, _expected_ledger(expected_validation, spec)),
            "coverage ledger object or schema drifted",
        )
        _require(
            _type_exact_equal(
                receipt,
                _expected_receipt(paths, spec, expected_validation, inputs, package),
            ),
            "export receipt object, bindings, policy, or ingress fields drifted",
        )
        return {
            "schema": INGRESS_SCHEMA,
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "profile_id": PROFILE_ID,
            "package_root": str(_absolute(paths.package_root)),
            "required_package_entries": sorted(PACKAGE_ENTRIES),
            "child": {
                **_record(child),
                "variables": spec.variables,
                "clauses": spec.child_clauses,
            },
            "audit_report": _record(package.files[paths.audit_report.name]),
            "coverage_ledger": _record(package.files[paths.coverage_ledger.name]),
            "export_receipt": {
                **_record(package.files[paths.receipt.name]),
                "schema": RECEIPT_SCHEMA,
            },
            "validation": {
                "committed_validator_full_replay": True,
                "check_support": True,
                "exact_redundancy_census": True,
                "parent_model_cut_indices": list(
                    spec.model_falsified_nonredundant_indices
                ),
            },
        }
    finally:
        _close_inputs(inputs)
        _close_package(package)


def validate_ingress() -> dict[str, Any]:
    """Run the immutable production package gate."""

    return _validate_core(
        PRODUCTION_PATHS,
        PRODUCTION_SPEC,
        git_reader=_git_show,
        replay=_committed_replay,
    )


def production_static_check() -> dict[str, Any]:
    """Alias used by launchers that require a static pre-launch gate."""

    return validate_ingress()


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--static",
        action="store_true",
        help="run the production pre-launch package check (the default)",
    )
    parser.parse_args(argv)
    try:
        result = production_static_check()
    except UnprovisionedError as error:
        print(str(error), file=sys.stderr)
        return 2
    except IngressValidationError as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
