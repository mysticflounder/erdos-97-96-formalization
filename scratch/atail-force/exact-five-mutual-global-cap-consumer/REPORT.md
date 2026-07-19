# Exact-five mutual-omission global cap consumer

Date: 2026-07-17

## Result

The crossed-survival family now reaches the strongest current same-cap bank
boundary without losing the full parent context.  The kernel-checked scratch
theorem is:

```lean
theorem sameCapCommonDeletion_or_equalBlockerShellResidual
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) :
    Nonempty (SameCapCommonDeletionResidual R E) ∨
      Nonempty (EqualBlockerShellResidual R E)
```

The proof uses the complete `CriticalShellSystem H`, the origin-tagged
mutual edge, the exact-five physical profile/cycle, and the robust parent.
The first-apex `CriticalPairFrontier` remains retained in `R`; it is not
projected away or silently replaced by a local packet.

The reduction is:

1. `F.oppCap2_card_ge_six`, the five-point surplus cap, the two endpoints of
   `oppCap1`, and the cap-sum identity imply `10 ≤ D.A.card`.
2. `nonempty_mutualOmissionGlobalNormalForm` gives either cross-survival at
   every actual blocker or one exceptional blocker whose complete source
   fiber has cardinality at most two.
3. Removing that fiber leaves at least eight source vertices with one of the
   two mutual-edge deletions surviving at their actual blocker.
4. There are six boxes: two deletion-survival colors times three blocker-cap
   indices.  Hence two distinct sources have the same color and blockers in
   one indexed closed cap.
5. If the blockers are distinct, the existing
   `nonempty_commonDeletionTwoCenterPacket` constructor applies.
6. If the blockers coincide, one exact selected critical shell contains both
   distinct sources and omits the common deleted point.

The intermediate declarations are:

- `ten_le_card_of_robustLargeRadiusParentSurface`;
- `nonempty_mutualCrossSurvivingSourceFamily`;
- `nonempty_sameCapMutualCrossSurvivalPair`; and
- `sameCapCommonDeletion_or_equalBlockerShellResidual`.

This is genuine structural progress, but it does not prove `False` and closes
no production `sorry` by itself.

## Exact remaining consumer boundary

### Distinct-blocker arm

The two actual blockers are distinct points of one closed cap, and deletion
of one named physical source preserves K4 at both.  Thus the arm contains a
source-faithful `CommonDeletionTwoCenterPacket` whose two q-deleted rows have
four points each and overlap in at most two points.

The existing ordered-cap terminal needs two named points outside the common
blocker cap that lie in both rows.  Neither the survival color nor the cap
placement supplies even a two-point lower bound on the row intersection.
The exact missing hypothesis is therefore:

```text
two distinct points z,w outside the common blocker cap
with z,w in both q-deleted row supports.
```

Once that is produced,
`CapSelectedRowCounting.outsidePair_unique_capCenter` (or the production
two-center localization wrapper) closes immediately.

### Equal-blocker arm

The two source-indexed critical rows lock to one exact four-point shell.  The
checked residual records:

```text
source1 != source2,
source1,source2 in the common shell,
deleted notin the common shell,
common blocker in one closed cap.
```

This is not contradictory.  The missing positive input is a placement or
incidence theorem making two shell members outside the blocker's cap shared
targets of a second distinct same-cap center.  Merely knowing that the two
sources are distinct is insufficient because their cap placement is not
controlled by the pigeonhole, which classifies blocker centers rather than
row sources.

## Shell-curvature assessment

The in-flight read-only
`ConvexCyclicOrder/ShellCurvature.lean` was inspected but not edited or
imported.

Its equal-radius endpoints can consume an individual selected critical row
after a future adapter constructs a compatible
`CounterclockwiseAngleChart` and orders the row's four support points around
the row center.  However, the output is a curvature budget for that one row,
not a contradiction.

The mutual global-cap reduction does **not** make the two crossed surviving
rows' outside points canonical middle targets:

- the common deleted point is absent from both rows;
- the row intersection has only an upper bound, not a positive lower bound;
- same-cap placement concerns the two centers, not the four targets; and
- no field orders or interlaces the two rows' target blocks on a common
  lifted boundary chart.

Therefore Lemma 30/37 cannot currently be applied as a multi-row consumer.
A stabilized shell-curvature route would still need both:

1. the polygon-to-`CounterclockwiseAngleChart` adapter already identified by
   that module; and
2. a new positive packing theorem forcing the two same-cap row supports to
   share or interlace named outside targets so that their curvature budgets
   overlap incompatibly.

The second item is mathematically the same missing incidence exposed by the
ordered-cap sink.  Shell curvature does not manufacture it from deletion
survival.

## Theorem-bank preflight

Before theorem development, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered same-cap centers with
a common outside pair, third carrier bisector centers, and source-indexed
critical rows.  The closest hits were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair`;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- the `U5QCriticalTripleClass` incompatibility families; and
- `u1TwoLargeCapObstruction`.

All are consumers of positive shared-pair/cross-row incidence.  None derives
that incidence from the mutual crossed-survival family.  No bank theorem was
found that makes the present residual contradictory.

## Regression gate

`verify_cap_consumer_regression.py` extends the pinned exact rational
finite-metric model with digest

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

by an abstract three-way blocker-cap assignment.  It realizes:

- 23 sources outside the one-element exceptional fiber;
- two distinct sources of the same deletion-survival color;
- distinct blockers in one abstract blocker cap; and
- exact critical rows whose intersection has cardinality one.

The verifier returns `PASS`.  Its status is **EXACT-WITHIN-MODEL**.  It has a
total rational-metric K4 system and total deletion-critical map, but the cap
colors are abstract: it is not Euclidean, convex, MEC, or a
`CounterexampleData` realization.  It blocks every geometry-free attempt to
derive the missing common outside pair from the new normal form.

No faithful full convex/MEC regression with all-center K4 and a total
critical map is claimed.  The existing exact Euclidean cap-local regressions
show that local equal-radius/cap-order data and directed bisector patterns are
insufficient, but they deliberately omit global K4.  Thus the untested and
still load-bearing ingredient is a positive global-K4/convex-order coupling
that forces row-target overlap or interlacing.

## Validation

The two scratch dependencies were elaborated to temporary oleans, and the
owned module was checked with the current Lake environment and project root:

```bash
cd lean
LEAN_PATH=/tmp/p97-mutual-global-cap-oleans \
  lake env lean -R .. \
  ../scratch/atail-force/exact-five-mutual-global-cap-consumer/\
MutualGlobalCapConsumer.lean
```

All four printed declarations close over exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `sorry`, `admit`, `native_decide`, or
`unsafe` declaration in the Lean file.

The regression was replayed with:

```bash
UV_CACHE_DIR=/tmp/p97-mutual-global-cap-uv uv run --frozen python \
  scratch/atail-force/exact-five-mutual-global-cap-consumer/\
verify_cap_consumer_regression.py
```

and returned `status: PASS`.

## Closure status

- Same-cap crossed-survival pair from the full parent: **PROVEN / KERNEL-CHECKED**.
- Distinct/equal blocker bank split: **PROVEN / KERNEL-CHECKED**.
- Shared outside pair or interlaced shell targets: **MISSING**.
- Direct mutual-arm contradiction: **OPEN**.
- Production `sorry` closed by this scratch lane: **none**.
