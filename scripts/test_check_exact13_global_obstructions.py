# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import check_exact13_global_obstructions as subject


def record0():
    return json.loads(subject.INPUT.read_text())["survivors"][0]


def test_record0_center2_exhausts_all_supports_with_known_split():
    result = subject.scan_center(record0(), 2)
    assert result["status"] == "EXHAUSTED"
    assert result["counts"] == {"one_form": 437, "two_form": 58, "covered": 495}
    assert len(result["certificates"]) == 495


def test_certificate_replay_rejects_omitted_support():
    result = subject.scan_center(record0(), 2)
    result["center"] = 2
    result["certificates"].pop()
    result["counts"]["covered"] = 494
    with pytest.raises(ValueError, match="incomplete exhausted coverage"):
        subject.check_exhausted_entry(record0(), result)


def test_certificate_replay_rejects_tampered_form():
    result = subject.scan_center(record0(), 2)
    result["center"] = 2
    item = result["certificates"][0]
    bad = list(item["forms"])
    if len(bad) == 1:
        bad[0] = (bad[0] + 1) % subject.FORM_COUNT
    else:
        bad[0] = [bad[0][0] + 1, bad[0][1]]
    item = {**item, "forms": bad}
    with pytest.raises(ValueError, match="certificate"):
        subject.check_exhausted_entry(record0(), {**result, "certificates": [item] + result["certificates"][1:]})
