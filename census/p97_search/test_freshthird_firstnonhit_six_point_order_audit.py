"""Focused regression tests for the finite P97 order audit."""

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import freshthird_firstnonhit_six_point_order_audit as audit


def test_deterministic_classification_and_counts() -> None:
    first = audit.build_audit()
    second = audit.build_audit()
    assert first == second
    assert first["counts"] == {
        "exact_feasible": 28,
        "kernel_schema_match_cyclic_cut_required": 10,
        "kernel_schema_match_reverse_orientation_required": 4,
        "lean_kernel_schema_match": 12,
        "rational_witnesses": 28,
        "shared_pair_alternating": 40,
        "source_nonalternating": 80,
        "sparse_kernel_schema_match": 8,
        "total_orders": 120,
        "two_triple_kernel_schema_match": 4,
        "unknown": 0,
    }
    records = first["orders"]
    assert len(records) == 120
    assert {"".join(record["order"]) for record in records if record["shared_pair_alternating"]} == {
        "".join(order) for order in audit.all_orders() if audit.is_shared_pair_alternating(order)
    }
    assert {
        "".join(record["order"])
        for record in records
        if any(match["family"] == "TwoTripleRowSixPointEuclideanObstruction" for match in record["theorem_matches"])
    } == set(audit.TWO_TRIPLE_ORBIT)
    assert {
        "".join(record["order"])
        for record in records
        if any(match["family"] == "SixPointSparseEuclideanObstruction" for match in record["theorem_matches"])
    } == set(audit.SPARSE_ORBIT)
    assert set(audit._generated_two_triple_matches()) == set(audit.EXPECTED_TWO_TRIPLE_ORBIT)
    assert set(audit._generated_sparse_matches()) == set(audit.EXPECTED_SPARSE_ORBIT)
    matches = [match for record in records for match in record["theorem_matches"]]
    assert len(matches) == 12
    assert sum(match["required_adapter_status"] == "CYCLIC_CUT_REQUIRED" for match in matches) == 6
    assert sum(match["required_adapter_status"] == "DIRECT_LINEAR_ORDER_ADAPTER" for match in matches) == 2
    assert sum(match["required_adapter_status"] == "CYCLIC_CUT_AND_REVERSE_ORIENTATION_REQUIRED" for match in matches) == 4
    assert all(
        len(match["theorem_position_substitution_tuple"]) == 6
        and len(match["theorem_position_substitution"]) == 6
        and match["cyclic_cut_role"] in audit.ROLES
        and match["orientation_polarity"] in {"forward_ccw", "reversed_ccw"}
        and len(match["boundary_order_roles"]) == 6
        for match in matches
    )
    assert {"".join(record["order"]) for record in records if record["status"] == "RATIONAL_WITNESS"} == {
        "".join(order)
        for order in audit.all_orders()
        if audit.is_shared_pair_alternating(order)
        and not audit.theorem_coverage(order)
    }
    base_orders = set(first["symmetry_ledger"]["base_orders"])
    row_swap_orders = set(first["symmetry_ledger"]["row_swap_completion"].values())
    assert base_orders == set(audit.BASE_WITNESS_ORDERS)
    assert base_orders.isdisjoint(row_swap_orders)
    assert base_orders | row_swap_orders == {
        "".join(order)
        for order in audit.all_orders()
        if audit.is_shared_pair_alternating(order) and not audit.theorem_coverage(order)
    }


def test_exact_replay_and_hash_tampering(tmp_path: Path) -> None:
    path = tmp_path / "audit.json"
    artifact = audit.write_audit(path)
    assert audit.replay_artifact(path) == artifact

    tampered = copy.deepcopy(artifact)
    tampered["hashes"]["payload_sha256"] = "0" * 64
    path.write_text(json.dumps(tampered), encoding="utf-8")
    with pytest.raises(audit.AuditError):
        audit.replay_artifact(path)

    tampered = copy.deepcopy(artifact)
    tampered["counts"]["total_orders"] = 119
    path.write_text(json.dumps(tampered), encoding="utf-8")
    with pytest.raises(audit.AuditError):
        audit.replay_artifact(path)


def test_checked_in_default_artifact_replays() -> None:
    artifact = audit.replay_artifact(audit.DEFAULT_ARTIFACT)
    assert artifact["counts"]["lean_kernel_schema_match"] == 12
    assert artifact["counts"]["unknown"] == 0


def test_witnesses_and_local_reflection_are_exact() -> None:
    artifact = audit.build_audit()
    audit._validate_local_eight_point_witness(artifact["local_eight_point_witness"])
    local = artifact["local_eight_point_witness"]
    assert local["metric_squared"] == {
        "BA_BD_BC1_BC2": "5/4",
        "FA_FD_FE1_FE2": "5/4",
    }
    assert local["reflection_partner"]["order"] == [
        "A", "E2", "E1", "F", "D", "C2", "C1", "B"
    ]
    for record in artifact["orders"]:
        if record["status"] == "RATIONAL_WITNESS":
            audit._validate_witness(record)
            assert record["witness"]["metric_squared"]["BA_squared"] == record["witness"]["metric_squared"]["BC_squared"]
            assert record["witness"]["metric_squared"]["BA_squared"] == record["witness"]["metric_squared"]["BD_squared"]
            assert record["witness"]["metric_squared"]["FA_squared"] == record["witness"]["metric_squared"]["FE_squared"]


def test_serialized_arithmetic_has_no_floats() -> None:
    def visit(value: object) -> None:
        assert not isinstance(value, float)
        if isinstance(value, dict):
            for child in value.values():
                visit(child)
        elif isinstance(value, list):
            for child in value:
                visit(child)

    visit(audit.build_audit())
