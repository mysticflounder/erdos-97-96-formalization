"""PIQD discovery adapter for the finite Exact12 v14 structural CEGAR lane.

PIQD supplies observational SAT/UNSAT/UNKNOWN results for the current finite
CNF.  The structural coordinator independently replays SAT models, and only
an observational UNSAT is allowed to reach its one fresh local CaDiCaL/DRAT
terminal rerun.  This module makes no universal, theorem, or Lean claim.
"""

from __future__ import annotations

import json
import stat
import time
from collections.abc import Callable, Mapping
from pathlib import Path
from typing import Any
from urllib.parse import urlsplit

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_oracle import Transport, raw_dimacs_identity
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    PRODUCER_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    authenticate_static_manifests,
    make_static_piqd_solver_runner,
)

from .exact12_next_row_structural_piqd import (
    _validate_attempt_custody,
)
from .exact12_v14_bound_jobs import BOUND_JOB_SCHEMA
from .exact12_v14_cell_run import cnf_assignment_satisfies
from .exact12_v14_structural_cegar import (
    SEQUENTIAL_MODE,
    run_structural_cegar,
)
from .sat_encoding import CadicalResult, CoverInstance, solve_cadical

DESCRIPTOR_SCHEMA = "p97-rigid221-exact12-v14-structural-piqd-descriptor/v1"
PIQD_PROJECT = "p97-exact12-v14-structural"
DEFAULT_PIQD_BASE_URL = "http://127.0.0.1:7272"
MAX_CNF_BYTES = 256 * 1024 * 1024
_FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_RECEIPT_FALSE_CLAIMS = {**_FALSE_CLAIMS, "one_process": False, "one_core": False}
_RECEIPT_KEYS = {
    "schema", "attempt", "attempt_directory", "journal", "receipt_path",
    "custody_seal_path", "job_id", "job_identity", "prepare_freshness_claimed",
    "outcome", "adapter_verdict", "adapter_returncode", "cnf_sha256",
    "num_variables", "num_clauses", "source_manifest_sha256",
    "producer_manifest_sha256", "terminal_record_sha256", "journal_record_count",
    "seal_sha256", "status_classification", "status_detail", "terminal_status",
    "terminal_status_canonical_sha256", "terminal_status_raw_sha256",
    "terminal_status_raw_size", "terminal_status_raw_artifact_sha256",
    "terminal_status_identity_scope", "terminal_status_exposed_identity_fields",
    "model_response_sha256", "endpoint_trace", "failure_detail",
    "custody_retry_policy", "legacy_drat_proof_path_written", "proof_endpoint_called",
    "certificate_blocker", "claims", "receipt_sha256",
}
_CUSTODY_RETRY_POLICY = "REMOVE_UNSEALED_RESERVED_ATTEMPT"
_MAX_RECEIPT_BYTES = 1024 * 1024


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"invalid JSON constant: {value}")


def _reject_json_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _strict_receipt(raw: bytes) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > _MAX_RECEIPT_BYTES or not raw.endswith(b"\n"):
        raise Exact12V14StructuralPiqdError("PIQD solver receipt custody is malformed")
    try:
        value = json.loads(
            raw[:-1],
            object_pairs_hook=_reject_json_duplicates,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12V14StructuralPiqdError("PIQD solver receipt is not strict JSON") from exc
    if type(value) is not dict or canonical_json_bytes(value) + b"\n" != raw:
        raise Exact12V14StructuralPiqdError("PIQD solver receipt is not canonical")
    if set(value) != _RECEIPT_KEYS or value.get("schema") != "p97-piqd-static-solver-receipt/v1":
        raise Exact12V14StructuralPiqdError("PIQD solver receipt key schema is crossed")
    unsigned = dict(value)
    claimed = unsigned.pop("receipt_sha256")
    if type(claimed) is not str or claimed != sha256_json(unsigned):
        raise Exact12V14StructuralPiqdError("PIQD solver receipt hash is invalid")
    return value


def _digest(value: object, name: str) -> str:
    if type(value) is not str or len(value) != 64:
        raise Exact12V14StructuralPiqdError(f"{name} is not a sha256 digest")
    try:
        int(value, 16)
    except ValueError as exc:
        raise Exact12V14StructuralPiqdError(f"{name} is not a sha256 digest") from exc
    return value


def _optional_digest(value: object, name: str) -> None:
    if value is not None:
        _digest(value, name)


class Exact12V14StructuralPiqdError(ValueError):
    """A PIQD descriptor, receipt, custody, or replay contract failed."""


def _digest_bytes(value: bytes) -> str:
    return sha256_bytes(value)


def build_discovery_descriptor(
    job: Mapping[str, Any], instance: CoverInstance
) -> dict[str, Any]:
    """Build the canonical descriptor for the exact current finite query."""

    dimacs = instance.dimacs().encode("ascii")
    cnf = {
        "encoding": "DIMACS",
        "bytes": len(dimacs),
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.clauses_with()),
        "sha256": _digest_bytes(dimacs),
    }
    compiler_manifest = job.get("compiler_manifest")
    if not isinstance(compiler_manifest, Mapping):
        raise Exact12V14StructuralPiqdError("v14 job compiler manifest is malformed")
    return {
        "schema": DESCRIPTOR_SCHEMA,
        "job_id": job.get("job_id"),
        "job_schema": BOUND_JOB_SCHEMA,
        "job_sha256": _digest_bytes(canonical_json_bytes(job)),
        "cell_index": job.get("cell_index"),
        "cnf": cnf,
        "compiler_manifest": compiler_manifest,
        "compiler_manifest_sha256": _digest_bytes(
            canonical_json_bytes(compiler_manifest)
        ),
        "route": "PIQD_DISCOVERY_ONLY_LOCAL_IDENTICAL_CNF_TERMINAL_PROOF",
        "query_polarity": "SAT_MEANS_SURVIVING_STRUCTURAL_CUBE",
        "claims": dict(_FALSE_CLAIMS),
    }


def _manifests(
    descriptor: Mapping[str, Any], descriptor_sha256: str
) -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": f"{DESCRIPTOR_SCHEMA}:{descriptor_sha256}",
        "source_path": f"descriptors/descriptor-{descriptor_sha256}.json",
        "source_sha256": descriptor_sha256,
        "finite_schema": BOUND_JOB_SCHEMA,
        "cardinality_scope": "one exact12 normalized-v14 structural cell",
        "source_theorem": "NONE: finite PIQD discovery evidence only",
        "claims": dict(_FALSE_CLAIMS),
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": f"{PIQD_PROJECT}:{descriptor_sha256}",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": _digest_bytes(source_bytes),
        "variable_map_sha256": descriptor["compiler_manifest_sha256"],
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": {**_FALSE_CLAIMS, "one_process": False, "one_core": False},
    }
    producer_bytes = canonical_json_bytes(producer)
    try:
        authenticate_static_manifests(
            source_manifest=source_bytes, producer_manifest=producer_bytes
        )
    except Exception as exc:
        raise Exact12V14StructuralPiqdError(
            "v14 PIQD manifests failed strict authentication"
        ) from exc
    return source_bytes, producer_bytes


def _install_descriptor(
    journal_root: Path, descriptor: Mapping[str, Any], descriptor_sha256: str
) -> tuple[Path, bytes]:
    """Install a content-addressed descriptor without replacing existing bytes."""

    if not isinstance(journal_root, Path):
        raise Exact12V14StructuralPiqdError("PIQD journal root must be a Path")
    root = journal_root.absolute()
    if root.is_symlink():
        raise Exact12V14StructuralPiqdError("PIQD descriptor root is a symlink")
    root.mkdir(parents=True, exist_ok=True)
    descriptors = root / "descriptors"
    descriptors.mkdir(exist_ok=True)
    if root.is_symlink() or descriptors.is_symlink():
        raise Exact12V14StructuralPiqdError("PIQD descriptor root is a symlink")
    payload = canonical_json_bytes(descriptor) + b"\n"
    if _digest_bytes(payload) != descriptor_sha256:
        raise Exact12V14StructuralPiqdError("descriptor digest changed before custody")
    path = descriptors / f"descriptor-{descriptor_sha256}.json"
    try:
        with path.open("xb") as handle:
            handle.write(payload)
    except FileExistsError:
        if path.is_symlink() or path.read_bytes() != payload:
            raise Exact12V14StructuralPiqdError("descriptor custody was rebound")
    if path.is_symlink() or not path.is_file() or path.read_bytes() != payload:
        raise Exact12V14StructuralPiqdError("descriptor custody is not stable")
    return path, payload


def _validate_result(
    value: object,
    *,
    n_variables: int,
    n_clauses: int,
    current_dimacs: bytes,
    source_manifest: bytes,
    producer_manifest: bytes,
    journal_root: Path,
) -> StaticSolverResult:
    if type(value) is not StaticSolverResult:
        raise Exact12V14StructuralPiqdError("PIQD returned the wrong result type")
    if value.verdict not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise Exact12V14StructuralPiqdError("PIQD verdict is malformed")
    if type(value.returncode) is not int or type(value.assignment) is not dict:
        raise Exact12V14StructuralPiqdError("PIQD result shape is malformed")
    if type(value.stdout) is not str or type(value.stderr) is not str:
        raise Exact12V14StructuralPiqdError("PIQD diagnostics are malformed")
    if any(type(key) is not int for key in value.assignment) or any(
        type(selected) is not bool for selected in value.assignment.values()
    ):
        raise Exact12V14StructuralPiqdError("PIQD assignment types are malformed")
    if value.verdict == "SAT":
        if value.returncode != 10 or set(value.assignment) != set(
            range(1, n_variables + 1)
        ):
            raise Exact12V14StructuralPiqdError("PIQD SAT assignment is not total")
    elif value.assignment:
        raise Exact12V14StructuralPiqdError("non-SAT PIQD result carries a model")
    elif value.verdict == "UNSAT" and value.returncode != 20:
        raise Exact12V14StructuralPiqdError("PIQD UNSAT return code is malformed")
    elif value.verdict == "UNKNOWN" and value.returncode != 1:
        raise Exact12V14StructuralPiqdError("PIQD UNKNOWN return code is malformed")
    if not value.stdout:
        if value.verdict != "UNKNOWN":
            raise Exact12V14StructuralPiqdError(
                "PIQD SAT/UNSAT result lacks a custody receipt"
            )
        return value
    raw = value.stdout.encode("utf-8")
    receipt = _strict_receipt(raw)
    current_sha256 = _digest_bytes(current_dimacs)
    source_sha256 = _digest_bytes(source_manifest)
    producer_sha256 = _digest_bytes(producer_manifest)
    expected = {
        "adapter_verdict": value.verdict,
        "adapter_returncode": value.returncode,
        "cnf_sha256": current_sha256,
        "num_variables": n_variables,
        "num_clauses": n_clauses,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "prepare_freshness_claimed": False,
        "custody_retry_policy": _CUSTODY_RETRY_POLICY,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
        "certificate_blocker": CERTIFICATE_BLOCKER,
    }
    if any(receipt[key] != expected_value for key, expected_value in expected.items()):
        raise Exact12V14StructuralPiqdError("PIQD receipt is not bound to this CNF/result")
    if type(receipt["claims"]) is not dict or receipt["claims"] != _RECEIPT_FALSE_CLAIMS:
        raise Exact12V14StructuralPiqdError("PIQD receipt claims are not all false")
    expected_outcome = {
        "SAT": "STRUCTURAL_SAT",
        "UNSAT": "DISCOVERY_UNSAT",
        "UNKNOWN": "ERROR",
    }[value.verdict]
    if receipt["outcome"] != expected_outcome:
        raise Exact12V14StructuralPiqdError("PIQD receipt outcome is not bound")
    identity = receipt["job_identity"]
    if type(identity) is not dict or set(identity) != {
        "job_id", "backend", "solver_profile", "project", "cnf_blob_hash",
        "identity_hash", "num_vars", "num_clauses", "existing",
        "requested_core_limit",
    }:
        raise Exact12V14StructuralPiqdError("PIQD job identity schema is crossed")
    identity_expected = {
        "backend": "cadical", "solver_profile": "sat", "project": PIQD_PROJECT,
        "cnf_blob_hash": current_sha256, "num_vars": n_variables,
        "num_clauses": n_clauses, "requested_core_limit": 1,
    }
    identity_expected["identity_hash"] = raw_dimacs_identity(
        backend="cadical", solver_profile="sat", cnf_sha256=current_sha256,
        producer_manifest_sha256=producer_sha256, requested_core_limit=1,
    )
    if any(identity[key] != expected_value for key, expected_value in identity_expected.items()):
        raise Exact12V14StructuralPiqdError("PIQD job identity is not authenticated")
    if type(identity["job_id"]) is not str or receipt["job_id"] != identity["job_id"]:
        raise Exact12V14StructuralPiqdError("PIQD receipt job identity is crossed")
    if type(receipt["attempt"]) is not int or receipt["attempt"] < 0:
        raise Exact12V14StructuralPiqdError("PIQD receipt attempt is malformed")
    if type(receipt["journal_record_count"]) is not int or receipt["journal_record_count"] <= 0:
        raise Exact12V14StructuralPiqdError("PIQD receipt journal_record_count is malformed")
    for key in ("attempt_directory", "journal", "receipt_path", "custody_seal_path"):
        if type(receipt[key]) is not str:
            raise Exact12V14StructuralPiqdError(f"PIQD receipt {key} is malformed")
    for key in ("terminal_record_sha256", "seal_sha256"):
        _digest(receipt[key], f"PIQD receipt {key}")
    for key in (
        "terminal_status_canonical_sha256", "terminal_status_raw_sha256",
        "terminal_status_raw_artifact_sha256", "model_response_sha256",
    ):
        _optional_digest(receipt[key], f"PIQD receipt {key}")
    if receipt["terminal_status_raw_size"] is not None and (
        type(receipt["terminal_status_raw_size"]) is not int
        or receipt["terminal_status_raw_size"] < 0
    ):
        raise Exact12V14StructuralPiqdError("PIQD receipt raw status size is malformed")
    terminal_status = receipt["terminal_status"]
    if terminal_status is None:
        if receipt["terminal_status_canonical_sha256"] is not None:
            raise Exact12V14StructuralPiqdError("PIQD absent terminal status is cross-bound")
    elif type(terminal_status) is not dict or terminal_status.get("id") != receipt["job_id"]:
        raise Exact12V14StructuralPiqdError("PIQD terminal status identity is crossed")
    elif receipt["terminal_status_canonical_sha256"] != sha256_bytes(
        canonical_json_bytes(terminal_status)
    ):
        raise Exact12V14StructuralPiqdError("PIQD terminal status hash is invalid")
    raw_attestation = (
        receipt["terminal_status_raw_sha256"],
        receipt["terminal_status_raw_size"],
        receipt["terminal_status_raw_artifact_sha256"],
    )
    if any(item is None for item in raw_attestation) and any(
        item is not None for item in raw_attestation
    ):
        raise Exact12V14StructuralPiqdError(
            "PIQD terminal status raw attestation is partial"
        )
    if any(
        type(receipt[key]) is not str
        for key in (
            "status_classification",
            "status_detail",
            "terminal_status_identity_scope",
        )
    ):
        raise Exact12V14StructuralPiqdError("PIQD receipt status fields are malformed")
    exposed = receipt["terminal_status_exposed_identity_fields"]
    if type(exposed) is not list or any(type(item) is not str for item in exposed):
        raise Exact12V14StructuralPiqdError("PIQD receipt exposed fields are malformed")
    if terminal_status is None and (
        exposed or receipt["terminal_status_identity_scope"] != "NO_PARSED_TERMINAL_STATUS"
    ):
        raise Exact12V14StructuralPiqdError(
            "PIQD absent terminal status is inconsistently attested"
        )
    if receipt["failure_detail"] is not None and type(receipt["failure_detail"]) is not str:
        raise Exact12V14StructuralPiqdError("PIQD receipt failure detail is malformed")
    trace = receipt["endpoint_trace"]
    if type(trace) is not list:
        raise Exact12V14StructuralPiqdError("PIQD receipt endpoint trace is malformed")
    for entry in trace:
        if type(entry) is not dict or set(entry) != {"method", "target"}:
            raise Exact12V14StructuralPiqdError("PIQD receipt endpoint entry is malformed")
        method, target = entry["method"], entry["target"]
        if type(method) is not str or type(target) is not str:
            raise Exact12V14StructuralPiqdError("PIQD receipt endpoint fields are malformed")
        parsed = urlsplit(target)
        if (
            parsed.scheme or parsed.netloc or parsed.fragment or not target.startswith("/")
            or target.startswith("//") or "%" in target or "\\" in target
            or any(ord(char) < 0x20 or ord(char) == 0x7F for char in target)
            or not parsed.path or parsed.path.endswith("/")
            or any(part in {"", ".", ".."} for part in parsed.path.split("/")[1:])
        ):
            raise Exact12V14StructuralPiqdError("PIQD receipt endpoint target is malformed")
        if parsed.path == f"/jobs/{receipt['job_id']}/proof":
            raise Exact12V14StructuralPiqdError("PIQD receipt called the proof endpoint")
    try:
        # Reuse the adjacent lane's maintained exact custody validator for the
        # receipt file, driver seal, inventory, and required artifacts. Its
        # receipt helper is project-bound to the next-row lane, so the v14
        # static-runner receipt fields above remain explicitly cross-bound here.
        _validate_attempt_custody(
            receipt=receipt,
            receipt_raw=raw,
            receipt_path=Path(receipt["receipt_path"]),
            piqd_journal_root=journal_root,
            current_dimacs=current_dimacs,
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
        )
    except Exception as exc:
        raise Exact12V14StructuralPiqdError(
            "PIQD receipt custody/inventory authentication failed"
        ) from exc
    return value


class Exact12V14StructuralPiqdDiscovery:
    """One descriptor-bound, discovery-only PIQD callback."""

    def __init__(
        self,
        *,
        instance: CoverInstance,
        descriptor: Mapping[str, Any],
        descriptor_path: Path,
        descriptor_bytes: bytes,
        source_manifest: bytes,
        producer_manifest: bytes,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
    ) -> None:
        self.instance = instance
        self.descriptor = descriptor
        self.descriptor_path = descriptor_path
        self.descriptor_bytes = descriptor_bytes
        self.source_manifest = source_manifest
        self.producer_manifest = producer_manifest
        self.runner = runner

    def __call__(
        self,
        instance: CoverInstance,
        cnf_path: Path,
        *,
        timeout_seconds: int,
        nice: int,
        proof_path: Path | None,
    ) -> CadicalResult:
        del nice  # PIQD owns the solver profile; the terminal local call owns nice.
        if instance is not self.instance:
            raise Exact12V14StructuralPiqdError("PIQD discovery instance crossed")
        if proof_path is not None:
            raise Exact12V14StructuralPiqdError(
                "PIQD discovery must receive proof_path=None"
            )
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise Exact12V14StructuralPiqdError("PIQD timeout must be positive")
        if cnf_path.is_symlink():
            raise Exact12V14StructuralPiqdError("PIQD CNF path is a symlink")
        current = instance.dimacs().encode("ascii")
        cnf_path.parent.mkdir(parents=True, exist_ok=True)
        cnf_path.write_bytes(current)
        if cnf_path.read_bytes() != current:
            raise Exact12V14StructuralPiqdError("PIQD discovery CNF custody changed")
        descriptor_stat = self.descriptor_path.stat(follow_symlinks=False)
        descriptor_identity = (descriptor_stat.st_dev, descriptor_stat.st_ino)
        if (
            stat.S_ISREG(descriptor_stat.st_mode) is False
            or self.descriptor_path.is_symlink()
            or self.descriptor_path.read_bytes() != self.descriptor_bytes
        ):
            raise Exact12V14StructuralPiqdError("PIQD descriptor custody changed")
        try:
            raw = self.runner(cnf_path, timeout_seconds, None)
        except Exception as exc:  # noqa: BLE001 - fail closed at the transport boundary
            return CadicalResult("UNKNOWN", None, 1, False, f"PIQD failure: {exc}")
        descriptor_stat = self.descriptor_path.stat(follow_symlinks=False)
        if (
            stat.S_ISREG(descriptor_stat.st_mode) is False
            or self.descriptor_path.is_symlink()
            or (descriptor_stat.st_dev, descriptor_stat.st_ino) != descriptor_identity
            or self.descriptor_path.read_bytes() != self.descriptor_bytes
        ):
            raise Exact12V14StructuralPiqdError(
                "PIQD descriptor custody changed after runner"
            )
        if cnf_path.read_bytes() != current:
            raise Exact12V14StructuralPiqdError("PIQD runner changed discovery CNF")
        result = _validate_result(
            raw,
            n_variables=instance.cnf.n_variables,
            n_clauses=len(instance.clauses_with()),
            current_dimacs=current,
            source_manifest=self.source_manifest,
            producer_manifest=self.producer_manifest,
            journal_root=self.descriptor_path.parent.parent,
        )
        diagnostic = (result.stdout + "\n" + result.stderr)[-1000:]
        if result.verdict == "UNSAT":
            return CadicalResult("UNSAT", None, 20, False, diagnostic)
        if result.verdict == "UNKNOWN":
            return CadicalResult("UNKNOWN", None, 1, False, diagnostic)
        positive = frozenset(
            variable for variable, selected in result.assignment.items() if selected
        )
        if not cnf_assignment_satisfies(
            instance.clauses_with(),
            positive,
            n_variables=instance.cnf.n_variables,
        ):
            raise Exact12V14StructuralPiqdError(
                "PIQD SAT model failed independent exact-CNF replay"
            )
        try:
            cube = instance.decode_model(positive)
        except Exception as exc:
            raise Exact12V14StructuralPiqdError(
                "PIQD SAT model failed independent cube decoding"
            ) from exc
        return CadicalResult("SAT", cube, 10, False, diagnostic, positive)


RunnerFactory = Callable[..., Callable[[Path, int, Path | None], StaticSolverResult]]


class Exact12V14StructuralPiqdDiscoveryFactory:
    """Create a fresh descriptor and static runner for every current CNF."""

    def __init__(
        self,
        *,
        repo_root: Path,
        base_url: str,
        journal_root: Path,
        transport: Transport | None = None,
        sleep: Callable[[float], None] = time.sleep,
        runner_factory: RunnerFactory = make_static_piqd_solver_runner,
    ) -> None:
        del repo_root  # The validated bound job is the source custody boundary.
        if type(base_url) is not str or not base_url.strip():
            raise Exact12V14StructuralPiqdError("PIQD URL must be nonempty")
        if not isinstance(journal_root, Path):
            raise Exact12V14StructuralPiqdError("PIQD journal root must be a Path")
        self.base_url = base_url
        self.journal_root = journal_root
        self.transport = transport
        self.sleep = sleep
        self.runner_factory = runner_factory

    def __call__(
        self, initial_instance: CoverInstance, job: Mapping[str, Any]
    ) -> Callable[..., CadicalResult]:
        def solve(
            instance: CoverInstance,
            cnf_path: Path,
            *,
            timeout_seconds: int,
            nice: int,
            proof_path: Path | None,
        ) -> CadicalResult:
            if instance is not initial_instance:
                raise Exact12V14StructuralPiqdError("PIQD discovery instance crossed")
            descriptor = build_discovery_descriptor(job, instance)
            descriptor_bytes = canonical_json_bytes(descriptor) + b"\n"
            descriptor_sha256 = _digest_bytes(descriptor_bytes)
            descriptor_path, _ = _install_descriptor(
                self.journal_root, descriptor, descriptor_sha256
            )
            source_manifest, producer_manifest = _manifests(
                descriptor, descriptor_sha256
            )
            try:
                runner = self.runner_factory(
                    base_url=self.base_url,
                    journal_root=self.journal_root / "attempts",
                    source_manifest=source_manifest,
                    producer_manifest=producer_manifest,
                    transport=self.transport,
                    policy=DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1),
                    max_cnf_bytes=MAX_CNF_BYTES,
                    sleep=self.sleep,
                )
            except (StaticPiqdRunnerError, OSError) as exc:
                return CadicalResult("UNKNOWN", None, 1, False, f"PIQD setup: {exc}")
            adapter = Exact12V14StructuralPiqdDiscovery(
                instance=instance,
                descriptor=descriptor,
                descriptor_path=descriptor_path,
                descriptor_bytes=descriptor_bytes,
                source_manifest=source_manifest,
                producer_manifest=producer_manifest,
                runner=runner,
            )
            return adapter(
                instance,
                cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )

        return solve


def run_exact12_v14_structural_piqd(
    repo_root: Path,
    workdir: Path,
    cell_index: int,
    *,
    piqd_base_url: str = DEFAULT_PIQD_BASE_URL,
    piqd_journal_root: Path,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
    workers: int = 1,
    parallel_mode: str = SEQUENTIAL_MODE,
    terminal_solver: Callable[..., CadicalResult] = solve_cadical,
) -> dict[str, Any]:
    """Run one finite structural cell with strict sequential PIQD discovery."""

    if type(workers) is not int or workers != 1:
        raise Exact12V14StructuralPiqdError("PIQD requires exactly one worker")
    if type(parallel_mode) is not str or parallel_mode != SEQUENTIAL_MODE:
        raise Exact12V14StructuralPiqdError("PIQD requires sequential scheduling")
    factory = Exact12V14StructuralPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url=piqd_base_url,
        journal_root=piqd_journal_root,
        transport=transport,
        sleep=sleep,
    )
    return run_structural_cegar(
        repo_root,
        workdir,
        cell_index,
        max_iterations=max_iterations,
        timeout_seconds=timeout_seconds,
        nice=nice,
        seed_journal=seed_journal,
        discovery_solver_factory=factory,
        terminal_solver=terminal_solver,
    )


__all__ = [
    "DEFAULT_PIQD_BASE_URL",
    "DESCRIPTOR_SCHEMA",
    "Exact12V14StructuralPiqdDiscovery",
    "Exact12V14StructuralPiqdDiscoveryFactory",
    "Exact12V14StructuralPiqdError",
    "build_discovery_descriptor",
    "run_exact12_v14_structural_piqd",
]
