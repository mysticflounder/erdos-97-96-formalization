# Card-12 `(4,5,6)` MEC straddling-row obstruction

## Verdict

**PROVEN.** The exact four-row `(4,5,6)` residual saved by the common-system
metric CEGAR cannot satisfy the actual circumscribed-MEC disk and nonobtuseness
hypotheses together with its cyclic order.  The contradiction uses only the
three residual rows centered at labels `0`, `1`, and `3`; it does not require
the row centered at `2` or the global selected-K4 rows at centers `4`--`11`.

This closes a reusable metric consumer.  It does **not** prove that every live
card-at-least-12 carrier produces these rows and orientations.  That incidence
or placement producer remains the open ATAIL-FORCE ingredient.

Nothing here raises the ATAIL threshold above card 12.  The desired producer
should remain uniform for `card >= 12` (with card 11 handled separately), rather
than turning cards 13 and above into new case-by-case obligations.

## Exact finite-label map

Use

```text
o = 0,  a = 1,  p = 2,  s = 3,  x = 10,  y = 7.
```

The three rows imply

```text
|01| = |12| = |03| = |3,10| = |3,7|.
```

The MEC packet supplies that `0,1,2` lie on one boundary circle, that `7` and
`10` lie in its closed disk, and that the boundary angle at `1` is nonobtuse.
The residual cyclic order supplies the strict orientations placing `7` and
`10` on opposite sides of the ray from `0` through `3`.

## Proof mechanism

Normalize `o=(0,0)` and `a=(1,0)`, and write `p=(A,B)` and `s=(C,D)`.
The equalities and the nonobtuse condition give `A <= 1` and `B >= A`.
For a point on the circle centered at `s` through `o`, its power with respect
to the MEC boundary circle reduces to a linear expression.  With

```text
ell = B * (2 - C) - A * D,
q   = A * C - B * D,
```

one proves `ell > 0`.  Disk containment for the point on one side of the
`o-s` ray forces `q < 0`, while disk containment for the point on the other
side forces `q > 0`.

## Lean artifacts and verification

Production module:

```text
lean/Erdos9796Proof/P97/Census554/MECStraddlingRowCore.lean
```

It exposes positive- and negative-orientation metric theorems, a reusable
`EdgeClosure` `Core`, geometry wrappers, and direct consumers.  The reflected
form is available for clockwise boundary indexing.

Thin residual adapter and axiom audit:

```text
scratch/atail-force/residual_456_mec_producer_adapter.lean
scratch/atail-force/mec_straddling_row_core.lean
```

The production target build succeeds.  Every audited theorem depends only on
`propext`, `Classical.choice`, and `Quot.sound`; none depends on `sorryAx`.
