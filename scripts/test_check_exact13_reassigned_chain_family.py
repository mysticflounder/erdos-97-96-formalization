# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Finite-family controls: provider transport, coverage counts, scope metadata."""

import copy
import json

import check_exact13_reassigned_chain_family as subject
import pytest


@pytest.fixture(scope="module")
def report():
    return json.loads(json.dumps(subject.build_report()))


def test_family(report):
    assert subject.verify_report(report)
    assert report["support_partitions"] == 60
    assert report["base_blocker_records"] == 2340
    assert report["role_records"] == 13572
    assert report["baseline_one_form"] == 2340
    assert report["baseline_two_form"] == 0
    assert report["baseline_no_one_or_two_form"] == 0
    assert report["complete_validator_tables"] == 13572 * 495**8
    assert report["live_source_leaves_eliminated"] == 0
    expanded = report["without_G10"]
    assert expanded["base_blocker_records"] == 3120
    assert expanded["role_records"] == 18096
    assert expanded["baseline_one_form"] == 3084
    assert expanded["baseline_two_form"] == 36
    assert expanded["baseline_no_one_or_two_form"] == 0
    assert expanded["weighted_one_form"] == 17880
    assert expanded["weighted_two_form"] == 216
    subject.base.validate_cell(report["representative"])


@pytest.mark.parametrize("key", ("role_records", "free_global_rows", "checked_links", "live_source_leaves_eliminated"))
def test_reject_changed_counts(report, key):
    bad = copy.deepcopy(report)
    bad[key] += 1
    with pytest.raises(ValueError, match="retained report mismatch"):
        subject.verify_report(bad)


def test_wrong_provider_transport():
    mapping = list(subject.POSITION_TO_RAW)
    mapping[4], mapping[7] = mapping[7], mapping[4]
    with pytest.raises(ValueError, match="provider transport"):
        subject.check_transport(mapping)


def test_global_provider_cannot_be_blocker(report):
    cell = copy.deepcopy(report["representative"])
    cell["roles"]["b0"] = 10
    with pytest.raises(AssertionError):
        subject.base.validate_cell(cell)


def test_wrong_source_z(report):
    cell = copy.deepcopy(report["representative"])
    cell["roles"]["z"] = 8
    with pytest.raises(AssertionError):
        subject.base.validate_cell(cell)
