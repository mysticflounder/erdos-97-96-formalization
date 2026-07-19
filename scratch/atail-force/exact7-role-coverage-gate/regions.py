#!/usr/bin/env python3
"""Closed-cap region dictionary and one-hit rad_ne emission (DESIGN-L1.md).

Provenance: `U2NonSurplusSqueeze.oppApex{1,2}_{surplusCap,otherCap}_one_hit`
(U2NonSurplusOneHit.lean:213/312/352/392), composed for generic S via the
`DS`/`withPacket` packet rebuild (CriticalPairFrontier.lean:1296-1306,
FirstApexShellRoleExtractor.lean:111-117).  Any exact-radius class at an
apex meets each ADJACENT closed cap in at most one point, so two distinct
points of one closed cap adjacent to the apex have different distances to
that apex.  No W-centered analogue exists (not asserted).

Sites: named points are their own site; "S" and "O1" are the strict-arc
bags.  Closed caps:

- surplus  = {EA, O} + S-bag
- physical = {EA, W, s0, b0, s1, b1, s2}
- opp1     = {O, W} + O1-bag
"""

from __future__ import annotations

from itertools import combinations

SITE_REGIONS: dict[str, frozenset[str]] = {
    "EA": frozenset({"surplus", "physical"}),
    "O": frozenset({"surplus", "opp1"}),
    "W": frozenset({"physical", "opp1"}),
    "s0": frozenset({"physical"}),
    "b0": frozenset({"physical"}),
    "s1": frozenset({"physical"}),
    "b1": frozenset({"physical"}),
    "s2": frozenset({"physical"}),
    "S": frozenset({"surplus"}),
    "O1": frozenset({"opp1"}),
    # generic physical-interior site for fixture-named schemas
    "PHY": frozenset({"physical"}),
}

# apex -> regions of its ADJACENT caps (one-hit families exist only there)
APEX_FAMILIES: dict[str, tuple[str, ...]] = {
    "EA": ("surplus", "physical"),
    "O": ("surplus", "opp1"),
}

# HYPOTHETICAL W-centered analogue — NOT proven (no bank theorem; the
# endpoint kernel plausibly permutes to W but the acute hypothesis is
# unverified).  Only for exploratory censuses that say so explicitly.
APEX_FAMILIES_WITH_W: dict[str, tuple[str, ...]] = {
    **APEX_FAMILIES,
    "W": ("physical", "opp1"),
}


def onehit_rad_ne(placement: dict[str, str],
                  families: dict[str, tuple[str, ...]] = APEX_FAMILIES,
                  ) -> list[dict]:
    """rad_ne specs for every same-closed-cap pair at each adjacent apex.

    ``placement`` maps every positioned schema point to its site.  Named
    points must map to their own name.  Floating points must be omitted
    (no proven region).
    """
    specs = []
    seen: set[tuple[str, str, str]] = set()
    apex_points = {
        site: point for point, site in placement.items() if site in families
    }
    for apex_site, regions in families.items():
        if apex_site not in apex_points:
            continue
        apex = apex_points[apex_site]
        for region in regions:
            members = sorted(
                point
                for point, site in placement.items()
                if point != apex and region in SITE_REGIONS[site]
            )
            for a, b in combinations(members, 2):
                key = (apex, a, b)
                if key in seen:
                    continue
                seen.add(key)
                specs.append({"center": apex, "a": a, "b": b})
    return specs


def outside_pair_rad_ne(outside_pairs: list[tuple[str, str]]) -> list[dict]:
    """rad_ne at EA for each transition-reverse outside pair.

    Provenance: `false_of_transitionReverseOutsidePair_coRadial_firstApex`
    via `false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence`
    (ParentExactFiveAssembler.lean:335) — a co-radial-at-EA outside pair is
    fatal on the all-reverse arm, so its disequality is a sound constraint.
    """
    return [
        {"center": "EA", "a": min(a, b), "b": max(a, b)}
        for a, b in outside_pairs
    ]
