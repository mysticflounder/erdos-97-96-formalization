"""Exact audit of the fresh second-cap frontier as an incidence producer.

The pinned 35-point regression already has strict-convex/MEC/cap geometry,
no ``IsM44`` orientation, a total ``CriticalShellSystem`` shadow, and the
original robust critical-pair packet.  This audit checks the nontrivial
physical non-surplus swap on the same coordinates:

* old first/second apices are ``O``/``A``;
* after the swap the new first/second apices are ``A``/``O``;
* ``E,D`` are an old-first-apex marginal pair whose deletion preserves a
  four-class at ``A``; and
* ``G,K`` are a fresh new-first-apex marginal pair whose deletion preserves a
  four-class at ``O``.

It then enumerates every exact radius class at every strict point of the
physical surplus cap.  No such class contains two points of either endpoint
marginal.  Thus fresh-frontier existence and second-large-cap normalization
do not by themselves produce the missing marginal-pair row.

The model still lacks all-center global K4, so this is not a
``CounterexampleData`` or a countermodel to K-A-PAIR.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from types import ModuleType
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
TOTAL_CSS_MODEL_PATH = (
    HERE.parent
    / "global-critical-continuation"
    / "verify_total_css_completion.py"
)
EXPECTED_TOTAL_CSS_MODEL_SHA256 = (
    "adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7"
)

OLD_FIRST_APEX = "O"
OLD_SECOND_APEX = "A"
OLD_PAIR = {"E", "D"}
FRESH_PAIR = {"G", "K"}


def load_pinned_model() -> ModuleType:
    digest = hashlib.sha256(TOTAL_CSS_MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_TOTAL_CSS_MODEL_SHA256, (
        TOTAL_CSS_MODEL_PATH,
        digest,
    )
    spec = importlib.util.spec_from_file_location(
        "atail_second_cap_total_css_model", TOTAL_CSS_MODEL_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def k4_classes(
    profile: dict[sp.Expr, set[str]],
) -> list[set[str]]:
    return [set(support) for support in profile.values() if len(support) >= 4]


def target_classes(
    profile: dict[sp.Expr, set[str]], target: set[str]
) -> list[list[str]]:
    return sorted(
        sorted(support)
        for support in k4_classes(profile)
        if len(support & target) >= 2
    )


def check() -> dict[str, object]:
    model = load_pinned_model()

    # Replay the complete exact source regression first.  This checks strict
    # convexity, the unique MEC/cap decomposition, no-IsM44 in every MEC
    # orientation, the robust local packet, and the total critical map.
    regression = model.check()
    assert regression["status"] == "PASS"
    assert regression["total_critical_shell_system_exists"] is True
    assert regression["all_center_global_k4"] is False
    assert regression["isolated_omitted_live_layer"] == [
        "all-center HasNEquidistantProperty 4"
    ]

    points = model.build_points()
    surplus_cap = {
        "O",
        "t1",
        "t1_css_1",
        "t1_css_2",
        "t1_css_3",
        "I",
        "F",
        "A",
    }
    strict_surplus = surplus_cap - {OLD_FIRST_APEX, OLD_SECOND_APEX}

    old_added = {name for name in model.R.HULL_ORDER if "_k4_" in name}
    j_added = {f"J_css_{index}" for index in range(1, 4)}
    old_opp_cap_1 = {
        "A",
        "X",
        "Y",
        "Z",
        "D",
        "J",
        "E",
        "C",
    } | j_added
    old_opp_cap_2 = {"C", "G", "K", "O"} | old_added
    assert [len(surplus_cap), len(old_opp_cap_1), len(old_opp_cap_2)] == [
        8,
        11,
        19,
    ]

    profiles = {
        center: model.G.radius_profile(points, center)
        for center in sorted(strict_surplus | {OLD_FIRST_APEX, OLD_SECOND_APEX})
    }
    old_first_class = model.G.named_class(
        profiles[OLD_FIRST_APEX], sp.Integer(1)
    )
    old_second_class = model.G.named_class(
        profiles[OLD_SECOND_APEX], sp.Integer(1)
    )
    assert old_first_class == {"A", "C", "D", "E", "J"}
    assert old_second_class == {"C", "G", "K", "O"}
    old_first_k4_radii = [
        radius
        for radius, support in profiles[OLD_FIRST_APEX].items()
        if len(support) >= 4
    ]
    old_second_k4_radii = [
        radius
        for radius, support in profiles[OLD_SECOND_APEX].items()
        if len(support) >= 4
    ]
    assert old_first_k4_radii == [sp.Integer(1)]
    assert old_second_k4_radii == [sp.Integer(1)]

    old_marginal = old_first_class - surplus_cap
    swapped_marginal = old_second_class - surplus_cap
    assert old_marginal == {"C", "D", "E", "J"}
    assert swapped_marginal == {"C", "G", "K"}
    assert old_marginal & swapped_marginal == {"C"}

    assert OLD_PAIR <= old_marginal
    assert FRESH_PAIR <= swapped_marginal
    assert len(OLD_PAIR) == len(FRESH_PAIR) == 2

    # These are the exact local inputs used by the two applications of the
    # production frontier constructor.  The old pair survives at old A; the
    # fresh pair survives at old O, which is the swapped packet's second apex.
    assert model.R.has_k4_after_deletion(
        profiles[OLD_SECOND_APEX], OLD_PAIR
    )
    assert model.R.has_k4_after_deletion(
        profiles[OLD_FIRST_APEX], FRESH_PAIR
    )
    assert not any(
        OLD_PAIR <= support
        for support in profiles[OLD_SECOND_APEX].values()
    )
    assert not any(
        FRESH_PAIR <= support
        for support in profiles[OLD_FIRST_APEX].values()
    )

    # Enumerate every strict physical surplus-cap center.  At each center that
    # already has a K4 class, no possible SelectedFourClass can contain two
    # points from either endpoint marginal.  The uncovered strict centers are
    # recorded rather than silently promoted to global-K4 centers.
    strict_audit: dict[str, dict[str, object]] = {}
    covered_strict: set[str] = set()
    uncovered_strict: set[str] = set()
    for center in sorted(strict_surplus):
        classes = k4_classes(profiles[center])
        old_hits = target_classes(profiles[center], old_marginal)
        swapped_hits = target_classes(profiles[center], swapped_marginal)
        assert old_hits == [], center
        assert swapped_hits == [], center
        if classes:
            covered_strict.add(center)
        else:
            uncovered_strict.add(center)
        strict_audit[center] = {
            "has_k4": bool(classes),
            "k4_radius_classes": sorted(sorted(support) for support in classes),
            "old_marginal_pair_classes": old_hits,
            "swapped_marginal_pair_classes": swapped_hits,
        }
    assert covered_strict == {"t1", "I", "F"}
    assert uncovered_strict == {"t1_css_1", "t1_css_2", "t1_css_3"}

    # The total critical assignment supplies actual deletion-critical source
    # rows for both source pairs.  The opposite-apex double-deletion survivors
    # force their blockers away from the relevant second apex; check the
    # concrete assignment as a regression guard too.
    assignment: dict[str, dict[str, Any]] = regression["critical_assignment"]
    blocker_summary: dict[str, object] = {}
    for source, forbidden_apex in {
        "E": OLD_SECOND_APEX,
        "D": OLD_SECOND_APEX,
        "G": OLD_FIRST_APEX,
        "K": OLD_FIRST_APEX,
    }.items():
        row = assignment[source]
        center = row["center"]
        support = set(row["support"])
        assert center != source
        assert center != forbidden_apex
        assert source in support
        assert len(support) == 4
        blocker_summary[source] = {
            "center": center,
            "support": sorted(support),
            "forbidden_opposite_apex": forbidden_apex,
        }

    assert (
        set(regression["centers_without_k4"]) & strict_surplus
    ) == uncovered_strict

    return {
        "schema": "p97-atail-second-cap-incidence-coupling-v1",
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "physical_role_map": {
            "old_first_apex": OLD_FIRST_APEX,
            "old_second_apex": OLD_SECOND_APEX,
            "swapped_first_apex": OLD_SECOND_APEX,
            "swapped_second_apex": OLD_FIRST_APEX,
            "unchanged_surplus_cap": sorted(surplus_cap),
            "chosen_old_oppCap1_becomes_swapped_oppCap2": sorted(
                old_opp_cap_1
            ),
            "chosen_second_large_cap_card": len(old_opp_cap_1),
        },
        "cap_cards": [
            len(surplus_cap),
            len(old_opp_cap_1),
            len(old_opp_cap_2),
        ],
        "endpoint_classes": {
            "old_first_class": sorted(old_first_class),
            "old_first_marginal": sorted(old_marginal),
            "swapped_first_class": sorted(old_second_class),
            "swapped_first_marginal": sorted(swapped_marginal),
            "marginal_intersection": sorted(old_marginal & swapped_marginal),
            "old_first_unique_k4_radius": str(old_first_k4_radii[0]),
            "swapped_first_unique_k4_radius": str(old_second_k4_radii[0]),
        },
        "frontier_source_pairs": {
            "old": sorted(OLD_PAIR),
            "fresh_after_swap": sorted(FRESH_PAIR),
            "old_pair_deletion_preserves_at_old_second_apex": True,
            "fresh_pair_deletion_preserves_at_old_first_apex": True,
            "same_pair_transport": False,
        },
        "critical_blockers": blocker_summary,
        "strict_surplus_center_audit": strict_audit,
        "strict_centers_with_k4": sorted(covered_strict),
        "strict_centers_without_k4": sorted(uncovered_strict),
        "generic_old_marginal_pair_row_exists_in_fixed_model": False,
        "generic_swapped_marginal_pair_row_exists_in_fixed_model": False,
        "exact_layers_replayed": [
            "strict convexity",
            "unique MEC and physical cap decomposition",
            "no IsM44 in every MEC orientation",
            "second non-surplus cap cardinality at least five",
            "old robust local frontier inputs",
            "fresh swapped frontier inputs",
            "total CriticalShellSystem",
            "K4 at both endpoint apices and strict centers t1, I, F",
        ],
        "omitted_live_layer": regression["isolated_omitted_live_layer"],
        "centers_without_k4": regression["centers_without_k4"],
        "conclusion": (
            "physical cap/apex reorientation and a fresh opposite frontier "
            "do not force either endpoint marginal pair into any existing "
            "strict-surplus row on this exact local/critical surface; any "
            "uniform positive theorem must consume global K4 at the uncovered "
            "strict centers (or elsewhere) or another full-parent consequence"
        ),
        "not_claimed": [
            "a CounterexampleData or K-A-PAIR countermodel",
            "a Euclidean model satisfying all-center global K4",
            "a Lean-kernel proof that the live producer is impossible",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="replay the pinned exact model and print a compact PASS line",
    )
    args = parser.parse_args()
    result = check()
    if args.check:
        print(
            "PASS: old and freshly swapped frontier inputs coexist, while "
            "every existing strict-surplus K4 class avoids both endpoint "
            "marginal pairs; uncovered strict centers are fail-closed"
        )
    else:
        print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
