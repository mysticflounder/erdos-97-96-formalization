"""Run the authenticated exact-17 two-Kalmanson successor root through PIQD once.

This wrapper uses the hardened static-CNF boundary.  It reserves one immutable
production run directory, fetches and pins the live daemon/solver identities,
allows exactly one prepare and one confirm attempt, requires PIQD's stored CNF
readback, and retains the sealed attempt journal, model, and log custody.

SAT is returned only after the generic boundary independently replays the total
assignment against the exact CNF.  UNSAT remains explicitly uncertified here:
the generic static boundary does not retrieve or replay PIQD's proof.

If the one-shot launch sealed a valid terminal SAT attempt but local terminal
publication failed, ``finalize-existing`` reauthenticates and replays that
attempt entirely offline.  It never prepares, confirms, polls, or contacts PIQD.
"""

from __future__ import annotations

import argparse
import fcntl
import hashlib
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
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

SCRIPT_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(SCRIPT_ROOT))

from validate_exact17_weighted_successor_model_piqd_ingress import (
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
from validate_exact17_weighted_successor_model_piqd_ingress import (
    _open_regular_nofollow as _open_ingress_regular_nofollow,
)

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    STRUCTURAL_SAT,
    WaveContractError,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import SEAL_SCHEMA, DriverPolicy
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PiqdOracleError,
    Transport,
    scan_dimacs,
    stdlib_http_transport,
)
from census.p97_search.phase3_piqd_static_solver_runner import (
    ATTESTED_SOLVER_RESULT,
    CERTIFICATE_BLOCKER,
    CUSTODY_SEAL_SCHEMA,
    PRODUCER_SCHEMA,
    RECEIPT_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    authenticate_static_manifests,
    make_static_piqd_solver_runner,
)

ROOT = SCRIPT_ROOT
LANE_ID = "exact17-weighted-successor-model-piqd-20260816"
RUN_ID = "successor-v1"
RUN_OWNER = "exact17-weighted-successor-model-piqd"
RUN_BASE_HEAD = "61e2238cffd23a252224fbb67c834c1c043a05ee"
RUN_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
RUN_OUTPUT_CLASSES = ("artifacts", "events", "tmp")
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
OWNED_PATHS = (
    "scripts/run_piqd_exact17_weighted_successor_model_root.py",
    "scripts/test_run_piqd_exact17_weighted_successor_model_root.py",
    "scripts/test_validate_exact17_weighted_successor_model_piqd_ingress.py",
    "scripts/validate_exact17_weighted_successor_model_piqd_ingress.py",
)
RUN_SCHEMA = "p97-exact17-weighted-successor-model-piqd-run/v1"
LAUNCH_SCHEMA = "p97-exact17-weighted-successor-model-piqd-launch/v1"
PROJECT = "erdos-97-96-exact17-weighted-successor-model-v1"
MAX_POLLS = 2_400
POLL_INTERVAL_S = 2.0
MAX_HTTP_JSON_BYTES = 1 << 20
MAX_CNF_BYTES = 384 * 1024 * 1024
MAX_OFFLINE_CONTROL_BYTES = 64 * 1024 * 1024
OFFLINE_FINALIZATION_SCHEMA = (
    "p97-exact17-weighted-successor-model-offline-finalization/v1"
)
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenFortyEighthModelRefinements."
    "sourceAssign_extendedFortyEighthModelRefinementsCnf"
)
SOURCE_MANIFEST_SHA256 = (
    "3c5028342790f2b19b86bfbf4f0e73aa133e659a6984ab51aaba69fdd4ac46a0"
)
PRODUCER_MANIFEST_SHA256 = (
    "24b13c38f2358d06dfa0e96c142c009be03eb4b8f84a18680aeff03bddd62e39"
)


class WeightedSuccessorModelRunnerError(RuntimeError):
    """The one-shot exact17 runner failed a launch or custody gate."""


class _ManifestVerifyingTransport:
    """Verify PIQD's returned and retrieved producer manifest before confirm."""

    def __init__(
        self,
        upstream: Transport,
        producer_manifest: bytes,
        *,
        expected_cnf_sha256: str,
        expected_identity_sha256: str,
        expected_variables: int,
        expected_clauses: int,
    ) -> None:
        self._upstream = upstream
        self._producer_manifest = producer_manifest
        self._producer_sha256 = sha256_bytes(producer_manifest)
        self._expected_cnf_sha256 = expected_cnf_sha256
        self._expected_identity_sha256 = expected_identity_sha256
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
                    "PIQD prepare crossed the pinned weighted-successor-model CNF",
                )
                _require(
                    payload.get("identity_hash") == self._expected_identity_sha256,
                    "PIQD prepare crossed the raw-DIMACS identity",
                )
                _require(
                    payload.get("num_vars") == self._expected_variables
                    and payload.get("num_clauses") == self._expected_clauses,
                    "PIQD prepare crossed the pinned DIMACS dimensions",
                )
                _require(
                    payload.get("existing") is False,
                    "PIQD prepare reused an existing job",
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
    def run_manifest(self) -> Path:
        return self.run_root / "run_manifest.json"

    @property
    def artifacts_root(self) -> Path:
        return self.run_root / "artifacts"

    @property
    def events_root(self) -> Path:
        return self.run_root / "events"

    @property
    def tmp_root(self) -> Path:
        return self.run_root / "tmp"

    @property
    def lock(self) -> Path:
        return self.artifacts_root / "runner.lock"

    @property
    def launch(self) -> Path:
        return self.artifacts_root / "launch.json"

    @property
    def terminal(self) -> Path:
        return self.artifacts_root / "terminal.json"

    @property
    def journal_root(self) -> Path:
        return self.artifacts_root / "piqd-attempts"


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
            raise ValueError(
                "weighted-successor-model PIQD timeout must be exactly 3600 seconds"
            )

    @property
    def provisioned(self) -> bool:
        return self == PRODUCTION_RUNNER_SPEC and self.ingress.provisioned


PRODUCTION_RUNNER_PATHS = RunnerPaths()
PRODUCTION_RUNNER_SPEC = RunnerSpec()


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise WeightedSuccessorModelRunnerError(message)


def _claims(fields: Sequence[str]) -> dict[str, bool]:
    return {field: False for field in fields}


def expected_identity_hash(
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    producer_manifest_sha256: str = PRODUCER_MANIFEST_SHA256,
) -> str:
    """Recompute PIQD's core-limited raw-DIMACS v1 identity."""

    _require(spec.provisioned, "weighted-successor-model runner is unprovisioned")
    material = (
        f"raw-dimacs/v1\n{spec.ingress.backend}\n{spec.ingress.solver_profile}\n"
        f"{spec.root_sha256}\n{producer_manifest_sha256}\n"
        f"cores={spec.requested_core_limit}"
    )
    return hashlib.sha256(material.encode()).hexdigest()


def build_static_manifests(
    ingress: Mapping[str, Any],
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> tuple[bytes, bytes]:
    """Build the canonical manifests retained by the static runner journal."""

    _require(spec.provisioned, "weighted-successor-model runner is unprovisioned")
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
        "source_id": "exact17-weighted-successor-model-cumulative-root-v2",
        "source_path": str(PRODUCTION_INGRESS_PATHS.lean_root.relative_to(ROOT)),
        "source_sha256": str(ingress["lean"]["root"]["sha256"]),
        "finite_schema": str(ingress["export_receipt"]["schema"]),
        "cardinality_scope": (
            "finite exact17 cumulative weighted-successor-model CNF; "
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
        "producer_id": f"exact17-weighted-successor-model-receipt-v2-{spec.receipt_sha256}",
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
        raise WeightedSuccessorModelRunnerError(
            f"cannot fetch live PIQD {target}"
        ) from exc
    finally:
        connection.close()


def live_identity(
    base_url: str,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    fetch_json: Callable[[str, str], dict[str, Any]] = _http_json,
) -> dict[str, Any]:
    """Fetch `/version` and `/solvers` and require the pinned live identities."""

    _require(spec.provisioned, "weighted-successor-model runner is unprovisioned")
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
        raise WeightedSuccessorModelRunnerError(
            f"unsafe run directory path: {path}"
        ) from exc


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
        raise WeightedSuccessorModelRunnerError(
            f"custody file already exists or is unsafe: {name}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    return sha256_bytes(payload)


def _source_digest(path: Path) -> str:
    digest = hashlib.sha256()
    with _open_ingress_regular_nofollow(path)[0] as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def _validate_lane_checkpoint(paths: RunnerPaths) -> str:
    _require(
        paths.run_root == RUN_ROOT,
        "production run root cannot be overridden",
    )
    with _open_ingress_regular_nofollow(CHECKPOINT_PATH)[0] as stream:
        checkpoint_raw = stream.read(MAX_OFFLINE_CONTROL_BYTES + 1)
    _require(
        len(checkpoint_raw) <= MAX_OFFLINE_CONTROL_BYTES,
        "lane checkpoint is oversized",
    )
    checkpoint = _strict_json(checkpoint_raw, "lane checkpoint")
    _require(
        set(checkpoint)
        == {
            "schema",
            "lane_id",
            "owner",
            "base_head",
            "created_utc",
            "owned_paths",
            "durable_paths",
            "generated_roots",
            "manifest_sha256",
        },
        "lane checkpoint shape drifted",
    )
    unsigned = {
        key: value for key, value in checkpoint.items() if key != "manifest_sha256"
    }
    expected_root = str(paths.run_root.relative_to(ROOT))
    _require(
        checkpoint.get("schema") == "worktree-lane-checkpoint/v1"
        and checkpoint.get("lane_id") == LANE_ID
        and checkpoint.get("owner") == RUN_OWNER
        and checkpoint.get("base_head") == RUN_BASE_HEAD
        and type(checkpoint.get("created_utc")) is str
        and checkpoint["created_utc"].endswith("Z")
        and checkpoint.get("owned_paths") == sorted(OWNED_PATHS)
        and checkpoint.get("durable_paths") == []
        and checkpoint.get("generated_roots") == [expected_root]
        and checkpoint.get("manifest_sha256") == sha256_json(unsigned),
        "lane checkpoint does not register the exact fixed-policy run root",
    )
    return sha256_bytes(checkpoint_raw)


def _run_manifest_object(
    paths: RunnerPaths,
    spec: RunnerSpec,
    *,
    created_utc: str,
    checkpoint_sha256: str | None = None,
) -> dict[str, Any]:
    runner_path = Path(__file__).resolve()
    ingress_path = (
        ROOT / "scripts/validate_exact17_weighted_successor_model_piqd_ingress.py"
    )
    source_digests = {
        str(runner_path.relative_to(ROOT)): _source_digest(runner_path),
        str(ingress_path.relative_to(ROOT)): _source_digest(ingress_path),
        str(CHECKPOINT_PATH.relative_to(ROOT)): (
            checkpoint_sha256 or _source_digest(CHECKPOINT_PATH)
        ),
    }
    try:
        root_name = str(paths.run_root.relative_to(ROOT))
    except ValueError:
        root_name = str(paths.run_root)
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": root_name,
        "owner": RUN_OWNER,
        "base_head": RUN_BASE_HEAD,
        "output_classes": list(RUN_OUTPUT_CLASSES),
        "source_digests": source_digests,
        "input_digests": {
            str(paths.ingress.child.relative_to(ROOT)): spec.root_sha256,
            str(paths.ingress.export_receipt.relative_to(ROOT)): spec.receipt_sha256,
        },
        "created_utc": created_utc,
    }
    return {**manifest, "manifest_sha256": sha256_json(manifest)}


def _run_manifest_bytes(
    paths: RunnerPaths, spec: RunnerSpec, checkpoint_sha256: str
) -> bytes:
    created_utc = datetime.now(UTC).isoformat().replace("+00:00", "Z")
    return (
        canonical_json_bytes(
            _run_manifest_object(
                paths,
                spec,
                created_utc=created_utc,
                checkpoint_sha256=checkpoint_sha256,
            )
        )
        + b"\n"
    )


def _validate_run_layout(
    run_fd: int,
    paths: RunnerPaths,
    spec: RunnerSpec,
) -> int:
    checkpoint_sha256 = _validate_lane_checkpoint(paths)
    _require(
        set(os.listdir(run_fd)) == {"run_manifest.json", *RUN_OUTPUT_CLASSES},
        "governed run root does not match the standard fixed-policy layout",
    )
    manifest_raw, _ = _read_regular_at(
        run_fd, "run_manifest.json", maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
    )
    manifest = _canonical_file_object(manifest_raw, "run manifest")
    created_utc = manifest.get("created_utc")
    _require(
        type(created_utc) is str
        and created_utc.endswith("Z")
        and datetime.fromisoformat(created_utc).utcoffset() is not None,
        "run manifest timestamp is malformed",
    )
    _require(
        manifest
        == _run_manifest_object(
            paths,
            spec,
            created_utc=created_utc,
            checkpoint_sha256=checkpoint_sha256,
        ),
        "run manifest identity drifted",
    )
    events_fd = _open_child_directory_at(run_fd, "events")
    tmp_fd = _open_child_directory_at(run_fd, "tmp")
    try:
        _require(not os.listdir(events_fd), "governed events directory is not empty")
        _require(not os.listdir(tmp_fd), "governed tmp directory is not empty")
    finally:
        os.close(events_fd)
        os.close(tmp_fd)
    return _open_child_directory_at(run_fd, "artifacts")


@contextmanager
def _reserve_run(paths: RunnerPaths, spec: RunnerSpec):
    checkpoint_sha256 = _validate_lane_checkpoint(paths)
    parent_fd = _open_directory_nofollow(paths.run_root.parent, create=True)
    run_fd: int | None = None
    artifacts_fd: int | None = None
    lock_fd: int | None = None
    try:
        try:
            os.mkdir(paths.run_root.name, 0o700, dir_fd=parent_fd)
        except FileExistsError as exc:
            raise FileExistsError(
                "refusing duplicate weighted-successor-model PIQD launch"
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
        for output_class in RUN_OUTPUT_CLASSES:
            os.mkdir(output_class, 0o700, dir_fd=run_fd)
        _write_once(
            run_fd,
            "run_manifest.json",
            _run_manifest_bytes(paths, spec, checkpoint_sha256),
        )
        artifacts_fd = _open_child_directory_at(run_fd, "artifacts")
        lock_fd = os.open(
            paths.lock.name,
            os.O_RDWR
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=artifacts_fd,
        )
        fcntl.flock(lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        os.fsync(artifacts_fd)
        os.fsync(run_fd)
        os.fsync(parent_fd)
        yield artifacts_fd
    finally:
        if lock_fd is not None:
            fcntl.flock(lock_fd, fcntl.LOCK_UN)
            os.close(lock_fd)
        if artifacts_fd is not None:
            os.close(artifacts_fd)
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
        "identity_hash": expected_identity_hash(spec, producer_sha256),
        "num_vars": spec.variables,
        "num_clauses": spec.clauses,
        "existing": False,
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
    status_poll_count = count("GET", rf"/jobs/{re.escape(str(receipt['job_id']))}")
    _require(
        1 <= status_poll_count <= MAX_POLLS,
        "launch status-poll count is outside the governed bound",
    )
    _require(
        count(
            "GET",
            rf"/jobs/{re.escape(str(receipt['job_id']))}/log\?from=0&max=1048576",
        )
        == 1,
        "solver log was not retrieved exactly once",
    )
    job_id_pattern = re.escape(str(receipt["job_id"]))
    allowed = (
        ("POST", r"/jobs/prepare-cnf"),
        ("POST", rf"/jobs/confirm\?job_id={job_id_pattern}"),
        ("GET", rf"/jobs/{job_id_pattern}"),
        ("GET", rf"/jobs/{job_id_pattern}/cnf"),
        ("GET", rf"/jobs/{job_id_pattern}/model"),
        ("GET", rf"/jobs/{job_id_pattern}/log\?from=0&max=1048576"),
    )
    _require(
        all(
            any(
                item.get("method") == method
                and re.fullmatch(pattern, str(item.get("target"))) is not None
                for method, pattern in allowed
            )
            for item in trace
        ),
        "endpoint trace crossed the governed job or endpoint set",
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
    attempt_name = f"attempt-00000000-{spec.root_sha256[:16]}"
    attempt_path = paths.journal_root / attempt_name
    _require(
        receipt.get("attempt") == 0
        and receipt.get("attempt_directory") == str(attempt_path)
        and receipt.get("journal") == str(attempt_path / "attempt.jsonl")
        and receipt.get("receipt_path") == str(attempt_path / "solver-receipt.json")
        and receipt.get("custody_seal_path") == str(attempt_path / "custody-seal.json"),
        "receipt escaped or renamed the governed sealed attempt",
    )
    if result.verdict == "SAT":
        _validate_terminal_sat_status(
            terminal, spec, str(receipt["job_id"]), producer_sha256
        )
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
        _require(
            count("GET", rf"/jobs/{re.escape(str(receipt['job_id']))}/model") == 0,
            "UNSAT unexpectedly retrieved a model",
        )
    expected_trace = [
        {"method": "POST", "target": "/jobs/prepare-cnf"},
        {"method": "GET", "target": f"/jobs/{receipt['job_id']}/cnf"},
        {
            "method": "POST",
            "target": f"/jobs/confirm?job_id={receipt['job_id']}",
        },
        *(
            {"method": "GET", "target": f"/jobs/{receipt['job_id']}"}
            for _ in range(status_poll_count)
        ),
    ]
    if result.verdict == "SAT":
        expected_trace.append(
            {"method": "GET", "target": f"/jobs/{receipt['job_id']}/model"}
        )
    expected_trace.append(
        {
            "method": "GET",
            "target": f"/jobs/{receipt['job_id']}/log?from=0&max=1048576",
        }
    )
    _require(
        trace == expected_trace,
        "endpoint trace is reordered or crosses the exact governed lifecycle",
    )


def _stable_file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _open_child_directory_at(parent_fd: int, name: str) -> int:
    _require(
        re.fullmatch(r"[A-Za-z0-9_.-]+", name) is not None,
        "unsafe custody directory name",
    )
    flags = (
        os.O_RDONLY
        | os.O_DIRECTORY
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    try:
        descriptor = os.open(name, flags, dir_fd=parent_fd)
        held = os.fstat(descriptor)
        named = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    except OSError as exc:
        raise WeightedSuccessorModelRunnerError(
            f"cannot open sealed custody directory {name}"
        ) from exc
    if (
        not stat.S_ISDIR(held.st_mode)
        or held.st_nlink < 1
        or (held.st_dev, held.st_ino) != (named.st_dev, named.st_ino)
    ):
        os.close(descriptor)
        raise WeightedSuccessorModelRunnerError(
            f"sealed custody directory {name} was substituted"
        )
    return descriptor


def _open_regular_at(directory_fd: int, name: str) -> tuple[int, os.stat_result]:
    _require(
        re.fullmatch(r"[A-Za-z0-9_.-]+", name) is not None,
        "unsafe custody filename",
    )
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
        held = os.fstat(descriptor)
        named = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    except OSError as exc:
        raise WeightedSuccessorModelRunnerError(
            f"cannot open sealed custody file {name}"
        ) from exc
    if (
        not stat.S_ISREG(held.st_mode)
        or held.st_nlink != 1
        or (held.st_dev, held.st_ino) != (named.st_dev, named.st_ino)
    ):
        os.close(descriptor)
        raise WeightedSuccessorModelRunnerError(
            f"sealed custody file {name} was substituted"
        )
    return descriptor, held


def _read_regular_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
    allow_empty: bool = False,
) -> tuple[bytes, os.stat_result]:
    descriptor, before = _open_regular_at(directory_fd, name)
    try:
        _require(before.st_size <= maximum_bytes, f"custody file {name} is oversized")
        chunks: list[bytes] = []
        total = 0
        while True:
            block = os.read(descriptor, min(1 << 20, maximum_bytes + 1 - total))
            if not block:
                break
            chunks.append(block)
            total += len(block)
            _require(total <= maximum_bytes, f"custody file {name} is oversized")
        after = os.fstat(descriptor)
        _require(
            _stable_file_identity(before) == _stable_file_identity(after),
            f"custody file {name} changed while reading",
        )
        raw = b"".join(chunks)
        _require(allow_empty or bool(raw), f"custody file {name} is empty")
        return raw, after
    finally:
        os.close(descriptor)


def _hash_regular_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
) -> tuple[str, int, os.stat_result]:
    descriptor, before = _open_regular_at(directory_fd, name)
    digest = hashlib.sha256()
    total = 0
    try:
        _require(before.st_size <= maximum_bytes, f"custody file {name} is oversized")
        while True:
            block = os.read(descriptor, 1 << 20)
            if not block:
                break
            digest.update(block)
            total += len(block)
            _require(total <= maximum_bytes, f"custody file {name} is oversized")
        after = os.fstat(descriptor)
        _require(
            _stable_file_identity(before) == _stable_file_identity(after),
            f"custody file {name} changed while hashing",
        )
        return digest.hexdigest(), total, after
    finally:
        os.close(descriptor)


def _canonical_file_object(raw: bytes, label: str) -> dict[str, Any]:
    _require(raw.endswith(b"\n"), f"{label} is not newline-terminated")
    payload = raw[:-1]
    value = _strict_json(payload, label)
    _require(canonical_json_bytes(value) == payload, f"{label} is not canonical JSON")
    return value


def _require_embedded_hash(value: Mapping[str, Any], hash_key: str, label: str) -> str:
    unsigned = dict(value)
    supplied = unsigned.pop(hash_key, None)
    _require(
        type(supplied) is str and re.fullmatch(r"[0-9a-f]{64}", supplied) is not None,
        f"{label} hash is malformed",
    )
    _require(supplied == sha256_json(unsigned), f"{label} hash drifted")
    return supplied


def _decode_canonical_journal(raw: bytes) -> list[dict[str, Any]]:
    _require(raw.endswith(b"\n"), "sealed journal is not newline-terminated")
    records: list[dict[str, Any]] = []
    for index, line in enumerate(raw.splitlines(keepends=True), start=1):
        _require(line.endswith(b"\n") and len(line) > 1, "journal line is malformed")
        payload = line[:-1]
        record = _strict_json(payload, f"journal line {index}")
        _require(
            canonical_json_bytes(record) == payload,
            f"journal line {index} is not canonical JSON",
        )
        records.append(record)
    return records


def _expected_wave_manifest(
    spec: RunnerSpec,
    source_manifest: Mapping[str, Any],
    producer_manifest: Mapping[str, Any],
    producer_sha256: str,
) -> dict[str, Any]:
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": f"static-{spec.root_sha256[:32]}-00000000",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": source_manifest["source_id"],
            "ingress_hypotheses_sha256": source_manifest["source_sha256"],
            "finite_schema": source_manifest["finite_schema"],
            "cardinality_scope": source_manifest["cardinality_scope"],
            "source_theorem": source_manifest["source_theorem"],
        },
        "encoding": {
            "cnf_sha256": spec.root_sha256,
            "variable_map_sha256": producer_manifest["variable_map_sha256"],
            "producer_manifest_sha256": producer_sha256,
            "num_variables": spec.variables,
            "num_clauses": spec.clauses,
            "query_polarity": producer_manifest["query_polarity"],
        },
        "execution": {
            "backend": producer_manifest["backend"],
            "solver_profile": producer_manifest["solver_profile"],
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(
                canonical_json_bytes(
                    {
                        "cnf_sha256": spec.root_sha256,
                        "producer_manifest_sha256": producer_sha256,
                    }
                )
            ),
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    validate_wave_manifest(manifest)
    return manifest


def _validate_recorded_live_identity(identity: object, spec: RunnerSpec) -> None:
    _require(type(identity) is dict, "launch live identity is malformed")
    expected_daemon = {
        "name": "piqd",
        "version": "0.1.0",
        "protocol_version": spec.ingress.daemon_protocol_version,
        "sha256": spec.ingress.daemon_sha256,
    }
    version = identity.get("version")
    _require(
        type(version) is dict and version.get("daemon") == expected_daemon,
        "recorded PIQD daemon identity drifted",
    )
    solver = identity.get("solver")
    _require(type(solver) is dict, "recorded PIQD solver identity is malformed")
    for key, value in {
        "name": spec.ingress.solver_name,
        "sha256": spec.ingress.solver_sha256,
        "solver_signature": spec.ingress.solver_signature,
        "protocol_version": spec.ingress.daemon_protocol_version,
        "solver": spec.ingress.backend,
        "lane": "sat",
        "usable": True,
    }.items():
        _require(solver.get(key) == value, f"recorded PIQD solver {key} drifted")
    _require(
        identity.get("fetched_endpoints") == ["/version", "/solvers"],
        "recorded PIQD identity endpoints drifted",
    )


def _validate_terminal_sat_status(
    status: object,
    spec: RunnerSpec,
    job_id: str,
    producer_manifest_sha256: str = PRODUCER_MANIFEST_SHA256,
) -> None:
    _require(type(status) is dict, "terminal SAT status is malformed")
    for key, value in {
        "id": job_id,
        "status": "completed",
        "result": "SAT",
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "project": spec.project,
        "cnf_blob_hash": spec.root_sha256,
        "producer_manifest_hash": producer_manifest_sha256,
        "producer_manifest_blob_hash": producer_manifest_sha256,
        "identity_hash": expected_identity_hash(spec, producer_manifest_sha256),
        "requested_core_limit": spec.requested_core_limit,
        "timeout_s": spec.timeout_s,
        "march_timeout_s": spec.timeout_s,
        "run_epoch": 1,
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        "daemon_sha256": spec.ingress.daemon_sha256,
        "recovery_action": None,
    }.items():
        _require(status.get(key) == value, f"terminal SAT status {key} drifted")
    progress = status.get("progress")
    _require(
        type(progress) is dict
        and progress.get("solver_started") is True
        and progress.get("spawn_failure") is None,
        "terminal SAT status does not attest a started solver",
    )
    for field in ("created_at", "confirmed_at", "started_at", "completed_at"):
        _require(
            type(status.get(field)) is int and status[field] >= 0,
            f"terminal SAT status {field} is malformed",
        )
    _require(
        status["created_at"]
        <= status["confirmed_at"]
        <= status["started_at"]
        <= status["completed_at"],
        "terminal SAT timestamps are inconsistent",
    )


def _validate_artifact_inventory(
    artifact_fd: int,
    inventory: object,
) -> dict[str, dict[str, Any]]:
    _require(type(inventory) is list, "custody artifact inventory is malformed")
    observed_names = sorted(os.listdir(artifact_fd))
    expected_names: list[str] = []
    bindings: dict[str, dict[str, Any]] = {}
    for item in inventory:
        _require(
            type(item) is dict and set(item) == {"sha256", "size", "device", "inode"},
            "custody artifact binding is malformed",
        )
        digest = item.get("sha256")
        _require(
            type(digest) is str and re.fullmatch(r"[0-9a-f]{64}", digest) is not None,
            "custody artifact digest is malformed",
        )
        _require(digest not in bindings, "custody artifact inventory has duplicates")
        actual_digest, size, info = _hash_regular_at(
            artifact_fd, digest, maximum_bytes=MAX_CNF_BYTES
        )
        _require(actual_digest == digest, "custody artifact filename/hash mismatch")
        _require(
            item
            == {
                "sha256": digest,
                "size": size,
                "device": info.st_dev,
                "inode": info.st_ino,
            },
            "custody artifact binding drifted",
        )
        bindings[digest] = dict(item)
        expected_names.append(digest)
    _require(
        observed_names == sorted(expected_names),
        "custody artifact directory contents drifted",
    )
    return bindings


def _validate_existing_attempt(
    run_fd: int,
    paths: RunnerPaths,
    spec: RunnerSpec,
    checked: Mapping[str, Any],
    source_bytes: bytes,
    producer_bytes: bytes,
) -> dict[str, Any]:
    expected_run_entries = {paths.launch.name, paths.lock.name, paths.journal_root.name}
    _require(
        set(os.listdir(run_fd)) == expected_run_entries,
        "governed run root has unexpected or missing entries",
    )
    launch_raw, _launch_info = _read_regular_at(
        run_fd, paths.launch.name, maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
    )
    launch = _canonical_file_object(launch_raw, "launch record")
    _require(
        set(launch)
        == {
            "schema",
            "status",
            "root",
            "export_receipt",
            "source_manifest_sha256",
            "producer_manifest_sha256",
            "live_identity",
            "execution",
        },
        "launch record shape drifted",
    )
    _require(
        launch.get("schema") == LAUNCH_SCHEMA
        and launch.get("status") == "LAUNCH_AUTHENTICATED",
        "launch record status drifted",
    )
    _require(launch.get("root") == checked["ingress"]["dimacs"], "launch root drifted")
    _require(
        launch.get("export_receipt") == checked["ingress"]["export_receipt"],
        "launch export receipt drifted",
    )
    _require(
        launch.get("source_manifest_sha256") == sha256_bytes(source_bytes)
        and launch.get("producer_manifest_sha256") == sha256_bytes(producer_bytes),
        "launch manifest identity drifted",
    )
    _validate_recorded_live_identity(launch.get("live_identity"), spec)
    _require(
        launch.get("execution")
        == {
            "backend": spec.ingress.backend,
            "solver_profile": spec.ingress.solver_profile,
            "project": spec.project,
            "timeout_s": spec.timeout_s,
            "requested_core_limit": spec.requested_core_limit,
            "maximum_requested_core_limit": spec.maximum_requested_core_limit,
            "max_prepare_attempts": 1,
            "max_confirm_attempts": 1,
            "max_result_attempts": 1,
            "max_polls": MAX_POLLS,
            "poll_interval_s": POLL_INTERVAL_S,
        },
        "launch execution policy drifted",
    )

    attempts_fd = _open_child_directory_at(run_fd, paths.journal_root.name)
    attempt_fd: int | None = None
    artifact_fd: int | None = None
    try:
        attempt_name = f"attempt-00000000-{spec.root_sha256[:16]}"
        _require(
            os.listdir(attempts_fd) == [attempt_name],
            "sealed journal root does not contain exactly one governed attempt",
        )
        attempt_fd = _open_child_directory_at(attempts_fd, attempt_name)
        attempt_info = os.fstat(attempt_fd)
        expected_attempt_entries = {
            "attempt.jsonl",
            "attempt.jsonl.lock",
            "attempt.jsonl.artifacts",
            "attempt.jsonl.seal.json",
            "solver-receipt.json",
            "custody-seal.json",
        }
        _require(
            set(os.listdir(attempt_fd)) == expected_attempt_entries,
            "sealed attempt contains unexpected or missing entries",
        )
        artifact_fd = _open_child_directory_at(attempt_fd, "attempt.jsonl.artifacts")
        journal_raw, journal_info = _read_regular_at(
            attempt_fd,
            "attempt.jsonl",
            maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
        )
        lock_raw, lock_info = _read_regular_at(
            attempt_fd,
            "attempt.jsonl.lock",
            maximum_bytes=1,
            allow_empty=True,
        )
        _require(lock_raw == b"", "sealed attempt lock is not empty")
        driver_seal_raw, _driver_seal_info = _read_regular_at(
            attempt_fd,
            "attempt.jsonl.seal.json",
            maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
        )
        receipt_raw, receipt_info = _read_regular_at(
            attempt_fd,
            "solver-receipt.json",
            maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
        )
        custody_raw, _custody_info = _read_regular_at(
            attempt_fd,
            "custody-seal.json",
            maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
        )
        driver_seal = _canonical_file_object(driver_seal_raw, "driver seal")
        custody = _canonical_file_object(custody_raw, "custody seal")
        receipt_object = _canonical_file_object(receipt_raw, "solver receipt")
        receipt = _strict_solver_receipt(receipt_raw.decode("utf-8"))
        _require(receipt == receipt_object, "solver receipt parser disagreement")
        _require(
            set(receipt)
            == {
                "schema",
                "attempt",
                "attempt_directory",
                "journal",
                "receipt_path",
                "custody_seal_path",
                "job_id",
                "job_identity",
                "prepare_freshness_claimed",
                "outcome",
                "adapter_verdict",
                "adapter_returncode",
                "cnf_sha256",
                "num_variables",
                "num_clauses",
                "source_manifest_sha256",
                "producer_manifest_sha256",
                "terminal_record_sha256",
                "journal_record_count",
                "seal_sha256",
                "status_classification",
                "status_detail",
                "terminal_status",
                "terminal_status_canonical_sha256",
                "terminal_status_raw_sha256",
                "terminal_status_raw_size",
                "terminal_status_raw_artifact_sha256",
                "terminal_status_identity_scope",
                "terminal_status_exposed_identity_fields",
                "model_response_sha256",
                "endpoint_trace",
                "failure_detail",
                "custody_retry_policy",
                "legacy_drat_proof_path_written",
                "proof_endpoint_called",
                "certificate_blocker",
                "claims",
                "receipt_sha256",
            },
            "solver receipt shape drifted",
        )
        _require(
            receipt.get("claims")
            == {
                "source_entitlement": False,
                "theorem_coverage": False,
                "universal_lift": False,
                "lean_closure": False,
                "one_process": False,
                "one_core": False,
            }
            and receipt.get("prepare_freshness_claimed") is False
            and receipt.get("custody_retry_policy")
            == "REMOVE_UNSEALED_RESERVED_ATTEMPT"
            and receipt.get("outcome") == STRUCTURAL_SAT
            and receipt.get("failure_detail") is None,
            "solver receipt trust claims or custody policy drifted",
        )

        _require(
            set(custody)
            == {
                "schema",
                "attempt_directory_device",
                "attempt_directory_inode",
                "receipt_sha256",
                "receipt_file_sha256",
                "receipt_file_size",
                "receipt_device",
                "receipt_inode",
                "inventory",
                "retry_policy",
                "custody_seal_sha256",
            }
            and custody.get("schema") == CUSTODY_SEAL_SCHEMA,
            "custody seal shape drifted",
        )
        custody_hash = _require_embedded_hash(
            custody, "custody_seal_sha256", "custody seal"
        )
        _require(
            custody.get("attempt_directory_device") == attempt_info.st_dev
            and custody.get("attempt_directory_inode") == attempt_info.st_ino,
            "custody seal no longer binds the attempt directory",
        )
        _require(
            custody.get("receipt_sha256") == receipt.get("receipt_sha256")
            and custody.get("receipt_file_sha256") == sha256_bytes(receipt_raw)
            and custody.get("receipt_file_size") == len(receipt_raw)
            and custody.get("receipt_device") == receipt_info.st_dev
            and custody.get("receipt_inode") == receipt_info.st_ino,
            "custody seal no longer binds the solver receipt",
        )
        _require(
            custody.get("retry_policy") == "REMOVE_UNSEALED_RESERVED_ATTEMPT",
            "custody retry policy drifted",
        )

        inventory = custody.get("inventory")
        _require(
            type(inventory) is dict
            and set(inventory)
            == {
                "journal_sha256",
                "journal_size",
                "journal_device",
                "journal_inode",
                "lock_device",
                "lock_inode",
                "driver_seal_sha256",
                "artifacts",
            },
            "custody inventory shape drifted",
        )
        _require(
            inventory.get("journal_sha256") == sha256_bytes(journal_raw)
            and inventory.get("journal_size") == len(journal_raw)
            and inventory.get("journal_device") == journal_info.st_dev
            and inventory.get("journal_inode") == journal_info.st_ino
            and inventory.get("lock_device") == lock_info.st_dev
            and inventory.get("lock_inode") == lock_info.st_ino
            and inventory.get("driver_seal_sha256") == sha256_bytes(driver_seal_raw),
            "custody inventory control-file binding drifted",
        )
        artifact_bindings = _validate_artifact_inventory(
            artifact_fd, inventory.get("artifacts")
        )
        source_sha256 = sha256_bytes(source_bytes)
        producer_sha256 = sha256_bytes(producer_bytes)
        for digest, label in (
            (spec.root_sha256, "CNF"),
            (source_sha256, "source manifest"),
            (producer_sha256, "producer manifest"),
        ):
            _require(digest in artifact_bindings, f"sealed {label} artifact is missing")
        stored_source, _ = _read_regular_at(
            artifact_fd, source_sha256, maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
        )
        stored_producer, _ = _read_regular_at(
            artifact_fd, producer_sha256, maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
        )
        _require(stored_source == source_bytes, "sealed source manifest drifted")
        _require(stored_producer == producer_bytes, "sealed producer manifest drifted")

        source_manifest = _strict_json(source_bytes, "source manifest")
        producer_manifest = _strict_json(producer_bytes, "producer manifest")
        wave_manifest = _expected_wave_manifest(
            spec, source_manifest, producer_manifest, producer_sha256
        )
        records = _decode_canonical_journal(journal_raw)
        _require(
            set(driver_seal)
            == {
                "schema",
                "wave_manifest_sha256",
                "record_count",
                "terminal_attempt_sha256",
                "journal_sha256",
                "seal_sha256",
            }
            and driver_seal.get("schema") == SEAL_SCHEMA,
            "driver seal shape drifted",
        )
        _require_embedded_hash(driver_seal, "seal_sha256", "driver seal")
        _require(
            driver_seal.get("wave_manifest_sha256")
            == wave_manifest_sha256(wave_manifest)
            and driver_seal.get("record_count") == len(records)
            and driver_seal.get("journal_sha256") == sha256_bytes(journal_raw),
            "driver seal no longer binds the journal",
        )
        terminal_record_sha256 = validate_attempt_journal(
            records,
            manifest=wave_manifest,
            expected_record_count=len(records),
            expected_terminal_sha256=driver_seal.get("terminal_attempt_sha256"),
        )
        _require(
            records and terminal_record_sha256 is not None, "sealed journal is empty"
        )

        job_id = receipt.get("job_id")
        _require(
            type(job_id) is str
            and re.fullmatch(r"[A-Za-z0-9_.-]+", job_id) is not None,
            "sealed job ID is malformed",
        )
        event_keys = {
            "schema",
            "phase",
            "disposition",
            "retry_index",
            "poll_index",
            "job_id",
            "status",
            "result",
            "detail",
            "response",
        }
        events: list[dict[str, Any]] = []
        for index, record in enumerate(records):
            artifacts = record.get("artifacts")
            _require(type(artifacts) is dict, "journal record artifacts are malformed")
            for digest in artifacts.values():
                if digest is not None:
                    _require(
                        digest in artifact_bindings,
                        f"journal record {index} references an unsealed artifact",
                    )
            checkpoint = artifacts.get("checkpoint_sha256")
            _require(type(checkpoint) is str, "journal checkpoint artifact is missing")
            event_raw, _ = _read_regular_at(
                artifact_fd,
                checkpoint,
                maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
            )
            event = _strict_json(event_raw, f"journal event {index}")
            _require(
                canonical_json_bytes(event) == event_raw
                and set(event) == event_keys
                and event.get("schema") == "p97-cegar-piqd-event/v1"
                and event.get("disposition") == "SUCCESS",
                f"journal event {index} shape drifted",
            )
            events.append(event)

        poll_count = len(events) - 4
        _require(1 <= poll_count <= MAX_POLLS, "journal poll count is outside policy")
        _require(
            [event["phase"] for event in events]
            == ["DRIVER_START", "PREPARE", "CONFIRM"]
            + ["POLL"] * poll_count
            + ["MODEL"],
            "journal lifecycle contains duplicate or reordered phases",
        )
        _require(events[0].get("job_id") is None, "driver start unexpectedly has a job")
        _require(
            events[0].get("response")
            == {
                "solver_timeout_s": spec.timeout_s,
                "march_timeout_s": spec.timeout_s,
                "max_prepare_attempts": 1,
                "max_confirm_attempts": 1,
                "max_result_attempts": 1,
                "max_polls": MAX_POLLS,
                "poll_interval_s": POLL_INTERVAL_S,
                "project": spec.project,
                "requested_core_limit": spec.requested_core_limit,
            },
            "driver-start policy event drifted",
        )
        _require(
            all(event.get("job_id") == job_id for event in events[1:]),
            "journal lifecycle crossed jobs",
        )
        _require(
            events[1].get("retry_index") == 0
            and events[2].get("retry_index") == 0
            and events[-1].get("retry_index") == 0
            and all(event.get("retry_index") is None for event in events[3:-1]),
            "journal lifecycle retry indices drifted",
        )
        _require(
            [event.get("poll_index") for event in events[3:-1]]
            == list(range(poll_count)),
            "journal poll indices are not dense",
        )
        prepare_response = events[1].get("response")
        _require(type(prepare_response) is dict, "prepare event response is malformed")
        for key, value in {
            "existing": False,
            "backend": spec.ingress.backend,
            "solver_profile": spec.ingress.solver_profile,
            "cnf_blob_hash": spec.root_sha256,
            "identity_hash": expected_identity_hash(spec, producer_sha256),
            "num_vars": spec.variables,
            "num_clauses": spec.clauses,
        }.items():
            _require(prepare_response.get(key) == value, f"prepare event {key} drifted")
        _require(
            events[-2].get("status") == "completed"
            and events[-2].get("result") == "SAT"
            and events[-1].get("status") == "completed"
            and events[-1].get("result") == "SAT",
            "journal terminal SAT events drifted",
        )
        _require(
            records[-1].get("outcome") == STRUCTURAL_SAT
            and records[-1].get("record_sha256")
            == receipt.get("terminal_record_sha256")
            and receipt.get("journal_record_count") == len(records)
            and receipt.get("seal_sha256") == driver_seal.get("seal_sha256"),
            "solver receipt no longer binds the terminal journal record",
        )

        terminal_status = receipt.get("terminal_status")
        _validate_terminal_sat_status(terminal_status, spec, job_id, producer_sha256)
        _require(
            receipt.get("terminal_status_identity_scope") == "EXPOSED_FIELDS_BOUND"
            and receipt.get("terminal_status_exposed_identity_fields")
            == [
                "backend",
                "cnf_blob_hash",
                "identity_hash",
                "project",
                "solver_profile",
            ]
            and receipt.get("status_detail") == "one solver process returned SAT",
            "terminal status attestation scope drifted",
        )
        terminal_raw_digest = receipt.get("terminal_status_raw_artifact_sha256")
        _require(
            type(terminal_raw_digest) is str
            and terminal_raw_digest in artifact_bindings,
            "terminal raw status artifact is missing",
        )
        terminal_raw, _ = _read_regular_at(
            artifact_fd,
            terminal_raw_digest,
            maximum_bytes=MAX_OFFLINE_CONTROL_BYTES,
        )
        _require(
            sha256_bytes(terminal_raw) == receipt.get("terminal_status_raw_sha256")
            and len(terminal_raw) == receipt.get("terminal_status_raw_size")
            and _strict_json(terminal_raw, "terminal raw status") == terminal_status
            and sha256_bytes(canonical_json_bytes(terminal_status))
            == receipt.get("terminal_status_canonical_sha256"),
            "terminal raw/canonical status binding drifted",
        )

        model_digest = receipt.get("model_response_sha256")
        terminal_artifacts = records[-1].get("artifacts")
        _require(
            type(model_digest) is str
            and model_digest in artifact_bindings
            and type(terminal_artifacts) is dict
            and terminal_artifacts.get("model_sha256") == model_digest,
            "sealed SAT model binding drifted",
        )
        model_raw, _ = _read_regular_at(
            artifact_fd, model_digest, maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
        )
        model = _strict_json(model_raw, "sealed SAT model")
        _require(
            set(model)
            == {
                "job_id",
                "result",
                "backend",
                "solver_profile",
                "num_assigned",
                "assignment",
            },
            "sealed SAT model shape drifted",
        )
        assignment = model.get("assignment")
        _require(
            type(assignment) is list
            and len(assignment) == spec.variables
            and all(type(literal) is int and literal != 0 for literal in assignment),
            "sealed SAT model is not a total signed-literal list",
        )
        _require(
            {abs(literal) for literal in assignment}
            == set(range(1, spec.variables + 1)),
            "sealed SAT model does not assign every variable exactly once",
        )
        for key, value in {
            "job_id": job_id,
            "result": "SAT",
            "backend": spec.ingress.backend,
            "solver_profile": spec.ingress.solver_profile,
            "num_assigned": spec.variables,
        }.items():
            _require(model.get(key) == value, f"sealed SAT model {key} drifted")
        log_digest = terminal_artifacts.get("solver_log_sha256")
        _require(
            type(log_digest) is str and log_digest in artifact_bindings,
            "sealed solver log is missing",
        )
        solver_log, _ = _read_regular_at(
            artifact_fd, log_digest, maximum_bytes=MAX_OFFLINE_CONTROL_BYTES
        )
        _require(bool(solver_log), "sealed solver log is empty")

        with _open_ingress_regular_nofollow(paths.ingress.child)[0] as stream:
            cnf = stream.read(spec.root_bytes + 1)
        _require(
            len(cnf) == spec.root_bytes and sha256_bytes(cnf) == spec.root_sha256,
            "local replay CNF drifted",
        )
        try:
            replay_dimensions = scan_dimacs(cnf, tuple(assignment))
        except PiqdOracleError as exc:
            raise WeightedSuccessorModelRunnerError(
                "sealed SAT model failed independent full-CNF replay"
            ) from exc
        _require(
            replay_dimensions == (spec.variables, spec.clauses),
            "independent SAT replay dimensions drifted",
        )
        result = StaticSolverResult(
            verdict="SAT",
            assignment={abs(literal): literal > 0 for literal in assignment},
            returncode=10,
        )
        _validate_terminal_receipt(
            receipt,
            result,
            paths,
            spec,
            source_sha256,
            producer_sha256,
        )
        attempt_path = paths.journal_root / attempt_name
        _require(
            receipt.get("attempt") == 0
            and receipt.get("attempt_directory") == str(attempt_path)
            and receipt.get("journal") == str(attempt_path / "attempt.jsonl")
            and receipt.get("receipt_path") == str(attempt_path / "solver-receipt.json")
            and receipt.get("custody_seal_path")
            == str(attempt_path / "custody-seal.json"),
            "solver receipt escaped or renamed its sealed attempt",
        )
        return {
            "launch_sha256": sha256_bytes(launch_raw),
            "job_id": job_id,
            "receipt_path": receipt["receipt_path"],
            "receipt_sha256": receipt["receipt_sha256"],
            "custody_seal_path": receipt["custody_seal_path"],
            "custody_seal_sha256": custody_hash,
            "model_response_sha256": model_digest,
            "solver_log_sha256": log_digest,
            "terminal_status_canonical_sha256": receipt[
                "terminal_status_canonical_sha256"
            ],
            "poll_count": poll_count,
            "journal_record_count": len(records),
            "run_epoch": terminal_status["run_epoch"],
            "attested_solver_processes": terminal_status["attested_solver_processes"],
            "producer_manifest_sha256": producer_sha256,
            "producer_manifest_bytes": len(producer_bytes),
            "replay_variables": replay_dimensions[0],
            "replay_clauses": replay_dimensions[1],
        }
    finally:
        if artifact_fd is not None:
            os.close(artifact_fd)
        if attempt_fd is not None:
            os.close(attempt_fd)
        os.close(attempts_fd)


def static_check(
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> dict[str, Any]:
    _require(spec.provisioned, "weighted-successor-model runner is unprovisioned")
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


def _finalize_existing(
    *,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    static_checker: Callable[[RunnerPaths, RunnerSpec], dict[str, Any]],
    attempt_validator: Callable[
        [int, RunnerPaths, RunnerSpec, Mapping[str, Any], bytes, bytes],
        dict[str, Any],
    ],
) -> dict[str, Any]:
    """Finalize one already-sealed SAT attempt without any PIQD interaction."""

    _require(spec.provisioned, "weighted-successor-model runner is unprovisioned")
    checked = static_checker(paths, spec)
    _require(checked.get("status") == "PASS", "offline static check is not PASS")
    source_bytes, producer_bytes = build_static_manifests(checked["ingress"], spec)
    run_fd = _open_directory_nofollow(paths.run_root, create=False)
    artifacts_fd: int | None = None
    lock_fd: int | None = None
    try:
        artifacts_fd = _validate_run_layout(run_fd, paths, spec)
        lock_fd, lock_info = _open_regular_at(artifacts_fd, paths.lock.name)
        _require(lock_info.st_size == 0, "governed runner lock is not empty")
        try:
            fcntl.flock(lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError as exc:
            raise WeightedSuccessorModelRunnerError(
                "governed runner lock is already held"
            ) from exc
        try:
            os.stat(paths.terminal.name, dir_fd=artifacts_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise FileExistsError("offline terminal finalization already exists")
        evidence = attempt_validator(
            artifacts_fd,
            paths,
            spec,
            checked,
            source_bytes,
            producer_bytes,
        )
        terminal = {
            "schema": RUN_SCHEMA,
            "status": "PASS",
            "verdict": "SAT",
            "certification": "SAT_MODEL_INDEPENDENTLY_REPLAYED",
            "launch_sha256": evidence["launch_sha256"],
            "job_id": evidence["job_id"],
            "receipt": {
                "path": evidence["receipt_path"],
                "sha256": evidence["receipt_sha256"],
                "custody_seal_path": evidence["custody_seal_path"],
            },
            "remote_producer_manifest": {
                "job_id": evidence["job_id"],
                "path": (
                    f"/jobs/{evidence['job_id']}/blobs/"
                    f"{evidence['producer_manifest_sha256']}"
                ),
                "sha256": evidence["producer_manifest_sha256"],
                "bytes": evidence["producer_manifest_bytes"],
                "verified_before_confirm": True,
            },
            "model_response_sha256": evidence["model_response_sha256"],
            "terminal_status_canonical_sha256": evidence[
                "terminal_status_canonical_sha256"
            ],
            "next_gate": "mine only this new SAT survivor",
            "offline_finalization": {
                "schema": OFFLINE_FINALIZATION_SCHEMA,
                "network_requests": 0,
                "prepare_attempts": 0,
                "confirm_attempts": 0,
                "poll_count": evidence["poll_count"],
                "journal_record_count": evidence["journal_record_count"],
                "run_epoch": evidence["run_epoch"],
                "attested_solver_processes": evidence["attested_solver_processes"],
                "custody_seal_sha256": evidence["custody_seal_sha256"],
                "solver_log_sha256": evidence["solver_log_sha256"],
                "replay_variables": evidence["replay_variables"],
                "replay_clauses": evidence["replay_clauses"],
            },
        }
        terminal_bytes = canonical_json_bytes(terminal) + b"\n"
        terminal["terminal_file_sha256"] = _write_once(
            artifacts_fd, paths.terminal.name, terminal_bytes
        )
        return terminal
    finally:
        if lock_fd is not None:
            try:
                fcntl.flock(lock_fd, fcntl.LOCK_UN)
            finally:
                os.close(lock_fd)
        if artifacts_fd is not None:
            os.close(artifacts_fd)
        os.close(run_fd)


def finalize_existing(
    *,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> dict[str, Any]:
    """Finalize the sole sealed SAT attempt using only production validators."""

    _validate_lane_checkpoint(paths)
    return _finalize_existing(
        paths=paths,
        spec=spec,
        static_checker=static_check,
        attempt_validator=_validate_existing_attempt,
    )


def _start(
    *,
    base_url: str = "http://127.0.0.1:7272",
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    transport: Transport | None = None,
    identity_fetcher: Callable[[str, RunnerSpec], dict[str, Any]] = live_identity,
    sleep: Callable[[float], None] = time.sleep,
    max_polls: int = MAX_POLLS,
    poll_interval_s: float = POLL_INTERVAL_S,
    attempt_validator: Callable[
        [int, RunnerPaths, RunnerSpec, Mapping[str, Any], bytes, bytes],
        dict[str, Any],
    ],
) -> dict[str, Any]:
    """Reserve and execute the sole governed production launch."""

    _require(
        max_polls == MAX_POLLS and poll_interval_s == POLL_INTERVAL_S,
        "production polling policy is fixed and cannot be overridden",
    )
    checked = static_check(paths, spec)
    source_bytes, producer_bytes = build_static_manifests(checked["ingress"], spec)
    with _reserve_run(paths, spec) as run_fd:
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
            expected_identity_sha256=expected_identity_hash(
                spec, sha256_bytes(producer_bytes)
            ),
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
            raise WeightedSuccessorModelRunnerError(result.stderr)
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
        sealed_evidence: dict[str, Any] | None = None
        if result.verdict == "SAT":
            sealed_evidence = attempt_validator(
                run_fd,
                paths,
                spec,
                checked,
                source_bytes,
                producer_bytes,
            )
            _require(
                sealed_evidence.get("receipt_sha256") == receipt.get("receipt_sha256")
                and sealed_evidence.get("job_id") == receipt.get("job_id")
                and sealed_evidence.get("model_response_sha256")
                == receipt.get("model_response_sha256")
                and sealed_evidence.get("replay_variables") == spec.variables
                and sealed_evidence.get("replay_clauses") == spec.clauses,
                "live SAT result disagrees with sealed offline replay evidence",
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
            "sealed_sat_evidence": sealed_evidence,
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
    """Execute the sole launch with the non-overridable sealed-attempt validator."""

    _validate_lane_checkpoint(paths)
    return _start(
        base_url=base_url,
        paths=paths,
        spec=spec,
        transport=transport,
        identity_fetcher=identity_fetcher,
        sleep=sleep,
        max_polls=max_polls,
        poll_interval_s=poll_interval_s,
        attempt_validator=_validate_existing_attempt,
    )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "command", choices=("static-check", "start", "finalize-existing")
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        if args.command == "static-check":
            payload = static_check()
        elif args.command == "finalize-existing":
            payload = finalize_existing()
        else:
            payload = start(base_url=args.base_url)
    except (
        IngressValidationError,
        StaticPiqdRunnerError,
        WeightedSuccessorModelRunnerError,
        WaveContractError,
        FileExistsError,
    ) as exc:
        print(f"weighted-successor-model PIQD runner rejected: {exc}")
        return 2
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0 if payload.get("verdict") != "UNSAT" else 3


if __name__ == "__main__":
    raise SystemExit(main())
