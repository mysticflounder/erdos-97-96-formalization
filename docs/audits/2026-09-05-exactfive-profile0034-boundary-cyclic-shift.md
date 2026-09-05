# Exact-five profile 0034 boundary shift and swapped-order obstruction

Date: 2026-09-05

Status: kernel-checked theorem-side reduction; the live outer-order ingress is
still open.

## Reuse preflight

The concrete target was the seven-role boundary ingress for
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.  One
indexed Lean-corpus search found the primitive cyclic-shift facts and the cap
interior order-convexity theorem, but no declaration that supplies the needed
profile-0034 role order.  Direct source inspection also rejected the existing
six- and seven-point Kalmanson consumers: their row-equality hypotheses are not
available from this live packet.

## Boundary transport

`BoundaryIndexing.cyclicShift` recuts an authenticated boundary enumeration at
any chosen index.  Its proof preserves boundary injectivity, boundary image,
counterclockwise convexity, index injectivity, and the `point_eq` interface.
The adapter's cyclic consumers use this operation only to normalize the cut;
they do not exchange the relative positions of the retained point and the
blocker-row residual.

The seven-role ingress now proves pairwise distinctness for both the point list

```text
[U, p, s, a, d, c, O]
```

and its boundary-index list.  The added fixed-role inequalities come from row
center omission, the three distinct row centers, retained/deleted separation,
and strict-cap endpoint separation.  Thus a future finite order classifier
cannot hide an alias case.

## Swapped-order analytic theorem

The reduced profile-0034 solver cell suggested the order `U,p,a,s,d,c,O`.
The resulting Lean theorem is stronger than that diagnostic cell:
`boundaryOrder_a_before_s_obstruction` excludes the six-role chain

```text
U < a < s < d < c < O
```

using only the equilateral base equations, `Oa = Od`, `UO = Us`, `cO = ca`,
and six strict turns supplied by convex boundary order.  It does not use `p`,
the source-strict guard, a radius branch, or any solver artifact.

After similarity normalization to

```text
U = (0,0), O = (1,0), a = (1/2,-1/2)
```

with the vertical coordinate scaled by `sqrt 3`, the `a<s<O` turns and the
`U`-circle equation force `s_x > 1/2` and `s_y > -1/2`.  The perpendicular
bisector equation for `c`, the `d,c,U` turn, the `U<a<d` turn, and the
`O`-circle equation force `d_x > 1/2` and `d_y < -1/2`.  Consequently the
turn `a,s,d` is negative, contradicting its strict boundary sign.

The source adapter derives every metric premise from the live selected rows.
`false_of_profile0034_middleSwap_onBoundary` combines this new theorem with
the prior `U,p,s,a,d,c,O` obstruction.  Therefore either order of the middle
pair closes once the source supplies the outer placement
`U<p<{a,s}<d<c<O`.  A cyclic-cut wrapper preserves the same claim after
subtracting the index of `U` from every role index.

## Verification and remaining frontier

Focused checks passed:

```text
lake env lean Erdos9796Proof/P97/Census554/ExactFiveProfile0034CommonObstruction.lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/BoundaryIndexingCyclicShift.lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
```

All three files contain no `sorry` or `admit`.  The authenticated run-0004
UNSAT result remains discovery evidence only and is not used by these proofs.

The first missing source fact is now the outer cyclic placement.  In shifted
indices it must put `p` after `U`, both `a` and `s` after `p` and before `d`,
then `d<c<O`.  Pairwise distinctness is closed; no current theorem derives
this placement from the selected-row memberships and strict-cap data.
