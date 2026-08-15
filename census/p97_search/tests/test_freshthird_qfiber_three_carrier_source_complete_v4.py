import hashlib
import itertools

import pytest

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfError,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    RESULT_SCHEMA,
    ROLES,
    ROWS,
    source_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_complete_v4 import (
    CLAUSE_TAGS,
    CONSTRAINT_GROUPS,
    PROFILE,
    QUERY_SCHEMA,
    SCHEMA,
    SOURCE_THEOREM,
    SOURCE_THEOREMS,
    FreshThirdCarrierSourceCompleteCnfEncoding,
    dry_run_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    FreshThirdCarrierSourceTotalCnfEncoding,
)


def _clauses_hold(
    clauses: tuple[tuple[int, ...], ...], values: dict[int, bool]
) -> bool:
    return all(
        any(values[abs(literal)] == (literal > 0) for literal in clause)
        for clause in clauses
    )


def _result_stub(
    encoding: FreshThirdCarrierSourceCompleteCnfEncoding,
) -> dict[str, object]:
    signature: dict[str, object] = {}
    manifest = encoding.encoding_manifest()
    return {
        "schema": RESULT_SCHEMA,
        "query_schema": QUERY_SCHEMA,
        "boundary_index": encoding.boundary_index,
        "source_manifest_sha256": hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest(),
        "constraint_groups": list(CONSTRAINT_GROUPS),
        "encoding_manifest": manifest,
        "encoding_manifest_sha256": hashlib.sha256(
            _canonical_json(manifest)
        ).hexdigest(),
        "status": "SAT_ABSTRACTION",
        "model_signature": signature,
        "model_signature_sha256": hashlib.sha256(
            _canonical_json(signature)
        ).hexdigest(),
        "claims": FALSE_CLAIMS,
    }


def test_source_complete_clause_and_variable_budget() -> None:
    predecessor = FreshThirdCarrierSourceTotalCnfEncoding(0)
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    expected_counts = {
        "SOURCE-ROW-OVERLAP": 364,
        "SOURCE-ROW-CAP": 168,
        "SOURCE-ROW-OUTSIDE-CAP": 1_638,
        "SOURCE-HAS4-CONGRUENCE": 67_938,
        "SOURCE-PINNED-OVERLAP": 8,
        "SOURCE-PINNED-ORDER": 169,
        "SOURCE-PINNED-ESCAPE": 59,
        "SOURCE-PINNED-BLOCKER": 376,
        "SOURCE-PINNED-NORMALIZED": 247,
        "SOURCE-CARRIER-BOUNDARY": 4,
        "SOURCE-CARRIER-FAN": 556,
        "SOURCE-CARRIER-NORMALIZED": 247,
    }

    assert tuple(expected_counts) == CLAUSE_TAGS
    assert encoding.num_vars == predecessor.num_vars + 139
    assert {
        tag: encoding.clause_counts[tag] for tag in CLAUSE_TAGS
    } == expected_counts
    assert len(encoding.clauses) == len(predecessor.clauses) + sum(
        expected_counts.values()
    )


def test_row_cap_clause_has_exact_implication_truth_table() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    _origin, slots, center = ROWS["source"]
    selected = slots[:3]
    center_in_cap = encoding.in_cap(center, 0)
    slot_vars = tuple(encoding.in_cap(slot, 0) for slot in selected)
    clause = (-center_in_cap, *(-var for var in slot_vars))
    assert clause in encoding.clauses

    for center_value, *slot_values in itertools.product((False, True), repeat=4):
        values = {center_in_cap: center_value}
        values.update(dict(zip(slot_vars, slot_values, strict=True)))
        assert _clauses_hold((clause,), values) == (
            not center_value or not all(slot_values)
        )


def test_outside_cap_overlap_clause_has_exact_truth_table() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    left, right = "source", "fresh"
    first, second = ROWS[left][1][:2]
    left_cap = encoding.in_cap(ROWS[left][2], 0)
    right_cap = encoding.in_cap(ROWS[right][2], 0)
    same_center = encoding.same(ROWS[left][2], ROWS[right][2])
    first_incident = encoding.incident(first, right)
    first_cap = encoding.in_cap(first, 0)
    second_incident = encoding.incident(second, right)
    second_cap = encoding.in_cap(second, 0)
    variables = (
        left_cap,
        right_cap,
        same_center,
        first_incident,
        first_cap,
        second_incident,
        second_cap,
    )
    clause = (
        -left_cap,
        -right_cap,
        same_center,
        -first_incident,
        first_cap,
        -second_incident,
        second_cap,
    )
    assert clause in encoding.clauses

    for truth_values in itertools.product((False, True), repeat=len(variables)):
        values = dict(zip(variables, truth_values, strict=True))
        forbidden = (
            values[left_cap]
            and values[right_cap]
            and not values[same_center]
            and values[first_incident]
            and not values[first_cap]
            and values[second_incident]
            and not values[second_cap]
        )
        assert _clauses_hold((clause,), values) == (not forbidden)


def test_ordered_endpoint_contains_explicit_outside_cap_at_least_two_clause() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    witness = encoding.source_witness("ordered", 0, 0)
    choice = encoding.cap_choice("row", 0)
    selected = ROWS["boundary"][1][:3]
    clause = (
        -witness,
        -choice,
        *(-encoding.in_cap(slot, 0) for slot in selected),
    )
    assert clause in encoding.clauses


def test_has_four_congruence_has_exact_truth_table() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    left, right = ROLES[:2]
    center = encoding.row_centers[0]
    same = encoding.same(left, right)
    left_has_four = encoding.has_four(left, center)
    right_has_four = encoding.has_four(right, center)
    clauses = (
        (-same, -left_has_four, right_has_four),
        (-same, left_has_four, -right_has_four),
    )
    assert all(clause in encoding.clauses for clause in clauses)

    for same_value, left_value, right_value in itertools.product(
        (False, True), repeat=3
    ):
        values = {
            same: same_value,
            left_has_four: left_value,
            right_has_four: right_value,
        }
        assert _clauses_hold(clauses, values) == (
            not same_value or left_value == right_value
        )


def test_pinned_blocker_branch_matches_source_dichotomy() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    center = "blockerCenter0"
    row = "blocker0"
    same = encoding.same("pinnedCenter", center)
    nonrobust = encoding.nonrobust("pinnedCenter")
    incidence = tuple(encoding.incident(f"fanSource{i}", row) for i in range(4))
    clauses = (
        (-same, nonrobust),
        *((-same, incident) for incident in incidence),
        *(
            (same, *(-incidence[index] for index in selected))
            for selected in itertools.combinations(range(4), 3)
        ),
    )
    assert all(clause in encoding.clauses for clause in clauses)

    has_four = encoding.has_four(ROLES[0], center)
    role_incident = encoding.incident(ROLES[0], row)
    assert (role_incident, has_four) in encoding.clauses
    assert (-role_incident, -has_four) in encoding.clauses
    assert (-encoding.has_four(ROWS[row][1][0], center),) in encoding.clauses

    for same_value, nonrobust_value, *incidence_values in itertools.product(
        (False, True), repeat=6
    ):
        values = {same: same_value, nonrobust: nonrobust_value}
        values.update(dict(zip(incidence, incidence_values, strict=True)))
        expected = (
            not same_value or (nonrobust_value and all(incidence_values))
        ) and (same_value or sum(incidence_values) <= 2)
        assert _clauses_hold(clauses, values) == expected


def test_source_witnesses_are_required_and_one_way_sound() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    ordered = tuple(
        encoding.source_witness("ordered", orientation, arm)
        for orientation in range(2)
        for arm in range(4)
    )
    assert ordered in encoding.clauses

    repeated = tuple(
        encoding.source_witness("pinned-repeated", i, j, cap)
        for i in range(4)
        for j in range(4)
        if i != j
        for cap in range(3)
    )
    root_aliases = tuple(
        encoding.same("pinnedCenter", f"blockerCenter{i}") for i in range(4)
    )
    fallback = encoding.source_witness("pinned-fallback", 0)
    mutual = tuple(
        encoding.source_witness("pinned-mutual", i, j)
        for i in range(4)
        for j in range(4)
        if i != j
    )
    for alias in root_aliases:
        assert (-fallback, -alias) in encoding.clauses
    distinct_clauses = tuple((-fallback, -alias) for alias in root_aliases)
    for fallback_value, *alias_values in itertools.product((False, True), repeat=5):
        values = {fallback: fallback_value}
        values.update(dict(zip(root_aliases, alias_values, strict=True)))
        assert _clauses_hold(distinct_clauses, values) == (
            not fallback_value or not any(alias_values)
        )
    assert (-fallback, *repeated) in encoding.clauses
    assert (-fallback, *mutual) in encoding.clauses
    assert any(
        clause[0] == -repeated[0] and len(clause) == 2
        for clause in encoding.clauses
    )
    center_witness = encoding.source_witness("pinned-center", 0, 0)
    assert (-center_witness, encoding.same("pinnedCenter", "blockerCenter0")) in encoding.clauses
    witness = repeated[0]
    assert any(
        clause[0] == -witness and len(clause) == 2 for clause in encoding.clauses
    )


def test_manifest_binds_complete_source_schema_and_theorems() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(1)
    manifest = encoding.encoding_manifest()
    variable_map = encoding.variable_map()

    assert manifest["schema"] == SCHEMA
    assert manifest["profile"] == PROFILE
    assert manifest["source_theorem"] == SOURCE_THEOREM
    assert manifest["source_theorems"] == list(SOURCE_THEOREMS)
    assert manifest["source_fields_realized_by_canonical_readback"] == [
        "radius(center,left) = radius(center,right) for every named exact row",
    ]
    assert manifest["learned_stream_imported"] is False
    assert set(CLAUSE_TAGS).issubset(manifest["clause_counts"])
    assert variable_map["schema"] == SCHEMA
    assert variable_map["num_variables"] == encoding.num_vars
    assert CONSTRAINT_GROUPS[-1] == "source_complete_finite_theory"


def test_result_metadata_is_fail_closed_for_source_groups() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(2)
    result = _result_stub(encoding)
    encoding._validate_result_metadata(result)
    result["constraint_groups"] = list(CONSTRAINT_GROUPS[:-1])
    with pytest.raises(FreshThirdCarrierCnfError, match="constraint groups"):
        encoding._validate_result_metadata(result)


def test_source_complete_assignment_api_validates_the_full_model() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    with pytest.raises(FreshThirdCarrierCnfError, match="model omits"):
        encoding.validate_source_complete_assignment({})


def test_dry_run_manifest_remains_launch_blocked() -> None:
    manifest = dry_run_manifest(3)
    assert manifest["launch_eligible"] is False
    assert manifest["encoding"]["boundary_index"] == 3


def test_source_complete_schema_rejects_external_clauses() -> None:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(0)
    with pytest.raises(FreshThirdCarrierCnfError, match="rejects iterative"):
        encoding.cnf_bytes(((1,),))
