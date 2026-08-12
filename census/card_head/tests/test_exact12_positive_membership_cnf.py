from __future__ import annotations

import copy
import itertools

import pytest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_positive_membership_cnf import (
    PositiveMembershipCnfError,
    compile_fresh_positive_membership_extension,
    compile_positive_membership_bank,
    normalize_memberships,
)
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)


def _instance() -> SourceFaithfulCoverInstance:
    return SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )


PATTERN = (
    {"center": 3, "support": (4, 6)},
    {"center": 7, "support": (4, 6)},
    {"center": 11, "support": (3, 6, 7)},
)


def test_normalize_merges_repeated_centers_and_rejects_bad_patterns() -> None:
    assert normalize_memberships(
        12,
        (
            {"center": 3, "support": (4,)},
            {"center": 3, "support": (6,)},
            {"center": 11, "support": (3, 6, 7)},
        ),
    ) == ((3, (4, 6)), (11, (3, 6, 7)))
    with pytest.raises(PositiveMembershipCnfError, match="empty pattern"):
        normalize_memberships(12, ())
    with pytest.raises(PositiveMembershipCnfError, match="exceeds row cardinality"):
        normalize_memberships(
            12,
            (
                {"center": 3, "support": (0, 1, 2)},
                {"center": 3, "support": (4, 5)},
            ),
        )


def test_auxiliary_delta_is_deterministic_and_matches_direct_semantics() -> None:
    first = _instance()
    second = _instance()
    compiled = compile_positive_membership_bank(first, (PATTERN,))
    replayed = compile_positive_membership_bank(second, (copy.deepcopy(PATTERN),))
    assert compiled.as_dict() == replayed.as_dict()
    assert compiled.final_n_variables == compiled.initial_n_variables + 3
    assert compiled.final_n_clauses == (
        compiled.initial_n_clauses
        + sum(len(item["candidate_indices"]) for item in compiled.pattern_definitions)
        + 1
    )

    definitions = {
        (item["center"], tuple(item["required"])): item
        for item in compiled.pattern_definitions
    }
    block = tuple(compiled.entries[0]["blocking_clause"])
    assert block == tuple(
        -definitions[(center, required)]["pattern_variable"]
        for center, required in compiled.pattern_keys[0]
    )

    # Under one-hot row selection, the auxiliary CNF has an extension exactly
    # when at least one selected row fails its required subset.
    per_center = []
    for center, required in compiled.pattern_keys[0]:
        per_center.append(
            [
                set(required) <= set(candidate)
                for candidate in first.candidates[center]
            ]
        )
    assert all(any(flags) and not all(flags) for flags in per_center)
    for first_contains in (False, True):
        for second_contains in (False, True):
            for third_contains in (False, True):
                contains = (first_contains, second_contains, third_contains)
                selected_variables = set()
                for (center, _required), flags, wanted in zip(
                    compiled.pattern_keys[0], per_center, contains, strict=True
                ):
                    candidate_index = flags.index(wanted)
                    selected_variables.add(
                        first.choice_variables[(center, candidate_index)]
                    )
                pattern_variables = tuple(
                    definition["pattern_variable"]
                    for definition in compiled.pattern_definitions
                )

                def satisfies(
                    auxiliary_values: tuple[bool, ...],
                    selected: frozenset[int] = frozenset(selected_variables),
                    patterns: tuple[int, ...] = pattern_variables,
                ) -> bool:
                    positive = selected | {
                        variable
                        for variable, value in zip(
                            patterns, auxiliary_values, strict=True
                        )
                        if value
                    }
                    return all(
                        any(
                            (literal > 0 and literal in positive)
                            or (literal < 0 and -literal not in positive)
                            for literal in clause
                        )
                        for clause in compiled.delta_clauses
                    )

                auxiliary_extension_exists = any(
                    satisfies(values)
                    for values in itertools.product((False, True), repeat=3)
                )
                assert auxiliary_extension_exists == (not all(contains))


def test_compile_rejects_reuse_duplicate_and_unrealizable_requirement() -> None:
    instance = _instance()
    compile_positive_membership_bank(instance, (PATTERN,))
    with pytest.raises(PositiveMembershipCnfError, match="already installed"):
        compile_positive_membership_bank(instance, (PATTERN,))
    with pytest.raises(PositiveMembershipCnfError, match="duplicate pattern"):
        compile_positive_membership_bank(_instance(), (PATTERN, PATTERN))
    with pytest.raises(PositiveMembershipCnfError, match="no candidate realization"):
        compile_positive_membership_bank(
            _instance(),
            (({"center": 0, "support": (1, 2, 3, 6)},),),
        )


def test_fresh_extension_appends_after_an_existing_membership_bank() -> None:
    instance = _instance()
    first = compile_positive_membership_bank(instance, (PATTERN,))
    extension_pattern = (
        {"center": 0, "support": (2, 3)},
        {"center": 6, "support": (2, 3)},
        {"center": 10, "support": (0, 2, 6)},
    )
    extension = compile_fresh_positive_membership_extension(
        instance, (extension_pattern,)
    )
    assert extension.initial_n_variables == first.final_n_variables
    assert extension.initial_n_clauses == first.final_n_clauses
    assert extension.final_n_variables == extension.initial_n_variables + 3
    assert len(extension.entries) == 1

    with pytest.raises(PositiveMembershipCnfError, match="already installed"):
        compile_fresh_positive_membership_extension(instance, (PATTERN,))
