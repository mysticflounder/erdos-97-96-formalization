from __future__ import annotations

import copy
import hashlib

import pytest
import z3

from census.p97_search.freshthird_qfiber_three_carrier_cegar_v1 import (
    signature_match,
)
from census.p97_search.freshthird_qfiber_three_carrier_mine_v1 import focal_metrics
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    EXTRA_ROLES,
    FALSE_CLAIMS,
    OLD_ROLES,
    QUERY_LEAN,
    ROLES,
    ROWS,
    SOURCE_THEORY_LEAN,
    _canonical_json,
    build_query,
    replay_sat_result,
    solve_cell,
    source_manifest,
)


def test_schema_is_intrinsic_and_source_hashed() -> None:
    manifest = source_manifest()
    assert len(OLD_ROLES) == 38
    assert len(EXTRA_ROLES) == 29
    assert len(ROLES) == 67
    assert len(ROWS) == 14
    assert manifest["ambient_carrier_enumerated"] is False
    assert manifest["claims"] == FALSE_CLAIMS
    assert "robust-or-outside-row" in manifest["row_deletion_semantics"]
    assert "at most two" in manifest["row_intersection_semantics"]
    hashes = manifest["source_files"]
    assert any(path.endswith(QUERY_LEAN.name) for path in hashes)
    assert any(path.endswith(SOURCE_THEORY_LEAN.name) for path in hashes)
    assert all(len(digest) == 64 for digest in hashes.values())


def test_row_origins_are_explicit_and_four_slot() -> None:
    manifest = source_manifest()
    row_origins = manifest["row_origins"]
    assert set(row_origins) == set(ROWS)
    for row, entry in row_origins.items():
        assert entry["origin"] == ROWS[row][0]
        assert entry["slots"] == list(ROWS[row][1])
        assert len(entry["slots"]) == 4
        assert entry["center"] == ROWS[row][2]


@pytest.mark.parametrize("boundary_index", range(4))
def test_all_boundary_cells_build(boundary_index: int) -> None:
    query = build_query(boundary_index, timeout_ms=5_000)
    assert query.boundary_index == boundary_index
    assert query.groups == (
        "same_equivalence_canonical",
        "complete_exact_row_theory",
        "complete_relational_theory",
        "cap_skolem_ranges",
        "pinned_source_theory",
        "carrier_source_theory",
    )


def test_distinct_q_sources_tamper_is_unsat() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(query.same("qSource0", "qSource1"))
    assert query.solver.check() == z3.unsat


def test_new_row_slot_collapse_tamper_is_unsat() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(query.same("boundaryRowSource0", "boundaryRowSource1"))
    assert query.solver.check() == z3.unsat


def test_no_three_q_sources_in_boundary_blocker_tamper_is_unsat() -> None:
    query = build_query(3, timeout_ms=20_000)
    query.solver.add(
        query.incident("qSource0", "boundaryBlocker"),
        query.incident("qSource1", "boundaryBlocker"),
        query.incident("qSource2", "boundaryBlocker"),
    )
    assert query.solver.check() == z3.unsat


def test_cap_witness_range_tamper_is_unsat() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(query.variables.boundary_cap == 3)
    assert query.solver.check() == z3.unsat


def test_complete_row_deletion_semantics_tamper_is_unsat() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(
        query.is_nonrobust("sourceCenter"),
        query.incident("canonicalSource", "source"),
        query.has4("canonicalSource", "sourceCenter"),
    )
    assert query.solver.check() == z3.unsat


def test_complete_row_deletion_semantics_covers_new_roles() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(
        query.is_nonrobust("boundaryBlockerCenter"),
        z3.Not(query.incident("qSource1", "boundaryBlocker")),
        z3.Not(query.has4("qSource1", "boundaryBlockerCenter")),
    )
    assert query.solver.check() == z3.unsat


def test_distinct_center_rows_cannot_share_three_slots() -> None:
    query = build_query(0, timeout_ms=20_000)
    query.solver.add(
        z3.Not(query.same("pinnedCenter", "boundaryBlockerCenter")),
        query.incident("fanSource0", "boundaryBlocker"),
        query.incident("fanSource1", "boundaryBlocker"),
        query.incident("fanSource2", "boundaryBlocker"),
    )
    assert query.solver.check() == z3.unsat


def test_boundary_fan_collective_normalization_is_not_optional() -> None:
    query = build_query(0, timeout_ms=20_000)
    for i in range(4):
        query.solver.add(
            z3.Not(
                query.same(
                    "boundaryBlockerCenter", f"boundaryFanBlockerCenter{i}"
                )
            )
        )
    for i in range(4):
        for j in range(4):
            if i == j:
                continue
            ci = f"boundaryFanBlockerCenter{i}"
            cj = f"boundaryFanBlockerCenter{j}"
            si = f"boundaryRowSource{i}"
            sj = f"boundaryRowSource{j}"
            query.solver.add(
                z3.Or(
                    z3.Not(query.has4(sj, ci)),
                    z3.Not(query.has4(si, cj)),
                    query.same(ci, cj),
                )
            )
    assert query.solver.check() == z3.unsat


def test_sat_result_replays_and_digest_tamper_fails() -> None:
    result = solve_cell(0, timeout_ms=30_000)
    assert result["status"] == "SAT_ABSTRACTION"
    replay_sat_result(result, timeout_ms=30_000)
    metrics = focal_metrics(result)
    assert 0 <= metrics["pinned_q_overlap"] <= 4
    assert 0 <= metrics["q_fiber_sources_in_pinned_fan"] <= 3

    matched_query = build_query(0, timeout_ms=30_000)
    match, atom_count = signature_match(
        matched_query, result["model_signature"]
    )
    assert atom_count > 20_000
    matched_query.solver.add(match)
    assert matched_query.solver.check() == z3.sat

    tampered = copy.deepcopy(result)
    point_classes = tampered["model_signature"]["point_classes"]
    point_classes["qSource1"] = point_classes["qSource0"]
    tampered["model_signature_sha256"] = hashlib.sha256(
        _canonical_json(tampered["model_signature"])
    ).hexdigest()
    with pytest.raises(ValueError, match="model signature replay failed"):
        replay_sat_result(tampered, timeout_ms=30_000)
