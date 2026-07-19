/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FirstApexShellRolePacket
import CandidateAdapter

/-!
# Candidate interface for the period-three first-apex / reverse-row closer

This file records proposition and packet boundaries only.  It contains no
unproved theorem body.  In particular, the final `False` proposition is an
`abbrev`, not a claimed proof.

The public closer deliberately does not accept a separate shared-boundary
hypothesis.  A whole-carrier convex boundary is produced from `D.convex`, and
the reverse-row shared cap order is intended to be produced from the live
cycle and all-reverse membership.  Treating either as an independent parent
hypothesis would move the missing proof instead of closing it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPeriodThreeSharedOrderPacketScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexShellRoleAuditScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailExactFiveReverseMembershipClosureScratch
open ATailExactFiveReverseOutsidePairProducerScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Source-faithful shared strict-cap order for an arbitrary reverse-positive
cycle.  The packet is period-parametric because the metric disjointness lemma
is local at one source and is not special to period three.

No field asserts that a blocker differs from every cycle source.  Current
source only makes the blockers pairwise distinct and makes each blocker
different from its two incident sources. -/
structure ReverseCycleSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Type where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  sourceIndex : Fin K.period → Fin block.m
  blockerIndex : Fin K.period → Fin block.m
  source_point : ∀ i,
    block.L.points (sourceIndex i) = (K.source i).1
  blocker_point : ∀ i,
    block.L.points (blockerIndex i) = reverseRowCenter K i
  straddle : ∀ i,
    (sourceIndex i < blockerIndex i ∧
        blockerIndex i < sourceIndex (K.successorIndex i)) ∨
      (sourceIndex (K.successorIndex i) < blockerIndex i ∧
        blockerIndex i < sourceIndex i)

/-- A source is a strict local extremum relative to its predecessor and
successor in the shared cap order. -/
def IsSourceLocalExtremum
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (Q : ReverseCycleSharedCapOrder K)
    (previous current : Fin K.period) : Prop :=
  K.successorIndex previous = current ∧
    ((Q.sourceIndex current < Q.sourceIndex previous ∧
        Q.sourceIndex current < Q.sourceIndex (K.successorIndex current)) ∨
      (Q.sourceIndex previous < Q.sourceIndex current ∧
        Q.sourceIndex (K.successorIndex current) < Q.sourceIndex current))

/-- The reusable local metric theorem requested by the source audit.

This is a proposition boundary, not a proof.  Its intended proof is the
pointwise same-side Kalmanson argument: at a local extremum, the two incident
blockers lie on the same side of their common cap source, so their exact
outside residuals cannot share a point. -/
abbrev ReverseOutsidePairsDisjointAtLocalExtremumStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (_hreverse :
      ATailThreeRowSharedBoundaryProducerScratch.AllReverseMembership K) : Prop :=
  ∀ (Q : ReverseCycleSharedCapOrder K) (previous current : Fin K.period),
    IsSourceLocalExtremum Q previous current →
      Disjoint (reverseOutsidePair K previous) (reverseOutsidePair K current)

/-- Period-three-only global pruning conclusion after applying the uniform
local-extremum theorem at the minimum and maximum source positions.

The conclusion is intentionally weaker than `False`: one outside pair is
disjoint from the other two.  Pair cardinality and injectivity remain derived
theorems of `K + allReverse` and are not duplicated as fields. -/
def HasPeriodThreeIsolatedReverseOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Prop :=
  ∃ isolated left right : Fin K.period,
    isolated ≠ left ∧ isolated ≠ right ∧ left ≠ right ∧
      Disjoint (reverseOutsidePair K isolated) (reverseOutsidePair K left) ∧
      Disjoint (reverseOutsidePair K isolated) (reverseOutsidePair K right)

/-- Exact immediate parent consumer.  This is the only public theorem shape
which would close the period-three branch: it receives the retained T0/T1
selected rows and the actual CSS-indexed cycle, and concludes `False` without
adding a new order or certificate hypothesis.

A coverage-grade finite Kalmanson decision may generate the proof body, but
its cell enumeration and Farkas certificates belong inside the proof rather
than in this public interface. -/
abbrev FalseOfPeriodThreeAllReverseFirstApexRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0) : Prop :=
  ∀ (_P : FirstApexShellRolePacket F0 R)
      (profile : LargeCapUniqueFiveSecondApexRadius D S)
      (K : PhysicalActualCriticalOmissionCycle H profile),
    K.period = 3 →
      ATailThreeRowSharedBoundaryProducerScratch.AllReverseMembership K →
        False

end

end ATailPeriodThreeSharedOrderPacketScratch
end Problem97
