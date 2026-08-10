from __future__ import annotations

from pathlib import Path

import pytest

from census.p97_search.phase3_piqd_clause_admission import (
    ClauseAdmissionError,
    audit_clause_admission,
)


def _root(tmp_path: Path, body: str, *, clauses: int) -> Path:
    path = tmp_path / "root.cnf"
    path.write_text(f"p cnf 5 {clauses}\n{body}")
    return path


def test_accepts_novel_model_violated_batch(tmp_path: Path) -> None:
    root = _root(tmp_path, "1 0\n-2 3 0\n", clauses=2)
    audit = audit_clause_admission(
        root_cnf=root,
        root_clauses=2,
        max_var=5,
        candidates=((2, 4), (-3, 5)),
        assignment={2: False, 3: True, 4: False, 5: False},
        prior_batches=(((2, -5),),),
    )
    assert audit.candidate_clauses == 2
    assert audit.root_clauses_checked == 2
    assert audit.prior_clauses_checked == 1
    assert audit.model_violated_clauses == 2


@pytest.mark.parametrize("existing", ["2 4 0\n", "4 2 0\n", "2 0\n"])
def test_rejects_root_duplicate_or_subsumption(tmp_path: Path, existing: str) -> None:
    root = _root(tmp_path, existing, clauses=1)
    with pytest.raises(ClauseAdmissionError, match="root clause 1 already subsumes"):
        audit_clause_admission(
            root_cnf=root,
            root_clauses=1,
            max_var=5,
            candidates=((2, 4),),
            assignment={2: False, 4: False},
        )


def test_rejects_candidate_not_violated_by_model(tmp_path: Path) -> None:
    root = _root(tmp_path, "1 0\n", clauses=1)
    with pytest.raises(ClauseAdmissionError, match="not violated"):
        audit_clause_admission(
            root_cnf=root,
            root_clauses=1,
            max_var=5,
            candidates=((2, 4),),
            assignment={2: True, 4: False},
        )


def test_rejects_redundant_candidates_and_prior_subsumption(tmp_path: Path) -> None:
    root = _root(tmp_path, "1 0\n", clauses=1)
    assignment = {2: False, 3: False, 4: False}
    with pytest.raises(ClauseAdmissionError, match="subsumes another"):
        audit_clause_admission(
            root_cnf=root,
            root_clauses=1,
            max_var=5,
            candidates=((2,), (2, 3)),
            assignment=assignment,
        )
    with pytest.raises(ClauseAdmissionError, match="prior clause 1"):
        audit_clause_admission(
            root_cnf=root,
            root_clauses=1,
            max_var=5,
            candidates=((2, 4),),
            assignment=assignment,
            prior_batches=(((2,),),),
        )


def test_validates_full_dimacs_stream(tmp_path: Path) -> None:
    root = _root(tmp_path, "1\n-2 0\n", clauses=1)
    audit = audit_clause_admission(
        root_cnf=root,
        root_clauses=1,
        max_var=5,
        candidates=((3,),),
        assignment={3: False},
    )
    assert audit.root_clauses_checked == 1
    with pytest.raises(ClauseAdmissionError, match="dimensions disagree"):
        audit_clause_admission(
            root_cnf=root,
            root_clauses=2,
            max_var=5,
            candidates=((3,),),
            assignment={3: False},
        )
