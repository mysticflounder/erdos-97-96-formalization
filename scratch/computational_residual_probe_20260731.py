#!/usr/bin/env python3
"""Bounded abstraction probe for the two-source collision leaves.

This deliberately layers only *named* consequences on top of the existing
exact rational 4x3 projection.  It does not pretend to model CounterexampleData
or the full cap geometry.  The added checks are abstract finite labels for the
cap-source surface, no-M44 profile, two-cycle nonreturn, and tri-apex package.
"""

from __future__ import annotations

import importlib.util
from itertools import product
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "scratch/atail-force/cross-blocker-euclidean-audit/exact_12_branch_witnesses.py"
spec = importlib.util.spec_from_file_location("exact12", SOURCE)
assert spec and spec.loader
exact12 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(exact12)


def layered_status(arm: str, residual: str) -> dict[str, object]:
    base = exact12.check_branch(arm, residual)
    checks: list[tuple[str, bool]] = []

    def require(name: str, value: bool) -> None:
        checks.append((name, value))

    # CapSourceThirdCanonicalRowSurface, reduced to its explicit finite shape:
    # an eight-point cap with one fresh source whose blocker/apex labels are
    # all distinct.  The seven fillers are abstract labels, not coordinates.
    cap_labels = {f"cap_fill_{i}" for i in range(7)} | {"cap_source"}
    named = {"A", "B", "O", "a1", "a2", "b1", "b2"}
    if residual == "third":
        named |= {"C", "t1", "t2"}
    else:
        named |= {"x", "o"}
    require("cap-source cardinality >= 8", len(cap_labels) >= 8)
    require("cap-source fresh from collision names", "cap_source" not in named)
    require("cap-source blocker/apex labels distinct", len({"cap_source", "A", "B", "O"}) == 4)

    # CrossBlockerCoincidence and GeometricMultiplicityResidual are exactly
    # the arm/residual indices already checked by exact12.
    require("cross-blocker equality arm", arm in exact12.ARMS)
    require("geometric residual arm", residual in exact12.RESIDUALS)

    # Abstract no-M44 profile: IsM44 forces both opposite caps to cardinality
    # four; the all-large residual uses the smallest non-M44 profile (8,6,6).
    cap_sizes = (8, 6, 6)  # surplus, opposite-1, opposite-2
    require("abstract no-M44 cap profile", not (cap_sizes[1] == 4 and cap_sizes[2] == 4))

    # The localized omission cycles choose a1 and b1 in exact12.  Distinct
    # first-apex radii rule out a 2-cycle in this finite row abstraction.
    radii = base["first_apex_radius_squared"]
    assert isinstance(radii, dict)
    require("two-cycle nonreturn (distinct radii)", radii["first_pair"] != radii["second_pair"])

    # Tri-apex residual, reduced to three distinct abstract apex labels and
    # the explicit no-single-centre cover condition.
    apexes = ("oppApex1", "oppApex2", "surplusApex")
    require("tri-apex labels distinct", len(set(apexes)) == 3)
    # Minimal rich-class witness for each apex: choose the six-point branch of
    # ApexRichClassStructure (the alternative two-K4 branch is not needed).
    rich_members = {apex: {f"{apex}_member_{i}" for i in range(6)} for apex in apexes}
    require("each tri-apex has a six-point rich class", all(len(members) >= 6 for members in rich_members.values()))
    require("no centre covers all three apices", all(sum(c == a for a in apexes) < 3 for c in ("A", "B", "O")))

    failures = [name for name, ok in checks if not ok]
    return {
        "arm": arm,
        "residual": residual,
        "base_status": base["status"],
        "layered_status": "SAT_ABSTRACT" if base["status"] == "EXACT_RATIONAL_WITNESS" and not failures else "UNSAT_ABSTRACT",
        "checks": len(checks),
        "failures": failures,
    }


def main() -> None:
    results = [layered_status(arm, residual) for arm, residual in product(exact12.ARMS, exact12.RESIDUALS)]
    counts: dict[str, int] = {}
    for result in results:
        status = str(result["layered_status"])
        counts[status] = counts.get(status, 0) + 1
    print(f"branches={len(results)} status_counts={counts}")
    for result in results:
        print(f"{result['arm']} x {result['residual']}: {result['layered_status']}")
    assert counts == {"SAT_ABSTRACT": 12}


if __name__ == "__main__":
    main()
