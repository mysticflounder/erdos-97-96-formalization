# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact Euclidean boundary for the off-frontier two-hit producer.

The pinned 33-point carrier from ``blocker_graph/euclidean_countermodel.py``
has global K4, every single deletion destroys global K4, and every source has
one or more exact four-point deletion-blocker shells.  We use the live-shaped
dangerous row

    p = (0, 5),  B = {(0, 0), (3, 1), (4, 2), (5, 5)}.

For sources in B, the common critical-shell system selects p and hence the
exact dangerous row.  For every other source, it selects the lexicographically
first legal blocker whose exact shell meets B in at most one point.  The
checker proves exhaustively that this selection is possible for all sources
and that no blocker distinct from p has two dangerous hits.

This refutes the implication from exact Euclidean radii, global K4, deletion
minimality, full-filter exactness, and common CriticalShellSystem-shaped
provenance to the positive off-frontier two-hit producer.  It is not a K-A-PAIR
counterexample: the carrier is non-convex and has no live MEC/cap/no-IsM44
packet.  Those omitted geometric fields are therefore load-bearing.
"""

from __future__ import annotations

from collections import Counter, defaultdict
import hashlib
import importlib.util
import json
from pathlib import Path


Point = tuple[int, int]

HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "blocker_graph" / "euclidean_countermodel.py"

P: Point = (0, 5)
Q: Point = (0, 0)
T1: Point = (3, 1)
T2: Point = (4, 2)
T3: Point = (5, 5)
U: Point = (0, 1)

DANGEROUS = frozenset((Q, T1, T2, T3))
SELECTION_RULE = (
    "dangerous sources use p; other sources use lexicographically first "
    "blocker whose shell has at most one dangerous hit"
)
EXPECTED_SELECTION_SHA256 = (
    "e55aa316518bdb7912922d96eaa8d142e972927cfb00cba51942279e19c273fe"
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
    assert len(carrier) == 33
    assert P in carrier and U in carrier
    assert DANGEROUS <= carrier
    assert P not in DANGEROUS and U not in DANGEROUS

    selection_payload = {
        "base_construction_sha256": base_result["construction_sha256"],
        "dangerous_center": P,
        "dangerous": sorted(DANGEROUS),
        "selection_rule": SELECTION_RULE,
    }
    selection_sha256 = hashlib.sha256(
        json.dumps(
            selection_payload, sort_keys=True, separators=(",", ":")
        ).encode()
    ).hexdigest()
    assert selection_sha256 == EXPECTED_SELECTION_SHA256

    # The dangerous row is an exact positive-radius full filter at p.
    dangerous_radius = base.sqdist(P, Q)
    assert dangerous_radius == 25
    assert base.distance_classes(P, carrier)[dangerous_radius] == set(DANGEROUS)

    blocker: dict[Point, Point] = {}
    shells: dict[Point, tuple[int, frozenset[Point]]] = {}
    alternative_counts: dict[Point, list[int]] = {}

    for source in base.A:
        candidates = base.blocker_candidates(source, carrier)
        assert candidates

        candidate_rows = []
        for center in candidates:
            radius, support = base.chosen_shell(source, center, carrier)
            candidate_rows.append((center, radius, support, len(support & DANGEROUS)))
        alternative_counts[source] = [row[3] for row in candidate_rows]

        if source in DANGEROUS:
            chosen_rows = [row for row in candidate_rows if row[0] == P]
            assert len(chosen_rows) == 1
            center, radius, support, dangerous_hits = chosen_rows[0]
            assert support == DANGEROUS
            assert dangerous_hits == 4
        else:
            chosen_rows = [row for row in candidate_rows if row[3] <= 1]
            assert chosen_rows
            center, radius, support, dangerous_hits = chosen_rows[0]
            assert center != P
            assert dangerous_hits <= 1

        # Exact CriticalShellSystem-shaped deletion and full-filter fields.
        assert center != source
        assert center in carrier
        assert radius > 0
        assert len(support) == 4
        assert source in support
        assert base.distance_classes(center, carrier)[radius] == set(support)
        assert max_class_card(base, center, carrier - {source}) < 4

        blocker[source] = center
        shells[source] = (radius, support)

    # One common system locks all sources selecting a center to the same exact
    # support.  This is stronger than independently chosen local witnesses.
    support_at_center: dict[Point, frozenset[Point]] = {}
    sources_at_center: dict[Point, list[Point]] = defaultdict(list)
    for source, center in blocker.items():
        support = shells[source][1]
        sources_at_center[center].append(source)
        if center in support_at_center:
            assert support_at_center[center] == support
        else:
            support_at_center[center] = support

    assert all(blocker[source] == P for source in DANGEROUS)
    assert all(shells[source][1] == DANGEROUS for source in DANGEROUS)

    # The selected common system has no positive off-frontier two-hit at all.
    off_frontier_rows = [
        (
            source,
            blocker[source],
            shells[source][1] & DANGEROUS,
        )
        for source in base.A
        if blocker[source] != P
    ]
    hit_histogram = Counter(len(row[2]) for row in off_frontier_rows)
    assert off_frontier_rows
    assert max(map(lambda row: len(row[2]), off_frontier_rows)) == 1
    assert all(len(row[2]) <= 1 for row in off_frontier_rows)
    assert len(shells[U][1] & DANGEROUS) == 0

    # The underlying carrier also admits a different legal selection with a
    # two-hit.  This makes the obstruction selection-sensitive rather than a
    # failure of Euclidean two-circle incidence.
    two_hit_alternative = []
    for source in base.A:
        if source in DANGEROUS:
            continue
        for center in base.blocker_candidates(source, carrier):
            radius, support = base.chosen_shell(source, center, carrier)
            hits = support & DANGEROUS
            if center != P and len(hits) >= 2:
                two_hit_alternative.append(
                    {
                        "source": source,
                        "center": center,
                        "sq_radius": radius,
                        "support": sorted(support),
                        "dangerous_hits": sorted(hits),
                    }
                )
    assert two_hit_alternative
    assert {
        "source": (2, 4),
        "center": (5, 0),
        "sq_radius": 25,
        "support": [(0, 0), (1, 3), (2, 4), (5, 5)],
        "dangerous_hits": [(0, 0), (5, 5)],
    } in two_hit_alternative

    # Reassert the strongest global metric facts after choosing the system.
    assert base.has_global_k4(carrier)
    assert all(not base.has_global_k4(carrier - {source}) for source in carrier)

    return {
        "status": "PASS",
        "trust_boundary": (
            "exhaustive exact integer arithmetic in Python; not Lean-kernel checked"
        ),
        "base_construction_sha256": base_result["construction_sha256"],
        "selection_sha256": selection_sha256,
        "selection_rule": SELECTION_RULE,
        "cardinality": len(carrier),
        "global_k4": True,
        "every_single_deletion_breaks_global_k4": True,
        "dangerous_center": P,
        "dangerous_support": sorted(DANGEROUS),
        "dangerous_sq_radius": dangerous_radius,
        "common_system_dangerous_sources_at_p": sorted(sources_at_center[P]),
        "off_frontier_row_count": len(off_frontier_rows),
        "off_frontier_dangerous_hit_histogram": dict(sorted(hit_histogram.items())),
        "max_selected_off_frontier_dangerous_hits": max(
            map(lambda row: len(row[2]), off_frontier_rows)
        ),
        "selected_u_blocker": blocker[U],
        "selected_u_support": sorted(shells[U][1]),
        "selected_u_dangerous_hits": sorted(shells[U][1] & DANGEROUS),
        "legal_two_hit_alternatives": two_hit_alternative,
        "convex_independent": False,
        "nonconvex_midpoint_witness": [(3, 1), (3, 3), (3, 5)],
        "omitted_live_layer": [
            "ConvexIndep",
            "MEC/nonobtuse circumscribed Moser packet",
            "surplus-cap placement",
            "no-IsM44",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
