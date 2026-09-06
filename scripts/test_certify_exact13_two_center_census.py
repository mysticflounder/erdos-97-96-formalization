import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import certify_exact13_two_center_census as subject


def record2():
    return json.loads(subject.cone.INPUT.read_text())["survivors"][2]


def test_record2_two_center_counts():
    for center, expected in ((2, (460, 33, 2)), (7, (477, 14, 4))):
        table, survivors = subject.scan_center(record2(), center)
        assert len(table["supports"]) == 495
        assert (table["counts"]["one_form"], table["counts"]["two_form"], len(survivors)) == expected


def test_record2_pair_forms():
    left = ((1, 3, 5, 9), (1, 4, 5, 9))
    right = ((1, 2, 3, 5), (1, 2, 4, 5), (1, 3, 5, 9), (1, 4, 5, 9))
    cancellations, unresolved = subject.pair_closure(record2(), (2, 7), left, right)
    assert not unresolved
    assert [row["certificate"]["forms"][0] for row in cancellations] == [378, 392, 168, 168, 392, 386, 168, 168]


def test_uncertified_group_universe():
    _records, groups = subject.records_and_groups()
    assert len(groups) == 197


def test_active_pair_falls_back_when_priority_centers_are_inactive():
    record = {"roles": {"b0": 2, "b1": 7}}
    assert subject.active_pair(record) == (6, 3)


def test_third_center_prefers_six_when_active():
    assert subject.third_center(record2(), (2, 7)) == 6


def test_residual_pairs_have_no_third_center_survivor():
    records = json.loads(subject.cone.INPUT.read_text())["survivors"]
    leaves = (
        (208, (0, 4, 5, 10), (3, 6, 9, 12), (3, 478, 17)),
        (214, (0, 3, 5, 10), (4, 6, 9, 12), (3, 458, 37)),
    )
    for index, support2, support7, counts in leaves:
        pair = {"support_left": list(support2), "support_right": list(support7)}
        table, survivors = subject.scan_third_center(records[index], (2, 7), pair, 3)
        assert not survivors
        assert table["counts"] == {
            "one_form": counts[1],
            "two_form": counts[2],
            "survivors": 0,
            "covered": 495,
        }
