"""PIQD discovery-only adapter for Exact12 static cell 1 v8.

Every current CEGAR formula receives a fresh descriptor and a fresh invocation
of the shared raw-DIMACS static runner.  PIQD SAT models are replayed locally;
PIQD UNSAT remains observational and is returned to the legacy coordinator so
that its byte-identical local CaDiCaL/DRAT/drat-trim terminal rerun stays intact.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
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

from .exact12_next_row_cell_run import cnf_assignment_satisfies
from .exact12_next_row_static_cegar import (
    DETECTOR_CONTRACT,
    JOB_SCHEMA,
    StaticDiscoveryRequest,
    run_static_cegar,
)
from .exact12_next_row_static_convex import STATIC_CONVEX_SCHEMA
from .exact12_next_row_valuation import COMPILER_SCHEMA
from .exact12_v14_ordered_cut_adapter import SOURCE_ORDER_INSTALLATION_SCHEMA
from .exact12_v14_source_order_bank import BANK_SCHEMA as SOURCE_ORDER_BANK_SCHEMA
from .sat_encoding import CadicalResult
from .source_faithful_candidate_surface import SOURCE_FAITHFUL_CANDIDATE_SCHEMA

DESCRIPTOR_SCHEMA = "p97_rigid221_exact12_next_row_static_piqd_descriptor.v2"
PIQD_PROJECT = "p97-exact12-next-row-static-cell1-v8-r15"
CELL_INDEX = 1
MAX_CNF_BYTES = 256 * 1024 * 1024
MAX_DESCRIPTOR_BYTES = 1024 * 1024

_HEX = frozenset("0123456789abcdef")
_FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_DESCRIPTOR_KEYS = frozenset(
    {
        "schema",
        "root_job_id",
        "job_schema",
        "cell_index",
        "iteration",
        "local_iteration",
        "parent_record_sha256",
        "current_cnf",
        "root_cnf",
        "detector",
        "candidate",
        "compiler",
        "static_convex",
        "positive_membership_bank",
        "source_order_bank",
        "sources",
        "sources_sha256",
        "query_polarity",
        "certificate_blocker",
        "claims",
    }
)
_SOURCE_ORDER_BANK_KEYS = frozenset({"schema", "sha256", "entries", "installation"})
_SOURCE_ORDER_INSTALLATION_KEYS = frozenset(
    {
        "schema",
        "bank_sha256",
        "base_n_variables",
        "base_n_clauses",
        "base_cnf_sha256",
        "suffix_n_clauses",
        "suffix_sha256",
        "final_n_variables",
        "final_n_clauses",
        "final_cnf_sha256",
        "installation_sha256",
    }
)


class Exact12NextRowStaticPiqdError(ValueError):
    """A v8 discovery descriptor, PIQD result, or custody binding failed."""


def _open_directory_chain(path: Path, *, create: bool) -> int:
    """Open a directory through component-wise nofollow descriptors."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        descriptor = os.open(os.path.sep, directory_flags)
    except OSError as exc:
        raise Exact12NextRowStaticPiqdError(
            f"cannot anchor custody directory: {absolute}"
        ) from exc
    try:
        for component in absolute.parts[1:]:
            try:
                child = os.open(component, directory_flags, dir_fd=descriptor)
            except FileNotFoundError:
                if not create:
                    raise Exact12NextRowStaticPiqdError(
                        f"custody directory is missing: {absolute}"
                    )
                try:
                    os.mkdir(component, 0o700, dir_fd=descriptor)
                except FileExistsError:
                    pass
                try:
                    child = os.open(component, directory_flags, dir_fd=descriptor)
                except OSError as exc:
                    raise Exact12NextRowStaticPiqdError(
                        f"custody directory component is unsafe: {absolute}"
                    ) from exc
            except OSError as exc:
                raise Exact12NextRowStaticPiqdError(
                    f"custody directory component is unsafe: {absolute}"
                ) from exc
            os.close(descriptor)
            descriptor = child
        return descriptor
    except Exception:
        os.close(descriptor)
        raise


def _capture_regular_at(directory: int, name: str, *, maximum_bytes: int) -> bytes:
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory)
    except OSError as exc:
        raise Exact12NextRowStaticPiqdError(f"unsafe custody file: {name}") from exc
    try:
        metadata = os.fstat(descriptor)
        if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
            raise Exact12NextRowStaticPiqdError(
                f"custody file is not singly linked and regular: {name}"
            )
        chunks: list[bytes] = []
        size = 0
        while chunk := os.read(descriptor, min(1 << 20, maximum_bytes + 1 - size)):
            size += len(chunk)
            if size > maximum_bytes:
                raise Exact12NextRowStaticPiqdError(
                    f"custody file exceeds its byte bound: {name}"
                )
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _digest(value: object, name: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise Exact12NextRowStaticPiqdError(
            f"{name} must be a lowercase SHA-256 digest"
        )
    return value


def _validate_source_order_installation(
    value: object, *, root_cnf: Mapping[str, Any]
) -> dict[str, Any]:
    """Validate the authenticated source-order suffix bound by the root job."""

    if type(value) is not dict or set(value) != _SOURCE_ORDER_BANK_KEYS:
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order bank identity is malformed"
        )
    bank = dict(value)
    if bank["schema"] != SOURCE_ORDER_BANK_SCHEMA:
        raise Exact12NextRowStaticPiqdError("v8 source-order bank schema is crossed")
    bank_sha256 = _digest(bank["sha256"], "source-order bank sha256")
    entries = bank["entries"]
    if type(entries) is not int or entries <= 0:
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order bank entry count is malformed"
        )

    installation_value = bank["installation"]
    if (
        type(installation_value) is not dict
        or set(installation_value) != _SOURCE_ORDER_INSTALLATION_KEYS
    ):
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order installation identity is malformed"
        )
    installation = dict(installation_value)
    integer_fields = (
        "base_n_variables",
        "base_n_clauses",
        "suffix_n_clauses",
        "final_n_variables",
        "final_n_clauses",
    )
    if any(type(installation[field]) is not int for field in integer_fields):
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order installation dimensions are malformed"
        )
    for field in (
        "base_cnf_sha256",
        "suffix_sha256",
        "final_cnf_sha256",
        "installation_sha256",
    ):
        _digest(installation[field], f"source-order installation {field}")
    if (
        installation["schema"] != SOURCE_ORDER_INSTALLATION_SCHEMA
        or installation["bank_sha256"] != bank_sha256
        or installation["base_n_variables"] != root_cnf["variables"]
        or installation["suffix_n_clauses"] != entries
        or installation["final_n_variables"] != root_cnf["variables"]
        or installation["final_n_clauses"] != root_cnf["clauses"]
        or installation["final_cnf_sha256"] != root_cnf["sha256"]
        or installation["base_n_clauses"] + entries != root_cnf["clauses"]
        or installation["base_n_clauses"] < 0
    ):
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order installation is crossed with the root CNF"
        )
    body = {
        key: installation[key]
        for key in _SOURCE_ORDER_INSTALLATION_KEYS
        if key != "installation_sha256"
    }
    if installation["installation_sha256"] != sha256_json(body):
        raise Exact12NextRowStaticPiqdError(
            "v8 source-order installation hash is noncanonical"
        )
    return bank


def _strict_json(raw: bytes, *, name: str) -> dict[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"invalid JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=reject_duplicates,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, ValueError) as exc:
        raise Exact12NextRowStaticPiqdError(f"{name} is not strict JSON") from exc
    if type(value) is not dict:
        raise Exact12NextRowStaticPiqdError(f"{name} must be a JSON object")
    return value


def _capture_regular(path: Path, *, maximum_bytes: int) -> bytes:
    absolute = Path(os.path.abspath(os.fspath(path)))
    directory = _open_directory_chain(absolute.parent, create=False)
    try:
        return _capture_regular_at(
            directory, absolute.name, maximum_bytes=maximum_bytes
        )
    finally:
        os.close(directory)


def _reject_symlinked_output_root(path: Path) -> None:
    """Reject existing symlink components before any discovery transport."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    cursor = Path(os.path.sep)
    for component in absolute.parts[1:]:
        cursor /= component
        try:
            metadata = cursor.lstat()
        except FileNotFoundError:
            break
        except OSError as exc:
            raise Exact12NextRowStaticPiqdError(
                f"cannot inspect custody output root: {absolute}"
            ) from exc
        if stat.S_ISLNK(metadata.st_mode):
            raise Exact12NextRowStaticPiqdError(
                f"custody output root contains a symlink: {absolute}"
            )


def _install_descriptor(root: Path, payload: bytes, descriptor_sha256: str) -> Path:
    if len(payload) > MAX_DESCRIPTOR_BYTES:
        raise Exact12NextRowStaticPiqdError("PIQD descriptor exceeds its byte bound")
    directory = Path(os.path.abspath(os.fspath(root))) / "descriptors"
    directory_descriptor = _open_directory_chain(directory, create=True)
    path = directory / f"descriptor-{descriptor_sha256}.json"
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        try:
            descriptor = os.open(path.name, flags, 0o600, dir_fd=directory_descriptor)
        except FileExistsError:
            if (
                _capture_regular_at(
                    directory_descriptor,
                    path.name,
                    maximum_bytes=MAX_DESCRIPTOR_BYTES,
                )
                != payload
            ):
                raise Exact12NextRowStaticPiqdError(
                    "content-addressed PIQD descriptor is crossed"
                )
        except OSError as exc:
            raise Exact12NextRowStaticPiqdError(
                "cannot publish PIQD descriptor"
            ) from exc
        else:
            try:
                cursor = 0
                while cursor < len(payload):
                    written = os.write(descriptor, payload[cursor:])
                    if written <= 0:
                        raise Exact12NextRowStaticPiqdError(
                            "short PIQD descriptor write"
                        )
                    cursor += written
                os.fsync(descriptor)
            finally:
                os.close(descriptor)
        if (
            _capture_regular_at(
                directory_descriptor,
                path.name,
                maximum_bytes=MAX_DESCRIPTOR_BYTES,
            )
            != payload
        ):
            raise Exact12NextRowStaticPiqdError("published PIQD descriptor changed")
        return path
    finally:
        os.close(directory_descriptor)


def _persist_current_cnf(path: Path, expected: bytes) -> None:
    absolute = Path(os.path.abspath(os.fspath(path)))
    directory = _open_directory_chain(absolute.parent, create=True)
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        try:
            descriptor = os.open(absolute.name, flags, 0o600, dir_fd=directory)
        except OSError as exc:
            raise Exact12NextRowStaticPiqdError("discovery CNF path is unsafe") from exc
        try:
            metadata = os.fstat(descriptor)
            if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
                raise Exact12NextRowStaticPiqdError(
                    "discovery CNF is not singly linked and regular"
                )
            os.ftruncate(descriptor, 0)
            cursor = 0
            while cursor < len(expected):
                written = os.write(descriptor, expected[cursor:])
                if written <= 0:
                    raise Exact12NextRowStaticPiqdError("short discovery CNF write")
                cursor += written
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        if (
            _capture_regular_at(directory, absolute.name, maximum_bytes=MAX_CNF_BYTES)
            != expected
        ):
            raise Exact12NextRowStaticPiqdError("persisted discovery CNF changed")
    finally:
        os.close(directory)


def _verify_sources(repo_root: Path, sources: object) -> list[dict[str, Any]]:
    if type(sources) is not list or not sources:
        raise Exact12NextRowStaticPiqdError("v8 job sources are malformed")
    normalized: list[dict[str, Any]] = []
    seen: dict[str, tuple[int, str]] = {}
    for index, item in enumerate(sources):
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise Exact12NextRowStaticPiqdError(
                f"v8 job source {index} has the wrong schema"
            )
        relative = item["path"]
        if (
            type(relative) is not str
            or not relative
            or Path(relative).is_absolute()
            or ".." in Path(relative).parts
        ):
            raise Exact12NextRowStaticPiqdError("v8 job source path is unsafe")
        expected_size = item["bytes"]
        if type(expected_size) is not int or expected_size < 0:
            raise Exact12NextRowStaticPiqdError("v8 job source size is malformed")
        expected_sha = _digest(item["sha256"], "v8 job source sha256")
        identity = (expected_size, expected_sha)
        if relative in seen and seen[relative] != identity:
            raise Exact12NextRowStaticPiqdError(
                "repeated v8 job source path has crossed identities"
            )
        seen[relative] = identity
        source_path = repo_root / relative
        payload = _capture_regular(source_path, maximum_bytes=max(expected_size, 1))
        if len(payload) != expected_size or sha256_bytes(payload) != expected_sha:
            raise Exact12NextRowStaticPiqdError(
                f"v8 job source identity changed: {relative}"
            )
        normalized.append(dict(item))
    return normalized


def build_discovery_descriptor(
    request: StaticDiscoveryRequest, *, repo_root: Path
) -> dict[str, Any]:
    """Validate and freeze all v8 identities for one current CEGAR formula."""

    if type(request) is not StaticDiscoveryRequest:
        raise Exact12NextRowStaticPiqdError(
            "PIQD factory requires an exact StaticDiscoveryRequest"
        )
    if request.cell_index != CELL_INDEX:
        raise Exact12NextRowStaticPiqdError("PIQD onboarding is restricted to cell 1")
    if (
        type(request.cell_index) is not int
        or type(request.num_variables) is not int
        or request.num_variables <= 0
        or type(request.num_clauses) is not int
        or request.num_clauses <= 0
        or type(request.iteration) is not int
        or request.iteration < 0
        or type(request.local_iteration) is not int
        or request.local_iteration < 0
    ):
        raise Exact12NextRowStaticPiqdError("PIQD iteration identities are malformed")
    if type(request.current_dimacs) is not bytes:
        raise Exact12NextRowStaticPiqdError("current CNF snapshot must be exact bytes")
    current_sha = sha256_bytes(request.current_dimacs)
    if current_sha != _digest(request.current_cnf_sha256, "current CNF sha256"):
        raise Exact12NextRowStaticPiqdError("current CNF snapshot is stale")
    try:
        dimensions = scan_dimacs(request.current_dimacs)
    except Exception as exc:
        raise Exact12NextRowStaticPiqdError("current CNF is malformed") from exc
    if dimensions != (request.num_variables, request.num_clauses):
        raise Exact12NextRowStaticPiqdError("current CNF dimensions are stale")
    if request.instance.dimacs().encode("ascii") != request.current_dimacs:
        raise Exact12NextRowStaticPiqdError("current CEGAR instance changed")

    job = request.job
    if type(job) is not dict or job.get("schema") != JOB_SCHEMA:
        raise Exact12NextRowStaticPiqdError("root v8 job schema is crossed")
    job_id = _digest(job.get("job_id"), "root job_id")
    unsigned_job = dict(job)
    del unsigned_job["job_id"]
    if sha256_json(unsigned_job) != job_id:
        raise Exact12NextRowStaticPiqdError("root v8 job_id is not canonical")
    parent_sha = _digest(request.parent_record_sha256, "parent journal sha256")
    if request.iteration == 0 and parent_sha != job_id:
        raise Exact12NextRowStaticPiqdError(
            "iteration zero must bind the root job as journal parent"
        )
    if request.iteration > 0 and parent_sha == job_id:
        raise Exact12NextRowStaticPiqdError(
            "post-cut iteration must bind a learned-record parent"
        )

    root_cnf = job.get("cnf")
    if type(root_cnf) is not dict or set(root_cnf) != {
        "bytes",
        "sha256",
        "variables",
        "clauses",
    }:
        raise Exact12NextRowStaticPiqdError("root v8 CNF identity is malformed")
    _digest(root_cnf["sha256"], "root CNF sha256")
    if (
        type(root_cnf["bytes"]) is not int
        or root_cnf["bytes"] <= 0
        or type(root_cnf["variables"]) is not int
        or root_cnf["variables"] != request.num_variables
        or type(root_cnf["clauses"]) is not int
        or root_cnf["clauses"] <= 0
        or root_cnf["clauses"] > request.num_clauses
    ):
        raise Exact12NextRowStaticPiqdError("root v8 CNF dimensions are crossed")
    if request.iteration == 0 and (
        root_cnf["sha256"] != current_sha
        or root_cnf["bytes"] != len(request.current_dimacs)
        or root_cnf["clauses"] != request.num_clauses
    ):
        raise Exact12NextRowStaticPiqdError("iteration-zero CNF differs from root job")

    detector_sha = _digest(request.detector_contract_sha256, "detector contract sha256")
    if job.get("compiler_schema") != COMPILER_SCHEMA:
        raise Exact12NextRowStaticPiqdError("v8 compiler schema is crossed")
    if job.get("static_convex_schema") != STATIC_CONVEX_SCHEMA:
        raise Exact12NextRowStaticPiqdError("v8 static schema is crossed")
    if job.get("candidate_schema") != SOURCE_FAITHFUL_CANDIDATE_SCHEMA:
        raise Exact12NextRowStaticPiqdError("v8 candidate schema is crossed")
    for field in (
        "compiler_manifest",
        "static_convex_manifest",
        "positive_membership_bank",
        "source_order_bank",
    ):
        if type(job.get(field)) is not dict:
            raise Exact12NextRowStaticPiqdError(f"v8 {field} identity is malformed")
    positive_bank = dict(job["positive_membership_bank"])
    _digest(positive_bank.get("sha256"), "positive-membership bank sha256")
    source_order_bank = _validate_source_order_installation(
        job["source_order_bank"], root_cnf=root_cnf
    )
    sources = _verify_sources(repo_root, job.get("sources"))
    if detector_sha != sha256_json({"contract": DETECTOR_CONTRACT, "sources": sources}):
        raise Exact12NextRowStaticPiqdError(
            "detector contract is not bound to the v8 source manifest"
        )

    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "root_job_id": job_id,
        "job_schema": JOB_SCHEMA,
        "cell_index": request.cell_index,
        "iteration": request.iteration,
        "local_iteration": request.local_iteration,
        "parent_record_sha256": parent_sha,
        "current_cnf": {
            "sha256": current_sha,
            "bytes": len(request.current_dimacs),
            "num_variables": request.num_variables,
            "num_clauses": request.num_clauses,
        },
        "root_cnf": dict(root_cnf),
        "detector": {
            "contract": DETECTOR_CONTRACT,
            "sha256": detector_sha,
        },
        "candidate": {
            "schema": job["candidate_schema"],
            "profile": job.get("candidate_profile"),
        },
        "compiler": {
            "schema": job["compiler_schema"],
            "manifest": job["compiler_manifest"],
            "manifest_sha256": sha256_json(job["compiler_manifest"]),
        },
        "static_convex": {
            "schema": job["static_convex_schema"],
            "manifest": job["static_convex_manifest"],
            "manifest_sha256": sha256_json(job["static_convex_manifest"]),
        },
        "positive_membership_bank": positive_bank,
        "source_order_bank": source_order_bank,
        "sources": sources,
        "sources_sha256": sha256_json(sources),
        "query_polarity": "SAT_MEANS_SURVIVING_STATIC_CUBE",
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "claims": dict(_FALSE_CLAIMS),
    }
    if set(descriptor) != _DESCRIPTOR_KEYS:
        raise AssertionError("internal descriptor schema drift")
    return descriptor


def _manifests(
    descriptor: Mapping[str, Any], descriptor_sha256: str
) -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": f"{DESCRIPTOR_SCHEMA}:{descriptor_sha256}",
        "source_path": f"descriptors/descriptor-{descriptor_sha256}.json",
        "source_sha256": descriptor_sha256,
        "finite_schema": JOB_SCHEMA,
        "cardinality_scope": "exactly 12 points; exact cell index 1 only",
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
        raise Exact12NextRowStaticPiqdError(
            "PIQD returned a non-exact StaticSolverResult"
        )
    if type(value.verdict) is not str or value.verdict not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise Exact12NextRowStaticPiqdError("PIQD verdict is malformed")
    if type(value.assignment) is not dict:
        raise Exact12NextRowStaticPiqdError("PIQD assignment is not an exact dict")
    if type(value.returncode) is not int:
        raise Exact12NextRowStaticPiqdError("PIQD return code is malformed")
    if type(value.stdout) is not str or type(value.stderr) is not str:
        raise Exact12NextRowStaticPiqdError("PIQD diagnostics are malformed")
    if any(type(key) is not int for key in value.assignment) or any(
        type(selected) is not bool for selected in value.assignment.values()
    ):
        raise Exact12NextRowStaticPiqdError("PIQD assignment uses non-builtin values")
    if value.verdict == "SAT":
        if value.returncode != 10 or set(value.assignment) != set(
            range(1, num_variables + 1)
        ):
            raise Exact12NextRowStaticPiqdError("PIQD SAT assignment is not total")
    elif value.assignment:
        raise Exact12NextRowStaticPiqdError("non-SAT PIQD result carries a model")
    elif value.verdict == "UNSAT" and value.returncode != 20:
        raise Exact12NextRowStaticPiqdError("PIQD UNSAT return code is malformed")
    elif value.verdict == "UNKNOWN" and value.returncode != 1:
        raise Exact12NextRowStaticPiqdError("PIQD UNKNOWN return code is malformed")
    return value


def _validate_receipt(
    result: StaticSolverResult,
    *,
    request: StaticDiscoveryRequest,
    source_sha256: str,
    producer_sha256: str,
) -> None:
    raw = result.stdout.encode("utf-8")
    if not raw.endswith(b"\n"):
        raise Exact12NextRowStaticPiqdError("PIQD result omitted its solver receipt")
    receipt = _strict_json(raw, name="PIQD solver receipt")
    if canonical_json_bytes(receipt) + b"\n" != raw:
        raise Exact12NextRowStaticPiqdError("PIQD solver receipt is not canonical")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise Exact12NextRowStaticPiqdError("PIQD solver receipt schema is crossed")
    unsigned = dict(receipt)
    receipt_sha = unsigned.pop("receipt_sha256", None)
    if receipt_sha != sha256_json(unsigned):
        raise Exact12NextRowStaticPiqdError("PIQD solver receipt hash is invalid")
    expected = {
        "adapter_verdict": result.verdict,
        "adapter_returncode": result.returncode,
        "cnf_sha256": request.current_cnf_sha256,
        "num_variables": request.num_variables,
        "num_clauses": request.num_clauses,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
    }
    if any(receipt.get(key) != value for key, value in expected.items()):
        raise Exact12NextRowStaticPiqdError("PIQD solver receipt is cross-bound")
    job_identity = receipt.get("job_identity")
    if type(job_identity) is not dict or any(
        job_identity.get(key) != value
        for key, value in {
            "backend": "cadical",
            "solver_profile": "sat",
            "project": PIQD_PROJECT,
            "cnf_blob_hash": request.current_cnf_sha256,
            "num_vars": request.num_variables,
            "num_clauses": request.num_clauses,
            "requested_core_limit": 1,
        }.items()
    ):
        raise Exact12NextRowStaticPiqdError("PIQD job receipt is cross-bound")


class Exact12StaticPiqdDiscovery:
    """One exact formula-bound discovery callback."""

    def __init__(
        self,
        *,
        request: StaticDiscoveryRequest,
        repo_root: Path,
        descriptor_path: Path,
        descriptor_bytes: bytes,
        source_manifest: bytes,
        producer_manifest: bytes,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
    ) -> None:
        self.request = request
        self.repo_root = repo_root
        self.descriptor_path = descriptor_path
        self.descriptor_bytes = descriptor_bytes
        self.source_manifest = source_manifest
        self.producer_manifest = producer_manifest
        self.runner = runner

    def _assert_descriptor_current(self) -> None:
        current = (
            canonical_json_bytes(
                build_discovery_descriptor(self.request, repo_root=self.repo_root)
            )
            + b"\n"
        )
        if current != self.descriptor_bytes:
            raise Exact12NextRowStaticPiqdError(
                "PIQD request changed after descriptor publication"
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
        if instance is not self.request.instance:
            raise Exact12NextRowStaticPiqdError("PIQD discovery instance is crossed")
        if not isinstance(cnf_path, Path):
            raise Exact12NextRowStaticPiqdError("PIQD CNF path must be a Path")
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise Exact12NextRowStaticPiqdError("PIQD timeout must be positive")
        if type(nice) is not int or not 1 <= nice <= 19:
            raise Exact12NextRowStaticPiqdError("PIQD nice value is malformed")
        if proof_path is not None:
            raise Exact12NextRowStaticPiqdError(
                "PIQD discovery must receive proof_path=None"
            )
        _reject_symlinked_output_root(cnf_path.parent)
        self._assert_descriptor_current()
        if (
            _capture_regular(self.descriptor_path, maximum_bytes=MAX_DESCRIPTOR_BYTES)
            != self.descriptor_bytes
        ):
            raise Exact12NextRowStaticPiqdError("PIQD descriptor custody changed")
        _persist_current_cnf(cnf_path, self.request.current_dimacs)
        try:
            raw_result = self.runner(cnf_path, timeout_seconds, None)
        except Exact12NextRowStaticPiqdError:
            raise
        except Exception as exc:
            raise Exact12NextRowStaticPiqdError("PIQD discovery failed closed") from exc
        result = _validate_static_result(
            raw_result, num_variables=self.request.num_variables
        )
        _validate_receipt(
            result,
            request=self.request,
            source_sha256=sha256_bytes(self.source_manifest),
            producer_sha256=sha256_bytes(self.producer_manifest),
        )
        self._assert_descriptor_current()
        if _capture_regular(cnf_path, maximum_bytes=MAX_CNF_BYTES) != (
            self.request.current_dimacs
        ):
            raise Exact12NextRowStaticPiqdError("PIQD discovery CNF changed")
        if (
            _capture_regular(self.descriptor_path, maximum_bytes=MAX_DESCRIPTOR_BYTES)
            != self.descriptor_bytes
        ):
            raise Exact12NextRowStaticPiqdError("PIQD descriptor changed during solve")

        diagnostic = (result.stdout + "\n" + result.stderr)[-1000:]
        if result.verdict == "UNSAT":
            return CadicalResult("UNSAT", None, 20, False, diagnostic)
        if result.verdict == "UNKNOWN":
            return CadicalResult("UNKNOWN", None, 1, False, diagnostic)
        positive = frozenset(
            variable for variable, selected in result.assignment.items() if selected
        )
        if not cnf_assignment_satisfies(
            self.request.instance.clauses_with(),
            positive,
            n_variables=self.request.num_variables,
        ):
            raise Exact12NextRowStaticPiqdError(
                "PIQD SAT model failed independent exact-CNF replay"
            )
        try:
            cube = self.request.instance.decode_model(positive)
        except Exception as exc:
            raise Exact12NextRowStaticPiqdError(
                "PIQD SAT model failed independent cube decoding"
            ) from exc
        return CadicalResult("SAT", cube, 10, False, diagnostic, positive)


class Exact12StaticPiqdDiscoveryFactory:
    """Create one descriptor-bound static runner for each current formula."""

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
            raise Exact12NextRowStaticPiqdError("a nonempty PIQD URL is required")
        self.repo_root = repo_root.resolve()
        self.base_url = base_url
        self.journal_root = journal_root
        self.transport = transport
        self.sleep = sleep

    def __call__(self, request: StaticDiscoveryRequest) -> Exact12StaticPiqdDiscovery:
        descriptor = build_discovery_descriptor(request, repo_root=self.repo_root)
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
            raise Exact12NextRowStaticPiqdError(
                "PIQD static runner construction failed"
            ) from exc
        return Exact12StaticPiqdDiscovery(
            request=request,
            repo_root=self.repo_root,
            descriptor_path=descriptor_path,
            descriptor_bytes=descriptor_bytes,
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
            runner=runner,
        )


def run_exact12_static_piqd(
    repo_root: Path,
    workdir: Path,
    *,
    piqd_base_url: str,
    piqd_journal_root: Path,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
) -> dict[str, Any]:
    """Run cell 1 with PIQD only at the per-iteration discovery seam."""

    factory = Exact12StaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url=piqd_base_url,
        journal_root=piqd_journal_root,
        transport=transport,
        sleep=sleep,
    )
    return run_static_cegar(
        repo_root,
        workdir,
        CELL_INDEX,
        max_iterations=max_iterations,
        timeout_seconds=timeout_seconds,
        nice=nice,
        seed_journal=seed_journal,
        discovery_solver_factory=factory,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--piqd-base-url", required=True)
    parser.add_argument("--piqd-journal-root", type=Path, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    args = parser.parse_args()
    try:
        result = run_exact12_static_piqd(
            args.repo_root,
            args.workdir,
            piqd_base_url=args.piqd_base_url,
            piqd_journal_root=args.piqd_journal_root,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
        )
    except (Exact12NextRowStaticPiqdError, StaticPiqdRunnerError, OSError) as exc:
        print(json.dumps({"status": "PIPELINE_ERROR", "error": str(exc)}))
        return 2
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if result["status"].startswith("UNSAT_DRAT_VERIFIED") else 1


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "CELL_INDEX",
    "DESCRIPTOR_SCHEMA",
    "PIQD_PROJECT",
    "Exact12NextRowStaticPiqdError",
    "Exact12StaticPiqdDiscovery",
    "Exact12StaticPiqdDiscoveryFactory",
    "build_discovery_descriptor",
    "run_exact12_static_piqd",
]
