# Five-point theorem-bank CEGAR audit

This scratch audit adds the exact selected-row antecedent of
`Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows`
to the existing `n = 17`, closed-cap profile `(6,8,6)` finite model.

For each candidate, vertices are sorted by the model's existential cap-block
positions.  Every increasing quintuple `a < b < c < d < e` is checked, and an
active antecedent receives the guarded cut

```text
not (pos(a) < pos(b) < pos(c) < pos(d) < pos(e))
or not m[d,a] or not m[d,c] or not m[d,e]
or not m[e,a] or not m[e,b].
```

The order guard is retained in the solver.  The audit generates neither cyclic
rotations nor reversal instances.

## Self-check

`self-check.json` reconstructs the prior source witness and finds exactly the
two audited matches:

- `(t3,a2,q1,a3,s1)`;
- `(t2,r1,q2,r2,s4)`.

It also checks on a small independent Z3 formula that a true increasing
antecedent is rejected while the same memberships with a false anchored order
remain permitted.

## Single bounded run

Command:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/theorem_bank_cegar.py --run --timeout-ms 300000 --max-iterations 500
```

Result: `SAT` after 5.432 seconds, 3 candidates, 5 theorem-bank cuts, and no
connectivity cuts.  The third candidate passes the original finite semantic
replay and contains zero anchored instances of this theorem antecedent among
all `C(17,5) = 6188` increasing quintuples.  The independent theorem-shape
replay agrees that the target anchored count is zero; it still finds 8
cyclic-rotation instances, which are intentionally outside this cut's scope.

This is finite solver evidence only.  The cut is conditional on interpreting
the existential order and selected rows as one common injective strict-CCW
Euclidean boundary.  Coordinates, QF_NRA realizability, MEC/nonobtuse
inequalities, full `CounterexampleData` geometry, cyclic/reversal adapters,
Lean kernel closure, and a transitive axiom audit are omitted.
