"""Focused tests for the FreshThird cap-interval augmentation audit."""

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import freshthird_firstnonhit_cap_interval_audit as audit


def test_all_survivors_extend_in_both_geometric_arms() -> None:
    artifact = audit.build_audit()
    assert artifact["counts"] == {
        "source_alternating_words": 40,
        "rational_survivor_words": 28,
        "kernel_schema_words": 12,
        "survivors_with_distinct_cap_extension": 28,
        "survivors_with_same_cap_closed_source_extension": 28,
        "survivors_with_same_cap_endpoint_extension": 28,
        "kernel_words_with_both_cap_extensions": 12,
        "words_excluded_by_current_cap_fields": 0,
    }
    survivors = [
        record
        for record in artifact["records"]
        if record["source_status"] == "RATIONAL_WITNESS"
    ]
    assert all(record["distinct_cap_count"] > 0 for record in survivors)
    assert all(record["same_cap_closed_source_count"] > 0 for record in survivors)
    assert all(record["same_cap_endpoint_count"] > 0 for record in survivors)


def test_witnesses_replay_the_declared_predicates() -> None:
    artifact = audit.build_audit()
    for record in artifact["records"]:
        order = tuple(record["order"])
        for key, predicate in (
            ("distinct_cap_witness", audit._is_distinct_cap_extension),
            ("same_cap_closed_source_witness", audit._is_same_cap_extension),
            ("same_cap_endpoint_witness", audit._uses_same_cap_endpoint),
        ):
            witness = record[key]
            assert witness is not None
            codes = tuple(witness["cyclic_location_codes"])
            assert audit._cyclic_embedding(codes)
            locations = audit._role_locations(order, codes)
            assert locations["C"] == 1
            assert predicate(locations)


def test_checked_in_artifact_and_tamper_fail_closed(tmp_path: Path) -> None:
    checked_in = audit.replay_artifact()
    assert checked_in["counts"]["words_excluded_by_current_cap_fields"] == 0

    path = tmp_path / "cap_interval_audit.json"
    artifact = audit.write_audit(path)
    assert audit.replay_artifact(path) == artifact

    tampered = copy.deepcopy(artifact)
    tampered["records"][0]["distinct_cap_count"] = 0
    path.write_text(json.dumps(tampered), encoding="utf-8")
    with pytest.raises(audit.AuditError):
        audit.replay_artifact(path)


def test_marker_coincidence_is_injective_and_closed_endpoint_is_supported() -> None:
    artifact = audit.build_audit()
    assert "physically coincident" in artifact["model"]["marker_role_semantics"]
    assert not audit._cyclic_embedding((0, 0, 1, 1, 3, 5))
    assert audit._cyclic_embedding((0, 1, 2, 3, 4, 5))
    locations = {"A": 0, "B": 1, "C": 1, "D": 3, "E": 4, "F": 1}
    assert audit._is_same_cap_extension(locations)
    assert audit._uses_same_cap_endpoint(locations)
