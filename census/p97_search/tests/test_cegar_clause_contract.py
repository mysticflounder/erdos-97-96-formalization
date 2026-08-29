from __future__ import annotations

import copy
import importlib

import pytest

contract = importlib.import_module("census.p97_search.cegar_clause_contract")


def _render(variable_count: int, clauses: tuple[tuple[int, ...], ...]) -> bytes:
    body = "".join(" ".join(map(str, clause)) + " 0\n" for clause in clauses)
    return f"p cnf {variable_count} {len(clauses)}\n{body}".encode("ascii")


def _inventory():
    root = ((1, 2), (-1, 3))
    assumptions = ((-3,),)
    learned = ((-2, 3),)
    survivors = ((1, -2, 3),)
    clauses = (*root, *assumptions, *learned, *survivors)
    return contract.build_source_inventory(
        variable_count=3,
        root_clauses=root,
        assumption_clauses=assumptions,
        learned_records=({"record_sha256": "a" * 64},),
        learned_clauses=learned,
        survivor_records=({"record_sha256": "b" * 64},),
        survivor_clauses=survivors,
        rendered_source_cnf=_render(3, clauses),
    )


def test_source_inventory_types_every_clause_without_semantic_promotion() -> None:
    clauses, inventory = _inventory()

    assert len(clauses) == inventory["typed_clause_count"] == 5
    assert inventory["untyped_clause_count"] == 0
    assert inventory["bucket_order"] == [
        "root_static",
        "assumption_control",
        "learned_candidate",
        "enumeration_control",
    ]
    assert [bucket["clause_class"] for bucket in inventory["buckets"]] == [
        "ROOT_STATIC",
        "ASSUMPTION_CONTROL",
        "LEARNED_CANDIDATE",
        "ENUMERATION_CONTROL",
    ]
    assert inventory["semantic_refinement_receipts"] == []
    assert inventory["supports_source_promotion"] is False
    assert all(bucket["promotion_evidence"] is None for bucket in inventory["buckets"])
    contract.validate_source_inventory(inventory)


def test_inventory_rejects_an_unrecorded_learned_clause() -> None:
    with pytest.raises(
        contract.ClauseContractError, match="learned_candidate record/clause count"
    ):
        contract.build_source_inventory(
            variable_count=1,
            root_clauses=(),
            assumption_clauses=(),
            learned_records=(),
            learned_clauses=((1,),),
            survivor_records=(),
            survivor_clauses=(),
            rendered_source_cnf=_render(1, ((1,),)),
        )


def test_inventory_rejects_bucket_reordering_in_rendered_cnf() -> None:
    with pytest.raises(contract.ClauseContractError, match="typed clause sequence"):
        contract.build_source_inventory(
            variable_count=2,
            root_clauses=((1,),),
            assumption_clauses=((-2,),),
            learned_records=(),
            learned_clauses=(),
            survivor_records=(),
            survivor_clauses=(),
            rendered_source_cnf=_render(2, ((-2,), (1,))),
        )


def test_inventory_rejects_noncanonical_dimacs_line_separators() -> None:
    with pytest.raises(contract.ClauseContractError, match="LF-delimited"):
        contract.build_source_inventory(
            variable_count=1,
            root_clauses=((1,),),
            assumption_clauses=(),
            learned_records=(),
            learned_clauses=(),
            survivor_records=(),
            survivor_clauses=(),
            rendered_source_cnf=b"p cnf 1 1\r\n1 0\r\n",
        )


def test_unsimplified_solver_binding_rejects_formula_substitution() -> None:
    clauses, inventory = _inventory()
    cnf = _render(3, clauses)
    bound = contract.bind_solver_formula(inventory, cnf, None)

    contract.validate_bound_contract(bound)
    contract.validate_against_cnf(bound, cnf)
    assert bound["promotion_status"] == "FINITE_BOOLEAN_FORMULA_ONLY"
    assert bound["supports_source_promotion"] is False

    with pytest.raises(contract.ClauseContractError, match="does not match"):
        contract.validate_against_cnf(bound, _render(3, clauses[:-1]))


def test_simplified_binding_requires_exact_source_and_residual_digests() -> None:
    _clauses, inventory = _inventory()
    residual = ((-3,), (1, 2))
    simplification = {
        "original_clause_count": inventory["typed_clause_count"],
        "original_clause_sha256": inventory["ordered_clause_sha256"],
        "residual_clause_count": len(residual),
        "residual_clause_sha256": contract._sha256_value(residual),
    }

    bound = contract.bind_solver_formula(
        inventory, _render(3, residual), simplification
    )
    assert bound["transformation"]["promotion_status"] == "CUSTODY_ONLY_TRANSFORM"

    crossed = dict(simplification)
    crossed["original_clause_sha256"] = "0" * 64
    with pytest.raises(contract.ClauseContractError, match="custody mismatch"):
        contract.bind_solver_formula(inventory, _render(3, residual), crossed)


def test_contract_hash_rejects_promotion_flag_tampering() -> None:
    clauses, inventory = _inventory()
    bound = contract.bind_solver_formula(inventory, _render(3, clauses), None)
    tampered = copy.deepcopy(bound)
    tampered["supports_source_promotion"] = True

    with pytest.raises(contract.ClauseContractError, match="hash mismatch"):
        contract.validate_bound_contract(tampered)
