# Bi-apex parent-surface audit

Date: 2026-07-17

Status: **SOURCE-VERIFIED ROUTE CORRECTION.  THE CURRENT
`FrontierBiApexRobustResidual R` IS A VALID GENERIC COMMON-DELETION ENDPOINT,
BUT IT IS TOO WEAK FOR THE LIVE LARGE-CAP ROBUST BRANCH: IT DROPS THE ALREADY
AVAILABLE FIELDS `6 <= S.oppCap1.card` AND `6 <= S.oppCap2.card`.  THE PRIMARY
PRODUCER SHOULD BE INDEXED BY A CAP-STRENGTHENED BI-APEX RESIDUAL.  NO LEAN OR
LAKE BUILD WAS RUN, AND NO SOURCE `sorry` WAS CLOSED.**

## Question audited

The proposed primary theorem was

```lean
theorem nonempty_criticalFiberClosingCore_of_biApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R) :
    Nonempty (CriticalFiberClosingCore R)
```

This audit asked whether that is the honest live source surface, or whether the
construction drops load-bearing parent data.

## Verdict

The fixed indices of `R` and `B` retain more data than their explicit fields
suggest:

- `D` retains global K4 and convexity;
- `S` retains the complete MEC-derived Moser triangle and cap partition;
- `H` retains the complete source-indexed critical-shell system;
- `F` retains the chosen radius, off-surplus survivor pair, and both apex
  deletion facts;
- `R` explicitly retains minimality, global no-`IsM44`, `9 < D.A.card`, the
  first-apex class lower bound, and the common-deletion packet; and
- `B` adds full deletion robustness at the second physical apex.

Those facts are visible in
`lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:239-260` and
`lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean:169-186`.
The complete critical map is therefore not lost, and its selected row at every
carrier source remains reconstructible from `H`.

However, the current direct frontier split is performed too early.  The generic
theorem
`CriticalPairFrontier.originalUnique_or_commonDeletionParent` constructs `R`
from `F`, minimality, no-`IsM44`, `9 < card`, and the first-apex radius lower
bound only
(`OrientedPhysicalApexIngress.lean:402-445`).  The later generic physical
split accepts every such `R` and records only second-apex robustness
(`PhysicalSecondApexCommonDeletion.lean:188-200`).  Consequently the current
type really does admit cap-four and cap-five cases that the live parent already
knows how to route elsewhere.

By contrast, the production physical ingress performs the decisive cap split
first:

```text
oppCap1 card < 6
  -> OriginalFirstApexSmallCapResidual
oppCap1 card >= 6 and oppCap2 card < 6
  -> PhysicalSecondCapSmallResidual
both opposite caps card >= 6 and second apex not robust
  -> PhysicalSecondApexCriticalResidual
both opposite caps card >= 6 and second apex robust
  -> live robust large-cap branch
```

This is literal source behavior at
`OrientedPhysicalApexIngress.lean:600-642`.  On the last branch, the source has
both

```lean
6 ≤ S.oppCap1.card
6 ≤ S.oppCap2.card
```

before doing any second-apex radius classification
(`OrientedPhysicalApexIngress.lean:607-619`).  The current B-indexed strategy
accidentally bypasses this split and therefore forgets both inequalities.

This is not cosmetic.  Production already proves that the two inequalities
imply `14 <= D.A.card`
(`OrientedPhysicalApexIngress.lean:117-130`).  They also rule out the fixed
proxy surfaces whose physical opposite cap has cardinality four.  A producer
mined from bare `B` is therefore being asked to cover configurations that are
not in the intended live robust branch.

## Exact live construction order

The source-valid direct-parent bypass should use the following order.

1. In `u1_largeCap_routeB_tail_false`, form the existing CP-derived
   `leafSurplusPacket` from `MT`, `hCirc`, `CP`, `i`, `hM`, and `hsurplus`.
   These are the actual leaf inputs at
   `U1LargeCapRouteBTail.lean:9461-9475`, and the packet definition is at
   `U1LargeCapRouteBTail.lean:2339-2360`.
2. Choose the concrete `CriticalShellSystem` from `hcritical`.  The current
   wrapper delays this until `U1LargeCapRouteBTail.lean:9550`, but the parent
   bypass may move that choice before the LIVE-row construction.
3. Apply the cap-first classification used by
   `classify_physicalApexIngress`:
   dispatch original-first small, physical-second small, and
   physical-second critical.
4. Only on the branch carrying both cap-six lower bounds and
   `FullyDeletionRobustAt D S.oppApex2`, extract one
   `CriticalPairFrontier` with
   `exists_criticalPairFrontier_of_K4`
   (`CriticalPairFrontier.lean:1278-1311`).
5. Apply `F.originalUnique_or_commonDeletionParent`.  Dispatch the protected
   `OriginalFrontierUniqueRadiusArm`; on its common-deletion arm, retain the
   two cap-six proofs while constructing `R` and `B`.
6. Run the critical-fiber producer only on that strengthened robust endpoint.

The original unique-radius arm is a fifth branch in this combined dispatcher;
it occurs after the three physical ingress exits and before the common-deletion
robust endpoint.

## Smallest mandatory type correction

Do not add the cap bounds to generic `FrontierCommonDeletionParentResidual`:
that type is constructed for arbitrary frontiers and its existing generic
theorems do not justify them.  Keep the generic `FrontierBiApexRobustResidual`
and add a live-branch wrapper:

```lean
/-- The bi-apex robust endpoint after both small opposite-cap exits. -/
structure FrontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R) : Prop where
  firstOppCap_card_ge_six : 6 ≤ S.oppCap1.card
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card
```

Equivalently, the wrapper may contain `biApex :
FrontierBiApexRobustResidual R` and be indexed only by `R`.  Indexing by `B`
avoids duplicating the robustness field and makes it impossible to detach the
cap proofs from the exact robust endpoint.

The corrected primary producer is then

```lean
theorem nonempty_criticalFiberClosingCore_of_largeOppositeCapsBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    Nonempty (CriticalFiberClosingCore R)
```

This reaches the current production terminal without another adapter:
`ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore` consumes the
returned `CriticalFiberClosingCore R` directly
(`CriticalFiberClosingCore.lean:317-339`).

If a new structure is undesirable, the theorem may instead take the two cap
proofs as explicit arguments beside `B`.  That is propositionally the same
surface, but the wrapper is safer because it records the corrected branch
boundary once.

## Corrected combined dispatcher shape

The smallest honest parent outcome is schematically:

```lean
inductive U1LeafCriticalFrontierParentOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop
  | originalFirstSmall
      (R : OriginalFirstApexSmallCapResidual D S H)
  | physicalSecondSmall
      (R : PhysicalSecondCapSmallResidual D S)
  | physicalSecondCritical
      (R : PhysicalSecondApexCriticalResidual D S)
  | originalFrontierUnique
      {radius : ℝ} (F : CriticalPairFrontier D S radius H)
      (hfirst : 6 ≤ S.oppCap1.card)
      (hsecond : 6 ≤ S.oppCap2.card)
      (unique : OriginalFrontierUniqueRadiusArm F)
  | largeOppositeCapsBiApexRobust
      {radius : ℝ} {F : CriticalPairFrontier D S radius H}
      (R : FrontierCommonDeletionParentResidual F)
      (B : FrontierBiApexRobustResidual R)
      (large : FrontierLargeOppositeCapsBiApexRobustResidual B)
```

The two cap proofs on the unique arm may be omitted if the protected unique
consumer cannot use them.  They are nevertheless available at that point.
The robust constructor must retain them.

This dispatcher replaces, rather than stacks on top of, the old robust
second-apex radius split into `LargePhysicalSecondApexRadiusIngress` versus
`PhysicalSecondApexExactTwoFourRadiusResidual`.  Both old arms are fully robust
and both belong in the new strengthened B branch; requiring a five-point
second-apex radius class would incorrectly discard the two-exact-four-radii
case.

## Other upstream hypotheses

No additional LIVE-row or named-source field is required at this boundary.

- `hnoRem` is derivable from `R.minimal` by
  `CounterexampleData.not_isRemovableVertex_of_minimal`
  (`U1TwoShortCapReduction.lean:156-172`).
- The non-exact opposite-pair fact is derivable from `R.noM44` for this exact
  packet: `S.IsM44` is definitionally the assertion that both opposite caps
  have cardinality four
  (`Cap/PartitionFromMEC.lean:438-444`).  In the corrected branch the stronger
  cap-six inequalities make this immediate anyway.
- A second-large-cap witness need not be stored separately after this
  correction: both physical opposite caps are already at least six, and `S`
  retains their exact indexed cap data.
- The depth-five rows and `f2` row are constructed from `H` only later in the
  current wrapper (`U1LargeCapRouteBTail.lean:9551-9560`).  A parent call before
  LIVE construction should not depend on those derived names.

There is a separate quantifier-order optimization: production
`ATail/CriticalSystemRebase.lean:35-124` shows that a chosen geometric frontier
can be rebased to a later favorable critical system.  Thus a fixed-`H`
producer is sufficient but may be operationally stronger than necessary.  It
does not repair the cap-data loss.  The mandatory first correction is the
cap-strengthened B surface; a late-system existential can be layered on it if
arbitrary-map selection remains the blocker.

## Theorem-bank preflight

Before proposing the corrected local surface, this audit checked all registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md:341-398`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean-corpus searches for bi-apex deletion robustness,
critical blocker fibers, common outside pairs, and critical-system rebasing.
The searches recover the current production multiplicity theorem,
same-cap outside-pair uniqueness, the critical-system rebase, and the existing
`CriticalFiberClosingCore` consumer.  They do not recover a theorem deriving a
closing core from the two cap-six bounds plus bi-apex robustness.  The sibling
bank still reports that its many U5 incompatibility consumers lack the live
classification/producer (`general-n-certificate-bank-mining-2026-07-09.md:
394-398`), and the generated U1 source-unit consumers lack their row-placement
producer (`:400-423`).

The legacy registries are fixed-nine or bounded-local candidate inventories,
not an all-cardinality classifier.  Their summaries explicitly make that scope
distinction (`erdos97_legacy_general_n_mining.md:14-34` and
`erdos_general_theorem_p97_mining.md:14-34`).

## Epistemic status and validation

- **SOURCE-VERIFIED:** the cap-first split, both cap-six facts, current `R`/`B`
  fields, frontier construction, and immediate critical-fiber consumer were
  read from the current working tree at the cited lines.
- **PROVEN BY EXISTING SOURCE THEOREMS, NOT REBUILT THIS TURN:** both cap-six
  facts imply `14 <= D.A.card`; minimality implies no removable vertex; the
  frontier can be extracted and the returned closing core is contradictory.
- **CONJECTURED / OPEN:** the corrected
  `nonempty_criticalFiberClosingCore_of_largeOppositeCapsBiApexRobust` producer.
- **NOT RUN:** Lean LSP elaboration, focused Lean compilation, Lake build,
  axiom audit, proof-blueprint refresh, and git operations.  The active
  no-build gate was respected.

