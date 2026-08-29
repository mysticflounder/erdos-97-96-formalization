"""Authenticated clause-class inventory for maintained structural CEGAR formulas."""

from __future__ import annotations

import hashlib
import json
import re
from collections.abc import Mapping, Sequence
from typing import Any

SOURCE_SCHEMA = "p97-cegar-clause-source-inventory/v1"
BOUND_SCHEMA = "p97-cegar-solver-formula-clause-contract/v1"
BUCKET_SPECS = (
    ("root_static", "ROOT_STATIC", "ROOT_BRIDGE_REQUIRED"),
    ("assumption_control", "ASSUMPTION_CONTROL", "ASSUMPTION_CONTRACT_REQUIRED"),
    ("learned_candidate", "LEARNED_CANDIDATE", "F1_F7_EVIDENCE_REQUIRED"),
    ("enumeration_control", "ENUMERATION_CONTROL", "SCOPED_DISCHARGE_REQUIRED"),
)
_SHA256 = re.compile(r"[0-9a-f]{64}")


class ClauseContractError(ValueError):
    """Raised when a clause inventory or formula binding is malformed."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _normalize_clauses(
    clauses: Sequence[Sequence[int]], *, variable_count: int, where: str
) -> tuple[tuple[int, ...], ...]:
    result: list[tuple[int, ...]] = []
    for clause_index, raw_clause in enumerate(clauses):
        if not isinstance(raw_clause, Sequence):
            raise ClauseContractError(
                f"{where} clause {clause_index} is not a sequence"
            )
        clause: list[int] = []
        for literal in raw_clause:
            if type(literal) is not int or literal == 0:
                raise ClauseContractError(
                    f"{where} clause {clause_index} has a malformed literal"
                )
            if abs(literal) > variable_count:
                raise ClauseContractError(
                    f"{where} clause {clause_index} exceeds the variable namespace"
                )
            clause.append(literal)
        result.append(tuple(clause))
    return tuple(result)


def _record_identity(
    records: Sequence[Mapping[str, Any]], *, clause_count: int, where: str
) -> dict[str, Any]:
    if len(records) != clause_count:
        raise ClauseContractError(f"{where} record/clause count mismatch")
    hashes: list[str] = []
    for index, record in enumerate(records):
        value = record.get("record_sha256")
        if not isinstance(value, str) or _SHA256.fullmatch(value) is None:
            raise ClauseContractError(f"{where} record {index} has no valid hash")
        hashes.append(value)
    return {
        "record_count": len(hashes),
        "record_sequence_sha256": _sha256_value(hashes),
        "record_head_sha256": hashes[-1] if hashes else None,
    }


def _bucket(
    name: str,
    clause_class: str,
    blocker: str,
    clauses: tuple[tuple[int, ...], ...],
    records: Sequence[Mapping[str, Any]] | None,
) -> dict[str, Any]:
    result = {
        "name": name,
        "clause_class": clause_class,
        "clause_count": len(clauses),
        "ordered_clause_sha256": _sha256_value(clauses),
        "promotion_evidence": None,
        "promotion_blocker": blocker,
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
    }
    if records is not None:
        result["record_identity"] = _record_identity(
            records, clause_count=len(clauses), where=name
        )
    else:
        result["record_identity"] = None
    return result


def build_source_inventory(
    *,
    variable_count: int,
    root_clauses: Sequence[Sequence[int]],
    assumption_clauses: Sequence[Sequence[int]],
    learned_records: Sequence[Mapping[str, Any]],
    learned_clauses: Sequence[Sequence[int]],
    survivor_records: Sequence[Mapping[str, Any]],
    survivor_clauses: Sequence[Sequence[int]],
    rendered_source_cnf: bytes,
) -> tuple[tuple[tuple[int, ...], ...], dict[str, Any]]:
    """Assemble the only admitted bucket order and authenticate every clause."""

    if type(variable_count) is not int or variable_count < 0:
        raise ClauseContractError("variable count is invalid")
    raw_buckets = (
        _normalize_clauses(
            root_clauses, variable_count=variable_count, where="root_static"
        ),
        _normalize_clauses(
            assumption_clauses,
            variable_count=variable_count,
            where="assumption_control",
        ),
        _normalize_clauses(
            learned_clauses,
            variable_count=variable_count,
            where="learned_candidate",
        ),
        _normalize_clauses(
            survivor_clauses,
            variable_count=variable_count,
            where="enumeration_control",
        ),
    )
    records = (None, None, learned_records, survivor_records)
    buckets = [
        _bucket(name, clause_class, blocker, clauses, bucket_records)
        for (name, clause_class, blocker), clauses, bucket_records in zip(
            BUCKET_SPECS, raw_buckets, records, strict=True
        )
    ]
    clauses = tuple(clause for bucket in raw_buckets for clause in bucket)
    parsed_variables, parsed_clauses = _parse_dimacs(rendered_source_cnf)
    if parsed_variables != variable_count or parsed_clauses != clauses:
        raise ClauseContractError(
            "rendered source CNF does not match the typed clause sequence"
        )
    unsigned = {
        "schema": SOURCE_SCHEMA,
        "bucket_order": [spec[0] for spec in BUCKET_SPECS],
        "buckets": buckets,
        "variable_count": variable_count,
        "typed_clause_count": len(clauses),
        "untyped_clause_count": 0,
        "ordered_clause_sha256": _sha256_value(clauses),
        "rendered_source_cnf_sha256": _sha256_bytes(rendered_source_cnf),
        "semantic_refinement_receipts": [],
        "promotion_status": "BLOCKED_PENDING_TYPED_EVIDENCE",
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
    }
    return clauses, {**unsigned, "inventory_sha256": _sha256_value(unsigned)}


def _parse_dimacs(value: bytes) -> tuple[int, tuple[tuple[int, ...], ...]]:
    """Parse the runner's canonical ASCII/LF, one-clause-per-line DIMACS."""

    if b"\r" in value:
        raise ClauseContractError("CNF is not canonical LF-delimited DIMACS")
    try:
        lines = value.decode("ascii").split("\n")
    except UnicodeDecodeError as exc:
        raise ClauseContractError("CNF is not ASCII DIMACS") from exc
    meaningful = [
        (line_index, line)
        for line_index, line in enumerate(lines, start=1)
        if line.strip() and not line.lstrip().startswith("c")
    ]
    if not meaningful:
        raise ClauseContractError("CNF is empty")
    _header_line, header_text = meaningful[0]
    header = header_text.split()
    if len(header) != 4 or header[:2] != ["p", "cnf"]:
        raise ClauseContractError("CNF header is malformed")
    try:
        variable_count = int(header[2])
        claimed_clause_count = int(header[3])
    except ValueError as exc:
        raise ClauseContractError("CNF header count is malformed") from exc
    if variable_count < 0 or claimed_clause_count < 0:
        raise ClauseContractError("CNF header count is negative")
    clauses: list[tuple[int, ...]] = []
    for line_index, line in meaningful[1:]:
        fields = line.split()
        if not fields or fields[-1] != "0" or "0" in fields[:-1]:
            raise ClauseContractError(f"CNF clause line {line_index} is malformed")
        try:
            clause = tuple(int(field) for field in fields[:-1])
        except ValueError as exc:
            raise ClauseContractError(
                f"CNF clause line {line_index} has a malformed literal"
            ) from exc
        if any(literal == 0 or abs(literal) > variable_count for literal in clause):
            raise ClauseContractError(
                f"CNF clause line {line_index} exceeds the variable namespace"
            )
        clauses.append(clause)
    if len(clauses) != claimed_clause_count:
        raise ClauseContractError("CNF header clause count mismatch")
    return variable_count, tuple(clauses)


def validate_source_inventory(inventory: Mapping[str, Any]) -> None:
    unsigned = dict(inventory)
    claimed_hash = unsigned.pop("inventory_sha256", None)
    if claimed_hash != _sha256_value(unsigned):
        raise ClauseContractError("source inventory hash mismatch")
    if unsigned.get("schema") != SOURCE_SCHEMA:
        raise ClauseContractError("source inventory schema mismatch")
    if unsigned.get("bucket_order") != [spec[0] for spec in BUCKET_SPECS]:
        raise ClauseContractError("source inventory bucket order mismatch")
    variable_count = unsigned.get("variable_count")
    if type(variable_count) is not int or variable_count < 0:
        raise ClauseContractError("source inventory variable count is invalid")
    if any(
        not isinstance(unsigned.get(field), str)
        or _SHA256.fullmatch(unsigned[field]) is None
        for field in ("ordered_clause_sha256", "rendered_source_cnf_sha256")
    ):
        raise ClauseContractError("source inventory formula digest is malformed")
    buckets = unsigned.get("buckets")
    if not isinstance(buckets, list) or len(buckets) != len(BUCKET_SPECS):
        raise ClauseContractError("source inventory buckets are malformed")
    total = 0
    for bucket, (name, clause_class, blocker) in zip(
        buckets, BUCKET_SPECS, strict=True
    ):
        if not isinstance(bucket, Mapping):
            raise ClauseContractError("source inventory bucket is not an object")
        if (
            bucket.get("name") != name
            or bucket.get("clause_class") != clause_class
            or bucket.get("promotion_blocker") != blocker
            or bucket.get("promotion_evidence") is not None
            or bucket.get("supports_source_promotion") is not False
            or bucket.get("supports_abstract_promotion") is not False
        ):
            raise ClauseContractError(f"{name} clause classification mismatch")
        count = bucket.get("clause_count")
        if type(count) is not int or count < 0:
            raise ClauseContractError(f"{name} clause count is invalid")
        clause_digest = bucket.get("ordered_clause_sha256")
        if (
            not isinstance(clause_digest, str)
            or _SHA256.fullmatch(clause_digest) is None
        ):
            raise ClauseContractError(f"{name} clause digest is malformed")
        record_identity = bucket.get("record_identity")
        if name in {"root_static", "assumption_control"}:
            if record_identity is not None:
                raise ClauseContractError(f"{name} has unexpected record identity")
        else:
            if not isinstance(record_identity, Mapping):
                raise ClauseContractError(f"{name} record identity is missing")
            record_count = record_identity.get("record_count")
            sequence_digest = record_identity.get("record_sequence_sha256")
            head_digest = record_identity.get("record_head_sha256")
            valid_head = (
                head_digest is None
                if count == 0
                else isinstance(head_digest, str)
                and _SHA256.fullmatch(head_digest) is not None
            )
            if (
                type(record_count) is not int
                or record_count != count
                or not isinstance(sequence_digest, str)
                or _SHA256.fullmatch(sequence_digest) is None
                or not valid_head
            ):
                raise ClauseContractError(f"{name} record identity is malformed")
        total += count
    if (
        unsigned.get("typed_clause_count") != total
        or unsigned.get("untyped_clause_count") != 0
        or unsigned.get("semantic_refinement_receipts") != []
        or unsigned.get("promotion_status") != "BLOCKED_PENDING_TYPED_EVIDENCE"
        or unsigned.get("supports_source_promotion") is not False
        or unsigned.get("supports_abstract_promotion") is not False
    ):
        raise ClauseContractError("source inventory promotion gate mismatch")


def bind_solver_formula(
    inventory: Mapping[str, Any],
    solver_cnf: bytes,
    simplification: Mapping[str, Any] | None,
) -> dict[str, Any]:
    """Bind a typed source inventory to the exact bytes given to the solver."""

    validate_source_inventory(inventory)
    variable_count, clauses = _parse_dimacs(solver_cnf)
    if variable_count != inventory.get("variable_count"):
        raise ClauseContractError("solver CNF variable count mismatch")
    clause_hash = _sha256_value(clauses)
    if simplification is None:
        if (
            _sha256_bytes(solver_cnf) != inventory.get("rendered_source_cnf_sha256")
            or len(clauses) != inventory.get("typed_clause_count")
            or clause_hash != inventory.get("ordered_clause_sha256")
        ):
            raise ClauseContractError("solver CNF drifted from the typed inventory")
        transformation = {
            "kind": "NONE",
            "evidence": None,
            "promotion_status": "SOURCE_INVENTORY_ONLY",
        }
    else:
        required = {
            "original_clause_count": inventory.get("typed_clause_count"),
            "original_clause_sha256": inventory.get("ordered_clause_sha256"),
            "residual_clause_count": len(clauses),
            "residual_clause_sha256": clause_hash,
        }
        if any(
            simplification.get(key) != expected for key, expected in required.items()
        ):
            raise ClauseContractError("shard simplification custody mismatch")
        transformation = {
            "kind": "SHARD_LOCAL_SIMPLIFICATION",
            "evidence": dict(simplification),
            "promotion_status": "CUSTODY_ONLY_TRANSFORM",
        }
    unsigned = {
        "schema": BOUND_SCHEMA,
        "source_inventory": dict(inventory),
        "solver_formula": {
            "variable_count": variable_count,
            "clause_count": len(clauses),
            "ordered_clause_sha256": clause_hash,
            "cnf_sha256": _sha256_bytes(solver_cnf),
        },
        "transformation": transformation,
        "promotion_status": "FINITE_BOOLEAN_FORMULA_ONLY",
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
    }
    return {**unsigned, "contract_sha256": _sha256_value(unsigned)}


def validate_bound_contract(contract: Mapping[str, Any]) -> None:
    unsigned = dict(contract)
    claimed_hash = unsigned.pop("contract_sha256", None)
    if claimed_hash != _sha256_value(unsigned):
        raise ClauseContractError("solver-formula clause contract hash mismatch")
    if unsigned.get("schema") != BOUND_SCHEMA:
        raise ClauseContractError("solver-formula clause contract schema mismatch")
    inventory = unsigned.get("source_inventory")
    if not isinstance(inventory, Mapping):
        raise ClauseContractError("solver-formula source inventory is missing")
    validate_source_inventory(inventory)
    formula = unsigned.get("solver_formula")
    if not isinstance(formula, Mapping):
        raise ClauseContractError("solver-formula identity is missing")
    count = formula.get("clause_count")
    if type(count) is not int or count < 0:
        raise ClauseContractError("solver-formula clause count is invalid")
    if formula.get("variable_count") != inventory.get("variable_count"):
        raise ClauseContractError("solver-formula variable count mismatch")
    if any(
        not isinstance(formula.get(field), str)
        or _SHA256.fullmatch(formula[field]) is None
        for field in ("ordered_clause_sha256", "cnf_sha256")
    ):
        raise ClauseContractError("solver-formula digest is malformed")
    transformation = unsigned.get("transformation")
    if not isinstance(transformation, Mapping):
        raise ClauseContractError("solver-formula transformation is missing")
    kind = transformation.get("kind")
    evidence = transformation.get("evidence")
    if kind == "NONE":
        if (
            evidence is not None
            or transformation.get("promotion_status") != "SOURCE_INVENTORY_ONLY"
            or count != inventory.get("typed_clause_count")
            or formula.get("ordered_clause_sha256")
            != inventory.get("ordered_clause_sha256")
            or formula.get("cnf_sha256") != inventory.get("rendered_source_cnf_sha256")
        ):
            raise ClauseContractError("unsimplified solver-formula custody mismatch")
    elif kind == "SHARD_LOCAL_SIMPLIFICATION":
        if (
            not isinstance(evidence, Mapping)
            or transformation.get("promotion_status") != "CUSTODY_ONLY_TRANSFORM"
            or evidence.get("original_clause_count")
            != inventory.get("typed_clause_count")
            or evidence.get("original_clause_sha256")
            != inventory.get("ordered_clause_sha256")
            or evidence.get("residual_clause_count") != count
            or evidence.get("residual_clause_sha256")
            != formula.get("ordered_clause_sha256")
        ):
            raise ClauseContractError("simplified solver-formula custody mismatch")
    else:
        raise ClauseContractError("solver-formula transformation kind is invalid")
    if (
        unsigned.get("promotion_status") != "FINITE_BOOLEAN_FORMULA_ONLY"
        or unsigned.get("supports_source_promotion") is not False
        or unsigned.get("supports_abstract_promotion") is not False
    ):
        raise ClauseContractError("solver-formula promotion gate mismatch")


def validate_against_cnf(contract: Mapping[str, Any], cnf: bytes) -> None:
    validate_bound_contract(contract)
    variable_count, clauses = _parse_dimacs(cnf)
    formula = contract["solver_formula"]
    if (
        variable_count != formula.get("variable_count")
        or len(clauses) != formula.get("clause_count")
        or _sha256_value(clauses) != formula.get("ordered_clause_sha256")
        or _sha256_bytes(cnf) != formula.get("cnf_sha256")
    ):
        raise ClauseContractError("CNF does not match the solver-formula contract")
