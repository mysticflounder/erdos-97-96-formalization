/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalMutualDistinctBlockerTerminal
import EqualBlockerTerminal

/-!
# Named-center boundary for the full-parent distinct-blocker mutual arm

The distinct-blocker branch retains four pairwise distinct named carrier
centers: the two physical apices and the actual blockers of the continuation
unused source and the mutual partner.  The two source points themselves both
lie in the physical second cap, but only the partner lies in the exact-five
second-apex radius class.

Full MEC/cap order therefore proves that neither physical apex is equidistant
from this source pair.  Consequently the physical-apex common-deletion packet
cannot supply the shared pair needed by the source-faithful same-cap terminal.
Any such terminal must obtain both reciprocal cross incidences in the two
actual-blocker rows.  This file records that exact negative boundary; it does
not add a conditional packet or assert a direct contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFullParentMutualDistinctBlockerDirectFalseScratch

open ATailCriticalPairFrontier
open ATailGlobalMutualDistinctBlockerTerminalScratch
open ATailGlobalMutualEqualBlockerTerminalScratch
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem physicalApices_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- The displayed large-opposite-caps packet is already not `IsM44`; the
parent's quantified `noM44` field can only act through a different MEC support
triangle and cap partition. -/
theorem currentPacket_not_isM44
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    ¬ S.IsM44 := by
  intro hM44
  have hfirst := hM44.1
  have hlarge := L.firstOppCap_card_ge_six
  omega

/-- The unused continuation source and mutual partner are distinct.  The
first is outside the exact-five second-apex radius class and the second is in
it. -/
theorem unusedSource_ne_partner
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    M.continuation.unusedRow.unused.point ≠ Q.chosen.partner.1 := by
  intro h
  apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
  rw [h]
  exact PhysicalVertex.mem_radiusClass Q.chosen.partner

/-- Both source points of the distinct-blocker surface lie in the physical
second cap. -/
theorem sourcePair_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    M.continuation.unusedRow.unused.point ∈
        S.capByIndex S.oppIndex2 ∧
      Q.chosen.partner.1 ∈ S.capByIndex S.oppIndex2 := by
  exact ⟨M.continuation.unusedRow.unused.point_mem_capByIndex,
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp Q.chosen.partner.2).2⟩

/-- Ordered MEC-cap geometry separates the two source distances from the
first physical apex. -/
theorem physicalFirstApex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    dist S.oppApex1 M.continuation.unusedRow.unused.point ≠
      dist S.oppApex1 Q.chosen.partner.1 := by
  rcases sourcePair_mem_physicalCap Q with ⟨hunused, hpartner⟩
  exact dist_firstApex_ne_of_mem_physicalCap hunused hpartner
    (unusedSource_ne_partner Q)

/-- Exact-five membership separates the same source pair at the physical
second apex. -/
theorem physicalSecondApex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    dist S.oppApex2 M.continuation.unusedRow.unused.point ≠
      dist S.oppApex2 Q.chosen.partner.1 := by
  intro hdist
  apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
  apply mem_selectedClass.mpr
  refine ⟨M.continuation.unusedRow.source_mem_A, ?_⟩
  exact hdist.trans
    (mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass Q.chosen.partner)).2

/-- The physical-apex packet cannot contain the unused/partner source pair in
either of its two equidistant rows, independently of which q-deleted K4 class
was selected. -/
theorem sourcePair_not_common_to_apexPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualFourCenterDeletion M}
    (P : FullParentMutualFourCenterPacketPair Q) :
    ¬ (M.continuation.unusedRow.unused.point ∈ P.apexPacket.B₁ ∧
        Q.chosen.partner.1 ∈ P.apexPacket.B₁) ∧
      ¬ (M.continuation.unusedRow.unused.point ∈ P.apexPacket.B₂ ∧
        Q.chosen.partner.1 ∈ P.apexPacket.B₂) := by
  constructor
  · rintro ⟨hunused, hpartner⟩
    apply physicalFirstApex_dist_ne Q
    exact (P.apexPacket.row₁.same_radius
      M.continuation.unusedRow.unused.point hunused).trans
      (P.apexPacket.row₁.same_radius
        Q.chosen.partner.1 hpartner).symm
  · rintro ⟨hunused, hpartner⟩
    apply physicalSecondApex_dist_ne Q
    exact (P.apexPacket.row₂.same_radius
      M.continuation.unusedRow.unused.point hunused).trans
      (P.apexPacket.row₂.same_radius
        Q.chosen.partner.1 hpartner).symm

/-- Complete named-center ledger for the source-pair route.  The four named
centers are pairwise distinct across the apex/blocker partition, and neither
physical apex bisects the source pair.  Thus a same-cap terminal on this pair
must be made from the two actual blockers and must positively supply both
reciprocal row memberships. -/
theorem namedCenter_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    (S.oppApex1 ≠ S.oppApex2) ∧
      (H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A ≠
        H.centerAt Q.chosen.partner.1
          (PhysicalVertex.mem_A Q.chosen.partner)) ∧
      (H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A ≠ S.oppApex1) ∧
      (H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A ≠ S.oppApex2) ∧
      (H.centerAt Q.chosen.partner.1
          (PhysicalVertex.mem_A Q.chosen.partner) ≠ S.oppApex1) ∧
      (H.centerAt Q.chosen.partner.1
          (PhysicalVertex.mem_A Q.chosen.partner) ≠ S.oppApex2) ∧
      (dist S.oppApex1 M.continuation.unusedRow.unused.point ≠
        dist S.oppApex1 Q.chosen.partner.1) ∧
      (dist S.oppApex2 M.continuation.unusedRow.unused.point ≠
        dist S.oppApex2 Q.chosen.partner.1) := by
  exact ⟨physicalApices_ne S, Q.blockers_ne,
    Q.continuationBlocker_ne_firstApex,
    Q.continuationBlocker_ne_secondApex,
    Q.partnerBlocker_ne_firstApex,
    Q.partnerBlocker_ne_secondApex,
    physicalFirstApex_dist_ne Q,
    physicalSecondApex_dist_ne Q⟩

#print axioms unusedSource_ne_partner
#print axioms currentPacket_not_isM44
#print axioms sourcePair_mem_physicalCap
#print axioms physicalFirstApex_dist_ne
#print axioms physicalSecondApex_dist_ne
#print axioms sourcePair_not_common_to_apexPacket
#print axioms namedCenter_boundary

end

end ATailFullParentMutualDistinctBlockerDirectFalseScratch
end Problem97
