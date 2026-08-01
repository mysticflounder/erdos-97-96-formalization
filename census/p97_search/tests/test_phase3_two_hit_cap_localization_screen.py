import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.phase3_two_hit_cap_localization_screen import (
    clause_violations,
    screen_records,
)


def _assignment(*true_variables: str) -> dict[str, bool]:
    return {variable: True for variable in true_variables}


def test_other_moser_center_falsifies_clause() -> None:
    assignment = _assignment(
        "f[3,0]",
        "f[4,0]",
        "s[0,3]",
        "s[0,4]",
        "s[1,3]",
        "s[1,4]",
    )
    assert clause_violations(assignment) == [{"i": 0, "a": 3, "b": 4, "c": 1}]


def test_non_moser_center_in_same_cap_satisfies_clause() -> None:
    assignment = _assignment(
        "f[3,0]",
        "f[4,0]",
        "f[5,0]",
        "s[0,3]",
        "s[0,4]",
        "s[5,3]",
        "s[5,4]",
    )
    assert clause_violations(assignment) == []


def test_screen_counts_records_and_all_witnesses() -> None:
    violating = {
        "index": 7,
        "raw_sat_index": 11,
        "record_sha256": "abc",
        "semantic_assignment": _assignment(
            "b[0,1]",
            "f[3,2]",
            "f[6,2]",
            "s[2,3]",
            "s[2,6]",
            "s[9,3]",
            "s[9,6]",
        ),
    }
    inert = {"index": 8, "semantic_assignment": _assignment("s[0,3]")}
    result = screen_records([violating, inert])
    assert result["records"] == 2
    assert result["rejected"] == 1
    assert result["surviving"] == 1
    assert result["violation_witnesses"] == 1
    assert result["rejected_records"][0]["violations"] == [
        {"i": 2, "a": 3, "b": 6, "c": 9}
    ]
