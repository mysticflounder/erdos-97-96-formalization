# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from dataclasses import replace

import pytest

import census.p97_search.freshthird_firstnonhit_common_only_v7 as v7
import census.p97_search.freshthird_firstnonhit_common_payload_v6 as v6


def _json(data: bytes) -> dict[str, object]:
    return json.loads(data)


@pytest.fixture(scope="module")
def bundles() -> tuple[v6.Bundle, v7.Bundle]:
    return v6.emit_bundle(17), v7.emit_bundle(17)


def test_v7_preserves_exact_v6_prefix_and_ends_in_polarized_common_units(
    bundles: tuple[v6.Bundle, v7.Bundle],
) -> None:
    predecessor, current = bundles
    v6_lines = predecessor.cnf.splitlines()
    v7_lines = current.cnf.splitlines()
    assert v6_lines[0] == b"p cnf 93280 606898"
    assert v7_lines[0] == b"p cnf 93342 638735"
    assert v7_lines[1 : 1 + v7.PREDECESSOR_CLAUSES] == v6_lines[1:]
    assert v7_lines[-2:] == [b"93212 0", b"-90537 0"]

    mapping = _json(current.variable_map)
    predecessor_map = _json(predecessor.variable_map)
    assert (
        mapping["variables"][: v7.PREDECESSOR_VARIABLES] == predecessor_map["variables"]
    )
    assert mapping["clauses"][: v7.PREDECESSOR_CLAUSES] == predecessor_map["clauses"]
    assert mapping["clauses"][-2:] == [
        {
            "id": 638_734,
            "family": "hingress",
            "role": "hingress/common_only/common_radius_payload_true",
            "literals": [93_212],
        },
        {
            "id": 638_735,
            "family": "hingress",
            "role": "hingress/common_only/retained_false",
            "literals": [-90_537],
        },
    ]


def test_source_current_reduced_payload_inventory_is_complete_and_pinned(
    bundles: tuple[v6.Bundle, v7.Bundle],
) -> None:
    _predecessor, current = bundles
    manifest = _json(current.manifest)
    mapping = _json(current.variable_map)
    sources = _json(current.sources)
    assert manifest["variables"] == 93_342
    assert manifest["clauses"] == 638_735
    assert manifest["cnf_sha256"] == (
        "81765f225d38b8433ee7704e2f8e2c19566d78842f37eeff08ed055a2a1794cd"
    )
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is True
    assert manifest["query_is_separate_assumption"] is True
    assert manifest["reduced_payload_source"] == v7.REDUCED_PAYLOAD_DECLARATION
    assert manifest["reduced_payload_source_theorem"] == v7.REDUCED_INGRESS_THEOREM
    assert manifest["reduced_payload_fields"] == list(v7.REDUCED_PAYLOAD_FIELDS)
    assert manifest["reduced_payload_complete_for_finite_assignment"] is True
    source_hashes = {row["path"]: row["sha256"] for row in sources["files"]}
    assert {
        v7.REDUCED_PAYLOAD_SOURCE_FILE: v7.SOURCE_HASHES[
            v7.REDUCED_PAYLOAD_SOURCE_FILE
        ],
        v7.INTERACTION_INGRESS_SOURCE_FILE: v7.SOURCE_HASHES[
            v7.INTERACTION_INGRESS_SOURCE_FILE
        ],
    }.items() <= source_hashes.items()
    assert sources["commit"] == v7.LEAN_COMMIT
    assert sources["target_file_revisions"] == {
        v7.REDUCED_PAYLOAD_SOURCE_FILE: v7.LEAN_COMMIT,
        v7.INTERACTION_INGRESS_SOURCE_FILE: v7.INTERACTION_INGRESS_SOURCE_COMMIT,
    }
    assert "current repository HEAD is not asserted" in sources["revision_policy"]
    delta = manifest["clause_delta"]
    assert delta["source_pair_arms"] == list(v7.SOURCE_PAIR_ARMS)
    assert delta["interaction_arms_per_side"] == list(v7.INTERACTION_ARMS)
    assert delta["normalized_residual_arms"] == list(v7.NORMALIZED_RESIDUAL_ARMS)
    assert delta["reduced_case_arms"] == list(v7.REDUCED_CASE_ARMS)
    assert delta["exact_trace_fields"] == list(v7.EXACT_TRACE_FIELDS)
    assert delta["five_center_deletion_arms"] == list(v7.FIVE_CENTER_DELETION_ARMS)
    assert (
        mapping["provenance"]["source_theorem"]["declaration"]
        == v7.REDUCED_INGRESS_THEOREM
    )


def test_common_leaf_has_no_retained_or_named_c_escape(
    bundles: tuple[v6.Bundle, v7.Bundle],
) -> None:
    _predecessor, current = bundles
    manifest = _json(current.manifest)
    mapping = _json(current.variable_map)
    contract = mapping["semantic_contract"]["common_only"]
    assert manifest["common_payload_active"] is True
    assert manifest["retained_active"] is False
    assert contract["independent_g_surface"] is True
    assert contract["identified_with_named_c"] is False
    assert mapping["provenance"]["independence_boundary"] == {
        "canonical_selector_mentions_in_delta": 0,
        "identified": False,
        "named_surface": "C",
        "producer_surface": "G.surface",
    }
    canonical = {
        row["id"]
        for row in mapping["variables"]
        if row["role"].startswith(("role/C1/", "role/C2/"))
    }
    assert not any(
        canonical.intersection(abs(literal) for literal in row["literals"])
        for row in mapping["clauses"][v7.PREDECESSOR_CLAUSES : -2]
    )
    assert [row["literals"] for row in mapping["clauses"][-2:]] == [[93_212], [-90_537]]


def test_faithful_six_center_boundary_is_explicitly_omitted(
    bundles: tuple[v6.Bundle, v7.Bundle],
) -> None:
    _predecessor, current = bundles
    manifest = _json(current.manifest)
    provenance = _json(current.variable_map)["provenance"]
    assert manifest["faithful_six_center_boundary_encoded"] is False
    assert manifest["faithful_six_center_boundary_omission"] == v7.SIX_CENTER_OMISSION
    assert provenance["omitted_unrepresentable_source_field"] == {
        "encoded": False,
        "missing_relations": ["classAt", "SelectedFourClass"],
        "reason": "FirstNonHitSourceTotalFiniteAssignment has neither relation",
        "source_type": "SixCenterFaithfulCarrierBoundary",
    }


def test_validator_rejects_prefix_suffix_and_reduced_delta_changes(
    bundles: tuple[v6.Bundle, v7.Bundle],
) -> None:
    _predecessor, current = bundles
    mapping = _json(current.variable_map)
    encoding = v7.Encoding(
        17,
        tuple(
            v7.VariableRecord(row["id"], row["role"]) for row in mapping["variables"]
        ),
        tuple(
            v7.ClauseRecord(
                row["id"], row["family"], row["role"], tuple(row["literals"])
            )
            for row in mapping["clauses"]
        ),
        mapping["semantic_contract"],
    )
    wrong_suffix = replace(
        encoding,
        clauses=(
            *encoding.clauses[:-1],
            replace(encoding.clauses[-1], literals=(90_537,)),
        ),
    )
    with pytest.raises(v7.EncodingError, match="clause delta drift"):
        v7.validate_semantic_encoding(wrong_suffix)
    wrong_prefix = replace(
        encoding,
        clauses=(
            replace(encoding.clauses[0], literals=encoding.clauses[1].literals),
            *encoding.clauses[1:],
        ),
    )
    with pytest.raises(v7.EncodingError, match="v6 clause prefix changed"):
        v7.validate_semantic_encoding(wrong_prefix)
    wrong_delta = replace(
        encoding,
        clauses=(
            *encoding.clauses[: v7.PREDECESSOR_CLAUSES],
            replace(
                encoding.clauses[v7.PREDECESSOR_CLAUSES],
                literals=tuple(
                    -literal
                    for literal in encoding.clauses[v7.PREDECESSOR_CLAUSES].literals
                ),
            ),
            *encoding.clauses[v7.PREDECESSOR_CLAUSES + 1 :],
        ),
    )
    with pytest.raises(v7.EncodingError, match="clause delta drift"):
        v7.validate_semantic_encoding(wrong_delta)
