# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_shared_pair_separation as separation

SURVIVORS = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "paused_projected_current_source_survivors_162_20260729"
    / "survivors.jsonl"
)


@pytest.fixture(scope="module")
def first_source() -> tuple[dict[str, object], dict[str, object]]:
    record = json.loads(SURVIVORS.read_text(encoding="utf-8").splitlines()[0])
    certificate = separation.build_certificate(record, None)
    return record, certificate


def test_first_survivor_has_complete_deterministic_coverage(
    first_source: tuple[dict[str, object], dict[str, object]],
) -> None:
    record, certificate = first_source
    assert certificate["summary"]["core_count"] in (21, 22)
    assert certificate["summary"]["cap_order_count"] == 24
    assert certificate["summary"]["rejected_order_count"] == 24
    assert separation.replay_certificate(certificate) == certificate
    assert separation.replay_against_source(certificate, record, None) == certificate
    assert separation.build_certificate(record, None) == certificate


@pytest.mark.parametrize(
    ("field", "mutate"),
    [
        ("rows", lambda value: value[0]["support"].reverse()),
        ("cap_facts", lambda value: value.__setitem__(0, [3, 2])),
        (
            "cores",
            lambda value: value[0].__setitem__("first_point", 9),
        ),
        (
            "order_coverage",
            lambda value: value[0].__setitem__("violating_core_sha256", "0" * 64),
        ),
        (
            "summary",
            lambda value: value.__setitem__("rejected_order_count", 23),
        ),
    ],
)
def test_replay_rejects_tampering(
    first_source: tuple[dict[str, object], dict[str, object]],
    field: str,
    mutate: object,
) -> None:
    _record, certificate = first_source
    tampered = copy.deepcopy(certificate)
    mutate(tampered[field])  # type: ignore[operator]
    with pytest.raises(separation.SharedPairSeparationError):
        separation.replay_certificate(tampered)


def test_full_frozen_survivor_stream_is_rejected() -> None:
    records = separation.read_survivors(SURVIVORS)
    assert len(records) == 162
    previous = None
    histogram: dict[int, int] = {}
    for record in records:
        certificate = separation.build_certificate(record, previous)
        separation.replay_against_source(certificate, record, previous)
        summary = certificate["summary"]
        assert summary["rejected_order_count"] == 24
        core_count = summary["core_count"]
        histogram[core_count] = histogram.get(core_count, 0) + 1
        previous = record["record_sha256"]
    assert histogram == {21: 28, 22: 134}
