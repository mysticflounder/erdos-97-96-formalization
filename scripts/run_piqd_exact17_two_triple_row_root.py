"""Run the authenticated exact-17 two-triple-row root through PIQD once.

This wrapper uses the hardened static-CNF boundary.  It reserves one immutable
production run directory, fetches and pins the live daemon/solver identities,
allows exactly one prepare and one confirm attempt, requires PIQD's stored CNF
readback, and retains the sealed attempt journal, model, and log custody.

SAT is returned only after the generic boundary independently replays the total
assignment against the exact CNF.  UNSAT remains explicitly uncertified here:
the generic static boundary does not retrieve or replay PIQD's proof.
"""

from __future__ import annotations

import argparse
import fcntl
import http.client
import json
import os
import re
import stat
import sys
import time
import urllib.parse
from collections.abc import Callable, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCRIPT_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(SCRIPT_ROOT))

from validate_exact17_two_triple_row_ingress import (
    MAX_REQUESTED_CORE_LIMIT,
    PRODUCTION_INGRESS_PATHS,
    PRODUCTION_INGRESS_SPEC,
    RECEIPT_SHA256,
    REQUESTED_CORE_LIMIT,
    TIMEOUT_S,
    VARIABLE_MAP_SHA256,
    IngressPaths,
    IngressSpec,
    IngressValidationError,
    _strict_json,
    validate_ingress,
)

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    Transport,
    stdlib_http_transport,
)
from census.p97_search.phase3_piqd_static_solver_runner import (
    ATTESTED_SOLVER_RESULT,
    CERTIFICATE_BLOCKER,
    PRODUCER_SCHEMA,
    RECEIPT_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    authenticate_static_manifests,
    make_static_piqd_solver_runner,
)

ROOT = SCRIPT_ROOT
RUN_ROOT = ROOT / "scratch/runs/exact17-two-triple-row-piqd/current-root-v2"
RUN_SCHEMA = "p97-exact17-two-triple-row-piqd-run/v1"
LAUNCH_SCHEMA = "p97-exact17-two-triple-row-piqd-launch/v1"
PROJECT = "erdos-97-96-exact17-two-triple-row-v2"
MAX_POLLS = 2_400
POLL_INTERVAL_S = 2.0
MAX_HTTP_JSON_BYTES = 1 << 20
MAX_CNF_BYTES = 384 * 1024 * 1024
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenTwoTripleRowRefinements."
    "sourceAssign_extendedTwoTripleRowCnf"
)
SOURCE_MANIFEST_SHA256 = (
    "41c1ee03c5b290b978883bb941090931893afaf9cb208c40c3d567d1d869cb42"
)
PRODUCER_MANIFEST_SHA256 = (
    "dece7db8d5eb37f21b3020b6a45431a7ddeac271ed3ddd0ed76e7d2744bfdca4"
)


class TwoTripleRowRunnerError(RuntimeError):
    """The one-shot exact17 runner failed a launch or custody gate."""


class _ManifestVerifyingTransport:
    """Verify PIQD's returned and retrieved producer manifest before confirm."""

    def __init__(
        self,
        upstream: Transport,
        producer_manifest: bytes,
        *,
        expected_cnf_sha256: str,
        expected_variables: int,
        expected_clauses: int,
    ) -> None:
        self._upstream = upstream
        self._producer_manifest = producer_manifest
        self._producer_sha256 = sha256_bytes(producer_manifest)
        self._expected_cnf_sha256 = expected_cnf_sha256
        self._expected_variables = expected_variables
        self._expected_clauses = expected_clauses
        self._job_id: str | None = None
        self._prepare_count = 0
        self._confirm_count = 0
        self._verification: dict[str, Any] | None = None

    @property
    def verification(self) -> dict[str, Any]:
        _require(
            self._verification is not None,
            "PIQD producer manifest was not retrieved before confirmation",
        )
        return dict(self._verification)

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | Any | None,
        headers: Mapping[str, str],
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        target = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        if method == "POST" and target.endswith("/jobs/prepare-cnf"):
            self._prepare_count += 1
            _require(self._prepare_count == 1, "transport observed duplicate prepare")
            response = self._upstream(method, url, body, headers)
            if response.status == 200:
                payload = _strict_json(response.body, "PIQD prepare response")
                _require(
                    payload.get("producer_manifest_hash") == self._producer_sha256,
                    "PIQD prepare returned the wrong producer-manifest hash",
                )
                _require(
                    payload.get("producer_manifest_blob_hash") == self._producer_sha256,
                    "PIQD prepare did not retain the exact producer-manifest blob",
                )
                _require(
                    payload.get("cnf_blob_hash") == self._expected_cnf_sha256,
                    "PIQD prepare crossed the pinned two-triple-row CNF",
                )
                _require(
                    payload.get("num_vars") == self._expected_variables
                    and payload.get("num_clauses") == self._expected_clauses,
                    "PIQD prepare crossed the pinned DIMACS dimensions",
                )
                job_id = payload.get("job_id")
                _require(
                    type(job_id) is str
                    and re.fullmatch(r"[A-Za-z0-9_.-]+", job_id) is not None,
                    "PIQD prepare returned an unsafe job ID",
                )
                self._job_id = job_id
            return response
        if method == "POST" and "/jobs/confirm?" in target:
            self._confirm_count += 1
            _require(self._confirm_count == 1, "transport observed duplicate confirm")
            _require(self._job_id is not None, "confirm preceded authenticated prepare")
            query = urllib.parse.parse_qs(parsed.query, strict_parsing=True)
            _require(
                query == {"job_id": [self._job_id]}, "confirm crossed prepared job"
            )
            blob_url = urllib.parse.urlunsplit(
                (
                    parsed.scheme,
                    parsed.netloc,
                    f"/jobs/{self._job_id}/blobs/{self._producer_sha256}",
                    "",
                    "",
                )
            )
            retrieved = self._upstream("GET", blob_url, None, {})
            _require(
                retrieved.status == 200,
                "PIQD producer-manifest retrieval failed before confirmation",
            )
            _require(
                type(retrieved.body) is bytes
                and retrieved.body == self._producer_manifest,
                "PIQD retrieved producer-manifest bytes drifted",
            )
            self._verification = {
                "job_id": self._job_id,
                "path": urllib.parse.urlsplit(blob_url).path,
                "sha256": self._producer_sha256,
                "bytes": len(self._producer_manifest),
                "verified_before_confirm": True,
            }
        return self._upstream(method, url, body, headers)


@dataclass(frozen=True)
class RunnerPaths:
    ingress: IngressPaths = PRODUCTION_INGRESS_PATHS
    run_root: Path = RUN_ROOT

    @property
    def lock(self) -> Path:
        return self.run_root / "runner.lock"

    @property
    def launch(self) -> Path:
        return self.run_root / "launch.json"

    @property
    def terminal(self) -> Path:
        return self.run_root / "terminal.json"

    @property
    def journal_root(self) -> Path:
        return self.run_root / "piqd-attempts"


@dataclass(frozen=True)
class RunnerSpec:
    ingress: IngressSpec = PRODUCTION_INGRESS_SPEC
    root_sha256: str = PRODUCTION_INGRESS_SPEC.export.child_sha256
    root_bytes: int = PRODUCTION_INGRESS_SPEC.export.child_bytes
    variables: int = PRODUCTION_INGRESS_SPEC.export.variables
    clauses: int = PRODUCTION_INGRESS_SPEC.export.child_clauses
    receipt_sha256: str = RECEIPT_SHA256
    project: str = PROJECT
    timeout_s: int = TIMEOUT_S
    requested_core_limit: int = REQUESTED_CORE_LIMIT
    maximum_requested_core_limit: int = MAX_REQUESTED_CORE_LIMIT

    def __post_init__(self) -> None:
        if type(self.requested_core_limit) is not int or not (
            1 <= self.requested_core_limit <= self.maximum_requested_core_limit <= 12
        ):
            raise ValueError("requested_core_limit must be a builtin int in 1..12")
        if self.requested_core_limit != 1:
            raise ValueError("plain CaDiCaL ingress must request exactly one core")
        if type(self.timeout_s) is not int or self.timeout_s != 3_600:
            raise ValueError("two-triple-row PIQD timeout must be exactly 3600 seconds")

    @property
    def provisioned(self) -> bool:
        return self == PRODUCTION_RUNNER_SPEC and self.ingress.provisioned


PRODUCTION_RUNNER_PATHS = RunnerPaths()
PRODUCTION_RUNNER_SPEC = RunnerSpec()


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise TwoTripleRowRunnerError(message)


def _claims(fields: Sequence[str]) -> dict[str, bool]:
    return {field: False for field in fields}


def build_static_manifests(
    ingress: Mapping[str, Any],
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> tuple[bytes, bytes]:
    """Build the canonical manifests retained by the static runner journal."""

    _require(spec.provisioned, "two-triple-row runner is unprovisioned")
    _require(ingress.get("status") == "PASS", "ingress report is not PASS")
    _require(
        ingress.get("dimacs")
        == {
            "path": str(PRODUCTION_INGRESS_PATHS.child.resolve()),
            "sha256": spec.root_sha256,
            "bytes": spec.root_bytes,
            "variables": spec.variables,
            "clauses": spec.clauses,
        },
        "ingress DIMACS identity drifted before manifest construction",
    )
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": "exact17-two-triple-row-cumulative-root-v2",
        "source_path": str(PRODUCTION_INGRESS_PATHS.lean_root.relative_to(ROOT)),
        "source_sha256": str(ingress["lean"]["root"]["sha256"]),
        "finite_schema": str(ingress["export_receipt"]["schema"]),
        "cardinality_scope": (
            "finite exact17 cumulative two-triple-row CNF; "
            f"{spec.variables} variables and {spec.clauses} clauses"
        ),
        "source_theorem": SOURCE_THEOREM,
        "claims": _claims(
            ("source_entitlement", "theorem_coverage", "universal_lift", "lean_closure")
        ),
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": f"exact17-two-triple-row-receipt-v2-{spec.receipt_sha256}",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": VARIABLE_MAP_SHA256,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": _claims(
            (
                "source_entitlement",
                "theorem_coverage",
                "universal_lift",
                "lean_closure",
                "one_process",
                "one_core",
            )
        ),
    }
    producer_bytes = canonical_json_bytes(producer)
    authenticate_static_manifests(
        source_manifest=source_bytes,
        producer_manifest=producer_bytes,
    )
    _require(
        sha256_bytes(source_bytes) == SOURCE_MANIFEST_SHA256,
        "source manifest identity drifted",
    )
    _require(
        sha256_bytes(producer_bytes) == PRODUCER_MANIFEST_SHA256,
        "producer manifest identity drifted",
    )
    return source_bytes, producer_bytes


def _http_json(base_url: str, target: str) -> dict[str, Any]:
    parsed = urllib.parse.urlsplit(base_url)
    _require(parsed.scheme == "http", "PIQD base URL must use http")
    _require(
        parsed.hostname in {"127.0.0.1", "localhost", "::1"}, "PIQD must be loopback"
    )
    _require(
        parsed.username is None and parsed.password is None,
        "PIQD URL must omit credentials",
    )
    _require(
        not parsed.query and not parsed.fragment, "PIQD base URL has query or fragment"
    )
    connection = http.client.HTTPConnection(
        parsed.hostname, parsed.port or 80, timeout=30
    )
    base_path = parsed.path.rstrip("/")
    try:
        connection.request("GET", f"{base_path}{target}")
        response = connection.getresponse()
        raw = response.read(MAX_HTTP_JSON_BYTES + 1)
        _require(
            response.status == 200, f"PIQD {target} returned HTTP {response.status}"
        )
        _require(
            len(raw) <= MAX_HTTP_JSON_BYTES, f"PIQD {target} response is oversized"
        )
        return _strict_json(raw, f"PIQD {target} response")
    except (OSError, http.client.HTTPException) as exc:
        raise TwoTripleRowRunnerError(f"cannot fetch live PIQD {target}") from exc
    finally:
        connection.close()


def live_identity(
    base_url: str,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    fetch_json: Callable[[str, str], dict[str, Any]] = _http_json,
) -> dict[str, Any]:
    """Fetch `/version` and `/solvers` and require the pinned live identities."""

    _require(spec.provisioned, "two-triple-row runner is unprovisioned")
    version = fetch_json(base_url, "/version")
    expected_daemon = {
        "name": "piqd",
        "version": "0.1.0",
        "protocol_version": spec.ingress.daemon_protocol_version,
        "sha256": spec.ingress.daemon_sha256,
    }
    _require(
        version.get("daemon") == expected_daemon, "live PIQD daemon identity drifted"
    )
    registry = fetch_json(base_url, "/solvers")
    _require(
        registry.get("daemon") == expected_daemon, "solver registry daemon drifted"
    )
    solvers = registry.get("solvers")
    _require(type(solvers) is list, "live PIQD solver registry is malformed")
    matches = [
        item
        for item in solvers
        if type(item) is dict and item.get("name") == spec.ingress.solver_name
    ]
    _require(len(matches) == 1, "pinned CaDiCaL solver is not unique")
    solver = matches[0]
    _require(
        solver.get("sha256") == spec.ingress.solver_sha256, "solver SHA-256 drifted"
    )
    _require(
        solver.get("solver_signature") == spec.ingress.solver_signature,
        "solver signature drifted",
    )
    _require(
        solver.get("protocol_version") == spec.ingress.daemon_protocol_version,
        "solver protocol drifted",
    )
    _require(
        solver.get("solver", solver.get("backend")) == spec.ingress.backend,
        "solver backend drifted",
    )
    _require(
        solver.get("lane") == "sat" and solver.get("usable") is True,
        "solver is unusable",
    )
    return {
        "version": version,
        "solver": solver,
        "fetched_endpoints": ["/version", "/solvers"],
    }


def _open_directory_nofollow(path: Path, *, create: bool) -> int:
    absolute = Path(os.path.abspath(path))
    flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in absolute.parts[1:]:
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except FileNotFoundError:
                if not create:
                    raise
                os.mkdir(component, 0o700, dir_fd=descriptor)
                child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        os.close(descriptor)
        raise TwoTripleRowRunnerError(f"unsafe run directory path: {path}") from exc


def _write_once(directory_fd: int, name: str, payload: bytes) -> str:
    _require(name not in {"", ".", ".."} and "/" not in name, "unsafe custody name")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=directory_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            _require(written > 0, "custody write made no progress")
            offset += written
        os.fsync(descriptor)
    except OSError as exc:
        raise TwoTripleRowRunnerError(
            f"custody file already exists or is unsafe: {name}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    return sha256_bytes(payload)


@contextmanager
def _reserve_run(paths: RunnerPaths):
    parent_fd = _open_directory_nofollow(paths.run_root.parent, create=True)
    run_fd: int | None = None
    lock_fd: int | None = None
    try:
        try:
            os.mkdir(paths.run_root.name, 0o700, dir_fd=parent_fd)
        except FileExistsError as exc:
            raise FileExistsError(
                "refusing duplicate two-triple-row PIQD launch"
            ) from exc
        run_fd = os.open(
            paths.run_root.name,
            os.O_RDONLY
            | os.O_DIRECTORY
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent_fd,
        )
        info = os.fstat(run_fd)
        named = os.stat(paths.run_root.name, dir_fd=parent_fd, follow_symlinks=False)
        _require(stat.S_ISDIR(info.st_mode), "reserved run root is not a directory")
        _require(
            (info.st_dev, info.st_ino) == (named.st_dev, named.st_ino),
            "run root changed",
        )
        lock_fd = os.open(
            paths.lock.name,
            os.O_RDWR
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=run_fd,
        )
        fcntl.flock(lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        os.fsync(run_fd)
        os.fsync(parent_fd)
        yield run_fd
    finally:
        if lock_fd is not None:
            fcntl.flock(lock_fd, fcntl.LOCK_UN)
            os.close(lock_fd)
        if run_fd is not None:
            os.close(run_fd)
        os.close(parent_fd)


def _strict_solver_receipt(raw: str) -> dict[str, Any]:
    _require(type(raw) is str and bool(raw), "static runner omitted its receipt")
    receipt = _strict_json(raw.encode("utf-8"), "static solver receipt")
    supplied = receipt.get("receipt_sha256")
    _require(
        type(supplied) is str and re.fullmatch(r"[0-9a-f]{64}", supplied) is not None,
        "solver receipt hash is malformed",
    )
    unsigned = {key: value for key, value in receipt.items() if key != "receipt_sha256"}
    _require(sha256_json(unsigned) == supplied, "static solver receipt hash drifted")
    return receipt


def _validate_terminal_receipt(
    receipt: dict[str, Any],
    result: StaticSolverResult,
    paths: RunnerPaths,
    spec: RunnerSpec,
    source_sha256: str,
    producer_sha256: str,
) -> None:
    _require(receipt.get("schema") == RECEIPT_SCHEMA, "static receipt schema drifted")
    expected = {
        "cnf_sha256": spec.root_sha256,
        "num_variables": spec.variables,
        "num_clauses": spec.clauses,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "adapter_verdict": result.verdict,
        "adapter_returncode": result.returncode,
        "status_classification": ATTESTED_SOLVER_RESULT,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
    }
    for key, value in expected.items():
        _require(receipt.get(key) == value, f"static receipt {key} drifted")
    job = receipt.get("job_identity")
    _require(type(job) is dict, "static receipt omitted prepared job identity")
    for key, value in {
        "job_id": receipt.get("job_id"),
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "project": spec.project,
        "cnf_blob_hash": spec.root_sha256,
        "num_vars": spec.variables,
        "num_clauses": spec.clauses,
        "requested_core_limit": spec.requested_core_limit,
    }.items():
        _require(job.get(key) == value, f"prepared job {key} crossed identity")
    trace = receipt.get("endpoint_trace")
    _require(
        type(trace) is list and all(type(item) is dict for item in trace),
        "endpoint trace is malformed",
    )
    count = lambda method, pattern: sum(
        item.get("method") == method
        and re.fullmatch(pattern, str(item.get("target"))) is not None
        for item in trace
    )
    _require(
        count("POST", r"/jobs/prepare-cnf") == 1, "launch did not prepare exactly once"
    )
    _require(
        count("POST", r"/jobs/confirm\?job_id=.+") == 1,
        "launch did not confirm exactly once",
    )
    _require(
        count("GET", rf"/jobs/{re.escape(str(receipt['job_id']))}/cnf") == 1,
        "stored CNF was not retrieved exactly once",
    )
    _require(
        count("GET", rf"/jobs/{re.escape(str(receipt['job_id']))}/log.*") >= 1,
        "solver log was not retrieved",
    )
    terminal = receipt.get("terminal_status")
    _require(
        type(terminal) is dict and terminal.get("status") == "completed",
        "job is not completed",
    )
    _require(
        terminal.get("result") == result.verdict,
        "terminal result crossed adapter verdict",
    )
    receipt_path = Path(str(receipt.get("receipt_path")))
    _require(
        receipt_path.is_relative_to(paths.journal_root),
        "receipt escaped the governed run root",
    )
    if result.verdict == "SAT":
        _require(
            receipt.get("model_response_sha256") is not None,
            "SAT model custody is missing",
        )
        _require(
            len(result.assignment) == spec.variables, "SAT assignment is not total"
        )
        _require(
            count("GET", rf"/jobs/{re.escape(str(receipt['job_id']))}/model") == 1,
            "SAT model endpoint count drifted",
        )
    else:
        _require(
            result.verdict == "UNSAT",
            "terminal static verdict is neither SAT nor UNSAT",
        )
        _require(
            receipt.get("model_response_sha256") is None,
            "UNSAT unexpectedly has a model",
        )


def static_check(
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> dict[str, Any]:
    _require(spec.provisioned, "two-triple-row runner is unprovisioned")
    ingress = validate_ingress(
        paths.ingress,
        spec=spec.ingress,
        expected_manifest_sha256=spec.receipt_sha256,
    )
    source_bytes, producer_bytes = build_static_manifests(ingress, spec)
    return {
        "status": "PASS",
        "ingress": ingress,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "producer_manifest_sha256": sha256_bytes(producer_bytes),
        "timeout_s": spec.timeout_s,
        "requested_core_limit": spec.requested_core_limit,
        "maximum_requested_core_limit": spec.maximum_requested_core_limit,
    }


def start(
    *,
    base_url: str = "http://127.0.0.1:7272",
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    transport: Transport | None = None,
    identity_fetcher: Callable[[str, RunnerSpec], dict[str, Any]] = live_identity,
    sleep: Callable[[float], None] = time.sleep,
    max_polls: int = MAX_POLLS,
    poll_interval_s: float = POLL_INTERVAL_S,
) -> dict[str, Any]:
    """Reserve and execute the sole governed production launch."""

    checked = static_check(paths, spec)
    source_bytes, producer_bytes = build_static_manifests(checked["ingress"], spec)
    with _reserve_run(paths) as run_fd:
        identity = identity_fetcher(base_url, spec)
        launch = {
            "schema": LAUNCH_SCHEMA,
            "status": "LAUNCH_AUTHENTICATED",
            "root": checked["ingress"]["dimacs"],
            "export_receipt": checked["ingress"]["export_receipt"],
            "source_manifest_sha256": sha256_bytes(source_bytes),
            "producer_manifest_sha256": sha256_bytes(producer_bytes),
            "live_identity": identity,
            "execution": {
                "backend": spec.ingress.backend,
                "solver_profile": spec.ingress.solver_profile,
                "project": spec.project,
                "timeout_s": spec.timeout_s,
                "requested_core_limit": spec.requested_core_limit,
                "maximum_requested_core_limit": spec.maximum_requested_core_limit,
                "max_prepare_attempts": 1,
                "max_confirm_attempts": 1,
                "max_result_attempts": 1,
                "max_polls": max_polls,
                "poll_interval_s": poll_interval_s,
            },
        }
        launch_bytes = canonical_json_bytes(launch) + b"\n"
        launch_sha256 = _write_once(run_fd, paths.launch.name, launch_bytes)
        policy = DriverPolicy(
            max_prepare_attempts=1,
            max_confirm_attempts=1,
            max_polls=max_polls,
            max_result_attempts=1,
            poll_interval_s=poll_interval_s,
            solver_timeout_s=spec.timeout_s,
            march_timeout_s=spec.timeout_s,
            project=spec.project,
            requested_core_limit=spec.requested_core_limit,
        )
        manifest_transport = _ManifestVerifyingTransport(
            transport or stdlib_http_transport,
            producer_bytes,
            expected_cnf_sha256=spec.root_sha256,
            expected_variables=spec.variables,
            expected_clauses=spec.clauses,
        )
        runner = make_static_piqd_solver_runner(
            base_url=base_url,
            journal_root=paths.journal_root,
            source_manifest=source_bytes,
            producer_manifest=producer_bytes,
            transport=manifest_transport,
            policy=policy,
            max_cnf_bytes=MAX_CNF_BYTES,
            sleep=sleep,
        )
        result = runner(paths.ingress.child, spec.timeout_s, None)
        if result.verdict == "UNKNOWN":
            raise TwoTripleRowRunnerError(result.stderr)
        manifest_verification = manifest_transport.verification
        receipt = _strict_solver_receipt(result.stdout)
        _validate_terminal_receipt(
            receipt,
            result,
            paths,
            spec,
            sha256_bytes(source_bytes),
            sha256_bytes(producer_bytes),
        )
        certification = (
            "SAT_MODEL_INDEPENDENTLY_REPLAYED"
            if result.verdict == "SAT"
            else "UNSAT_UNCERTIFIED_PROOF_REPLAY_REQUIRED"
        )
        terminal = {
            "schema": RUN_SCHEMA,
            "status": "PASS" if result.verdict == "SAT" else "UNSAT_UNCERTIFIED",
            "verdict": result.verdict,
            "certification": certification,
            "launch_sha256": launch_sha256,
            "job_id": receipt["job_id"],
            "receipt": {
                "path": receipt["receipt_path"],
                "sha256": receipt["receipt_sha256"],
                "custody_seal_path": receipt["custody_seal_path"],
            },
            "remote_producer_manifest": manifest_verification,
            "model_response_sha256": receipt["model_response_sha256"],
            "terminal_status_canonical_sha256": receipt[
                "terminal_status_canonical_sha256"
            ],
            "next_gate": (
                "mine only this new SAT survivor"
                if result.verdict == "SAT"
                else "retrieve and independently replay the PIQD proof before any UNSAT certification claim"
            ),
        }
        terminal_bytes = canonical_json_bytes(terminal) + b"\n"
        terminal["terminal_file_sha256"] = _write_once(
            run_fd, paths.terminal.name, terminal_bytes
        )
        return terminal


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("static-check", "start"))
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        payload = (
            static_check()
            if args.command == "static-check"
            else start(base_url=args.base_url)
        )
    except (
        IngressValidationError,
        StaticPiqdRunnerError,
        TwoTripleRowRunnerError,
        FileExistsError,
    ) as exc:
        print(f"two-triple-row PIQD runner rejected: {exc}")
        return 2
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0 if payload.get("verdict") != "UNSAT" else 3


if __name__ == "__main__":
    raise SystemExit(main())
