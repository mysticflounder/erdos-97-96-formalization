/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221Ingress

/-!
# Source-faithful exact-twelve Rigid221 candidate surface

This module freezes the finite candidate predicate justified by the current
source ingress.  It includes `C1`, all six Moser one-hit inequalities,
`moserCount <= 2`, and the three own-cap `sameCapCount <= 2` implications.

It deliberately excludes the stronger mixed
`moserCount >= 2 -> sameCapCount = 0` cut used by the historical Python
surface.  Consequently this is the semantic ingress contract for a new safe
encoder, not a validation of that historical surface or of `probe.py`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

/-- The six source-proved one-hit implications, stated for one finite row. -/
def FrozenSafeOneHitAt (center : Label) (row : Finset Label) : Prop :=
  (center = 0 ->
      (row ∩ firstOppositeCapLabels).card <= 1 /\
      (row ∩ secondOppositeCapLabels).card <= 1) /\
  (center = 1 ->
      (row ∩ surplusCapLabels).card <= 1 /\
      (row ∩ firstOppositeCapLabels).card <= 1) /\
  (center = 2 ->
      (row ∩ secondOppositeCapLabels).card <= 1 /\
      (row ∩ surplusCapLabels).card <= 1)

instance (center : Label) (row : Finset Label) :
    Decidable (FrozenSafeOneHitAt center row) := by
  unfold FrozenSafeOneHitAt
  infer_instance

/-- The three source-proved own-cap implications, stated for one finite row. -/
def FrozenSafeSameCapAt (center : Label) (row : Finset Label) : Prop :=
  (center ∈ surplusInteriorLabels ->
      (row ∩ surplusInteriorLabels).card <= 2) /\
  (center ∈ firstOppositeInteriorLabels ->
      (row ∩ firstOppositeInteriorLabels).card <= 2) /\
  (center ∈ secondOppositeInteriorLabels ->
      (row ∩ secondOppositeInteriorLabels).card <= 2)

instance (center : Label) (row : Finset Label) :
    Decidable (FrozenSafeSameCapAt center row) := by
  unfold FrozenSafeSameCapAt
  infer_instance

/-- One finite row is admitted by exactly the currently source-proved safe
candidate filters.  No mixed Moser/same-cap implication occurs here. -/
def FrozenSafeCandidateAt (center : Label) (row : Finset Label) : Prop :=
  row.card = 4 /\
  center ∉ row /\
  FrozenSafeOneHitAt center row /\
  (row ∩ moserLabels).card <= 2 /\
  FrozenSafeSameCapAt center row

instance (center : Label) (row : Finset Label) :
    Decidable (FrozenSafeCandidateAt center row) := by
  unfold FrozenSafeCandidateAt
  infer_instance

/-- The finite, proof-facing candidate set at one exact-twelve center. -/
def frozenSafeCandidateClasses (center : Label) : Finset (Finset Label) :=
  (Finset.univ : Finset Label).powerset.filter
    (FrozenSafeCandidateAt center)

theorem mem_frozenSafeCandidateClasses {center : Label} {row : Finset Label} :
    row ∈ frozenSafeCandidateClasses center <->
      FrozenSafeCandidateAt center row := by
  simp [frozenSafeCandidateClasses]

/-- Complete source-to-finite-candidate admission, retaining the independent
`C1/C2/C4` contract required by the base cover CNF. -/
structure FrozenSafeCubeOK (row : RowPattern Label) : Prop where
  sourceCube : SourceCubeOK row
  candidate_mem :
    ∀ center, row center ∈ frozenSafeCandidateClasses center

/-- Every frozen source row belongs to the safe finite candidate universe. -/
theorem FrozenRoleLabeling.row_mem_frozenSafeCandidateClasses
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (caps : FrozenClosedCapProfile labeling)
    (center : Label) :
    labeledRowPattern carrierPattern labeling.e center ∈
      frozenSafeCandidateClasses center := by
  rw [mem_frozenSafeCandidateClasses]
  have hcube := labeling.sourceCubeOK
  have hone := labeling.moserOneHit caps
  have hbasic := labeling.basicCandidateCuts interiors
  refine ⟨hcube.row_card center, hcube.center_not_mem center, ?_,
    hbasic.moserCount_le_two center, ?_⟩
  · refine ⟨?_, ?_, ?_⟩
    · rintro rfl
      exact ⟨hone.surplusApex_firstOpposite,
        hone.surplusApex_secondOpposite⟩
    · rintro rfl
      exact ⟨hone.secondApex_surplus, hone.secondApex_firstOpposite⟩
    · rintro rfl
      exact ⟨hone.firstApex_secondOpposite, hone.firstApex_surplus⟩
  · exact ⟨
      hbasic.surplusSameCap_le_two center,
      hbasic.firstOppositeSameCap_le_two center,
      hbasic.secondOppositeSameCap_le_two center⟩

/-- The complete checked semantic ingress for a safe exact-twelve cover
encoding.  This theorem supplies candidate membership and `C1/C2/C4`; a
separate encoder-index bridge is still required to obtain a concrete CNF
valuation. -/
theorem FrozenRoleLabeling.safeCubeOK
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (caps : FrozenClosedCapProfile labeling) :
    FrozenSafeCubeOK (labeledRowPattern carrierPattern labeling.e) := by
  exact ⟨labeling.sourceCubeOK,
    labeling.row_mem_frozenSafeCandidateClasses interiors caps⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
