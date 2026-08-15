# P97 CEGAR Case-Split Promotion Audit — 2026-08-06

This audit records the review and implementation handoff for the CEGAR and
theorem-bank material under scratch/, prompted by the concern that the previous
sorry policy was too hostile to case splitting. The review compares scratch
producers with the live P97 proof spine and its open consumers. It does not
treat a finite
counterexample search, a solver certificate, or a wrapper theorem as a
replacement for a source-level universal producer and its consumer adapter.

## Executive result

The case-split policy did leave useful material on the table, but the failure
mode was more precise than “case splitting is bad”: several source-clean
dichotomies were rejected as mere splits even though every branch either
constructs a live residual packet or strictly narrows a cardinality, radius, or
blocker-fiber invariant.

The implementation pass changes the ranking in an important way. The exact-six
files are not current-build evidence: they import a retired, off-spine module
that is absent from the live source tree, and their hypotheses do not match the
open Rigid221 consumer. The first-fiber cardinality infrastructure is already
present in live production source, but has no downstream FreshThird consumer.
The concrete remaining adapter work is therefore:

1. exact-15 four-row coverage plus the source-equals-u/blocker-v exceptional
   split for the Rigid221 lane;
2. a consumer bridge from the existing first-fiber global-row lemmas to the
   FreshThird-specific fiber and residual interfaces;
3. the global mutual-cap and mutual-omission normal-form producers, where the
   branch infrastructure still needs a live-data adapter.

No reviewed artifact directly closes one of the current open False
obligations. The exact-six material remains a provenance-blocked lead, not a
promotion candidate, until it is re-derived against the live interfaces.

The principal remaining theorem-producing gap is the FreshThird residual:

~~~text
FreshThirdNormalizedResidualRemainingCase P Pρ C Q
  → FreshThirdSameCapCrossRowAlignment P Pρ C Q
    ∨ Nonempty (CommonDeletionTwoCenterPacket ...)
    ∨ False
~~~

The review found source-clean consumers for the two terminal shapes, but not a
universal producer for the disjunction. A tempting “two common endpoints force a
third incidence” producer is false in the rational convex-octagon model and
must not be promoted.

## Scope and method

The audit covered four independent read-only passes over the substantive bank
families:

- scratch/atail-force/, including exact-six, mutual-cap, mutual-omission,
  endpoint, and paired-common-deletion reports;
- scratch/retained-omission-e1/, including endpoint, alternation, common-shell,
  other-cap, and solver rounds;
- the Rigid221/pentagon material, including
  scratch/ExactFourRigid221SourceEqUVRowOtherExceptionalExclusion.lean,
  scratch/PentagonOffClassProducerProbe.lean, and the exact-15 probe;
- FreshThird, CrossBlocker, census, distinct-distance, and projected-static
  materials elsewhere under scratch/.

The search was consumer-first. For every promising artifact, the audit asked:

1. Is the statement universal, or only a bounded computation/model result?
2. Is the proof source-clean, or does it inherit sorryAx/an untrusted solver
   assumption?
3. Is there a direct live consumer and a clear adapter from live proof data?
4. Does each branch produce a named residual or decrease an explicit measure?
5. Does promotion preserve the current theorem-bank and blueprint contracts?

The retained-omission material contains roughly 38 rounds/directories, 66,411
artifacts, and 64 substantive reports. Raw SAT payloads and duplicated generated
artifacts were not counted as independent mathematical producers unless a
report supplied the corresponding universal theorem and consumer
interpretation.

## Status vocabulary

- PROVEN-PRODUCER — source-level Lean theorem or checked production theorem
  with a universal statement and a live consumer.
- CLOSED-TO-RESIDUAL — source-clean theorem that creates a named residual,
  contradiction branch, or strict narrowing, but whose final consumer is still
  open.
- ADAPTER CANDIDATE — a strong theorem with an identified live target, but a
  nontrivial bridge from the current production context remains.
- CONJECTURED — useful proposed shape without a universal source producer.
- DIAGNOSTIC-ONLY — finite search, solver result, sampled geometry, or
  structural clue that does not lift to the universal consumer.
- REJECTED — contradicted by a model or mismatched with the target interface.

## Live proof-spine snapshot

The initial audit snapshot reported:

- root: Problem97.erdos97_rhs;
- approved axiom profile: core;
- open nodes: 99/36025.

The live verification snapshot taken during the implementation pass is newer:
proof-blueprint reports 96 open nodes out of 36038 declarations, 288134 lines
of Lean, 13 active anchors, and 28 open obligations. The older 99/36025 figure
is retained above only to preserve the audit's original baseline; it is not the
current closure count. During the final check, the blueprint refresh also
reported that concurrent Lake build artifacts changed before the refresh could
be published. Treat 96/36038 as the last available live snapshot and rerun
`proof-blueprint refs --refresh` after the shared build finishes before using it
as a release baseline.

Representative open consumers include:

- false_of_crossBlockerCoincidence in
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:104;
- false_of_twoCapSources_freshOutsideFirstBlockerFiber in the
  TwoSourceExactCollisionRowsTerminal lane;
- false_of_exactFourMutualOmissionRigid221_minimalCore in
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:543;
- the Rigid221 source-heavy deleted-row, v-row, off-class, and sparse-row
  leaves in Rigid221SourceHeavy.lean;
- false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion... around
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:3156;
- false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers... around
  TriApexEndpointRetainedOmission.lean:3202;
- false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining in
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:529.

The exact theorem names can be refreshed with the live blueprint and source
search; the count above is the audit snapshot, not a closure claim.

## Current implementation reconciliation

This section records what was actually checked or found in the live worktree,
separately from the proposed promotion sequence below.

### Exact-six: provenance-blocked and interface-incompatible

Both high-ranked exact-six files:

- `scratch/atail-force/exact6-minimality-core-consumer/ExactSixMinimalCoreConsumer.lean`;
- `scratch/atail-force/exact6-physical-apex-distribution/ExactSixPhysicalApexDistribution.lean`

import `Erdos9796Proof.P97.ATail.ParentExactFiveExactSix`. That module is not
under `lean/`; the only matching source is the retired component in
`attic/atail-exact-five-parent-assembler-2026-07-26/`, whose README records that
it was off-spine and never wired into the current Lake/blueprint path. A direct
scratch compile therefore cannot establish current-source provenance, and no
attic import was added.

There is a second, independent interface failure. The live
`ExactFourRobustCapGrowth` producer gives `6 ≤ S.oppCap2.card`, not the exact
equality required by the scratch theorem. The open
`false_of_exactFourMutualOmissionRigid221_minimalCore` consumer at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:543`
also has no exact-six premise. In the live outside-class branch, its minimal
core is a singleton whose deleted source is explicitly outside the exact-five
physical class, while the scratch exact-six theorem requires
`V ⊆ physicalVertices profile`. That missing containment is not a harmless
case split; it is a different producer contract.

Implementation consequence: no exact-six source was promoted, no stale module
was imported, and no `sorry` was removed on the basis of these files. A future
promotion must first re-derive an import-clean theorem from the live
`LargeCapUniqueFiveSecondApexRadius`/physical-vertex definitions, prove the
cap-card equality and the needed containment/robustness facts, and then add a
named adapter at the Rigid221 consumer. Until those bridges exist, the exact-six
files are diagnostic leads rather than source-clean implementation units.

### First-fiber: implemented producer fragment, unconsumed adapter

The relevant lemmas are already in live production source:

- `TwoSourceRetainedMinimalCore.lean:1012`,
  `firstFiber_globalRow_inter_firstShell_card_le_two`;
- `:1041`,
  `firstFiber_globalRow_sdiff_firstShell_card_ge_two`;
- `:1066`,
  `exists_two_firstFiber_globalRow_points_outside_firstShell`.

The first lemma is consumed only by the following `sdiff` lemma, and the
two-point existence theorem has no downstream Lean consumer. Source-level
axiom inspection reports only `[propext, Classical.choice, Quot.sound]` for
these declarations. Thus this is genuine production infrastructure, but it is
not yet a promoted FreshThird closure.

The open
`TwoSourceFreshThirdFiber.lean:473` consumer requires both
`C : TwoCapSourceThirdCanonicalRowSurface P Pρ` and
`Nonempty (FreshOutsideFirstBlockerFiber P Pρ)`. The row lemmas instead require
a chosen fiber witness `Q` and an additional
`Kq : SelectedFourClass D.A Q.source.1`, and return only two points outside the
first shell. The implementation bridge is consequently:

1. obtain `Q` from the live `Nonempty` premise and construct `Kq` at
   `Q.source.1`;
2. transport the two outside-shell points into the
   `FreshThirdBlockerFiber`/cross-row interaction structures;
3. construct the `C`-specific deletion-survival and normalized-residual
   premises; and
4. invoke the existing FreshThird terminal consumer.

Neither current row lemma supplies those structures by itself, and neither is
referenced by `TwoSourceFreshThirdFiber.lean` or
`TwoSourceFreshThirdResidual.lean`. The honest implementation status is
`PROVEN-PRODUCER / UNCONSUMED ADAPTER`, not `CLOSED-TO-RESIDUAL`.

### Other implementation already visible in the worktree

The live FreshThird file also contains source-level endpoint, deletion-survival,
cap-source, common-radius, and same-cap alignment adapters (for example
`endpointCentered_dist_eq_of_two_blocked_deletions` at `:56`,
`exists_selectedFourClass_avoiding_of_deletion_survives` at `:81`, and
`FirstFiberCapSourceWitness` at `:592`). These are useful integration points,
but they do not close the open `false_of_twoCapSources_freshOutsideFirstBlockerFiber`
at `:473`; the normalized residual terminal remains open at
`TwoSourceFreshThirdResidual.lean:529`. They are recorded here as existing
worktree infrastructure, not attributed as new edits from this audit.

## Ranked promotion candidates

### 1. Exact-six minimal-core consumer — highest-value adapter

Artifact:
scratch/atail-force/exact6-minimality-core-consumer/ExactSixMinimalCoreConsumer.lean:266

Shape. Under an exact-six opposite cap, physical deletion robustness, a center
in D.A, a nonempty physical vertex set, and a minimal deletion core K, the
theorem produces:

~~~text
(∃ deleted ∈ physicalVertices profile,
   Nonempty (CommonDeletionTwoCenterPacket D H deleted center S.oppApex2))
∧ V.card ≤ 4
∧ 4 * V.card < D.A.card
∧ (V.card = 1 ∨ (2 ≤ V.card ∧ FullyDeletionRobustAt D center))
~~~

This is not an inert case split. It either produces a common-deletion packet or
forces a strict small-core/robustness alternative.

Target: the open minimal-core body in
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:543-584, called from
Rigid221Closure.lean:217.

Status: PROVEN SHAPE / PROVENANCE-BLOCKED. The scratch statement is a useful
case-split shape, but it is not current-build evidence: its imported parent
module is retired/off-spine, its exact-cap hypothesis is not supplied by the
live producer, and its physical-vertex containment does not match the live
outside-class singleton core.

Required re-implementation bridge:

- re-derive the profile against the live
  `LargeCapUniqueFiveSecondApexRadius` and physical-vertex definitions;
- prove `S.oppCap2.card = 6` rather than using the live lower bound
  `6 ≤ S.oppCap2.card`;
- prove that the particular Rigid221 minimal core is contained in the physical
  vertex set, or write a separate theorem for the nonphysical singleton branch;
- supply physical-apex deletion robustness; and
- only then route the common-deletion/cardinality alternatives to live
  residuals.

Implementation disposition: do not import the attic parent or copy the scratch
theorem into `Rigid221Placement.lean`. The correct next implementation is a new,
import-clean producer with a target-specific contract. Until that producer is
available, this candidate remains a documented no-go rather than a promoted
lemma.

Why it was likely missed: the conclusion contains a disjunction and a
cardinality split, but both branches carry strict information needed by the
Rigid221 dispatcher. The previous policy classified this as “only case
splitting” instead of checking its residual measure and direct target.

### 2. Exact-six physical-apex 3-or-4 distribution

Artifact:
scratch/atail-force/exact6-physical-apex-distribution/ExactSixPhysicalApexDistribution.lean:65-77

Shape. From profile : LargeCapUniqueFiveSecondApexRadius D S and
hcap : S.oppCap2.card = 6, it proves:

~~~text
(physicalVertices profile).card = 3 ∨
(physicalVertices profile).card = 4
~~~

The accompanying analysis records the useful branch semantics:

- in the 3-point branch, each adjacent closed cap has exactly one exact-five
  class hit;
- in the 4-point branch, the fifth class is outside the strict cap but remains
  in the adjacent-cap union;
- off-class points cannot lie in the strict cap in the 4-point branch;
- the 3-point branch gives an interior off-class insertion normal form.

Targets:

- lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:7413-7449;
- secondary dispatcher context in Rigid221Closure.lean:713-729.

Status: PROVEN-SHAPE / PROVENANCE-BLOCKED, for the same missing exact-six
profile as the preceding candidate. Its 3-or-4 conclusion may still be useful,
but no production theorem should depend on the retired
`ParentExactFiveExactSix` import.

Required re-implementation bridge: package the production radius data, prove
the exact cap-card equality, identify the source and blocker classes used by
the physical-apex profile, and connect the 3/4 branches to the source-heavy
exact-12 and off-class residuals. The current lower-bound theorem alone is not
enough.

Implementation sequence:

1. Add a production theorem with the profile and cap-card equality as the only
   structural inputs. Keep the physical-vertex definition transparent enough
   for the subsequent card lemmas; do not import the retired attic parent.
2. Prove the two card branches using the exact-six partition; do not replace
   the result with a finite enumeration of placements.
3. In the card-3 branch, expose the “one exact-five hit per adjacent cap”
   facts as named helper lemmas. In the card-4 branch, expose the fifth-class
   outside-strict-cap and adjacent-union facts separately.
4. At Rigid221SourceHeavy.lean:7413, destruct the split and route each branch
   to the corresponding source-heavy residual. Record the branch in the
   theorem name or local case label so later residual audits can see the
   measure.
5. Run the target file and then the Rigid221 coordinator, checking that the
   theorem imports do not create a cycle or bypass the registered bank.

Value: this is a small finite split with semantic consequences for every
subsequent row and blocker argument. It is precisely the sort of split that
should be promoted when the policy permits finite structural branching.

### 3. Exact-15 four-row coverage for Rigid221

Artifact:
lean/Erdos9796Proof/P97/ATail/BlockerVExactFifteenFourRowCoverage.lean:191-225

Shape. Pairwise-separated assignments to four rows of 15 exact labels contain
one of 16 metric motifs. The realized-assignment theorem
false_of_pairwiseSeparated_realizedRows discharges the realized cases. The
finite enumeration is performed by native_decide, but the exported result is a
source-level Lean theorem rather than an external SAT claim.

Targets:

- Rigid221SourceHeavy.lean:4763-4794, especially
  ...vRowBlockerDeleted_deletedRowBlockerOffClass;
- possibly the nearby ...vRowBlockerOffClass leaf around
  Rigid221SourceHeavy.lean:4831-4844.

Status: ADAPTER CANDIDATE. The coverage theorem is source-level; the live
geometric residual-to-four-row adapter is missing.

Required bridge: extract Fin 15 labels from the live residual, construct the
cyclic PositionEmbedding, provide RealizesRows and PairwiseSeparated, and
reconcile the live “at most one physical hit” hypothesis with the row coverage
assumptions.

Implementation sequence:

1. Identify the four live row functions and make a small adapter record for
   their exact labels. The record should carry row membership and the
   pairwise-separation fact, rather than re-proving those facts inside each
   motif branch.
2. Build the cyclic PositionEmbedding from the production row order. Check
   orientation and indexing conventions against the existing row-coverage
   theorem before applying it; an off-by-one cyclic shift would make the
   theorem appear unusable while preserving a false mapping.
3. Prove RealizesRows for the live residual and apply the exact-15 coverage
   theorem. Keep native_decide confined to the finite internal theorem.
4. Map each of the 16 motifs to the existing Kalmanson/metric consumer or to a
   named Rigid221 residual. Do not collapse all mappings into an uninformative
   disjunction.
5. Add negative tests for a missing row label and a non-pairwise-separated
   assignment so the adapter cannot silently accept an under-specified packet.

### 4. ExactFour source-equals-u / blocker-v exceptional split

Artifact:
scratch/ExactFourRigid221SourceEqUVRowOtherExceptionalExclusion.lean:47-145

Shape. The “other” row point is split into the relevant exceptional
possibilities: other = deleted, other = v, other.1 = xv, or the remaining
orientation. The later metric split at :191-215 and :485-515 separates
dist xv deleted < dist xv v from the reverse inequality; equality is excluded
by the Kalmanson/cap interval.

Target: the source-level parent
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther
in Rigid221SourceHeavy.lean:9521-9534, which currently delegates to residual
source-heavy/opposite-row-heavy/sparse-row leaves.

Status: CLOSED-TO-RESIDUAL / ADAPTER CANDIDATE.

Required bridge: construct the live exact-four packet, promote/import the
exceptional split, and discharge the resulting deleted-row, v-row, and
off-class leaves. The split itself is a useful producer even before all leaves
are closed.

Implementation sequence:

1. Match the scratch packet fields to the production source-equals-u and
   blocker-v hypotheses. Refuse the adapter if any scratch field is being
   filled by a local sorry or an unverified existential.
2. Promote the equality-exclusion lemma separately from the orientation split.
   This gives the target a metric fact that can be reused by both orientations.
3. Destruct the four exceptional cases at the existing source-level parent
   and route them to the current Rigid221 leaves. Preserve the names of the
   exceptional point and row in each branch.
4. Use the exact-15 coverage adapter where a four-row residual remains; use
   KalmansonThreeEqualitySchemas for the metric branches.
5. Verify the parent and each child under the core axiom profile before
   claiming any Rigid221 closure.

### 5. First-fiber global-row overlap

Artifact: scratch/lean-checks/FirstFiberGlobalRowOverlap.lean:28-75

Shape. The scratch file derives:

- first-fiber/global-row intersection cardinality at most two;
- at least two global-row points outside the first collision shell;
- existence of two such points by one_lt_card and a cardinality subtraction
  identity.

Target: the current open first-fiber consumer
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:473.

Status: PROVEN-PRODUCER / UNCONSUMED ADAPTER. The corresponding cardinality
lemmas already exist in live `TwoSourceRetainedMinimalCore.lean` and have a
core-only axiom profile. The old scratch file is useful provenance for the
case-split idea, but the live declarations—not the scratch copy—are the
implementation artifact. No downstream FreshThird consumer currently invokes
them.

Implementation sequence:

1. Produce `Kq : SelectedFourClass D.A Q.source.1` from the chosen
   `FreshOutsideFirstBlockerFiber` witness.
2. Make the intersection-at-most-two and outside-shell lemmas feed a named
   transport helper, preserving the exact first-shell set and row witness.
3. Convert the two points into `FreshThirdBlockerFiber`, cross-row hits, and
   cap-source interactions; the cardinality result alone is insufficient.
4. Build the `TwoCapSourceThirdCanonicalRowSurface`/deletion-survival packet
   required at `TwoSourceFreshThirdFiber.lean:473`.
5. Re-run the consumer and inspect its blueprint and axiom profile; a green
   helper build without a direct consumer edge is not promotion.

### 6. Live global mutual-cap consumer

Artifact:
scratch/atail-force/live-global-mutual-cap-consumer/LiveGlobalMutualCapConsumer.lean:347

Shape. Full parent exact-five mutual data plus a robust large-radius surface
yields a deletion E preserving the mutual-omission pair identities and one of:

- a nonempty live same-cap common-deletion residual; or
- a nonempty live equal-blocker-shell residual.

The distinct-blocker branch uses an 8-source pigeonhole over two deletion
colors and three blocker caps.

Targets:

- lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:155-208;
- Rigid221Closure.lean:387-447.

Status: CLOSED-TO-RESIDUAL / ADAPTER CANDIDATE.

Required bridge: package the live production data and translate it into
ExactFourMutualOmissionJointDeletion or B1GlobalTransportContext, then supply
the positive shared outside-pair/row-intersection hypothesis.

Implementation sequence:

1. Add a single production packaging lemma from FullParentExactFiveMutualData
   to the exact joint-deletion interface. Keep all source/blocker identities in
   the package so branch consumers do not reconstruct them independently.
2. Prove the two-color/three-cap pigeonhole in a reusable finite lemma. Its
   output must name the deletion and the surviving pair identity.
3. Apply the scratch normal form at the TwoDeletionCollision entry point.
   Route same-cap residuals to the common-deletion child and equal-shell
   residuals to the existing collision-shell consumer.
4. Add a test where the shared outside-pair intersection is absent; the
   adapter should fail at that hypothesis rather than manufacture a packet.
5. Audit the resulting theorem’s direct consumers and axiom dependencies.

### 7. Mutual-omission criss-cross normal form

Artifact:
scratch/atail-force/exact-five-mutual-omission-closure/MutualOmissionCrissCross.lean:638-650

Shape. For a physical actual critical mutual-omission edge E, the theorem
produces a criss-cross normal form and either:

- every source preserves one of the two deletions; or
- there is an exceptional blocker where both deletions fail, all other source
  blockers preserve one deletion or equal the exceptional center, and the
  actual blocker fiber has cardinality at most two.

Targets: TwoDeletionCollision.lean:155-208 and
Rigid221Closure.lean:387-447.

Status: CLOSED-TO-RESIDUAL. This is a strong classifier and branch organizer,
not a terminal contradiction. It needs adapters from the live mutual-omission
edge and the actual blocker fiber.

Implementation sequence:

1. Define the production-to-scratch edge adapter and prove its nonempty source
   and criticality fields explicitly.
2. Destruct the normal form into the universal-survival and exceptional-fiber
   branches.
3. In the first branch, call the deletion-survival consumer. In the second,
   expose the exceptional blocker as a named parameter and pass the card-at-most
   two fact to the existing small-fiber residual.
4. Keep the two branches separate in the blueprint so an eventual closure can
   identify which metric lemma discharged them.

### 8. Mutual-omission cap-order / cycle-terminal split

Artifact:
scratch/atail-force/mutual-omission-cycle-terminal/MutualOmissionCycleTerminal.lean:251-259

Shape. Either the actual blocker is fresh outside the first closed cap, or the
blocker lies inside that cap and two disjoint outside-pair banks have union
cardinality at least two.

Possible targets:

- endpoint common-deletion child in
  TriApexEndpointRetainedOmission.lean:3156-3171;
- three-distinct-blocker child around :3202-3212.

Status: CLOSED-TO-RESIDUAL. The endpoint adapter and residual-depth measure
still need to be supplied.

Implementation sequence:

1. Match the scratch cap-order predicates to the endpoint production
   predicates; do not identify them by name alone.
2. In the fresh-blocker branch, invoke the existing first-shell/freshness
   adapter.
3. In the inside-cap branch, materialize the two disjoint outside-pair banks
   as separate Finset witnesses and pass their union-cardinality lower bound to
   the common-deletion or three-blocker consumer.
4. Record which branch decreases the endpoint residual depth and which branch
   increases the available outside-pair bank. This is the evidence needed to
   prevent an infinite case-split loop.

## Case splits already in production

The audit confirmed that several case splits are already promoted and should
serve as the policy precedent for the candidates above.

### Endpoint fresh cross-hit versus common deletion

RetainedMatchingEndpointContinuation.lean:209 proves
nonempty_endpointFreshCrossOrCommonDeletion. The cross-hit branch dispatches
to the retained endpoint-cross-hit consumer; the common-deletion branch
dispatches to the open child beginning at
TriApexEndpointRetainedOmission.lean:3156.

This is a PROVEN-PRODUCER and a direct example of a productive case split:
each arm constructs a named object or moves to a named residual.

### Three distinct blockers versus endpoint cycle

RetainedMatchingEndpointContinuation.lean:274 proves
nonempty_threeDistinctEndpointCrossOrCycle, splitting cross-hit from a
three-step cycle with a deletion-survival packet. It is consumed by the open
child around TriApexEndpointRetainedOmission.lean:3202.

This is also a PROVEN-PRODUCER, not closure.

### Large selected frontier class versus a second radius

BiApexRobustCapBounds.lean:104 proves the exact dichotomy

~~~text
6 ≤ SelectedClass ... radius.card
∨ ∃ ρ, 0 < ρ ∧ ρ ≠ radius ∧ 4 ≤ SelectedClass ... ρ.card
~~~

The current consumers/helpers occur at
TriApexEndpointRetainedOmission.lean:3336, :3740, and :3813, with the main
pre-core around :3287.

This is a PROVEN-PRODUCER / CLOSED-TO-RESIDUAL. The remaining work is
declaration-order cleanup, adapter alignment, and an explicit residual-depth
measure. It should not be rejected merely because it branches.

### Paired common-deletion normal form

PairedCommonDeletionNormalForm.lean:175 and the current theorem around
TriApexEndpointRetainedOmission.lean:1491 already provide the paired outcome:
cross-membership, a double-erase support intersection of cardinality three, and
a third common-deletion source. The live children are around :1451 and :1480.

This is ALREADY PROMOTED, not a new candidate. The theorem normalizes the
residual; it does not itself close the two downstream children.

## FreshThird and CrossBlocker findings

The FreshThird lane contains useful source-clean terminal adapters:

- TwoSourceFreshThirdFiber.lean:1697-1706 shows that deletion survival forces
  the source centers to differ;
- :1728-1761 turns freshness, two deletion survivals, and center separation
  into a CommonDeletionTwoCenterPacket;
- :1489-1501 splits mutual cross-membership with distinct blockers into a
  deletion-survival source, deletion-survival source-prime, or blocker equality;
- :525-529 proves FreshThirdSameCapCrossRowAlignment → False;
- TwoSourceClosure.lean:670-681 proves the common-radius plus mutual-
  cross-membership contradiction;
- TwoSourceFreshThirdResidual.lean:529-538 is the remaining normalized
  residual consumer and is still open.

These theorems make the missing producer precise. The current gap is not
“prove a generic False”; it is to derive either same-cap cross-row alignment, a
fresh two-center common-deletion packet, or a contradiction from the
non-hit/equal-center branch.

The following proposed producers remain CONJECTURED:

- a Kalmanson adapter from a ConvexCyclicOrder and three equal-distance
  relations/five ordered boundary indices;
- a global K4 deletion consequence for the qleft branch;
- a FreshThird blocker-fiber decomposition into cross-blocker collision or
  same-cap alignment;
- a third common-shell incidence after a reverse-hit fresh packet;
- a second-cap/radius with two hits.

The proposed cross-blocker decomposition was recorded in
scratch/cross_blocker_bridge_search_20260731.md:128-142; it still lacks global
support, minimal-deletion, cap, no-M44, and tri-apex incidence bridges.

The proposed third-incidence lemma is explicitly REJECTED. The rational
convex-octagon countermodels in
scratch/freshthird-third-incidence-local-countermodel-20260806.md:13-43,70-80
show that two common endpoints/equal row radii do not force the needed source or
fresh incidence.

## Rigid221 and pentagon findings

The Rigid221 bank contains several source-level producers that were obscured by
finite branching:

- the exact-six minimal-core and 3/4 physical-apex splits above;
- exact-15 four-row coverage;
- the exact-four source-equals-u/blocker-v exceptional split;
- SurvivalCover.lean:118-145, which proves that an actual blocker fiber of
  cardinality four projects to the selected support;
- PentagonOffClassProducerProbe.lean:1110-1148, which produces two sources
  outside the xv row with distinct actual blockers avoiding the xv blocker and
  oppApex2;
- the exact-12 disjunction already mirrored in production at
  Rigid221SourceHeavy.lean:5784-5823;
- exact-12 cap profile (5,4,6), five physical cycle traces, and five-blocker
  injectivity in PentagonOffClassProducerProbe.lean:2097-2122, :2210-2255, and
  :2433-2462.

The exact-12 and pentagon probes are useful only after their missing universal
metric contradiction or two-radius partition is supplied. The exact-12 v2
report in scratch/pentagon-offclass-exact12-v2/ strengthens the abstraction
with |K_center ∩ {u,xu,xv}| ≤ 1, but its Python adapter is not kernel checked.
All 42 ordered placements being SAT in the base abstraction shows that the
cross-fan constraints are not forced there; it is a reason to refine the
producer, not a proof of the target.

The 24/24 CaDiCaL/DRAT exact-15 probe similarly supports the adapter search but
does not replace the universal Lean row-coverage theorem. Its authenticated
manifest is in
scratch/rigid221-blockerv-offclass-exact15-probe-20260806/three-pair-static-authenticated-manifest.json:1-14.

## Retained-omission findings

The retained-omission audit confirms the following ranking:

1. promote the endpoint fresh cross-hit/common-deletion split;
2. retain the shared-blocker alternation theorem at
   TriApexEndpointRetainedOmission.lean:2212 as branch infrastructure;
3. promote/use the three-distinct-blocker versus endpoint-cycle classifier;
4. connect the large-class/second-radius split to an explicit residual-depth
   measure;
5. use the paired common-deletion grid only as a boundary normal form.

The shared-blocker theorem gives

~~~text
SurplusCOMPGBank.btw O A C ↔ ¬ SurplusCOMPGBank.btw O A J
~~~

under the endpoint fresh cross-hit boundary data. It explains why the
same-side shared-blocker route stalls: alternating placements survive, so the
theorem is a classifier rather than a contradiction.

The paired common-deletion row normal form is already live. The “fresh third
common-shell” and “other-cap rich double-hit” routes are conjectures without a
universal producer. The finite CEGAR rounds, including V33–V39 and rounds
6/7/10/12/13/14, should remain diagnostic until their source-level incidence
bridges exist.

## Already-promoted or duplicate material

The following should not be re-promoted as new lemmas:

- the paired common-deletion row normal form;
- the selected-four-class outside-overlap bound recorded by the existing spine
  audit;
- the exact-12 disjunction and three-center producer already mirrored in
  Rigid221SourceHeavy.lean:5784-5823;
- the metric/Kalmanson consumers in
  KalmansonThreeEqualitySchemas.lean:32-485;
- the endpoint and three-blocker classifiers listed above;
- the exact-12 card-12-or-two-blockers disjunction already live in the source
  heavy lane.

These are important dependencies for the new adapters, but duplicate scratch
copies add no proof value.

## Non-promotable evidence

The review found many useful probes that should remain explicitly labeled as
diagnostic:

- bounded Z3/CaDiCaL UNSAT results and DRAT traces without a universal Lean
  reduction;
- finite census reports such as the 107 minimal dead patterns in
  scratch/census-554/STATE.md:441-457;
- sampled or rational geometric models;
- solver abstractions that omit Euclidean realizability, minimality,
  deletion-survival, or blocker-fiber coverage;
- generic False consumers whose premise is stronger than the live context;
- local cross-blocker packet probes with no global incidence producer;
- the p97-distinct-distance-lane six-point rule, until an authenticated
  order/metric row producer is supplied;
- projected-static theorem-bank results with no graph-to-order adapter;
- exact-six solver abstractions missing Euclidean, MEC, and minimality fields;
- CapFiveApexRigidity results whose interface does not match oppCap2.card = 6;
- physical-apex criticality results that only return another open successor.

The correct use of these artifacts is to identify a missing hypothesis or a
minimal CEGAR split. They are not promotion candidates merely because a solver
found no bounded model.

## Implementation plan and verification gates

The recommended implementation is additive and consumer-driven.

### Phase 1: Rigid221 exact-six spine

- Do not import the scratch exact-six files or the retired attic parent.
- First derive a live-source exact-six profile, including the equality,
  physical-vertex containment, and deletion-robustness contracts.
- Decide whether the nonphysical singleton branch needs a separate producer;
  do not force it through a theorem whose premise is `V ⊆ physicalVertices`.
- Only after those producers exist, add a named adapter at the
  `Rigid221Placement` consumer and route each branch to a live residual.
- Run a targeted `lake env lean`, the relevant `lake-build` target, and
  `proof-blueprint spine --max-depth 0`; a green build without a spine edge is
  not promotion.

### Phase 2: Rigid221 exact-four/exact-15 adapters

- Promote the source-equals-u/blocker-v split and its strict distance
  orientation lemma.
- Build one reusable four-row adapter carrying Fin 15 labels,
  PositionEmbedding, RealizesRows, and PairwiseSeparated.
- Apply BlockerVExactFifteenFourRowCoverage only through that adapter.
- Map each finite motif to a named metric or source-heavy residual.
- Add negative tests for missing labels, wrong cyclic orientation, and
  non-separated rows.
- Re-run the Rigid221 source-heavy parent and its direct children under the core
  axiom profile.

### Phase 3: First-fiber FreshThird adapter

- Reuse the existing production at-most-two intersection and outside-shell
  lemmas; do not duplicate the scratch proof.
- Add the missing `Q`-to-`Kq` producer and a named transport from the outside
  points to `FreshThirdBlockerFiber`/cross-row interactions.
- Build the `C`-specific deletion-survival and normalized-residual packet
  required at `TwoSourceFreshThirdFiber.lean:473`.
- Run `lake env lean` on the changed consumer after the Erdos9796Proof olean
  cache is restored, then inspect the direct consumer edge and axiom report.

### Phase 4: Mutual-cap and endpoint residual infrastructure

- Package FullParentExactFiveMutualData into the live joint-deletion interface.
- Add the 8-source pigeonhole and criss-cross normal form as named branch
  producers.
- Connect the cap-order split to the endpoint common-deletion and
  three-blocker children.
- Track a residual-depth or outside-pair-bank measure in theorem names and
  comments.
- Do not mark the parent closed until every branch reaches a checked False
  consumer.

### Phase 5: Missing FreshThird producer

- Start from the open normalized residual, not from a generic False theorem.
- Reuse the existing center-separation, deletion-survival, common-deletion,
  same-cap-alignment, and common-radius consumers.
- Try to prove the smallest universal producer that supplies one missing
  premise at a time: q freshness, both deletion survivals, center separation,
  mutual cross-membership, or same-cap row alignment.
- Use the convex-octagon countermodel as a negative test against any proposed
  third-incidence theorem.
- Only promote a new split once its branches are source-clean and each branch
  either reaches a live consumer or decreases a documented residual measure.

### Promotion checklist

Before moving a scratch theorem into the registry:

1. run source-level theorem search for an existing duplicate;
2. verify declaration provenance and direct consumer edges;
3. remove or isolate all sorry-backed helpers;
4. compile the minimal target and then its transitive consumer;
5. inspect the theorem’s axiom dependencies, not just build success;
6. update the canonical theorem-bank registry and any live blueprint entry;
7. record whether the result is a producer, consumer, obstruction, conditional
   deduction, empirical evidence, or complete proof.

## Audit limitations

This report is a provenance and promotion audit, not a closure report. The
current checkout was already dirty before this audit, so the implementation
pass did not rewrite concurrent source changes or import stale attic modules.
The exact-six scratch files were checked and rejected as current promotion units
because their parent import is missing from the live source tree. The first-fiber
scratch file was not treated as the implementation artifact because equivalent
lemmas are already present in production source; their direct consumer gap was
checked by source search and their core-only axiom profile was recorded.

The report's `PROVEN-PRODUCER` labels mean source-level universal producers;
they do not imply closure. Every proposed adapter still requires a targeted
Lean check, direct consumer reachability, and a blueprint/axiom audit. The
concurrent worktree contains additional FreshThird infrastructure, but this
audit does not claim authorship or closure for those unrelated edits.

The governing conclusion is:

> Case splitting is admissible when it is a source-clean producer of a named
> residual or a strict measure decrease. The exact-six/Rigid221 files are high-
> value leads, but their current implementation is blocked by stale provenance
> and a mismatched nonphysical-core contract. The first-fiber overlap lemmas
> have already been implemented as source-clean production infrastructure; the
> missing work is their `Q`/`Kq`/FreshThird transport adapter. The central
> unresolved mathematical work remains a universal FreshThird residual
> producer.
