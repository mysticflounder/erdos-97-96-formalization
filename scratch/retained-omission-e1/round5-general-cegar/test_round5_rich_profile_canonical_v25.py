from __future__ import annotations

import round5_rich_profile_canonical_v25 as v25


PROFILE: v25.Profile = (
    ((0, 1, 4, 8), (2, 3, 5, 9)),
    ((0, 4, 5, 8), (1, 6, 7, 9)),
    ((0, 4, 8, 9), (1, 5, 10, 11)),
)


def test_valid_class_swaps_have_one_canonical_representative() -> None:
    v25.validate_profile(PROFILE)
    members = v25.orbit(PROFILE)
    assert len(members) == 4
    assert {v25.canonical_profile(member) for member in members} == {members[0]}


def test_apex_zero_class_swap_is_not_quotiented() -> None:
    swapped = ((PROFILE[0][1], PROFILE[0][0]), PROFILE[1], PROFILE[2])
    assert v25.canonical_profile(swapped) != v25.canonical_profile(PROFILE)


def test_exact_case_point_label_stabilizer_is_identity() -> None:
    audit = v25.point_dihedral_audit()
    assert audit["candidate_count"] == 30
    assert audit["case_stabilizer_count"] == 1
    assert audit["case_stabilizer"] == [list(v25.POINTS)]


def test_profile_decoder_checks_all_encoding_level_partition_invariants() -> None:
    assignment = {
        f"rich_{i}_{c}_{point}": point in PROFILE[i][c]
        for i in range(3) for c in range(2) for point in v25.POINTS
    }
    assert v25.rich_profile(assignment) == PROFILE
