# Retained-collision alternation-compatible consumer audit

Date: 2026-07-17

Status: **THE NARROWEST EXISTING EQUALITY CONSUMER IS KERNEL-CHECKED AT THE
LIVE `RetainedRadiusCollision` INTERFACE, BUT IT CLASSIFIES RATHER THAN
CLOSES: EVERY ACTUAL ROW THROUGH THE COLLISION PAIR HAS THE EXISTING COMMON
BLOCKER.  AN EXACT EIGHT-POINT CONVEX EUCLIDEAN MODEL REALIZES THE COMPLETE
TWO-FOUR-SHELL/ALTERNATION MARGINAL.  THEREFORE A NEW KALMANSON CLOSER MUST
USE A DIFFERENT PAIR AND AT LEAST ONE ADDITIONAL SOURCE-VALID FIBER.  NO
PRODUCTION `sorry` IS CLOSED.**

## Scope

This lane starts from

```lean
Q : RetainedRadiusCollision (R := R)
```

and the production fact `Q.nonempty_rowHit`.  Write

```text
O = S.oppApex1
A = H.centerAt Q.fiber.source1
C = Q.fiber.source1
K = Q.fiber.source2.
```

The live packet gives `OC = OK`, `AC = AK`, `O != A`, `C != K`, one exact
critical four-shell centered at `A`, a retained first-apex class containing
`C,K`, and mandatory boundary alternation of `C,K` across `O,A`.  A `RowHit`
selects a four-point `O`-row through one source, but creates no cross-center
equality by itself.

Only files in
`scratch/atail-force/retained-collision-alternation-consumer/` were edited.

## Required theorem-bank preflight

Before deriving a new local equality or order result, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` and cyclic-separation sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered two centers sharing an
equidistant pair, retained blocker collisions, shared-pair separation, and
selected-row Kalmanson cycles.  The closest current declarations are:

- `Dumitrescu.perpBisector_apex_bound` and the duplicate-center equality
  core;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`;
- `ATailOrdinalKalmansonCycle.false_of_two_cycle`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter`.

The first two are strictly narrower than the Kalmanson and cap terminals:
once `O` and `A` are known to bisect `C,K`, a genuinely third carrier center
bisecting that same pair is already impossible.  No banked theorem produces
the missing third row or a different-pair ordinal continuation from one
retained collision.

## Kernel-checked live rigidity theorem

`CollisionActualRowRigidity.lean` proves directly on the live selector arm:

```lean
actualRow_center_eq_commonBlocker_of_contains_collisionSources
    (Q : RetainedRadiusCollision (R := R))
    (hsource : source in D.A)
    (hsource1 : Q.fiber.source1 in selectedAt(source).support)
    (hsource2 : Q.fiber.source2 in selectedAt(source).support) :
  H.centerAt source = H.centerAt Q.fiber.source1
```

The proof uses exactly three facts:

1. `O` is a carrier center equidistant from `C,K`;
2. `A` is a distinct carrier center equidistant from `C,K`; and
3. every actual blocker is different from the robust first apex `O`.

If another actual row through `C,K` had center different from `A`, the three
centers `O,A,centerAt(source)` would contradict
`Dumitrescu.perpBisector_apex_bound`.  The immediate terminal

```lean
false_of_distinct_actualRow_contains_collisionSources
```

is also checked.

This is a useful negative classification.  The narrowest equality consumer
cannot be filled by asking minimality for another row through the same pair:
every such row repeats the existing blocker center and hence contributes no
new ordinal comparison.  Any successful Kalmanson completion must use a
different pair.

## Exact Euclidean regression for the remaining local surface

`TwoFourShellAlternationModel.lean` gives the exact rational boundary

```text
O=(-3,0), U=(-1,3), C=(0,4), X=(1,3),
A=(3,0), Y=(1,-3), K=(0,-4), V=(-1,-3).
```

Lean kernel-checks all of the following:

- the displayed boundary is injective and CCW in the project convention;
- the eight-point carrier is convex independent, using explicit supporting
  linear functionals at every vertex;
- the exact carrier shell of squared radius `25` at `O` is `{C,X,Y,K}`;
- the exact carrier shell of squared radius `25` at `A` is `{U,C,K,V}`;
- the two exact shells intersect precisely in `{C,K}`;
- all eight corresponding `dist` values equal `5`; and
- in the displayed order, `C` and `K` alternate across `O,A`.

This is an actual Euclidean convex realization of the complete local
two-four-shell, two-circle-overlap, and alternation marginal.  It is stronger
than a finite incidence shadow for that marginal.  Therefore no valid
Kalmanson/Farkas or cap-order contradiction can use only those local facts.

It is deliberately **not** a `CounterexampleData`: it has no global K4 map,
deletion-criticality, Moser/MEC packet, minimality, or no-M44 claim.  Those
omitted global fields are exactly where a successful collision consumer must
gain new force.

## Consumer match and route correction

The current five-point and generic ordinal Kalmanson terminals remain sound,
but one retained collision does not meet them:

- the two collision rows identify the same pair `C,K` at centers `O,A`;
- `RowHit` adds another point on the `O`-circle but no equality from another
  center;
- a third actual row through `C,K` is forced back to center `A`; and
- the old six-role order is already refuted by mandatory alternation.

The smallest viable Kalmanson output is therefore not another anonymous
collision-pair row.  It is one additional source-valid row equality on a
**different pair**, with boundary roles that create the reverse edge of an
existing `SelectedRowOrdinalComparison` path.  Equivalently, the live
producer must retain a second blocker fiber and map the combined rows to
`ATailOrdinalKalmansonCycle.false_of_two_cycle` (or a longer checked cycle).
The pinned all-row shadow's `O,A,X` two-cycle is evidence for this multi-fiber
shape, not a live coverage theorem.

If no such multi-fiber row is forced, the only honest alternative is a direct
full-parent contradiction using data absent from the exact regression:
full radius filters, MEC/cap inequalities, deletion-critical coupling, or
`R.noM44`.

## Validation

Both owned Lean files elaborate from current production source with no
`sorry`, `admit`, custom axiom, unsafe declaration, or `native_decide`.
Every printed theorem has axiom closure contained in:

```text
propext
Classical.choice
Quot.sound
```

No production source, plan document, `SurplusM44`, or shell-curvature file
was modified.
