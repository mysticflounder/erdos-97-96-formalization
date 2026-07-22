#!/usr/bin/env python3
"""Fail-closed smoke gate for the exact-card-13 B0 encoder."""

from __future__ import annotations

import json
from pathlib import Path

import z3

from encode import Outer
from verify import (
    CAPS,
    FIRST_APEX,
    N,
    OPP_CAP1,
    ORBIT_ROLES,
    PHYSICAL_CAP,
    PHYSICAL_INTERIOR,
    SECOND_APEX,
    SURPLUS_CAP,
    VERTICES,
    verify_decoded,
)


HERE = Path(__file__).resolve().parent


def edge_witness(row: set[int], left: int, right: int) -> bool:
    return len(row) == 4 and not ({left, right} <= row)


def main() -> None:
    manifest = json.loads((HERE / "manifest.json").read_text())
    assert manifest["schema"] == "p97-card13-exact5-global-cover-parent-gate-v1"
    assert manifest["n"] == 13
    assert manifest["cap_profile"] == [5, 6, 5]
    assert manifest["first_apex"] == FIRST_APEX == 4
    assert manifest["second_apex"] == SECOND_APEX == 8
    assert manifest["physical_interior"] == sorted(PHYSICAL_INTERIOR)
    assert set(manifest["orbits"]) == set(ORBIT_ROLES)
    assert manifest["cover_row_table_count"] == 2
    assert manifest["cover_tables_aliased_to_m"] is False
    assert manifest[
        "selected_second_apex_row_identified_with_complete_shell"
    ] is False

    assert tuple(map(len, CAPS)) == (5, 6, 5)
    assert set.union(*(set(cap) for cap in CAPS)) == set(VERTICES)
    assert SURPLUS_CAP & OPP_CAP1 == {SECOND_APEX}
    assert OPP_CAP1 & PHYSICAL_CAP == {0}
    assert PHYSICAL_CAP & SURPLUS_CAP == {FIRST_APEX}
    assert sum(map(len, CAPS)) == N + 3
    assert PHYSICAL_INTERIOR == PHYSICAL_CAP - {0, FIRST_APEX}

    # Complete shell versus selected row: all five omissions are legitimate.
    shell = {1, 2, 3, 5, 9}
    for omitted in shell:
        selected = shell - {omitted}
        assert len(selected) == 4 and selected < shell

    # Both asymmetric orientations are required.
    asymmetric = {1, 3, 5, 9}
    assert asymmetric & PHYSICAL_CAP == {1, 3}
    assert asymmetric - PHYSICAL_CAP == {5, 9}
    assert {ORBIT_ROLES[name]["source"] for name in ORBIT_ROLES
            if name.startswith("asymmetric")} == {1, 3}

    # Separate-cover witness trap.
    hub, spoke1, spoke2 = 2, 1, 3
    cover1 = {2, 3, 5, 6}
    cover2 = {2, 1, 9, 10}
    assert edge_witness(cover1, hub, spoke1)
    assert edge_witness(cover2, hub, spoke2)
    assert not any(
        edge_witness(row, hub, spoke1) and edge_witness(row, hub, spoke2)
        for row in (cover1, cover2)
    )

    # Inspect the actual implementation: the cover tables have disjoint Z3
    # symbols and neither aliases the all-center m table.
    outer = Outer("asymmetricSourceLeft", 5_000)
    assert outer.cover[0][0, 0].decl().name() != outer.cover[1][0, 0].decl().name()
    assert outer.cover[0][0, 0].decl().name() != outer.m[0, 0].decl().name()

    # Known-UNSAT endpoint row: center 4 is an endpoint of the surplus cap and
    # cannot select two other points from it.
    outer.solver.push()
    outer.solver.add(outer.m[FIRST_APEX, 5], outer.m[FIRST_APEX, 6])
    assert outer.solver.check() == z3.unsat
    outer.solver.pop()

    # Source-faithful synchronization at blocker-image centers.  Freeze one
    # blocker value from an actual model, then any g0/m disagreement there is
    # impossible.
    assert outer.solver.check() == z3.sat
    model = outer.solver.model()
    decoded = outer.decode(model)
    source = 0
    blocker_center = decoded["blockers"][source]
    outer.solver.push()
    outer.solver.add(outer.blocker[source] == blocker_center)
    outer.solver.add(
        outer.cover[0][blocker_center, 0] != outer.m[blocker_center, 0]
    )
    assert outer.solver.check() == z3.unsat
    outer.solver.pop()

    # The cover families remain genuinely independent away from the blocker
    # image; synchronization is conditional, not a global alias.
    outside_difference = []
    for center in VERTICES:
        outside_image = z3.And(*(
            outer.blocker[source] != center for source in VERTICES
        ))
        differs = z3.Or(*(
            outer.cover[edge][center, point] != outer.m[center, point]
            for edge in range(2)
            for point in VERTICES
        ))
        outside_difference.append(z3.And(outside_image, differs))
    outer.solver.push()
    outer.solver.add(z3.Or(*outside_difference))
    assert outer.solver.check() == z3.sat
    outer.solver.pop()

    # Every cover row at the unique-five second apex is selected from the
    # complete shell.
    outer.solver.push()
    outer.solver.add(outer.cover[1][SECOND_APEX, 0], z3.Not(outer.shell[0]))
    assert outer.solver.check() == z3.unsat
    outer.solver.pop()

    # The independent verifier rejects both synchronization failures with
    # named diagnostics.
    tampered = json.loads(json.dumps(decoded))
    support = set(tampered["cover_rows"][0][str(blocker_center)])
    replacement = next(
        point for point in VERTICES
        if point not in support and point != blocker_center
    )
    support.remove(next(iter(support)))
    support.add(replacement)
    tampered["cover_rows"][0][str(blocker_center)] = sorted(support)
    assert any(
        "not synchronized with m at blocker-image center" in error
        for error in verify_decoded(tampered)
    )

    tampered = json.loads(json.dumps(decoded))
    shell = set(tampered["shell"])
    support = set(tampered["cover_rows"][1][str(SECOND_APEX)])
    outside = next(
        point for point in VERTICES
        if point not in shell and point != SECOND_APEX
    )
    support.remove(next(iter(support)))
    support.add(outside)
    tampered["cover_rows"][1][str(SECOND_APEX)] = sorted(support)
    assert any(
        "second-apex row is not a shell subset" in error
        for error in verify_decoded(tampered)
    )

    print("PASS exact-card-13 exact-five B0 smoke gate")


if __name__ == "__main__":
    main()
