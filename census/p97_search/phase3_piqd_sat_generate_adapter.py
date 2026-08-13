"""Caller-specific PIQD discovery custody for :mod:`sat_generate`.

This adapter owns only the discovery side of the one production-authorized
Phase-3 profile.  A PIQD UNSAT is observational: the caller must run its
unchanged local proof runner on the same bytes before publishing ``COMPLETE``.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import json
import os
import re
import stat
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from cells import Cell

from census.p97_search import phase3_pinned_multiplicity as pinned_multiplicity
from census.p97_search import phase3_piqd_incremental_v3 as incremental_v3
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search import sat_generate as sat

SCHEMA = "p97-piqd-sat-generate-caller/v1"
_NATIVE_PATH_TYPE = type(Path())
_CELL = (4, 10, (4, 4, 5), True)
_MODE = "cap+blocker-projected"
_PROFILE = "phase3-v0.2-projected-static"
_CONFIGURATION = {
    "spec_version": _PROFILE,
    "semantic_assignment_schema": "p97-phase3-semantic-assignment-v2-sf",
    "project_blockers": True,
    "static_dual2": True,
    "mincut_scope": "counterexample_card_ge_ten",
}
_METADATA_NAME = re.compile(r"piqd-session-metadata-(?P<index>[0-9]{6})[.]json")
_SHA256 = re.compile(r"[0-9a-f]{64}")
_PROVENANCE_SCHEMA = "p97-sat-generate-piqd-provenance/v1"
_LIFECYCLE_FAILURE_NAME = "piqd-lifecycle-failure.json"
_DURABLE_ARTIFACT_NAMES = frozenset(
    {
        "base.cnf",
        "models.jsonl",
        "bank.jsonl",
        "terminal.cnf",
        "terminal.drat",
        "terminal.drat.check",
        "piqd-caller-manifest.json",
    }
)
_RETAINED_TRANSIENT_NAMES = frozenset({".solver.cnf", ".solver.log"})
_FAILURE_TRANSIENT_NAME = ".terminal.drat.pending"
_EMPTY_ARTIFACT_NAMES = frozenset(
    {"models.jsonl", ".solver.log", _FAILURE_TRANSIENT_NAME}
)
_REQUIRED_RUN_ARTIFACT_NAMES = frozenset(
    {"base.cnf", "models.jsonl", "bank.jsonl", "piqd-caller-manifest.json", ".solver.cnf"}
)


class SatGeneratePiqdError(RuntimeError):
    """A P97 caller custody, profile, or lifecycle contract failed closed."""


SolverBackend = Callable[[Path, int, Path | None], Any]


def _native_path(value: object, *, label: str) -> Path:
    if type(value) is not _NATIVE_PATH_TYPE:
        raise SatGeneratePiqdError(f"{label} must be an exact native Path")
    path = value
    absolute = Path(os.path.abspath(os.fspath(path)))
    if path != absolute:
        raise SatGeneratePiqdError(f"{label} must be absolute and normalized")
    return path


def _capture(
    path: Path,
    *,
    label: str,
    limit: int = qualification.MAX_CONTROL_BYTES,
) -> bytes:
    """Use the v3 bounded, componentwise-nofollow, singly-linked capture."""

    try:
        raw = static._read_exact_cnf(path, limit=limit)
    except static.StaticPiqdRunnerError as exc:
        raise SatGeneratePiqdError(f"unsafe {label}: {exc}") from exc
    if not raw:
        raise SatGeneratePiqdError(f"{label} is empty: {path}")
    return raw


class _HeldOutputDirectory:
    """A held caller-output inode using the same durable v3 write primitives."""

    def __init__(self, output_dir: Path, *, create: bool = False) -> None:
        self.path = output_dir
        try:
            self._fd = static._open_directory_nofollow(output_dir, create=create)
        except static.StaticPiqdRunnerError as exc:
            raise SatGeneratePiqdError(f"unsafe PIQD caller output: {exc}") from exc
        info = os.fstat(self._fd)
        if (
            not stat.S_ISDIR(info.st_mode)
            or info.st_uid != os.getuid()
            or stat.S_IMODE(info.st_mode) & 0o077
        ):
            os.close(self._fd)
            raise SatGeneratePiqdError(
                "PIQD caller output must be a private directory owned by this user"
            )
        self._anchor = static._inode_anchor(info)
        self._open = True

    def _revalidate(self) -> None:
        if not self._open:
            raise SatGeneratePiqdError("PIQD caller output custody is closed")
        try:
            reopened = static._open_directory_nofollow(self.path, create=False)
        except static.StaticPiqdRunnerError as exc:
            raise SatGeneratePiqdError(
                f"PIQD caller output path was repointed: {exc}"
            ) from exc
        try:
            if (
                static._inode_anchor(os.fstat(self._fd)) != self._anchor
                or static._inode_anchor(os.fstat(reopened)) != self._anchor
            ):
                raise SatGeneratePiqdError("PIQD caller output path was repointed")
        finally:
            os.close(reopened)

    def entries(self) -> tuple[str, ...]:
        self._revalidate()
        return tuple(sorted(os.listdir(self._fd)))

    def capture(
        self,
        name: str,
        *,
        limit: int = qualification.MAX_CAPTURE_BYTES,
        allow_empty: bool = False,
    ) -> bytes:
        if type(name) is not str or Path(name).name != name:
            raise SatGeneratePiqdError("unsafe PIQD caller artifact name")
        if type(limit) is not int or limit <= 0:
            raise SatGeneratePiqdError("capture limit must be a positive builtin integer")
        self._revalidate()
        try:
            raw, _identity = static._capture_file_at(
                self._fd,
                name,
                maximum_bytes=limit,
                allow_empty=allow_empty,
            )
        except static.StaticPiqdRunnerError as exc:
            raise SatGeneratePiqdError(f"unsafe installed {name}: {exc}") from exc
        if raw:
            absolute = _capture(
                self.path / name,
                label=f"installed {name}",
                limit=limit,
            )
            if absolute != raw:
                raise SatGeneratePiqdError(
                    f"installed PIQD artifact changed: {name}"
                )
        self._revalidate()
        return raw

    def write_once(self, name: str, raw: bytes, *, allow_empty: bool = False) -> None:
        if type(name) is not str or Path(name).name != name:
            raise SatGeneratePiqdError("unsafe PIQD caller artifact name")
        if type(raw) is not bytes or (not raw and not allow_empty):
            raise SatGeneratePiqdError("PIQD caller artifact has forbidden bytes")
        self._revalidate()
        try:
            if raw:
                static._write_once_at(self._fd, name, raw)
            else:
                descriptor = os.open(
                    name,
                    os.O_WRONLY
                    | os.O_CREAT
                    | os.O_EXCL
                    | getattr(os, "O_NOFOLLOW", 0)
                    | getattr(os, "O_CLOEXEC", 0),
                    0o600,
                    dir_fd=self._fd,
                )
                try:
                    os.fsync(descriptor)
                finally:
                    os.close(descriptor)
                os.fsync(self._fd)
        except (OSError, static.StaticPiqdRunnerError) as exc:
            raise SatGeneratePiqdError(
                f"PIQD custody artifact already exists or is unsafe: {name}"
            ) from exc
        installed = self.capture(
            name,
            limit=max(len(raw), 1),
            allow_empty=allow_empty,
        )
        if installed != raw:
            raise SatGeneratePiqdError(f"installed PIQD artifact changed: {name}")

    def close(self) -> None:
        if self._open:
            os.close(self._fd)
            self._open = False


@dataclass(frozen=True)
class SatGeneratePiqdConfig:
    """All provenance required before the production session is opened."""

    base_url: str
    custody_root: Path
    source_manifest_path: Path
    producer_manifest_path: Path
    producer_job_id: str
    solver_name: str
    authority_path: Path

    def __post_init__(self) -> None:
        for field in ("base_url", "producer_job_id", "solver_name"):
            value = getattr(self, field)
            if type(value) is not str or not value.strip():
                raise SatGeneratePiqdError(f"{field} must be an exact nonempty string")
        for field in (
            "custody_root",
            "source_manifest_path",
            "producer_manifest_path",
            "authority_path",
        ):
            _native_path(getattr(self, field), label=field)


class SatGeneratePiqdRunner:
    """Persistent PIQD discovery runner with retry-safe explicit ownership."""

    def __init__(
        self,
        runner: Any,
        *,
        output_dir: Path,
        caller_manifest: bytes,
    ) -> None:
        self._runner = runner
        self._closed = False
        self._underlying_closed = False
        self._closed_metadata_written = False
        self.output_dir = _native_path(output_dir, label="output_dir")
        if type(caller_manifest) is not bytes or not caller_manifest:
            raise SatGeneratePiqdError("caller_manifest must be nonempty exact bytes")
        self.caller_manifest = caller_manifest
        self._metadata_index = 0
        self._previous_metadata_sha256: str | None = None
        self._custody = _HeldOutputDirectory(self.output_dir)
        try:
            self._custody.write_once("piqd-caller-manifest.json", caller_manifest)
        except BaseException as setup_error:
            try:
                self._custody.close()
            except BaseException as close_error:  # noqa: BLE001
                setup_error.add_note(
                    f"caller custody close also failed: {close_error!r}"
                )
            raise

    def __call__(self, cnf_path: Path, timeout_s: int, proof_path: Path | None) -> Any:
        if self._closed:
            raise SatGeneratePiqdError("PIQD discovery runner is closed")
        cnf_path = _native_path(cnf_path, label="cnf_path")
        if cnf_path != self.output_dir / ".solver.cnf":
            raise SatGeneratePiqdError("PIQD discovery CNF must be the caller .solver.cnf")
        if type(timeout_s) is not int or timeout_s <= 0:
            raise SatGeneratePiqdError("timeout_s must be a positive builtin integer")
        if proof_path is not None:
            raise SatGeneratePiqdError(
                "PIQD discovery must receive literal proof_path=None"
            )
        # Authenticate the runtime file through the held output inode before
        # the v3 runner performs its own exact-CNF custody checks.
        self._custody.capture(".solver.cnf")
        result = self._runner(cnf_path, timeout_s, None)
        self._write_metadata()
        return result

    def _write_metadata(self) -> None:
        metadata = {
            "schema": SCHEMA,
            "sequence": self._metadata_index,
            "previous_metadata_sha256": self._previous_metadata_sha256,
            "caller_manifest_sha256": hashlib.sha256(self.caller_manifest).hexdigest(),
            "incremental": self._runner.manifest_metadata(),
        }
        raw = (
            json.dumps(metadata, sort_keys=True, separators=(",", ":")) + "\n"
        ).encode()
        name = f"piqd-session-metadata-{self._metadata_index:06d}.json"
        self._custody.write_once(name, raw)
        self._previous_metadata_sha256 = hashlib.sha256(raw).hexdigest()
        self._metadata_index += 1

    def close(self) -> None:
        if self._closed:
            return
        # Advance each completed stage exactly once.  A failure leaves the
        # failed stage eligible for retry without repeating an earlier stage.
        if not self._underlying_closed:
            self._runner.close()
            self._underlying_closed = True
        if not self._closed_metadata_written:
            self._write_metadata()
            self._closed_metadata_written = True
        self._custody.close()
        self._closed = True


class SatGeneratePiqdFactory:
    """Lazy one-profile factory; preflight runs before caller filesystem setup."""

    def __init__(self, config: SatGeneratePiqdConfig, local_proof_runner: SolverBackend):
        if type(config) is not SatGeneratePiqdConfig:
            raise SatGeneratePiqdError("config must be exact SatGeneratePiqdConfig")
        if not callable(local_proof_runner):
            raise SatGeneratePiqdError("local_proof_runner must be callable")
        self.config = config
        self.local_proof_runner = local_proof_runner
        self._prepared_encoding: Any | None = None
        self._used = False

    def prepare_encoding(self, encoding: Any) -> None:
        """Reject unsupported cells/configurations before any filesystem access."""

        if self._prepared_encoding is not None:
            if self._prepared_encoding is encoding:
                return
            raise SatGeneratePiqdError("PIQD factory is bound to one encoding")
        cell = getattr(encoding, "cell", None)
        cell_profile = getattr(cell, "profile", None)
        identity = (
            getattr(cell, "k", None),
            getattr(cell, "n", None),
            cell_profile,
            getattr(cell, "exact", None),
        )
        if (
            type(identity[0]) is not int
            or type(identity[1]) is not int
            or type(cell_profile) is not tuple
            or any(type(value) is not int for value in cell_profile)
            or type(identity[3]) is not bool
            or identity != _CELL
            or getattr(encoding, "mode", None) != _MODE
            or encoding.configuration() != _CONFIGURATION
        ):
            raise SatGeneratePiqdError(
                "default PIQD supports only exact production-v3 cell "
                "k=4,n=10,profile=(4,4,5), blocker/projected/static-dual2, "
                "and counterexample_card_ge_ten mincut"
            )
        _seal_production_encoding(encoding)
        self._prepared_encoding = encoding

    def validate_output_paths(self, output_dir: Path, base_cnf_path: Path) -> None:
        """Validate lexical custody and exact seed identity without touching disk."""

        output_dir = _native_path(output_dir, label="output_dir")
        base_cnf_path = _native_path(base_cnf_path, label="base_cnf_path")
        try:
            relative = output_dir.relative_to(self.config.custody_root)
        except ValueError as exc:
            raise SatGeneratePiqdError(
                "output_dir escapes the documented custody_root"
            ) from exc
        if not relative.parts:
            raise SatGeneratePiqdError("output_dir must be below custody_root")
        if base_cnf_path != output_dir / "base.cnf":
            raise SatGeneratePiqdError(
                "PIQD seed must equal the exact output_dir/base.cnf artifact"
            )

    def __call__(
        self, output_dir: Path, encoding: Any, base_cnf_path: Path
    ) -> tuple[SatGeneratePiqdRunner, Callable[[], None]]:
        if self._prepared_encoding is not encoding:
            raise SatGeneratePiqdError(
                "PIQD encoding preflight must run before filesystem setup"
            )
        if self._used:
            raise SatGeneratePiqdError("PIQD factory is fresh-session single-use")
        output_dir = _native_path(output_dir, label="output_dir")
        base_cnf_path = _native_path(base_cnf_path, label="base_cnf_path")
        custody_root = self.config.custody_root
        self.validate_output_paths(output_dir, base_cnf_path)

        # Every local identity check completes before the v3 factory may open a
        # transport or session.
        base_raw = _capture(
            base_cnf_path,
            label="base.cnf",
            limit=qualification.MAX_CAPTURE_BYTES,
        )
        if base_raw != encoding.cnf_bytes():
            raise SatGeneratePiqdError("base.cnf is not the prepared encoding bytes")
        if hashlib.sha256(base_raw).hexdigest() != qualification.PRODUCTION_V3_BASE_SHA256:
            raise SatGeneratePiqdError("base.cnf is not the sealed production-v3 base")
        source_manifest = _capture(
            self.config.source_manifest_path, label="source manifest"
        )
        producer_manifest = _capture(
            self.config.producer_manifest_path, label="producer manifest"
        )
        try:
            authority = qualification.load_production_authority_v3(
                self.config.authority_path
            )
        except qualification.QualificationError as exc:
            raise SatGeneratePiqdError(f"invalid production-v3 authority: {exc}") from exc

        variable_map = [
            [variable, list(key)] for variable, key in sorted(encoding.key_for.items())
        ]
        caller = {
            "schema": SCHEMA,
            "production_profile": qualification.PRODUCTION_V3_PROFILE,
            "cell": {
                "k": encoding.cell.k,
                "n": encoding.cell.n,
                "profile": list(encoding.cell.profile),
                "exact": encoding.cell.exact,
            },
            "encoding_configuration": encoding.configuration(),
            "pinned_multiplicity": encoding.pinned_multiplicity_descriptor,
            "num_vars": encoding.num_vars,
            "num_clauses": len(encoding.clauses),
            "variable_map": variable_map,
            "base_cnf_sha256": hashlib.sha256(base_raw).hexdigest(),
            "source_manifest_sha256": hashlib.sha256(source_manifest).hexdigest(),
            "producer_manifest_sha256": hashlib.sha256(producer_manifest).hexdigest(),
            "authority_sha256": hashlib.sha256(authority.raw).hexdigest(),
            "producer_job_id": self.config.producer_job_id,
            "execution": {
                "workers": 1,
                "mode": "sequential",
                "discovery_fallback": False,
            },
        }
        caller_raw = (
            json.dumps(caller, sort_keys=True, separators=(",", ":")) + "\n"
        ).encode()

        runner: Any | None = None
        try:
            runner = incremental_v3.make_piqd_incremental_v3_solver_runner(
                base_url=self.config.base_url,
                custody_root=custody_root,
                base_cnf_path=base_cnf_path,
                source_manifest=source_manifest,
                producer_manifest=producer_manifest,
                producer_job_id=self.config.producer_job_id,
                solver_name=self.config.solver_name,
                local_proof_runner=self.local_proof_runner,
                production_authority=authority,
                source_manifest_path=self.config.source_manifest_path,
                producer_manifest_path=self.config.producer_manifest_path,
            )
            owned = SatGeneratePiqdRunner(
                runner,
                output_dir=output_dir,
                caller_manifest=caller_raw,
            )
        except BaseException as setup_error:
            if runner is not None:
                try:
                    runner.close()
                except BaseException as close_error:  # noqa: BLE001
                    setup_error.add_note(
                        f"underlying PIQD close also failed: {close_error!r}"
                    )
            raise
        self._used = True
        return owned, owned.close


def _reject_constant(value: str) -> None:
    raise ValueError(f"invalid JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _canonical_json(value: Mapping[str, Any], *, pretty: bool = False) -> bytes:
    if pretty:
        return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()
    return (
        json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n"
    ).encode()


def _strict_canonical_json(raw: bytes, *, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise SatGeneratePiqdError(f"{label} is not strict JSON: {exc}") from exc
    if type(value) is not dict or _canonical_json(value) != raw:
        raise SatGeneratePiqdError(f"{label} is not a canonical JSON object")
    return value


def _production_encoding(cell: Cell) -> sat.SatEncoding:
    if type(cell) is not Cell:
        raise SatGeneratePiqdError("cell must be an exact Cell")
    if (
        type(cell.k) is not int
        or type(cell.n) is not int
        or type(cell.profile) is not tuple
        or any(type(value) is not int for value in cell.profile)
        or type(cell.exact) is not bool
        or (cell.k, cell.n, cell.profile, cell.exact) != _CELL
    ):
        raise SatGeneratePiqdError(
            "default PIQD supports only exact production-v3 cell "
            "k=4,n=10,profile=(4,4,5)"
        )
    return sat.SatEncoding(
        cell,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=sat.MINCUT_SCOPE_CARD_GE_TEN,
    )


def _seal_production_encoding(encoding: sat.SatEncoding) -> sat.SatEncoding:
    """Install and authenticate the sole production-v3 auxiliary extension."""

    try:
        descriptor = pinned_multiplicity.install(encoding)
    except pinned_multiplicity.PinnedMultiplicityError as exc:
        raise SatGeneratePiqdError(str(exc)) from exc
    encoding.pinned_multiplicity_descriptor = descriptor
    config_raw = json.dumps(
        encoding.configuration(), sort_keys=True, separators=(",", ":")
    ).encode()
    if (
        qualification.PRODUCTION_V3_PROFILE != _PROFILE
        or encoding.spec_version != _PROFILE
        or encoding.num_vars != qualification.PRODUCTION_V3_VARIABLES
        or len(encoding.clauses) != qualification.PRODUCTION_V3_BASE_CLAUSES
        or hashlib.sha256(encoding.cnf_bytes()).hexdigest()
        != qualification.PRODUCTION_V3_BASE_SHA256
        or len(config_raw) != qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_BYTES
        or hashlib.sha256(config_raw).hexdigest()
        != qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_SHA256
    ):
        raise SatGeneratePiqdError(
            "sat_generate encoding does not equal the sealed production-v3 base"
        )
    return encoding


def _provenance_boundary(custody: _HeldOutputDirectory) -> dict[str, Any]:
    entries = custody.entries()
    caller_raw = custody.capture(
        "piqd-caller-manifest.json", limit=qualification.MAX_CONTROL_BYTES
    )
    caller = _strict_canonical_json(caller_raw, label="PIQD caller manifest")
    if caller.get("schema") != SCHEMA:
        raise SatGeneratePiqdError("PIQD caller manifest schema mismatch")
    caller_sha256 = hashlib.sha256(caller_raw).hexdigest()

    metadata_names: list[str] = []
    for name in entries:
        if not name.startswith("piqd-session-metadata-"):
            continue
        if _METADATA_NAME.fullmatch(name) is None:
            raise SatGeneratePiqdError(f"malformed PIQD session metadata name: {name}")
        metadata_names.append(name)
    if not metadata_names:
        raise SatGeneratePiqdError("PIQD provenance has no session metadata")

    metadata: list[dict[str, Any]] = []
    previous: str | None = None
    final_state: Any = None
    for expected_index, name in enumerate(sorted(metadata_names)):
        match = _METADATA_NAME.fullmatch(name)
        assert match is not None
        if int(match.group("index")) != expected_index:
            raise SatGeneratePiqdError("PIQD metadata sequence is not consecutive")
        raw = custody.capture(name, limit=qualification.MAX_CONTROL_BYTES)
        value = _strict_canonical_json(raw, label=name)
        if (
            value.get("schema") != SCHEMA
            or value.get("sequence") != expected_index
            or value.get("previous_metadata_sha256") != previous
            or value.get("caller_manifest_sha256") != caller_sha256
            or type(value.get("incremental")) is not dict
        ):
            raise SatGeneratePiqdError(f"PIQD metadata chain mismatch: {name}")
        digest = hashlib.sha256(raw).hexdigest()
        metadata.append({"name": name, "sha256": digest})
        previous = digest
        final_state = value["incremental"].get("state")

    lifecycle_failure: dict[str, str] | None = None
    if _LIFECYCLE_FAILURE_NAME in entries:
        raw = custody.capture(
            _LIFECYCLE_FAILURE_NAME, limit=qualification.MAX_CONTROL_BYTES
        )
        _strict_canonical_json(raw, label="PIQD lifecycle failure")
        lifecycle_failure = {
            "name": _LIFECYCLE_FAILURE_NAME,
            "sha256": hashlib.sha256(raw).hexdigest(),
        }
    return {
        "schema": _PROVENANCE_SCHEMA,
        "caller_manifest": {
            "name": "piqd-caller-manifest.json",
            "sha256": caller_sha256,
        },
        "session_metadata": metadata,
        "session_closed": final_state in {"closed", "closed-before-open"},
        "lifecycle_failure": lifecycle_failure,
    }


def _artifact_hashes(
    custody: _HeldOutputDirectory,
    provenance: Mapping[str, Any],
    *,
    status: str,
    expect_manifest: bool,
) -> dict[str, str]:
    if status not in {"COMPLETE", "PARTIAL", "UNKNOWN"}:
        raise SatGeneratePiqdError("published run status is invalid")
    session_metadata = provenance.get("session_metadata")
    if type(session_metadata) is not list:
        raise SatGeneratePiqdError("PIQD provenance metadata inventory is malformed")
    metadata_names: set[str] = set()
    for item in session_metadata:
        if type(item) is not dict or type(item.get("name")) is not str:
            raise SatGeneratePiqdError("PIQD provenance metadata entry is malformed")
        name = item["name"]
        if _METADATA_NAME.fullmatch(name) is None or name in metadata_names:
            raise SatGeneratePiqdError("PIQD provenance metadata entry is malformed")
        metadata_names.add(name)

    allowed = _DURABLE_ARTIFACT_NAMES | _RETAINED_TRANSIENT_NAMES | metadata_names
    if status != "COMPLETE":
        allowed = allowed | {_FAILURE_TRANSIENT_NAME}
    if status == "UNKNOWN":
        allowed = allowed | {_LIFECYCLE_FAILURE_NAME}
    expected_unhashed = {"manifest.json"} if expect_manifest else set()
    entries_before = set(custody.entries())
    required = _REQUIRED_RUN_ARTIFACT_NAMES
    if status == "COMPLETE":
        required = required | {
            ".solver.log",
            "terminal.cnf",
            "terminal.drat",
            "terminal.drat.check",
        }
    missing = required - entries_before
    if missing:
        raise SatGeneratePiqdError(
            "PIQD caller output is missing required entries: "
            + ", ".join(sorted(missing))
        )
    if expect_manifest and "manifest.json" not in entries_before:
        raise SatGeneratePiqdError("PIQD caller output is missing manifest.json")
    unexpected = entries_before - allowed - expected_unhashed
    if unexpected:
        raise SatGeneratePiqdError(
            "unexpected PIQD caller output entries: "
            + ", ".join(sorted(unexpected))
        )

    names = sorted(entries_before - expected_unhashed)
    hashes: dict[str, str] = {}
    for name in names:
        raw = custody.capture(
            name,
            limit=qualification.MAX_CAPTURE_BYTES,
            allow_empty=name in _EMPTY_ARTIFACT_NAMES,
        )
        hashes[name] = hashlib.sha256(raw).hexdigest()
    if set(custody.entries()) != entries_before:
        raise SatGeneratePiqdError(
            "PIQD caller output inventory changed while it was captured"
        )
    return hashes


def _result_manifest(
    encoding: sat.SatEncoding,
    custody: _HeldOutputDirectory,
    *,
    status: str,
    timeout_s: int,
    model_limit: int | None,
    raw_count: int,
    canonical_count: int,
    terminal_clause_count: int | None,
    unsat_verified: bool,
    diagnostic: str | None,
) -> dict[str, Any]:
    provenance = _provenance_boundary(custody)
    if status == "COMPLETE" and not provenance["session_closed"]:
        status = "UNKNOWN"
        unsat_verified = False
        diagnostic = "PIQD session did not reach a durable closed provenance state"
    manifest = {
        "spec_version": encoding.spec_version,
        "encoding_configuration": encoding.configuration(),
        "semantic_assignment_schema": encoding.semantic_schema,
        "cell": sat._cell_json(encoding.cell),
        "mode": encoding.mode,
        "clause_tags": dict(encoding.clause_counts),
        "semantic_variable_count": len(encoding.semantic_vars),
        "base_variable_count": encoding.num_vars,
        "base_clause_count": len(encoding.clauses),
        "terminal_variable_count": (
            encoding.num_vars if terminal_clause_count is not None else None
        ),
        "terminal_clause_count": terminal_clause_count,
        "solver_version": "PIQD incremental v3 discovery; local CaDiCaL terminal rerun",
        "checker_version": "local drat-trim terminal verification",
        "timeout_s": timeout_s,
        "model_limit": model_limit,
        "rule_bank_hash": sat.rule_bank_hash(),
        "status": status,
        "result_claim": sat._claim_for(status),
        "raw_count": raw_count,
        "canonical_count": canonical_count,
        "unsat_verified": unsat_verified,
        "diagnostic": diagnostic,
        "piqd_provenance": provenance,
        "artifact_hashes": _artifact_hashes(
            custody, provenance, status=status, expect_manifest=False
        ),
    }
    custody.write_once("manifest.json", _canonical_json(manifest, pretty=True))
    return manifest


def _record_close_failure(
    custody: _HeldOutputDirectory, error: BaseException
) -> None:
    payload = {
        "schema": "p97-sat-generate-piqd-lifecycle-failure/v1",
        "phase": "close",
        "exception_type": type(error).__name__,
        "message": str(error)[:4096],
    }
    custody.write_once(_LIFECYCLE_FAILURE_NAME, _canonical_json(payload))


def enumerate_cell_with_piqd(
    cell: Cell,
    run_dir: Path,
    *,
    config: SatGeneratePiqdConfig,
    timeout_s: int = 30,
    model_limit: int | None = None,
    resume: bool = False,
    overwrite: bool = False,
    local_proof_runner: SolverBackend = sat.run_cadical,
    checker_runner: sat.CheckerRunner = sat.run_drat_trim,
) -> dict[str, Any]:
    """Enumerate the sole production-v3 cell with observational PIQD discovery.

    This additive launcher deliberately does not modify the byte-frozen v2
    driver.  Unsupported profiles and unsafe lexical custody are rejected
    before creating the output directory or opening a PIQD session.
    """

    if type(timeout_s) is not int or timeout_s <= 0:
        raise SatGeneratePiqdError("timeout_s must be a positive builtin integer")
    if model_limit is not None and (
        type(model_limit) is not int or model_limit <= 0
    ):
        raise SatGeneratePiqdError("model_limit must be a positive builtin integer or None")
    if type(resume) is not bool or type(overwrite) is not bool:
        raise SatGeneratePiqdError("resume and overwrite must be builtin booleans")
    if resume or overwrite:
        raise SatGeneratePiqdError(
            "PIQD discovery supports fresh output only; resume/overwrite are legacy-local"
        )
    if type(config) is not SatGeneratePiqdConfig:
        raise SatGeneratePiqdError("config must be exact SatGeneratePiqdConfig")
    run_dir = _native_path(run_dir, label="run_dir")
    if not callable(local_proof_runner) or not callable(checker_runner):
        raise SatGeneratePiqdError("local proof and checker runners must be callable")

    # This sealed reconstruction and path check are the complete no-I/O
    # preflight.  In particular, arbitrary k/n/profile v0.1 cells never reach
    # output creation, source-manifest reads, authority reads, or transport.
    encoding = _production_encoding(cell)
    factory = SatGeneratePiqdFactory(config, local_proof_runner)
    factory.prepare_encoding(encoding)
    base_path = run_dir / "base.cnf"
    factory.validate_output_paths(run_dir, base_path)

    custody: _HeldOutputDirectory | None = None
    discovery: SatGeneratePiqdRunner | None = None
    close_discovery: Callable[[], None] | None = None
    active_error: BaseException | None = None
    close_error: BaseException | None = None
    status = "UNKNOWN"
    diagnostic: str | None = None
    unsat_verified = False
    terminal_clause_count: int | None = None
    records: list[dict[str, Any]] = []
    bank: Any = None

    try:
        custody = _HeldOutputDirectory(run_dir, create=True)
        if custody.entries():
            raise SatGeneratePiqdError("PIQD run directory must be fresh and empty")
        custody.write_once("base.cnf", encoding.cnf_bytes())
        custody.write_once("models.jsonl", b"", allow_empty=True)
        bank = sat.CanonicalBank(run_dir / "bank.jsonl", cell)
        custody.capture("bank.jsonl")
        blocks = sat._verify_prior_records(encoding, records, bank)

        discovery, close_discovery = factory(run_dir, encoding, base_path)
        while True:
            if model_limit is not None and len(records) >= model_limit:
                status = "PARTIAL"
                diagnostic = "model limit reached after valid decoded model(s)"
                break

            solve_path = run_dir / ".solver.cnf"
            proof_pending = run_dir / ".terminal.drat.pending"
            sat._atomic_bytes(solve_path, encoding.cnf_bytes(blocks))
            custody.capture(".solver.cnf")
            with contextlib.suppress(FileNotFoundError):
                proof_pending.unlink()
            try:
                result = discovery(solve_path, timeout_s, None)
            except Exception as exc:  # noqa: BLE001
                status = "UNKNOWN"
                diagnostic = f"PIQD discovery failed closed: {exc}"
                break
            if type(result) is not sat.SolverResult:
                status = "UNKNOWN"
                diagnostic = "PIQD discovery returned a non-native SolverResult"
                break
            sat._atomic_text(
                run_dir / ".solver.log",
                result.stdout
                + ("\nSTDERR\n" + result.stderr if result.stderr else ""),
            )

            if result.verdict == "SAT":
                try:
                    obj = encoding.decode(result.assignment)
                    block = encoding.blocking_clause(result.assignment)
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"model decode/revalidation failed: {exc}"
                    break
                before = set(bank.entries())
                generator = sat.Generator(
                    name="phase3-sat-single-model",
                    coverage="PARTIAL",
                    produce=lambda _cell, item=obj: iter((item,)),
                )
                try:
                    iterator_manifest = sat.iterate_cell(cell, generator, bank)
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"iterate_cell failed: {exc}"
                    break
                digest = sat._canonical_digest(obj)
                if not bank.has(digest):
                    status = "UNKNOWN"
                    diagnostic = "iterate_cell did not bank the decoded model"
                    break
                raw_key = tuple(
                    result.assignment[variable]
                    for variable in encoding.semantic_vars
                )
                if any(
                    raw_key
                    == tuple(
                        encoding.assignment_from_record(old)[variable]
                        for variable in encoding.semantic_vars
                    )
                    for old in records
                ):
                    status = "UNKNOWN"
                    diagnostic = "PIQD repeated an already blocked assignment"
                    break
                records.append(
                    {
                        "index": len(records),
                        "semantic_assignment": encoding.semantic_record(
                            result.assignment
                        ),
                        "blocking_clause": list(block),
                        "canonical_digest": digest,
                        "canonical_was_new": digest not in before,
                        "iterator": iterator_manifest,
                    }
                )
                blocks.append(block)
                sat._atomic_bytes(run_dir / "models.jsonl", sat._jsonl_bytes(records))
                custody.capture("models.jsonl")
                custody.capture("bank.jsonl")
                continue

            if result.verdict == "UNSAT":
                terminal_raw = custody.capture(".solver.cnf")
                custody.write_once("terminal.cnf", terminal_raw)
                if custody.capture("terminal.cnf") != terminal_raw:
                    raise SatGeneratePiqdError(
                        "terminal.cnf is not byte-identical to the PIQD frontier"
                    )
                terminal_clause_count = len(encoding.clauses) + len(blocks)
                try:
                    local_result = local_proof_runner(
                        run_dir / "terminal.cnf", timeout_s, proof_pending
                    )
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"local terminal proof rerun failed: {exc}"
                    break
                if (
                    type(local_result) is not sat.SolverResult
                    or local_result.verdict != "UNSAT"
                ):
                    status = "UNKNOWN"
                    diagnostic = "local terminal proof rerun did not return UNSAT"
                    break
                try:
                    proof_raw = custody.capture(".terminal.drat.pending")
                except SatGeneratePiqdError:
                    status = "UNKNOWN"
                    diagnostic = "local terminal UNSAT lacked a nonempty DRAT proof"
                    break
                custody.write_once("terminal.drat", proof_raw)
                with contextlib.suppress(FileNotFoundError):
                    proof_pending.unlink()
                try:
                    checked = checker_runner(
                        run_dir / "terminal.cnf",
                        run_dir / "terminal.drat",
                        timeout_s,
                    )
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"DRAT checker failed: {exc}"
                    break
                check_raw = (
                    checked.stdout
                    + ("\nSTDERR\n" + checked.stderr if checked.stderr else "")
                ).encode()
                if not check_raw:
                    check_raw = b"drat-trim returned no output\n"
                custody.write_once("terminal.drat.check", check_raw)
                if type(checked) is not sat.CheckerResult or not checked.verified:
                    status = "UNKNOWN"
                    diagnostic = "drat-trim did not report exact line 's VERIFIED'"
                    break
                unsat_verified = True
                status = "COMPLETE"
                diagnostic = None
                break

            status = "UNKNOWN"
            diagnostic = (
                f"PIQD returned UNKNOWN (returncode={result.returncode}); "
                "no local discovery fallback or blocking clause was used"
            )
            break
    except KeyboardInterrupt:
        status = "PARTIAL" if records else "UNKNOWN"
        diagnostic = "external interruption"
    except BaseException as exc:  # noqa: BLE001 - preserve active exception
        active_error = exc
    finally:
        if close_discovery is not None:
            try:
                close_discovery()
            except BaseException as exc:  # noqa: BLE001
                close_error = exc
                if active_error is not None:
                    active_error.add_note(
                        f"PIQD close also failed without masking it: {exc!r}"
                    )
        if custody is not None and close_error is not None:
            try:
                _record_close_failure(custody, close_error)
            except BaseException as record_error:  # noqa: BLE001
                if active_error is not None:
                    active_error.add_note(
                        f"PIQD close-failure publication also failed: {record_error!r}"
                    )

    if active_error is not None:
        if custody is not None:
            try:
                custody.close()
            except BaseException as custody_error:  # noqa: BLE001
                active_error.add_note(
                    f"held caller custody close also failed: {custody_error!r}"
                )
        raise active_error
    if custody is None or bank is None or discovery is None:
        raise SatGeneratePiqdError("PIQD caller setup did not establish ownership")
    if close_error is not None:
        status = "UNKNOWN"
        unsat_verified = False
        diagnostic = f"PIQD close failed closed without masking result: {close_error}"
    try:
        manifest = _result_manifest(
            encoding,
            custody,
            status=status,
            timeout_s=timeout_s,
            model_limit=model_limit,
            raw_count=len(records),
            canonical_count=len(bank.entries()),
            terminal_clause_count=terminal_clause_count,
            unsat_verified=unsat_verified,
            diagnostic=diagnostic,
        )
    except BaseException as publication_error:
        try:
            custody.close()
        except BaseException as custody_error:  # noqa: BLE001
            publication_error.add_note(
                f"held caller custody close also failed: {custody_error!r}"
            )
        raise
    try:
        custody.close()
    except BaseException as custody_error:  # noqa: BLE001
        _ignored_custody_close_error = custody_error
    return manifest


def _published_manifest(custody: _HeldOutputDirectory) -> dict[str, Any]:
    raw = custody.capture("manifest.json", limit=qualification.MAX_CONTROL_BYTES)
    try:
        manifest = json.loads(
            raw,
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise SatGeneratePiqdError(f"manifest.json is not strict JSON: {exc}") from exc
    if type(manifest) is not dict or _canonical_json(manifest, pretty=True) != raw:
        raise SatGeneratePiqdError(
            "manifest.json must be the canonical pretty JSON publication"
        )
    return manifest


def _verify_provenance_manifest(
    custody: _HeldOutputDirectory,
    manifest: Mapping[str, Any],
) -> dict[str, Any]:
    provenance = _provenance_boundary(custody)
    if manifest.get("piqd_provenance") != provenance:
        raise SatGeneratePiqdError("published PIQD provenance boundary is stale")
    status = manifest.get("status")
    if type(status) is not str:
        raise SatGeneratePiqdError("published run status is invalid")
    expected_hashes = _artifact_hashes(
        custody, provenance, status=status, expect_manifest=True
    )
    if manifest.get("artifact_hashes") != expected_hashes:
        raise SatGeneratePiqdError("published artifact hash inventory is stale")
    if manifest.get("status") == "COMPLETE" and not provenance["session_closed"]:
        raise SatGeneratePiqdError("COMPLETE lacks a closed PIQD session boundary")
    return provenance


def _verify_caller_semantics(
    custody: _HeldOutputDirectory,
    encoding: sat.SatEncoding,
) -> None:
    caller = _strict_canonical_json(
        custody.capture(
            "piqd-caller-manifest.json", limit=qualification.MAX_CONTROL_BYTES
        ),
        label="PIQD caller manifest",
    )
    expected_keys = {
        "schema",
        "production_profile",
        "cell",
        "encoding_configuration",
        "pinned_multiplicity",
        "num_vars",
        "num_clauses",
        "variable_map",
        "base_cnf_sha256",
        "source_manifest_sha256",
        "producer_manifest_sha256",
        "authority_sha256",
        "producer_job_id",
        "execution",
    }
    if set(caller) != expected_keys:
        raise SatGeneratePiqdError("PIQD caller manifest field inventory mismatch")
    expected = {
        "schema": SCHEMA,
        "production_profile": qualification.PRODUCTION_V3_PROFILE,
        "cell": sat._cell_json(encoding.cell),
        "encoding_configuration": encoding.configuration(),
        "pinned_multiplicity": encoding.pinned_multiplicity_descriptor,
        "num_vars": encoding.num_vars,
        "num_clauses": len(encoding.clauses),
        "variable_map": [
            [variable, list(key)]
            for variable, key in sorted(encoding.key_for.items())
        ],
        "base_cnf_sha256": qualification.PRODUCTION_V3_BASE_SHA256,
        "execution": {
            "workers": 1,
            "mode": "sequential",
            "discovery_fallback": False,
        },
    }
    for field, value in expected.items():
        if caller.get(field) != value:
            raise SatGeneratePiqdError(f"PIQD caller manifest {field} mismatch")
    for field in (
        "source_manifest_sha256",
        "producer_manifest_sha256",
        "authority_sha256",
    ):
        value = caller.get(field)
        if type(value) is not str or _SHA256.fullmatch(value) is None:
            raise SatGeneratePiqdError(f"PIQD caller manifest {field} is malformed")
    producer_job_id = caller.get("producer_job_id")
    if type(producer_job_id) is not str or not producer_job_id:
        raise SatGeneratePiqdError("PIQD caller manifest producer_job_id is malformed")


def _bank_jsonify(value: Any) -> Any:
    if isinstance(value, (tuple, list)):
        return [_bank_jsonify(item) for item in value]
    if isinstance(value, frozenset):
        return sorted(_bank_jsonify(item) for item in value)
    return value


class _OfflineCanonicalBank:
    """In-memory exact stand-in used only to replay published model records."""

    def __init__(self, cell: Cell) -> None:
        self.cell = cell
        self._entries: dict[str, dict[str, Any]] = {}

    def has(self, digest: str) -> bool:
        entry = self._entries.get(digest)
        return entry is not None and entry.get("status") != "STALE"

    def put(
        self,
        digest: str,
        *,
        status: str,
        fired: Sequence[str],
        hypotheses: Sequence[str],
        canonical: Any,
    ) -> None:
        self._entries[digest] = {
            "digest": digest,
            "status": status,
            "fired": list(fired),
            "hypotheses": sorted(set(hypotheses)),
            "canonical": _bank_jsonify(canonical),
        }

    def entries(self) -> dict[str, dict[str, Any]]:
        return dict(self._entries)


def _model_records(custody: _HeldOutputDirectory) -> list[dict[str, Any]]:
    raw = custody.capture("models.jsonl", allow_empty=True)
    if not raw:
        return []
    records: list[dict[str, Any]] = []
    try:
        text = raw.decode("utf-8")
        for line in text.splitlines():
            value = json.loads(
                line,
                object_pairs_hook=_reject_duplicate_keys,
                parse_constant=_reject_constant,
            )
            if type(value) is not dict:
                raise ValueError("record is not an object")
            records.append(value)
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise SatGeneratePiqdError(f"models.jsonl is malformed: {exc}") from exc
    if sat._jsonl_bytes(records) != raw:
        raise SatGeneratePiqdError("models.jsonl is not the exact canonical publication")
    return records


def _verify_model_and_bank_chain(
    custody: _HeldOutputDirectory,
    encoding: sat.SatEncoding,
) -> tuple[list[dict[str, Any]], list[tuple[int, ...]], _OfflineCanonicalBank]:
    records = _model_records(custody)
    bank = _OfflineCanonicalBank(encoding.cell)
    blocks: list[tuple[int, ...]] = []
    seen: set[tuple[bool, ...]] = set()
    try:
        for index, record in enumerate(records):
            assignment = encoding.assignment_from_record(record)
            obj = encoding.decode(assignment)
            block = encoding.blocking_clause(assignment)
            raw_key = tuple(assignment[var] for var in encoding.semantic_vars)
            if raw_key in seen:
                raise SatGeneratePiqdError(
                    f"duplicate raw semantic assignment at model {index}"
                )
            seen.add(raw_key)
            before = set(bank.entries())
            generator = sat.Generator(
                name="phase3-sat-single-model",
                coverage="PARTIAL",
                produce=lambda _cell, item=obj: iter((item,)),
            )
            iterator_manifest = sat.iterate_cell(encoding.cell, generator, bank)
            digest = sat._canonical_digest(obj)
            expected_record = {
                "index": index,
                "semantic_assignment": encoding.semantic_record(assignment),
                "blocking_clause": list(block),
                "canonical_digest": digest,
                "canonical_was_new": digest not in before,
                "iterator": iterator_manifest,
            }
            if record != expected_record:
                raise SatGeneratePiqdError(
                    f"model record does not replay exactly at index {index}"
                )
            blocks.append(block)
    except SatGeneratePiqdError:
        raise
    except Exception as exc:
        raise SatGeneratePiqdError(f"model/bank replay failed closed: {exc}") from exc

    header = {
        "rule_bank_hash": sat.rule_bank_hash(),
        "spec_version": sat.CanonicalBank.SPEC_VERSION,
        "cell": sat._cell_json(encoding.cell),
    }
    expected_bank = json.dumps(header) + "\n"
    for digest, entry in sorted(bank.entries().items()):
        expected_bank += json.dumps(entry) + "\n"
    if custody.capture("bank.jsonl") != expected_bank.encode():
        raise SatGeneratePiqdError("bank.jsonl does not equal the replayed model bank")
    return records, blocks, bank


def verify_production_run_artifacts(
    run_dir: Path,
    *,
    checker_runner: sat.CheckerRunner = sat.run_drat_trim,
) -> dict[str, Any]:
    """Offline full verifier for additive production-v3 PIQD output.

    It reconstructs the sealed 1194-variable/58314-clause encoding, replays
    every model and bank transition, and rechecks PIQD provenance.  It opens
    no transport and invokes no SAT solver.  A ``COMPLETE`` claim additionally
    reruns only the supplied DRAT checker on the exact terminal artifacts.
    """

    run_dir = _native_path(run_dir, label="run_dir")
    if not callable(checker_runner):
        raise SatGeneratePiqdError("checker_runner must be callable")
    encoding = _seal_production_encoding(
        _production_encoding(Cell(k=4, n=10, profile=(4, 4, 5), exact=True))
    )
    custody = _HeldOutputDirectory(run_dir)
    verification_error: BaseException | None = None
    try:
        manifest = _published_manifest(custody)
        provenance = _verify_provenance_manifest(custody, manifest)
        _verify_caller_semantics(custody, encoding)
        expected_fields = {
            "spec_version",
            "encoding_configuration",
            "semantic_assignment_schema",
            "cell",
            "mode",
            "clause_tags",
            "semantic_variable_count",
            "base_variable_count",
            "base_clause_count",
            "terminal_variable_count",
            "terminal_clause_count",
            "solver_version",
            "checker_version",
            "timeout_s",
            "model_limit",
            "rule_bank_hash",
            "status",
            "result_claim",
            "raw_count",
            "canonical_count",
            "unsat_verified",
            "diagnostic",
            "piqd_provenance",
            "artifact_hashes",
        }
        if set(manifest) != expected_fields:
            raise SatGeneratePiqdError("manifest semantic field inventory mismatch")
        expected_scalars = {
            "spec_version": encoding.spec_version,
            "encoding_configuration": encoding.configuration(),
            "semantic_assignment_schema": encoding.semantic_schema,
            "cell": sat._cell_json(encoding.cell),
            "mode": encoding.mode,
            "clause_tags": dict(encoding.clause_counts),
            "semantic_variable_count": len(encoding.semantic_vars),
            "base_variable_count": encoding.num_vars,
            "base_clause_count": len(encoding.clauses),
            "solver_version": (
                "PIQD incremental v3 discovery; local CaDiCaL terminal rerun"
            ),
            "checker_version": "local drat-trim terminal verification",
            "rule_bank_hash": sat.rule_bank_hash(),
        }
        for field, expected in expected_scalars.items():
            if manifest.get(field) != expected:
                raise SatGeneratePiqdError(f"manifest {field} mismatch")
        timeout_s = manifest.get("timeout_s")
        model_limit = manifest.get("model_limit")
        if type(timeout_s) is not int or timeout_s <= 0:
            raise SatGeneratePiqdError("manifest timeout_s is invalid")
        if model_limit is not None and (
            type(model_limit) is not int or model_limit <= 0
        ):
            raise SatGeneratePiqdError("manifest model_limit is invalid")
        diagnostic = manifest.get("diagnostic")
        if diagnostic is not None and type(diagnostic) is not str:
            raise SatGeneratePiqdError("manifest diagnostic is invalid")
        status = manifest.get("status")
        if status not in {"PARTIAL", "COMPLETE", "UNKNOWN"}:
            raise SatGeneratePiqdError("manifest status is invalid")
        if manifest.get("result_claim") != sat._claim_for(status):
            raise SatGeneratePiqdError("manifest result_claim is inconsistent")
        if type(manifest.get("unsat_verified")) is not bool:
            raise SatGeneratePiqdError("manifest unsat_verified is not a boolean")
        if (status == "COMPLETE") != manifest["unsat_verified"]:
            raise SatGeneratePiqdError("manifest verified-UNSAT claim is inconsistent")
        if status == "COMPLETE" and not provenance["session_closed"]:
            raise SatGeneratePiqdError("COMPLETE lacks closed PIQD provenance")

        base_raw = custody.capture("base.cnf")
        if base_raw != encoding.cnf_bytes():
            raise SatGeneratePiqdError("base.cnf is not the sealed production-v3 base")
        records, blocks, bank = _verify_model_and_bank_chain(custody, encoding)
        if manifest.get("raw_count") != len(records):
            raise SatGeneratePiqdError("manifest raw_count mismatch")
        if manifest.get("canonical_count") != len(bank.entries()):
            raise SatGeneratePiqdError("manifest canonical_count mismatch")

        artifact_names = set(manifest["artifact_hashes"])
        terminal_present = "terminal.cnf" in artifact_names
        proof_present = "terminal.drat" in artifact_names
        check_present = "terminal.drat.check" in artifact_names
        if proof_present and not terminal_present:
            raise SatGeneratePiqdError("terminal.drat lacks terminal.cnf")
        if check_present and not proof_present:
            raise SatGeneratePiqdError("terminal checker metadata lacks terminal.drat")
        if terminal_present:
            expected_terminal = encoding.cnf_bytes(blocks)
            if custody.capture("terminal.cnf") != expected_terminal:
                raise SatGeneratePiqdError(
                    "terminal.cnf does not equal sealed base plus ordered raw blocks"
                )
            if manifest.get("terminal_variable_count") != encoding.num_vars:
                raise SatGeneratePiqdError("manifest terminal_variable_count mismatch")
            if manifest.get("terminal_clause_count") != len(encoding.clauses) + len(
                blocks
            ):
                raise SatGeneratePiqdError("manifest terminal_clause_count mismatch")
        elif (
            manifest.get("terminal_variable_count") is not None
            or manifest.get("terminal_clause_count") is not None
        ):
            raise SatGeneratePiqdError("manifest names a missing terminal CNF")

        if status == "COMPLETE":
            if not (terminal_present and proof_present and check_present):
                raise SatGeneratePiqdError(
                    "COMPLETE lacks terminal CNF, DRAT, or checker metadata"
                )
            historical_check = custody.capture("terminal.drat.check").decode("utf-8")
            if not any(
                line.strip() == "s VERIFIED" for line in historical_check.splitlines()
            ):
                raise SatGeneratePiqdError(
                    "COMPLETE historical checker metadata lacks exact s VERIFIED"
                )
            terminal_before = custody.capture("terminal.cnf")
            proof_before = custody.capture("terminal.drat")
            checked = checker_runner(
                run_dir / "terminal.cnf", run_dir / "terminal.drat", timeout_s
            )
            if type(checked) is not sat.CheckerResult or not checked.verified:
                raise SatGeneratePiqdError("COMPLETE terminal DRAT no longer verifies")
            if (
                custody.capture("terminal.cnf") != terminal_before
                or custody.capture("terminal.drat") != proof_before
            ):
                raise SatGeneratePiqdError("terminal artifacts changed during checking")
        result = manifest
    except BaseException as exc:
        verification_error = exc
        raise
    finally:
        try:
            custody.close()
        except BaseException as close_error:
            if verification_error is not None:
                verification_error.add_note(
                    f"held verification custody close also failed: {close_error!r}"
                )
            else:
                raise
    return result


def verify_piqd_provenance(run_dir: Path) -> dict[str, Any]:
    """Independently recheck only the durable PIQD caller/session hash boundary."""

    run_dir = _native_path(run_dir, label="run_dir")
    custody = _HeldOutputDirectory(run_dir)
    verification_error: BaseException | None = None
    try:
        manifest = _published_manifest(custody)
        _verify_provenance_manifest(custody, manifest)
        result = manifest
    except BaseException as exc:
        verification_error = exc
        raise
    finally:
        try:
            custody.close()
        except BaseException as close_error:
            if verification_error is not None:
                verification_error.add_note(
                    f"held verification custody close also failed: {close_error!r}"
                )
            else:
                raise
    return result


def make_sat_generate_piqd_factory(
    config: SatGeneratePiqdConfig,
    *,
    local_proof_runner: SolverBackend,
) -> SatGeneratePiqdFactory:
    """Build a lazy production-v3 factory for :func:`enumerate_cell`."""

    return SatGeneratePiqdFactory(config, local_proof_runner)


def _absolute_path_argument(text: str) -> Path:
    return Path(os.path.abspath(text))


def main(argv: Sequence[str] | None = None) -> int:
    """Production launcher; PIQD is default and legacy-local is explicit."""

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--k", type=int)
    parser.add_argument("--n", type=int)
    parser.add_argument("--profile", type=sat._parse_profile, default=None)
    parser.add_argument("--timeout", type=int, default=30)
    parser.add_argument("--model-limit", type=int)
    parser.add_argument("--out", type=_absolute_path_argument, required=True)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--overwrite", action="store_true")
    parser.add_argument(
        "--solver-backend", choices=("piqd", "legacy-local"), default="piqd"
    )
    parser.add_argument("--blocker", action="store_true")
    parser.add_argument("--project-blockers", action="store_true")
    parser.add_argument("--static-dual2", action="store_true")
    parser.add_argument("--mincut-scope", choices=sat.MINCUT_SCOPES)
    parser.add_argument("--piqd-base-url")
    parser.add_argument("--piqd-custody-root", type=_absolute_path_argument)
    parser.add_argument("--piqd-source-manifest", type=_absolute_path_argument)
    parser.add_argument("--piqd-producer-manifest", type=_absolute_path_argument)
    parser.add_argument("--piqd-producer-job-id")
    parser.add_argument("--piqd-solver-name")
    parser.add_argument("--piqd-authority", type=_absolute_path_argument)
    args = parser.parse_args(argv)
    if args.check:
        manifest = verify_production_run_artifacts(args.out)
        print(json.dumps(manifest, indent=2, sort_keys=True))
        return 0
    if args.k is None or args.n is None:
        parser.error("generation requires --k and --n")
    cell = Cell(k=args.k, n=args.n, profile=args.profile, exact=True)

    if args.solver_backend == "legacy-local":
        manifest = sat.enumerate_cell(
            cell,
            args.out,
            blocker=args.blocker,
            project_blockers=args.project_blockers,
            static_dual2=args.static_dual2,
            mincut_scope=args.mincut_scope,
            timeout_s=args.timeout,
            model_limit=args.model_limit,
            resume=args.resume,
            overwrite=args.overwrite,
        )
    else:
        required = {
            "--piqd-base-url": args.piqd_base_url,
            "--piqd-custody-root": args.piqd_custody_root,
            "--piqd-source-manifest": args.piqd_source_manifest,
            "--piqd-producer-manifest": args.piqd_producer_manifest,
            "--piqd-producer-job-id": args.piqd_producer_job_id,
            "--piqd-solver-name": args.piqd_solver_name,
            "--piqd-authority": args.piqd_authority,
        }
        missing = [flag for flag, value in required.items() if value is None]
        if missing:
            parser.error("PIQD backend requires " + ", ".join(missing))
        config = SatGeneratePiqdConfig(
            base_url=args.piqd_base_url,
            custody_root=args.piqd_custody_root,
            source_manifest_path=args.piqd_source_manifest,
            producer_manifest_path=args.piqd_producer_manifest,
            producer_job_id=args.piqd_producer_job_id,
            solver_name=args.piqd_solver_name,
            authority_path=args.piqd_authority,
        )
        manifest = enumerate_cell_with_piqd(
            cell,
            args.out,
            config=config,
            timeout_s=args.timeout,
            model_limit=args.model_limit,
            resume=args.resume,
            overwrite=args.overwrite,
        )
    print(json.dumps(manifest, indent=2, sort_keys=True))
    return 0 if manifest["status"] in {"PARTIAL", "COMPLETE"} else 2


__all__ = [
    "SCHEMA",
    "SatGeneratePiqdConfig",
    "SatGeneratePiqdError",
    "SatGeneratePiqdFactory",
    "SatGeneratePiqdRunner",
    "enumerate_cell_with_piqd",
    "make_sat_generate_piqd_factory",
    "verify_piqd_provenance",
    "verify_production_run_artifacts",
]


if __name__ == "__main__":
    raise SystemExit(main())
