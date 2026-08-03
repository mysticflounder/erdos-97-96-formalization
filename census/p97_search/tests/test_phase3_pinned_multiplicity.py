from __future__ import annotations

import copy
import importlib
import itertools
from collections.abc import Mapping
from typing import Any

import pytest

v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)
pm = importlib.import_module("census.p97_search.phase3_pinned_multiplicity")


def _satisfies(clause: tuple[int, ...], assignment: Mapping[int, bool]) -> bool:
    return any(
        assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
        for literal in clause
    )


def _cyclic_auxiliary_assignment(encoding: Any) -> dict[int, bool]:
    """A concrete model of the new auxiliary fragment, not of the base CNF."""

    items = pm.edge_items()
    item_index = {edge: index for index, edge in enumerate(items)}
    groups: dict[int, int] = {}
    for center in range(pm.N):
        for offset in range(1, 5):
            point = (center + offset) % pm.N
            edge = (center, point) if center < point else (point, center)
            groups[item_index[edge]] = center

    assignment = {variable: False for variable in encoding.key_for}
    for center in range(pm.N):
        for point in range(pm.N):
            if center != point:
                assignment[encoding.var("s", center, point)] = (
                    (point - center) % pm.N in {1, 2, 3, 4}
                )
    for left, right in itertools.combinations(range(len(items)), 2):
        assignment[pm.equality_var(encoding, left, right)] = (
            left in groups and right in groups and groups[left] == groups[right]
        )
    for deleted in range(pm.N):
        center = (deleted - 1) % pm.N
        for candidate in range(pm.N):
            if candidate != deleted:
                assignment[pm.blocker_var(encoding, deleted, candidate)] = (
                    candidate == center
                )
    return assignment


def test_install_preserves_projected_namespace_and_exact_counts() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    data = pm.descriptor()

    assert encoding.num_vars == data["total_variable_count"] == 1194
    assert len(encoding.semantic_vars) == data["semantic_variable_count"] == 111
    assert encoding.var("s", 0, 1) == 1
    assert encoding.var("f", 9, 2) == 111
    assert pm.equality_var(encoding, 0, 1) == 115
    assert pm.blocker_var(encoding, 0, 1) == 1105
    assert tuple(encoding.semantic_vars) == tuple(range(1, 112))
    assert all(
        encoding.key_for[variable][0] not in {"pinned-eq", "pinned-low-blocker"}
        for variable in encoding.semantic_vars
    )
    assert sum(data["clause_counts"].values()) == data["added_clause_count"]
    assert len(encoding.clauses) == 58314
    assert {tag: encoding.clause_counts[tag] for tag in pm.CLAUSE_TAGS} == data[
        "clause_counts"
    ]


def test_equivalence_row_and_low_blocker_clauses_are_complete() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    tagged = pm.tagged_auxiliary_clauses(encoding)
    items = pm.edge_items()
    index = {edge: position for position, edge in enumerate(items)}

    for left, middle, right in itertools.combinations(range(len(items)), 3):
        eq_lm = pm.equality_var(encoding, left, middle)
        eq_lr = pm.equality_var(encoding, left, right)
        eq_mr = pm.equality_var(encoding, middle, right)
        assert (-eq_lm, -eq_mr, eq_lr) in tagged[pm.TAG_TRANSITIVITY]
        assert (-eq_lm, -eq_lr, eq_mr) in tagged[pm.TAG_TRANSITIVITY]
        assert (-eq_lr, -eq_mr, eq_lm) in tagged[pm.TAG_TRANSITIVITY]

    for center in range(pm.N):
        spokes = [point for point in range(pm.N) if point != center]
        for left, right in itertools.combinations(spokes, 2):
            left_edge = tuple(sorted((center, left)))
            right_edge = tuple(sorted((center, right)))
            assert (
                -encoding.var("s", center, left),
                -encoding.var("s", center, right),
                pm.equality_var(encoding, index[left_edge], index[right_edge]),
            ) in tagged[pm.TAG_ROW]

    for deleted in range(pm.N):
        choices = [
            pm.blocker_var(encoding, deleted, center)
            for center in range(pm.N)
            if center != deleted
        ]
        assert tuple(choices) in tagged[pm.TAG_BLOCKER_CHOICE]
        for left, right in itertools.combinations(choices, 2):
            assert (-left, -right) in tagged[pm.TAG_BLOCKER_CHOICE]
        for center in range(pm.N):
            if center == deleted:
                continue
            blocker = pm.blocker_var(encoding, deleted, center)
            assert (-blocker, encoding.var("s", center, deleted)) in tagged[
                pm.TAG_BLOCKER_LINK
            ]
            remaining = [
                point
                for point in range(pm.N)
                if point not in {center, deleted}
            ]
            for four_points in itertools.combinations(remaining, 4):
                anchor = index[tuple(sorted((center, four_points[0])))]
                expected = (
                    -blocker,
                    *(
                        -pm.equality_var(
                            encoding,
                            anchor,
                            index[tuple(sorted((center, point)))],
                        )
                        for point in four_points[1:]
                    ),
                )
                assert expected in tagged[pm.TAG_BLOCKER_MULTIPLICITY]


def test_auxiliary_fragment_has_a_concrete_sat_control() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    assignment = _cyclic_auxiliary_assignment(encoding)
    for clauses in pm.tagged_auxiliary_clauses(encoding).values():
        assert all(_satisfies(clause, assignment) for clause in clauses)


def test_all_forced_equalities_reject_every_incoming_blocker_choice() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    assignment = _cyclic_auxiliary_assignment(encoding)
    tagged = pm.tagged_auxiliary_clauses(encoding)
    for left, right in itertools.combinations(range(len(pm.edge_items())), 2):
        assignment[pm.equality_var(encoding, left, right)] = True

    for deleted in range(pm.N):
        incoming = [
            center
            for center in range(pm.N)
            if center != deleted and assignment[encoding.var("s", center, deleted)]
        ]
        assert incoming
        for center in incoming:
            candidate = copy.copy(assignment)
            for other in range(pm.N):
                if other != deleted:
                    candidate[pm.blocker_var(encoding, deleted, other)] = (
                        other == center
                    )
            assert any(
                not _satisfies(clause, candidate)
                for clause in tagged[pm.TAG_BLOCKER_MULTIPLICITY]
            )


def test_false_equality_is_not_promoted_to_a_distance_inequality() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    data = pm.descriptor()

    assert "does not assert a distance inequality" in data["equality_semantics"]
    assert pm.equality_var(encoding, 0, 1) > 0
    with pytest.raises(pm.PinnedMultiplicityError, match="diagonal equality"):
        pm.equality_var(encoding, 0, 0)


def test_resume_configuration_fails_closed_on_pinned_contract_drift() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    configuration = v3._base_configuration(
        encoding,
        timeout_s=1,
        learned_core_limit=1,
        survivor_limit=1,
        workers=1,
        parallel_mode="sequential",
        cube_depth=0,
        cube_artifact_mode="compact",
        bootstrap_results=None,
        algebraic_bootstraps=(),
        three_rhombus_prefix_bank_data=None,
    )
    assert v3._projected_static_v3_from_configuration(
        configuration, where="test configuration"
    )
    tampered = copy.deepcopy(configuration)
    tampered["pinned_multiplicity"]["descriptor_sha256"] = "0" * 64
    with pytest.raises(v3.StructuralCegarError, match="unsupported or mixed"):
        v3._projected_static_v3_from_configuration(
            tampered, where="tampered configuration"
        )
