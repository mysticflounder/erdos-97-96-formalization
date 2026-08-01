from __future__ import annotations

import sys
from itertools import combinations
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.critical_distance_profile import (
    FORBIDDEN_CLAIMS,
    CriticalDistanceProfile,
    CriticalDistanceProfileError,
    CriticalFourShellRow,
    DistancePartition,
    EqualityAtom,
    NoQFreeAfterDeletion,
    ProvenanceTag,
    canonical_edge,
    check_distance_partition,
    check_edge_relations,
    check_symbolic_consistency,
    emit_profile_clauses,
)

PROVENANCE = ProvenanceTag(
    "unit-test:critical-four-shell",
    "TEST_FIXTURE",
    "synthetic finite distance partition",
)


def _row(*, unique_four_radius: bool = False) -> CriticalFourShellRow:
    return CriticalFourShellRow(
        source=1,
        center=0,
        support=(4, 2, 1, 3),
        provenance=PROVENANCE,
        unique_four_radius=unique_four_radius,
    )


def _profile(
    n: int,
    *,
    unique_four_radius: bool = False,
    no_qfree: bool = False,
) -> CriticalDistanceProfile:
    row = _row(unique_four_radius=unique_four_radius)
    blocker = (
        (NoQFreeAfterDeletion(1, 0, PROVENANCE),)
        if no_qfree
        else ()
    )
    return CriticalDistanceProfile(
        profile_id="unit-test-profile",
        n=n,
        rows=(row,),
        no_qfree=blocker,
    )


def _partition(
    n: int,
    center_blocks: tuple[tuple[int, ...], ...],
) -> DistancePartition:
    assignments: dict[tuple[int, int], str] = {
        edge: f"unique-{edge[0]}-{edge[1]}"
        for edge in combinations(range(n), 2)
    }
    for block_index, block in enumerate(center_blocks):
        for label in block:
            assignments[canonical_edge(0, label)] = f"center-block-{block_index}"
    return DistancePartition.from_assignments(n, assignments)


def test_exact_whole_radius_rejects_a_fifth_member() -> None:
    profile = _profile(6)
    partition = _partition(6, ((1, 2, 3, 4, 5),))

    result = check_distance_partition(profile, partition)

    assert result.accepted is False
    assert result.status == "FINITE_PARTITION_REJECTED"
    assert any("fifth-or-later" in violation for violation in result.violations)


def test_no_qfree_rejects_a_hidden_four_class_after_source_deletion() -> None:
    profile = _profile(9, no_qfree=True)
    partition = _partition(9, ((1, 2, 3, 4), (5, 6, 7, 8)))

    result = check_distance_partition(profile, partition)

    assert result.accepted is False
    assert any("no_qfree" in violation for violation in result.violations)
    assert any("(5, 6, 7, 8)" in violation for violation in result.violations)


def test_global_equality_closure_rejects_transitive_disequality_conflict() -> None:
    edge_01 = canonical_edge(0, 1)
    edge_02 = canonical_edge(0, 2)
    edge_03 = canonical_edge(0, 3)

    result = check_edge_relations(
        4,
        equalities=(
            EqualityAtom(edge_01, edge_02),
            EqualityAtom(edge_02, edge_03),
        ),
        disequalities=(EqualityAtom(edge_01, edge_03),),
    )

    assert result.accepted is False
    assert result.status == "SYMBOLIC_RELATION_CONFLICT"
    assert any("equality/disequality conflict" in item for item in result.violations)


def test_valid_four_plus_three_plus_two_partition_is_accepted() -> None:
    profile = _profile(10, unique_four_radius=True, no_qfree=True)
    partition = _partition(10, ((1, 2, 3, 4), (5, 6, 7), (8, 9)))

    result = check_distance_partition(profile, partition)

    assert result.accepted is True
    assert result.status == "FINITE_PARTITION_ACCEPTED"
    assert result.violations == ()
    assert result.as_record()["trust"].endswith("NOT_EUCLIDEAN")
    assert result.as_record()["forbidden_claims"] == list(FORBIDDEN_CLAIMS)


def test_unique_four_rejects_an_other_class_of_size_four() -> None:
    profile = _profile(9, unique_four_radius=True)
    partition = _partition(9, ((1, 2, 3, 4), (5, 6, 7, 8)))

    result = check_distance_partition(profile, partition)

    assert result.accepted is False
    assert any("unique-four semantics" in item for item in result.violations)


def test_clause_emission_is_deterministic_provenance_tagged_and_scoped() -> None:
    profile = _profile(10, unique_four_radius=True, no_qfree=True)

    first = emit_profile_clauses(profile)
    second = emit_profile_clauses(profile)

    assert first.as_record() == second.as_record()
    assert check_symbolic_consistency(first).accepted is True
    metadata = first.metadata()
    assert metadata["lane"] == "K-A"
    assert metadata["status"] == "SYMBOLIC_CONSTRAINTS_ONLY"
    assert metadata["backend_contract"] == (
        "BACKEND_MUST_INTERPRET_ATOMS_AS_ONE_GLOBAL_EQUALITY_RELATION"
    )
    assert metadata["clause_kind_counts"] == {
        "critical-four-off-support-disequality": 5,
        "critical-four-selected-equality": 3,
        "no-qfree-after-source-deletion": 70,
        "unique-four-other-class-at-most-three": 5,
    }
    assert metadata["clause_count"] == 83
    assert metadata["forbidden_claims"] == list(FORBIDDEN_CLAIMS)
    assert metadata["provenance"] == [PROVENANCE.as_record()]


def test_optional_propositional_equivalence_axioms_are_complete_for_triples() -> None:
    profile = _profile(5)
    compiled = emit_profile_clauses(profile, include_equivalence_axioms=True)

    # There are C(C(5, 2), 3) edge triples and three transitivity
    # implications per triple.
    assert compiled.metadata()["clause_kind_counts"][
        "edge-equality-transitivity"
    ] == 3 * 120
    assert compiled.metadata()["backend_contract"] == (
        "PROPOSITIONAL_EQUIVALENCE_AXIOMS_INCLUDED"
    )
    assert check_symbolic_consistency(compiled).accepted is True


def test_unordered_partition_assignment_conflict_is_rejected() -> None:
    with pytest.raises(
        CriticalDistanceProfileError,
        match="global unordered-edge assignment conflict",
    ):
        DistancePartition.from_assignments(
            3,
            (
                ((0, 1), "radius-a"),
                ((1, 0), "radius-b"),
                ((0, 2), "radius-c"),
                ((1, 2), "radius-d"),
            ),
        )


def test_no_qfree_must_be_attached_to_a_matching_critical_row() -> None:
    with pytest.raises(
        CriticalDistanceProfileError,
        match="must reference a critical shell row",
    ):
        CriticalDistanceProfile(
            profile_id="orphan-blocker",
            n=6,
            rows=(_row(),),
            no_qfree=(NoQFreeAfterDeletion(2, 0, PROVENANCE),),
        )
