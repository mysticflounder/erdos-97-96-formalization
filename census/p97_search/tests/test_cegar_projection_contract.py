from __future__ import annotations

import copy
import importlib

import pytest

contract = importlib.import_module("census.p97_search.cegar_projection_contract")
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)


@pytest.fixture(scope="module")
def encoding():
    return v3._phase3_encoding(projected_static_v3=True)


def test_projected_v3_scope_binds_semantic_and_auxiliary_namespaces(
    encoding,
) -> None:
    receipt = contract.build_scope_contract(encoding)

    assert receipt["schema"] == contract.SCHEMA
    assert receipt["clause_class"] == "ENUMERATION_CONTROL"
    assert receipt["claim_scope"] == "ENUMERATION_ONLY"
    assert receipt["block_scope"] == "SEMANTIC_PROJECTION"
    assert (
        receipt["auxiliary_completion_policy"]
        == "BLOCKS_ALL_COMPLETIONS_FOR_CENSUS_ONLY"
    )
    assert receipt["cnf_variable_count"] == 1194
    assert receipt["blocked_variable_count"] == 111
    assert receipt["auxiliary_variable_count"] == 1083
    assert receipt["source_discharge"] is None
    assert receipt["abstract_discharge"] is None
    assert receipt["supports_source_promotion"] is False
    assert receipt["supports_abstract_promotion"] is False
    contract.validate_scope_contract(receipt, encoding)


def test_scope_contract_rejects_crossed_variable_map(encoding) -> None:
    receipt = contract.build_scope_contract(encoding)
    crossed = copy.deepcopy(receipt)
    crossed["auxiliary_variable_map_sha256"] = "0" * len(
        crossed["auxiliary_variable_map_sha256"]
    )

    with pytest.raises(
        contract.ProjectionContractError,
        match="does not match the SAT variable map",
    ):
        contract.validate_scope_contract(crossed, encoding)


def test_survivor_stream_requires_a_scope_contract(encoding) -> None:
    contract.validate_survivor_stream_contract(None, encoding, 0)
    with pytest.raises(
        contract.ProjectionContractError,
        match="stored survivor blocks require",
    ):
        contract.validate_survivor_stream_contract(None, encoding, 1)


def test_active_legacy_resume_adopts_projection_contract(encoding) -> None:
    computed = contract.build_scope_contract(encoding)

    adopted = v3._resume_survivor_block_contract(
        {"status": "RUNNING"}, encoding, computed
    )
    assert adopted == computed
    assert adopted is not computed
    assert (
        v3._resume_survivor_block_contract(
            {"status": "STRUCTURAL_UNSAT_VERIFIED"}, encoding, computed
        )
        is None
    )


def test_block_validation_rejects_an_auxiliary_literal(encoding) -> None:
    receipt = contract.build_scope_contract(encoding)
    clause = list(encoding.semantic_vars)
    contract.validate_block_clause(receipt, encoding, clause)

    semantic = set(encoding.semantic_vars)
    auxiliary = next(
        variable
        for variable in range(1, encoding.num_vars + 1)
        if variable not in semantic
    )
    clause[-1] = auxiliary
    with pytest.raises(
        contract.ProjectionContractError,
        match="exactly the semantic projection",
    ):
        contract.validate_block_clause(receipt, encoding, clause)


def test_block_validation_normalizes_malformed_literal_errors(encoding) -> None:
    receipt = contract.build_scope_contract(encoding)
    clause = list(encoding.semantic_vars)
    clause[-1] = "not-a-literal"

    with pytest.raises(
        contract.ProjectionContractError,
        match="malformed DIMACS literal",
    ):
        contract.validate_block_clause(receipt, encoding, clause)
