#!/usr/bin/env python3
"""Run the exact projected-static-v3 PIQD production canary once."""

from __future__ import annotations

import argparse
import hashlib
import os
import secrets
import stat
import sys
import time
import urllib.parse
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCRIPT_REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(SCRIPT_REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(SCRIPT_REPOSITORY_ROOT))

from census.p97_search import (
    phase3_piqd_incremental_discovery as incremental,
)
from census.p97_search import phase3_piqd_incremental_v3 as incremental_v3
from census.p97_search import (
    phase3_piqd_projected_v3_qualification as qualification,
)
from census.p97_search.phase3_cegar_wave import (
    WaveContractError,
    canonical_json_bytes,
)
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    stdlib_http_transport,
)

STATUS_SCHEMA = "p97-piqd-projected-v3-canary-status/v1"
SOLVER_NAME = qualification.PRODUCTION_SOLVER_NAME
DEFAULT_DAEMON_URL = "http://127.0.0.1:7272"
PROJECT = "erdos-97-96-formalization"
TIMEOUT_SECONDS = 900
MAX_INPUT_BYTES = 1 << 30
MAX_STATUS_BYTES = 4_096
PRODUCER_STATUS_POLLS = 181
PRODUCER_STATUS_INTERVAL_SECONDS = 5.0

PROJECTOR_PATH = "census/p97_search/phase3_structural_cegar_projected_static_v3.py"
PREFIX_BANK_PATH = "census/p97_search/phase3_three_rhombus_prefix_bank.py"
SAT_GENERATE_PATH = "census/p97_search/sat_generate.py"

SOURCE_MANIFEST = {
    "cardinality_scope": (
        "one projected-static-v3 shard: shard 4 of 32, n=10, "
        "1194 variables, 58319 base clauses"
    ),
    "claims": {
        "lean_closure": False,
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
    },
    "finite_schema": "p97-phase3-structural-cegar-projected-static-v3",
    "schema": "p97-piqd-static-source/v1",
    "source_id": (
        "phase3-projected-static-v3:"
        f"{qualification.PRODUCTION_REPOSITORY_COMMIT}:shard-04"
    ),
    "source_path": PROJECTOR_PATH,
    "source_sha256": qualification.PRODUCTION_SOURCE_BUNDLE[PROJECTOR_PATH][1],
    "source_theorem": "NONE: finite discovery evidence only",
}
SOURCE_MANIFEST_BYTES = canonical_json_bytes(SOURCE_MANIFEST)

VARIABLE_MAP = [
    [center, point, 1 + 9 * center + (point if point < center else point - 1)]
    for center in range(10)
    for point in range(10)
    if center != point
]
VARIABLE_MAP_BYTES = canonical_json_bytes(VARIABLE_MAP)
VARIABLE_MAP_DESCRIPTOR = {
    "formula": "1 + (n-1)*center + (point if point<center else point-1)",
    "mapping_sha256": qualification.PRODUCTION_VARIABLE_MAP_SHA256,
    "n": 10,
    "schema": "p97-phase3-row-major-s-dimacs-v1",
    "variable_count": 90,
}
VARIABLE_MAP_DESCRIPTOR_BYTES = canonical_json_bytes(VARIABLE_MAP_DESCRIPTOR)

PRODUCER_MANIFEST = {
    "backend": "cadical",
    "claims": {
        "lean_closure": False,
        "one_core": False,
        "one_process": False,
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
    },
    "producer_id": "phase3-projected-static-v3:shard-04:static-dimacs-v1",
    "producer_kind": "static-dimacs",
    "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
    "schema": "p97-piqd-static-producer/v1",
    "solver_profile": "sat",
    "source_manifest": SOURCE_MANIFEST,
    "source_manifest_sha256": qualification.PRODUCTION_SOURCE_MANIFEST_SHA256,
    "variable_map_sha256": qualification.PRODUCTION_VARIABLE_MAP_SHA256,
}
PRODUCER_MANIFEST_BYTES = canonical_json_bytes(PRODUCER_MANIFEST)

WAVE_MANIFEST = {
    "encoding": {
        "cnf_sha256": qualification.PRODUCTION_BASE_SHA256,
        "num_clauses": qualification.PRODUCTION_BASE_CLAUSES,
        "num_variables": qualification.PRODUCTION_VARIABLES,
        "producer_manifest_sha256": (qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256),
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "variable_map_sha256": qualification.PRODUCTION_VARIABLE_MAP_SHA256,
    },
    "execution": {
        "backend": "cadical",
        "order_sha256": (
            "7ecca6e18ee177012bafe94ed6f4d8c25f7ae07b5d5b38cde52f9935bc526df3"
        ),
        "seed": 97,
        "shard_count": 32,
        "shard_id": 4,
        "solver_profile": "sat",
    },
    "iteration": 0,
    "parent_checkpoint_sha256": None,
    "promotion": {
        "consumer_theorem": None,
        "evidence_classification": "LOCAL_CERTIFICATE",
        "lift_theorem": None,
        "producer_theorem": None,
    },
    "schema": "p97-cegar-wave/v1",
    "source": {
        "cardinality_scope": SOURCE_MANIFEST["cardinality_scope"],
        "finite_schema": SOURCE_MANIFEST["finite_schema"],
        "ingress_hypotheses_sha256": SOURCE_MANIFEST["source_sha256"],
        "live_leaf": "phase3_structural_cegar_projected_static_v3",
        "source_theorem": SOURCE_MANIFEST["source_theorem"],
    },
    "wave_id": "p97-projected-static-v3-live-canary-20260810-shard-04",
}
WAVE_MANIFEST_BYTES = canonical_json_bytes(WAVE_MANIFEST)


class CanaryError(RuntimeError):
    """Expected fail-closed launcher or input error."""


@dataclass(frozen=True)
class CanaryConfig:
    repository_root: Path
    historical_shard_root: Path
    historical_projector: Path
    historical_prefix_bank: Path
    historical_sat_generate: Path
    output_dir: Path
    daemon_url: str = DEFAULT_DAEMON_URL


@dataclass(frozen=True)
class AuthenticatedInputs:
    base_path: Path
    current_path: Path
    base: bytes
    current: bytes
    historical_sources: dict[str, Path]


HttpTransport = Callable[
    [str, str, bytes | MultipartBody | None, Mapping[str, str]], HttpResponse
]


class DaemonTransport:
    """One origin-pinned transport usable by raw-job and session clients."""

    def __init__(self, base_url: str, http_transport: HttpTransport) -> None:
        parsed = urllib.parse.urlsplit(base_url.rstrip("/"))
        if parsed.scheme not in {"http", "https"} or not parsed.hostname:
            raise CanaryError("daemon URL must be an absolute HTTP(S) origin")
        if parsed.path not in {"", "/"} or parsed.query or parsed.fragment:
            raise CanaryError("daemon URL must not contain a path, query, or fragment")
        try:
            port = parsed.port
        except ValueError as exc:
            raise CanaryError("daemon URL has an invalid port") from exc
        default_port = 443 if parsed.scheme == "https" else 80
        self.base_url = f"{parsed.scheme}://{parsed.hostname}:{port or default_port}"
        self._origin = (parsed.scheme, parsed.hostname, port or default_port)
        self._http_transport = http_transport

    def __call__(
        self,
        method: str,
        path_or_url: str,
        body: bytes | MultipartBody | None,
        headers: Mapping[str, str],
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(path_or_url)
        if parsed.scheme:
            try:
                port = parsed.port
            except ValueError as exc:
                raise CanaryError("PIQD request URL has an invalid port") from exc
            observed = (
                parsed.scheme,
                parsed.hostname,
                port or (443 if parsed.scheme == "https" else 80),
            )
            if observed != self._origin:
                raise CanaryError("PIQD request escaped the configured daemon origin")
            url = path_or_url
        else:
            if not path_or_url.startswith("/") or path_or_url.startswith("//"):
                raise CanaryError("PIQD request path is not origin-relative")
            url = self.base_url + path_or_url
        try:
            return self._http_transport(method, url, body, headers)
        except OSError as exc:
            raise PiqdOracleError(
                f"piqd transport failed: {exc}", retryable=True
            ) from exc


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _read_fd(descriptor: int, size: int) -> bytes:
    chunks: list[bytes] = []
    remaining = size
    while remaining:
        chunk = os.read(descriptor, min(1 << 20, remaining))
        if not chunk:
            raise CanaryError("authenticated input ended before its captured size")
        chunks.append(chunk)
        remaining -= len(chunk)
    if os.read(descriptor, 1):
        raise CanaryError("authenticated input grew during capture")
    return b"".join(chunks)


def _read_regular(path: Path, *, label: str) -> bytes:
    absolute = _absolute(path)
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(absolute, flags)
    except OSError as exc:
        raise CanaryError(f"cannot open {label}") from exc
    try:
        before = os.fstat(descriptor)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or before.st_size < 0
            or before.st_size > MAX_INPUT_BYTES
        ):
            raise CanaryError(f"{label} is not one bounded singly-linked regular file")
        payload = _read_fd(descriptor, before.st_size)
        after = os.fstat(descriptor)
        identity = lambda item: (
            item.st_dev,
            item.st_ino,
            item.st_mode,
            item.st_nlink,
            item.st_size,
            item.st_mtime_ns,
            item.st_ctime_ns,
        )
        if identity(before) != identity(after):
            raise CanaryError(f"{label} changed during capture")
        return payload
    finally:
        os.close(descriptor)


def _directory(path: Path, *, label: str) -> Path:
    absolute = _absolute(path)
    try:
        info = os.lstat(absolute)
    except OSError as exc:
        raise CanaryError(f"cannot inspect {label}") from exc
    if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
        raise CanaryError(f"{label} must be a real directory")
    return absolute


def _journal_bytes(clauses: tuple[tuple[int, ...], ...]) -> bytes:
    return b"".join(
        (
            " ".join(str(literal) for literal in clause)
            + (" " if clause else "")
            + "0\n"
        ).encode("ascii")
        for clause in clauses
    )


def _render_dimacs(variables: int, clauses: tuple[tuple[int, ...], ...]) -> bytes:
    return f"p cnf {variables} {len(clauses)}\n".encode("ascii") + _journal_bytes(
        clauses
    )


def authenticate_inputs(config: CanaryConfig) -> AuthenticatedInputs:
    repository_root = _directory(config.repository_root, label="repository root")
    shard_root = _directory(config.historical_shard_root, label="historical shard root")
    output = _absolute(config.output_dir)
    if output.exists() or output.is_symlink():
        raise CanaryError("qualification output directory already exists")
    _directory(output.parent, label="qualification output parent")

    sources = {
        PROJECTOR_PATH: _absolute(config.historical_projector),
        PREFIX_BANK_PATH: _absolute(config.historical_prefix_bank),
        SAT_GENERATE_PATH: _absolute(config.historical_sat_generate),
    }
    for declared, path in sources.items():
        expected = qualification.PRODUCTION_SOURCE_BUNDLE[declared][1]
        if _sha(_read_regular(path, label=f"historical source {declared}")) != expected:
            raise CanaryError(f"historical source hash disagrees: {declared}")

    base_path = shard_root / "base.cnf"
    current_path = shard_root / ".solver.cnf"
    base = _read_regular(base_path, label="historical stable base CNF")
    current = _read_regular(current_path, label="historical current CNF")
    if _sha(base) != qualification.PRODUCTION_BASE_SHA256:
        raise CanaryError("historical stable base CNF hash disagrees")
    if _sha(current) != qualification.PRODUCTION_CURRENT_SHA256:
        raise CanaryError("historical current CNF hash disagrees")
    variables, base_clauses = incremental.parse_dimacs(base)
    current_variables, current_clauses = incremental.parse_dimacs(current)
    if (
        variables != qualification.PRODUCTION_VARIABLES
        or current_variables != variables
        or len(base_clauses) != qualification.PRODUCTION_BASE_CLAUSES
        or len(current_clauses) != qualification.PRODUCTION_CURRENT_CLAUSES
        or current_clauses[: len(base_clauses)] != base_clauses
    ):
        raise CanaryError("historical CNF dimensions or exact prefix disagree")
    suffix = current_clauses[len(base_clauses) :]
    suffix_bytes = _journal_bytes(suffix)
    if (
        len(suffix) != qualification.PRODUCTION_SUFFIX_CLAUSES
        or len(suffix_bytes) != qualification.PRODUCTION_SUFFIX_BYTES
        or _sha(suffix_bytes) != qualification.PRODUCTION_SUFFIX_SHA256
    ):
        raise CanaryError("historical ordered suffix identity disagrees")
    if repository_root != _absolute(config.repository_root):
        raise CanaryError("repository root normalization disagrees")
    return AuthenticatedInputs(base_path, current_path, base, current, sources)


def _write_all(descriptor: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(descriptor, view)
        if type(written) is not int or written <= 0:
            raise CanaryError("short write while extending terminal frontier")
        view = view[written:]


def append_terminal_canary(root: Path, historical_current: bytes) -> bytes:
    variables, clauses = incremental.parse_dimacs(historical_current)
    terminal = _render_dimacs(
        variables, (*clauses, qualification.PRODUCTION_CANARY_CLAUSE)
    )
    root = _directory(root, label="qualification custody root")
    root_flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    root_fd = os.open(root, root_flags)
    temporary = f".solver.cnf.canary-{secrets.token_hex(12)}"
    temp_created = False
    try:
        target_flags = (
            os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
        )
        target_fd = os.open(".solver.cnf", target_flags, dir_fd=root_fd)
        try:
            target_info = os.fstat(target_fd)
            if (
                not stat.S_ISREG(target_info.st_mode)
                or target_info.st_nlink != 1
                or target_info.st_uid != os.getuid()
                or target_info.st_mode & 0o077
            ):
                raise CanaryError("live solver frontier custody is not private")
            if _read_fd(target_fd, target_info.st_size) != historical_current:
                raise CanaryError("live solver frontier is not historical current")
        finally:
            os.close(target_fd)
        create_flags = (
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0)
        )
        temp_fd = os.open(temporary, create_flags, 0o600, dir_fd=root_fd)
        temp_created = True
        try:
            _write_all(temp_fd, terminal)
            os.fsync(temp_fd)
        finally:
            os.close(temp_fd)
        os.replace(
            temporary,
            ".solver.cnf",
            src_dir_fd=root_fd,
            dst_dir_fd=root_fd,
        )
        temp_created = False
        os.fsync(root_fd)
    except OSError as exc:
        raise CanaryError("cannot extend the terminal solver frontier") from exc
    finally:
        if temp_created:
            try:
                os.unlink(temporary, dir_fd=root_fd)
            except OSError:
                pass
        os.close(root_fd)
    if (
        _read_regular(root / ".solver.cnf", label="terminal solver frontier")
        != terminal
    ):
        raise CanaryError("terminal solver frontier replacement did not persist")
    return terminal


def _no_local_proof(_cnf_path: Path, _timeout_s: int, _proof_path: Path | None) -> Any:
    raise CanaryError("production canary discovery must not invoke a local solver")


def _replay_total_model(cnf: bytes, assignment: Mapping[int, bool]) -> None:
    variables, clauses = incremental.parse_dimacs(cnf)
    if (
        type(assignment) is not dict
        or set(assignment) != set(range(1, variables + 1))
        or any(type(value) is not bool for value in assignment.values())
    ):
        raise CanaryError("historical SAT result is not one total model")
    if any(
        not any(assignment[abs(literal)] is (literal > 0) for literal in clause)
        for clause in clauses
    ):
        raise CanaryError("historical SAT model fails exact current-CNF replay")


def _validated_canonical_constants() -> None:
    expected = (
        (SOURCE_MANIFEST_BYTES, qualification.PRODUCTION_SOURCE_MANIFEST_SHA256),
        (PRODUCER_MANIFEST_BYTES, qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256),
        (VARIABLE_MAP_BYTES, qualification.PRODUCTION_VARIABLE_MAP_SHA256),
        (
            VARIABLE_MAP_DESCRIPTOR_BYTES,
            "fd59dcaa0f2dabb93504050ff1544d8463c0633de5f67427213d38c9c9eca854",
        ),
        (
            WAVE_MANIFEST_BYTES,
            "abdf66bb69b726a4d75870d0c8ea442bb17a6cc4b5cb3b34761a7ec07a10ba00",
        ),
    )
    if any(_sha(payload) != digest for payload, digest in expected):
        raise CanaryError("embedded production manifest identity disagrees")


def run_canary(
    config: CanaryConfig,
    *,
    http_transport: HttpTransport = stdlib_http_transport,
    authenticate: Callable[[CanaryConfig], AuthenticatedInputs] = authenticate_inputs,
    client_factory: Callable[..., Any] = PiqdRawDimacsClient,
    prepare: Callable[..., Any] = qualification.prepare_qualification,
    runner_factory: Callable[..., Any] = (
        incremental_v3.make_piqd_incremental_v3_solver_runner
    ),
    finalize: Callable[[Any], dict[str, Any]] = qualification.finalize_qualification,
    validate: Callable[[Path], dict[str, Any]] = qualification.validate_qualification,
    sleep: Callable[[float], None] = time.sleep,
) -> dict[str, Any]:
    """Execute one fail-closed canary; dependency seams are for offline tests."""

    _validated_canonical_constants()
    inputs = authenticate(config)
    daemon = DaemonTransport(config.daemon_url, http_transport)
    client = client_factory(daemon.base_url, transport=daemon, segmented_multipart=True)
    job = client.prepare_cnf(
        wave_manifest=WAVE_MANIFEST,
        cnf=inputs.base,
        producer_manifest=PRODUCER_MANIFEST_BYTES,
        timeout_s=TIMEOUT_SECONDS,
        march_timeout_s=TIMEOUT_SECONDS,
        project=PROJECT,
        requested_core_limit=1,
    )
    if type(job) is not PreparedJob:
        raise CanaryError("raw-DIMACS prepare returned the wrong job type")
    if (
        job.backend != "cadical"
        or job.solver_profile != "sat"
        or job.cnf_blob_hash != qualification.PRODUCTION_BASE_SHA256
        or job.identity_hash != qualification.PRODUCTION_RAW_DIMACS_IDENTITY
        or job.num_vars != qualification.PRODUCTION_VARIABLES
        or job.num_clauses != qualification.PRODUCTION_BASE_CLAUSES
        or job.requested_core_limit != 1
    ):
        raise CanaryError("raw-DIMACS producer job identity disagrees")
    if type(job.existing) is not bool:
        raise CanaryError("raw-DIMACS producer existing is not builtin bool")
    client.verify_stored_cnf(job, expected_cnf=inputs.base)
    confirmed = client.confirm(job, expected_cnf=inputs.base)
    if confirmed not in {"confirmed", "running", "completed"}:
        raise CanaryError("producer job did not reach a confirmed state")
    for poll_index in range(PRODUCER_STATUS_POLLS):
        status = client.status(job.job_id)
        if type(status) is not dict:
            raise CanaryError("producer job status is not an exact object")
        state = status.get("status")
        if state == "completed":
            if status.get("result") != "SAT":
                raise CanaryError("completed producer job did not return SAT")
            break
        if state not in {"confirmed", "running"}:
            raise CanaryError(f"producer job reached disallowed status {state!r}")
        if poll_index + 1 == PRODUCER_STATUS_POLLS:
            raise CanaryError("producer job did not complete within the bounded poll")
        sleep(PRODUCER_STATUS_INTERVAL_SECONDS)
    else:  # pragma: no cover - range is statically nonempty
        raise CanaryError("producer job polling bound is invalid")

    contract = prepare(
        repository_root=_absolute(config.repository_root),
        repository_commit=qualification.PRODUCTION_REPOSITORY_COMMIT,
        output_dir=_absolute(config.output_dir),
        source_manifest=SOURCE_MANIFEST_BYTES,
        producer_manifest=PRODUCER_MANIFEST_BYTES,
        expected_source_manifest_sha256=(
            qualification.PRODUCTION_SOURCE_MANIFEST_SHA256
        ),
        expected_producer_manifest_sha256=(
            qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256
        ),
        historical_source_paths=inputs.historical_sources,
        base_cnf_path=inputs.base_path,
        current_cnf_path=inputs.current_path,
        producer_job=job,
        solver_name=SOLVER_NAME,
        daemon_url=daemon.base_url,
        transport=daemon,
    )
    runner = None
    close_called = False
    try:
        runner = runner_factory(
            base_url=daemon.base_url,
            custody_root=contract.directory,
            base_cnf_path=contract.directory / "base.cnf",
            source_manifest=SOURCE_MANIFEST_BYTES,
            producer_manifest=PRODUCER_MANIFEST_BYTES,
            producer_job_id=job.job_id,
            solver_name=SOLVER_NAME,
            local_proof_runner=_no_local_proof,
            transport=qualification.qualified_transport(contract),
            expected_solver_sha256=contract.solver_sha256,
            expected_solver_signature=contract.solver_signature,
            session_identity_evidence_path=contract.identity_evidence_path,
        )
        solver_path = contract.directory / ".solver.cnf"
        sat = runner(solver_path, TIMEOUT_SECONDS, None)
        if type(sat) is not incremental_v3.LegacyDiscoveryResult:
            raise CanaryError("historical solve returned the wrong result type")
        if sat.verdict != "SAT":
            raise CanaryError(f"historical frontier returned {sat.verdict}")
        _replay_total_model(inputs.current, sat.assignment)
        append_terminal_canary(contract.directory, inputs.current)
        terminal = runner(solver_path, TIMEOUT_SECONDS, None)
        if type(terminal) is not incremental_v3.LegacyDiscoveryResult:
            raise CanaryError("terminal solve returned the wrong result type")
        if (
            terminal.verdict != "UNSAT"
            or type(terminal.assignment) is not dict
            or terminal.assignment
        ):
            raise CanaryError("terminal frontier did not return assignment-free UNSAT")
        close_called = True
        runner.close()
        packet = finalize(contract)
        validation = validate(contract.directory)
    finally:
        if runner is not None and not close_called:
            close_called = True
            runner.close()
    if type(packet) is not dict or type(validation) is not dict:
        raise CanaryError("qualification finalization returned malformed evidence")
    return {
        "schema": STATUS_SCHEMA,
        "status": "qualified",
        "output_dir": str(contract.directory),
        "producer_job_id": job.job_id,
        "producer_job_existing": job.existing,
        "producer_job_custody": "reused" if job.existing else "fresh",
        "historical_status": "SAT",
        "terminal_status": "UNSAT",
        "qualification_schema": packet.get("schema"),
        "validation_schema": validation.get("schema"),
        "qualification_sha256": _sha(canonical_json_bytes(packet)),
        "proof_verified": False,
        "local_drat_required": True,
    }


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", required=True, type=Path)
    parser.add_argument("--historical-shard-root", required=True, type=Path)
    parser.add_argument("--historical-projector", required=True, type=Path)
    parser.add_argument("--historical-prefix-bank", required=True, type=Path)
    parser.add_argument("--historical-sat-generate", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--daemon-url", default=DEFAULT_DAEMON_URL)
    return parser


def _emit(value: dict[str, Any]) -> None:
    raw = canonical_json_bytes(value)
    if len(raw) > MAX_STATUS_BYTES:
        raw = canonical_json_bytes(
            {
                "schema": STATUS_SCHEMA,
                "status": "error",
                "error_type": "CanaryError",
                "error": "bounded status output exceeded",
            }
        )
    sys.stdout.buffer.write(raw + b"\n")


def main(argv: list[str] | None = None) -> int:
    arguments = _parser().parse_args(argv)
    config = CanaryConfig(
        repository_root=arguments.repo_root,
        historical_shard_root=arguments.historical_shard_root,
        historical_projector=arguments.historical_projector,
        historical_prefix_bank=arguments.historical_prefix_bank,
        historical_sat_generate=arguments.historical_sat_generate,
        output_dir=arguments.output_dir,
        daemon_url=arguments.daemon_url,
    )
    expected_errors = (
        CanaryError,
        PiqdOracleError,
        WaveContractError,
        qualification.QualificationError,
        incremental.PiqdIncrementalDiscoveryError,
        incremental_v3.PiqdIncrementalV3Error,
    )
    try:
        result = run_canary(config)
    except expected_errors as exc:
        _emit(
            {
                "schema": STATUS_SCHEMA,
                "status": "error",
                "error_type": type(exc).__name__,
                "error": str(exc)[:500],
                "output_dir": str(_absolute(config.output_dir)),
                "artifacts_preserved": os.path.lexists(
                    os.fspath(_absolute(config.output_dir))
                ),
            }
        )
        return 2
    _emit(result)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
