# Generated-successor full-geometry audit

Date: 2026-07-16

Status: **ONE Q-CRITICAL SUBCASE CLOSED; NO DIRECT CONSUMER FOR THE FULL
OUTSIDE-MIDDLE SUCCESSOR.**

## Scope

This audit starts from the checked live-heavy packet

```text
N : OriginalQOutsideMiddleSuccessor C G
```

and asks whether the complete A-TAIL parent geometry turns it into an
existing terminal.  In particular, the audit retains:

- the MEC-derived Moser triangle and cap order;
- the second large-cap witness and no-`IsM44` hypothesis;
- global K4 and global non-removability;
- the common `CriticalShellSystem`;
- the chosen `CriticalPairFrontier` and anchored coherent-R origin;
- the physical live and second-apex rows;
- both original-`q` generated centers in the live-heavy branch; and
- the source-faithful generated support containing `N.source`.

The sibling scratch file

```text
r-f2-directed-original-q-row/generated-successor-parent/
  GeneratedSuccessorParent.lean
```

now records that full telescope as
`OriginalQOutsideMiddleSuccessorParentSurface`.  This lane did not edit that
file.  It changed no production source, closure document, proof-blueprint
state, protected lane, or unique-row file, and it ran no full build.

## Required bank and corpus preflight

Before extracting a new lemma, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches included:

```text
nthdegree docs search --lean
  "generated support successor actual blocker common deletion two centers outside cap pair"
nthdegree docs search --lean
  "two strict cap centers common outside pair selected four class"
nthdegree docs search --lean
  "critical shell blocker cap rank successor source"
```

The closest declarations were:

```text
actual_blocker_ne_of_deletion_survives
blocker_centers_ne_of_not_mem_other_selected_support
cross_deletion_survives_iff_not_mem_selected_support
CapSelectedRowCounting.outsidePair_unique_capCenter
CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le
SelectedFourClass.inter_card_le_two
```

They are consumers or polarity classifiers.  None produces the missing
second common point, blocker alignment, or rank descent from an
`OriginalQOutsideMiddleSuccessor`.

## Kernel-checked terminal extracted here

`GeneratedSuccessorGeometry.lean` proves:

```text
false_of_qCritical_coherentSource_mem_support
```

In schematic form:

```text
live-heavy original-q generated center c
+ q-critical generated triple Q at c
+ coherent predecessor r in Q.support
-------------------------------------------------
False
```

The completed generated row at `c` contains `q` and `r`.  The retained live
row at `p` also contains `q` and `r`.  Both centers are in strict `oppCap2`,
while cap saturation proves that both shared points are outside `oppCap2`.
The existing terminal

```text
false_of_two_strictOppCap2_rows_common_outside_pair
```

then gives `False`.  This removes `r ∈ Q.support` from every remaining
q-critical generated-successor residual; it does not assume a new incidence.

The focused validation was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-original-q-cap-escape-oleans:/private/tmp/p97-r-f2-original-q-offlive-oleans:/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-generated-successor-geometry-oleans/GeneratedSuccessorGeometry.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/generated-successor-geometry/GeneratedSuccessorGeometry.lean
```

It exited successfully.  The printed axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the file.

## Exact blocker polarity on the successor

For `N : OriginalQOutsideMiddleSuccessor C G`, the checked successor packet
contains deletion survival at both retained centers:

```text
HasNEquidistantPointsAt 4 (D.A.erase N.source) p
HasNEquidistantPointsAt 4 (D.A.erase N.source) S.oppApex2
```

The common critical map therefore forces

```text
W.H.centerAt N.source _ != p
W.H.centerAt N.source _ != S.oppApex2.
```

This is useful localization, but it has the opposite direction from a
prescribed-deletion terminal.  The actual blocker is a third carrier point.
Its critical row shares `N.source` with the generated row and no second point
is currently forced.  One shared point does not instantiate any two-circle,
three-common-point, or ordered-cap sink.

The existing `ActualBlockerCapMetricOutcome` also does not apply directly.
It is indexed by an `AmbientRobustHistoryPair`, whose source and mate both lie
on one retained first-apex radius.  The generated successor source carries no
membership in that fixed radius class and no identification with its chosen
mate.

## Why the proposed q-deleted strengthening is not routine

A q-deleted generated row centered at `x` has at least two full-support
points outside `oppCap2`, and the existing cap-escape theorem gives at least
one point outside both the live row and `oppCap2`.  This does **not** force
that point outside the physical middle row.

Using the live-heavy names

```text
live   = {q,x,y,r}
middle = {x,y,s,t},
```

the following projected support pattern is not excluded by the current
cardinality and placement consequences:

```text
Gx.support = {r,s,y,a}

r,s notin oppCap2
y,a in oppCap2
a notin live
a notin middle.
```

It has four points, at least two off the cap, at least two off the live row,
omits `q` and the center `x`, and can meet the middle in only `{y,s}`.  The
off-cap/off-live escape is `s`, while the outside-middle successor source
`a` is inside `oppCap2`.  The checked confined theorem legitimately returns
`a`; it does not make `s` and `a` equal.

Even the symmetric two-row projected pattern can avoid the existing common
outside-pair sink:

```text
Gx.support = {r,s,y,a}
Gy.support = {r,t,x,b}.
```

Here the two generated rows share only `r` outside the cap.  These displayed
sets are an **incidence/count boundary**, not a Euclidean or full-parent
countermodel.  They show why the proposed strengthening is not a consequence
of the already-extracted cap-cardinality facts and why no bookkeeping-only
Lean proof was added.

## Verified q-critical residual shape

Fix the generated center `x`.  Suppose:

- `z` is the checked off-live/off-`oppCap2` generated support point;
- `z` remains in the physical middle row;
- `a` is an outside-middle successor source; and
- no outside-middle generated source is off `oppCap2`.

Then the exact consequences are:

```text
z = s or z = t
a in oppCap2
r notin Q.support
```

The first line follows because `z` is off live but lies in
`{x,y,s,t}`.  The second is the assumed absence of the stronger escape.  The
third is the kernel-checked terminal extracted in this lane.

There is a narrower exact-card-three arm.  If `a` is the only
outside-middle support point and the other member of `{s,t}` is absent, then
the q-critical support is forced to be

```text
Q.support = {y,z,a},
full support = {q,y,z,a}.
```

Both `y` and `a` lie in `oppCap2` and are equidistant from the cap center
`x`.  The already-proved one-sided cap-distance injectivity therefore puts
their ordered-cap ranks on opposite sides of the rank of `x`.

This is a real rank-expansion fact, but not yet a terminal:

- the rank of `y` relative to `x` is not fixed in the packet;
- a second outside-middle support point is an explicit alternative;
- the generated successor does not recursively produce the same
  original-`q` profile centered at `a`; and
- no retained no-wrap or decreasing interval is present.

Thus adding a generic rank/successor constructor would repeat the known
cycle problem rather than close it.

## Concrete textbook candidate

The locally ingested computational-geometry textbook was queried directly:

```text
bkos08-de-berg-cheong-van-kreveld-overmars-2008-
computational-geometry-algorithms-applications
```

The only concrete new candidate relevant to deletion is Lemma 4.14 on the
smallest enclosing disc `md(P,R)`:

```text
if p lies in md(P \ {p}, R), deletion leaves the optimum unchanged;
if p lies outside it, p is forced onto the boundary of md(P,R).
```

Applied with `P = D.A` and `p = N.source`, this could in principle classify
whether deleting the successor source changes the global MEC and whether the
source is a new MEC boundary point.

It does not feed a current terminal.  The successor surface supplies neither
the antecedent `N.source ∈ md(D.A.erase N.source, R)` nor its negation, and
the exact generated/critical circles are not enclosing discs: support
nonmembership says only `dist != radius`, not inside or outside.  Even MEC
stability gives no second common circle point, actual-blocker alignment, or
old second-apex radius equality.  Therefore no textbook lemma was translated
to Lean merely as an unused positive packet.

The textbook's unconditional two-circle and one-sided cap-order facts are
already represented by stronger kernel-checked declarations in the local
bank.

## Consumer matrix

| Existing consumer | Available from the full successor surface | Exact missing antecedent |
|---|---|---|
| `outsidePair_unique_capCenter` | generated center and live center are in the same ordered cap; one generated outside point can be produced | the same **two** distinct outside points on both circles |
| `SelectedFourClass.inter_card_le_two` | generated row and actual-blocker row share `N.source` | two additional common support points |
| `u1TwoLargeCapObstruction` | isolated same-radius equalities from individual rows | the remaining cross-row equalities in one consistent five-point role map |
| second-apex critical reorientation | exact second-apex row and full parent frontier | deletion failure at the successor source; the packet proves survival instead |
| old off-live fully-robust sink | a new common-deletion packet | membership of the new source in the old middle row; the packet proves nonmembership |
| actual-blocker orbit/rank handlers | total common critical map | a fixed-radius robust pair or a cycle-wide coherent rank/no-wrap packet |

## Countermodel boundary

- **PROJECTED FINITE INCIDENCE BOUNDARY:** the q-deleted support patterns above
  satisfy the currently used card/cap/live/middle consequences.  They are not
  asserted Euclidean.
- **EXACT LOCAL ALGEBRAIC BOUNDARY:** the previously recorded parabola models
  realize original-`q` generated rows while avoiding uniform named hits.  They
  omit global K4, total CSS, and the full MEC/cap parent.
- **KERNEL-CHECKED FINITE RECURSION BOUNDARY:** the existing 24-vertex model
  admits a periodic common-deletion successor orbit.  It is non-Euclidean and
  lacks the generated origin.
- **NOT COUNTERMODELED:** the complete
  `OriginalQOutsideMiddleSuccessorParentSurface`.

## Closure consequence

The new q-critical lemma removes one genuine subcase, but the full
outside-middle successor is not closed.  The next proof must consume the
complete parent surface and produce one of the following **with its immediate
existing consumer**:

1. a second common point joining the generated row to the source's actual
   blocker row;
2. a common outside pair joining the two live-heavy generated centers;
3. a prescribed deletion failure contradicting one of the successor's two
   survival fields; or
4. a cycle-wide, no-wrap cap-rank packet, not a one-edge rank choice.

Absent one of those facts, the honest theorem remains the direct

```text
FalseOfOriginalQOutsideMiddleSuccessor
```

on the full parent surface.  Re-running `alignedRCommonDeletionBranch` or
adding another origin constructor would only reclassify the same open
geometry.
