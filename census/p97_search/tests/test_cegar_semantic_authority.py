from __future__ import annotations

import copy
import importlib

import pytest

authority = importlib.import_module("census.p97_search.cegar_semantic_authority")
clauses = importlib.import_module("census.p97_search.cegar_clause_contract")
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)


def _terminal_clause_contract() -> dict:
    cnf = b"p cnf 1 1\n1 0\n"
    _typed, inventory = clauses.build_source_inventory(
        variable_count=1,
        root_clauses=((1,),),
        assumption_clauses=(),
        learned_records=(),
        learned_clauses=(),
        survivor_records=(),
        survivor_clauses=(),
        rendered_source_cnf=cnf,
    )
    return clauses.bind_solver_formula(inventory, cnf, None)


def test_gate_blocks_every_semantic_authority_without_receipts() -> None:
    gate = authority.build_authority_gate(None)

    assert gate["schema"] == authority.SCHEMA
    assert gate["governing_contract_schema"] == "p97-cegar-semantic-contract/v1"
    assert gate["operational_status_scope"] == "FINITE_BOOLEAN_CUSTODY_ONLY"
    assert gate["terminal_clause_contract_sha256"] is None
    assert gate["source_promotion"] == {"status": "BLOCKED", "evidence_ref": None}
    assert gate["abstract_promotion"]["status"] == "BLOCKED"
    assert gate["theorem_promotion"]["status"] == "BLOCKED"
    assert gate["supports_source_promotion"] is False
    assert gate["supports_abstract_promotion"] is False
    assert gate["supports_theorem_promotion"] is False
    authority.validate_authority_gate(gate, None)


def test_terminal_gate_binds_formula_only_clause_contract() -> None:
    terminal = _terminal_clause_contract()
    gate = authority.build_authority_gate(terminal)

    assert gate["terminal_clause_contract_sha256"] == terminal["contract_sha256"]
    assert gate["terminal_clause_contract_scope"] == "FINITE_BOOLEAN_FORMULA_ONLY"
    assert "TERMINAL_CLAUSE_CONTRACT_FORMULA_ONLY" in gate["blockers"]
    authority.validate_authority_gate(gate, terminal)


def test_gate_rejects_crossed_terminal_contract_and_promotion_tampering() -> None:
    terminal = _terminal_clause_contract()
    gate = authority.build_authority_gate(terminal)

    with pytest.raises(authority.SemanticAuthorityError, match="does not match"):
        authority.validate_authority_gate(gate, None)

    tampered = copy.deepcopy(gate)
    tampered["supports_source_promotion"] = True
    with pytest.raises(authority.SemanticAuthorityError, match="does not match"):
        authority.validate_authority_gate(tampered, terminal)


def test_legacy_resume_adopts_only_while_active() -> None:
    assert v3._resume_semantic_authority_enabled({"status": "RUNNING"}, None) is True
    assert (
        v3._resume_semantic_authority_enabled(
            {"status": "STRUCTURAL_UNSAT_VERIFIED"}, None
        )
        is False
    )

    terminal = _terminal_clause_contract()
    gate = authority.build_authority_gate(terminal)
    assert (
        v3._resume_semantic_authority_enabled(
            {
                "status": "STRUCTURAL_UNSAT_VERIFIED",
                "semantic_authority_gate": gate,
            },
            terminal,
        )
        is True
    )
