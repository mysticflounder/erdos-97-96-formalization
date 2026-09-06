# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

import certify_exact13_record2_full_cone as target


def test_record2_single_center_survivors() -> None:
    for center in target.CENTERS:
        entries, survivors = target.single_center_table(center)
        assert len(entries) == 495
        assert tuple(survivors) == target.EXPECTED_SURVIVORS[center]


def test_record2_survivor_pairs_are_all_rejected() -> None:
    pairs = target.pair_table(
        list(target.EXPECTED_SURVIVORS[2]), list(target.EXPECTED_SURVIVORS[7])
    )
    assert len(pairs) == 8
    assert tuple(row["certificate"]["forms"][0] for row in pairs) == (
        target.EXPECTED_PAIR_FORMS
    )


def test_record2_group_is_stable() -> None:
    _record, group = target._record_and_group()
    assert group == [2, 205]
