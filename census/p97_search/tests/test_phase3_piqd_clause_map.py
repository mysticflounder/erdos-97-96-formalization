from __future__ import annotations

import copy
import hashlib
import json
import sys
from dataclasses import FrozenInstanceError, replace

import pytest

from census.p97_search.phase3_piqd_clause_map import (
    CERTIFICATE_BOUNDARY,
    CLAUSE_MAP_VERSION,
    EXPANSION_RULE,
    ClauseMapContractError,
    consume_clause_map,
)
from census.p97_search.phase3_piqd_oracle import PreparedJob


def digest(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def clause_digest(clause: tuple[int, ...]) -> str:
    body = "".join(f"{literal} " for literal in clause) + "0"
    return digest(body.encode("ascii"))


def parse_fixture(cnf: bytes) -> tuple[int, list[tuple[int, ...]]]:
    num_vars: int | None = None
    clauses: list[tuple[int, ...]] = []
    current: list[int] = []
    for raw_line in cnf.decode("ascii").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("c"):
            continue
        if line.startswith("p"):
            num_vars = int(line.split()[2])
            continue
        for token in line.split():
            literal = int(token)
            if literal == 0:
                clauses.append(tuple(current))
                current.clear()
            else:
                current.append(literal)
    assert num_vars is not None and not current
    return num_vars, clauses


def normalize(clause: tuple[int, ...]) -> tuple[int, ...] | None:
    seen: set[int] = set()
    kept: list[int] = []
    for literal in clause:
        if -literal in seen:
            return None
        if literal not in seen:
            seen.add(literal)
            kept.append(literal)
    return tuple(kept)


def fixture_payload(cnf: bytes) -> dict[str, object]:
    num_vars, clauses = parse_fixture(cnf)
    kept: list[tuple[int, ...]] = []
    exceptions: list[dict[str, object]] = []
    for submitted_id, clause in enumerate(clauses, start=1):
        normalized = normalize(clause)
        if normalized is None:
            exceptions.append(
                {
                    "submitted_id": submitted_id,
                    "kind": "dropped_tautology",
                    "submitted_sha256": clause_digest(clause),
                }
            )
            continue
        kept.append(normalized)
        if normalized != clause:
            exceptions.append(
                {
                    "submitted_id": submitted_id,
                    "kind": "deduped_literals",
                    "submitted_sha256": clause_digest(clause),
                    "normalized_sha256": clause_digest(normalized),
                    "normalized_literals": list(normalized),
                }
            )
    kept_lines = [f"p cnf {num_vars} {len(kept)}"]
    kept_lines.extend(
        "".join(f"{literal} " for literal in clause) + "0" for clause in kept
    )
    kept_bytes = ("\n".join(kept_lines) + "\n").encode("ascii")
    return {
        "version": CLAUSE_MAP_VERSION,
        "submitted_sha256": digest(cnf),
        "submitted_clauses": len(clauses),
        "kept_sha256": digest(kept_bytes),
        "kept_clauses": len(kept),
        "exceptions": exceptions,
        "expansion_rule": EXPANSION_RULE,
        "boundary": CERTIFICATE_BOUNDARY,
    }


def response_bytes(payload: dict[str, object]) -> bytes:
    return json.dumps(payload, separators=(",", ":")).encode("utf-8")


def prepared_job(cnf: bytes, *, backend: str = "cadical") -> PreparedJob:
    num_vars, clauses = parse_fixture(cnf)
    return PreparedJob(
        job_id="fixture-job",
        backend=backend,
        solver_profile="unsat",
        cnf_blob_hash=digest(cnf),
        identity_hash="a" * 64,
        num_vars=num_vars,
        num_clauses=len(clauses),
        existing=False,
        requested_core_limit=1,
    )


def consume(cnf: bytes, payload: dict[str, object] | None = None):
    actual_payload = fixture_payload(cnf) if payload is None else payload
    raw_response = response_bytes(actual_payload)
    return consume_clause_map(raw_response, cnf, prepared_job(cnf))


def test_comments_and_noncanonical_clean_input_are_content_identity() -> None:
    cnf = b"c retained only in submitted bytes\n  p cnf 3 2  \n1   2  0\n\n -3 0\n"
    validated = consume(cnf)

    assert validated.submitted_sha256 == digest(cnf)
    assert validated.submitted_sha256 != validated.kept_sha256
    assert validated.canonical_kept_cnf == b"p cnf 3 2\n1 2 0\n-3 0\n"
    assert digest(validated.canonical_kept_cnf) == validated.kept_sha256
    assert validated.exceptions == ()
    assert validated.numbering_identity is True
    assert validated.content_identity is True
    assert validated.certificate_id(1) == 1
    assert validated.certificate_id(2) == 2
    assert validated.response_sha256 == digest(response_bytes(fixture_payload(cnf)))
    with pytest.raises(FrozenInstanceError):
        validated.kept_clauses = 0  # type: ignore[misc]


@pytest.mark.parametrize(
    "cnf",
    [
        b"p cnf 2 1\n1\n2 0\n",
        b"p cnf 2 2\n1 0 -2 0\n",
    ],
)
def test_exact_dimacs_token_stream_is_not_tied_to_physical_lines(cnf: bytes) -> None:
    validated = consume(cnf)
    assert validated.submitted_clauses in {1, 2}
    assert validated.content_identity is True
    assert validated.certificate_id(validated.submitted_clauses) == (
        validated.submitted_clauses
    )


@pytest.mark.parametrize(
    "cnf",
    [
        b"p cnf 1_0 1\n1 0\n",
        b"p cnf 10 1_0\n1 0\n",
        b"p cnf 10 1\n1_0 0\n",
    ],
)
def test_python_only_underscore_integer_syntax_is_rejected(cnf: bytes) -> None:
    with pytest.raises(ClauseMapContractError, match="integer|token"):
        consume(cnf)


def test_i32_min_is_rejected_before_clause_normalization() -> None:
    cnf = b"p cnf 2147483648 1\n-2147483648 0\n"
    with pytest.raises(ClauseMapContractError, match="PIQD range"):
        consume(cnf)


def test_dedup_only_preserves_numbering_but_not_content() -> None:
    cnf = b"p cnf 3 2\n1 1 2 0\n-3 0\n"
    validated = consume(cnf)
    exception = validated.exceptions[0]

    assert validated.numbering_identity is True
    assert validated.content_identity is False
    assert validated.certificate_id(1) == 1
    assert validated.certificate_id(2) == 2
    assert exception.kind == "deduped_literals"
    assert exception.submitted_sha256 == clause_digest((1, 1, 2))
    assert exception.normalized_sha256 == clause_digest((1, 2))
    assert exception.normalized_literals == (1, 2)


def test_tautologies_shift_later_certificate_ids_and_bind_all_counts() -> None:
    cnf = b"p cnf 4 4\n1 1 2 0\n3 -3 4 0\n4 4 0\n-1 0\n"
    validated = consume(cnf)

    assert validated.submitted_clauses == 4
    assert validated.kept_clauses == 3
    assert [exception.submitted_id for exception in validated.exceptions] == [1, 2, 3]
    assert validated.numbering_identity is False
    assert validated.content_identity is False
    assert [validated.certificate_id(index) for index in range(1, 5)] == [
        1,
        None,
        2,
        3,
    ]
    with pytest.raises(ClauseMapContractError, match="submitted_id"):
        validated.certificate_id(0)
    with pytest.raises(ClauseMapContractError, match="submitted_id"):
        validated.certificate_id(True)
    with pytest.raises(ClauseMapContractError, match="submitted_id"):
        validated.certificate_id(5)


@pytest.mark.parametrize(
    "mutation",
    [
        lambda exceptions: exceptions.append(
            {
                "submitted_id": 4,
                "kind": "deduped_literals",
                "submitted_sha256": "0" * 64,
                "normalized_sha256": "1" * 64,
                "normalized_literals": [4],
            }
        ),
        lambda exceptions: exceptions.pop(),
        lambda exceptions: exceptions.reverse(),
        lambda exceptions: exceptions.insert(1, copy.deepcopy(exceptions[0])),
        lambda exceptions: exceptions[0].__setitem__("submitted_id", 0),
        lambda exceptions: exceptions[0].__setitem__("submitted_id", 5),
    ],
    ids=["spurious", "missing", "reordered", "duplicate", "zero", "out-of-range"],
)
def test_exception_list_must_be_ordered_unique_and_complete(mutation) -> None:
    cnf = b"p cnf 4 4\n1 1 2 0\n3 -3 4 0\n4 4 0\n-1 0\n"
    payload = fixture_payload(cnf)
    exceptions = payload["exceptions"]
    assert isinstance(exceptions, list)
    mutation(exceptions)

    with pytest.raises(ClauseMapContractError):
        consume(cnf, payload)


@pytest.mark.parametrize(
    ("field", "bad_value"),
    [
        ("submitted_sha256", "A" * 64),
        ("submitted_sha256", "0" * 63),
        ("kept_sha256", "b" * 64),
        ("submitted_clauses", True),
        ("submitted_clauses", 3),
        ("kept_clauses", 3),
    ],
)
def test_artifact_hashes_and_counts_are_exact(field: str, bad_value: object) -> None:
    cnf = b"p cnf 2 2\n1 1 0\n-2 0\n"
    payload = fixture_payload(cnf)
    payload[field] = bad_value
    with pytest.raises(ClauseMapContractError):
        consume(cnf, payload)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda exception: exception.__setitem__("submitted_sha256", "0" * 64),
        lambda exception: exception.__setitem__("normalized_sha256", "1" * 64),
        lambda exception: exception.__setitem__("normalized_literals", [2, 1]),
        lambda exception: exception.__setitem__("normalized_literals", [1, 0]),
        lambda exception: exception.__setitem__("extra", False),
        lambda exception: exception.__setitem__("kind", "changed"),
    ],
)
def test_exception_hashes_literals_and_shape_are_exact(mutate) -> None:
    cnf = b"p cnf 2 1\n1 1 2 0\n"
    payload = fixture_payload(cnf)
    exceptions = payload["exceptions"]
    assert isinstance(exceptions, list) and isinstance(exceptions[0], dict)
    mutate(exceptions[0])
    with pytest.raises(ClauseMapContractError):
        consume(cnf, payload)


def test_dropped_exception_must_omit_normalized_fields() -> None:
    cnf = b"p cnf 1 1\n1 -1 0\n"
    payload = fixture_payload(cnf)
    exceptions = payload["exceptions"]
    assert isinstance(exceptions, list) and isinstance(exceptions[0], dict)
    exceptions[0]["normalized_sha256"] = None
    exceptions[0]["normalized_literals"] = None
    with pytest.raises(ClauseMapContractError, match="keys mismatch"):
        consume(cnf, payload)


@pytest.mark.parametrize(
    ("field", "bad_value"),
    [
        ("version", "piqd-clause-map/v2"),
        ("expansion_rule", EXPANSION_RULE + " "),
        ("boundary", CERTIFICATE_BOUNDARY + " "),
    ],
)
def test_fixed_contract_strings_cannot_drift(field: str, bad_value: str) -> None:
    cnf = b"p cnf 1 1\n1 0\n"
    payload = fixture_payload(cnf)
    payload[field] = bad_value
    with pytest.raises(ClauseMapContractError):
        consume(cnf, payload)


def test_unknown_top_level_key_is_rejected() -> None:
    cnf = b"p cnf 1 1\n1 0\n"
    payload = fixture_payload(cnf)
    payload["future"] = None
    with pytest.raises(ClauseMapContractError, match="unknown"):
        consume(cnf, payload)


@pytest.mark.parametrize(
    "raw",
    [
        b'{"version":"piqd-clause-map/v1","version":"piqd-clause-map/v1"}',
        b'{"version":NaN}',
        b"[]",
        b"\xff",
    ],
)
def test_json_boundary_rejects_duplicates_nonfinite_and_nonobjects(raw: bytes) -> None:
    cnf = b"p cnf 0 0\n"
    with pytest.raises(ClauseMapContractError, match="JSON|root"):
        consume_clause_map(raw, cnf, prepared_job(cnf))


class StrSubclass(str):
    pass


@pytest.mark.parametrize(
    "job",
    [
        replace(prepared_job(b"p cnf 0 0\n"), backend=StrSubclass("cadical")),
        replace(prepared_job(b"p cnf 0 0\n"), num_clauses=False),
        replace(prepared_job(b"p cnf 0 0\n"), existing=1),
        replace(prepared_job(b"p cnf 0 0\n"), backend="march_cu"),
        replace(prepared_job(b"p cnf 0 0\n"), solver_profile="future"),
        replace(prepared_job(b"p cnf 0 0\n"), cnf_blob_hash="A" * 64),
    ],
)
def test_job_identity_requires_exact_cadical_compatible_builtin_fields(job) -> None:
    cnf = b"p cnf 0 0\n"
    with pytest.raises(ClauseMapContractError):
        consume_clause_map(response_bytes(fixture_payload(cnf)), cnf, job)


def test_exact_cnf_hash_and_job_counts_are_bound_independently() -> None:
    cnf = b"p cnf 2 1\n1 0\n"
    raw = response_bytes(fixture_payload(cnf))
    job = prepared_job(cnf)

    with pytest.raises(ClauseMapContractError, match="cnf_blob_hash"):
        consume_clause_map(raw, cnf, replace(job, cnf_blob_hash="0" * 64))
    with pytest.raises(ClauseMapContractError, match="variable count"):
        consume_clause_map(raw, cnf, replace(job, num_vars=1))
    with pytest.raises(ClauseMapContractError, match="clause count"):
        consume_clause_map(raw, cnf, replace(job, num_clauses=2))


def test_all_claim_and_handoff_boundaries_remain_false() -> None:
    validated = consume(b"p cnf 0 0\n")
    assert validated.producer_provenance_authenticated is False
    assert validated.certificate_proof_linkage_authenticated is False
    assert validated.source_entitlement_established is False
    assert validated.source_coverage_established is False
    assert validated.universal_result_established is False
    assert validated.lean_closure_established is False
    assert validated.boundary == CERTIFICATE_BOUNDARY


def test_two_million_clause_identity_map_stays_sparse() -> None:
    clause_count = 2_000_000
    cnf = f"p cnf 0 {clause_count}\n".encode("ascii") + b"0\n" * clause_count
    kept_hash = digest(cnf)
    payload: dict[str, object] = {
        "version": CLAUSE_MAP_VERSION,
        "submitted_sha256": kept_hash,
        "submitted_clauses": clause_count,
        "kept_sha256": kept_hash,
        "kept_clauses": clause_count,
        "exceptions": [],
        "expansion_rule": EXPANSION_RULE,
        "boundary": CERTIFICATE_BOUNDARY,
    }

    validated = consume(cnf, payload)

    assert validated.exceptions == ()
    assert validated._dropped_ids == ()
    assert validated.canonical_kept_cnf == cnf
    assert validated.certificate_id(clause_count) == clause_count
    assert sys.getsizeof(validated) < 1024
