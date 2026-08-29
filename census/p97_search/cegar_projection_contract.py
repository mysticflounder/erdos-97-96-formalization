"""Authenticated scope metadata for structural-CEGAR survivor blocks."""

from __future__ import annotations

import hashlib
import json
from collections.abc import Mapping, Sequence
from typing import Any

SCHEMA = "p97-cegar-enumeration-block-scope/v1"


class ProjectionContractError(ValueError):
    """Raised when a survivor-block scope contract is malformed or stale."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _variable_map(encoding: Any, variables: Sequence[int]) -> list[list[Any]]:
    result: list[list[Any]] = []
    for variable in variables:
        key = encoding.key_for.get(variable)
        if not isinstance(key, tuple) or not key:
            raise ProjectionContractError(
                f"SAT variable {variable} has no nonempty tuple key"
            )
        result.append([variable, list(key)])
    return result


def build_scope_contract(encoding: Any) -> dict[str, Any]:
    """Describe exactly which DIMACS variables a survivor block negates."""

    variable_count = encoding.num_vars
    if type(variable_count) is not int or variable_count < 0:
        raise ProjectionContractError("CNF variable count is invalid")
    semantic_variables = tuple(encoding.semantic_vars)
    if (
        any(type(variable) is not int for variable in semantic_variables)
        or len(set(semantic_variables)) != len(semantic_variables)
        or any(not 1 <= variable <= variable_count for variable in semantic_variables)
    ):
        raise ProjectionContractError("semantic variable namespace is invalid")
    semantic_set = set(semantic_variables)
    auxiliary_variables = tuple(
        variable
        for variable in range(1, variable_count + 1)
        if variable not in semantic_set
    )
    semantic_map = _variable_map(encoding, semantic_variables)
    auxiliary_map = _variable_map(encoding, auxiliary_variables)
    unsigned = {
        "schema": SCHEMA,
        "clause_class": "ENUMERATION_CONTROL",
        "claim_scope": "ENUMERATION_ONLY",
        "block_scope": (
            "TOTAL_ASSIGNMENT" if not auxiliary_variables else "SEMANTIC_PROJECTION"
        ),
        "auxiliary_completion_policy": (
            "NONE_OMITTED"
            if not auxiliary_variables
            else "BLOCKS_ALL_COMPLETIONS_FOR_CENSUS_ONLY"
        ),
        "cnf_variable_count": variable_count,
        "blocked_variable_count": len(semantic_variables),
        "auxiliary_variable_count": len(auxiliary_variables),
        "semantic_variable_map_sha256": _sha256_value(semantic_map),
        "auxiliary_variable_map_sha256": _sha256_value(auxiliary_map),
        "projection_map_sha256": _sha256_value(
            {
                "included": semantic_map,
                "omitted": auxiliary_map,
            }
        ),
        "source_discharge": None,
        "abstract_discharge": None,
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
    }
    return {**unsigned, "contract_sha256": _sha256_value(unsigned)}


def validate_scope_contract(contract: Mapping[str, Any], encoding: Any) -> None:
    """Replay a stored scope contract against the live SAT variable map."""

    if dict(contract) != build_scope_contract(encoding):
        raise ProjectionContractError(
            "survivor-block scope contract does not match the SAT variable map"
        )


def validate_survivor_stream_contract(
    contract: Mapping[str, Any] | None,
    encoding: Any,
    survivor_count: int,
) -> None:
    """Require authenticated scope whenever a stream contains survivor blocks."""

    if type(survivor_count) is not int or survivor_count < 0:
        raise ProjectionContractError("survivor count is invalid")
    if contract is None:
        if survivor_count:
            raise ProjectionContractError(
                "stored survivor blocks require a survivor-block scope contract"
            )
        return
    validate_scope_contract(contract, encoding)


def validate_block_clause(
    contract: Mapping[str, Any],
    encoding: Any,
    clause: Sequence[int],
) -> None:
    """Check that a claimed enumeration block uses exactly the bound projection."""

    validate_scope_contract(contract, encoding)
    semantic_variables = tuple(encoding.semantic_vars)
    if any(type(literal) is not int or literal == 0 for literal in clause):
        raise ProjectionContractError(
            "survivor block contains a malformed DIMACS literal"
        )
    if len(clause) != len(semantic_variables) or {
        abs(literal) for literal in clause
    } != set(semantic_variables):
        raise ProjectionContractError(
            "survivor block does not negate exactly the semantic projection"
        )
