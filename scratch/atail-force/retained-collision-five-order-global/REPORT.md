# Retained-collision five-order global audit

Date: 2026-07-17

## Status

**KERNEL-CHECKED ROUTE CORRECTION; NO PRODUCTION `sorry` CLOSED.**

The five ordinally acyclic retained-collision orders are not the right next
mining object.  All five admit exact rational, strictly convex realizations
that preserve the three retained-collision equality rows and satisfy the
strict nonacute inequality at every increasing triple of the proposed
five-point cap chain.  Cap curvature/nonacuteness alone therefore cannot close
any of them.

The productive replacement is a parent-level selector proved in
`StrictInteriorPairSelector.lean`: select two of the guaranteed retained
sources in the strict first opposite-cap interior *before* splitting their
actual critical blockers.  Equal blockers give a cap-localized collision;
distinct blockers directly give the existing directed-omission packet without
requiring injectivity on the whole retained class.  The latter arm then feeds
the complete production `RetainedMatchingLargeCapConsumerOutcome` pipeline.

This bypasses the old global retained collision/matching split, which could
select a collision unrelated to the cap geometry and divert the proof into the
five-order residual.

## Required theorem-bank preflight

Before deriving the selector or the exact models, I checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  `Sibling p97-rvol banks` and the four-point Radon reserve;
- `certificates/p97_rvol_general_n_mining.md` and the exhaustive
  `certificates/p97_rvol_general_n_mining.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and the exhaustive
  `certificates/erdos97_legacy_general_n_mining.json`; and
- `certificates/erdos_general_theorem_p97_mining.md` and the exhaustive
  `certificates/erdos_general_theorem_p97_mining.json`.

The JSON inventories were queried for declaration/statement fields matching
the following candidate families:

```text
Kalmanson|cyclic|critical|deletion|radius|perp.*bisector|minor.*cap|
one.*sided.*distance|Radon|collision|shared.*pair|common.*center
```

The exact indexed-corpus searches were:

```bash
nthdegree docs search --lean \
  "retained radius collision two centers same pair cyclic boundary Kalmanson strict distance"
nthdegree docs search --lean \
  "critical shell common deletion full filter large cap two centers"
nthdegree docs search --lean \
  "source row contains pair distinct centers perpendicular bisector convex polygon boundary order"
nthdegree docs search --lean \
  "obtuse chain two internal centers equal distance pairs share endpoint"
nthdegree docs search --lean \
  "minor cap chain two centers common equidistant point nested pairs"
nthdegree docs search --lean \
  "one sided distance injective equal distance alternating pairs cap"
```

No indexed theorem produces the missing cross incidence needed to refute the
five orders.  The closest reusable endpoints were:

- `actualRow_center_eq_commonBlocker_of_contains_collisionSources`;
- `false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- `false_of_selected_rows_in_five_ccw_order`;
- `false_of_two_cycle`;
- `CGN6b_nonacute_of_minorCapChainModel`;
- `oneSidedDistanceInjective_of_mecCapPacket`; and
- the four-point Radon reserve.

The sibling bank's 96 U5 class-level incidence families, 88 metric kernels,
112 scalar kernels, 18 unimported U1 source-unit consumers, and
`u1TwoLargeCapObstruction` are genuine consumers but still require a row-slot,
incidence, or seven-equality producer.  None matches the parent facts here.
Thus no bank theorem was reproved or silently bypassed.

## Exact five-order regression

`search_cap_chain.py` parameterizes the three equality rows exactly:

```text
OJ = OC = OK
AC = AK
XJ = XK
```

It searches strict convexity in the displayed six-point boundary order and
the nonacute-chain condition for every increasing triple of the five proposed
cap points.  Rational reconstruction found positive exact margins for all five
orders:

1. `O,J,X,C,A,K`;
2. `O,J,C,X,A,K`;
3. `O,C,A,J,X,K`;
4. `O,C,A,K,X,J`; and
5. `O,C,J,A,X,K`.

`FiveOrderCapChainModels.lean` independently kernel-checks, for each rational
model:

- injectivity of the six boundary points;
- `EuclideanGeometry.IsCcwConvexPolygon` for the stated order;
- all four displayed distance equalities; and
- strict negativity of
  `inner ℝ (cap i - cap j) (cap k - cap j)` for every `i < j < k`.

The last item is stronger than the required nonacute `≤ 0` cap-chain
condition.  These are local exact regressions, not full `CounterexampleData`
models: they do not assert MEC endpoint data, global K4, minimality, or the
critical-shell deletion semantics.  They prove only that the equality/order
surface plus full cap nonacuteness remains realizable.

## Kernel-checked strict-cap-first selector

The new parent-facing split is:

```lean
inductive RetainedInteriorPairOutcome (R : FrontierCommonDeletionParentResidual F)
  | collision (data : RetainedInteriorBlockerCollision R)
  | omission (data : RetainedInteriorDirectedOmission R)
```

`nonempty_retainedInteriorPairOutcome` uses the already-proved bound

```lean
2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
  S.capInteriorByIndex S.oppIndex1).card
```

to choose the two strict-cap sources first.  It then splits equality of their
actual blockers.

In the distinct-blocker branch, mutual cross-membership would force the
blockers equal by the existing perpendicular-bisector result.  Therefore one
directed cross-membership is absent, and
`cross_deletion_survives_iff_not_mem_selected_support` supplies the existing
`RetainedInteriorDirectedOmission` packet.  This proof does not assume global
injectivity of the blocker map.

`nonempty_strictInteriorParentOutcome` consumes that omission through the
existing chain:

```text
RetainedInteriorDirectedOmission
  -> nonempty_retainedInteriorCommonDeletion
  -> RetainedMatchingGeometricReduction
  -> nonempty_retainedMatchingLargeCapConsumerOutcome
```

The equal-blocker branch is also substantially normalized.  For a localized
collision `P`, the scratch file proves:

- `P.supports_eq`: the complete exact critical supports agree;
- `P.source₂_mem_source₁_shell`: the second source lies in the first source's
  exact critical shell;
- `P.blocker_mem_capInterior`: their common blocker is in the same strict cap
  interior; and
- `P.shell_inter_cap_eq_sources`: the exact shell meets that cap in exactly
  the two collision sources.

If the first opposite cap has cardinality at least five,
`P.exists_fresh_commonDeletion` chooses a third strict-cap point outside this
exact shell and constructs

```lean
CommonDeletionTwoCenterPacket D H fresh S.oppApex1
  (H.centerAt P.source₁ P.source₁_mem_A)
```

using first-apex full deletion robustness.  Consequently
`P.nonempty_largeCapOutcome` leaves exactly this large-cap split:

```text
first opposite cap large
  -> fresh common-deletion packet
second opposite cap large
  -> localized collision residual
```

This theorem does not claim that the fresh packet is itself `False`; it
provides the source-valid packet expected by the downstream common-deletion
consumers.  The remaining collision-side producer is therefore sharply stated:
consume a strict-first-cap equal-blocker collision when the *second* opposite
cap is the large one, using full parent/critical-map information.

## Production promotion assessment

**Yes: `StrictInteriorPairSelector.lean` is ready for production promotion
without proof changes, apart from namespace and import cleanup.**

Every declaration in the file elaborates from current production facts, with
no new hypothesis oracle, source hole, or generated decision procedure.  The
proofs can be moved unchanged into the production `ATail` namespace.  Import
topology may justify placing the core selector/collision lemmas in a predecessor
module and `nonempty_strictInteriorParentOutcome` in a later consumer module;
that is a file split, not a mathematical or proof-body change.

The promotion should make the strict-cap-first split the parent route and
bypass `RetainedRadiusBlockerOutcome`.  The older API need not be deleted until
reference mining confirms it has no other callers.  The five-order exact models
should remain scratch regressions; they are evidence against reviving the old
local mining target, not production proof ingredients.

No production file or plan document was edited in this lane.

## Validation

Exact rational search and reconstruction:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/retained-collision-five-order-global/search_cap_chain.py
```

Result: exit 0; every order reports `minimum_max_violation=0` and three
strictly positive rational minimum margins (orientation, nonacute-chain, point
separation).

Lean validation:

```bash
cd lean
lake env lean \
  ../scratch/atail-force/retained-collision-five-order-global/FiveOrderCapChainModels.lean
lake env lean \
  ../scratch/atail-force/retained-collision-five-order-global/StrictInteriorPairSelector.lean
```

Both commands exit 0.  Every printed theorem has exactly:

```text
propext, Classical.choice, Quot.sound
```

Source-hole/trust scan:

```bash
rg -n '\bsorry\b|\badmit\b|^\s*axiom\b|native_decide|\bunsafe\b' \
  scratch/atail-force/retained-collision-five-order-global --glob '*.lean'
```

Result: no matches.

## Recommended parent action

1. Promote the strict-cap-first selector and collision normalization.
2. Call it before the global retained blocker collision/matching split.
3. Route distinct blockers through the already-built large-cap consumer.
4. Route localized collision plus first-cap-large through the new fresh
   common-deletion packet.
5. Make localized collision plus second-cap-large the sole collision-side
   research target.  Do not resume five-order cap-only mining unless a new
   full-parent antecedent excludes the exact regressions in this directory.

