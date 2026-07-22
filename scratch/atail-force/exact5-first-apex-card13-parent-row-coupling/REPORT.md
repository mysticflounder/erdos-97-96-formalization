# Exact-five card-13 first-apex parent-row coupling

Date: 2026-07-21

Status: **KERNEL-CHECKED SOURCE REDUCTION. NO DIRECT TERMINAL WAS FOUND AND
NO PRODUCTION `sorry` IS CLOSED.**

## Result

This audit starts from the kernel-checked `(5,6,5)` normal form in

```text
scratch/atail-force/exact5-first-apex-card13-normal-form/
  ExactFiveFirstApexCard13NormalForm.lean
```

and couples its complete first-apex radius classes to the actual q-deleted
parent row `R.common.packet.B₁`.

The new checked file is

```text
ExactFiveFirstApexCard13ParentRowCoupling.lean
```

It proves the following exhaustive sharpening.

### Same-radius mode

When `P.doubleRadius = radius`, the complete retained six-point class
saturates all four strict points of `S.oppCap1`. Every other positive K4
radius at `S.oppApex1` would need at least two of those same strict points,
but different radius classes are disjoint. Therefore the retained frontier
radius is the unique first-apex K4 radius:

```lean
firstApex_K4_radius_eq_frontier_of_sameRadius
```

In particular, the actual q-deleted parent row is a four-point subrow of that
unique complete six-class:

```lean
parentFirstRow_subset_frontierClass_of_sameRadius
```

### Distinct-radius mode

When `P.doubleRadius ≠ radius`, the earlier normal form proves that the two
complete exact-four classes have disjoint two-point strict-cap parts whose
union is the four-point strict cap. A third K4 radius would again need two
strict-cap points, but every strict position is already occupied by one of
the two disjoint classes. Thus every first-apex K4 radius is one of the two
packet radii:

```lean
firstApex_K4_radius_eq_retained_or_double_of_distinctRadius
```

The actual parent row cannot use the retained radius. That radius class is
exactly `P.retainedRow.support`, contains the deleted frontier source `q`,
and has cardinality four, whereas `R.common.packet.row₁.q_not_mem` says that
the actual q-deleted row omits `q`. Consequently the actual row is forced to
be the other complete class:

```lean
parentFirstRow_eq_doubleRow_of_distinctRadius :
  R.common.packet.B₁ = P.doubleRow.support
```

This equality is the strongest new source coupling found by the audit. It
was absent from the earlier anonymous-row search surfaces.

## Coupling to the asymmetric global-cover outcome

Let `N : SourceTwoHitNormalForm ...` be either asymmetric constructor of
`ExactFiveGlobalCoverStarOutcome`. Its two outside points are already
co-radial from the actual physical blocker. The existing theorem

```lean
N.false_of_firstApex_coRadial
```

closes as soon as those two points are also co-radial from
`S.oppApex1`.

The checked residual is now exact in both first-apex modes.

### Same radius

```lean
N.outside_not_both_mem_firstCapInterior_of_sameRadius
```

proves that at least one outside point must lie outside the four-point strict
first opposite cap. If both lay there, saturation by the complete six-class
would immediately feed `N.false_of_firstApex_coRadial`.

### Distinct radii

```lean
N.outsidePair_crosses_parentFirstRow_of_distinctRadius
```

proves that, if both outside points lie in the strict first opposite cap,
then they must cross the two exact classes:

```text
one lies in P.retainedRow.support
the other lies in R.common.packet.B₁ = P.doubleRow.support.
```

Putting both points in either class would again feed the existing first-apex
co-radial terminal. Thus the remaining strict-cap residual is not an
anonymous two-row case: it is exactly the cross-color case.

## Consumer audit

The required local, sibling, legacy, and older-general theorem-bank
registries were checked before proving these incidence/radius statements.
Focused indexed Lean searches covered exact-six first-apex classes, two
complete exact-four classes, q-deleted retained rows, asymmetric outside
pairs, U5 class-level consumers, `u1TwoLargeCapObstruction`, and the two
constructors of `CriticalFiberClosingCore`.

No existing consumer closes either new parent-row normal form.

- `SourceTwoHitNormalForm.false_of_firstApex_coRadial` closes only after both
  outside points occur in one first-apex class. The checked distinct-radius
  residual permits exactly one point in each class.
- `outsidePair_unique_capCenter` likewise still needs a positive second-row
  occurrence through the same outside pair.
- The U5 banked consumers require named cross-support membership at an actual
  critical center. The identity `B₁ = doubleRow.support` supplies no such
  membership for either outside point.
- `CriticalFiberClosingCore` still needs either a repeated actual-blocker
  fiber with a source-indexed cross row, or a same-cap second center. Neither
  follows from the two first-apex classes.
- The actual second-apex row `B₂` retains exactly the already-proved facts:
  it is a four-subset of the unique five-point physical class, contains at
  least two of the three physical vertices, and overlaps `B₁` in at most
  two points. None of these fields mentions an asymmetric outside point or
  creates the missing positive occurrence.
- On `allRowsOneHit`, all three actual physical critical rows contribute
  negative pair omissions. The new `B₁` identity does not turn those
  omissions into a two-point hit in either first-apex class.

The card-13 common-order CEGAR checkpoint is consistent with this verdict:
every reached candidate was strict-Kalmanson UNSAT, but there is no orbit
coverage certificate and the bank has 1,337 normalized schemas. It is not a
Lean proof and does not expose one compact existing consumer.

## Precise first missing source input

For an asymmetric outcome, the smallest terminal producer remains the
positive occurrence

```lean
dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂
```

or, in row form,

```lean
(N.outside₁ ∈ P.retainedRow.support ∧
  N.outside₂ ∈ P.retainedRow.support) ∨
(N.outside₁ ∈ R.common.packet.B₁ ∧
  N.outside₂ ∈ R.common.packet.B₁).
```

The mode-specific reductions show exactly what a proof must rule out:

- same radius: one outside point escaping the strict first cap;
- distinct radii: the two outside points crossing the retained/double class
  partition.

For `allRowsOneHit`, the first missing input is still a positive occurrence
producing a `CriticalFiberClosingCore R` or a genuine alternative short-cap
packet. Neither first-apex mode alone supplies such an occurrence.

No planar/MEC countermodel to the full source surface was found or claimed.
The next mathematical step must therefore use actual rank-two/MEC geometry,
`noM44`, or global total-critical-map coupling to exclude the two exact
residuals above. More local cardinality or anonymous row packing cannot do
so.

## Validation

The predecessor normal form and the new coupling file were elaborated
separately from `lean/` with warning-as-error and an 8192 MB memory cap. All
six new theorem axiom closures contain exactly:

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, custom axiom, `unsafe`, or
`native_decide` declaration.

The sibling scratch import is not on the project's normal Lean search path.
The reproducible two-stage command, run from the repository's `lean/`
directory, is:

```bash
mkdir -p /tmp/exact5-card13-parent-row-olean

lake env lean -M 8192 -DwarningAsError=true \
  -R ../scratch/atail-force/exact5-first-apex-card13-normal-form \
  -o /tmp/exact5-card13-parent-row-olean/ExactFiveFirstApexCard13NormalForm.olean \
  -i /tmp/exact5-card13-parent-row-olean/ExactFiveFirstApexCard13NormalForm.ilean \
  ../scratch/atail-force/exact5-first-apex-card13-normal-form/ExactFiveFirstApexCard13NormalForm.lean

LEAN_PATH=/tmp/exact5-card13-parent-row-olean lake env lean \
  -M 8192 -DwarningAsError=true \
  -R ../scratch/atail-force/exact5-first-apex-card13-parent-row-coupling \
  -o /tmp/exact5-card13-parent-row-olean/ExactFiveFirstApexCard13ParentRowCoupling.olean \
  -i /tmp/exact5-card13-parent-row-olean/ExactFiveFirstApexCard13ParentRowCoupling.ilean \
  ../scratch/atail-force/exact5-first-apex-card13-parent-row-coupling/ExactFiveFirstApexCard13ParentRowCoupling.lean
```
