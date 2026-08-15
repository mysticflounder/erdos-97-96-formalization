"""Verify the v5 consumer mapping artifact and its provenance guards."""

from __future__ import annotations

import copy
import json
from pathlib import Path
from typing import Any

import map_consumers as mapper

HERE = Path(__file__).resolve().parent
MAPPING_PATH = HERE / "mapping.json"
RESULT_PATH = HERE / "verification.json"
MANIFEST_PATH = HERE / "SHA256SUMS"

EXPECTED_MANIFEST_FILES = {
    "INGRESS-CONTRACT.md",
    "README.md",
    "RESULTS.md",
    "map_consumers.py",
    "mapping.json",
    "test_v5.py",
    "verification.json",
    "verify.py",
}


def assert_near_example(
    example: dict[str, Any],
    fields: tuple[tuple[str, str, str, str, str], ...],
    components: dict[tuple[int, int], tuple[int, int]],
    entitlements: dict[str, dict[tuple[int, int, int], str | None]] | None = None,
) -> None:
    expected = mapper.equality_matrix(fields, example["mapping"], components)
    if example.get("equalities", example.get("actual_equalities")) != expected:
        raise AssertionError("stored equality matrix does not recompute")
    for name, *_ in fields:
        detail = example["equality_details"][name]
        if detail["source_entitled"] != expected[name]:
            raise AssertionError(f"bad source-entitlement flag for {name}")
        if expected[name] and detail["path"] is None:
            raise AssertionError(f"missing closure witness for {name}")
        if not expected[name] and detail["path"] is not None:
            raise AssertionError(f"spurious closure witness for {name}")
    if entitlements is not None:
        expected_signs = mapper.sign_satisfied(
            entitlements[example["branch"]], example["mapping"], example["polarity"]
        )
        if example["signs"] != expected_signs or not all(expected_signs.values()):
            raise AssertionError("stored six-sign matrix is not source-entitled")
        if not all(
            detail["source_entitled"] for detail in example["sign_details"].values()
        ):
            raise AssertionError("stored sign detail is not source-entitled")


def assert_seven_frontier_item(
    item: dict[str, Any],
    data: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
    expected_viable: bool,
) -> None:
    assert_near_example(item, mapper.SEVEN_FIELDS, components)
    missing_names = set(item["omitted_fields"])
    missing_fields = tuple(
        field for field in mapper.SEVEN_FIELDS if field[0] in missing_names
    )
    expected_equations = [
        mapper.field_edge_sides(data, item["mapping"], field)
        for field in missing_fields
    ]
    assert item["omitted_metric_equations"] == expected_equations
    actual_viable = mapper.missing_fields_are_consumer_viable(
        data, item["mapping"], missing_fields
    )
    assert actual_viable is expected_viable
    viability = item["consumer_viability"]
    assert viability["all_missing_fields_have_two_non_diagonal_sides"] is (
        expected_viable
    )
    assert viability["classification"] == (
        "CONSUMER_ELIGIBLE_MAPPING_FRONTIER"
        if expected_viable
        else "FORMALLY_MINIMAL_BUT_CONSUMER_INFEASIBLE"
    )


def verify_mapping() -> list[str]:
    artifact = json.loads(MAPPING_PATH.read_text())
    data = mapper.load_assignment()
    components, _ = mapper.build_closure(data)
    entitlements = mapper.build_order_entitlements(data)
    checks: list[str] = []

    assert artifact["schema"] == "freshthird-post-consumer-map-v5-3"
    assert artifact["input"]["assignment_sha256"] == mapper.sha256_file(
        mapper.ASSIGNMENT_PATH
    )
    assert artifact["input"]["v4_source_map_sha256"] == mapper.sha256_file(
        mapper.V4_SOURCE_MAP_PATH
    )
    for item in artifact["provenance"]["live_source_slices"].values():
        assert item["sha256"] == mapper.sha256_file(mapper.REPO / item["file"])
    checks.append("input and live-source SHA-256 provenance")

    rank_mutation = copy.deepcopy(data)
    rank_mutation["rank"] = list(reversed(rank_mutation["rank"]))
    assert mapper.build_order_entitlements(rank_mutation) == entitlements
    roles = data["roles"]
    ambiguous = (
        roles["c_first"],
        data["blockers"][roles["c_first"]],
        roles["c_second"],
    )
    assert entitlements["direct"][ambiguous] is None
    assert entitlements["mirror"][ambiguous] is None
    assert artifact["provenance"]["signed_area_entitlement_counts"] == (
        mapper.entitlement_counts(entitlements)
    )
    checks.append(
        "signed-area entitlement ignores frozen rank and intersects both btw arms"
    )

    five = artifact["five_row"]
    assert five["full_mapping_count_theorem_faithful"] == 0
    assert five["full_mapping_count_injective"] == 0
    assert five["best_equality_score_out_of_10_after_all_six_signs"] == 6
    assert five["best_injective_equality_score_out_of_10_after_all_six_signs"] == 6
    assert len(five["minimal_missing_sets_theorem_faithful"]) == 38
    assert [
        item["missing_fields"] for item in five["minimal_missing_sets_injective"]
    ] == [["OA_AC", "OA_AX6", "OA_OC", "OA_OD"]]
    for key in (
        "minimal_missing_sets_theorem_faithful",
        "minimal_missing_sets_injective",
    ):
        for item in five[key]:
            assert len(item["missing_fields"]) == 4
            assert_near_example(
                item["example"], mapper.FIVE_FIELDS, components, entitlements
            )
    checks.append("FiveRow full-map absence and all minimal four-premise obstructions")

    seven = artifact["seven_point"]
    assert seven["full_mapping_count_theorem_faithful"] == 0
    assert seven["full_mapping_count_injective"] == 0
    assert seven["minimum_omitted_premises_theorem_faithful"] == 2
    assert seven["minimum_omitted_premises_viable_theorem_faithful"] == 4
    assert seven["minimum_omitted_premises_injective"] == 4
    assert len(seven["minimal_omission_sets_viable_theorem_faithful"]) == 10
    assert [
        item["omitted_fields"]
        for item in seven["minimal_omission_sets_theorem_faithful"]
    ] == [
        ["OA_OB", "BC_BV"],
        ["AO_AB", "BC_BU"],
        ["AO_AB", "VA_VU"],
        ["AO_AB", "WO_WU"],
    ]
    assert [
        item["omitted_fields"]
        for item in seven["minimal_omission_sets_viable_theorem_faithful"]
    ] == [
        ["OA_OB", "OA_OC", "BC_BV", "WO_WB"],
        ["OA_OB", "AO_AB", "BC_BU", "BC_BV"],
        ["OA_OB", "AO_AB", "BC_BU", "WO_WB"],
        ["OA_OB", "AO_AB", "BC_BV", "WO_WB"],
        ["OA_OB", "AO_AB", "VA_VU", "WO_WB"],
        ["OA_OB", "AO_AB", "WO_WB", "WO_WU"],
        ["OA_OB", "BC_BU", "BC_BV", "WO_WB"],
        ["OA_OB", "BC_BV", "WO_WB", "WO_WU"],
        ["AO_AB", "AO_AV", "AO_AW", "CA_CV"],
        ["AO_AB", "BC_BU", "BC_BV", "WO_WB"],
    ]
    assert [
        item["omitted_fields"] for item in seven["minimal_omission_sets_injective"]
    ] == [["AO_AB", "AO_AV", "AO_AW", "CA_CV"]]
    for item in seven["minimal_omission_sets_theorem_faithful"]:
        assert_seven_frontier_item(item, data, components, expected_viable=False)
    for key in (
        "minimal_omission_sets_viable_theorem_faithful",
        "minimal_omission_sets_injective",
    ):
        for item in seven[key]:
            assert_seven_frontier_item(item, data, components, expected_viable=True)
    checks.append("SevenPoint formal, viable theorem-faithful, and injective frontiers")

    malformed = copy.deepcopy(five["minimal_missing_sets_injective"][0]["example"])
    malformed["equalities"]["OA_AC"] = True
    try:
        assert_near_example(malformed, mapper.FIVE_FIELDS, components, entitlements)
    except AssertionError:
        pass
    else:
        raise AssertionError("malformed equality control was accepted")
    malformed_seven = copy.deepcopy(seven["minimal_omission_sets_theorem_faithful"][0])
    malformed_seven["omitted_metric_equations"][0]["both_sides_non_diagonal"] = True
    try:
        assert_seven_frontier_item(
            malformed_seven, data, components, expected_viable=False
        )
    except AssertionError:
        pass
    else:
        raise AssertionError("malformed diagonal-viability control was accepted")
    assert not list(HERE.glob("*.smt2"))
    assert artifact["smt"]["status"] == "not_run"
    checks.append(
        "malformed mapping and diagonal-viability controls rejected; SMT stop enforced"
    )
    return checks


def verify_manifest() -> None:
    rows = [line.split("  ", 1) for line in MANIFEST_PATH.read_text().splitlines()]
    assert {name for _, name in rows} == EXPECTED_MANIFEST_FILES
    for expected, name in rows:
        assert mapper.sha256_file(HERE / name) == expected


def main() -> None:
    checks = verify_mapping()
    result = {
        "schema": "freshthird-post-consumer-map-v5-verification-1",
        "status": "verified",
        "checks": checks,
    }
    RESULT_PATH.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if MANIFEST_PATH.exists():
        verify_manifest()
        result["manifest"] = "verified"
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
