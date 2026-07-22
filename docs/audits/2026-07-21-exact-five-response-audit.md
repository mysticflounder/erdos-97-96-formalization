# Exact-five response audit

Date: 2026-07-21

## Current live status

The exact-five profile theorem no longer contains a direct `sorry`.  It
reduces to the one live consumer:

```lean
false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
```

Lean's printed proof of
`false_of_frontierBiApexRobustExactFiveSecondCapProfile` directly calls that
declaration, and its live axiom closure contains `sorryAx`.  The current
`proof-blueprint` mine nevertheless drops this edge and incorrectly lists the
exact-five declaration off-spine.  Pending that known miner fix, the session
anchor is set without auto-sinking on the nearest verified parent,
`false_of_frontierBiApexRobustResidual`; it must not be interpreted as
ownership of the separate cap-six leaf.  The other two live frontier sorries
are the original unique-radius arm and the large-opposite-caps robust arm.

## Production results

`ATail/ParentExactFiveSecondCap.lean` is kernel-checked and source-clean.  It
proves:

- the retained second row lies in the unique ambient five-class;
- at least two of its points are strict physical-cap points;
- the retained first row has at most one strict physical-cap point;
- a physical point exists in the second row but outside the first;
- the strict physical set has exactly three points;
- the global all-reverse omission arm is impossible, since its period-three
  shared-cap-order straddles require at least five strict-cap positions;
- the complementary arbitrary mutual-omission pair is therefore
  unconditional; and
- its endpoints satisfy the sharp retained-row dichotomy stored in
  `FrontierBiApexRobustExactFiveMutualParentResidual`;
- two physical hits in an actual critical row localize its blocker to the
  three-point physical set; and
- the two mutual rows cannot both have two physical hits.  Otherwise their
  blockers swap the mutual endpoints, forcing the physical triple to be
  equilateral and hence non-obtuse, contrary to convex/MEC independence.
- every surviving asymmetric two-hit row has a forced geometric normal
  form: its blocker is the other mutual endpoint, its closed physical-cap
  intersection is exactly its source plus the third physical point, and its
  remaining support is an exact two-point outside pair; and
- that outside pair is immediately contradictory if it is co-radial from
  the first physical apex, by the existing ordered-cap center-uniqueness
  theorem;
- if an initially both-one-hit pair is not already the fully symmetric
  case, any two-hit physical row can be reoriented with one endpoint of the
  original pair to produce the same asymmetric normal form; and
- consequently the only residual without a named asymmetric outside pair is
  `AllPhysicalActualCriticalRowsOneHit`: every one of the three physical
  source rows hits the physical set only at its own source.  Distinct
  physical sources then mutually omit one another and have pairwise distinct
  actual blocker centers, and each shell has exactly three support points
  outside the physical three-set; and
- `ATail/ExactFiveGlobalCrossDeletionPair.lean` proves that the global-cover
  graph on the three physical vertices contains two incident edges.  Thus one
  hub pairs with each spoke so that their singleton deletions cover K4 at
  every carrier center.  The hub's actual critical row is forced one-hit, and
  no actual critical support contains both endpoints of either covered edge.
- `ATail/ExactFiveGlobalCoverStarGeometry.lean` proves that, on either
  asymmetric spoke arm, the hub blocker is the strict middle point of the
  three physical vertices in their common cap order.  Equivalently, the
  angle at that blocker is strictly obtuse.  This is nonlinear cap geometry,
  but it does not place either named outside support point in a retained row
  or on a first-apex radius.

The exact-five profile now passes the provenance-preserving
`ExactFiveGlobalCoverStarOutcome` to the live consumer.  On an asymmetric arm,
the two-hit spoke remains paired with the one-hit hub by a carrier-wide cover;
on the symmetric arm, the complete star is retained with all three one-hit
rows.  The arbitrary mutual-parent packet is no longer the live interface.

The production proof never identifies a selected four-row with the complete
five-point ambient class and never reassigns the fixed critical system.

## Remaining surface

The remaining mathematical classification is binary, with global-cover
provenance retained in both cases:

1. an asymmetric pair supplies a named exact two-point outside-cap pair; or
2. all three physical actual-critical rows are one-hit.

The asymmetric arm needs an occurrence theorem placing its named outside
pair on a first-apex radius, or a complete alternative `IsM44` packet.  The
all-three-one-hit arm cannot close through a physical-source blocker
collision: the blocker map is injective on those three sources.  It needs a
genuinely global same-cap shared-pair / `CriticalFiberClosingCore` occurrence,
or a complete alternative `IsM44` packet.

The favorable-pair theorem is not itself terminal.  Its universal conclusion
is negative incidence: every actual critical shell omits at least one endpoint.
An exact 13-point finite-metric parent-role model realizes global K4, a total
deletion-critical map, both robust apex classes, the retained rows, the
two-edge cover star, and the asymmetric two-hit normal form. Exhaustive
enumeration of all 8,190 nonempty proper subsets finds no witness-closed
subset, yet the asymmetric outside pair is not first-apex co-radial and the
only nontrivial blocker fiber has no second class through a fiber pair. This
is not planar Euclidean/MEC data, but it rules out a pure incidence,
connectivity, or cardinal-minimality conversion to either terminal. See
`2026-07-21-exact-five-global-minimality-regression.md`.

The strict-middle theorem also does not make the current shell-curvature
terminal applicable. A five-row audit strengthens this negative result:
global K4 rows at all five cap vertices, all cap-hit bounds, outside-pair
uniqueness, and all twenty per-row quarter-turn inequalities still do not
force four ordered separated arcs. An exact finite interval/support regression
has maximum nonoverlap cardinality three. See
`2026-07-21-exact-five-multirow-curvature-audit.md`. The missing curvature
input is a cross-row nonlinear order-separation theorem, not another per-row
adapter.

The cap-six low-hit/common-deletion normal form does not apply here.  Its
producer requires `6 ≤ S.oppCap2.card`, while this branch has the exact
identity `S.oppCap2.card = 5`; the available six-point bound is on the other
cap.  The retained endpoint-row dichotomy also does not mention the
asymmetric normal form's outside pair.

The actual critical rows at the two asymmetric outside points have also been
exhaustively split. Omission arms yield only a nonterminal common-deletion
packet; mutual cross-membership yields blocker equalities; and a
one-direction membership closes only under an additional physical-cap center
localization. The kernel-checked finite boundary in
`scratch/atail-force/exact-five-outside-pair-rows/` realizes all current
incidence/order consequences while avoiding every terminal pair input.
Therefore the outside-point row split is not a substitute for the missing
nonlinear full-parent occurrence.

The alternative-`IsM44` exit has a complete checked assembly boundary in
`scratch/atail-force/exact-five-nom44-boundary-witness/`: a nonobtuse triple
of carrier points on the MEC boundary with two exact four-point boundary arcs
constructs the full packet consumed by `R.noM44`. The missing theorem is the
occurrence of that boundary triple. The exact-five cap cannot itself split
into two four-point caps, and another one-vertex split requires an exact-seven
cap split `4+4`; the current star provides neither MEC-boundary membership nor
those exact arc counts.

The retained apex rows do not supply the asymmetric return through linear
ordered-distance geometry. The exact rational regression in
`scratch/atail-force/exact-five-retained-rows-lra/` satisfies all strict
triangle and Kalmanson inequalities, the exact-five shell, the retained
first/second-apex rows, their sharp physical endpoint distribution, the
frontier first-apex class, and the strict-obtuse asymmetric row, while the
outside pair remains non-co-radial at the first apex and has no second center
in the physical cap. Thus the next producer must cross the rank-two
Euclidean/MEC or genuinely global critical-system boundary.

The surviving occurrence surface is genuinely global. Existing strict-convex
MEC regressions realize the one-row geometry. In particular,
`2026-07-21-exact-five-asymmetric-local-regression.md` gives a 14-point
strict-convex `(6,5,6)` numerical fixture with the exact-five class, the
strict-middle asymmetric row, and no alternative support triangle. A separate
exact finite interval/support regression realizes five cap-centered rows and
every exported curvature consequence while avoiding the aggregate four-arc
occurrence. Neither is a full counterexample because global all-center K4 and
the full Euclidean/MEC coupling are absent. A closer must visibly use global
K4 coupled to the named
mutual/parent rows, `R.minimal`, or construct a complete alternative `IsM44`
packet for `R.noM44`.

The card-13 all-center solver surface is only a theorem-discovery slice.
Production proves `13 ≤ D.A.card`, so its complementary `14 ≤ D.A.card` arm
remains part of the live exact-five theorem. The card-13 encoder must retain
five parent-role orbits and two independent global-cover witness-row tables;
neither reflection quotienting nor aliasing both star covers to one selected
row is source-valid. Any mined core must therefore be generalized and proved
uniformly before it can close this source declaration.

The source-audited card-13 B0 gate is SAT in all five role orbits.  The audit
added two missing necessary conditions: at each center in the fixed blocker
image both cover rows equal the unique actual row, and both second-apex cover
rows lie in the unique exact-five class.  Three of the five pre-audit B0
witnesses violated one of these conditions, so the old counts are retired.
After regeneration all five B0 orbits remain SAT.  The four corrected
asymmetric runs examined 164 independently decoded candidates; all 164 were
exact-LRA UNSAT, but every Boolean surface remained bounded `UNKNOWN`.  They
record 156 normalized schema entries / 143 distinct ids; none uses the
exact-five shell, only three use the terminal sign, one uses `b1`, ten use a
cover table, and eight use a frontier equality.  The gate's `m[O₂]` is the
second-apex double-deletion row, not retained `B₂`, and the retained parent
`B₁/B₂` rows are absent.  The all-one-hit orbits have no terminal-negation
rung.  This is a checked negative route checkpoint, not convergence, coverage,
or source closure; further local LRA mining is frozen pending a genuinely
parent-facing input.

The existing card-at-least-14 survival-cover consumer is not the missing
complement: its robust output is already inhabited by
`B.secondApex_robust`. Its raw producer does add a third actual blocker and
a common-deletion packet with the physical second apex, but no existing
consumer connects that row to the named outside pair, a repeated critical
fiber, or a complete alternative support triangle. The exact-five unused-row
route is also unavailable because its constructor requires a six-point
second cap. See
`2026-07-21-exact-five-card-ge-14-survival-cover.md`.

## Epistemic status

| Claim | Status |
|---|---|
| Parent-row bridge | **PROVEN IN PRODUCTION LEAN** |
| Exact-five physical set has cardinality three | **PROVEN IN PRODUCTION LEAN** |
| Exact-five all-reverse arm is impossible | **PROVEN IN PRODUCTION LEAN** |
| Exact-five profile reduces to full-parent mutual omission | **PROVEN IN PRODUCTION LEAN** |
| Mutual endpoint retained-row dichotomy | **PROVEN IN PRODUCTION LEAN** |
| Double-two-hit mutual branch contradiction | **PROVEN IN PRODUCTION LEAN** |
| At least one mutual row is one-hit (`M.oneHit`) | **PROVEN IN PRODUCTION LEAN** |
| Asymmetric two-hit outside-pair normal form | **PROVEN IN PRODUCTION LEAN** |
| First-apex co-radial terminal for the asymmetric outside pair | **PROVEN IN PRODUCTION LEAN** |
| Global split: named asymmetric normal form or all three rows one-hit | **PROVEN IN PRODUCTION LEAN** |
| Pairwise omission and blocker-center injectivity on the all-three-one-hit arm | **PROVEN IN PRODUCTION LEAN** |
| Each all-three-one-hit shell has exactly three nonphysical support points | **PROVEN IN PRODUCTION LEAN** |
| Distinct physical pair with carrier-wide singleton-deletion cover | **PROVEN IN PRODUCTION LEAN** |
| Two-edge global-cover star with one-hit hub row | **PROVEN IN PRODUCTION LEAN** |
| No actual critical support contains both favorable endpoints | **PROVEN IN PRODUCTION LEAN** |
| Asymmetric classification preserves an aligned globally covered pair | **PROVEN IN PRODUCTION LEAN** |
| Asymmetric blocker is the strict middle physical-cap point and has a strictly obtuse physical angle | **PROVEN IN PRODUCTION LEAN** |
| Five cap-centered rows plus current cap-hit, outside-pair, and per-row curvature consequences force four separated arcs | **DISPROVEN IN THE EXPORTED FINITE ABSTRACTION** |
| Global K4, total deletion-critical map, cardinal minimality, retained rows, and the global-cover star force an exact-five terminal | **DISPROVEN IN AN EXACT 13-POINT FINITE METRIC MODEL** |
| Asymmetric outside-pair occurrence | **OPEN** |
| All-three-one-hit `CriticalFiberClosingCore` or alternative-`IsM44` occurrence | **OPEN** |
| Live exact-five global-cover theorem | **OPEN** |
