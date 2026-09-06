# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Regression and scope controls for the complete five-row survivor census."""

import copy
import json
from pathlib import Path

import check_exact13_baseline_survivor_family as subject
import pytest

REPORT = Path(__file__).resolve().parents[1] / "docs/audits/2026-09-05-exact13-baseline-survivor-family.json"


@pytest.fixture(scope="module")
def report():
    return json.loads(REPORT.read_text())


def test_exhaustive_replay(report):
    assert subject.verify_report(report)
    assert report["support_partitions"] == 180
    assert report["base_blocker_records"] == 10548
    assert report["role_records"] == 100308
    assert (report["baseline_one_form"], report["baseline_two_form"],
            report["baseline_no_one_or_two_form"]) == (9746, 262, 540)


def test_prior_seed_retained_without_filler_globals(report):
    seed = subject.prior.FIXED_ROWS
    assert any(item["roles"]["b0"] == seed[0][0] and item["roles"]["b1"] == seed[1][0]
               and item["base_rows"]["C0"] == list(seed[0][1])
               and item["base_rows"]["C1"] == list(seed[1][1]) for item in report["survivors"])
    assert all(set(item) == {"roles", "base_rows"} for item in report["survivors"])


def test_missing_survivor_rejected(report):
    bad = copy.deepcopy(report)
    bad["survivors"].pop()
    with pytest.raises(ValueError, match="survivor count mismatch"):
        subject.verify_report(bad)


def test_unsupported_all_center_claim_rejected(report):
    bad = copy.deepcopy(report)
    bad["all_center_survivors_produced"] = 1
    with pytest.raises(ValueError, match="unsupported coverage claim"):
        subject.verify_report(bad)


def test_primitive_ray_preserves_sign_and_unequal_weights():
    ray = subject.family.primitive_ray
    assert ray((((0, 1), 2), ((2, 3), -2))) == (((0, 1), 1), ((2, 3), -1))
    assert ray((((0, 1), -3), ((2, 3), 3))) == (((0, 1), -1), ((2, 3), 1))
    assert ray(()) == ()
