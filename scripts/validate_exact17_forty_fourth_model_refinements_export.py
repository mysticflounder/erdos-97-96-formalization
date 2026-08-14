"""Fail-closed validator for the exact-17 Child44 Lean root.

The suffix is read from a fresh invocation of the Lean exporter.  Python never
authors successor clauses.  The weighted eight-clause probe is deliberately a
no-go: every one of its clauses is subsumed by an already published Child44
clause, so it cannot be accepted as a successor bank.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import subprocess
import tempfile
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
VARIABLES = 308
PARENT_CLAUSES = 5_848_592
PARENT_BYTES = 291_694_814
PARENT_MANIFEST_BYTES = 4_118
NEW_CLAUSES = 228
CHILD_CLAUSES = 5_848_820
PARENT_SHA256 = "dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76"
CHILD_SHA256 = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
CHILD_BYTES = 291_704_790
MODEL_SHA256 = "5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce"
FINAL_SHA256 = "8585ed1a1d997ff16c305514d6640b12ada876ef9cc4d2d737bd596ecb97505b"
MODEL_MANIFEST_SHA256 = "6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171"
MODEL_JOB_ID = "9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb"
ANALYSIS_SHA256 = "c3ed03bc91979563804328675784be47dab81271daf7eeb7c6d5f07e59cd156e"
LEAN_ROOT_SHA256 = "b3c3615c3e908199b5ee03e4032e00122823e322e8cba5c74319d6d1e84fddba"
LEAN_EXPORT_SHA256 = "04780efb8452188d5260bd1b95fe5a24a395166690e9c306f6326aac751e6002"
ORDERED_SUFFIX_SHA256 = "fc52c7ac5e887577ab743f655018fa1fcaa499239c1078fb0f1786836db9844d"
EXPECTED_MODEL_CUT = tuple(range(3, 228, 4))
EXPECTED_MODEL_CUT_ZERO_BASED = tuple(index - 1 for index in EXPECTED_MODEL_CUT)
EXPECTED_PARENT_SUBSUMED_COUNT = 110
PARENT_PROJECT = "erdos-97-96-exact17-child43"
PARENT_DAEMON_SHA256 = "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
PARENT_SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
PARENT_SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
PARENT_SOLVER_SIGNATURE = "cadical-3.0.0"
PARENT_SOLVER_LOG_SHA256 = "8d35d2cf06402a942ed0072a9e2e73f3650ce5838415a1622e23c1b7686e6ec2"

ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = ATail / "BlockerVExactSeventeenFortyThirdModelRefinements.lean"
LEAN_EXPORT_PATH = ATail / "BlockerVExactSeventeenFortyThirdModelRefinementsExport.lean"
ANALYSIS_PATH = ROOT / "scratch/exact17-lean-to-sat/child43-wave-mine/child43-analysis.json"
PARENT_PATH = ROOT / "scratch/exact17-lean-to-sat/exact17-forty-third-root-forty-second-model-refinements.cnf"
CHILD_PATH = ROOT / "scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf"
MODEL_PATH = ROOT / "scratch/exact17-lean-to-sat/piqd-child43-core1-custody-model.json"
FINAL_PATH = ROOT / "scratch/exact17-lean-to-sat/piqd-child43-core1-custody-final.json"
RECEIPT_PATH = ROOT / "scratch/exact17-lean-to-sat/child44-export-receipt.json"
Clause = tuple[int, ...]


class UnprovisionedError(ValueError):
    """An immutable production pin is not complete."""


@dataclass(frozen=True)
class ExportSpec:
    publication_state: str = "PROVISIONED"
    child_sha256: str | None = CHILD_SHA256
    child_bytes: int | None = CHILD_BYTES
    parent_sha256: str = PARENT_SHA256
    model_sha256: str = MODEL_SHA256
    model_manifest_sha256: str = MODEL_MANIFEST_SHA256
    model_job_id: str = MODEL_JOB_ID
    final_sha256: str | None = FINAL_SHA256
    lean_root_sha256: str | None = LEAN_ROOT_SHA256
    lean_export_sha256: str | None = LEAN_EXPORT_SHA256
    analysis_sha256: str | None = ANALYSIS_SHA256

    @property
    def child_clauses(self) -> int:
        return CHILD_CLAUSES

    @property
    def provisioned(self) -> bool:
        return self.publication_state == "PROVISIONED" and all(
            value is not None
            for value in (
                self.child_sha256,
                self.child_bytes,
                self.lean_root_sha256,
                self.lean_export_sha256,
                self.analysis_sha256,
                self.final_sha256,
            )
        )


PRODUCTION_SPEC = ExportSpec()


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    """Reject ambiguous JSON objects with repeated keys at every depth."""
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json_loads(raw: bytes | str) -> Any:
    return json.loads(raw, object_pairs_hook=strict_object)


def _open_componentwise(path: Path, *, directory: bool) -> int:
    """Open an absolute path without following any symlinked component."""
    absolute = Path(os.path.abspath(path))
    parts = absolute.parts
    if not parts or parts[0] != os.path.sep:
        raise ValueError(f"path is not absolute after normalization: {path}")
    directory_flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(os.path.sep, directory_flags)
    try:
        for index, component in enumerate(parts[1:]):
            final = index == len(parts[1:]) - 1
            flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
            if not final or directory:
                flags |= getattr(os, "O_DIRECTORY", 0)
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        opened = os.fstat(descriptor)
        expected_kind = stat.S_ISDIR if directory else stat.S_ISREG
        if not expected_kind(opened.st_mode):
            raise ValueError(f"path has wrong file type: {path}")
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def open_directory_nofollow(path: Path) -> int:
    try:
        return _open_componentwise(path, directory=True)
    except FileNotFoundError as error:
        raise UnprovisionedError(f"directory is absent: {path}") from error
    except OSError as error:
        raise ValueError(f"directory contains a symlink or is not a directory: {path}") from error


def _open_regular_nofollow(path: Path, label: str) -> int:
    try:
        return _open_componentwise(path, directory=False)
    except FileNotFoundError as error:
        raise UnprovisionedError(f"{label} is absent: {path}") from error
    except OSError as error:
        raise ValueError(f"{label} is not a regular non-symlink file: {path}") from error


def read_regular_nofollow(path: Path, label: str) -> bytes:
    descriptor = _open_regular_nofollow(path, label)
    try:
        chunks: list[bytes] = []
        while block := os.read(descriptor, 1 << 20):
            chunks.append(block)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def sha256_file(path: Path) -> str:
    descriptor = _open_regular_nofollow(path, str(path))
    digest = hashlib.sha256()
    try:
        while block := os.read(descriptor, 1 << 20):
            digest.update(block)
        return digest.hexdigest()
    finally:
        os.close(descriptor)


def require_regular_nonsymlink(path: Path, label: str) -> None:
    """Reject both a symlinked file and a symlink in any parent component."""
    read_regular_nofollow(path, label)


def _stable_json(path: Path, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    raw = read_regular_nofollow(path, "Child43 analysis")
    if spec.analysis_sha256 is None or hashlib.sha256(raw).hexdigest() != spec.analysis_sha256:
        raise ValueError("Child43 analysis provenance drifted")
    payload = strict_json_loads(raw)
    if payload.get("status") != "PASS" or payload.get("schema") != "p97-exact17-child43-independent-wave-analysis/v1":
        raise ValueError("Child43 analysis is not authenticated")
    replay = payload.get("independent_replay")
    if replay != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True, "sha256": PARENT_SHA256, "variables": VARIABLES}:
        raise ValueError("Child43 analysis replay provenance drifted")
    provenance = payload.get("provenance")
    expected_provenance = {
        "cnf_sha256": spec.parent_sha256,
        "custody_final_sha256": spec.final_sha256,
        "final_file_sha256": spec.final_sha256,
        "model_file_sha256": spec.model_sha256,
        "model_sha256": spec.model_sha256,
        "manifest_sha256": spec.model_manifest_sha256,
        "job_id": spec.model_job_id,
    }
    if not isinstance(provenance, dict) or any(provenance.get(key) != value for key, value in expected_provenance.items()):
        raise ValueError("Child43 analysis custody provenance drifted")
    return payload


def _require_exact_keys(payload: object, expected: set[str], label: str) -> dict[str, Any]:
    if not isinstance(payload, dict) or set(payload) != expected:
        raise ValueError(f"{label} schema drifted")
    return payload


def validate_sources(spec: ExportSpec = PRODUCTION_SPEC) -> None:
    if not spec.provisioned:
        raise UnprovisionedError("Child44 source pins are incomplete")
    expected = {
        LEAN_ROOT_PATH: spec.lean_root_sha256,
        LEAN_EXPORT_PATH: spec.lean_export_sha256,
        ANALYSIS_PATH: spec.analysis_sha256,
    }
    for path, digest in expected.items():
        if digest is None or not path.is_file() or sha256_file(path) != digest:
            raise ValueError(f"authenticated source drifted: {path}")
    _stable_json(ANALYSIS_PATH, spec)


def _header(line: bytes) -> tuple[int, int]:
    fields = line.decode("ascii").split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError("malformed DIMACS header")
    values = int(fields[2]), int(fields[3])
    if line != f"p cnf {values[0]} {values[1]}\n".encode("ascii"):
        raise ValueError("noncanonical DIMACS header")
    return values


def _clause(line: bytes) -> Clause:
    values = tuple(map(int, line.decode("ascii").split()))
    if len(values) < 2 or values[-1] != 0 or any(x == 0 or abs(x) > VARIABLES for x in values[:-1]):
        raise ValueError("malformed DIMACS clause")
    clause = values[:-1]
    if line != (" ".join(map(str, clause)) + " 0\n").encode("ascii"):
        raise ValueError("noncanonical DIMACS clause")
    return clause


def _read_cnf(path: Path) -> tuple[tuple[Clause, ...], str, int]:
    descriptor = _open_regular_nofollow(path, f"DIMACS input {path}")
    size = os.fstat(descriptor).st_size
    digest = hashlib.sha256()
    clauses: list[Clause] = []
    with os.fdopen(descriptor, "rb") as handle:
        header = handle.readline()
        digest.update(header)
        if _header(header)[0] != VARIABLES:
            raise ValueError("unexpected DIMACS variable count")
        for line in handle:
            digest.update(line)
            clauses.append(_clause(line))
    return tuple(clauses), digest.hexdigest(), size


def _parent_subsumptions(parent: tuple[Clause, ...], suffix: tuple[Clause, ...]) -> dict[int, tuple[int, ...]]:
    """Find parent clauses whose literal sets are subsets of suffix clauses.

    The reverse index avoids a quadratic clause comparison: each suffix has at
    most nine literals, so its subsets form a small exact lookup table.
    """
    reverse: dict[tuple[int, ...], list[int]] = {}
    for index, clause in enumerate(suffix):
        literals = tuple(sorted(set(clause)))
        for size in range(1, len(literals) + 1):
            for subset in combinations(literals, size):
                reverse.setdefault(subset, []).append(index)
    matches: dict[int, list[int]] = {}
    for parent_index, clause in enumerate(parent):
        key = tuple(sorted(set(clause)))
        for suffix_index in reverse.get(key, ()):
            matches.setdefault(suffix_index, []).append(parent_index)
    return {index: tuple(values) for index, values in matches.items()}


def _live_export() -> tuple[tuple[Clause, ...], str]:
    # Keep the live render beneath the repository-owned scratch directory.
    # macOS exposes its default temporary directory through the `/var` symlink,
    # which the componentwise O_NOFOLLOW reader intentionally rejects.
    with tempfile.NamedTemporaryFile(
        prefix="exact17-child44-live-",
        suffix=".cnf",
        dir=ROOT / "scratch" / "exact17-lean-to-sat",
    ) as handle:
        output = Path(handle.name)
    relative = LEAN_EXPORT_PATH.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(output)], cwd=ROOT / "lean", check=True)
    clauses, digest, _ = _read_cnf(output)
    output.unlink(missing_ok=True)
    return clauses, digest


def authenticated_model(path: Path = MODEL_PATH, spec: ExportSpec = PRODUCTION_SPEC, analysis: dict[str, Any] | None = None) -> dict[int, bool]:
    raw = read_regular_nofollow(path, "Child43 custody model")
    if spec.model_sha256 is None or hashlib.sha256(raw).hexdigest() != spec.model_sha256:
        raise ValueError("Child43 custody model hash drifted")
    payload = _require_exact_keys(
        strict_json_loads(raw),
        {"schema", "job_id", "cnf_sha256", "manifest_sha256", "completion_identity_hash", "replay", "model"},
        "Child43 custody model",
    )
    if payload.get("schema") != "p97-exact17-child43-piqd-model/v3":
        raise ValueError("Child43 custody model schema drifted")
    if payload.get("job_id") != spec.model_job_id or payload.get("cnf_sha256") != spec.parent_sha256 or payload.get("manifest_sha256") != spec.model_manifest_sha256:
        raise ValueError("Child43 custody model identity drifted")
    if analysis is None:
        analysis = _stable_json(ANALYSIS_PATH, spec)
    if payload.get("completion_identity_hash") != analysis["provenance"].get("identity_hash"):
        raise ValueError("Child43 custody model completion identity drifted")
    replay = payload.get("replay")
    if replay != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("Child43 custody model replay drifted")
    model = _require_exact_keys(
        payload.get("model"),
        {"assignment", "backend", "job_id", "num_assigned", "result", "solver_profile"},
        "Child43 custody nested model",
    )
    expected_model_metadata = {
        "backend": "cadical",
        "job_id": spec.model_job_id,
        "num_assigned": VARIABLES,
        "result": "SAT",
        "solver_profile": "sat",
    }
    if any(model.get(key) != value for key, value in expected_model_metadata.items()):
        raise ValueError("Child43 custody nested model identity drifted")
    assignment = model.get("assignment")
    if type(assignment) is not list or len(assignment) != VARIABLES or any(type(x) is not int or x == 0 or abs(x) > VARIABLES for x in assignment) or {abs(x) for x in assignment} != set(range(1, VARIABLES + 1)):
        raise ValueError("custody model is not a total assignment")
    return {abs(x): x > 0 for x in assignment}


def authenticated_final(path: Path = FINAL_PATH, spec: ExportSpec = PRODUCTION_SPEC, analysis: dict[str, Any] | None = None) -> dict[str, Any]:
    raw = read_regular_nofollow(path, "Child43 custody final")
    if spec.final_sha256 is None or hashlib.sha256(raw).hexdigest() != spec.final_sha256:
        raise ValueError("Child43 custody final hash drifted")
    if analysis is None:
        analysis = _stable_json(ANALYSIS_PATH, spec)
    provenance = analysis["provenance"]
    final = _require_exact_keys(
        strict_json_loads(raw),
        {
            "binding",
            "completion_status",
            "daemon",
            "deciding_daemon_sha256",
            "job_id",
            "model_check",
            "model_replay",
            "model_sha256",
            "next_gate",
            "result",
            "schema",
            "solver",
            "solver_log",
            "stored_final",
        },
        "Child43 custody final",
    )
    if final.get("schema") != "p97-exact17-child43-piqd-final/v2" or final.get("job_id") != spec.model_job_id or final.get("result") != "SAT":
        raise ValueError("Child43 custody final identity drifted")
    if final.get("model_sha256") != spec.model_sha256 or final.get("next_gate") != "mandatory_general_theorem_search":
        raise ValueError("Child43 custody final model/gate binding drifted")
    binding = final.get("binding", {})
    expected_binding = {
        "backend": "cadical",
        "cnf_sha256": spec.parent_sha256,
        "identity_hash": provenance.get("identity_hash"),
        "manifest_sha256": spec.model_manifest_sha256,
        "march_timeout_s": 900,
        "project": PARENT_PROJECT,
        "requested_core_limit": 1,
        "solver_profile": "sat",
        "timeout_s": 3600,
    }
    if binding != expected_binding:
        raise ValueError("Child43 final binding drifted")
    completion = _require_exact_keys(
        final.get("completion_status", {}),
        {
            "attestation_basis",
            "attested_solver_processes",
            "backend",
            "cnf_blob_hash",
            "completed_at",
            "confirmed_at",
            "created_at",
            "daemon_sha256",
            "id",
            "identity_hash",
            "kept_cnf_blob_hash",
            "kept_cnf_size_bytes",
            "log_sha256",
            "log_size_bytes",
            "march_timeout_s",
            "model_blob_hash",
            "producer_manifest_blob_hash",
            "producer_manifest_hash",
            "progress",
            "project",
            "proof_blob_hash",
            "proof_format",
            "proof_size_bytes",
            "recovery_action",
            "requested_core_limit",
            "result",
            "run_epoch",
            "running_for_s",
            "solver_profile",
            "started_at",
            "status",
            "timeout_s",
            "wall_human",
            "wall_ms",
        },
        "Child43 final completion status",
    )
    expected_completion = {
        "id": spec.model_job_id,
        "status": "completed",
        "result": "SAT",
        "cnf_blob_hash": spec.parent_sha256,
        "producer_manifest_hash": spec.model_manifest_sha256,
        "producer_manifest_blob_hash": spec.model_manifest_sha256,
        "identity_hash": provenance.get("identity_hash"),
        "project": PARENT_PROJECT,
        "backend": "cadical",
        "solver_profile": "sat",
        "requested_core_limit": 1,
        "timeout_s": 3600,
        "march_timeout_s": 900,
        "daemon_sha256": PARENT_DAEMON_SHA256,
    }
    if any(completion.get(key) != value for key, value in expected_completion.items()):
        raise ValueError("Child43 final completion binding drifted")
    model_check = _require_exact_keys(
        final.get("model_check", {}),
        {
            "announced_at",
            "announcement",
            "ce_scope",
            "checked_at",
            "clause",
            "clause_index",
            "cnf_blob_hash",
            "detail",
            "job_completed_at",
            "job_id",
            "model_sha256",
            "num_assigned",
            "num_clauses",
            "num_vars",
            "outcome",
            "project",
        },
        "Child43 final model check",
    )
    if any((model_check.get("job_id") != spec.model_job_id, model_check.get("project") != PARENT_PROJECT, model_check.get("outcome") != "SATISFIED", model_check.get("cnf_blob_hash") != spec.parent_sha256, model_check.get("model_sha256") != provenance.get("canonical_assignment_sha256"), model_check.get("num_assigned") != VARIABLES, model_check.get("num_vars") != VARIABLES, model_check.get("num_clauses") != PARENT_CLAUSES)):
        raise ValueError("Child43 final model check drifted")
    if final.get("model_replay") != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("Child43 final replay drifted")
    stored = _require_exact_keys(final.get("stored_final", {}), {"cnf", "producer_manifest"}, "Child43 stored final")
    stored_cnf = _require_exact_keys(stored.get("cnf", {}), {"bytes", "sha256"}, "Child43 stored final CNF")
    stored_manifest = _require_exact_keys(
        stored.get("producer_manifest", {}),
        {"bytes", "sha256"},
        "Child43 stored final manifest",
    )
    if (
        stored_cnf != {"bytes": PARENT_BYTES, "sha256": spec.parent_sha256}
        or stored_manifest != {"bytes": PARENT_MANIFEST_BYTES, "sha256": spec.model_manifest_sha256}
    ):
        raise ValueError("Child43 stored final binding drifted")
    expected_daemon = {
        "daemon": {
            "name": "piqd",
            "protocol_version": 1,
            "sha256": PARENT_DAEMON_SHA256,
            "version": "0.1.0",
        },
        "limits": {"max_var": 1_000_000},
    }
    if final.get("daemon") != expected_daemon or final.get("deciding_daemon_sha256") != PARENT_DAEMON_SHA256:
        raise ValueError("Child43 final daemon identity drifted")
    solver = final.get("solver", {})
    expected_solver = {
        "lane": "sat",
        "name": PARENT_SOLVER_NAME,
        "path": "/Users/adam/.piqd/solvers/piqd-satworker-cadical-3.0.0",
        "protocol_version": 1,
        "sha256": PARENT_SOLVER_SHA256,
        "solver": "cadical",
        "solver_signature": PARENT_SOLVER_SIGNATURE,
        "solver_source": "/Users/adam/projects/rustprojects/piqd-satworker/vendor/cadical",
        "solver_version": "3.0.0",
        "usable": True,
        "worker": "piqd-satworker",
        "worker_version": "0.1.0",
    }
    if solver != expected_solver:
        raise ValueError("Child43 final solver identity drifted")
    if final.get("solver_log") != {"bytes": 7933, "sha256": PARENT_SOLVER_LOG_SHA256, "terminal_attestation": PARENT_SOLVER_LOG_SHA256}:
        raise ValueError("Child43 final solver log binding drifted")
    return {"path": str(path.resolve()), "sha256": spec.final_sha256, "job_id": spec.model_job_id, "result": "SAT", "cnf_sha256": spec.parent_sha256, "manifest_sha256": spec.model_manifest_sha256, "completion_status": "completed", "model_check": "SATISFIED"}


def _satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(x)] == (x > 0) for x in clause)


WEIGHTED_PROBE: tuple[Clause, ...] = (
    (-307, -143, -142, -96, -92, -108, -113),
    (-307, -31, -29, -192, -201, -233, -226),
    (-308, -143, -142, -96, -92, -108, -113),
    (-308, -31, -29, -192, -201, -233, -226),
    (-307, -56, -66, -49, -44, -156, -158, -78, -71),
    (-307, -164, -154, -35, -38, -54, -62, -174, -173),
    (-308, -56, -66, -49, -47, -207, -209, -81, -71),
    (-308, -215, -205, -35, -38, -54, -62, -174, -173),
)
WEIGHTED_DOMINATING_INDICES = (24, 25, 26, 27, 140, 141, 142, 143)


def reject_weighted_successor(parent_suffix: tuple[Clause, ...]) -> None:
    if len(parent_suffix) != NEW_CLAUSES:
        raise ValueError("Child44 suffix length drifted")
    for weighted, index in zip(WEIGHTED_PROBE, WEIGHTED_DOMINATING_INDICES):
        if not set(parent_suffix[index]).issubset(weighted):
            raise ValueError(f"weighted probe dominance drifted at Child44 suffix index {index}")
    raise UnprovisionedError("weighted eight-clause probe is redundant in Child44 and is not a successor root")


def _validate_weighted_rejection(suffix: tuple[Clause, ...]) -> None:
    for weighted, index in zip(WEIGHTED_PROBE, WEIGHTED_DOMINATING_INDICES):
        if not set(suffix[index]).issubset(weighted):
            raise ValueError(f"weighted rejection map drifted at index {index}")


def validate_export(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    *,
    final_path: Path = FINAL_PATH,
    spec: ExportSpec = PRODUCTION_SPEC,
    live_export_path: Path | None = None,
) -> dict[str, Any]:
    validate_sources(spec)
    if not spec.provisioned:
        raise UnprovisionedError("Child44 export is UNPROVISIONED")
    analysis = _stable_json(ANALYSIS_PATH, spec)
    for path, label in (
        (parent_path, "Child43 parent CNF"),
        (child_path, "Child44 child CNF"),
        (model_path, "Child43 custody model"),
        (final_path, "Child43 custody final"),
    ):
        require_regular_nonsymlink(path, label)
    if live_export_path is not None:
        require_regular_nonsymlink(live_export_path, "Child44 live Lean export")
    assignment = authenticated_model(model_path, spec, analysis)
    final_record = authenticated_final(final_path, spec, analysis)
    parent, parent_sha, _ = _read_cnf(parent_path)
    if len(parent) != PARENT_CLAUSES or parent_sha != spec.parent_sha256:
        raise ValueError("authenticated Child43 parent drifted")
    if live_export_path:
        live, live_sha, _ = _read_cnf(live_export_path)
    else:
        live, live_sha = _live_export()
    if len(live) != CHILD_CLAUSES or live_sha != CHILD_SHA256:
        raise ValueError("live Lean Child44 export pin drifted")
    if live[:PARENT_CLAUSES] != parent:
        raise ValueError("Lean Child44 export does not preserve Child43 prefix")
    suffix = live[PARENT_CLAUSES:]
    if len(suffix) != NEW_CLAUSES or hashlib.sha256(b"".join((" ".join(map(str, c)) + " 0\n").encode() for c in suffix)).hexdigest() != ORDERED_SUFFIX_SHA256:
        raise ValueError("Lean Child44 suffix ordering drifted")
    if len(set(suffix)) != NEW_CLAUSES:
        raise ValueError("Lean Child44 suffix contains duplicate clauses")
    if tuple(i for i, clause in enumerate(suffix, 1) if not _satisfied(clause, assignment)) != EXPECTED_MODEL_CUT:
        raise ValueError("authenticated Child43 model does not cut expected Child44 suffix")
    _validate_weighted_rejection(suffix)
    parent_subsumptions = _parent_subsumptions(parent, suffix)
    if len(parent_subsumptions) != EXPECTED_PARENT_SUBSUMED_COUNT:
        raise ValueError("Child44 parent-subsumption census drifted")
    if any(index in parent_subsumptions for index in EXPECTED_MODEL_CUT_ZERO_BASED):
        raise ValueError("authenticated model-cut clause is subsumed by the Child43 parent")
    for start in range(0, NEW_CLAUSES, 4):
        if all(index in parent_subsumptions for index in range(start, start + 4)):
            raise ValueError(f"Child44 occurrence family {start // 4} is entirely redundant")
    child, child_sha, child_bytes = _read_cnf(child_path)
    if child != live or child_sha != spec.child_sha256 or child_bytes != spec.child_bytes:
        raise ValueError("published Child44 root differs from live Lean output")
    position_counts = [sum(index % 4 == position for index in parent_subsumptions) for position in range(4)]
    return {"schema": "p97-exact17-child44-export-validation/v1", "status": "PASS", "parent_sha256": spec.parent_sha256, "child_sha256": live_sha, "child_bytes": spec.child_bytes, "variables": VARIABLES, "parent_clauses": PARENT_CLAUSES, "new_clauses": NEW_CLAUSES, "child_clauses": CHILD_CLAUSES, "ordered_suffix_sha256": ORDERED_SUFFIX_SHA256, "motivating_model_cut_suffix_indices": list(EXPECTED_MODEL_CUT), "parent_subsumed_suffix_count": len(parent_subsumptions), "parent_subsumed_position_counts": position_counts, "parent_subsumed_model_cut_count": 0, "final": final_record, "weighted_probe": {"status": "REJECTED_REDUNDANT", "dominating_child44_suffix_indices_zero_based": list(WEIGHTED_DOMINATING_INDICES)}}


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=PARENT_PATH)
    parser.add_argument("--child", type=Path, default=CHILD_PATH)
    parser.add_argument("--model", type=Path, default=MODEL_PATH)
    parser.add_argument("--final", type=Path, default=FINAL_PATH)
    args = parser.parse_args(argv)
    print(json.dumps(validate_export(args.parent, args.child, args.model, final_path=args.final), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
