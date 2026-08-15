/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment

/-!
# Finite overlap terminal for the FirstNonHit assignment

This module transports the source-clean two-circle intersection bound into the
complete finite assignment.  It is only a terminal: it does not assert that a
distinct-blocker three-overlap row exists.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)

/-- Two indexed selected rows with distinct actual blockers cannot overlap in
three carrier points.  The statement is cardinality-independent because `A`
indexes the complete carrier rather than a fixed finite subconfiguration. -/
theorem FirstNonHitSourceTotalFiniteAssignment.false_of_row_overlap_card_ge_three
    {source target : Fin A.boundary.n}
    (hblocker : A.blockerMap source ≠ A.blockerMap target)
    (hoverlap : 3 ≤ (A.row source ∩ A.row target).card) :
    False := by
  classical
  have hcenters :
      H.centerAt (A.boundary.boundary source) (A.boundary_mem source) ≠
        H.centerAt (A.boundary.boundary target) (A.boundary_mem target) := by
    intro hcenter
    apply hblocker
    apply A.boundary.boundary_injective
    calc
      A.boundary.boundary (A.blockerMap source) =
          H.centerAt (A.boundary.boundary source) (A.boundary_mem source) :=
        A.blockerMap_point_eq source
      _ = H.centerAt (A.boundary.boundary target) (A.boundary_mem target) :=
        hcenter
      _ = A.boundary.boundary (A.blockerMap target) :=
        (A.blockerMap_point_eq target).symm
  let overlap := A.row source ∩ A.row target
  have himageSubset :
      overlap.image A.boundary.boundary ⊆
        (H.selectedAt (A.boundary.boundary source)
            (A.boundary_mem source)).toCriticalFourShell.support ∩
          (H.selectedAt (A.boundary.boundary target)
            (A.boundary_mem target)).toCriticalFourShell.support := by
    intro point hpoint
    rcases Finset.mem_image.mp hpoint with ⟨index, hindex, rfl⟩
    rcases Finset.mem_inter.mp hindex with ⟨hsource, htarget⟩
    exact Finset.mem_inter.mpr
      ⟨(A.row_mem_iff source index).mp hsource,
        (A.row_mem_iff target index).mp htarget⟩
  have hgeomOverlap :
      3 ≤
        ((H.selectedAt (A.boundary.boundary source)
              (A.boundary_mem source)).toCriticalFourShell.support ∩
          (H.selectedAt (A.boundary.boundary target)
              (A.boundary_mem target)).toCriticalFourShell.support).card := by
    calc
      3 ≤ overlap.card := hoverlap
      _ = (overlap.image A.boundary.boundary).card :=
        (Finset.card_image_of_injective overlap
          A.boundary.boundary_injective).symm
      _ ≤ _ := Finset.card_le_card himageSubset
  have htwo :=
    SelectedFourClass.inter_card_le_two
      (H.selectedAt (A.boundary.boundary source)
        (A.boundary_mem source)).toCriticalFourShell.toSelectedFourClass
      (H.selectedAt (A.boundary.boundary target)
        (A.boundary_mem target)).toCriticalFourShell.toSelectedFourClass
      hcenters
  have htwo' :
      ((H.selectedAt (A.boundary.boundary source)
            (A.boundary_mem source)).toCriticalFourShell.support ∩
        (H.selectedAt (A.boundary.boundary target)
            (A.boundary_mem target)).toCriticalFourShell.support).card ≤ 2 := by
    simpa only [CriticalFourShell.toSelectedFourClass] using htwo
  omega

#print axioms
  FirstNonHitSourceTotalFiniteAssignment.false_of_row_overlap_card_ge_three

end

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
