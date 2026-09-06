# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Positive and corrupted-certificate controls for the conditional chain cell."""

import copy
import json

import check_exact13_three_chain_cell as subject
import pytest


@pytest.fixture(scope="module")
def report():
    """Generate the finite coverage certificate once for mutation tests."""
    return json.loads(json.dumps(subject.build_report()))


def test_all_supports_and_mirror(report):
    assert subject.verify_report(report)
    assert (report["covered"], report["one_form"], report["two_form"]) == (495, 423, 72)
    assert report["checked_chain_links"] == 9
    assert report["strict_form_instances_in_links"] == 10
    assert report["mirror_checked"]


def test_wrong_chain_direction():
    with pytest.raises(ValueError, match="chain link"):
        subject.check_links(chains=((6, 7, 5, 4), *subject.CHAINS[1:]))


def test_wrong_gap_arm():
    with pytest.raises(ValueError, match="chain link"):
        subject.check_links(links=(((0, 6, 7, 10, 1),), *subject.LINK_FORMS[1:]))


@pytest.mark.parametrize("mutation", ("missing", "duplicate", "count", "form", "pivot"))
def test_corrupted_coverage(report, mutation):
    bad = copy.deepcopy(report)
    if mutation == "missing":
        bad["certificates"].pop()
    elif mutation == "duplicate":
        bad["certificates"][-1] = bad["certificates"][0]
    elif mutation == "count":
        bad["one_form"] += 1
    elif mutation == "form":
        bad["certificates"][0]["forms"][0][-1] = 2
    else:
        bad["pivot"] = 9
    with pytest.raises(ValueError):
        subject.verify_report(bad)


def test_no_link_after_removing_required_row():
    with pytest.raises(ValueError, match="chain link"):
        subject.check_links(rows=subject.MINIMAL_ROWS[1:])
