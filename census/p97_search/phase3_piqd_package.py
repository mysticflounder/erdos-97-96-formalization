"""Package one source-bound exact12 v14 job for the Phase-3 piqd driver.

The emitted package is finite, local evidence.  It authenticates the current
source files, exact DIMACS bytes, compiler metadata, ingress contract, partial
named variable map, and cell/order identity without claiming a universal Lean
producer or consumer theorem.
"""

from __future__ import annotations

import argparse
import base64
import json
import os
import stat
import sys
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    QUERY_POLARITIES,
    WAVE_SCHEMA,
    WaveContractError,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, parse_dimacs

JOB_SCHEMA = "p97_rigid221_exact12_full_v14_bound_job.v1"
JOB_STATUS = "FINITE_CNF_BOUND"
COMPILER_SCHEMA = "p97_rigid221_exact12_full_v14_cell_compiler.v1"
COMPILER_STATUS = "FINITE_SOURCE_PREDICATE_COMPILER"
CLAUSE_DELTA_SCHEMA = "p97_rigid221_exact12_full_v14_clause_delta.v1"
CANDIDATE_SCHEMA = "p97_rigid221_exact12_source_safe_candidate.v1"

PRODUCER_SCHEMA = "p97-phase3-piqd-producer/v1"
VARIABLE_MAP_SCHEMA = "p97-phase3-piqd-variable-map/v1"
ORDER_CELL_SCHEMA = "p97-phase3-piqd-order-cell/v1"
PACKAGE_SCHEMA = "p97-phase3-piqd-package/v1"
INGRESS_CONTRACT_SCHEMA = "p97-phase3-piqd-ingress/v1"
SOURCE_BUNDLE_SCHEMA = "p97-phase3-piqd-source-bundle/v1"

PACKAGE_SCOPE = (
    "one authenticated finite normalized-v14 cell; local solver evidence only; "
    "no aggregate 648-cell coverage, universal lift, or Lean theorem closure"
)
VARIABLE_MAP_COVERAGE = "PARTIAL_NAMED_BLOCKERS_WITH_OPAQUE_REMAINDER"
UPSTREAM_DIGEST_STATUS = "UPSTREAM_DIGEST_ONLY_NOT_ARCHIVED_OR_REPLAYED"
_PIQD_PROFILES = {
    "cadical": frozenset({"default", "plain", "sat", "unsat"}),
    "kissat": frozenset({"default"}),
    "march_cu": frozenset({"default"}),
}
_TEMP_PREFIX = ".phase3-piqd-package-"
_TEMP_SUFFIX = ".tmp"

_HEX = frozenset("0123456789abcdef")
_JOB_KEYS = frozenset(
    {
        "schema",
        "semantic_status",
        "scope",
        "job_id",
        "cell_index",
        "cell",
        "blocked_job_sha256",
        "source_to_cnf_contract",
        "compiler_manifest",
        "compiler_manifest_sha256",
        "clause_delta_artifact",
        "clause_delta_artifact_sha256",
        "cnf",
        "execution_gate",
    }
)
_CELL_KEYS = frozenset(
    {"placement_index", "joint_deletion", "v", "arm", "distinguished_d"}
)
_SOURCE_CONTRACT_KEYS = frozenset(
    {
        "candidate_schema",
        "compiler_schema",
        "compiler_symbol",
        "independent_candidate_replay_symbol",
        "independent_added_constraint_replay_symbol",
        "files",
        "files_sha256",
    }
)
_COMPILER_KEYS = frozenset(
    {
        "schema",
        "semantic_status",
        "scope",
        "cell",
        "physical",
        "row_at_o",
        "edges",
        "blocker_variables",
        "counts",
        "hashes",
    }
)
_INGRESS_KEYS = frozenset(
    {
        "schema",
        "scope",
        "live_leaf",
        "source_theorem",
        "cardinality_scope",
        "source_files",
        "source_files_sha256",
    }
)


class PiqdPackageError(ValueError):
    """An input or output cannot satisfy the fail-closed package contract."""


@dataclass(frozen=True)
class PackageResult:
    """Paths and identities of a successfully emitted package."""

    output_dir: Path
    cnf_sha256: str
    ingress_contract_sha256: str
    source_bundle_sha256: str
    producer_manifest_sha256: str
    variable_map_sha256: str
    order_sha256: str
    wave_manifest_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "schema": PACKAGE_SCHEMA,
            "output_dir": str(self.output_dir),
            "cnf_sha256": self.cnf_sha256,
            "ingress_contract_sha256": self.ingress_contract_sha256,
            "source_bundle_sha256": self.source_bundle_sha256,
            "producer_manifest_sha256": self.producer_manifest_sha256,
            "variable_map_sha256": self.variable_map_sha256,
            "order_sha256": self.order_sha256,
            "wave_manifest_sha256": self.wave_manifest_sha256,
        }


def _strict_json(
    raw: bytes, *, source: str, canonical: bool = False
) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            parse_constant=reject_constant,
            object_pairs_hook=reject_duplicates,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PiqdPackageError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise PiqdPackageError(f"{source} must contain a JSON object")
    if canonical and raw != canonical_json_bytes(value):
        raise PiqdPackageError(f"{source} bytes must be canonical JSON")
    return value


def _mapping(value: Any, path: str) -> Mapping[str, Any]:
    if not isinstance(value, Mapping):
        raise PiqdPackageError(f"{path} must be an object")
    return value


def _sequence(value: Any, path: str) -> Sequence[Any]:
    if isinstance(value, (str, bytes, bytearray)) or not isinstance(value, Sequence):
        raise PiqdPackageError(f"{path} must be an array")
    return value


def _exact_keys(value: Mapping[str, Any], keys: frozenset[str], path: str) -> None:
    missing = sorted(keys - value.keys())
    extra = sorted(value.keys() - keys)
    if missing or extra:
        raise PiqdPackageError(
            f"{path} keys mismatch: missing={missing}, extra={extra}"
        )


def _string(value: Any, path: str) -> str:
    if not isinstance(value, str) or not value.strip():
        raise PiqdPackageError(f"{path} must be a non-empty string")
    return value


def _plain_int(value: Any, path: str, *, minimum: int = 0) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < minimum:
        raise PiqdPackageError(f"{path} must be an integer >= {minimum}")
    return value


def _plain_int_array(value: Any, path: str) -> list[int]:
    return [
        _plain_int(item, f"{path}[{index}]")
        for index, item in enumerate(_sequence(value, path))
    ]


def _digest(value: Any, path: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(char not in _HEX for char in value)
    ):
        raise PiqdPackageError(f"{path} must be a lowercase SHA-256 digest")
    return value


def _relative_source_path(value: Any, *, repo_root: Path, path: str) -> Path:
    relative = _string(value, path)
    pure = PurePosixPath(relative)
    if (
        pure.is_absolute()
        or not pure.parts
        or pure.as_posix() != relative
        or "\\" in relative
        or any(part in {"", ".", ".."} for part in pure.parts)
    ):
        raise PiqdPackageError(f"{path} must be a normalized repo-relative path")
    target = (repo_root / Path(*pure.parts)).resolve()
    try:
        target.relative_to(repo_root)
    except ValueError as exc:
        raise PiqdPackageError(f"{path} resolves outside the repository") from exc
    return target


def _verify_source_files(
    value: Any,
    *,
    repo_root: Path,
    path: str,
    source_payloads: dict[str, bytes] | None = None,
) -> list[dict[str, Any]]:
    records = _sequence(value, path)
    normalized: list[dict[str, Any]] = []
    seen: set[str] = set()
    for index, item in enumerate(records):
        record_path = f"{path}[{index}]"
        record = _mapping(item, record_path)
        _exact_keys(record, frozenset({"path", "bytes", "sha256"}), record_path)
        relative = _string(record["path"], f"{record_path}.path")
        if relative in seen:
            raise PiqdPackageError(f"{path} repeats source path {relative!r}")
        seen.add(relative)
        expected_bytes = _plain_int(record["bytes"], f"{record_path}.bytes")
        expected_hash = _digest(record["sha256"], f"{record_path}.sha256")
        target = _relative_source_path(
            relative, repo_root=repo_root, path=f"{record_path}.path"
        )
        try:
            payload = target.read_bytes()
        except OSError as exc:
            raise PiqdPackageError(
                f"cannot read authenticated source file {relative}"
            ) from exc
        if len(payload) != expected_bytes:
            raise PiqdPackageError(f"source file byte count mismatch: {relative}")
        if sha256_bytes(payload) != expected_hash:
            raise PiqdPackageError(f"source file SHA-256 mismatch: {relative}")
        if source_payloads is not None:
            previous = source_payloads.setdefault(relative, payload)
            if previous != payload:
                raise PiqdPackageError(
                    f"conflicting authenticated source bytes for {relative}"
                )
        normalized.append(dict(record))
    return normalized


def _validate_ingress_contract(
    ingress: Mapping[str, Any],
    *,
    repo_root: Path,
    live_leaf: str,
    source_theorem: str,
    cardinality_scope: str,
    source_payloads: dict[str, bytes],
) -> tuple[str, list[dict[str, Any]]]:
    _exact_keys(ingress, _INGRESS_KEYS, "ingress_contract")
    if ingress["schema"] != INGRESS_CONTRACT_SCHEMA:
        raise PiqdPackageError("ingress contract has the wrong schema")
    if ingress["scope"] != PACKAGE_SCOPE:
        raise PiqdPackageError("ingress contract scope must be explicitly finite/local")
    expected_labels = {
        "live_leaf": live_leaf,
        "source_theorem": source_theorem,
        "cardinality_scope": cardinality_scope,
    }
    for key, expected in expected_labels.items():
        actual = _string(ingress[key], f"ingress_contract.{key}")
        if actual != expected:
            raise PiqdPackageError(f"ingress contract {key} does not match CLI input")
    source_files = _verify_source_files(
        ingress["source_files"],
        repo_root=repo_root,
        path="ingress_contract.source_files",
        source_payloads=source_payloads,
    )
    if not source_files:
        raise PiqdPackageError("ingress_contract.source_files must be nonempty")
    if sha256_json(source_files) != _digest(
        ingress["source_files_sha256"], "ingress_contract.source_files_sha256"
    ):
        raise PiqdPackageError("ingress_contract.source_files_sha256 mismatch")
    return INGRESS_CONTRACT_SCHEMA, source_files


def _validate_cell(value: Any, path: str) -> dict[str, Any]:
    cell = _mapping(value, path)
    _exact_keys(cell, _CELL_KEYS, path)
    for field in ("placement_index", "joint_deletion", "v", "distinguished_d"):
        _plain_int(cell[field], f"{path}.{field}")
    _string(cell["arm"], f"{path}.arm")
    return dict(cell)


def _canonical_dimacs_clause_bytes(clauses: Sequence[Sequence[int]]) -> bytes:
    return "".join(
        " ".join(str(literal) for literal in clause) + " 0\n" for clause in clauses
    ).encode("ascii")


def _validate_clause_delta(
    artifact: Any,
    *,
    artifact_sha256: Any,
    compiler: Mapping[str, Any],
    cell: Mapping[str, Any],
    cnf: bytes,
    num_variables: int,
    clauses: Sequence[Sequence[int]],
) -> bytes:
    delta = _mapping(artifact, "job.clause_delta_artifact")
    required = frozenset(
        {
            "schema",
            "semantic_status",
            "scope",
            "cell",
            "counts",
            "hashes",
            "clause_delta",
        }
    )
    _exact_keys(delta, required, "job.clause_delta_artifact")
    if delta["schema"] != CLAUSE_DELTA_SCHEMA:
        raise PiqdPackageError("job clause-delta artifact has the wrong schema")
    if delta["semantic_status"] != "ORDERED_DIMACS_SUFFIX":
        raise PiqdPackageError("job clause-delta artifact has the wrong status")
    _string(delta["scope"], "job.clause_delta_artifact.scope")
    if delta["cell"] != cell:
        raise PiqdPackageError("job clause-delta cell does not match job.cell")
    delta_bytes = canonical_json_bytes(delta)
    if sha256_bytes(delta_bytes) != _digest(
        artifact_sha256, "job.clause_delta_artifact_sha256"
    ):
        raise PiqdPackageError("job clause-delta artifact SHA-256 mismatch")

    counts = _mapping(delta["counts"], "job.clause_delta_artifact.counts")
    expected_count_keys = frozenset(
        {
            "base_variables",
            "base_clauses",
            "delta_clauses",
            "final_variables",
            "final_clauses",
        }
    )
    _exact_keys(counts, expected_count_keys, "job.clause_delta_artifact.counts")
    count_values = {
        key: _plain_int(value, f"job.clause_delta_artifact.counts.{key}")
        for key, value in counts.items()
    }
    compiler_counts = _mapping(compiler["counts"], "job.compiler_manifest.counts")
    expected_counts = {
        "base_variables": compiler_counts["base_variables"],
        "base_clauses": compiler_counts["base_clauses"],
        "delta_clauses": compiler_counts["added_clauses"],
        "final_variables": compiler_counts["final_variables"],
        "final_clauses": compiler_counts["final_clauses"],
    }
    if count_values != expected_counts:
        raise PiqdPackageError("clause-delta counts do not match compiler counts")
    if count_values["final_variables"] != num_variables or count_values[
        "final_clauses"
    ] != len(clauses):
        raise PiqdPackageError("clause-delta counts do not match DIMACS dimensions")

    delta_clauses_raw = _sequence(
        delta["clause_delta"], "job.clause_delta_artifact.clause_delta"
    )
    normalized_delta: list[tuple[int, ...]] = []
    for clause_index, raw_clause in enumerate(delta_clauses_raw):
        clause = _sequence(
            raw_clause, f"job.clause_delta_artifact.clause_delta[{clause_index}]"
        )
        normalized_delta.append(
            tuple(
                _plain_int(
                    literal if literal >= 0 else -literal,
                    f"job.clause_delta_artifact.clause_delta[{clause_index}] literal magnitude",
                    minimum=1,
                )
                * (1 if literal > 0 else -1)
                for literal in clause
                if not isinstance(literal, bool) and isinstance(literal, int)
            )
        )
        if len(normalized_delta[-1]) != len(clause):
            raise PiqdPackageError(
                "clause-delta literals must be nonzero plain integers"
            )
    if len(normalized_delta) != count_values["delta_clauses"]:
        raise PiqdPackageError("clause-delta length does not match its count")
    base_clause_count = count_values["base_clauses"]
    if tuple(normalized_delta) != tuple(clauses[base_clause_count:]):
        raise PiqdPackageError("clause delta is not the exact ordered DIMACS suffix")

    hashes = _mapping(delta["hashes"], "job.clause_delta_artifact.hashes")
    expected_hash_keys = frozenset(
        {
            "base_clause_list_sha256",
            "clause_delta_sha256",
            "dimacs_sha256",
            "dimacs_suffix_sha256",
        }
    )
    _exact_keys(hashes, expected_hash_keys, "job.clause_delta_artifact.hashes")
    for key, value in hashes.items():
        _digest(value, f"job.clause_delta_artifact.hashes.{key}")
    delta_hash = sha256_json(delta["clause_delta"])
    if hashes["clause_delta_sha256"] != delta_hash:
        raise PiqdPackageError("clause-delta ordered-list SHA-256 mismatch")
    compiler_hashes = _mapping(compiler["hashes"], "job.compiler_manifest.hashes")
    if compiler_hashes["clause_delta_sha256"] != delta_hash:
        raise PiqdPackageError("clause-delta hash does not match compiler manifest")
    if hashes["base_clause_list_sha256"] != sha256_json(clauses[:base_clause_count]):
        raise PiqdPackageError("base clause-list SHA-256 mismatch")
    if hashes["dimacs_sha256"] != sha256_bytes(cnf):
        raise PiqdPackageError("clause-delta DIMACS SHA-256 mismatch")
    if hashes["dimacs_suffix_sha256"] != sha256_bytes(
        _canonical_dimacs_clause_bytes(clauses[base_clause_count:])
    ):
        raise PiqdPackageError("clause-delta DIMACS suffix SHA-256 mismatch")
    return delta_bytes


def _opaque_ranges(total_variables: int, named_variables: set[int]) -> list[list[int]]:
    ranges: list[list[int]] = []
    start: int | None = None
    for variable in range(1, total_variables + 1):
        if variable in named_variables:
            if start is not None:
                ranges.append([start, variable - 1])
                start = None
        elif start is None:
            start = variable
    if start is not None:
        ranges.append([start, total_variables])
    return ranges


def _validate_job(
    job: Mapping[str, Any],
    *,
    cnf: bytes,
    repo_root: Path,
    source_payloads: dict[str, bytes],
) -> tuple[dict[str, Any], bytes, tuple[tuple[int, ...], ...]]:
    _exact_keys(job, _JOB_KEYS, "job")
    if job["schema"] != JOB_SCHEMA or job["semantic_status"] != JOB_STATUS:
        raise PiqdPackageError("job is not a finite exact12 v14 bound job")
    _string(job["scope"], "job.scope")
    _string(job["job_id"], "job.job_id")
    _digest(job["blocked_job_sha256"], "job.blocked_job_sha256")
    _plain_int(job["cell_index"], "job.cell_index")
    cell = _validate_cell(job["cell"], "job.cell")

    source = _mapping(job["source_to_cnf_contract"], "job.source_to_cnf_contract")
    _exact_keys(source, _SOURCE_CONTRACT_KEYS, "job.source_to_cnf_contract")
    for field in (
        "candidate_schema",
        "compiler_schema",
        "compiler_symbol",
        "independent_candidate_replay_symbol",
        "independent_added_constraint_replay_symbol",
    ):
        _string(source[field], f"job.source_to_cnf_contract.{field}")
    expected_source_identity = {
        "candidate_schema": CANDIDATE_SCHEMA,
        "compiler_schema": COMPILER_SCHEMA,
        "compiler_symbol": "compile_cell",
        "independent_candidate_replay_symbol": "source_faithful_cube_ok",
        "independent_added_constraint_replay_symbol": "added_constraints_hold",
    }
    if any(source[key] != value for key, value in expected_source_identity.items()):
        raise PiqdPackageError("job source-to-CNF identity is not exact12 v14")
    source_files = _verify_source_files(
        source["files"],
        repo_root=repo_root,
        path="job.source_to_cnf_contract.files",
        source_payloads=source_payloads,
    )
    if sha256_json(source_files) != _digest(
        source["files_sha256"], "job.source_to_cnf_contract.files_sha256"
    ):
        raise PiqdPackageError("job source file-list SHA-256 mismatch")

    compiler = _mapping(job["compiler_manifest"], "job.compiler_manifest")
    _exact_keys(compiler, _COMPILER_KEYS, "job.compiler_manifest")
    if (
        compiler["schema"] != COMPILER_SCHEMA
        or compiler["semantic_status"] != COMPILER_STATUS
        or source["compiler_schema"] != compiler["schema"]
    ):
        raise PiqdPackageError("compiler manifest provenance is inconsistent")
    _string(compiler["scope"], "job.compiler_manifest.scope")
    if compiler["cell"] != cell:
        raise PiqdPackageError("compiler manifest cell does not match job.cell")
    _plain_int_array(compiler["physical"], "job.compiler_manifest.physical")
    _plain_int_array(compiler["row_at_o"], "job.compiler_manifest.row_at_o")
    for index, item in enumerate(
        _sequence(compiler["edges"], "job.compiler_manifest.edges")
    ):
        path = f"job.compiler_manifest.edges[{index}]"
        edge_record = _mapping(item, path)
        _exact_keys(edge_record, frozenset({"source", "edge"}), path)
        _plain_int(edge_record["source"], f"{path}.source")
        edge = _plain_int_array(edge_record["edge"], f"{path}.edge")
        if len(edge) != 2:
            raise PiqdPackageError(f"{path}.edge must contain exactly two vertices")
    compiler_bytes = canonical_json_bytes(compiler)
    if sha256_bytes(compiler_bytes) != _digest(
        job["compiler_manifest_sha256"], "job.compiler_manifest_sha256"
    ):
        raise PiqdPackageError(
            "compiler_manifest_sha256 does not hash canonical content"
        )

    compiler_counts = _mapping(compiler["counts"], "job.compiler_manifest.counts")
    count_keys = frozenset(
        {
            "base_variables",
            "base_clauses",
            "final_variables",
            "final_clauses",
            "added_variables",
            "added_clauses",
        }
    )
    _exact_keys(compiler_counts, count_keys, "job.compiler_manifest.counts")
    counts = {
        key: _plain_int(value, f"job.compiler_manifest.counts.{key}")
        for key, value in compiler_counts.items()
    }
    compiler_hashes = _mapping(compiler["hashes"], "job.compiler_manifest.hashes")
    _exact_keys(
        compiler_hashes,
        frozenset({"blocker_variable_map_sha256", "clause_delta_sha256"}),
        "job.compiler_manifest.hashes",
    )
    for key, value in compiler_hashes.items():
        _digest(value, f"job.compiler_manifest.hashes.{key}")
    if (
        counts["final_variables"] - counts["base_variables"]
        != counts["added_variables"]
    ):
        raise PiqdPackageError("compiler variable counts are inconsistent")
    if counts["final_clauses"] - counts["base_clauses"] != counts["added_clauses"]:
        raise PiqdPackageError("compiler clause counts are inconsistent")

    cnf_record = _mapping(job["cnf"], "job.cnf")
    _exact_keys(
        cnf_record,
        frozenset({"encoding", "bytes", "n_variables", "n_clauses", "sha256"}),
        "job.cnf",
    )
    if cnf_record["encoding"] != "DIMACS":
        raise PiqdPackageError("job.cnf.encoding must be DIMACS")
    expected_bytes = _plain_int(cnf_record["bytes"], "job.cnf.bytes")
    expected_variables = _plain_int(
        cnf_record["n_variables"], "job.cnf.n_variables", minimum=1
    )
    expected_clauses = _plain_int(cnf_record["n_clauses"], "job.cnf.n_clauses")
    expected_cnf_hash = _digest(cnf_record["sha256"], "job.cnf.sha256")
    if len(cnf) != expected_bytes:
        raise PiqdPackageError("actual CNF byte count does not match job")
    if sha256_bytes(cnf) != expected_cnf_hash:
        raise PiqdPackageError("actual CNF SHA-256 does not match job")
    try:
        num_variables, clauses = parse_dimacs(cnf)
    except PiqdOracleError as exc:
        raise PiqdPackageError(f"actual CNF is invalid DIMACS: {exc}") from exc
    if (num_variables, len(clauses)) != (expected_variables, expected_clauses):
        raise PiqdPackageError("actual DIMACS dimensions do not match job")
    if (num_variables, len(clauses)) != (
        counts["final_variables"],
        counts["final_clauses"],
    ):
        raise PiqdPackageError("actual DIMACS dimensions do not match compiler")

    execution = _mapping(job["execution_gate"], "job.execution_gate")
    _exact_keys(
        execution,
        frozenset({"status", "allowed_outcomes", "promotion"}),
        "job.execution_gate",
    )
    if execution != {
        "status": "FINITE_DISCOVERY_READY",
        "allowed_outcomes": ["SAT", "UNKNOWN", "DISCOVERY_UNSAT"],
        "promotion": "FORBIDDEN_WITHOUT_TERMINAL_PROOF_AND_AGGREGATE_REPLAY",
    }:
        raise PiqdPackageError("job execution gate is not finite-discovery-only")

    delta_bytes = _validate_clause_delta(
        job["clause_delta_artifact"],
        artifact_sha256=job["clause_delta_artifact_sha256"],
        compiler=compiler,
        cell=cell,
        cnf=cnf,
        num_variables=num_variables,
        clauses=clauses,
    )
    return dict(job), delta_bytes, clauses


def _open_output_dir(output_dir: Path) -> tuple[Path, int]:
    absolute = Path(os.path.abspath(output_dir))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | os.O_NOFOLLOW
    try:
        descriptor = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise PiqdPackageError("cannot open the output directory anchor") from exc
    try:
        for component in absolute.parts[1:]:
            try:
                os.mkdir(component, mode=0o700, dir_fd=descriptor)
            except FileExistsError:
                pass
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except OSError as exc:
                raise PiqdPackageError(
                    "output directory contains a symlink or non-directory component"
                ) from exc
            os.close(descriptor)
            descriptor = child
    except BaseException:
        os.close(descriptor)
        raise
    return absolute, descriptor


def _read_output_file(directory_fd: int, name: str) -> bytes:
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise PiqdPackageError(f"cannot safely open package artifact: {name}") from exc
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise PiqdPackageError(f"package artifact is not a regular file: {name}")
        chunks: list[bytes] = []
        while True:
            chunk = os.read(descriptor, 1024 * 1024)
            if not chunk:
                return b"".join(chunks)
            chunks.append(chunk)
    finally:
        os.close(descriptor)


def _is_internal_temporary(name: str) -> bool:
    middle = name.removeprefix(_TEMP_PREFIX).removesuffix(_TEMP_SUFFIX)
    return (
        name.startswith(_TEMP_PREFIX)
        and name.endswith(_TEMP_SUFFIX)
        and len(middle) == 32
        and all(character in _HEX for character in middle)
    )


def _atomic_write(directory_fd: int, name: str, payload: bytes) -> None:
    temporary = f"{_TEMP_PREFIX}{uuid.uuid4().hex}{_TEMP_SUFFIX}"
    descriptor: int | None = None
    installed = False
    try:
        descriptor = os.open(
            temporary,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=directory_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise OSError("write made no progress")
            offset += written
        os.fsync(descriptor)
        temporary_metadata = os.fstat(descriptor)
        try:
            os.link(
                temporary,
                name,
                src_dir_fd=directory_fd,
                dst_dir_fd=directory_fd,
                follow_symlinks=False,
            )
        except FileExistsError as exc:
            raise PiqdPackageError(
                f"package artifact appeared concurrently: {name}"
            ) from exc
        installed_metadata = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if (
            not stat.S_ISREG(installed_metadata.st_mode)
            or installed_metadata.st_dev != temporary_metadata.st_dev
            or installed_metadata.st_ino != temporary_metadata.st_ino
        ):
            os.unlink(name, dir_fd=directory_fd)
            raise PiqdPackageError(
                f"temporary package artifact changed before installation: {name}"
            )
        installed = True
    finally:
        if descriptor is not None:
            os.close(descriptor)
        try:
            os.unlink(temporary, dir_fd=directory_fd)
        except FileNotFoundError:
            pass
    if not installed:
        raise PiqdPackageError(f"failed to install package artifact: {name}")


def _verify_output_artifact(directory_fd: int, name: str, payload: bytes) -> None:
    metadata = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    if stat.S_ISLNK(metadata.st_mode):
        raise PiqdPackageError(f"package artifact is a symlink: {name}")
    if not stat.S_ISREG(metadata.st_mode):
        raise PiqdPackageError(f"package artifact is not a regular file: {name}")
    if _read_output_file(directory_fd, name) != payload:
        raise PiqdPackageError(f"refusing to accept different package artifact: {name}")


def _emit(output_dir: Path, files: Mapping[str, bytes]) -> None:
    _absolute, directory_fd = _open_output_dir(output_dir)
    try:
        entries = set(os.listdir(directory_fd))
        for name in sorted(entries):
            if not _is_internal_temporary(name):
                continue
            metadata = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            if not stat.S_ISREG(metadata.st_mode):
                raise PiqdPackageError(
                    "internal package temporary entry is not a regular file"
                )
            os.unlink(name, dir_fd=directory_fd)
            entries.remove(name)
        extras = sorted(entries - files.keys())
        if extras:
            raise PiqdPackageError(
                f"refusing to package into a directory with extra entries: {extras}"
            )
        for name, payload in files.items():
            if name not in entries:
                continue
            _verify_output_artifact(directory_fd, name, payload)
        for name, payload in files.items():
            if name not in entries:
                _atomic_write(directory_fd, name, payload)
        for name, payload in files.items():
            _verify_output_artifact(directory_fd, name, payload)
        os.fsync(directory_fd)
    finally:
        os.close(directory_fd)


def package_job(
    *,
    job_path: Path,
    cnf_path: Path,
    ingress_contract_path: Path,
    output_dir: Path,
    repo_root: Path,
    wave_id: str,
    live_leaf: str,
    source_theorem: str,
    cardinality_scope: str,
    query_polarity: str,
    shard_count: int,
    backend: str = "cadical",
    solver_profile: str = "unsat",
    seed: int = 97,
    iteration: int = 0,
    parent_checkpoint_sha256: str | None = None,
) -> PackageResult:
    """Validate and emit a self-contained finite/local piqd wave package."""

    repo_root = repo_root.resolve()
    if not repo_root.is_dir():
        raise PiqdPackageError("repo_root must be an existing directory")
    for value, label in (
        (wave_id, "wave_id"),
        (live_leaf, "live_leaf"),
        (source_theorem, "source_theorem"),
        (cardinality_scope, "cardinality_scope"),
        (backend, "backend"),
        (solver_profile, "solver_profile"),
    ):
        _string(value, label)
    if query_polarity not in QUERY_POLARITIES:
        raise PiqdPackageError(
            f"query_polarity must be one of {sorted(QUERY_POLARITIES)}"
        )
    allowed_profiles = _PIQD_PROFILES.get(backend)
    if allowed_profiles is None:
        raise PiqdPackageError(f"unsupported piqd backend: {backend!r}")
    if solver_profile not in allowed_profiles:
        raise PiqdPackageError(
            f"unsupported profile {solver_profile!r} for backend {backend!r}"
        )
    shard_count = _plain_int(shard_count, "shard_count", minimum=1)
    seed = _plain_int(seed, "seed")
    iteration = _plain_int(iteration, "iteration")
    if iteration != 0:
        raise PiqdPackageError(
            "this packager supports only iteration 0; authenticated parent "
            "checkpoint artifacts are not implemented"
        )
    if parent_checkpoint_sha256 is not None:
        raise PiqdPackageError("iteration 0 forbids parent_checkpoint_sha256")

    try:
        job_raw = job_path.read_bytes()
        cnf = cnf_path.read_bytes()
        ingress_raw = ingress_contract_path.read_bytes()
    except OSError as exc:
        raise PiqdPackageError(f"cannot read package input: {exc}") from exc
    job_input = _strict_json(job_raw, source=str(job_path))
    ingress = _strict_json(
        ingress_raw, source=str(ingress_contract_path), canonical=True
    )
    source_payloads: dict[str, bytes] = {}
    ingress_schema, _ingress_source_files = _validate_ingress_contract(
        ingress,
        repo_root=repo_root,
        live_leaf=live_leaf,
        source_theorem=source_theorem,
        cardinality_scope=cardinality_scope,
        source_payloads=source_payloads,
    )
    job, clause_delta_bytes, _clauses = _validate_job(
        job_input,
        cnf=cnf,
        repo_root=repo_root,
        source_payloads=source_payloads,
    )
    cell_index = _plain_int(job["cell_index"], "job.cell_index")
    if cell_index >= shard_count:
        raise PiqdPackageError("job.cell_index must be less than shard_count")

    compiler = _mapping(job["compiler_manifest"], "job.compiler_manifest")
    blockers = _sequence(
        compiler["blocker_variables"], "job.compiler_manifest.blocker_variables"
    )
    normalized_blockers: list[dict[str, int]] = []
    for index, item in enumerate(blockers):
        path = f"job.compiler_manifest.blocker_variables[{index}]"
        record = _mapping(item, path)
        _exact_keys(record, frozenset({"source", "center", "variable"}), path)
        normalized_blockers.append(
            {
                "source": _plain_int(record["source"], f"{path}.source"),
                "center": _plain_int(record["center"], f"{path}.center"),
                "variable": _plain_int(
                    record["variable"], f"{path}.variable", minimum=1
                ),
            }
        )
    if normalized_blockers != sorted(
        normalized_blockers, key=lambda item: (item["source"], item["center"])
    ):
        raise PiqdPackageError(
            "named blocker variables are not in canonical allocator order"
        )
    named_variables = {item["variable"] for item in normalized_blockers}
    if len(named_variables) != len(normalized_blockers):
        raise PiqdPackageError("named blocker variable IDs are not unique")
    total_variables = job["cnf"]["n_variables"]
    if any(variable > total_variables for variable in named_variables):
        raise PiqdPackageError("named blocker variable lies outside the DIMACS range")
    blocker_payload = [
        [item["source"], item["center"], item["variable"]]
        for item in normalized_blockers
    ]
    compiler_hashes = _mapping(compiler["hashes"], "job.compiler_manifest.hashes")
    if sha256_json(blocker_payload) != _digest(
        compiler_hashes["blocker_variable_map_sha256"],
        "job.compiler_manifest.hashes.blocker_variable_map_sha256",
    ):
        raise PiqdPackageError("named blocker allocator SHA-256 mismatch")

    source_contract = _mapping(
        job["source_to_cnf_contract"], "job.source_to_cnf_contract"
    )
    variable_map = {
        "schema": VARIABLE_MAP_SCHEMA,
        "semantic_status": "FINITE_PARTIAL_VARIABLE_MAP",
        "scope": PACKAGE_SCOPE,
        "job_id": job["job_id"],
        "cell_index": cell_index,
        "coverage": {
            "classification": VARIABLE_MAP_COVERAGE,
            "total_variable_count": total_variables,
            "named_blocker_count": len(normalized_blockers),
            "opaque_variable_count": total_variables - len(normalized_blockers),
            "opaque_variable_ranges_inclusive": _opaque_ranges(
                total_variables, named_variables
            ),
        },
        "named_blockers": normalized_blockers,
        "allocator_provenance": {
            "compiler_manifest_sha256": job["compiler_manifest_sha256"],
            "compiler_blocker_variable_map_sha256": compiler_hashes[
                "blocker_variable_map_sha256"
            ],
            "source_files_sha256": source_contract["files_sha256"],
        },
    }
    variable_map_bytes = canonical_json_bytes(variable_map)
    variable_map_sha256 = sha256_bytes(variable_map_bytes)

    order_cell = {
        "schema": ORDER_CELL_SCHEMA,
        "semantic_status": "FINITE_CELL_AND_ALLOCATOR_ORDER",
        "scope": PACKAGE_SCOPE,
        "job_id": job["job_id"],
        "shard_id": cell_index,
        "shard_count": shard_count,
        "cell": job["cell"],
        "deterministic_compiler_order": {
            "physical": compiler["physical"],
            "row_at_o": compiler["row_at_o"],
            "edges": compiler["edges"],
            "named_blockers": normalized_blockers,
        },
        "allocator_provenance": {
            "compiler_manifest_sha256": job["compiler_manifest_sha256"],
            "clause_delta_artifact_sha256": job["clause_delta_artifact_sha256"],
            "source_files_sha256": source_contract["files_sha256"],
        },
    }
    order_cell_bytes = canonical_json_bytes(order_cell)
    order_sha256 = sha256_bytes(order_cell_bytes)
    source_bundle = {
        "schema": SOURCE_BUNDLE_SCHEMA,
        "semantic_status": "AUTHENTICATED_FINITE_SOURCE_SNAPSHOT",
        "scope": PACKAGE_SCOPE,
        "content_encoding": "base64",
        "files": [
            {
                "path": path,
                "bytes": len(payload),
                "sha256": sha256_bytes(payload),
                "content_base64": base64.b64encode(payload).decode("ascii"),
            }
            for path, payload in sorted(source_payloads.items())
        ],
    }
    source_bundle_bytes = canonical_json_bytes(source_bundle)
    source_bundle_sha256 = sha256_bytes(source_bundle_bytes)
    ingress_sha256 = sha256_bytes(ingress_raw)
    source_job_bytes = canonical_json_bytes(job)
    source_job_sha256 = sha256_bytes(source_job_bytes)
    compiler_bytes = canonical_json_bytes(compiler)

    producer = {
        "schema": PRODUCER_SCHEMA,
        "semantic_status": "FINITE_LOCAL_SOURCE_BOUND_PACKAGE",
        "scope": PACKAGE_SCOPE,
        "source": {
            "live_leaf": live_leaf,
            "source_theorem": source_theorem,
            "ingress_contract_sha256": ingress_sha256,
            "ingress_contract_schema": ingress_schema,
            "source_job_schema": job["schema"],
            "source_job_sha256": source_job_sha256,
            "job_id": job["job_id"],
            "cell_index": cell_index,
        },
        "provenance": {
            "blocked_job_sha256": job["blocked_job_sha256"],
            "blocked_job_provenance_status": UPSTREAM_DIGEST_STATUS,
            "source_to_cnf_contract": source_contract,
            "compiler_manifest_sha256": job["compiler_manifest_sha256"],
            "clause_delta_artifact_sha256": job["clause_delta_artifact_sha256"],
            "source_bundle_sha256": source_bundle_sha256,
        },
        "artifacts": {
            "cnf": {
                "path": "discovery.cnf",
                "bytes": len(cnf),
                "sha256": job["cnf"]["sha256"],
                "num_variables": job["cnf"]["n_variables"],
                "num_clauses": job["cnf"]["n_clauses"],
            },
            "ingress_contract": {
                "path": "ingress-contract.json",
                "sha256": ingress_sha256,
            },
            "source_job": {
                "path": "source-job.json",
                "sha256": source_job_sha256,
            },
            "compiler_manifest": {
                "path": "compiler-manifest.json",
                "sha256": job["compiler_manifest_sha256"],
            },
            "clause_delta": {
                "path": "clause-delta.json",
                "sha256": job["clause_delta_artifact_sha256"],
            },
            "source_bundle": {
                "path": "source-bundle.json",
                "sha256": source_bundle_sha256,
            },
            "variable_map": {
                "path": "variable-map.json",
                "sha256": variable_map_sha256,
                "coverage": VARIABLE_MAP_COVERAGE,
            },
            "order_cell": {
                "path": "order-cell.json",
                "sha256": order_sha256,
            },
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    producer_bytes = canonical_json_bytes(producer)
    producer_sha256 = sha256_bytes(producer_bytes)

    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": wave_id,
        "iteration": iteration,
        "parent_checkpoint_sha256": parent_checkpoint_sha256,
        "source": {
            "live_leaf": live_leaf,
            "ingress_hypotheses_sha256": ingress_sha256,
            "finite_schema": job["schema"],
            "cardinality_scope": cardinality_scope,
            "source_theorem": source_theorem,
        },
        "encoding": {
            "cnf_sha256": job["cnf"]["sha256"],
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": job["cnf"]["n_variables"],
            "num_clauses": job["cnf"]["n_clauses"],
            "query_polarity": query_polarity,
        },
        "execution": {
            "backend": backend,
            "solver_profile": solver_profile,
            "shard_id": cell_index,
            "shard_count": shard_count,
            "order_sha256": order_sha256,
            "seed": seed,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    try:
        validate_wave_manifest(wave)
    except WaveContractError as exc:
        raise PiqdPackageError(f"emitted wave manifest is invalid: {exc}") from exc
    wave_bytes = canonical_json_bytes(wave)

    files = {
        "discovery.cnf": cnf,
        "ingress-contract.json": ingress_raw,
        "source-job.json": source_job_bytes,
        "compiler-manifest.json": compiler_bytes,
        "clause-delta.json": clause_delta_bytes,
        "source-bundle.json": source_bundle_bytes,
        "variable-map.json": variable_map_bytes,
        "order-cell.json": order_cell_bytes,
        "producer-manifest.json": producer_bytes,
        "wave-manifest.json": wave_bytes,
    }
    _emit(output_dir, files)
    return PackageResult(
        output_dir=output_dir,
        cnf_sha256=job["cnf"]["sha256"],
        ingress_contract_sha256=ingress_sha256,
        source_bundle_sha256=source_bundle_sha256,
        producer_manifest_sha256=producer_sha256,
        variable_map_sha256=variable_map_sha256,
        order_sha256=order_sha256,
        wave_manifest_sha256=sha256_bytes(wave_bytes),
    )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--job", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--ingress-contract", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument(
        "--repo-root", type=Path, default=Path(__file__).resolve().parents[2]
    )
    parser.add_argument("--wave-id", required=True)
    parser.add_argument("--live-leaf", required=True)
    parser.add_argument("--source-theorem", required=True)
    parser.add_argument("--cardinality-scope", required=True)
    parser.add_argument(
        "--query-polarity", choices=sorted(QUERY_POLARITIES), required=True
    )
    parser.add_argument("--shard-count", type=int, required=True)
    parser.add_argument("--backend", default="cadical")
    parser.add_argument("--solver-profile", default="unsat")
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--iteration", type=int, choices=(0,), default=0)
    parser.add_argument(
        "--parent-checkpoint-sha256",
        help="unsupported; iteration-0 packages have no parent checkpoint",
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        result = package_job(
            job_path=args.job,
            cnf_path=args.cnf,
            ingress_contract_path=args.ingress_contract,
            output_dir=args.output_dir,
            repo_root=args.repo_root,
            wave_id=args.wave_id,
            live_leaf=args.live_leaf,
            source_theorem=args.source_theorem,
            cardinality_scope=args.cardinality_scope,
            query_polarity=args.query_polarity,
            shard_count=args.shard_count,
            backend=args.backend,
            solver_profile=args.solver_profile,
            seed=args.seed,
            iteration=args.iteration,
            parent_checkpoint_sha256=args.parent_checkpoint_sha256,
        )
    except (OSError, PiqdPackageError) as exc:
        print(f"phase3_piqd_package: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result.as_dict()).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
