# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact finite shadow showing why the Stage-I apex flip can cycle.

This specializes ``blocker_graph/countermodel.py`` with a three-cap profile
and checks the full finite interface used by the prescribed-apex deletion
argument: exact K4 classes, deletion blockers, both apex cover/one-hit rules,
singleton joint fibers, and a 5/5/5 cap profile.  The two survivor pairs then
alternate forever because each flip tests a fresh single deletion in the
original carrier and forgets the previous pair.

The shadow is not a Euclidean, convex, or MEC realization.  Its purpose is
strictly dependency diagnosis: any terminating iteration must add cumulative
erasure survival, or an order/critical-row field that rules out this cycle.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE / "blocker_graph" / "countermodel.py"
EXPECTED_BASE_SHA256 = (
    "1fd2a6efe5c72cf833429bd66ca5ca848cc32b811b76211504301ca6a20890b3"
)

APEX1 = 0
APEX2 = 4
TRIANGLE = frozenset({8, APEX1, APEX2})
SURPLUS_CAP = frozenset({0, 3, 4, 9, 10})
OPP_CAP1 = frozenset({1, 2, 4, 8, 11})
OPP_CAP2 = frozenset({0, 5, 6, 7, 8})
FIRST_PAIR = frozenset({1, 2})
MIRRORED_PAIR = frozenset({6, 7})


def load_base():
    digest = hashlib.sha256(BASE_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_BASE_SHA256
    spec = importlib.util.spec_from_file_location(
        "atail_blocker_graph_countermodel", BASE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module, digest


def has_k4_at(base, center: int, deleted: frozenset[int]) -> bool:
    return any(
        len(points) >= 4 for points in base.classes_at(center, deleted).values()
    )


def exact_class(base, center: int) -> frozenset[int]:
    classes = base.classes_at(center)
    large = [frozenset(points) for points in classes.values() if len(points) >= 4]
    assert len(large) == 1
    assert len(large[0]) == 4
    return large[0]


def check_apex_filter_rules(
    base,
    center: int,
    adjacent_a: frozenset[int],
    adjacent_b: frozenset[int],
    strict_opposite: frozenset[int],
) -> None:
    cover = adjacent_a | adjacent_b | strict_opposite
    for points in base.classes_at(center).values():
        radius_class = frozenset(points)
        assert radius_class <= cover
        assert len(radius_class & adjacent_a) <= 1
        assert len(radius_class & adjacent_b) <= 1


def survivor_sources(
    base,
    source_class: frozenset[int],
    target_center: int,
) -> frozenset[int]:
    return frozenset(
        source
        for source in source_class - SURPLUS_CAP
        if has_k4_at(base, target_center, frozenset({source}))
    )


def check() -> dict[str, object]:
    base, base_digest = load_base()
    assert base.check()["status"] == "PASS"
    carrier = frozenset(base.VERTICES)

    # Closed Moser-cap incidence arithmetic: the three pairwise intersections
    # are exactly the triangle vertices, and the union is the whole carrier.
    caps = (SURPLUS_CAP, OPP_CAP1, OPP_CAP2)
    assert tuple(map(len, caps)) == (5, 5, 5)
    assert SURPLUS_CAP | OPP_CAP1 | OPP_CAP2 == carrier
    assert SURPLUS_CAP & OPP_CAP1 == {APEX2}
    assert SURPLUS_CAP & OPP_CAP2 == {APEX1}
    assert OPP_CAP1 & OPP_CAP2 == {8}
    assert TRIANGLE == {
        next(iter(SURPLUS_CAP & OPP_CAP2)),
        next(iter(SURPLUS_CAP & OPP_CAP1)),
        next(iter(OPP_CAP1 & OPP_CAP2)),
    }

    first_class = exact_class(base, APEX1)
    second_class = exact_class(base, APEX2)
    assert first_class == {1, 2, 3, 5}
    assert second_class == {5, 6, 7, 9}

    first_strict = OPP_CAP1 - (SURPLUS_CAP | OPP_CAP2)
    second_strict = OPP_CAP2 - (SURPLUS_CAP | OPP_CAP1)
    check_apex_filter_rules(
        base, APEX1, SURPLUS_CAP, OPP_CAP2, first_strict
    )
    check_apex_filter_rules(
        base, APEX2, SURPLUS_CAP, OPP_CAP1, second_strict
    )

    # The unique single-deletion blocker in each three-point off-surplus class
    # is vertex 5.  The other two sources are exactly the extracted pair.
    first_off = first_class - SURPLUS_CAP
    second_off = second_class - SURPLUS_CAP
    assert first_off == {1, 2, 5}
    assert second_off == {5, 6, 7}
    assert survivor_sources(base, first_class, APEX2) == FIRST_PAIR
    assert survivor_sources(base, second_class, APEX1) == MIRRORED_PAIR
    assert not has_k4_at(base, APEX2, frozenset({5}))
    assert not has_k4_at(base, APEX1, frozenset({5}))

    # Each ordinary double deletion preserves the opposite apex class, so the
    # current theorem alternates FIRST_PAIR -> MIRRORED_PAIR -> FIRST_PAIR.
    assert has_k4_at(base, APEX2, FIRST_PAIR)
    assert has_k4_at(base, APEX1, MIRRORED_PAIR)
    assert second_class <= carrier - FIRST_PAIR
    assert first_class <= carrier - MIRRORED_PAIR

    # But neither mirrored source survives on the cumulatively erased carrier;
    # the history-preserving strengthening fails exactly where required.
    cumulative_forward = {
        x: has_k4_at(base, APEX1, FIRST_PAIR | {x}) for x in MIRRORED_PAIR
    }
    cumulative_reverse = {
        x: has_k4_at(base, APEX2, MIRRORED_PAIR | {x}) for x in FIRST_PAIR
    }
    assert cumulative_forward == {6: False, 7: False}
    assert cumulative_reverse == {1: False, 2: False}

    all_fibers = base.joint_fibers(APEX1, APEX2, carrier)
    assert max(map(len, all_fibers.values())) == 1

    return {
        "status": "PASS",
        "trust_boundary": (
            "exact finite symmetric distance-label abstraction; not Euclidean/convex/MEC"
        ),
        "base_sha256": base_digest,
        "cardinality": len(carrier),
        "cap_profile": [len(cap) for cap in caps],
        "triangle": sorted(TRIANGLE),
        "apices": [APEX1, APEX2],
        "first_exact_class": sorted(first_class),
        "second_exact_class": sorted(second_class),
        "first_survivor_pair": sorted(FIRST_PAIR),
        "mirrored_survivor_pair": sorted(MIRRORED_PAIR),
        "ordinary_double_deletion_survives": True,
        "cumulative_forward_survival": cumulative_forward,
        "cumulative_reverse_survival": cumulative_reverse,
        "max_joint_fiber": 1,
        "missing_field": "history-preserving survival on the cumulatively erased carrier",
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
