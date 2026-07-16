"""Exact cap-profile regression for the non-equilateral producer target.

This extends the sibling rational local model by checking a full structural
CapTriple (including the exact signed-area `OnArcOpposite` predicate) and the
(5, 5, 4) selected profile.  It is a coexistence regression, not an instance
of the Lean native-continuation packet: the two row centers are endpoints of
`oppCap2`, whereas that packet selects both centers in strict `oppCap2`.
It also does not claim MEC promotion, global K4, or a total
CriticalShellSystem.
"""

from pathlib import Path
import runpy


BASE = runpy.run_path(
    str(
        Path(__file__).resolve().parents[1]
        / "non-equilateral-continuation"
        / "verify_exact_local_regression.py"
    )
)

POINTS = BASE["POINTS"]
ROW1 = BASE["ROW1"]
ROW2 = BASE["ROW2"]

# Hull order is z1,b3,b2,b1,O2,a1,a2,a3,z2,kR,kL.  With structural
# Moser vertices (v1,v2,v3)=(z1,O2,z2), these are the three exact closed
# chord-side caps opposite v1,v2,v3.
V1, V2, V3 = "z1", "O2", "z2"
C1 = {"O2", "a1", "a2", "a3", "z2"}
C2 = {"z2", "kR", "kL", "z1"}
C3 = {"z1", "b3", "b2", "b1", "O2"}

# Select C3 as surplus: surplus=C3, oppCap1=C1, oppCap2=C2.
SURPLUS = C3
OPP_CAP1 = C1
OPP_CAP2 = C2
STRICT_OPP_CAP1 = OPP_CAP1 - (SURPLUS | OPP_CAP2)
STRICT_OPP_CAP2 = OPP_CAP2 - (SURPLUS | OPP_CAP1)


def signed_area2(v, vj, vk):
    return BASE["cross"](POINTS[v], POINTS[vj], POINTS[vk])


def on_arc_opposite(vi, vj, vk, v):
    return signed_area2(v, vj, vk) * signed_area2(vi, vj, vk) <= 0


def main():
    BASE["main"]()

    assert len(POINTS) == 11
    assert len({V1, V2, V3}) == 3
    assert [len(C1), len(C2), len(C3)] == [5, 4, 5]

    # Exact CapTriple membership, including its load-bearing arc predicate.
    frames = [(V1, V2, V3, C1), (V2, V3, V1, C2), (V3, V1, V2, C3)]
    for vi, vj, vk, cap in frames:
        assert vi not in cap
        assert vj in cap and vk in cap
        for name in POINTS:
            assert (name in cap) == on_arc_opposite(vi, vj, vk, name)

    assert C1 | C2 | C3 == set(POINTS)
    moser = {V1, V2, V3}
    for name in POINTS:
        multiplicity = sum(name in cap for cap in (C1, C2, C3))
        assert multiplicity == (2 if name in moser else 1)

    # The selected packet profile is (surplus,opp1,opp2)=(5,5,4), hence not
    # (m,4,4), and retains a genuine second large cap.
    assert [len(SURPLUS), len(OPP_CAP1), len(OPP_CAP2)] == [5, 5, 4]
    assert not (len(OPP_CAP1) == 4 and len(OPP_CAP2) == 4)

    # The two local rows have zero overlap and the second is surplus-heavy in
    # this structural labeling.  This is not a realization of the Lean
    # dichotomy because its centers z1,z2 are cap endpoints, not members of
    # strict oppCap2 = {kL,kR}.
    assert STRICT_OPP_CAP2 == {"kL", "kR"}
    assert {"z1", "z2"}.isdisjoint(STRICT_OPP_CAP2)
    assert ROW1.isdisjoint(ROW2)
    assert len(ROW1 & ROW2 & STRICT_OPP_CAP1) == 0
    assert len(ROW2 & SURPLUS) == 4
    assert ROW1 & STRICT_OPP_CAP1 == {"a1", "a2", "a3"}

    print("PASS: exact structural (5,5,4) cap-profile regression")
    print("scope: row centers z1,z2 are oppCap2 endpoints, not strict interior")
    print("strict oppCap1:", " ".join(sorted(STRICT_OPP_CAP1)))
    print("row2 surplus hits:", len(ROW2 & SURPLUS))


if __name__ == "__main__":
    main()
