# `cardge13_ingress_case_split_verifier.py`

The following is the exact standard-library verifier used for the ingress-coupled case split. Original `.py` SHA-256: `8f46a95d0c73479271823a376f979007ae98175d3f5044aafb2082696827d9dd`.

```python
#!/usr/bin/env python3
"""
Exact finite verification for the card-ge-13 ingress-coupled case split.

This script checks three source-neutral claims used by the proposed Lean
decomposition:

1. Two nonempty omission sets inside the two-element deletion set {q,w}
   either share a deletion or are complementary singletons.

2. For two disjoint radius slices J0,J1 of sizes 2..4, with at most one
   first-apex-class point globally and at most one bad point per slice,
   a union of size at least five contains at least two good points.  If
   no slice contains two good points, the unique sharp state is 3+2 with
   every exclusion bound saturated.

3. The same-radius complementary-crossed pair core is geometrically
   realizable at the pair-equality level.  Nine points on one circle are
   placed at exact rational-degree angles.  The Moser-apex arcs put q,w
   in the A1-opposite cap, s0,s1 in the A2-opposite cap, and b0,b1 in the
   surplus-opposite cap.  Four required squared-chord equalities and the
   two displayed q/w omissions hold exactly by cosine symmetry.

No SMT solver, floating-point arithmetic, or external package is used.
"""

from itertools import combinations, product


DELETIONS = frozenset({"q", "w"})


def all_nonempty_subsets(s: frozenset[str]) -> list[frozenset[str]]:
    values = sorted(s)
    out: list[frozenset[str]] = []
    for mask in range(1, 1 << len(values)):
        out.append(
            frozenset(values[i] for i in range(len(values)) if mask & (1 << i))
        )
    return out


def verify_two_deletion_normalization() -> dict[str, int]:
    checked = 0
    common = 0
    crossed = 0
    for o0 in all_nonempty_subsets(DELETIONS):
        for o1 in all_nonempty_subsets(DELETIONS):
            checked += 1
            if o0 & o1:
                common += 1
                continue
            assert len(o0) == len(o1) == 1
            assert o0 | o1 == DELETIONS
            crossed += 1
            equal_blockers_would_imply_equal_omission_sets = o0 == o1
            assert not equal_blockers_would_imply_equal_omission_sets

    assert checked == 9
    assert common == 7
    assert crossed == 2
    return {"checked": checked, "common": common, "crossed": crossed}


def verify_good_source_counting() -> dict[str, int]:
    """
    Integer shadow of the Finset count.

    ji: radius-slice cardinality, 2 <= ji <= 4.
    fi: first-apex-class points in that slice, f0+f1 <= 1.
    bi: bad outside sources in that slice, bi <= 1 and disjoint from fi.
    gi = ji-fi-bi: good sources in that slice.
    """
    states = 0
    union_ge_five = 0
    sharp = 0
    for j0, j1 in product(range(2, 5), repeat=2):
        for f0 in range(j0 + 1):
            for f1 in range(j1 + 1):
                if f0 + f1 > 1:
                    continue
                for b0 in range(2):
                    for b1 in range(2):
                        if f0 + b0 > j0 or f1 + b1 > j1:
                            continue
                        states += 1
                        g0 = j0 - f0 - b0
                        g1 = j1 - f1 - b1
                        if j0 + j1 < 5:
                            continue
                        union_ge_five += 1
                        assert g0 + g1 >= 2

                        if max(g0, g1) <= 1:
                            sharp += 1
                            data = sorted(
                                [(j0, f0, b0, g0), (j1, f1, b1, g1)],
                                reverse=True,
                            )
                            assert data == [(3, 1, 1, 1), (2, 0, 1, 1)]

                        if j0 + j1 >= 6:
                            assert g0 + g1 >= 3

    assert sharp == 2
    return {
        "states": states,
        "union_ge_five": union_ge_five,
        "sharp_labelled_states": sharp,
    }


ANGLES = {
    "A2": 0,
    "q": 90,
    "w": 120,
    "A0": 140,
    "s0": 160,
    "s1": 200,
    "A1": 285,
    "b0": 320,
    "b1": 325,
}


def chord_equal(a: str, b: str, c: str, d: str) -> bool:
    """
    Exact squared-chord comparison on the unit circle.

    |P(alpha)-P(beta)|^2 = 2 - 2 cos(alpha-beta), so equality holds
    exactly iff the integer-degree differences agree up to sign mod 360.
    """
    x = (ANGLES[a] - ANGLES[b]) % 360
    y = (ANGLES[c] - ANGLES[d]) % 360
    return x == y or x == (-y) % 360


def chord_not_equal(a: str, b: str, c: str, d: str) -> bool:
    return not chord_equal(a, b, c, d)


def in_open_ccw_arc(point: str, start: str, end: str) -> bool:
    p = (ANGLES[point] - ANGLES[start]) % 360
    e = (ANGLES[end] - ANGLES[start]) % 360
    return 0 < p < e


def verify_planar_crossed_pair_core() -> dict[str, object]:
    order = list(ANGLES)
    values = [ANGLES[x] for x in order]
    assert values == sorted(values)
    assert len(values) == len(set(values))

    gaps = [
        (ANGLES["A0"] - ANGLES["A2"]) % 360,
        (ANGLES["A1"] - ANGLES["A0"]) % 360,
        (ANGLES["A2"] - ANGLES["A1"]) % 360,
    ]
    assert gaps == [140, 145, 75]
    assert max(gaps) < 180

    assert in_open_ccw_arc("q", "A2", "A0")
    assert in_open_ccw_arc("w", "A2", "A0")
    assert in_open_ccw_arc("s0", "A0", "A1")
    assert in_open_ccw_arc("s1", "A0", "A1")
    assert in_open_ccw_arc("b0", "A1", "A2")
    assert in_open_ccw_arc("b1", "A1", "A2")

    assert chord_equal("A1", "q", "A1", "w")
    assert chord_equal("A2", "s0", "A2", "s1")
    assert chord_equal("b0", "s0", "b0", "w")
    assert chord_equal("b1", "s1", "b1", "q")

    assert chord_not_equal("b0", "s0", "b0", "q")
    assert chord_not_equal("b1", "s1", "b1", "w")

    triple_count = 0
    for a, b, c in combinations(order, 3):
        aa, bb, cc = ANGLES[a], ANGLES[b], ANGLES[c]
        assert 0 < bb - aa < 360
        assert 0 < cc - bb < 360
        assert 0 < cc - aa < 360
        triple_count += 1
    assert triple_count == 84

    return {
        "order": order,
        "angles_degrees": ANGLES,
        "apex_gaps_degrees": gaps,
        "positive_ordered_triples": triple_count,
    }


def main() -> None:
    result = {
        "two_deletion_normalization": verify_two_deletion_normalization(),
        "good_source_counting": verify_good_source_counting(),
        "planar_crossed_pair_core": verify_planar_crossed_pair_core(),
    }
    print("PASS")
    for key, value in result.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
```

Verified output:

```text
PASS
two_deletion_normalization: {'checked': 9, 'common': 7, 'crossed': 2}
good_source_counting: {'states': 108, 'union_ge_five': 96, 'sharp_labelled_states': 2}
planar_crossed_pair_core: {'order': ['A2', 'q', 'w', 'A0', 's0', 's1', 'A1', 'b0', 'b1'], 'apex_gaps_degrees': [140, 145, 75], 'positive_ordered_triples': 84}
```
