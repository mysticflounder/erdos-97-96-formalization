"""Offline shadow parity for the legacy Exact17 Child38/Child39 lanes.

This adapter is deliberately a *shadow*: it consumes already published
legacy artifacts and never starts PIQD, a solver, Lean, or a transport.  The
legacy bundle and the generic STATIC_CNF control are separate inputs so that
neither one can silently stand in for the other.
"""

from __future__ import annotations

import hashlib
import json
import os
import stat
from collections.abc import Iterator
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO, Literal

from .phase3_cegar_runtime import (
    ExactFileCapture,
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from .phase3_cegar_wave import canonical_json_bytes
from .phase3_cegar_wave_control import CONTROL_SCHEMA, STATIC_CNF

SHADOW_SCHEMA = "p97-exact17-shadow/v1"
CHILD38 = "Child38"
CHILD39 = "Child39"
SAT_OBSERVED = "SAT_OBSERVED"
INDETERMINATE = "INDETERMINATE"
_CHILDREN = frozenset({CHILD38, CHILD39})
_CHILD_COUNTS = {
    CHILD38: (308, 5_847_276, 8),
    CHILD39: (308, 5_847_388, 112),
}
_HEX = frozenset("0123456789abcdef")
_NATIVE_PATH = type(Path())


class Exact17ShadowError(ValueError):
    """A legacy shadow bundle failed a fail-closed boundary."""


@dataclass(frozen=True)
class StaticCnfControl:
    """The small, immutable generic control identity for a shadow check."""

    cnf_sha256: str
    variables: int
    clauses: int
    schema: str = CONTROL_SCHEMA
    domain_kind: str = STATIC_CNF
    query_polarity: str = "SAT_MEANS_COUNTEREXAMPLE"


@dataclass(frozen=True)
class Exact17LegacyBundle:
    """Paths to one legacy Child38 or Child39 publication bundle.

    ``daemon_build_receipt`` and ``solver_log`` are optional because the
    production final/ingress receipts already carry their authenticated
    identities.  Supplying either causes this adapter to capture and bind it
    as well.  Child39 requires ``parent_cnf``.
    """

    child: Literal["Child38", "Child39"]
    cnf: Path
    export_receipt: Path
    ingress_manifest: Path
    final_receipt: Path
    model: Path
    source_model: Path | None = None
    parent_cnf: Path | None = None
    daemon_build_receipt: Path | None = None
    solver_log: Path | None = None


@dataclass(frozen=True)
class _Captured:
    capture: ExactFileCapture
    payload: Any | None


def _fail(message: str) -> None:
    raise Exact17ShadowError(message)


def _path(path: Path, label: str) -> Path:
    if type(path) is not _NATIVE_PATH or not path.is_absolute():
        _fail(f"{label} must be an absolute native Path")
    # Reject lexical aliases and symlink components before the runtime's
    # no-follow capture.  This also rejects macOS /private/var aliases.
    if Path(os.path.normpath(os.fspath(path))) != path:
        _fail(f"{label} is not normalized")
    _no_symlink_components(path, label)
    return path


def _no_symlink_components(path: Path, label: str) -> None:
    current = Path(path.anchor)
    for component in path.parts[1:]:
        current /= component
        try:
            if stat.S_ISLNK(os.lstat(current).st_mode):
                _fail(f"{label} contains a symlink component")
        except FileNotFoundError:
            # The final publication component may not exist yet.
            if current != path:
                _fail(f"{label} has a missing parent component")
        except OSError as exc:
            _fail(f"{label} cannot inspect its path components: {exc}")


def _capture(
    path: Path,
    label: str,
    *,
    max_bytes: int = 64 * 1024 * 1024,
    keep_bytes: bool = True,
) -> ExactFileCapture:
    _path(path, label)
    try:
        return capture_exact_regular_file(
            path,
            max_bytes=max_bytes,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=keep_bytes,
            label=label,
        )
    except (ExactFileCaptureError, OSError, ValueError) as exc:
        _fail(f"{label} is not a stable unique regular file: {exc}")
    raise AssertionError("unreachable")


def _json(capture: ExactFileCapture, label: str) -> dict[str, Any]:
    raw = capture.data or b""

    def object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, child in pairs:
            if key in value:
                _fail(f"{label} has a duplicate JSON key: {key}")
            value[key] = child
        return value

    def reject_constant(value: str) -> Any:
        _fail(f"{label} has a non-finite JSON number: {value}")

    try:
        value = json.loads(
            raw,
            object_pairs_hook=object_pairs,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        _fail(f"{label} is not strict JSON: {exc}")
    if type(value) is not dict:
        _fail(f"{label} must contain a JSON object")
    legacy_pretty = (
        json.dumps(
            value,
            sort_keys=True,
            indent=2,
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
        + b"\n"
    )
    if raw not in (canonical_json_bytes(value), legacy_pretty):
        _fail(f"{label} is not an accepted canonical JSON serialization")
    return value


def _hex(value: Any, label: str) -> str:
    if type(value) is not str or len(value) != 64 or any(c not in _HEX for c in value):
        _fail(f"{label} is not a lowercase SHA-256")
    return value


def _integer(value: Any, label: str) -> int:
    if type(value) is not int or value < 0:
        _fail(f"{label} is not a non-negative builtin int")
    return value


def _claim_scan(value: Any, location: str = "record") -> None:
    """Reject affirmative theorem/global/Lean/proof *claims*.

    Identity objects named ``lean``, ``solver`` and ``proof`` are allowed;
    claim-bearing keys must be explicit and false/null.  This prevents the
    shadow result from becoming a theorem or proof certificate.
    """

    if type(value) is dict:
        for key, child in value.items():
            if type(key) is not str:
                _fail(f"{location} has a non-string key")
            low = key.lower()
            if any(
                token in low
                for token in (
                    "theorem_claim",
                    "global_claim",
                    "lean_claim",
                    "proof_claim",
                )
            ) and child not in (False, None, "", 0, [], {}):
                _fail(f"{location}.{key} is an affirmative claim")
            if (
                low in {"theorem", "global", "proof"}
                and child not in (False, None, "", 0, [], {})
                and type(child) is not dict
            ):
                _fail(f"{location}.{key} is an affirmative claim")
            if (
                low == "lean"
                and child not in (False, None, "", 0, [], {})
                and type(child) is not dict
            ):
                _fail(f"{location}.{key} is an affirmative claim")
            _claim_scan(child, f"{location}.{key}")
    elif type(value) is list:
        for index, child in enumerate(value):
            _claim_scan(child, f"{location}[{index}]")


def _path_ref(value: Any, actual: Path, label: str) -> None:
    if type(value) is not dict or type(value.get("path")) is not str:
        _fail(f"{label} has no path reference")
    referenced = Path(value["path"])
    if type(referenced) is not _NATIVE_PATH or not referenced.is_absolute():
        _fail(f"{label} path is not absolute native")
    if Path(os.path.normpath(os.fspath(referenced))) != referenced:
        _fail(f"{label} path is an alias")
    _no_symlink_components(referenced, label)
    if referenced != actual:
        _fail(f"{label} crosses the supplied bundle")


def _sealed_path_ref(value: Any, label: str) -> tuple[Path, str]:
    """Validate a sealed legacy path/hash claim without recapturing its file."""

    if type(value) is not dict or set(value) != {"path", "sha256"}:
        _fail(f"{label} is not an exact path/hash reference")
    raw_path = value["path"]
    if type(raw_path) is not str:
        _fail(f"{label}.path is not a builtin string")
    referenced = Path(raw_path)
    if type(referenced) is not _NATIVE_PATH or not referenced.is_absolute():
        _fail(f"{label} path is not absolute native")
    if (
        os.fspath(referenced) != raw_path
        or Path(os.path.normpath(raw_path)) != referenced
    ):
        _fail(f"{label} path is an alias")
    return referenced, _hex(value["sha256"], f"{label}.sha256")


def _file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


@contextmanager
def _held_binary(
    path: Path, capture: ExactFileCapture, label: str
) -> Iterator[BinaryIO]:
    """Open an already captured file through one held no-follow path chain."""

    _path(path, label)
    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | os.O_NOFOLLOW
    )
    file_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NONBLOCK", 0)
        | os.O_NOFOLLOW
    )
    directory_fds: list[int] = []
    directory_chain: list[tuple[int, str, int, os.stat_result]] = []
    file_fd: int | None = None
    handle: BinaryIO | None = None
    try:
        parent_fd = os.open(os.path.sep, directory_flags)
        directory_fds.append(parent_fd)
        root_info = os.fstat(parent_fd)
        if not stat.S_ISDIR(root_info.st_mode):
            _fail(f"{label} filesystem root is not a directory")
        for component in path.parts[1:-1]:
            child_fd = os.open(component, directory_flags, dir_fd=parent_fd)
            directory_fds.append(child_fd)
            child_info = os.fstat(child_fd)
            named = os.stat(component, dir_fd=parent_fd, follow_symlinks=False)
            if not stat.S_ISDIR(child_info.st_mode) or _file_identity(
                named
            ) != _file_identity(child_info):
                _fail(f"{label} parent path changed during held open")
            directory_chain.append((parent_fd, component, child_fd, child_info))
            parent_fd = child_fd
        file_fd = os.open(path.name, file_flags, dir_fd=parent_fd)
        file_info = os.fstat(file_fd)
        named_file = os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        if (
            not stat.S_ISREG(file_info.st_mode)
            or file_info.st_nlink != 1
            or _file_identity(named_file) != _file_identity(file_info)
            or (
                file_info.st_dev,
                file_info.st_ino,
                file_info.st_size,
                file_info.st_nlink,
            )
            != (capture.device, capture.inode, capture.byte_count, capture.link_count)
        ):
            _fail(f"{label} no longer matches its exact capture")
        handle = os.fdopen(file_fd, "rb", closefd=False)
        yield handle
        if _file_identity(os.fstat(file_fd)) != _file_identity(file_info):
            _fail(f"{label} changed during streaming validation")
        rebound = os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        if _file_identity(rebound) != _file_identity(file_info):
            _fail(f"{label} pathname changed during streaming validation")
        for ancestor_fd, component, child_fd, before in reversed(directory_chain):
            if _file_identity(os.fstat(child_fd)) != _file_identity(before):
                _fail(f"{label} parent descriptor changed during validation")
            named_child = os.stat(component, dir_fd=ancestor_fd, follow_symlinks=False)
            if _file_identity(named_child) != _file_identity(before):
                _fail(f"{label} parent pathname changed during validation")
    except Exact17ShadowError:
        raise
    except OSError as exc:
        _fail(f"{label} cannot be held for streaming validation: {exc}")
    finally:
        if handle is not None:
            handle.close()
        if file_fd is not None:
            os.close(file_fd)
        for descriptor in reversed(directory_fds):
            os.close(descriptor)


_MAX_DIMACS_LINE_BYTES = 1024 * 1024


def _dimacs_header(handle: BinaryIO, label: str) -> tuple[int, int, bytes]:
    header = handle.readline(_MAX_DIMACS_LINE_BYTES + 1)
    if not header.endswith(b"\n") or len(header) > _MAX_DIMACS_LINE_BYTES:
        _fail(f"{label} has no bounded DIMACS header")
    try:
        fields = header[:-1].decode("ascii", "strict").split()
    except UnicodeDecodeError:
        _fail(f"{label} has a non-ASCII DIMACS header")
    if len(fields) != 4 or fields[0:2] != ["p", "cnf"]:
        _fail(f"{label} has a malformed DIMACS header")
    try:
        variables, clauses = int(fields[2]), int(fields[3])
    except ValueError:
        _fail(f"{label} has non-integer DIMACS counts")
    if variables < 0 or clauses < 0:
        _fail(f"{label} has invalid DIMACS bounds")
    return variables, clauses, header


def _validate_dimacs(
    path: Path,
    capture: ExactFileCapture,
    label: str,
    *,
    assignment: list[int] | None = None,
) -> tuple[int, int]:
    with _held_binary(path, capture, label) as handle:
        variables, expected, header = _dimacs_header(handle, label)
        digest = hashlib.sha256(header)
        byte_count = len(header)
        count = 0
        while True:
            line = handle.readline(_MAX_DIMACS_LINE_BYTES + 1)
            if not line:
                break
            if not line.endswith(b"\n") or len(line) > _MAX_DIMACS_LINE_BYTES:
                _fail(f"{label} has an unterminated or oversized clause")
            digest.update(line)
            byte_count += len(line)
            fields = line[:-1].split()
            if not fields or fields[-1] != b"0":
                _fail(f"{label} has a malformed clause")
            literals: list[int] = []
            try:
                for field in fields[:-1]:
                    literal = int(field)
                    if literal == 0 or abs(literal) > variables:
                        _fail(f"{label} has an out-of-range literal")
                    literals.append(literal)
            except ValueError:
                _fail(f"{label} has a non-integer literal")
            count += 1
            if assignment is not None and not any(
                (assignment[abs(literal) - 1] > 0) == (literal > 0)
                for literal in literals
            ):
                _fail(f"{label} is not satisfied by the authenticated model")
        if count != expected:
            _fail(f"{label} clause count drifted: {count} != {expected}")
        if byte_count != capture.byte_count or digest.hexdigest() != capture.sha256:
            _fail(f"{label} streamed bytes drifted from the exact capture")
        return variables, count


def _ordered_suffix(
    parent_path: Path,
    parent_capture: ExactFileCapture,
    child_path: Path,
    child_capture: ExactFileCapture,
) -> tuple[str, int]:
    """Hash the exact child body suffix after a byte-identical parent body."""

    with (
        _held_binary(parent_path, parent_capture, "parent_cnf") as parent,
        _held_binary(child_path, child_capture, "cnf") as child,
    ):
        _dimacs_header(parent, "parent_cnf")
        _dimacs_header(child, "cnf")
        while True:
            chunk = parent.read(1024 * 1024)
            if not chunk:
                break
            if child.read(len(chunk)) != chunk:
                _fail("Child39 child is not parent bytes followed by an ordered suffix")
        digest = hashlib.sha256()
        count = 0
        total = 0
        final_byte = b""
        while True:
            chunk = child.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
            count += chunk.count(b"\n")
            total += len(chunk)
            final_byte = chunk[-1:]
        if total == 0 or final_byte != b"\n":
            _fail("Child39 ordered suffix is empty or unterminated")
        return digest.hexdigest(), count


def _model_assignment(model: dict[str, Any], variables: int) -> list[int]:
    section = model.get("model")
    if type(section) is not dict or type(section.get("assignment")) is not list:
        _fail("model has no total assignment")
    assignment = section["assignment"]
    if len(assignment) != variables or any(
        type(x) is not int or x == 0 or abs(x) > variables for x in assignment
    ):
        _fail("model assignment is not total")
    if {abs(x) for x in assignment} != set(range(1, variables + 1)):
        _fail("model assignment does not cover every variable")
    indexed = [0] * variables
    for literal in assignment:
        indexed[abs(literal) - 1] = literal
    return indexed


def _bundle_paths(bundle: Exact17LegacyBundle) -> tuple[tuple[str, Path], ...]:
    if (
        type(bundle) is not Exact17LegacyBundle
        or type(bundle.child) is not str
        or bundle.child not in _CHILDREN
    ):
        _fail("legacy bundle has an unsupported child")
    values: list[tuple[str, Path]] = [
        ("cnf", bundle.cnf),
        ("export_receipt", bundle.export_receipt),
        ("ingress_manifest", bundle.ingress_manifest),
        ("final_receipt", bundle.final_receipt),
        ("model", bundle.model),
    ]
    if bundle.source_model is None:
        _fail(
            "legacy bundle requires the export/source model separately from final model"
        )
    values.append(("source_model", bundle.source_model))
    if bundle.child == CHILD39:
        if bundle.parent_cnf is None:
            _fail("Child39 requires parent_cnf")
        values.append(("parent_cnf", bundle.parent_cnf))
    elif bundle.parent_cnf is not None:
        _fail("Child38 must not supply parent_cnf")
    if bundle.daemon_build_receipt is not None:
        values.append(("daemon_build_receipt", bundle.daemon_build_receipt))
    if bundle.solver_log is not None:
        values.append(("solver_log", bundle.solver_log))
    seen: set[Path] = set()
    for label, path in values:
        _path(path, label)
        if path in seen:
            _fail("legacy bundle reuses one path for distinct artifacts")
        seen.add(path)
    return tuple(values)


def _capture_bundle(bundle: Exact17LegacyBundle) -> dict[str, _Captured]:
    out: dict[str, _Captured] = {}
    for label, path in _bundle_paths(bundle):
        is_cnf = label in {"cnf", "parent_cnf"}
        cap = _capture(
            path,
            label,
            max_bytes=512 * 1024 * 1024 if is_cnf else 16 * 1024 * 1024,
            keep_bytes=not is_cnf,
        )
        payload = (
            _json(cap, label)
            if label
            in {
                "export_receipt",
                "final_receipt",
                "ingress_manifest",
                "model",
                "source_model",
            }
            else None
        )
        out[label] = _Captured(cap, payload)
    return out


def _same_captures(before: dict[str, _Captured], after: dict[str, _Captured]) -> None:
    for label, frozen in before.items():
        current = after.get(label)
        if current is None or not frozen.capture.same_identity_and_content(
            current.capture
        ):
            _fail(f"{label} changed during offline validation")


def _validate_bundle(
    bundle: Exact17LegacyBundle, captured: dict[str, _Captured]
) -> dict[str, Any]:
    child = bundle.child
    cnf_cap = captured["cnf"].capture
    export = captured["export_receipt"].payload or {}
    ingress = captured["ingress_manifest"].payload or {}
    final = captured["final_receipt"].payload or {}
    model = captured["model"].payload or {}
    source_model = captured["source_model"].payload or {}
    for label, payload in (
        ("export_receipt", export),
        ("ingress_manifest", ingress),
        ("final_receipt", final),
        ("model", model),
        ("source_model", source_model),
    ):
        _claim_scan(payload, label)
    _claim_scan(export.get("validation", {}), "export.validation")
    expected_variables, expected_clauses, expected_suffix_count = _CHILD_COUNTS[child]
    expected_schema = {
        "export": f"p97-exact17-child{38 if child == CHILD38 else 39}-immutable-export-receipt/v1",
        "final": f"p97-exact17-child{38 if child == CHILD38 else 39}-piqd-final/v2",
        "model": f"p97-exact17-child{38 if child == CHILD38 else 39}-piqd-model/v3",
    }
    if (
        export.get("schema") != expected_schema["export"]
        or export.get("status") != "PASS"
        or export.get("publication_state") != "PROVISIONED"
    ):
        _fail("export receipt is not a provisioned PASS")
    if (
        ingress.get("status") != "PASS"
        or final.get("schema") != expected_schema["final"]
        or model.get("schema") != expected_schema["model"]
    ):
        _fail("legacy receipt schemas/statuses are not authenticated")
    assignment = _model_assignment(model, expected_variables)
    variables, clauses = _validate_dimacs(
        bundle.cnf,
        cnf_cap,
        "cnf",
        assignment=assignment,
    )
    if variables != expected_variables or clauses != expected_clauses:
        _fail("Exact17 CNF counts are not the Child38/Child39 counts")
    child_ref = export.get("child", {})
    if (
        type(child_ref) is not dict
        or child_ref.get("sha256") != cnf_cap.sha256
        or child_ref.get("bytes") != cnf_cap.byte_count
        or child_ref.get("variables") != variables
        or child_ref.get("clauses") != clauses
    ):
        _fail("export receipt does not bind the child CNF")
    dimacs = ingress.get("dimacs", {})
    if (
        type(dimacs) is not dict
        or dimacs.get("sha256") != cnf_cap.sha256
        or dimacs.get("bytes") != cnf_cap.byte_count
        or dimacs.get("variables") != variables
        or dimacs.get("clauses") != clauses
    ):
        _fail("ingress manifest does not bind the child CNF")
    _path_ref(export.get("child"), bundle.cnf, "export.child")
    _path_ref(ingress.get("dimacs"), bundle.cnf, "ingress.dimacs")
    export_ref = ingress.get("export_receipt", {})
    if (
        type(export_ref) is not dict
        or export_ref.get("sha256") != captured["export_receipt"].capture.sha256
    ):
        _fail("ingress does not bind the export receipt")
    _path_ref(export_ref, bundle.export_receipt, "ingress.export_receipt")
    model_ref = export.get("model", {})
    if (
        type(model_ref) is not dict
        or model_ref.get("sha256") != captured["source_model"].capture.sha256
    ):
        _fail("export does not bind the model artifact")
    _path_ref(model_ref, bundle.source_model, "export.model")
    ingress_model = ingress.get("model", {})
    if (
        type(ingress_model) is not dict
        or ingress_model.get("sha256") != captured["source_model"].capture.sha256
    ):
        _fail("ingress does not bind the model artifact")
    _path_ref(ingress_model, bundle.source_model, "ingress.model")
    validation = ingress.get("validation", {})
    if (
        type(validation) is not dict
        or validation.get("child", {}).get("sha256") != cnf_cap.sha256
    ):
        _fail("ingress validation lost the child binding")
    if export.get("validation", {}).get("model", {}).get("sha256") not in (
        None,
        captured["source_model"].capture.sha256,
    ):
        _fail("export validation crossed the source model")
    if validation.get("model", {}).get("sha256") not in (
        None,
        captured["source_model"].capture.sha256,
    ):
        _fail("ingress validation crossed the source model")
    model_section = model["model"]
    if (
        model_section.get("job_id") != final.get("job_id")
        or model_section.get("result") != "SAT"
        or model_section.get("num_assigned") != variables
    ):
        _fail("model custody identity does not bind final job")
    if (
        model.get("cnf_sha256") != cnf_cap.sha256
        or model.get("manifest_sha256") != captured["ingress_manifest"].capture.sha256
    ):
        _fail("model custody does not bind CNF/manifest")
    binding = final.get("binding", {})
    if (
        type(binding) is not dict
        or binding.get("cnf_sha256") != cnf_cap.sha256
        or binding.get("manifest_sha256") != captured["ingress_manifest"].capture.sha256
        or binding.get("project")
        != f"erdos-97-96-exact17-child{38 if child == CHILD38 else 39}"
        or binding.get("backend") != "cadical"
        or binding.get("solver_profile") != "sat"
    ):
        _fail("final receipt binding drifted")
    if (
        final.get("result") != "SAT"
        or final.get("model_sha256") != captured["model"].capture.sha256
        or final.get("model_check", {}).get("job_id") != final.get("job_id")
    ):
        _fail("final receipt does not bind SAT model custody")
    model_check = final.get("model_check", {})
    if (
        model_check.get("outcome") != "SATISFIED"
        or model_check.get("cnf_blob_hash") != cnf_cap.sha256
        or model_check.get("num_vars") != variables
        or model_check.get("num_clauses") != clauses
        or model_check.get("num_assigned") != variables
    ):
        _fail("final model check is not a complete authenticated replay")
    replay = final.get("model_replay", {})
    if (
        replay.get("clauses_checked") != clauses
        or replay.get("satisfies_all") is not True
    ):
        _fail("final replay receipt is incomplete")
    completion = final.get("completion_status", {})
    daemon = ingress.get("piqd", {})
    if (
        type(daemon) is not dict
        or completion.get("cnf_blob_hash") != cnf_cap.sha256
        or completion.get("daemon_sha256") != daemon.get("daemon_sha256")
        or final.get("deciding_daemon_sha256") != daemon.get("daemon_sha256")
        or final.get("solver", {}).get("sha256") != daemon.get("solver_sha256")
    ):
        _fail("solver/daemon identities crossed or drifted")
    daemon_ref = daemon.get("daemon_build_receipt")
    daemon_reference: dict[str, str] | None = None
    if daemon_ref is not None:
        referenced, referenced_sha256 = _sealed_path_ref(
            daemon_ref, "ingress.daemon_build_receipt"
        )
        daemon_reference = {
            "path": os.fspath(referenced),
            "sha256": referenced_sha256,
        }
        if bundle.daemon_build_receipt is not None:
            _path_ref(
                daemon_ref,
                bundle.daemon_build_receipt,
                "ingress.daemon_build_receipt",
            )
            if referenced_sha256 != captured["daemon_build_receipt"].capture.sha256:
                _fail("daemon build receipt digest drifted")
    elif bundle.daemon_build_receipt is not None:
        _fail("supplied daemon build receipt is not sealed by ingress")
    if completion.get("identity_hash") != binding.get("identity_hash") or model.get(
        "completion_identity_hash"
    ) != binding.get("identity_hash"):
        _fail("completion identity is not cross-bound")
    if captured.get("solver_log") is not None:
        log = final.get("solver_log", {})
        if (
            log.get("sha256") != captured["solver_log"].capture.sha256
            or log.get("bytes") != captured["solver_log"].capture.byte_count
        ):
            _fail("solver log custody drifted")
    if child == CHILD39:
        parent_cap = captured["parent_cnf"].capture
        if bundle.parent_cnf is None:
            _fail("Child39 parent path is missing")
        parent_vars, parent_clauses = _validate_dimacs(
            bundle.parent_cnf,
            parent_cap,
            "parent_cnf",
        )
        parent = export.get("parent", {})
        if (
            type(parent) is not dict
            or set(parent) != {"path", "sha256"}
            or parent.get("sha256") != parent_cap.sha256
            or parent_vars != variables
            or parent_clauses != _CHILD_COUNTS[CHILD38][1]
        ):
            _fail("Child39 parent identity/counts drifted")
        _path_ref(parent, bundle.parent_cnf, "export.parent")
        child_ref_parent = validation.get("parent", {})
        if (
            type(child_ref_parent) is not dict
            or set(child_ref_parent) != {"clauses", "sha256"}
            or child_ref_parent.get("sha256") != parent_cap.sha256
            or child_ref_parent.get("clauses") != parent_clauses
        ):
            _fail("Child39 validation lost parent binding")
        suffix_hash, suffix_count = _ordered_suffix(
            bundle.parent_cnf,
            parent_cap,
            bundle.cnf,
            cnf_cap,
        )
        ordered = validation.get("ordered_suffix_sha256")
        if validation.get("ordered_suffix_exact") is not True or ordered != suffix_hash:
            _fail("Child39 ordered suffix binding drifted")
        if suffix_count != expected_suffix_count:
            _fail("Child39 suffix count drifted")
        if (
            ingress.get("parent_ingress", {}).get("parent_dimacs_sha256")
            != parent_cap.sha256
        ):
            _fail("Child39 ingress parent binding drifted")
    else:
        if validation.get("ordered_suffix_exact") is not True:
            _fail("Child38 ordered suffix attestation is missing")
        _hex(validation.get("ordered_suffix_sha256"), "Child38 ordered suffix")
    return {
        "child": child,
        "cnf_sha256": cnf_cap.sha256,
        "cnf_bytes": cnf_cap.byte_count,
        "variables": variables,
        "clauses": clauses,
        "status": SAT_OBSERVED,
        "daemon_build_receipt_reference": daemon_reference,
        "artifact_sha256": {
            label: entry.capture.sha256 for label, entry in captured.items()
        },
    }


def validate_exact17_shadow(
    bundle: Exact17LegacyBundle, control: StaticCnfControl
) -> dict[str, Any]:
    """Validate one legacy bundle without any external execution."""

    if (
        type(control) is not StaticCnfControl
        or type(control.schema) is not str
        or type(control.domain_kind) is not str
        or type(control.query_polarity) is not str
        or control.schema != CONTROL_SCHEMA
        or control.domain_kind != STATIC_CNF
        or control.query_polarity != "SAT_MEANS_COUNTEREXAMPLE"
    ):
        _fail("shadow control is not the closed STATIC_CNF control")
    _hex(control.cnf_sha256, "control.cnf_sha256")
    if (
        type(control.variables) is not int
        or type(control.clauses) is not int
        or control.variables < 0
        or control.clauses < 0
    ):
        _fail("control counts must be builtin ints")
    captured = _capture_bundle(bundle)
    result = _validate_bundle(bundle, captured)
    if (
        control.cnf_sha256 != result["cnf_sha256"]
        or control.variables != result["variables"]
        or control.clauses != result["clauses"]
    ):
        _fail("generic STATIC_CNF control crossed the legacy bundle")
    after = _capture_bundle(bundle)
    _same_captures(captured, after)
    result["control"] = {
        "schema": control.schema,
        "domain_kind": control.domain_kind,
        "cnf_sha256": control.cnf_sha256,
        "variables": control.variables,
        "clauses": control.clauses,
    }
    result["schema"] = SHADOW_SCHEMA
    return result


def publish_exact17_shadow_receipt(
    bundle: Exact17LegacyBundle, control: StaticCnfControl, destination: Path
) -> dict[str, Any]:
    """Validate then create one receipt, never replacing an existing path."""

    _path(destination, "shadow receipt destination")
    input_paths = {path for _, path in _bundle_paths(bundle)}
    if destination in input_paths:
        _fail("shadow receipt destination is a protected legacy input")
    parent = destination.parent
    _path(parent, "shadow receipt parent")
    try:
        parent_fd = os.open(parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    except OSError as exc:
        _fail(f"shadow receipt parent is not a held directory: {exc}")
    try:
        info = os.fstat(parent_fd)
        if stat.S_IFMT(info.st_mode) != stat.S_IFDIR:
            _fail("shadow receipt parent is not a directory")
        result = validate_exact17_shadow(bundle, control)
        payload = canonical_json_bytes(result)
        try:
            fd = os.open(
                destination.name,
                os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
                0o600,
                dir_fd=parent_fd,
            )
        except FileExistsError:
            _fail("shadow receipt publication is create-once")
        except OSError as exc:
            _fail(f"shadow receipt cannot be created: {exc}")
        created = True
        created_info: os.stat_result | None = None
        try:
            offset = 0
            while offset < len(payload):
                offset += os.write(fd, payload[offset:])
            os.fsync(fd)
            created_info = os.fstat(fd)
            if (
                stat.S_IFMT(created_info.st_mode) != stat.S_IFREG
                or stat.S_IMODE(created_info.st_mode) != 0o600
                or created_info.st_nlink != 1
                or created_info.st_size != len(payload)
            ):
                _fail("shadow receipt has invalid held-file custody")
            if os.pread(fd, len(payload) + 1, 0) != payload:
                _fail("shadow receipt held bytes drifted")
            entry_info = os.stat(
                destination.name, dir_fd=parent_fd, follow_symlinks=False
            )
            if (entry_info.st_dev, entry_info.st_ino) != (
                created_info.st_dev,
                created_info.st_ino,
            ):
                _fail("shadow receipt directory entry was rebound")
            os.fsync(parent_fd)
            if not _same_dir(parent_fd, info):
                _fail("shadow receipt parent changed during publication")
            if not _same_dir_path(parent, info):
                _fail("shadow receipt parent path was rebound")
            result["receipt_sha256"] = hashlib.sha256(payload).hexdigest()
            return result
        except BaseException:
            if created and created_info is not None:
                _unlink_created(parent_fd, destination.name, created_info)
            raise
        finally:
            os.close(fd)
    finally:
        os.close(parent_fd)


def _same_dir(fd: int, before: os.stat_result) -> bool:
    after = os.fstat(fd)
    return (after.st_dev, after.st_ino, after.st_mode) == (
        before.st_dev,
        before.st_ino,
        before.st_mode,
    )


def _same_dir_path(path: Path, before: os.stat_result) -> bool:
    try:
        fd = os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    except OSError:
        return False
    try:
        return _same_dir(fd, before)
    finally:
        os.close(fd)


def _unlink_created(parent_fd: int, name: str, created_info: os.stat_result) -> None:
    try:
        current = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
        if (current.st_dev, current.st_ino) != (
            created_info.st_dev,
            created_info.st_ino,
        ):
            return
        os.unlink(name, dir_fd=parent_fd)
        os.fsync(parent_fd)
    except OSError:
        pass


__all__ = [
    "CHILD38",
    "CHILD39",
    "INDETERMINATE",
    "SAT_OBSERVED",
    "SHADOW_SCHEMA",
    "Exact17LegacyBundle",
    "Exact17ShadowError",
    "StaticCnfControl",
    "publish_exact17_shadow_receipt",
    "validate_exact17_shadow",
]
