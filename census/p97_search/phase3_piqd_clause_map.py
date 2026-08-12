"""Strict independent consumer for PIQD's sparse clause-map v1 artifact.

The response is treated as an untrusted claim.  This module reparses the exact
submitted DIMACS bytes, recomputes every normalization exception, and hashes
the canonical kept CNF without constructing a dense clause-id map.
"""

from __future__ import annotations

import hashlib
import io
import json
from bisect import bisect_left
from collections.abc import Callable
from dataclasses import dataclass, field
from itertools import pairwise
from typing import Any

from census.p97_search.phase3_piqd_oracle import PreparedJob

CLAUSE_MAP_VERSION = "piqd-clause-map/v1"
EXPANSION_RULE = (
    "Walk submitted ids 1..=submitted_clauses in order, keeping a running count "
    "of dropped_tautology exceptions already seen. A submitted id listed as "
    "dropped_tautology has certificate id null; every other submitted id n has "
    "certificate id n minus the number of dropped_tautology exceptions with a "
    "smaller submitted_id. A deduped_literals entry keeps a certificate id under "
    "that rule; only its content changed. Clauses not listed are unchanged in "
    "both id and content."
)
CERTIFICATE_BOUNDARY = (
    "LRAT proves the final strengthened CNF unsatisfiable. It does not by itself "
    "prove that CEGAR-added clauses follow from the original encoding."
)

_MAP_KEYS = frozenset(
    {
        "version",
        "submitted_sha256",
        "submitted_clauses",
        "kept_sha256",
        "kept_clauses",
        "exceptions",
        "expansion_rule",
        "boundary",
    }
)
_DROPPED_KEYS = frozenset({"submitted_id", "kind", "submitted_sha256"})
_DEDUPED_KEYS = frozenset(
    {
        "submitted_id",
        "kind",
        "submitted_sha256",
        "normalized_sha256",
        "normalized_literals",
    }
)
_LOWER_HEX = frozenset("0123456789abcdef")
_U32_MAX = (1 << 32) - 1
_U64_MAX = (1 << 64) - 1
_I32_MAX = (1 << 31) - 1


class ClauseMapContractError(ValueError):
    """The response, submitted CNF, or job binding violates the v1 contract."""


@dataclass(frozen=True, slots=True)
class ClauseException:
    """One submitted clause that PIQD does not carry through unchanged."""

    submitted_id: int
    kind: str
    submitted_sha256: str
    normalized_sha256: str | None = None
    normalized_literals: tuple[int, ...] | None = None


@dataclass(frozen=True, slots=True)
class ValidatedClauseMap:
    """An immutable, independently checked sparse clause map.

    The false fields are deliberate boundary statements.  Clause-map validation
    does not authenticate producer provenance or proof linkage, and it proves no
    source entitlement, source coverage, universal result, or Lean closure.
    """

    version: str
    response_sha256: str
    job_id: str
    job_identity_hash: str
    backend: str
    solver_profile: str
    submitted_sha256: str
    submitted_clauses: int
    kept_sha256: str
    kept_clauses: int
    canonical_kept_cnf: bytes
    exceptions: tuple[ClauseException, ...]
    expansion_rule: str
    boundary: str
    producer_provenance_authenticated: bool = field(default=False, init=False)
    certificate_proof_linkage_authenticated: bool = field(default=False, init=False)
    source_entitlement_established: bool = field(default=False, init=False)
    source_coverage_established: bool = field(default=False, init=False)
    universal_result_established: bool = field(default=False, init=False)
    lean_closure_established: bool = field(default=False, init=False)
    _dropped_ids: tuple[int, ...] = field(default=(), repr=False)

    @property
    def numbering_identity(self) -> bool:
        """Whether every submitted clause keeps the same certificate id."""

        return not self._dropped_ids

    @property
    def content_identity(self) -> bool:
        """Whether every submitted clause also keeps identical literal content."""

        return not self.exceptions

    def certificate_id(self, submitted_id: int) -> int | None:
        """Return the 1-based certificate id without expanding a dense map."""

        _require_builtin_int(
            submitted_id,
            "submitted_id",
            minimum=1,
            maximum=self.submitted_clauses,
        )
        dropped_before = bisect_left(self._dropped_ids, submitted_id)
        if (
            dropped_before < len(self._dropped_ids)
            and self._dropped_ids[dropped_before] == submitted_id
        ):
            return None
        return submitted_id - dropped_before


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"nonstandard JSON constant: {value}")


def _reject_duplicate_json_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON object key: {key}")
        result[key] = value
    return result


def _require_exact_keys(
    value: dict[str, Any], expected: frozenset[str], where: str
) -> None:
    actual = frozenset(value)
    if actual != expected:
        missing = sorted(expected - actual)
        unknown = sorted(actual - expected)
        raise ClauseMapContractError(
            f"{where} keys mismatch: missing={missing}, unknown={unknown}"
        )


def _require_builtin_str(value: object, field_name: str) -> str:
    if type(value) is not str:
        raise ClauseMapContractError(f"{field_name} must be a builtin str")
    return value


def _require_builtin_int(
    value: object,
    field_name: str,
    *,
    minimum: int,
    maximum: int,
) -> int:
    if type(value) is not int or not minimum <= value <= maximum:
        raise ClauseMapContractError(
            f"{field_name} must be a builtin int in {minimum}..={maximum}"
        )
    return value


def _require_sha256(value: object, field_name: str) -> str:
    digest = _require_builtin_str(value, field_name)
    if len(digest) != 64 or any(char not in _LOWER_HEX for char in digest):
        raise ClauseMapContractError(
            f"{field_name} must be a lowercase 64-character SHA-256"
        )
    return digest


def _parse_response(response_bytes: bytes) -> dict[str, Any]:
    if type(response_bytes) is not bytes:
        raise ClauseMapContractError("response_bytes must be builtin bytes")
    try:
        decoded = response_bytes.decode("utf-8")
        value = json.loads(
            decoded,
            object_pairs_hook=_reject_duplicate_json_keys,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise ClauseMapContractError("clause-map response is not strict JSON") from exc
    if type(value) is not dict:
        raise ClauseMapContractError("clause-map response root must be an object")
    _require_exact_keys(value, _MAP_KEYS, "clause-map response")
    return value


def _clause_sha256(literals: tuple[int, ...]) -> str:
    body = "".join(f"{literal} " for literal in literals) + "0"
    return hashlib.sha256(body.encode("ascii")).hexdigest()


def _normalize_clause(
    clause: tuple[int, ...],
) -> tuple[str, tuple[int, ...] | None]:
    seen: set[int] = set()
    normalized: list[int] = []
    for literal in clause:
        if -literal in seen:
            return "dropped_tautology", None
        if literal not in seen:
            seen.add(literal)
            normalized.append(literal)
    if len(normalized) != len(clause):
        return "deduped_literals", tuple(normalized)
    return "unchanged", clause


ClauseVisitor = Callable[[int, tuple[int, ...]], None]


def _parse_dimacs_integer(token: str) -> int:
    """Match Rust integer FromStr syntax, excluding Python-only underscores."""

    digits = token[1:] if token.startswith(("+", "-")) else token
    if not digits or any(character < "0" or character > "9" for character in digits):
        raise ValueError("DIMACS integer token is not signed decimal")
    return int(token, 10)


def _scan_dimacs(cnf: bytes, visitor: ClauseVisitor) -> tuple[int, int]:
    """Scan strict raw DIMACS with memory bounded by one clause."""

    header: tuple[int, int] | None = None
    current: list[int] = []
    actual_clauses = 0

    for line_number, raw_line in enumerate(io.BytesIO(cnf), start=1):
        try:
            line = raw_line.decode("ascii").strip()
        except UnicodeDecodeError as exc:
            raise ClauseMapContractError("submitted DIMACS must be ASCII") from exc
        if not line or line.startswith("c"):
            continue
        if line.startswith("p"):
            if header is not None:
                raise ClauseMapContractError("submitted DIMACS has multiple headers")
            parts = line.split()
            if len(parts) != 4 or parts[:2] != ["p", "cnf"]:
                raise ClauseMapContractError(
                    f"malformed submitted DIMACS header on line {line_number}"
                )
            try:
                num_vars = _parse_dimacs_integer(parts[2])
                declared_clauses = _parse_dimacs_integer(parts[3])
            except ValueError as exc:
                raise ClauseMapContractError(
                    "submitted DIMACS header counts must be integers"
                ) from exc
            if not 0 <= num_vars <= _U32_MAX:
                raise ClauseMapContractError(
                    f"submitted DIMACS num_vars must be in 0..={_U32_MAX}"
                )
            if not 0 <= declared_clauses <= _U64_MAX:
                raise ClauseMapContractError(
                    f"submitted DIMACS clause count must be in 0..={_U64_MAX}"
                )
            header = (num_vars, declared_clauses)
            continue
        if header is None:
            raise ClauseMapContractError(
                "submitted DIMACS literal appears before its header"
            )
        num_vars = header[0]
        for token in line.split():
            try:
                literal = _parse_dimacs_integer(token)
            except ValueError as exc:
                raise ClauseMapContractError(
                    f"invalid submitted DIMACS token {token!r} on line {line_number}"
                ) from exc
            if literal == 0:
                actual_clauses += 1
                visitor(actual_clauses, tuple(current))
                current.clear()
                continue
            if not -_I32_MAX <= literal <= _I32_MAX or abs(literal) > num_vars:
                raise ClauseMapContractError(
                    f"submitted DIMACS literal {literal} is outside the PIQD range"
                )
            current.append(literal)

    if header is None:
        raise ClauseMapContractError("submitted DIMACS header is missing")
    if current:
        raise ClauseMapContractError(
            "final submitted DIMACS clause is missing its zero terminator"
        )
    if actual_clauses != header[1]:
        raise ClauseMapContractError(
            f"submitted DIMACS declares {header[1]} clauses but contains "
            f"{actual_clauses}"
        )
    return header[0], actual_clauses


def _parse_exception(
    value: object, index: int, submitted_clauses: int
) -> ClauseException:
    where = f"exceptions[{index}]"
    if type(value) is not dict:
        raise ClauseMapContractError(f"{where} must be an object")
    kind = _require_builtin_str(value.get("kind"), f"{where}.kind")
    if kind == "dropped_tautology":
        _require_exact_keys(value, _DROPPED_KEYS, where)
    elif kind == "deduped_literals":
        _require_exact_keys(value, _DEDUPED_KEYS, where)
    else:
        raise ClauseMapContractError(f"{where}.kind is unsupported")

    submitted_id = _require_builtin_int(
        value["submitted_id"],
        f"{where}.submitted_id",
        minimum=1,
        maximum=submitted_clauses,
    )
    submitted_sha256 = _require_sha256(
        value["submitted_sha256"], f"{where}.submitted_sha256"
    )
    if kind == "dropped_tautology":
        return ClauseException(submitted_id, kind, submitted_sha256)

    normalized_sha256 = _require_sha256(
        value["normalized_sha256"], f"{where}.normalized_sha256"
    )
    raw_literals = value["normalized_literals"]
    if type(raw_literals) is not list:
        raise ClauseMapContractError(f"{where}.normalized_literals must be an array")
    normalized_literals = tuple(
        _require_builtin_int(
            literal,
            f"{where}.normalized_literals[{literal_index}]",
            minimum=-_I32_MAX,
            maximum=_I32_MAX,
        )
        for literal_index, literal in enumerate(raw_literals)
    )
    if any(literal == 0 for literal in normalized_literals):
        raise ClauseMapContractError(
            f"{where}.normalized_literals must not contain zero"
        )
    return ClauseException(
        submitted_id,
        kind,
        submitted_sha256,
        normalized_sha256,
        normalized_literals,
    )


def _validate_job(job: PreparedJob) -> None:
    if type(job) is not PreparedJob:
        raise ClauseMapContractError("job must be an exact PreparedJob")
    _require_builtin_str(job.job_id, "job.job_id")
    if not job.job_id:
        raise ClauseMapContractError("job.job_id must be nonempty")
    backend = _require_builtin_str(job.backend, "job.backend")
    if backend != "cadical":
        raise ClauseMapContractError("clause-map consumer requires a cadical job")
    profile = _require_builtin_str(job.solver_profile, "job.solver_profile")
    if profile not in {"sat", "unsat", "plain", "default"}:
        raise ClauseMapContractError("job.solver_profile is not cadical-compatible")
    _require_sha256(job.cnf_blob_hash, "job.cnf_blob_hash")
    _require_sha256(job.identity_hash, "job.identity_hash")
    _require_builtin_int(job.num_vars, "job.num_vars", minimum=0, maximum=_U32_MAX)
    _require_builtin_int(
        job.num_clauses,
        "job.num_clauses",
        minimum=0,
        maximum=_U64_MAX,
    )
    if type(job.existing) is not bool:
        raise ClauseMapContractError("job.existing must be a builtin bool")
    if job.requested_core_limit is not None:
        _require_builtin_int(
            job.requested_core_limit,
            "job.requested_core_limit",
            minimum=1,
            maximum=1024,
        )


def consume_clause_map(
    response_bytes: bytes,
    submitted_cnf: bytes,
    job: PreparedJob,
) -> ValidatedClauseMap:
    """Fail closed unless PIQD's clause-map exactly matches independent semantics."""

    if type(submitted_cnf) is not bytes:
        raise ClauseMapContractError("submitted_cnf must be builtin bytes")
    _validate_job(job)
    payload = _parse_response(response_bytes)

    version = _require_builtin_str(payload["version"], "version")
    if version != CLAUSE_MAP_VERSION:
        raise ClauseMapContractError("unsupported clause-map version")
    expansion_rule = _require_builtin_str(payload["expansion_rule"], "expansion_rule")
    if expansion_rule != EXPANSION_RULE:
        raise ClauseMapContractError("clause-map expansion_rule drift")
    boundary = _require_builtin_str(payload["boundary"], "boundary")
    if boundary != CERTIFICATE_BOUNDARY:
        raise ClauseMapContractError("clause-map boundary drift")

    submitted_sha256 = _require_sha256(payload["submitted_sha256"], "submitted_sha256")
    submitted_clauses = _require_builtin_int(
        payload["submitted_clauses"],
        "submitted_clauses",
        minimum=0,
        maximum=_U64_MAX,
    )
    kept_sha256 = _require_sha256(payload["kept_sha256"], "kept_sha256")
    kept_clauses = _require_builtin_int(
        payload["kept_clauses"],
        "kept_clauses",
        minimum=0,
        maximum=_U64_MAX,
    )
    raw_exceptions = payload["exceptions"]
    if type(raw_exceptions) is not list:
        raise ClauseMapContractError("exceptions must be an array")
    exceptions = tuple(
        _parse_exception(value, index, submitted_clauses)
        for index, value in enumerate(raw_exceptions)
    )
    exception_ids = tuple(exception.submitted_id for exception in exceptions)
    if any(left >= right for left, right in pairwise(exception_ids)):
        raise ClauseMapContractError(
            "exceptions must have ordered unique submitted_id values"
        )

    exact_submitted_hash = hashlib.sha256(submitted_cnf).hexdigest()
    if submitted_sha256 != exact_submitted_hash:
        raise ClauseMapContractError("submitted_sha256 does not match exact CNF bytes")
    if job.cnf_blob_hash != exact_submitted_hash:
        raise ClauseMapContractError("job.cnf_blob_hash does not match exact CNF bytes")

    recomputed: list[ClauseException] = []
    independently_kept = 0

    def collect_exception(submitted_id: int, clause: tuple[int, ...]) -> None:
        nonlocal independently_kept
        kind, normalized = _normalize_clause(clause)
        submitted_hash = _clause_sha256(clause)
        if kind == "dropped_tautology":
            recomputed.append(ClauseException(submitted_id, kind, submitted_hash))
            return
        independently_kept += 1
        if kind == "deduped_literals":
            assert normalized is not None
            recomputed.append(
                ClauseException(
                    submitted_id,
                    kind,
                    submitted_hash,
                    _clause_sha256(normalized),
                    normalized,
                )
            )

    num_vars, actual_submitted = _scan_dimacs(submitted_cnf, collect_exception)
    if actual_submitted != submitted_clauses or actual_submitted != job.num_clauses:
        raise ClauseMapContractError(
            "submitted clause count does not match response and job"
        )
    if num_vars != job.num_vars:
        raise ClauseMapContractError("submitted variable count does not match job")
    if independently_kept != kept_clauses:
        raise ClauseMapContractError(
            "kept clause count does not match independent scan"
        )
    if tuple(recomputed) != exceptions:
        raise ClauseMapContractError(
            "exceptions are not the ordered, unique, complete independent list"
        )

    kept_output = io.BytesIO()
    kept_output.write(f"p cnf {num_vars} {independently_kept}\n".encode("ascii"))

    def hash_kept(_submitted_id: int, clause: tuple[int, ...]) -> None:
        _kind, normalized = _normalize_clause(clause)
        if normalized is not None:
            body = "".join(f"{literal} " for literal in normalized) + "0\n"
            kept_output.write(body.encode("ascii"))

    _scan_dimacs(submitted_cnf, hash_kept)
    canonical_kept_cnf = kept_output.getvalue()
    if hashlib.sha256(canonical_kept_cnf).hexdigest() != kept_sha256:
        raise ClauseMapContractError(
            "kept_sha256 does not match independently reconstructed canonical CNF"
        )

    dropped_ids = tuple(
        exception.submitted_id
        for exception in exceptions
        if exception.kind == "dropped_tautology"
    )
    return ValidatedClauseMap(
        version=version,
        response_sha256=hashlib.sha256(response_bytes).hexdigest(),
        job_id=job.job_id,
        job_identity_hash=job.identity_hash,
        backend=job.backend,
        solver_profile=job.solver_profile,
        submitted_sha256=submitted_sha256,
        submitted_clauses=submitted_clauses,
        kept_sha256=kept_sha256,
        kept_clauses=kept_clauses,
        canonical_kept_cnf=canonical_kept_cnf,
        exceptions=exceptions,
        expansion_rule=expansion_rule,
        boundary=boundary,
        _dropped_ids=dropped_ids,
    )


__all__ = [
    "CERTIFICATE_BOUNDARY",
    "CLAUSE_MAP_VERSION",
    "EXPANSION_RULE",
    "ClauseException",
    "ClauseMapContractError",
    "ValidatedClauseMap",
    "consume_clause_map",
]
