# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact Euclidean boundary for the Stage-I dangerous-equality producer.

This checker specializes the pinned 33-point integer-coordinate construction
from ``blocker_graph/euclidean_countermodel.py``.  In addition to its global
K4 and deletion-minimality checks, it selects live-shaped labels

    p, q, t1, t2, t3, u

and a single common deletion-blocker system such that:

* ``{q,t1,t2,t3}`` is the exact positive-radius class at ``p``;
* deleting any member of that class blocks K4 at ``p``;
* the common system therefore chooses ``p`` for all four dangerous sources;
* its row at source ``u`` has a different center ``c`` and an exact four-point
  support disjoint from the dangerous class; and
* the squared distances from ``c`` to all four dangerous points are distinct.

Thus neither requested equality at ``c`` follows from exact Euclidean metric,
cardinality, global K4, deletion criticality, full-filter exactness, common
``CriticalShellSystem`` provenance, or the localized fixed-triple/live-data
fields alone.

This is not a K-A-PAIR counterexample.  The inherited carrier is non-convex,
so it has no live convex/MEC/surplus-cap/no-M44 packet.  The witness isolates
that omitted geometric layer as load-bearing.
"""

from __future__ import annotations

from collections import defaultdict
import hashlib
import importlib.util
import json
from pathlib import Path


Point = tuple[int, int]

HERE = Path(__file__).resolve().parent
BASE_PATH = HERE / "blocker_graph" / "euclidean_countermodel.py"

P: Point = (0, 5)
Q: Point = (0, 0)
T1: Point = (3, 1)
T2: Point = (4, 2)
T3: Point = (5, 5)
U: Point = (0, 1)
U_CENTER: Point = (0, 6)

EXPECTED_SPECIALIZATION_SHA256 = (
    "4d30244388226a71dbd03d63ca94efb41de95072ad1d8811faa9d79236aeb7fd"
)


def load_base():
    spec = importlib.util.spec_from_file_location(
        "atail_blocker_graph_euclidean_countermodel", BASE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def max_class_card(module, center: Point, carrier: frozenset[Point]) -> int:
    classes = module.distance_classes(center, carrier)
    return max(map(len, classes.values()), default=0)


def check() -> dict[str, object]:
    base = load_base()
    base_result = base.check()
    assert base_result["status"] == "PASS"

    carrier = frozenset(base.A)
    dangerous = frozenset((Q, T1, T2, T3))
    labels = (P, Q, T1, T2, T3, U)

    specialization_payload = {
        "base_construction_sha256": base_result["construction_sha256"],
        "labels": {
            "p": P,
            "q": Q,
            "t1": T1,
            "t2": T2,
            "t3": T3,
            "u": U,
            "u_center": U_CENTER,
        },
    }
    specialization_sha256 = hashlib.sha256(
        json.dumps(
            specialization_payload, sort_keys=True, separators=(",", ":")
        ).encode()
    ).hexdigest()
    assert specialization_sha256 == EXPECTED_SPECIALIZATION_SHA256

    assert len(set(labels)) == len(labels)
    assert all(point in carrier for point in labels)
    assert U_CENTER in carrier
    assert P not in dangerous and U not in dangerous

    # Exact p-centered dangerous full filter and fixed-triple packet.
    p_radius = base.sqdist(P, Q)
    assert p_radius > 0
    assert p_radius == 25
    assert base.distance_classes(P, carrier)[p_radius] == set(dangerous)
    assert all(base.sqdist(P, point) == p_radius for point in dangerous)
    assert base.sqdist(P, U) != p_radius

    q_deleted_p_class = {
        point
        for point in carrier - {Q, P}
        if base.sqdist(P, point) == p_radius
    }
    assert q_deleted_p_class == {T1, T2, T3}
    skeleton_q = carrier - {Q}
    erased_skeleton_q = skeleton_q - {P}
    assert P in skeleton_q
    assert {T1, T2, T3, U} <= erased_skeleton_q
    assert U not in dangerous
    assert max_class_card(base, P, erased_skeleton_q) < 4

    # p is a genuine deletion blocker for every dangerous source.  This lets
    # one common system choose the exact dangerous shell for q,t1,t2,t3.
    for source in dangerous:
        assert P in base.blocker_candidates(source, carrier)
        assert max_class_card(base, P, carrier - {source}) < 4

    # Override the pinned common system on the dangerous class; elsewhere use
    # the deterministic first blocker from the base checker.
    blocker: dict[Point, Point] = {}
    shells: dict[Point, tuple[int, frozenset[Point]]] = {}
    for source in base.A:
        center = P if source in dangerous else base.blocker_candidates(
            source, carrier
        )[0]
        assert center != source
        assert center in carrier
        assert max_class_card(base, center, carrier - {source}) < 4
        radius, support = base.chosen_shell(source, center, carrier)
        assert radius > 0
        assert len(support) == 4
        assert source in support
        assert base.distance_classes(center, carrier)[radius] == set(support)
        blocker[source] = center
        shells[source] = (radius, support)

    # Same-center support locking, the exact coupling proved by a common
    # CriticalShellSystem.
    support_at_center: dict[Point, frozenset[Point]] = {}
    sources_at_center: dict[Point, list[Point]] = defaultdict(list)
    for source, center in blocker.items():
        support = shells[source][1]
        sources_at_center[center].append(source)
        if center in support_at_center:
            assert support_at_center[center] == support
        else:
            support_at_center[center] = support

    assert all(blocker[source] == P for source in dangerous)
    assert all(shells[source][1] == dangerous for source in dangerous)

    # Exact common-provenance u row.
    assert blocker[U] == U_CENTER
    u_radius, u_support = shells[U]
    expected_u_support = frozenset(((0, 1), (3, 2), (4, 3), (5, 6)))
    assert u_radius == 25
    assert u_support == expected_u_support
    assert U in u_support
    assert U_CENTER not in u_support
    assert P != U_CENTER
    assert u_support.isdisjoint(dangerous)

    # The requested dangerous equalities both fail.  In fact c separates all
    # four dangerous points by squared distance.
    c_dangerous_sqdist = {
        "q": base.sqdist(U_CENTER, Q),
        "t1": base.sqdist(U_CENTER, T1),
        "t2": base.sqdist(U_CENTER, T2),
        "t3": base.sqdist(U_CENTER, T3),
    }
    assert c_dangerous_sqdist == {"q": 36, "t1": 34, "t2": 32, "t3": 26}
    assert len(set(c_dangerous_sqdist.values())) == 4
    assert c_dangerous_sqdist["q"] != c_dangerous_sqdist["t1"]
    assert c_dangerous_sqdist["q"] != c_dangerous_sqdist["t3"]

    # Reassert the strongest global/common-system part of the inherited
    # surface after the override.
    assert base.has_global_k4(carrier)
    assert all(not base.has_global_k4(carrier - {source}) for source in carrier)

    return {
        "status": "PASS",
        "trust_boundary": (
            "exhaustive exact integer arithmetic in Python; not Lean-kernel checked"
        ),
        "base_construction_sha256": base_result["construction_sha256"],
        "specialization_sha256": specialization_sha256,
        "cardinality": len(carrier),
        "global_k4": True,
        "every_single_deletion_breaks_global_k4": True,
        "dangerous_center": P,
        "dangerous_support": sorted(dangerous),
        "dangerous_sq_radius": p_radius,
        "q_deleted_dangerous_class": sorted(q_deleted_p_class),
        "localized_no_qfree_at_p": True,
        "fixed_triple_packet": True,
        "selected_u_candidate_off_dangerous_circle": True,
        "common_system_dangerous_sources_at_p": sorted(sources_at_center[P]),
        "u_source": U,
        "u_row_center": U_CENTER,
        "u_row_support": sorted(u_support),
        "u_row_sq_radius": u_radius,
        "u_row_dangerous_intersection": sorted(u_support & dangerous),
        "u_center_dangerous_sqdist": c_dangerous_sqdist,
        "requested_q_t1_equality": False,
        "requested_q_t3_equality": False,
        "convex_independent": False,
        "omitted_live_layer": [
            "ConvexIndep",
            "MEC/nonobtuse circumscribed Moser packet",
            "surplus-cap placement",
            "no-IsM44",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
