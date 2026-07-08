#!/usr/bin/env python3
"""Token-level re-verification of the 19 reflected / 31 ordered primitive N8
tuples, independent re-implementation of census/incidence/escape_census.py semantics.

Capacity model (escape-census.py):
  base strict-interior capacities: same <= 1, left/right <= 2 (own interior
  excludes the center itself: |I_own| - 1 = 1 + e_own; adjacent interiors
  |I_adj| = 2 + e_adj);
  support needed for (m,s,l,r) = max(0,s-1) + max(0,l-2) + max(0,r-2);
  m <= 2 (Moser bound, geometric grounding in formulation.md S2.4);
  primitive: m+s+l+r = 4.
"""
import itertools, sys

def support_needed(s, l, r):
    return max(0, s - 1) + max(0, l - 2) + max(0, r - 2)

def primitive_tuples(p, reflect):
    rows = set()
    for m in range(3):
        for s in range(5):
            for l in range(5):
                for r in range(5):
                    if m + s + l + r != 4:
                        continue
                    if support_needed(s, l, r) > p:
                        continue
                    row = (m, s, l, r)
                    if reflect:
                        row = min(row, (m, s, r, l))
                    rows.add(row)
    return sorted(rows)

EXPECTED_19 = [
    (0,0,0,4),(0,0,1,3),(0,0,2,2),(0,1,0,3),(0,1,1,2),(0,2,0,2),(0,2,1,1),
    (0,3,0,1),(0,4,0,0),(1,0,0,3),(1,0,1,2),(1,1,0,2),(1,1,1,1),(1,2,0,1),
    (1,3,0,0),(2,0,0,2),(2,0,1,1),(2,1,0,1),(2,2,0,0),
]

def main():
    ok = True
    for p in range(0, 201):
        o = primitive_tuples(p, reflect=False)
        q = primitive_tuples(p, reflect=True)
        if p >= 3:
            if len(o) != 31 or len(q) != 19:
                print(f"MISMATCH at p={p}: ordered {len(o)} reflected {len(q)}")
                ok = False
            if q != sorted(EXPECTED_19):
                print(f"MISMATCH at p={p}: reflected list differs")
                ok = False
    # max support needed over the 19
    ms = max(support_needed(s, l, r) for (m, s, l, r) in EXPECTED_19)
    print(f"reflected@p>=3: {len(primitive_tuples(3, True))}; "
          f"ordered@p>=3: {len(primitive_tuples(3, False))}; "
          f"max support needed over the 19: {ms}")
    # constancy check: p=3 vs p=200 sets equal
    assert primitive_tuples(3, True) == primitive_tuples(200, True)
    assert primitive_tuples(3, False) == primitive_tuples(200, False)
    # tuples with support > 3 would need p >= 4 -- none exist (max component 4
    # gives support 4-2=2 on adjacents, 4-1=3 on same)
    print("EXPECTED_19 match:", sorted(EXPECTED_19) == primitive_tuples(3, True))
    print("ALL OK" if ok else "FAILURES PRESENT")
    return 0 if ok else 1

if __name__ == "__main__":
    sys.exit(main())
