/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix

/-!
# Source-faithful exact-six mutual complete-row manifest

The exact-six mutual sibling does not force a literal row schema with fixed
anonymous labels.  It does force a small source-faithful carrier: three or
four physical exact-five vertices, the complete actual critical row at each
physical source, and the complete unused-source row.  This file records that
bounded occurrence without weakening exact rows to selected representatives.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixUniformCoreOccurrenceScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The four named physical roles on the mutual sibling.  Equalities among
these roles are intentionally retained rather than resolved by arbitrary
literal labels. -/
def mutualPhysicalRoleSet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Finset ℝ² :=
  {M.continuation.first, M.continuation.second, M.pair.source.1, M.pair.target.1}

/-- The complete actual critical support at a physical exact-five source. -/
def physicalCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) : Finset ℝ² :=
  (H.selectedAt q.1 (PhysicalVertex.mem_A q)).toCriticalFourShell.support

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exact cap six leaves four strict physical-cap positions. -/
theorem physicalCapInterior_card_eq_four_of_secondCap_card_eq_six
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hcap : S.oppCap2.card = 6) :
    (S.capInteriorByIndex S.oppIndex2).card = 4 := by
  have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S, hcap] at hinterior
  omega

private theorem mutualPair_source_ne_target
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : PhysicalActualCriticalMutualOmissionPair H profile) :
    P.source ≠ P.target := by
  intro h
  apply P.target_not_mem_sourceSupport
  simpa [h] using
    (H.selectedAt P.source.1
      (PhysicalVertex.mem_A P.source)).toCriticalFourShell.q_mem_support

/-- The complete source-faithful row surface forced by exact cap six and the
full-parent mutual sibling.  In particular, every support below is the whole
ambient radius class, not a chosen four-point subset. -/
structure ExactSixMutualCompleteRowManifest
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Prop where
  physicalCard :
    (physicalVertices profile).card = 3 ∨
      (physicalVertices profile).card = 4
  physicalCapInteriorCard :
    (S.capInteriorByIndex S.oppIndex2).card = 4
  roleSet_subset_physical :
    mutualPhysicalRoleSet M ⊆ physicalVertices profile
  roleSet_card_le_four :
    (mutualPhysicalRoleSet M).card ≤ 4
  unused_not_mem_physical :
    M.continuation.unusedRow.unused.point ∉ physicalVertices profile
  continuationSources_ne :
    M.continuation.first ≠ M.continuation.second
  mutualSources_ne : M.pair.source ≠ M.pair.target
  unusedSupport_complete :
    (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support =
      SelectedClass D.A
        (H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A)
        (H.selectedAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A).toCriticalFourShell.radius
  unusedSupport_card_eq_four :
    (H.selectedAt M.continuation.unusedRow.unused.point
      M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support.card = 4
  unusedSupport_physical_card_le_one :
    ((physicalVertices profile) ∩
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support).card ≤ 1
  continuationFirst_not_mem_unusedSupport :
    M.continuation.first ∉
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  continuationSecond_not_mem_unusedSupport :
    M.continuation.second ∉
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  physicalSupport_complete : ∀ q : PhysicalVertex profile,
    physicalCriticalSupport H q =
      SelectedClass D.A
        (H.centerAt q.1 (PhysicalVertex.mem_A q))
        (H.selectedAt q.1
          (PhysicalVertex.mem_A q)).toCriticalFourShell.radius
  physicalSupport_card_eq_four : ∀ q : PhysicalVertex profile,
    (physicalCriticalSupport H q).card = 4
  physicalSource_mem_support : ∀ q : PhysicalVertex profile,
    q.1 ∈ physicalCriticalSupport H q
  physicalSupport_physical_card_le_two : ∀ q : PhysicalVertex profile,
    ((physicalVertices profile) ∩ physicalCriticalSupport H q).card ≤ 2
  target_not_mem_sourceSupport :
    M.pair.target.1 ∉ physicalCriticalSupport H M.pair.source
  source_not_mem_targetSupport :
    M.pair.source.1 ∉ physicalCriticalSupport H M.pair.target
  mutualBlockers_ne :
    H.centerAt M.pair.source.1 (PhysicalVertex.mem_A M.pair.source) ≠
      H.centerAt M.pair.target.1 (PhysicalVertex.mem_A M.pair.target)
  mutualSupport_inter_card_le_two :
    ((physicalCriticalSupport H M.pair.source) ∩
      physicalCriticalSupport H M.pair.target).card ≤ 2

/-- The seven equality orbits of the ordered continuation pair and ordered
mutual pair.  The last orbit is the only four-role case; exact cap six then
identifies those four roles with the whole physical vertex set. -/
inductive ExactSixMutualRoleOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Prop where
  | continuationOrder
      (source_eq : M.pair.source.1 = M.continuation.first)
      (target_eq : M.pair.target.1 = M.continuation.second)
  | reverseContinuationOrder
      (source_eq : M.pair.source.1 = M.continuation.second)
      (target_eq : M.pair.target.1 = M.continuation.first)
  | sharesFirstAtSource
      (source_eq : M.pair.source.1 = M.continuation.first)
      (target_ne_second : M.pair.target.1 ≠ M.continuation.second)
  | sharesFirstAtTarget
      (target_eq : M.pair.target.1 = M.continuation.first)
      (source_ne_second : M.pair.source.1 ≠ M.continuation.second)
  | sharesSecondAtSource
      (source_eq : M.pair.source.1 = M.continuation.second)
      (target_ne_first : M.pair.target.1 ≠ M.continuation.first)
      (target_ne_second : M.pair.target.1 ≠ M.continuation.second)
  | sharesSecondAtTarget
      (target_eq : M.pair.target.1 = M.continuation.second)
      (source_ne_first : M.pair.source.1 ≠ M.continuation.first)
      (source_ne_second : M.pair.source.1 ≠ M.continuation.second)
  | fourDistinct
      (source_ne_first : M.pair.source.1 ≠ M.continuation.first)
      (source_ne_second : M.pair.source.1 ≠ M.continuation.second)
      (target_ne_first : M.pair.target.1 ≠ M.continuation.first)
      (target_ne_second : M.pair.target.1 ≠ M.continuation.second)
      (roles_eq_physical :
        mutualPhysicalRoleSet M = physicalVertices profile)

/-- Exact-six full-parent mutual data always produces the bounded complete-row
manifest. -/
theorem exactSixMutualCompleteRowManifest
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) :
    ExactSixMutualCompleteRowManifest M := by
  classical
  have hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 4 :=
    physicalCapInterior_card_eq_four_of_secondCap_card_eq_six S hcap
  have hphysicalUpper : (physicalVertices profile).card ≤ 4 := by
    calc
      (physicalVertices profile).card ≤
          (S.capInteriorByIndex S.oppIndex2).card := by
        apply Finset.card_le_card
        intro x hx
        exact (Finset.mem_inter.mp hx).2
      _ = 4 := hinterior
  have hphysicalCard :
      (physicalVertices profile).card = 3 ∨
        (physicalVertices profile).card = 4 := by
    have hlower := physicalVertices_card_ge_three profile
    omega
  have hroles : mutualPhysicalRoleSet M ⊆ physicalVertices profile := by
    intro x hx
    simp only [mutualPhysicalRoleSet, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with hx | hx | hx | hx
    · simpa [hx, physicalVertices] using
        M.continuation.first_mem_physicalInterior
    · simpa [hx, physicalVertices] using
        M.continuation.second_mem_physicalInterior
    · subst x
      exact M.pair.source.2
    · subst x
      exact M.pair.target.2
  refine {
    physicalCard := hphysicalCard
    physicalCapInteriorCard := hinterior
    roleSet_subset_physical := hroles
    roleSet_card_le_four := (Finset.card_le_card hroles).trans hphysicalUpper
    unused_not_mem_physical := ?_
    continuationSources_ne := M.continuation.first_ne_second
    mutualSources_ne := mutualPair_source_ne_target M.pair
    unusedSupport_complete := ?_
    unusedSupport_card_eq_four := ?_
    unusedSupport_physical_card_le_one := ?_
    continuationFirst_not_mem_unusedSupport :=
      M.continuation.first_not_mem_actualCriticalSupport
    continuationSecond_not_mem_unusedSupport :=
      M.continuation.second_not_mem_actualCriticalSupport
    physicalSupport_complete := ?_
    physicalSupport_card_eq_four := ?_
    physicalSource_mem_support := ?_
    physicalSupport_physical_card_le_two := ?_
    target_not_mem_sourceSupport := M.pair.target_not_mem_sourceSupport
    source_not_mem_targetSupport := M.pair.source_not_mem_targetSupport
    mutualBlockers_ne := ?_
    mutualSupport_inter_card_le_two := ?_ }
  · intro hunused
    apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
    exact (Finset.mem_inter.mp hunused).1
  · let K :=
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell
    simpa [SelectedClass, K] using K.support_eq
  · exact
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support_card
  · simpa [physicalVertices] using
      actualUnusedRow_physicalInterior_inter_card_le_one
        M.continuation.unusedRow
  · intro q
    let K :=
      (H.selectedAt q.1 (PhysicalVertex.mem_A q)).toCriticalFourShell
    simpa [physicalCriticalSupport, SelectedClass, K] using K.support_eq
  · intro q
    exact (H.selectedAt q.1
      (PhysicalVertex.mem_A q)).toCriticalFourShell.support_card
  · intro q
    exact (H.selectedAt q.1
      (PhysicalVertex.mem_A q)).toCriticalFourShell.q_mem_support
  · intro q
    simpa [physicalVertices, physicalCriticalSupport] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile q.1 q.2
  · exact blocker_centers_ne_of_not_mem_other_selected_support H
      (PhysicalVertex.mem_A M.pair.source)
      (PhysicalVertex.mem_A M.pair.target)
      M.pair.source_not_mem_targetSupport
  · simpa [physicalCriticalSupport] using
      selected_support_inter_card_le_two_of_not_mem_other_selected_support H
        (PhysicalVertex.mem_A M.pair.source)
        (PhysicalVertex.mem_A M.pair.target)
        M.pair.source_not_mem_targetSupport

/-- Exact cap six reduces all source-identity branching to seven canonical
orbits.  This is the finite identity quotient a CEGAR encoding should use;
it should not enumerate arbitrary ambient labels. -/
theorem exactSixMutualRoleOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) :
    ExactSixMutualRoleOrbit M := by
  classical
  let X := exactSixMutualCompleteRowManifest M hcap
  have hsourceTarget : M.pair.source.1 ≠ M.pair.target.1 := by
    intro h
    exact X.mutualSources_ne (Subtype.ext h)
  by_cases hsourceFirst : M.pair.source.1 = M.continuation.first
  · by_cases htargetSecond : M.pair.target.1 = M.continuation.second
    · exact .continuationOrder hsourceFirst htargetSecond
    · exact .sharesFirstAtSource hsourceFirst htargetSecond
  · by_cases htargetFirst : M.pair.target.1 = M.continuation.first
    · by_cases hsourceSecond : M.pair.source.1 = M.continuation.second
      · exact .reverseContinuationOrder hsourceSecond htargetFirst
      · exact .sharesFirstAtTarget htargetFirst hsourceSecond
    · by_cases hsourceSecond : M.pair.source.1 = M.continuation.second
      · have htargetSecond :
            M.pair.target.1 ≠ M.continuation.second := by
          intro h
          exact hsourceTarget (hsourceSecond.trans h.symm)
        exact .sharesSecondAtSource hsourceSecond htargetFirst htargetSecond
      · by_cases htargetSecond : M.pair.target.1 = M.continuation.second
        · exact .sharesSecondAtTarget htargetSecond hsourceFirst hsourceSecond
        · have hroleCard : (mutualPhysicalRoleSet M).card = 4 := by
            have hfirstSource :
                M.continuation.first ≠ M.pair.source.1 := Ne.symm hsourceFirst
            have hfirstTarget :
                M.continuation.first ≠ M.pair.target.1 := Ne.symm htargetFirst
            have hsecondSource :
                M.continuation.second ≠ M.pair.source.1 := Ne.symm hsourceSecond
            have hsecondTarget :
                M.continuation.second ≠ M.pair.target.1 := Ne.symm htargetSecond
            simp [mutualPhysicalRoleSet, M.continuation.first_ne_second,
              hfirstSource, hfirstTarget, hsecondSource, hsecondTarget,
              hsourceTarget]
          have hphysicalLeRoles :
              (physicalVertices profile).card ≤
                (mutualPhysicalRoleSet M).card := by
            rw [hroleCard]
            rcases X.physicalCard with hthree | hfour <;> omega
          have hrolesEq :
              mutualPhysicalRoleSet M = physicalVertices profile :=
            Finset.eq_of_subset_of_card_le X.roleSet_subset_physical
              hphysicalLeRoles
          exact .fourDistinct hsourceFirst hsourceSecond htargetFirst
            htargetSecond hrolesEq

#print axioms physicalCapInterior_card_eq_four_of_secondCap_card_eq_six
#print axioms exactSixMutualCompleteRowManifest
#print axioms exactSixMutualRoleOrbit

end

end ATailExactSixUniformCoreOccurrenceScratch
end Problem97
