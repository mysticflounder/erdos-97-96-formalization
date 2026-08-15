# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import itertools
import json
from dataclasses import replace

import pytest

import census.p97_search.freshthird_firstnonhit_common_payload_v6 as v6
import census.p97_search.freshthird_firstnonhit_overlap_v5 as v5


def _json(data: bytes) -> dict[str, object]:
    return json.loads(data)


@pytest.fixture(scope="module")
def n17_bundle() -> v6.Bundle:
    return v6.emit_bundle(17)


@pytest.fixture(scope="module")
def n17_encoding(n17_bundle: v6.Bundle) -> v6.Encoding:
    mapping = _json(n17_bundle.variable_map)
    variables = tuple(
        v6.VariableRecord(row["id"], row["role"]) for row in mapping["variables"]
    )
    clauses = tuple(
        v6.ClauseRecord(
            row["id"], row["family"], row["role"], tuple(row["literals"])
        )
        for row in mapping["clauses"]
    )
    return v6.Encoding(17, variables, clauses, mapping["semantic_contract"])


def test_counts_hash_query_and_exact_delta(n17_bundle: v6.Bundle) -> None:
    manifest = _json(n17_bundle.manifest)
    assert manifest["variables"] == 93_280
    assert manifest["clauses"] == 606_898
    assert manifest["cnf_sha256"] == (
        "a520b6195e0337b629224835c51aa8a4e6b57088d898a32cc7318e71b0a6e403"
    )
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is False
    assert manifest["solver_run"] is False
    assert manifest["query"] == v5.QUERY
    assert manifest["query_is_separate_assumption"] is True
    assert manifest["query_unchanged_from_predecessor"] is True
    assert manifest["common_payload_field_count"] == 30
    assert manifest["common_payload_complete"] is True
    assert manifest["common_surface_identified_with_c"] is False
    assert manifest["omitted_relaxations"] == [
        "aligned_two_delete_minimal_core",
        "common_radius_named_surface_identity",
        "three_phase_no_alternation",
        "tri_apex_rich_classes",
    ]
    assert manifest["clause_delta"] == {
        "schema": f"{v6.SCHEMA}/delta/v1",
        "predecessor_schema": v5.SCHEMA,
        "predecessor_cnf_sha256": v6.PREDECESSOR_CNF_SHA256,
        "guard_variables": 1,
        "guard_definition_clauses": 2,
        "selector_variables": 34,
        "selector_cardinality_clauses": 274,
        "blocker_mux_variables": 34,
        "blocker_mux_clauses": 1_156,
        "source_distinct_clauses": 17,
        "first_cap_interior_clauses": 34,
        "retained_role_distinct_clauses": 136,
        "retained_blocker_distinct_clauses": 68,
        "apex_blocker_distinct_clauses": 68,
        "deletion_survival_clauses": 19_652,
        "common_radius_equal_clauses": 4_913,
        "common_radius_unequal_clauses": 19_652,
        "total_added_variables": 69,
        "total_added_clauses": 45_972,
        "payload_field_count": 30,
        "query_unchanged": True,
        "canonical_surface_selector_mentions": 0,
        "ordering": (
            "guard equivalence; source selectors; blocker muxes; source relations; "
            "blocker relations; deletion disjunctions; radius relations"
        ),
    }


def test_v5_cnf_is_an_exact_clause_prefix(n17_bundle: v6.Bundle) -> None:
    current = n17_bundle.cnf.splitlines()
    predecessor = v5._dimacs(v5.encode(17)).splitlines()
    assert current[0] == b"p cnf 93280 606898"
    assert current[1 : 1 + v6.PREDECESSOR_CLAUSES] == predecessor[1:]
    assert hashlib.sha256(b"\n".join(predecessor) + b"\n").hexdigest() == (
        v6.PREDECESSOR_CNF_SHA256
    )


def test_all_30_fields_have_exact_source_and_clause_coverage(
    n17_bundle: v6.Bundle,
) -> None:
    assert len(v6.PAYLOAD_FIELDS) == 30
    assert tuple(v6.PAYLOAD_FIELD_SOURCES) == v6.PAYLOAD_FIELDS
    mapping = _json(n17_bundle.variable_map)
    provenance = mapping["provenance"]
    assert set(provenance["payload_field_sources"]) == set(v6.PAYLOAD_FIELDS)
    assert provenance["payload_field_sources"] == v6.PAYLOAD_FIELD_SOURCES
    assert provenance["aggregate_source_theorem"] == {
        "declaration": v6.HINGRESS_PAYLOAD_THEOREM,
        "path": v6.HINGRESS_PAYLOAD_SOURCE_FILE,
        "sha256": v6.SOURCE_HASHES[v6.HINGRESS_PAYLOAD_SOURCE_FILE],
    }
    roles = [row["role"] for row in mapping["clauses"]]
    for field in v6.PAYLOAD_FIELDS:
        assert any(role.startswith(f"common_payload/{field}/") for role in roles), field
        assert v6.COMMON_PAYLOAD_DECLARATION in v6.PAYLOAD_FIELD_SOURCES[field]
    assert provenance["independence_boundary"] == {
        "producer_surface": "G.surface",
        "named_surface": "C",
        "identified": False,
        "canonical_selector_mentions_in_delta": 0,
    }


def test_guard_polarity_and_no_accidental_g_equals_c_alias(
    n17_bundle: v6.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    role_to_id = {row["role"]: row["id"] for row in mapping["variables"]}
    delta = mapping["clauses"][v6.PREDECESSOR_CLAUSES :]
    guard = role_to_id[v6.COMMON_GUARD_ROLE]
    legacy = role_to_id[v6.LEGACY_COMMON_GUARD_ROLE]
    assert [row["literals"] for row in delta[:2]] == [
        [-legacy, guard],
        [legacy, -guard],
    ]
    assert all(row["literals"][0] == -guard for row in delta[2:])
    canonical_ids = {
        role_to_id[f"role/{name}/{index}"]
        for name in (v6.v2.C1, v6.v2.C2)
        for index in range(17)
    }
    assert all(
        not canonical_ids.intersection(map(abs, row["literals"])) for row in delta
    )
    contract = mapping["semantic_contract"]["common_radius_payload"]
    assert contract["independent_of_named_canonical_surface"] is True
    assert contract["all_payload_relations_branch_guarded"] is True


def test_two_independent_selectors_are_complete_guarded_one_hot(
    n17_bundle: v6.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    roles = [row["role"] for row in mapping["variables"]]
    assert roles[v6.PREDECESSOR_VARIABLES + 1 : v6.PREDECESSOR_VARIABLES + 35] == [
        f"common_source/{side}/{index}"
        for side in v6.COMMON_SIDES
        for index in range(17)
    ]
    selector_clauses = [
        row
        for row in mapping["clauses"]
        if row["family"] == "common_payload_selectors"
    ]
    assert len(selector_clauses) == 274
    assert sum("at_least_one" in row["role"] for row in selector_clauses) == 2
    assert all(len(row["literals"]) in {3, 18} for row in selector_clauses)
    for width in (2, 3, 4):
        for guard in (False, True):
            for bits in itertools.product((False, True), repeat=width):
                assert v6._guarded_exactly_one_holds(bits, guard) == (
                    not guard or sum(bits) == 1
                )


def test_relation_translation_uses_exact_payload_fields(
    n17_bundle: v6.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    role_to_id = {row["role"]: row["id"] for row in mapping["variables"]}
    clause_by_role = {row["role"]: row["literals"] for row in mapping["clauses"]}
    guard = role_to_id[v6.COMMON_GUARD_ROLE]
    assert clause_by_role["common_payload/commonSource_ne/3"] == [
        -guard,
        -role_to_id["common_source/one/3"],
        -role_to_id["common_source/two/3"],
    ]
    assert clause_by_role[
        "common_payload/commonSourceTwo_firstCapInterior/4"
    ] == [-guard, -role_to_id["common_source/two/4"], role_to_id["interior/4/1"]]
    assert clause_by_role[
        "common_payload/commonSourceOne_blocker_ne_second/6"
    ] == [
        -guard,
        -role_to_id["common_blocker/one/6"],
        -role_to_id[f"named_blocker/{v6.v2.R1}/6"],
    ]
    assert clause_by_role[
        "common_payload/commonSourceTwo_firstDeletion_survives/5/7/9"
    ] == [
        -guard,
        -role_to_id["common_blocker/two/5"],
        -role_to_id[f"role/{v6.v2.P1}/7"],
        -role_to_id[f"role/{v6.v2.P2}/9"],
        role_to_id["has4/7/5"],
        role_to_id["has4/9/5"],
    ]
    assert clause_by_role["common_payload/common_radius_eq/2/3/4"] == [
        -guard,
        -role_to_id[f"role/{v6.v2.APEX}/2"],
        -role_to_id["common_source/one/3"],
        -role_to_id["common_source/two/4"],
        role_to_id["radius/2/3/4"],
    ]
    assert clause_by_role[
        "common_payload/common_radius_ne_secondRetainedSourceTwo/2/3/4"
    ] == [
        -guard,
        -role_to_id[f"role/{v6.v2.APEX}/2"],
        -role_to_id["common_source/one/3"],
        -role_to_id[f"role/{v6.v2.R2}/4"],
        -role_to_id["radius/2/3/4"],
    ]


def test_validation_rejects_missing_field_or_wrong_guard(
    n17_encoding: v6.Encoding,
) -> None:
    missing = replace(n17_encoding, clauses=n17_encoding.clauses[:-1])
    with pytest.raises(v6.EncodingError, match="clause delta drift"):
        v6.validate_semantic_encoding(missing)
    index = v6.PREDECESSOR_CLAUSES + 2
    original = n17_encoding.clauses[index]
    wrong_guard = replace(
        n17_encoding,
        clauses=(
            *n17_encoding.clauses[:index],
            replace(original, literals=(-original.literals[0], *original.literals[1:])),
            *n17_encoding.clauses[index + 1 :],
        ),
    )
    with pytest.raises(v6.EncodingError, match="clause delta drift"):
        v6.validate_semantic_encoding(wrong_guard)


def test_source_snapshot_pins_payload_and_aggregate(n17_bundle: v6.Bundle) -> None:
    snapshot = _json(n17_bundle.sources)
    assert snapshot["commit"] == v6.LEAN_COMMIT
    rows = {row["path"]: row["sha256"] for row in snapshot["files"]}
    assert rows[v6.COMMON_PAYLOAD_SOURCE_FILE] == (
        "cea8d0d20cf10bc53aa541566c9ada6ad420a95738b4f2b801742d8714010f0b"
    )
    assert rows[v6.HINGRESS_PAYLOAD_SOURCE_FILE] == (
        "06ca4a180db7844daf6f2798e93449e7f2b0bceb962d9c64459145f4d80b6462"
    )
