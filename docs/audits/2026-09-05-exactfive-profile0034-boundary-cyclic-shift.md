# Exact-five profile 0034 boundary shift and swapped-order obstruction

Date: 2026-09-05

Status: kernel-checked direct/reflected outer-order reduction, deleted-point
sector classification, strict second-row distance consequence, and a new
fresh-source blocker split.  The remaining live ingress is a terminal
consumer for that split or an obstruction for the residual heads.

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

For the next direct-cell refinement, the concrete reuse candidate was the
squared-distance form of the second statement. One project-indexed search and
one cross-project Lean search found no matching declaration; the latter found
only the converse-shaped `sqrt_lt_of_sq_lt`. The immediate consumer is the
PIQD polynomial guard comparing the second-apex distances to `O` and `U`, and
the source antecedents are already exactly those of
`secondApex_radius_lt_dist_blocker`. The checked corollary
`secondApex_sqDist_lt_sqDist_blocker` now converts the positive-radius strict
inequality with `mul_self_lt_mul_self`; it adds no geometric assumption.

## Fresh-source blocker split

The strict common-deletion source supplies more than another boundary point.
Let `e` be its actual blocker.  Deleting the fresh source survives at the old
blocker and at the second apex, so `e` is distinct from both.  The old blocker
and second apex are already equidistant from `O,a`.  If the critical row at
`e` also contained both `O` and `a`, convex independence would put three
distinct carrier centers on their perpendicular bisector, contradicting the
carrier bound of two.

The adapter therefore proves that the fresh critical row omits `O` or `a`.
The cross-deletion theorem converts this to a source-faithful survival split:

```text
deleting O survives at e
or
deleting a survives at e.
```

Full deletion robustness at the second apex then packages either arm as a
new `CommonDeletionTwoCenterPacket`, with centers `e` and the second apex.
This is the first checked use of the strict fresh source beyond support
freshness.  It applies to the fourth incidence constructor, where both
`O ∈ row₁` and `O ∈ row₂` are available.  No existing import-acyclic terminal
consumes either resulting packet, so this is a source synchronization step,
not closure of the open target.

The first-apex-source arm can be normalized further.  Let `f` be the actual
blocker of `O`.  If `f` is the old blocker, the result is a named actual-blocker
collision.  Otherwise the same saturated-pair argument forces the critical
row at `f` to omit `a`, so deletion of `a` survives at `f`.  The second-apex
robustness packages this as a retained-source common-deletion packet.  The
complete normalized output is therefore

```text
actualBlocker(O) = actualBlocker(a)
or
there is Z distinct from the old blocker and second apex such that
deleting a survives at both Z and the second apex.
```

The external arm retains its source tag: `Z` is the actual blocker of either
`O` or the strict fresh source.  In both cases `Z` is a carrier point distinct
from all three original row centers `O,U,c`.  Reusing
`firstRow_support_eq_criticalShell_of_center_eq` identifies the external
packet's first row with the tagged source's complete canonical critical shell,
and in particular places that source in the row.  This provenance would be
lost by returning only an untagged common-deletion packet.

The collision arm now has a further checked finite-map reduction.  Full
deletion robustness at `O` and at the second apex omits both vertices from the
finite blocker endomap.  Given the known `O,a` blocker fiber, finite counting
therefore produces either a second collision fiber with a different blocker
or a third source in the known fiber.  The combined adapter theorem exposes
the complete residual as one of:

```text
an external retained-source common-deletion packet;
a second blocker collision fiber at a different blocker;
a third source in the first-apex/retained blocker fiber.
```

These outputs are source-clean and import-acyclic.  None has a current
terminal: the multiplicity alternatives have no available cap/order consumer,
while the external retained-source packet lacks the original pair-source
blocker orientation required by the downstream exact-five closer.

The bounded reuse preflight for the third-source arm selected
`CriticalShellSystem.selectedFourClass_support_eq_shell` from
`U1CarrierInjection`.  Its immediate consumer is the combined adapter theorem;
the source's blocker equality supplies the antecedent with no circular import.
Consequently the third source lies in `normalForm.blockerClass.support`, and
that support is its complete canonical critical shell.  The first missing
antecedent for a terminal remains a boundary-sector or cap placement for this
source; membership in the blocker row alone does not choose one.  Reusing the
public actual-blocker-fiber bound from `SurvivalCover` sharpens this arm once
more: either the four-source blocker fiber exhausts the blocker row, or a
source in that row has an actual blocker different from the `O,a` blocker.
This creates a row-local escape source, but still does not place it in a
specific boundary sector.

A second bounded reuse preflight targeted the concrete intersection candidate
`blockerClass ∩ secondApexClass = {O,a}`.  The project Lean corpus (indexed at
`2bb06af72`) contained the general overlap bound but no theorem with this exact
normal-form conclusion.  The new
`blockerClass_inter_secondApexClass_eq` proves it directly from
`C.overlap_le_two` and the two positive shared-source incidences.  Its immediate
consumer, `knownBlocker_thirdSource_twoSlot_and_omission`, combines that exact
intersection with the four-point blocker support: a third source in the known
`O,a` blocker fiber is one of precisely two unnamed blocker-row slots and is
absent from the second-apex row.  The first missing antecedent remains a cyclic
placement for either slot; the result does not infer one from row membership.

Pro consult `01M1SAXGH3PEB66AT5FCSGDDCN` and an independent read-only audit
both rejected blocker counting as a terminal route.  The consult also selected
the already-landed
`physicalSecondApex_or_largeInterior_of_fourthIncidence` as the strongest
existing reduction for the fourth continuation constructor.  It leaves either
a physical second-apex class omitting the retained and deleted sources or
`5 ≤ S.oppInterior2.card`; neither alternative currently supplies the residual
head placement required by the profile-0034 analytic consumers.  This theorem
must use the original normal-form deletion packet, not the continuation's
derived deletion packet.

The bounded direct-order reuse search at indexed revision `0a51fea44` also
selected the cyclic/decreasing variants of
`TwoKalmansonEqualityChainBridge.false_of_five_selected_rows_two_kalmanson_chain_of_six_order`.
Their prospective consumer was the fourth continuation augmented by either the
physical second-apex replacement or the source-tagged external packet.  The
route is import-acyclic but fails at its first structural antecedent: it needs
selected rows at five distinct boundary centers.  The live packet supplies
rows centered at `O`, `U`, and `c`; the physical replacement repeats `c`, and
an external packet adds at most one further center.  In the strongest attempted
role mapping the next required row would be centered at the retained point,
which is unavailable.  The schema therefore cannot close this leaf as-is.

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

All three files contain no proof placeholders.  The authenticated run-0004
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

## Direct physical-block deletion run

The authenticated PIQD/Z3 `run-0003` campaign completed from execution HEAD
`53a044df922b4b9723ac51f44372b1f089c08478` with 20 workers and a 60-second
per-query cap. Its manifest, launch, and terminal self-hashes are respectively
`c80e09b9fe8b5d15dad8b2403b1023ec0fc8fbdccb04f5a82b3979876e1d71b0`,
`fe9e795a8df4d2b0f38c24a7c5536a778ae07dd8952e139fb6fa3947e891a568`, and
`666ed25997beb262efb6a00062aaca64e8211660fc482cb7d5dac51d0dbd1720`.
Independent offline verification passed.

Both radius branches completed the full 57-query schedule without a
custody-valid UNSAT result. Each branch produced 55 `UNKNOWN` results, one
exact-replayed `SAT` result for the 13 cyclic edge blocks alone, and one
`SAT_REPLAY_REJECTED` result for the metric rows and guards alone. The latter
rejection is conservative: Z3 returned algebraic `root-obj` coordinates that
the exact-rational readback parser intentionally does not accept. No current
set was reduced, and all 26 physical groups remain in each branch's terminal
record.

This completed-wave mine yields no concrete general theorem candidate and
therefore does not trigger another theorem-bank search. In particular, the
run neither proves satisfiability nor shows that every physical group is
necessary; it establishes only that this bounded deletion schedule found no
smaller authenticated UNSAT subset. The highest-leverage remaining step is
still source-facing: derive a live direct or reflected cyclic placement (or an
equivalent residual selector) from the full fourth-incidence packet, then feed
it to the already proved boundary-order consumers.
