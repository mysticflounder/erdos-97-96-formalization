"""Fail-closed authority labels for structural-CEGAR operational artifacts."""

from __future__ import annotations

import hashlib
import importlib
import json
from collections.abc import Mapping
from typing import Any

clause_contract = importlib.import_module("census.p97_search.cegar_clause_contract")
decoder_contract = importlib.import_module("census.p97_search.cegar_decoder_contract")

SCHEMA = "p97-cegar-semantic-authority-gate/v1"
GOVERNING_CONTRACT_SCHEMA = "p97-cegar-semantic-contract/v2"


class SemanticAuthorityError(ValueError):
    """Raised when semantic authority is claimed without typed evidence."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def build_authority_gate(
    terminal_clause_contract: Mapping[str, Any] | None,
    canonical_decoder_contract: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Build the only authority state admitted before semantic receipts exist."""

    if terminal_clause_contract is not None:
        try:
            clause_contract.validate_bound_contract(terminal_clause_contract)
        except clause_contract.ClauseContractError as exc:
            raise SemanticAuthorityError(
                f"terminal clause contract failed: {exc}"
            ) from exc
        clause_contract_sha256 = terminal_clause_contract["contract_sha256"]
        clause_scope = terminal_clause_contract["promotion_status"]
    else:
        clause_contract_sha256 = None
        clause_scope = None
    if canonical_decoder_contract is not None:
        try:
            decoder_contract.validate_bound_contract(canonical_decoder_contract)
        except decoder_contract.DecoderContractError as exc:
            raise SemanticAuthorityError(
                f"canonical decoder contract failed: {exc}"
            ) from exc
        decoder_contract_sha256 = canonical_decoder_contract["contract_sha256"]
    else:
        decoder_contract_sha256 = None
    blockers = [
        "SEMANTIC_CONTRACT_RECEIPT_MISSING",
        "SOURCE_COVERAGE_R1_EVIDENCE_MISSING",
        "ASSIGNMENT_DECODING_R3_EVIDENCE_MISSING",
        "SOURCE_PRESERVATION_F4_EVIDENCE_MISSING",
        "TERMINAL_PROMOTION_RECEIPT_MISSING",
        (
            "TERMINAL_CLAUSE_CONTRACT_NOT_AVAILABLE"
            if terminal_clause_contract is None
            else "TERMINAL_CLAUSE_CONTRACT_FORMULA_ONLY"
        ),
        (
            "CANONICAL_DECODER_CONTRACT_NOT_AVAILABLE"
            if canonical_decoder_contract is None
            else "CANONICAL_DECODER_FUNCTIONALITY_CUSTODY_ONLY"
        ),
    ]
    unsigned = {
        "schema": SCHEMA,
        "governing_contract_schema": GOVERNING_CONTRACT_SCHEMA,
        "operational_status_scope": "FINITE_BOOLEAN_CUSTODY_ONLY",
        "terminal_clause_contract_sha256": clause_contract_sha256,
        "terminal_clause_contract_scope": clause_scope,
        "canonical_decoder_contract_sha256": decoder_contract_sha256,
        "semantic_contract_receipt": None,
        "source_coverage_r1_evidence": None,
        "source_preservation_f4_evidence": None,
        "terminal_promotion_receipt": None,
        "source_promotion": {"status": "BLOCKED", "evidence_ref": None},
        "abstract_promotion": {"status": "BLOCKED", "evidence_ref": None},
        "theorem_promotion": {"status": "BLOCKED", "evidence_ref": None},
        "blockers": blockers,
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
        "supports_theorem_promotion": False,
    }
    return {**unsigned, "authority_sha256": _sha256_value(unsigned)}


def validate_authority_gate(
    gate: Mapping[str, Any],
    terminal_clause_contract: Mapping[str, Any] | None,
    canonical_decoder_contract: Mapping[str, Any] | None = None,
) -> None:
    """Replay an authority gate against its exact terminal clause contract."""

    if dict(gate) != build_authority_gate(
        terminal_clause_contract, canonical_decoder_contract
    ):
        raise SemanticAuthorityError(
            "semantic authority gate does not match the admitted evidence"
        )
