# Dual-row exact-packet CEGAR result

The bounded `n = 17`, closed-cap profile `(6,8,6)` deletion/deletion branch is
`SAT`.

The final run took 17.078 seconds and examined 6 candidates.  It added no
connectivity cuts, 7 cross-layer shared-pair cuts, and no new circle-overlap
or perpendicular-bisector cuts (those violations were already absent under
the common radius-equivalence geometry).  The three proved cyclic-shift
families added:

- 15 `false_of_five_ccw_two_selected_rows_cyclicShift` cuts;
- 12 `false_of_five_ccw_second_two_selected_rows_cyclicShift` cuts;
- 15 `false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift` cuts.

The survivor selects `Q.source = a1`, `Q.otherOutsidePoint = t2`, deletes
`a1` in the outside packet, and deletes `p1` in the collision packet.  The
two canonical blocker-row centers coincide between packets (`p2` and `q2`),
while the three rich-apex supports are represented by independent variables.

Each theorem-family guard was checked separately on all 120 orders of five
symbols: exactly the five direction-preserving rotations activate the guard,
and no reflected order does.  The in-process semantic replay evaluated all
581,370 final solver assertions and 49 accumulated packet cuts.  A separate
artifact-only Python replay imported neither Z3 nor the CEGAR driver and
checked all 10 exact rows, 40 distinct-center row pairs, 80 distinct-center
row triples, all 6,188 five-subsets, and all 30,940 positive cyclic orders.  It
found zero active instances of each of the three theorem families.

Commands:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/dual-row-cegar/dual_row_cegar.py --self-check
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/dual-row-cegar/dual_row_cegar.py --run --timeout-ms 300000 --max-iterations 500
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/dual-row-cegar/replay_dual_rows.py
```

This is finite external Boolean/incidence evidence for the positive
deletion/deletion sub-branch only.  The two crossed outside-pair constructors
are not encoded.  There are no coordinates or QF_NRA realization, no full
`CounterexampleData`/MEC/nonobtuse geometry, no arbitrary-`n` conclusion, and
no Lean kernel closure.  The live terminal remains load-bearing `sorry`.
