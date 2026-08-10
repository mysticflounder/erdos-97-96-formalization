from __future__ import annotations

from math import comb
from pathlib import Path

import pytest

from census.p97_search.exact17_sparse_six_family import (
    SparseSixFamilyError,
    complete_family,
    repository_relative,
    scan_root,
    selected_variables,
    selected_variables_from_map,
    sparse_six_clause,
)
from census.p97_search.phase3_piqd_exact17_semantic import build_variable_map


def test_complete_exact17_family_has_one_clause_per_six_subset() -> None:
    order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
    family = complete_family(
        order, selected_variables_from_map(build_variable_map(), 17)
    )
    assert len(family) == comb(17, 6)
    assert all(
        len(clause) == 6 and all(literal < 0 for literal in clause) for clause in family
    )


def test_sparse_clause_uses_the_two_selected_rows() -> None:
    variables = selected_variables(17)
    assert sparse_six_clause((0, 6, 8, 15, 1, 13), variables) == (
        -143,
        -135,
        -130,
        -15,
        -13,
        -6,
    )


def test_scan_root_distinguishes_exact_subsumed_and_novel(tmp_path) -> None:
    candidates = complete_family(tuple(range(17)), selected_variables(17))[:3]
    exact = candidates[0]
    subsuming = candidates[1][:4]
    root = tmp_path / "root.cnf"
    root.write_text(
        "p cnf 272 3\n"
        + " ".join(map(str, exact))
        + " 0\n"
        + " ".join(map(str, subsuming))
        + " 0\n"
        + "1 -1 0\n"
    )
    scan = scan_root(root, candidates)
    assert scan.exact_present == {exact}
    assert scan.strictly_subsumed == {candidates[1]}
    assert candidates[2] not in scan.exact_present | scan.strictly_subsumed


def test_complete_family_rejects_non_exact17_order() -> None:
    with pytest.raises(SparseSixFamilyError, match="exact-17"):
        complete_family(tuple(range(16)), selected_variables(16))


def test_selected_variables_are_bound_to_authenticated_map() -> None:
    assert selected_variables_from_map(build_variable_map(), 17) == selected_variables(
        17
    )


def test_authenticated_paths_are_repository_relative() -> None:
    assert (
        repository_relative(
            (Path.cwd() / "census/p97_search/exact17_sparse_six_family.py").resolve()
        )
        == "census/p97_search/exact17_sparse_six_family.py"
    )
