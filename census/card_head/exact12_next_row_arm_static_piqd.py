"""Discovery-only PIQD adapter for the frozen Exact12 arm-static canary.

PIQD may report a replayed SAT model or observational UNSAT/UNKNOWN.  It never
writes the legacy proof path.  The canary's existing byte-identical local
CaDiCaL/DRAT terminal rerun remains the only route from discovery UNSAT to a
proof-authenticated finite diagnostic result.
"""

from __future__ import annotations

import time
from collections.abc import Callable, Mapping
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_oracle import Transport, scan_dimacs
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    PRODUCER_SCHEMA,
    RECEIPT_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    make_static_piqd_solver_runner,
)

from . import exact12_next_row_static_piqd as _custody
from .exact12_next_row_arm_static_canary import (
    ARM_SUFFIX_SCHEMA,
    EXPECTED_ARM_SUFFIX_CLAUSES,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_POST_ARM_DIMACS_SHA256,
    EXPECTED_PREFIX_VARIABLES,
    EXPECTED_SOURCE_ORDER_CLAUSES,
    JOB_SCHEMA,
    LEAN_INGRESS_THEOREM,
    SUPPORTED_ARM_CELL_INDEX,
    SUPPORTED_PLACEMENT_INDEX,
    TERMINAL_STATUS,
    Exact12NextRowArmStaticCanaryError,
    MaterializedArmStaticCanary,
    run_arm_static_canary,
)
from .exact12_next_row_cell_run import _json_sha256, cnf_assignment_satisfies
from .sat_encoding import CadicalResult, solve_cadical

DESCRIPTOR_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_piqd_descriptor.v2"
PIQD_PROJECT = "p97-exact12-next-row-arm-static-cell6-v12-r1"
MAX_CNF_BYTES = 256 * 1024 * 1024
MAX_DESCRIPTOR_BYTES = 1024 * 1024

_FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_HEX = frozenset("0123456789abcdef")


class Exact12NextRowArmStaticPiqdError(Exact12NextRowArmStaticCanaryError):
    """An arm-static PIQD identity, receipt, or custody binding failed."""


def _digest(value: object, name: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise Exact12NextRowArmStaticPiqdError(
            f"{name} must be a lowercase SHA-256 digest"
        )
    return value


def _verify_sources(repo_root: Path, value: object) -> list[dict[str, Any]]:
    try:
        return _custody._verify_sources(repo_root, value)
    except _custody.Exact12NextRowStaticPiqdError as exc:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static source manifest failed live custody verification"
        ) from exc


def _capture_regular(path: Path, *, maximum_bytes: int) -> bytes:
    try:
        return _custody._capture_regular(path, maximum_bytes=maximum_bytes)
    except _custody.Exact12NextRowStaticPiqdError as exc:
        raise Exact12NextRowArmStaticPiqdError(
            f"arm-static custody capture failed: {path.name}"
        ) from exc


def _reject_symlinked_output_root(path: Path) -> None:
    try:
        _custody._reject_symlinked_output_root(path)
    except _custody.Exact12NextRowStaticPiqdError as exc:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static output custody root is unsafe"
        ) from exc


def _install_descriptor(root: Path, payload: bytes, digest: str) -> Path:
    try:
        return _custody._install_descriptor(root, payload, digest)
    except _custody.Exact12NextRowStaticPiqdError as exc:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static descriptor publication failed"
        ) from exc


def _strict_json(raw: bytes, *, name: str) -> dict[str, Any]:
    try:
        return _custody._strict_json(raw, name=name)
    except _custody.Exact12NextRowStaticPiqdError as exc:
        raise Exact12NextRowArmStaticPiqdError(f"{name} is malformed") from exc


def build_discovery_descriptor(
    materialized: MaterializedArmStaticCanary,
    job: Mapping[str, Any],
    *,
    repo_root: Path,
) -> dict[str, Any]:
    """Validate and freeze the exact arm-static discovery identity."""

    if type(materialized) is not MaterializedArmStaticCanary:
        raise Exact12NextRowArmStaticPiqdError(
            "PIQD requires an exact MaterializedArmStaticCanary"
        )
    if type(job) is not dict or job.get("schema") != JOB_SCHEMA:
        raise Exact12NextRowArmStaticPiqdError("arm-static job schema is crossed")
    job_id = _digest(job.get("job_id"), "arm-static job_id")
    unsigned_job = dict(job)
    del unsigned_job["job_id"]
    if _json_sha256(unsigned_job) != job_id:
        raise Exact12NextRowArmStaticPiqdError("arm-static job_id is not canonical")
    if job.get("arm_cell_index") != SUPPORTED_ARM_CELL_INDEX:
        raise Exact12NextRowArmStaticPiqdError("arm-static job cell is crossed")
    expected_promotion = {
        "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
        "lean_terminal_ingress_ready": True,
        "status_on_verified_unsat": TERMINAL_STATUS,
    }
    if (
        job.get("lean_ingress_theorem") != LEAN_INGRESS_THEOREM
        or job.get("lean_terminal_ingress_ready") is not True
        or job.get("terminal_promotion_status") != TERMINAL_STATUS
        or job.get("promotion") != expected_promotion
    ):
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static Lean terminal ingress binding is crossed"
        )

    try:
        cnf_bytes = materialized.instance.dimacs().encode("ascii")
        dimensions = scan_dimacs(cnf_bytes)
    except Exception as exc:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static materialized CNF is malformed"
        ) from exc
    cnf_sha256 = sha256_bytes(cnf_bytes)
    if dimensions != (EXPECTED_PREFIX_VARIABLES, EXPECTED_FINAL_CLAUSES):
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static CNF dimensions differ from the frozen canary"
        )
    if cnf_sha256 != EXPECTED_FINAL_DIMACS_SHA256:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static CNF hash differs from the frozen canary"
        )
    cnf_identity = {
        "bytes": len(cnf_bytes),
        "sha256": cnf_sha256,
        "variables": dimensions[0],
        "clauses": dimensions[1],
    }
    if job.get("cnf") != cnf_identity:
        raise Exact12NextRowArmStaticPiqdError("arm-static job CNF identity is crossed")

    try:
        compiler_manifest = materialized.arm_compiled.manifest()
    except Exception as exc:
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static compiler manifest is unavailable"
        ) from exc
    if (
        type(compiler_manifest) is not dict
        or job.get("compiler_manifest") != compiler_manifest
    ):
        raise Exact12NextRowArmStaticPiqdError(
            "arm-static compiler/map identity is crossed"
        )

    suffix = materialized.arm_suffix
    if type(suffix) is not dict:
        raise Exact12NextRowArmStaticPiqdError("arm suffix record is malformed")
    suffix_record_sha256 = _digest(
        suffix.get("suffix_record_sha256"), "arm suffix record sha256"
    )
    unsigned_suffix = dict(suffix)
    del unsigned_suffix["suffix_record_sha256"]
    if _json_sha256(unsigned_suffix) != suffix_record_sha256:
        raise Exact12NextRowArmStaticPiqdError("arm suffix record hash is noncanonical")
    expected_suffix = {
        "schema": ARM_SUFFIX_SCHEMA,
        "sha256": suffix_record_sha256,
        "n_clauses": EXPECTED_ARM_SUFFIX_CLAUSES,
        "post_arm_dimacs_sha256": EXPECTED_POST_ARM_DIMACS_SHA256,
    }
    if job.get("arm_suffix") != expected_suffix:
        raise Exact12NextRowArmStaticPiqdError("arm suffix identity is crossed")

    bank = materialized.source_order_bank
    installation = materialized.source_order_installation
    if type(bank) is not dict or type(installation) is not dict:
        raise Exact12NextRowArmStaticPiqdError(
            "source-order bank or installation is malformed"
        )
    bank_sha256 = _digest(bank.get("bank_sha256"), "source-order bank sha256")
    expected_source_order = {
        "schema": bank.get("schema"),
        "sha256": bank_sha256,
        "n_clauses": EXPECTED_SOURCE_ORDER_CLAUSES,
        "installation": installation,
    }
    if job.get("source_order_bank") != expected_source_order:
        raise Exact12NextRowArmStaticPiqdError(
            "source-order bank/installation identity is crossed"
        )
    if (
        installation.get("bank_sha256") != bank_sha256
        or installation.get("suffix_n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES
        or installation.get("final_n_variables") != EXPECTED_PREFIX_VARIABLES
        or installation.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES
        or installation.get("final_cnf_sha256") != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12NextRowArmStaticPiqdError(
            "source-order installation is not bound to the final CNF"
        )

    sources = _verify_sources(repo_root.resolve(), job.get("sources"))
    return {
        "schema": DESCRIPTOR_SCHEMA,
        "root_job_id": job_id,
        "job_schema": JOB_SCHEMA,
        "job_sha256": sha256_json(job),
        "arm_cell_index": SUPPORTED_ARM_CELL_INDEX,
        "placement_index": SUPPORTED_PLACEMENT_INDEX,
        "cnf": cnf_identity,
        "compiler": {
            "manifest": compiler_manifest,
            "manifest_sha256": sha256_json(compiler_manifest),
        },
        "arm_suffix": expected_suffix,
        "source_order_bank": expected_source_order,
        "lean_terminal_ingress": expected_promotion,
        "sources": sources,
        "sources_sha256": sha256_json(sources),
        "route": "PIQD_DISCOVERY_ONLY_LOCAL_IDENTICAL_CNF_TERMINAL_PROOF",
        "query_polarity": "SAT_MEANS_SURVIVING_ARM_STATIC_CUBE",
        "certificate_blocker": CERTIFICATE_BLOCKER,
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
        "finite_schema": JOB_SCHEMA,
        "cardinality_scope": "exactly 12 points; placement 1; named arm cell 6 only",
        "source_theorem": "NONE: finite PIQD discovery evidence only",
        "claims": dict(_FALSE_CLAIMS),
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": f"{PIQD_PROJECT}:{descriptor_sha256}",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": descriptor["compiler"]["manifest_sha256"],
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": {**_FALSE_CLAIMS, "one_process": False, "one_core": False},
    }
    return source_bytes, canonical_json_bytes(producer)


def _validate_static_result(value: object, *, num_variables: int) -> StaticSolverResult:
    if type(value) is not StaticSolverResult:
        raise Exact12NextRowArmStaticPiqdError(
            "PIQD returned a non-exact StaticSolverResult"
        )
    if value.verdict not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise Exact12NextRowArmStaticPiqdError("PIQD verdict is malformed")
    if type(value.assignment) is not dict or type(value.returncode) is not int:
        raise Exact12NextRowArmStaticPiqdError("PIQD result shape is malformed")
    if type(value.stdout) is not str or type(value.stderr) is not str:
        raise Exact12NextRowArmStaticPiqdError("PIQD diagnostics are malformed")
    if any(type(key) is not int for key in value.assignment) or any(
        type(selected) is not bool for selected in value.assignment.values()
    ):
        raise Exact12NextRowArmStaticPiqdError(
            "PIQD assignment uses non-builtin values"
        )
    if value.verdict == "SAT":
        if value.returncode != 10 or set(value.assignment) != set(
            range(1, num_variables + 1)
        ):
            raise Exact12NextRowArmStaticPiqdError("PIQD SAT assignment is not total")
    elif value.assignment:
        raise Exact12NextRowArmStaticPiqdError("non-SAT PIQD result carries a model")
    elif value.verdict == "UNSAT" and value.returncode != 20:
        raise Exact12NextRowArmStaticPiqdError("PIQD UNSAT return code is malformed")
    elif value.verdict == "UNKNOWN" and value.returncode != 1:
        raise Exact12NextRowArmStaticPiqdError("PIQD UNKNOWN return code is malformed")
    return value


def _validate_receipt(
    result: StaticSolverResult,
    *,
    cnf_sha256: str,
    num_variables: int,
    num_clauses: int,
    source_sha256: str,
    producer_sha256: str,
) -> None:
    raw = result.stdout.encode("utf-8")
    if not raw.endswith(b"\n"):
        raise Exact12NextRowArmStaticPiqdError("PIQD result omitted its solver receipt")
    receipt = _strict_json(raw, name="PIQD solver receipt")
    if canonical_json_bytes(receipt) + b"\n" != raw:
        raise Exact12NextRowArmStaticPiqdError("PIQD solver receipt is not canonical")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise Exact12NextRowArmStaticPiqdError("PIQD solver receipt schema is crossed")
    unsigned = dict(receipt)
    receipt_sha256 = unsigned.pop("receipt_sha256", None)
    if receipt_sha256 != sha256_json(unsigned):
        raise Exact12NextRowArmStaticPiqdError("PIQD solver receipt hash is invalid")
    expected = {
        "adapter_verdict": result.verdict,
        "adapter_returncode": result.returncode,
        "cnf_sha256": cnf_sha256,
        "num_variables": num_variables,
        "num_clauses": num_clauses,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
    }
    if any(receipt.get(key) != value for key, value in expected.items()):
        raise Exact12NextRowArmStaticPiqdError("PIQD solver receipt is cross-bound")
    identity = receipt.get("job_identity")
    expected_identity = {
        "backend": "cadical",
        "solver_profile": "sat",
        "project": PIQD_PROJECT,
        "cnf_blob_hash": cnf_sha256,
        "num_vars": num_variables,
        "num_clauses": num_clauses,
        "requested_core_limit": 1,
    }
    if type(identity) is not dict or any(
        identity.get(key) != value for key, value in expected_identity.items()
    ):
        raise Exact12NextRowArmStaticPiqdError("PIQD job receipt is cross-bound")


class Exact12ArmStaticPiqdDiscovery:
    """One descriptor-bound, proof-free discovery callback."""

    def __init__(
        self,
        *,
        materialized: MaterializedArmStaticCanary,
        job: Mapping[str, Any],
        repo_root: Path,
        descriptor_path: Path,
        descriptor_bytes: bytes,
        source_manifest: bytes,
        producer_manifest: bytes,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
    ) -> None:
        self.materialized = materialized
        self.job = job
        self.repo_root = repo_root
        self.descriptor_path = descriptor_path
        self.descriptor_bytes = descriptor_bytes
        self.source_manifest = source_manifest
        self.producer_manifest = producer_manifest
        self.runner = runner

    def _assert_descriptor_current(self) -> None:
        current = (
            canonical_json_bytes(
                build_discovery_descriptor(
                    self.materialized, self.job, repo_root=self.repo_root
                )
            )
            + b"\n"
        )
        if current != self.descriptor_bytes:
            raise Exact12NextRowArmStaticPiqdError(
                "arm-static request changed after descriptor publication"
            )

    def __call__(
        self,
        instance: object,
        cnf_path: Path,
        *,
        timeout_seconds: int,
        nice: int,
        proof_path: Path | None,
    ) -> CadicalResult:
        if instance is not self.materialized.instance:
            raise Exact12NextRowArmStaticPiqdError("PIQD discovery instance is crossed")
        if not isinstance(cnf_path, Path):
            raise Exact12NextRowArmStaticPiqdError("PIQD CNF path must be a Path")
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise Exact12NextRowArmStaticPiqdError("PIQD timeout must be positive")
        if type(nice) is not int or not 1 <= nice <= 19:
            raise Exact12NextRowArmStaticPiqdError("PIQD nice value is malformed")
        if proof_path is not None:
            raise Exact12NextRowArmStaticPiqdError(
                "PIQD discovery must receive proof_path=None"
            )
        _reject_symlinked_output_root(cnf_path.parent)
        self._assert_descriptor_current()
        if (
            _capture_regular(self.descriptor_path, maximum_bytes=MAX_DESCRIPTOR_BYTES)
            != self.descriptor_bytes
        ):
            raise Exact12NextRowArmStaticPiqdError(
                "arm-static descriptor custody changed"
            )
        expected_cnf = self.materialized.instance.dimacs().encode("ascii")
        if _capture_regular(cnf_path, maximum_bytes=MAX_CNF_BYTES) != expected_cnf:
            raise Exact12NextRowArmStaticPiqdError(
                "arm-static discovery CNF custody changed"
            )
        try:
            raw_result = self.runner(cnf_path, timeout_seconds, None)
        except Exact12NextRowArmStaticPiqdError:
            raise
        except Exception as exc:
            raise Exact12NextRowArmStaticPiqdError(
                "PIQD discovery failed closed"
            ) from exc
        result = _validate_static_result(
            raw_result, num_variables=EXPECTED_PREFIX_VARIABLES
        )
        _validate_receipt(
            result,
            cnf_sha256=EXPECTED_FINAL_DIMACS_SHA256,
            num_variables=EXPECTED_PREFIX_VARIABLES,
            num_clauses=EXPECTED_FINAL_CLAUSES,
            source_sha256=sha256_bytes(self.source_manifest),
            producer_sha256=sha256_bytes(self.producer_manifest),
        )
        self._assert_descriptor_current()
        if _capture_regular(cnf_path, maximum_bytes=MAX_CNF_BYTES) != expected_cnf:
            raise Exact12NextRowArmStaticPiqdError(
                "arm-static discovery CNF changed during solve"
            )
        if (
            _capture_regular(self.descriptor_path, maximum_bytes=MAX_DESCRIPTOR_BYTES)
            != self.descriptor_bytes
        ):
            raise Exact12NextRowArmStaticPiqdError(
                "arm-static descriptor changed during solve"
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
            self.materialized.instance.clauses_with(),
            positive,
            n_variables=EXPECTED_PREFIX_VARIABLES,
        ):
            raise Exact12NextRowArmStaticPiqdError(
                "PIQD SAT model failed independent exact-CNF replay"
            )
        try:
            cube = self.materialized.instance.decode_model(positive)
        except Exception as exc:
            raise Exact12NextRowArmStaticPiqdError(
                "PIQD SAT model failed independent cube decoding"
            ) from exc
        return CadicalResult("SAT", cube, 10, False, diagnostic, positive)


class Exact12ArmStaticPiqdDiscoveryFactory:
    """Build the single arm-static discovery callback and its PIQD runner."""

    def __init__(
        self,
        *,
        repo_root: Path,
        base_url: str,
        journal_root: Path,
        transport: Transport | None = None,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        if type(base_url) is not str or not base_url.strip():
            raise Exact12NextRowArmStaticPiqdError("a nonempty PIQD URL is required")
        self.repo_root = repo_root.resolve()
        self.base_url = base_url
        self.journal_root = journal_root
        self.transport = transport
        self.sleep = sleep

    def __call__(
        self,
        materialized: MaterializedArmStaticCanary,
        job: Mapping[str, Any],
    ) -> Exact12ArmStaticPiqdDiscovery:
        descriptor = build_discovery_descriptor(
            materialized, job, repo_root=self.repo_root
        )
        descriptor_bytes = canonical_json_bytes(descriptor) + b"\n"
        descriptor_sha256 = sha256_bytes(descriptor_bytes)
        descriptor_path = _install_descriptor(
            self.journal_root, descriptor_bytes, descriptor_sha256
        )
        source_manifest, producer_manifest = _manifests(descriptor, descriptor_sha256)
        try:
            runner = make_static_piqd_solver_runner(
                base_url=self.base_url,
                journal_root=self.journal_root / "attempts",
                source_manifest=source_manifest,
                producer_manifest=producer_manifest,
                transport=self.transport,
                policy=DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1),
                max_cnf_bytes=MAX_CNF_BYTES,
                sleep=self.sleep,
            )
        except StaticPiqdRunnerError as exc:
            raise Exact12NextRowArmStaticPiqdError(
                "PIQD static runner construction failed"
            ) from exc
        return Exact12ArmStaticPiqdDiscovery(
            materialized=materialized,
            job=job,
            repo_root=self.repo_root,
            descriptor_path=descriptor_path,
            descriptor_bytes=descriptor_bytes,
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
            runner=runner,
        )


def run_exact12_arm_static_piqd(
    repo_root: Path,
    workdir: Path,
    arm_cell_index: int = SUPPORTED_ARM_CELL_INDEX,
    *,
    piqd_base_url: str,
    piqd_journal_root: Path,
    timeout_seconds: int = 3_600,
    nice: int = 10,
    local_solver: Callable[..., CadicalResult] = solve_cadical,
    certifier: Callable[..., bool] | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
) -> dict[str, Any]:
    """Use PIQD only for discovery, retaining the legacy terminal rerun."""

    factory = Exact12ArmStaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url=piqd_base_url,
        journal_root=piqd_journal_root,
        transport=transport,
        sleep=sleep,
    )
    return run_arm_static_canary(
        repo_root,
        workdir,
        arm_cell_index,
        timeout_seconds=timeout_seconds,
        nice=nice,
        solver=local_solver,
        certifier=certifier,
        discovery_solver_factory=factory,
    )
