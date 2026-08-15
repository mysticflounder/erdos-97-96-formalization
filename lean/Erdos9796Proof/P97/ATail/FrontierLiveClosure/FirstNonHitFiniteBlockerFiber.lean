/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Blocker-fiber bound for the FirstNonHit finite assignment

The complete FirstNonHit assignment indexes every actual blocker on the full
carrier.  This module transports the source theorem that every actual-blocker
fiber has cardinality at most four into that indexed vocabulary.  It is a
carrier-wide source constraint, not a fixed-cardinality search assumption.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
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

/-- Indices of all carrier sources with the same actual blocker as `anchor`. -/
def firstNonHitFiniteBlockerFiber (anchor : Fin A.boundary.n) :
    Finset (Fin A.boundary.n) :=
  Finset.univ.filter fun source => A.blockerMap source = A.blockerMap anchor

/-- Every indexed actual-blocker fiber in the complete FirstNonHit assignment
has cardinality at most four. -/
theorem firstNonHitFiniteBlockerFiber_card_le_four
    (anchor : Fin A.boundary.n) :
    (firstNonHitFiniteBlockerFiber P Pρ C Q A anchor).card ≤ 4 := by
  classical
  let toCarrier : Fin A.boundary.n → CriticalShellSystem.CarrierVertex D.A :=
    fun source => ⟨A.boundary.boundary source, A.boundary_mem source⟩
  let indexedFiber := firstNonHitFiniteBlockerFiber P Pρ C Q A anchor
  let actualFiber := ATailSurvivalCover.actualBlockerFiber H (toCarrier anchor)
  have htoCarrier : Function.Injective toCarrier := by
    intro source source' h
    apply A.boundary.boundary_injective
    exact congrArg Subtype.val h
  have himage : indexedFiber.image toCarrier ⊆ actualFiber := by
    intro source hsource
    rcases Finset.mem_image.mp hsource with ⟨index, hindex, rfl⟩
    have hmap : A.blockerMap index = A.blockerMap anchor :=
      (Finset.mem_filter.mp hindex).2
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    apply Subtype.ext
    have hpoints := congrArg A.boundary.boundary hmap
    simpa [toCarrier, CriticalShellSystem.blockerVertex,
      A.blockerMap_point_eq] using hpoints
  calc
    indexedFiber.card = (indexedFiber.image toCarrier).card :=
      (Finset.card_image_of_injective indexedFiber htoCarrier).symm
    _ ≤ actualFiber.card := Finset.card_le_card himage
    _ ≤ 4 := ATailSurvivalCover.actualBlockerFiber_card_le_four H _

/-- Equal indexed actual blockers force equality of the corresponding exact
selected rows. -/
theorem firstNonHitFiniteRow_eq_of_blockerMap_eq
    {source anchor : Fin A.boundary.n}
    (hblocker : A.blockerMap source = A.blockerMap anchor) :
    A.row source = A.row anchor := by
  have hcenters :
      H.centerAt (A.boundary.boundary source) (A.boundary_mem source) =
        H.centerAt (A.boundary.boundary anchor) (A.boundary_mem anchor) := by
    have hpoints := congrArg A.boundary.boundary hblocker
    simpa [A.blockerMap_point_eq] using hpoints
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H (A.boundary_mem source) (A.boundary_mem anchor) hcenters
  ext x
  rw [A.row_mem_iff, A.row_mem_iff, hsupports]

/-- Equality of two indexed exact selected rows forces equality of their
actual blockers.  Distinct Euclidean circle centers can share at most two
selected points, whereas each row has four. -/
theorem firstNonHitFiniteBlockerMap_eq_of_row_eq
    {source anchor : Fin A.boundary.n}
    (hrow : A.row source = A.row anchor) :
    A.blockerMap source = A.blockerMap anchor := by
  by_contra hblocker
  have hcenters :
      H.centerAt (A.boundary.boundary source) (A.boundary_mem source) ≠
        H.centerAt (A.boundary.boundary anchor) (A.boundary_mem anchor) := by
    intro h
    apply hblocker
    apply A.boundary.boundary_injective
    simpa [A.blockerMap_point_eq] using h
  have hsupports :
      (H.selectedAt (A.boundary.boundary source)
          (A.boundary_mem source)).toCriticalFourShell.support =
        (H.selectedAt (A.boundary.boundary anchor)
          (A.boundary_mem anchor)).toCriticalFourShell.support := by
    rw [← A.row_image_eq_shell source, hrow, A.row_image_eq_shell anchor]
  have hinter :=
    SelectedFourClass.inter_card_le_two
      (H.selectedAt (A.boundary.boundary source)
        (A.boundary_mem source)).toCriticalFourShell.toSelectedFourClass
      (H.selectedAt (A.boundary.boundary anchor)
        (A.boundary_mem anchor)).toCriticalFourShell.toSelectedFourClass
      hcenters
  have hinter' :
      ((H.selectedAt (A.boundary.boundary source)
          (A.boundary_mem source)).toCriticalFourShell.support ∩
        (H.selectedAt (A.boundary.boundary anchor)
          (A.boundary_mem anchor)).toCriticalFourShell.support).card ≤ 2 := by
    simpa [CriticalFourShell.toSelectedFourClass] using hinter
  rw [hsupports, Finset.inter_self] at hinter'
  have hcard :=
    (H.selectedAt (A.boundary.boundary anchor)
      (A.boundary_mem anchor)).toCriticalFourShell.support_card
  omega

/-- In the complete finite assignment, blocker equality and exact-row
equality are equivalent. -/
theorem firstNonHitFiniteBlockerMap_eq_iff_row_eq
    {source anchor : Fin A.boundary.n} :
    A.blockerMap source = A.blockerMap anchor ↔
      A.row source = A.row anchor := by
  constructor
  · exact firstNonHitFiniteRow_eq_of_blockerMap_eq (A := A)
  · exact firstNonHitFiniteBlockerMap_eq_of_row_eq (A := A)

#print axioms firstNonHitFiniteBlockerFiber_card_le_four
#print axioms firstNonHitFiniteRow_eq_of_blockerMap_eq
#print axioms firstNonHitFiniteBlockerMap_eq_of_row_eq
#print axioms firstNonHitFiniteBlockerMap_eq_iff_row_eq

end


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
