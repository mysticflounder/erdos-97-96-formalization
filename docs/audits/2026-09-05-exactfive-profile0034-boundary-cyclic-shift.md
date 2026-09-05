# Exact-five profile 0034 boundary shift and swapped-order obstruction

Date: 2026-09-05

Status: kernel-checked direct/reflected outer-order reduction, deleted-point
sector classification, and a strict second-row distance consequence.  The
remaining live ingress is a selector or obstruction for the residual heads.

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

The live row circles also determine the outer order after cutting at `U`.
The row-one equations give `dist U a = dist U O`, while row two gives
`dist c O = dist c a`.  Strict Kalmanson inequalities exclude four of the six
linear orders of `a,c,O`; therefore exactly one of

```text
U < a < c < O
U < O < c < a
```

holds in the shifted boundary indexing.  The proof is source-level and uses
no fixed-order computational witness.

The first-opposite-cap block also puts the retained and deleted points on the
same cyclic side of the two opposite apices.  Transporting that adjacency to
the packet boundary and combining it with the outer classifier leaves exactly
three deleted-point sectors in each orientation:

```text
d < a < c < O     a < d < c < O     a < c < O < d
d < O < c < a     O < c < d < a     O < c < a < d
```

The existing analytic consumers reach only the two middle sectors.  This is a
complete source-level classification of `d` from the current cap and row
facts, not a placement of either selectable residual head.

Two further scalar consequences are now kernel checked.  The blocker has
different distances to the deleted and retained points on the first-apex
critical shell.  In the positive fourth-incidence prefix, strict Kalmanson on
`U,a,c,O` or `U,O,c,a` proves

```text
second-apex row radius < dist second-apex blocker.
```

Neither statement orders a row-zero or row-one residual on the boundary.

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

The orientation-invariant scalar kernels also support the fully reversed
chains.  New boundary consumers exclude

```text
U < O < c < d < a < s < p
U < O < c < d < s < a
```

and a cyclic wrapper combines them so either middle order closes under the
reflected outer placement.  Thus the direct and reflected branches supplied
by the live `a,c,O` classifier now have matching theorem-side consumers.

## Verification and remaining frontier

Focused checks passed:

```text
lake env lean Erdos9796Proof/P97/Census554/ExactFiveProfile0034CommonObstruction.lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/BoundaryIndexingCyclicShift.lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
```

All three files contain no `sorry` or `admit`.  The authenticated run-0004
UNSAT result remains discovery evidence only and is not used by these proofs.

Exact coordinate realizations and cap-compatible cyclic counterorders show
that the current row equalities do not force one of the three `d` sectors, and
that current row membership does not force a row-zero residual or row-one
residual into the intervals required by the middle-sector consumers.  These
are limitation witnesses, not counterexamples to the full project source.

The adapter remains outside the anchored proof spine: it is not imported by
`Rigid221Closure`.  Its intended integration point is
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`; no B1
closure is claimed.  The next load-bearing question is whether that target's
fresh common-deletion packet, or a stronger upstream record derived from it,
supplies a residual selector or a new obstruction covering the untouched
sectors.  Pairwise distinctness, the `a,c,O` order, and the six-way `d`
classification are closed.
