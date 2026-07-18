# Exact-five all-reverse occurrence source map

Date: 2026-07-17

Status: **SUPERSEDED AT THE PRODUCER INTERFACE BY
`full-l-all-reverse-occurrence-attack/REPORT.md`. THE LIVE EXACT-FIVE
ALL-REVERSE GAP IS STILL ONE AGGREGATE PARENT-RETURN OCCURRENCE, BUT THE SPLIT
MUST OCCUR ON THE TOTAL TRANSITION BEFORE CYCLE NORMALIZATION.** The smallest
currently identified occurrence says
that one exact two-point reverse residual is co-radial from the first physical
apex while the complete large-opposite-caps bi-apex parent remains in scope.
The existing ordered-cap terminal then gives `False`. This occurrence is
**OPEN** and is known not to follow from the already-audited finite marginals.
No production `sorry` is closed by this report.

Correction: the former `hcycleStart : K.start.1 = continuation.first`
signature below is not source-faithful enough for the named sources.
`K.source` iterates from `K.base = successor^[K.entryTime] K.start`, so positive
`entryTime` may leave both continuation sources in transient tails. Read all
cycle-indexed occurrence statements in this report as historical diagnostics;
the authoritative transition-level signature is in the successor report.

This lane owns only
`scratch/atail-force/all-reverse-occurrence-source-map/REPORT.md`. It did not
edit production Lean, shared plans, proof-blueprint state, protected files,
`ShellCurvature`, `SurplusM44`, or git state. Per the active user-owned build
gate, it ran no Lean, Lake, LSP, or production build command.

## Required theorem-bank and corpus preflight

Before identifying a new occurrence target, this audit checked every registry
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-five omission
cycles, reverse outside pairs, ordered-cap outside-pair uniqueness,
Kalmanson shared pairs, retained frontier pairs, and
`CriticalFiberClosingCore`. The banks contain downstream consumers, including
the unimported sibling `u1TwoLargeCapObstruction`, but no theorem that produces
a reverse-pair return from the full current parent. In particular, the bank
search does not justify re-proving another local five-point or row-slot
contradiction.

## 1. The exact parent that must remain in scope

The relevant current parent objects are source-indexed. Dropping an index is a
real loss of usable hypotheses, not harmless presentation.

### Retained frontier pair

`CriticalPairFrontier` is defined in
`lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:568-576`. Its field

```lean
F.pair : SurvivorPairRelocationPacket D S radius H
```

retains two distinct sources `F.pair.q` and `F.pair.w`, both off the surplus
cap and both in one exact radius class centered at `S.oppApex1`. It also
retains first- and second-apex double-deletion data and both apex splits.
`ATailCriticalPairFrontier.exists_criticalPairFrontier_of_K4`
(`CriticalPairFrontier.lean:1281-1311`) constructs

```lean
exists radius, 0 < radius /\
  4 <= (SelectedClass D.A S.oppApex1 radius).card /\
  Nonempty (CriticalPairFrontier D S radius H).
```

Thus the original pair `F.pair` is the only currently named parent pair known
to be co-radial from the first apex.

### `R`: full common-deletion parent

`FrontierCommonDeletionParentResidual F` is defined in
`lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:251-260`. It
retains:

- `R.minimal : D.Minimal`;
- `R.noM44 : not (exists T, T.IsM44)`;
- `R.carrier_card_gt_nine`;
- the lower bound on the retained first-apex radius class; and
- `R.common`, including the original first-apex double deletion and the
  source-faithful common-deletion two-center packet.

`CriticalPairFrontier.originalUnique_or_commonDeletionParent`
(`OrientedPhysicalApexIngress.lean:427-445`) constructs either the separately
handled original-unique arm or `Nonempty (FrontierCommonDeletionParentResidual
F)` while copying `minimal`, `noM44`, the carrier bound, and the radius-class
bound. This is the correct point at which to obtain `R`; reconstructing a new
frontier later is not equivalent.

### `B`: bi-apex robustness indexed by `R`

`FrontierBiApexRobustResidual R` is defined in
`lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean:171-176`.
It stores second-apex deletion robustness, while
`FrontierBiApexRobustResidual.firstApex_robust`
(`PhysicalSecondApexCommonDeletion.lean:179-186`) recovers first-apex
robustness from `R`.

`frontierCommonDeletionParent_biApexRobust_or_critical`
(`PhysicalSecondApexCommonDeletion.lean:190-200`) constructs either
`Nonempty (FrontierBiApexRobustResidual R)` or a physical-second-apex critical
residual. On the large-opposite-caps branch, the outer classifier already has
the second-apex robustness fact, so `B` can be constructed directly without
re-entering an unrelated radius split.

### `L`: both large-cap bounds indexed by `B`

The source-faithful scratch wrapper is
`FrontierLargeOppositeCapsBiApexRobustResidual B`, defined in
`scratch/atail-force/large-opposite-caps-biapex-surface/`
`LargeOppositeCapsBiApexSurface.lean:38-45`. It adds exactly

```lean
6 <= S.oppCap1.card
6 <= S.oppCap2.card
```

without discarding `B`, `R`, `F`, `minimal`, or `noM44`. Its checked source
proof of `carrier_card_ge_fourteen` is at lines 48-57. The current production
classifier has both cap bounds and second-apex robustness simultaneously in
`OrientedPhysicalApexIngress.classify_physicalApexIngress`
(`OrientedPhysicalApexIngress.lean:602-642`), but the old outcome split does
not yet package `L`. A future production integration should create `L` at
that branch boundary, not recover its fields after slot or radius
enumeration.

For clarity, the complete live indexing is

```text
F.pair : SurvivorPairRelocationPacket D S radius H
R      : FrontierCommonDeletionParentResidual F
B      : FrontierBiApexRobustResidual R
L      : FrontierLargeOppositeCapsBiApexRobustResidual B
```

The intended parent consumer is the architectural, currently open statement

```lean
false_of_largeOppositeCapsBiApexRobust L : False
```

recorded by the owning large-parent scratch reports. It is not currently a
production theorem.

## 2. Existing exact-five all-reverse source chain

The exact-five source and local cycle reductions are already present. The
missing theorem is not another selected-row manipulation.

### Production cycle and exhaustive branch

`PhysicalActualCriticalOmissionCycle H profile` is defined in
`lean/Erdos9796Proof/P97/ATail/`
`LargeCapUniqueFivePhysicalOmissionCycle.lean:160-169`. The cycle uses the
same concrete critical-shell system `H` as its exact-five profile.

For a cycle `K`, production proves:

- `actualBlocker_ne_physicalApex` at lines 312-322;
- forward omission
  `successor_not_mem_actualCriticalSupport` at lines 326-336;
- the exhaustive split
  `nonempty_mutualOmissionEdge_or_all_reverseMembership` at lines 443-469;
  and
- existence of a cycle from the exact-five data via
  `nonempty_physicalActualCriticalOmissionCycle` at lines 539-547.

The branch relevant here is the second arm:

```lean
hreverse : forall i : Fin K.period,
  (K.source i).1 in
    (H.selectedAt (K.source (K.successorIndex i)).1 ...)
      .toCriticalFourShell.support
```

### Checked reverse-row normal form

The checked scratch module
`scratch/atail-force/exact-five-reverse-membership-closure/`
`ReverseMembershipClosure.lean` proves:

- `three_le_period_of_all_reverseMembership` at lines 116-129;
- `successor_actualBlocker_mem_physicalCapInterior` at lines 133-178;
- the exact two-point same-cap intersection
  `successor_actualCriticalSupport_inter_physicalCap_eq_pair` at lines
  182-232; and
- the exact two-point outside residual
  `successor_actualCriticalSupport_outside_physicalCap_card_eq_two` at lines
  236-268.

The checked scratch module
`scratch/atail-force/exact-five-reverse-outside-pair-producer/`
`ReverseOutsidePairProducer.lean` packages that residual as

```lean
reverseOutsidePair K i :=
  successor actual critical support \ S.capByIndex S.oppIndex2
```

at lines 51-60, and proves:

- `reverseOutsidePair_card_eq_two` at lines 82-95;
- `reverseOutsidePair_subset_complement` at lines 99-113;
- `reverseRowCenter_injective` at lines 119-167;
- `false_of_repeated_reverseOutsidePair` at lines 172-198; and
- `reverseOutsidePair_injective` at lines 202-215.

The strongest unconditional counting consequence is only
`period_le_choose_capComplement_two` at lines 219-248. The later
`FrontierCoupledReverseOutsidePairCapacity` at lines 424-447 faithfully records
this limitation; it is a capacity packet, not a contradiction.

The same module also proves the per-row ordered-cap placement
`nonempty_reverseRowCapStraddle` at lines 282-418. Each reverse row center lies
strictly between its two physical-cap support sources. This supplies local
order, but not a common global order of all cycle roles and not a first-apex
return.

## 3. Existing terminal consumers

Three useful consumers already exist. Only the first one needs the weakest
new occurrence.

### Same-cap outside-pair terminal: preferred endpoint

Production theorem
`Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter` is at
`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:281-346`. Its exact input
is:

```lean
r < s
a,b in A
a,b outside one ordered cap
a != b
dist (L.points r) a = dist (L.points r) b
dist (L.points s) a = dist (L.points s) b
```

and its conclusion is `False`.

For one reverse row:

- `reverseOutsidePair_card_eq_two` provides distinct `a,b`;
- `reverseOutsidePair_subset_complement` puts them outside the physical cap;
- support membership gives equality at `reverseRowCenter K i`;
- `successor_actualBlocker_mem_physicalCapInterior` puts that center strictly
  inside the physical cap; and
- `S.oppApex1` is the other cap center needed by the terminal once the missing
  first-apex equality is produced.

Consequently the single missing antecedent is

```text
dist S.oppApex1 a = dist S.oppApex1 b.
```

No second newly invented contradiction theorem is required after that fact.

### Kalmanson shared-late-pair terminal

Production theorem
`ATailCapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
is at
`lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:427-454`. It closes two
selected rows at the first two vertices of an increasing boundary quadruple
when both contain the last two vertices.

It is useful only if an aggregate occurrence supplies a second source-faithful
row through the same two reverse outside targets in the correct cyclic order.
The reverse rows themselves cannot provide this by repetition:
`reverseOutsidePair_injective` proves that distinct cycle indices have
distinct pairs. Thus “prove a repeated reverse pair” is not the right producer
target.

### Retained-frontier pair terminals

Checked scratch theorem
`false_of_supportCentersBisectFrontierPair` is at
`scratch/atail-force/robust-four-center/RobustParentBoundary.lean:212-261`.
It contradicts two selected support centers which both bisect the retained
pair `F.pair.q,F.pair.w`; the first apex is already a third bisector center.
The stronger incidence presentation
`false_of_pairIncidenceCompletion` is at lines 265-288.

This is an immediate endpoint only after an occurrence theorem supplies two
such centers. A single reverse pair equal to the retained frontier pair closes
more economically through `outsidePair_unique_capCenter`, using the reverse
row center and `S.oppApex1`.

The production Lemma-81/five-point sink
`Census554.FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`
(`lean/Erdos9796Proof/P97/Census554/`
`FivePointCircleIsoscelesOrderBridge.lean:28-62`) is also already available.
It still needs an ordered five-role occurrence and the required cross-row
memberships. It supplies no advantage over the direct outside-pair endpoint on
this leaf.

## 4. Smallest honest aggregate producer

The smallest sufficient conclusion is not equality with the retained pair.
It is first-apex co-radiality of some exact reverse outside pair. The theorem
must nevertheless take the whole `L` parent, because exact regressions have
already shown that the conclusion does not follow from cycle marginals,
cap-cardinality bounds, blocker injectivity, or local cap order alone.

The following is the recommended **signature shape**, not an existing theorem
or an elaborated declaration. It is intentionally left unnamed here so that
no proposed name is confused with source truth:

```lean
{D : CounterexampleData}
{S : SurplusCapPacket D.A}
{firstRadius : Real}
{H : CriticalShellSystem D.A}
{F : CriticalPairFrontier D S firstRadius H}
{R : FrontierCommonDeletionParentResidual F}
{B : FrontierBiApexRobustResidual R}
(L : FrontierLargeOppositeCapsBiApexRobustResidual B)
(profile : LargeCapUniqueFiveSecondApexRadius D S)
(continuation :
  LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
(T : PhysicalActualCriticalOmissionTransition H profile)
(hreverse : forall q : PhysicalVertex profile,
  q.1 in
    (H.selectedAt (T.successor q).1 ...)
      .toCriticalFourShell.support) :
exists q : PhysicalVertex profile, exists a b : Real^2,
  transitionReverseOutsidePair T q = {a, b} /\
  dist S.oppApex1 a = dist S.oppApex1 b
```

Why these inputs are honest:

- `L` retains both cap-six bounds through `B`, `R`, and `F`, hence also
  bi-apex robustness, the original frontier, `minimal`, and `noM44`;
- `profile`, `continuation`, and `T` retain the complete source-faithful
  exact-five branch and apply to both named sources;
- `hreverse` is the proposed global arm of the transition-level split;
  and
- the conclusion is exactly the missing antecedent of an existing terminal.

The stronger parent-directed conclusion

```lean
exists q,
  transitionReverseOutsidePair T q = {F.pair.q, F.pair.w}
```

also closes immediately, because `F.pair.q` and `F.pair.w` are already
co-radial from `S.oppApex1`. It should be targeted only if the proof genuinely
uses the retained pair identities. The weaker co-radial occurrence gives the
proof more freedom and is the smallest terminal contract.

The occurrence proof must visibly consume at least one piece of full-parent
structure absent from the checked regressions:

1. `R.frontierRadius_class_card_ge_four` or
   `R.common.firstApexDouble`, coupled to the reverse outside targets;
2. the total shared critical map together with both apex robustness facts;
3. all reverse rows plus global `D.Minimal`/`R.noM44`; or
4. genuinely nonlinear Euclidean/MEC information beyond the linear
   Kalmanson quotient.

The strongest current source evidence points first to the first-apex K4 and
double-deletion fields. They are the narrowest parent data omitted by the
local exact countermodels.

## 5. How this closes the exact-five all-reverse arm

Once the aggregate occurrence is available, the remainder is routine existing
plumbing:

```text
full L + exact-five continuation + K + all-reverse
  -> some reverseOutsidePair K i = {a,b}
     and dist oppApex1 a = dist oppApex1 b
  -> exact pair cardinality and outside-cap membership
  -> reverse-row support equality at its cap-interior blocker
  -> two distinct centers in the same ordered physical cap
     bisect the same outside pair
  -> CapSelectedRowCounting.outsidePair_unique_capCenter
  -> False.
```

This closes one genuine exhaustive exact-five arm of the proposed
`false_of_largeOppositeCapsBiApexRobust L`. The sibling mutual-omission arm and
the parent branches which produce the exact-five surface remain separate
obligations. Therefore this one occurrence is load-bearing but is not by
itself the entire parent theorem.

## 6. Late favorable critical-system route

`CriticalFiberClosingCore` is useful only as an alternative aggregate
endpoint after the critical system is chosen favorably and the whole parent
is rebased. It should not be instantiated from an arbitrary initial `H` and
then treated as a fixed local fiber problem.

Production
`ATailCriticalSystemRebase.rebaseCriticalPairFrontierSystem`
(`lean/Erdos9796Proof/P97/ATail/CriticalSystemRebase.lean:71-85`) changes only
the critical-system index of the frontier while preserving the geometric
pair and splits. The checked source draft in
`scratch/atail-force/large-opposite-caps-biapex-surface/`
`LargeOppositeCapsBiApexSurface.lean` provides:

- `rebaseCommonDeletionSystem` at lines 61-83;
- `rebaseFrontierCommonDeletionResidual` at lines 87-101;
- `rebaseFrontierCommonDeletionParentResidual` at lines 105-117;
- `rebaseFrontierBiApexRobustResidual` at lines 120-129; and
- `rebaseFrontierLargeOppositeCapsBiApexRobustResidual` at lines 133-144.

The correct order is therefore:

```text
inspect the complete geometric L parent
  -> choose a favorable Hfav late
  -> rebase F, R, B, and L together to Hfav
  -> call nonempty_frontierCommonDeletionCriticalFiber on the rebased R
  -> produce one constructor of CriticalFiberClosingCore for that chosen fiber
  -> false_of_criticalFiberClosingCore.
```

`FrontierCommonDeletionCriticalFiber` and its constructor theorem
`nonempty_frontierCommonDeletionCriticalFiber` are at
`lean/Erdos9796Proof/P97/ATail/FirstApexCriticalFiber.lean:61-103`. This is the
`P` used by the critical-fiber route:

```text
P : FrontierCommonDeletionCriticalFiber R
```

It retains a two-source fiber, its common actual blocker, the exact common
support, and both deletion-criticality facts. This `P` is distinct from the
retained survivor pair `F.pair`; both must remain unambiguous in future code.

Production `CriticalFiberClosingCore` is defined at
`lean/Erdos9796Proof/P97/ATail/CriticalFiberClosingCore.lean:317-327`. It
contains the chosen fiber `P` and either:

- `OrderedCrossRowCore P`, whose contradiction is proved at lines 117-198; or
- `SameCapCollisionPairCore P`, whose contradiction is proved at lines
  219-308.

`false_of_criticalFiberClosingCore` at lines 330-339 closes either constructor.
Thus the missing theorem on this alternative route is an aggregate late-choice
producer of one complete closing core from rebased `L`, not existence of a
bare repeated blocker fiber.

## 7. Explicitly nonterminal targets

The following work may be correct or useful plumbing, but it does not close
the live exact-five all-reverse arm without an additional producer. It should
not replace the aggregate occurrence target.

### Bare `B`

A theorem stated only from `B : FrontierBiApexRobustResidual R` drops both
large-opposite-cap bounds carried by `L`. Those bounds are part of the live
surface and may be load-bearing for any global incidence or metric count.
Producing another `B`-indexed adapter is therefore weaker than the requested
parent theorem.

### Fixed-initial-`H` critical fiber

`nonempty_frontierCommonDeletionCriticalFiber R` gives an anonymous repeated
blocker fiber for the current `H`. It does not place that fiber in a
`CriticalFiberClosingCore`. Pointwise critical-map overrides install local
incidences but return to the existing robust/common-deletion loop. If the
critical-fiber route is used, the favorable system must be selected late and
`R/B/L` rebased together.

### Old reconstructed frontier-coupled exact-five residual

`FrontierCoupledExactFivePhysicalCycleParentResidual` is defined at
`lean/Erdos9796Proof/P97/ATail/PhysicalOmissionCycleParentResidual.lean:65-74`.
Its constructor
`nonempty_frontierCoupledExactFivePhysicalCycleParentResidual` at lines
114-131 calls `exists_criticalPairFrontier_of_K4` again and reconstructs a new
frontier. That frontier is not definitionally the `F` retained by `L`, and the
old `RobustLargeRadiusParentSurface` does not retain `minimal`, `noM44`, or both
cap-six bounds. The old packet is a valid reduction surface, but it is not the
correct full-parent occurrence statement.

### Capacity and per-row order packets

`FrontierCoupledReverseOutsidePairCapacity`,
`period_le_choose_capComplement_two`, and
`nonempty_reverseRowCapStraddle` are checked reductions. They do not force a
pair collision, common global order, first-apex co-radiality, or retained-pair
return. Enlarging the linear Kalmanson role quotient is specifically blocked:
a fully disjoint 25-role instance is exact-QF_LRA satisfiable.

### Conditional U5 and frontier-bisector adapters

`ReverseEdgeU5AdjacentTerminal` and
`false_of_allReverse_of_reverseEdgeU5Adjacent` are at
`scratch/atail-force/all-reverse-direct-false/AllReverseDirectFalse.lean:92-134`.
The contradiction is checked once the adjacency packet is supplied, but no
source theorem produces that packet from `L`.

Similarly, `SupportCentersBisectFrontierPair` and
`PairIncidenceCompletion` are already contradictory, but their bisector or
row-incidence fields are precisely missing occurrences. Restating either
packet does not advance closure.

### Robust minimal-deletion trichotomy

`robustSecondApexMinimalDeletion_reduction` in
`scratch/atail-force/robust-second-apex-minimal-deletion/`
`RobustSecondApexMinimalDeletion.lean:192-277` produces collision, multi-core,
or installed-singleton outcomes. Its assembler
`false_of_robustSecondApexMinimalDeletion` at lines 281-297 still requires
three separate direct-`False` consumers. The adapter is load-bearing only if
its fresh-center output is proved to yield the aggregate parent occurrence or
a complete `CriticalFiberClosingCore` while retaining `L`, `minimal`, and
`noM44`.

### Local five-point obstruction

The five-point Lemma-81 consumer and sibling
`u1TwoLargeCapObstruction` are worthwhile imported plumbing, but their live
antecedents still require missing cross-row equalities. Formalizing the
five-point obstruction again or passing another conditional five-role packet
does not produce the all-reverse occurrence.

### Period-three common-order draft

The source-faithful common-cap-order draft under
`scratch/atail-force/period-three-common-order-producer/` may be validated when
the build gate lifts. It is not currently build-validated, and common order
alone is not terminal. Any next period-three input must add nonlinear
Euclidean/MEC geometry, full-fiber provenance, or global minimality rather
than more linear quotient constraints.

## 8. Recommended ownership target

The uncovered ownership gap is exactly the full-parent, exact-five,
all-reverse occurrence described in section 4. A source/search/scratch lane
should now investigate the following question and nothing weaker:

> How do `R.common.firstApexDouble`, the retained first-apex K4 fiber, the
> shared total critical system, bi-apex robustness, `minimal`, and `noM44`
> force one reverse outside pair into a first-apex distance fiber?

A useful discovery must either:

1. prove that co-radial occurrence under the full `L` packet;
2. prove the stronger equality with `F.pair`;
3. produce a complete `CriticalFiberClosingCore` after a favorable late
   critical-system choice and full-parent rebase; or
4. give an exact full-parent countermodel/refutation showing which additional
   nonlinear/global hypothesis is still absent.

Bare fibers, bare `B`, another fixed-order SAT survivor, another conditional
consumer, or another local five-point theorem do not meet this acceptance
criterion.

## Epistemic ledger

- **PRODUCTION-PROVEN:** the current `F/R/B` structures and constructors, the
  physical omission cycle and exhaustive mutual/all-reverse split, and the
  production terminal theorems cited above.
- **CHECKED SCRATCH, SUBJECT TO OWNING REPORTS:** the `L` wrapper and rebase
  draft, reverse-row exact `2 + 2` split, pair injectivity/capacity, cap
  straddle, and the frontier-bisector terminal.
- **EXACTLY REFUTED WITHIN EXISTING RELAXATIONS:** derivation of the first-apex
  return from the audited finite marginals or from local cap/MEC plus a single
  reverse row. These refutations do not model the complete full parent.
- **OPEN:** the displayed aggregate co-radial occurrence, equality with the
  retained frontier pair, a complete late-choice critical-fiber core, and the
  full `false_of_largeOppositeCapsBiApexRobust L` theorem.
- **NOT RUN:** Lean, Lake, LSP, proof-blueprint, production compilation, axiom
  audit, or git.
