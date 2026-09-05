# P97 cell-16 minimal planar-core extraction — 2026-09-05

## Scope and custody

This checkpoint continues the exact `n=12` radius-ten counterexample-mining lane. It does **not** claim closure of reconstructed cell 16 or any radius-ten cell. The original radius-ten master/analyzer are still unavailable in this runtime, so no exhaustive enumeration was resumed.

The input is the fresh reconstructed cell-16 strict-Kalmanson survivor support table from the 2026-09-04 handoff. The exact planar screen is the generic midpoint screen from the preceding checkpoint.

## Result

All 4095 nonempty subsets of the 12 row assignments were tested, treating omitted rows as completely unassigned.

- 312 row subsets already force an exact planar contradiction.
- 58 of those are inclusion-minimal.
- 16 minimal cores have 7 assigned rows.
- 42 minimal cores have 8 assigned rows.
- No core of size <=6 was found by exhaustive subset testing.

The 58 minimal cores split into exactly two certificate families under the screen's deterministic certificate choice:

1. 35 cores force `2*z6 = z0 + z7` and use row 0 to supply `d(0,6)=d(0,7)`.
2. 23 cores force `2*z3 = z1 + z5` and use row 1 to supply `d(1,3)=d(1,5)`.

Thus the fresh survivor is not killed by a single fragile affine dependency: it contains at least two distinct forced-midpoint obstruction families.

## Search consequence

Each minimal core gives a sound learned clause for any solver state using the exact same row-support literals: at least one row in the core must differ. Because omitted rows were not used by the certificate, these clauses are valid under arbitrary completion of the other rows.

For generic CEGAR integration, the stronger recommendation remains to run the label-generic midpoint screen on each structural survivor, shrink any conflict to an inclusion-minimal row core, and learn the resulting disjunction. The 58-core bank is a regression corpus and immediate cell-16 cut bank, not a claim of global completeness.

## Validation

`enumerate_minimal_cores.cpp` compiled under C++20 with `-O3 -Wall -Wextra -Wpedantic`. A separate Python JSON check verified the recorded counts, uniqueness of all 58 cores, and that no recorded minimal core strictly contains another recorded minimal core. Minimality against single-row deletion is checked by the C++ enumerator directly using the exact screen.

## Honest boundary

- Fresh support table: exactly nonplanar.
- 58 inclusion-minimal partial row cores extracted.
- Reconstructed cell 16: OPEN.
- Radius-ten cells newly closed here: 0.
- Global exact `n=12`: OPEN.
