# Full-parent audit of the exact-five all-reverse leaf

Date: 2026-07-17

Status: **NO EXISTING HIGHER-PARENT CONSUMER CLOSES THE LEAF. THE TOTAL
CRITICAL MAP, GLOBAL K4, MINIMALITY, `noM44`, THE RETAINED ORIGINAL
FRONTIER, AND THE PERIOD-4/5 CASES EACH ADD REAL DATA, BUT NONE CURRENTLY
SUPPLIES AN ANTECEDENT OF A CHECKED TERMINAL. THE SHARPEST NONRECURSIVE
TARGET IS A RETURN OF ONE REVERSE OUTSIDE PAIR TO THE RETAINED FIRST-APEX
RADIUS. NO PRODUCTION `sorry` IS CLOSED.**

This audit owns only
`scratch/atail-force/all-reverse-parent-coupling/`. It does not edit or
build production Lean, shared documents, generated blueprint state,
`ShellCurvature`, `surplusM44`, card-five work, or protected 555/654 work.

## Question and exact live surfaces

The local all-reverse surface is the exact-five omission cycle

```lean
K : PhysicalActualCriticalOmissionCycle H profile
hreverse : forall i,
  (K.source i).1 in
    (H.selectedAt (K.source (K.successorIndex i)).1 ...).support
```

inside the parent-indexed
`FrontierCoupledExactFivePhysicalCycleParentResidual H Flarge`.
The full live parent is separately

```lean
F0 : CriticalPairFrontier D S firstRadius H
R  : FrontierCommonDeletionParentResidual F0
B  : FrontierBiApexRobustResidual R
L  : FrontierLargeOppositeCapsBiApexRobustResidual B.
```

This distinction is load-bearing. The `frontier` stored by
`FrontierCoupledExactFivePhysicalCycleParentResidual` is reconstructed by
`exists_criticalPairFrontier_of_K4`; it is not definitionally the original
`F0` retained by `L`. A parent-coupling theorem must take `L` and the
exact-five residual together, indexed by the same `H`; it may not silently
identify the two frontiers.

Source locations:

- `lean/Erdos9796Proof/P97/ATail/PhysicalOmissionCycleParentResidual.lean:65-82`
  defines the exact-five frontier-coupled residual;
- the same file at `:124-141` reconstructs its frontier independently;
- `lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:251-260`
  defines the retained original parent `R`;
- `lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean:171-176`
  adds second-apex robustness; and
- `scratch/atail-force/large-opposite-caps-biapex-surface/`
  `LargeOppositeCapsBiApexSurface.lean:38-46` adds the two cap-six fields.

## Required theorem-bank preflight

The audit checked all registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered all-reverse exact-five cycles, multi-source
minimal deletion, periods four and five, alternative `IsM44` packets,
outside-pair uniqueness, two critical centers for one deletion, total
critical blocker maps, and retained-frontier cross incidence.

The nearest consumers are exactly the already-known ones:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `false_of_two_reverseRows_common_outsidePair`;
- the named U5 incompatibility families;
- `CriticalFiberClosingCore.false_of_criticalFiberClosingCore`; and
- sibling-only `u1TwoLargeCapObstruction` and source-unit consumers.

None of their missing positive row incidences, common pairs, or named cyclic
placements is produced by the full-parent fields below. The archive hits are
bounded local consumers, not classifiers of this residual.

## Source-faithful dependency and consumer table

The implication column records the direction actually proved in source.

| Input | Exact source and implication direction | Immediate consumer match | Status |
| --- | --- | --- | --- |
| Exact-five physical cycle | `LargeCapUniqueFivePhysicalOmissionCycle.lean:40-87,160-205,268-299,382-410`: cycle sources lie in one strict cap and one exact-five physical-apex class; `2 <= period <= 5`; deleting a source preserves K4 at the physical apex. | Supplies a common physical radius and a bounded finite orbit, but no row through an outside pair at a second center. | **PROVEN in current production source. NONTERMINAL.** |
| All-reverse membership | `exact-five-reverse-membership-closure/ReverseMembershipClosure.lean:80-129`: reverse membership implies deletion failure at the successor blocker and excludes period two, hence `3 <= period`. | Produces two distinct q-critical centers per source, but the U5 sinks still need dangerous-triple alignment and named cross incidences. | **CHECKED SCRATCH. NONTERMINAL.** |
| Exact `2 + 2` row split | `ReverseMembershipClosure.lean:131-268`: the successor blocker lies in the strict physical cap; its complete shell meets the cap in the adjacent source pair and has exactly two outside points. | This is the correct input shape for ordered-cap uniqueness only after a second same-cap center is equidistant from the same outside pair. | **CHECKED SCRATCH. NONTERMINAL.** |
| Distinct blockers and outside pairs | `exact-five-reverse-outside-pair-producer/ReverseOutsidePairProducer.lean:115-215`: reverse-row centers are injective; repeated outside pairs imply `False`; therefore the outside-pair map is injective. | `false_of_two_reverseRows_common_outsidePair` is already consumed contrapositively: a repeated pair is contradiction-strength, not a producer still to mine. | **CHECKED SCRATCH. REPEATED-PAIR PRODUCER RETIRED.** |
| Strict cap order | `ReverseOutsidePairProducer.lean:250-418`: each adjacent same-cap source pair straddles its actual blocker. | Supplies one-row placement only. The period-three triangle plus strict-Kalmanson audit leaves 990 exact LRA survivors after additionally fixing one anchored chiral common order. Current source provides only the per-row `ReverseRowCyclicRoles`; it does **not** derive that shared anchored order from `K + hperiod + hreverse`. | **CHECKED PER-ROW SCRATCH; COMMON-ORDER AUDIT IS CONDITIONAL, NOT A LIVE COVERAGE THEOREM.** |
| Total `CriticalShellSystem` | `U1CarrierInjection.lean:1015-1044` gives one exact deletion-critical shell per source. `CriticalPairFrontier.lean:755-766` proves deletion survival iff nonmembership in the selected support. | Converts positive membership into deletion failure and permits source-exact pointwise overrides. It cannot create a second center through a prescribed outside pair. | **PROVEN. POLARITY/PROVENANCE TOOL, NOT A CLOSER.** |
| Global K4 | `CounterexampleData.K4` supplies selected rows at every carrier center. `U1CarrierInjection.lean:1084-1107` locks any row at a chosen blocker center to the exact critical shell. | Hence the reverse rows are already the complete global rows at their centers. More arbitrary row selection does not extend them; a distinct source-indexed center is still missing. | **PROVEN. NO HIDDEN ROW EXTENSION.** |
| Global minimality | `GlobalMinimalDeletion.lean:28-177` sends a proper prescribed deletion to a fresh blocker and then to a shared-radius pair or `MinimalDeletionCore`. The omission-cycle audit proves cumulative deletion has the wrong polarity at the cycle blockers. | Returns the known shared-radius/minimal-core endpoints. No existing theorem consumes either endpoint to `False`; installed singleton/common deletion can return to robustness. | **PROVEN REDUCTION. RECURSIVE/NONTERMINAL FOR THIS LEAF.** |
| First-apex robustness from original parent | `OrientedPhysicalApexIngress.lean:313-400` proves `R.firstApexFullyDeletionRobust` and excludes `S.oppApex1` from the blocker-map image. | Finite-map pigeonhole yields an anonymous equal-blocker fiber, not an identification with a reverse outside pair or the original frontier pair. The critical-fiber sinks still need one cross row plus order/same-cap placement. | **PROVEN. NONTERMINAL.** |
| Second-apex robustness | `PhysicalSecondApexCommonDeletion.lean:171-186` retains robustness at the second apex as well. | Omits a second blocker-map image value and strengthens fiber multiplicity, but does not make either outside target co-radial at a second cap center. | **PROVEN. NONTERMINAL.** |
| `noM44` | `R.noM44` at `OrientedPhysicalApexIngress.lean:255-257` forbids a complete alternative surplus packet with two exact four-caps. | The displayed packet already has both opposite caps at least six. Existing constructors require a genuinely different MEC-boundary triangle; no theorem builds it from reverse rows. | **PROVEN HYPOTHESIS. CURRENT SAME-PACKET USE REFUTED/NON-LOAD-BEARING.** |
| Retained original frontier | `CriticalPairFrontier.lean:288-301` puts `F0.pair.q,w` on one first-apex radius; `OrientedPhysicalApexIngress.lean:239-247` retains their common deletion at both apices. | It gives one explicit pair equidistant from `S.oppApex1`, but no theorem places that pair in any reverse outside residual. | **PROVEN. ONE PRECISE RETURN OCCURRENCE OPEN.** |
| Period four or five | `three_le_period_of_all_reverseMembership` plus production `period_le_five` leaves `3,4,5`. Searches find no period-4/5-specific sink. | More rows strengthen finite order/equality constraints, but neither cardinality gives a repeated outside pair: the map is already injective into all 2-subsets of the cap complement. | **OPEN LOCAL SURFACES; NO EXISTING IMMEDIATE CONSUMER.** |

## Why pointwise critical-map installation still loops

Each outside target belongs to an exact reverse row. By
`cross_deletion_survives_iff_not_mem_selected_support`, deleting that target
is blocked at the row center. Since outside targets are outside the physical
cap while cycle sources are inside it, one may pointwise override the
critical system at an outside target without changing the cycle-source rows.
This can install the outside target into the same blocker fiber as the
successor source.

That construction is source-valid, but it does not finish a
`CriticalFiberClosingCore`:

- the common blocker is in the physical cap;
- the two outside targets are outside that cap; but
- no second distinct center in that cap is known to be equidistant from the
  same outside pair.

Projecting the installed target to a two-center common-deletion packet uses
second-apex robustness and returns the existing robust/common-deletion loop.
Thus critical-map override is plumbing, not the missing consumer.

## The one narrow nonrecursive target

The retained original frontier supplies a named pair already equidistant
from the first physical apex. The reverse rows supply named two-point sets
outside `oppCap2`, with row centers strictly inside `oppCap2`.
Also `S.oppApex1` is an endpoint of `oppCap2`. Therefore the following is the
smallest source-faithful parent coupling which closes the entire all-reverse
leaf through an existing consumer:

```lean
-- Architectural statement; not elaborated in this no-build audit.
theorem exists_reverseOutsidePair_eq_originalFrontierPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : Real} {H : CriticalShellSystem D.A}
    {F0 : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F0}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    {Flarge : RobustLargeRadiusParentSurface D S}
    (E : FrontierCoupledExactFivePhysicalCycleParentResidual H Flarge)
    (hreverse : forall i : Fin E.exactFive.cycle.period,
      (E.exactFive.cycle.source i).1 in
        (H.selectedAt
          (E.exactFive.cycle.source
            (E.exactFive.cycle.successorIndex i)).1 ...).support) :
    exists i : Fin E.exactFive.cycle.period,
      reverseOutsidePair E.exactFive.cycle i =
        {F0.pair.q, F0.pair.w}
```

This target is **OPEN**, not suggested as a routine adapter. It is the first
missing parent-return occurrence. If it is proved, closure is immediate:

1. `reverseOutsidePair_card_eq_two` gives distinct targets and exact support
   membership at the reverse-row blocker;
2. equality with `{F0.pair.q,F0.pair.w}` gives that both frontier sources are
   outside `oppCap2`;
3. `F0.pair.q_mem_marginal` and `w_mem_marginal` give equal distance to
   `S.oppApex1`;
4. the reverse-row blocker and `S.oppApex1` are distinct centers in the same
   ordered cap (`oppCap2`); and
5. `CapSelectedRowCounting.outsidePair_unique_capCenter`
   (`CapSelectedRowCounting.lean:281-346`) gives `False`.

This closes one actual exhaustive branch without producing another
continuation packet and without returning to robustness. A slightly weaker
but less source-directed equivalent target is to show that some reverse
outside pair is merely equidistant from `S.oppApex1`; the original frontier
pair is the only such pair currently named by the parent.

## Epistemic ledger

- **PROVEN / CHECKED:** the source implications and checked scratch
  reductions in the table, subject to their owning reports' recorded axiom
  audits.
- **EXHAUSTIVE WITHIN THE FIXED-ORDER FINITE LINEAR ABSTRACTION:** the
  period-three strict triangle/Kalmanson audit leaves 990 exact-LRA
  survivors after fixing its anchored chiral common order. That order is not
  currently produced by `K + hperiod + hreverse`; only per-row cyclic-role
  charts are source-valid. The result is therefore neither live coverage nor
  a Euclidean or parent-level countermodel.
- **REFUTED AS CURRENT ROUTES:** cumulative witness-closed deletion,
  repeated reverse outside pairs as a producer, same-triangle `noM44`, and a
  bare pointwise critical-map override.
- **OPEN:** the displayed original-frontier return occurrence, every
  period-4/5 direct contradiction, and the full parent theorem.
- **NOT RUN:** Lean/Lake build, proof-blueprint, axiom audit, production
  compilation, or git operations.
