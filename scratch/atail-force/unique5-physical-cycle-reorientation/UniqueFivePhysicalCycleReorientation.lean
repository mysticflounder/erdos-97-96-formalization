/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import PacketReorientationAudit
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionTransitionGlobal

/-!
# Reorienting the original exact-five arm into a physical omission cycle

The original unique-five residual is expressed at `oppApex1`, whereas the
production exact-five physical omission machinery is expressed at
`oppApex2`.  The fixed-surplus non-surplus swap exchanges those two physical
roles without changing the carrier.  This file performs that transport and
constructs the production omission cycle with the original critical system.

No contradiction is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFivePhysicalCycleReorientationScratch

open ATailBlockerDistinctRadiusScratch
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

noncomputable section

private def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : CounterexampleData :=
  { A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }

private theorem transported_oppApex1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex1 = S.oppApex1 := by
  subst B
  rfl

private theorem transported_oppApex2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex2 = S.oppApex2 := by
  subst B
  rfl

private theorem transported_oppCap1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap1 = S.oppCap1 := by
  subst B
  rfl

private theorem transported_oppCap2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap2 = S.oppCap2 := by
  subst B
  rfl

private theorem transported_surplusCap
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).surplusCap = S.surplusCap := by
  subst B
  rfl

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      S.partition.v1_mem_C3

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    exact oppApex1_mem_surplusCap S
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

/-- The strongest source-faithful output of the reorientation.  It retains
the entire original residual, all physical role equalities, the production
exact-five profile, and a production actual-critical omission cycle indexed
by the same fixed critical system `H`. -/
structure ReorientedUniqueFivePhysicalCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveInteriorResidual F) : Type where
  base : OriginalUniqueFiveInteriorResidual F
  packet : SurplusCapPacket D.A
  firstApex_eq : packet.oppApex1 = S.oppApex2
  secondApex_eq : packet.oppApex2 = S.oppApex1
  firstCap_eq : packet.oppCap1 = S.oppCap2
  secondCap_eq : packet.oppCap2 = S.oppCap1
  surplusCap_eq : packet.surplusCap = S.surplusCap
  profile : LargeCapUniqueFiveSecondApexRadius D packet
  profile_radius_eq : profile.radius = radius
  cycle : PhysicalActualCriticalOmissionCycle H profile

/-- Swap the two non-surplus roles and enter the production physical omission
cycle directly from the original unique-five residual. -/
theorem nonempty_reorientedUniqueFivePhysicalCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveInteriorResidual F) :
    Nonempty (ReorientedUniqueFivePhysicalCycle R) := by
  let Dleaf := withPacket D S
  obtain ⟨Dsw, hswap⟩ := exists_completeNonSurplusSwap Dleaf
  let Ssw : SurplusCapPacket D.A :=
    hswap.toNonSurplusSwap.carrier_eq ▸ Dsw.packet
  have hfirst : Ssw.oppApex1 = S.oppApex2 := by
    calc
      Ssw.oppApex1 = Dsw.packet.oppApex1 :=
        transported_oppApex1 hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppApex2 := hswap.toNonSurplusSwap.oppApex1_eq
      _ = S.oppApex2 := rfl
  have hsecond : Ssw.oppApex2 = S.oppApex1 := by
    calc
      Ssw.oppApex2 = Dsw.packet.oppApex2 :=
        transported_oppApex2 hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppApex1 := hswap.oppApex2_eq
      _ = S.oppApex1 := rfl
  have hcapFirst : Ssw.oppCap1 = S.oppCap2 := by
    calc
      Ssw.oppCap1 = Dsw.packet.oppCap1 :=
        transported_oppCap1 hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap2 := hswap.toNonSurplusSwap.oppCap1_eq
      _ = S.oppCap2 := rfl
  have hcapSecond : Ssw.oppCap2 = S.oppCap1 := by
    calc
      Ssw.oppCap2 = Dsw.packet.oppCap2 :=
        transported_oppCap2 hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap1 := hswap.toNonSurplusSwap.oppCap2_eq
      _ = S.oppCap1 := rfl
  have hsurplus : Ssw.surplusCap = S.surplusCap := by
    calc
      Ssw.surplusCap = Dsw.packet.surplusCap :=
        transported_surplusCap hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.surplusCap := hswap.toNonSurplusSwap.surplusCap_eq
      _ = S.surplusCap := rfl
  have hradius : 0 < radius := frontierRadius_pos F
  let profile : LargeCapUniqueFiveSecondApexRadius D Ssw :=
    { radius := radius
      radius_pos := hradius
      class_card_eq_five := by
        simpa only [hsecond] using R.class_card_eq_five
      unique_K4_radius := by
        intro otherRadius hotherPos hfour
        exact R.unique_K4_radius otherRadius hotherPos
          (by simpa only [hsecond] using hfour) }
  rcases nonempty_physicalActualCriticalOmissionCycle H profile with ⟨cycle⟩
  exact ⟨{
    base := R
    packet := Ssw
    firstApex_eq := hfirst
    secondApex_eq := hsecond
    firstCap_eq := hcapFirst
    secondCap_eq := hcapSecond
    surplusCap_eq := hsurplus
    profile := profile
    profile_radius_eq := rfl
    cycle := cycle }⟩

/-- The reoriented output reaches the production exhaustive cycle-edge split
without weakening or replacing the retained critical system. -/
theorem ReorientedUniqueFivePhysicalCycle.cycleEdgeSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveInteriorResidual F}
    (W : ReorientedUniqueFivePhysicalCycle R) :
    Nonempty (PhysicalActualCriticalMutualOmissionEdge W.cycle) ∨
      ∀ i : Fin W.cycle.period,
        (W.cycle.source i).1 ∈
          (H.selectedAt
            (W.cycle.source (W.cycle.successorIndex i)).1
            (PhysicalVertex.mem_A
              (W.cycle.source
                (W.cycle.successorIndex i)))).toCriticalFourShell.support :=
  nonempty_mutualOmissionEdge_or_all_reverseMembership W.cycle

/-- Independently of the chosen cycle normalization, the reoriented profile
also reaches the production global mutual-omission/all-reverse split over all
physical vertices. -/
theorem ReorientedUniqueFivePhysicalCycle.globalRelationSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveInteriorResidual F}
    (W : ReorientedUniqueFivePhysicalCycle R) :
    Nonempty (PhysicalActualCriticalMutualOmissionPair H W.profile) ∨
      ∀ q w : PhysicalVertex W.profile,
        w.1 ∉
            (H.selectedAt q.1
              (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
          q.1 ∈
            (H.selectedAt w.1
              (PhysicalVertex.mem_A w)).toCriticalFourShell.support :=
  nonempty_mutualOmissionPair_or_all_omissions_reverseMembership H W.profile

/-- Exact source-level occurrence missing on the global all-reverse arm: one
complete reverse outside pair is co-radial from the *original* second apex,
which is the first apex after reorientation. -/
abbrev OriginalSecondApexCoRadialReversePairOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveInteriorResidual F}
    (W : ReorientedUniqueFivePhysicalCycle R)
    (T : PhysicalActualCriticalOmissionTransition H W.profile) : Prop :=
  ∃ q : PhysicalVertex W.profile, ∃ a b : ℝ²,
    a ≠ b ∧
      a ∈ transitionReverseOutsidePair T q ∧
      b ∈ transitionReverseOutsidePair T q ∧
      dist S.oppApex2 a = dist S.oppApex2 b

/-- The existing ordered-cap consumer closes the global all-reverse arm from
exactly the co-radial occurrence above.  This theorem is a consumer map, not
a producer for the occurrence. -/
theorem ReorientedUniqueFivePhysicalCycle.false_of_globalAllReverse_of_coRadialOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveInteriorResidual F}
    (W : ReorientedUniqueFivePhysicalCycle R)
    (hallReverse : ∀ q w : PhysicalVertex W.profile,
      w.1 ∉
          (H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
        q.1 ∈
          (H.selectedAt w.1
            (PhysicalVertex.mem_A w)).toCriticalFourShell.support)
    (T : PhysicalActualCriticalOmissionTransition H W.profile)
    (hoccurs : OriginalSecondApexCoRadialReversePairOccurrence W T) : False := by
  have hreverse : ∀ q : PhysicalVertex W.profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A
            (T.successor q))).toCriticalFourShell.support := fun q ↦
    hallReverse q (T.successor q)
      (T.successor_not_mem_actualCriticalSupport q)
  rcases hoccurs with ⟨q, a, b, hab, ha, hb, hsecond⟩
  apply false_of_transitionReverseOutsidePair_coRadial_firstApex
    T hreverse q hab ha hb
  simpa only [W.firstApex_eq] using hsecond

#print axioms nonempty_reorientedUniqueFivePhysicalCycle
#print axioms ReorientedUniqueFivePhysicalCycle.cycleEdgeSplit
#print axioms ReorientedUniqueFivePhysicalCycle.globalRelationSplit
#print axioms
  ReorientedUniqueFivePhysicalCycle.false_of_globalAllReverse_of_coRadialOccurrence

end

end ATailUniqueFivePhysicalCycleReorientationScratch
end Problem97
