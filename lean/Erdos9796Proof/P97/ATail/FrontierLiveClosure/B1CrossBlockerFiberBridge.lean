/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

/-!
# Finite landing for the two outside-fiber residuals

Each `FreshOutside*BlockerFiber` already contains the two named sources of
its collision pair and a third source with the same actual blocker.  The
generic support injection bounds that actual-blocker fiber by four.  This
module records the resulting exact `3 ∨ 4` landing without pretending that
either cardinality closes the remaining geometric branch.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

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

private theorem first_pair_mem_actualBlockerFiber
    (anchor : CriticalShellSystem.CarrierVertex D.A)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hblockers : H.blockerVertex source = H.blockerVertex anchor) :
    source ∈ actualBlockerFiber H anchor := by
  exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hblockers⟩

private theorem three_distinct_subset_actualBlockerFiber
    (anchor source₁ source₂ source₃ : CriticalShellSystem.CarrierVertex D.A)
    (h₁ : source₁ ∈ actualBlockerFiber H anchor)
    (h₂ : source₂ ∈ actualBlockerFiber H anchor)
    (h₃ : source₃ ∈ actualBlockerFiber H anchor)
    (h12 : source₁ ≠ source₂)
    (h13 : source₁ ≠ source₃)
    (h23 : source₂ ≠ source₃) :
    3 ≤ (actualBlockerFiber H anchor).card := by
  have hsubset :
      ({source₁, source₂, source₃} : Finset (CriticalShellSystem.CarrierVertex D.A)) ⊆
        actualBlockerFiber H anchor := by
    intro source hsource
    simp only [Finset.mem_insert, Finset.mem_singleton] at hsource
    rcases hsource with rfl | rfl | rfl
    · exact h₁
    · exact h₂
    · exact h₃
  have hcard :
      ({source₁, source₂, source₃} : Finset (CriticalShellSystem.CarrierVertex D.A)).card = 3 := by
    simp [h12, h13, h23]
  rw [← hcard]
  exact Finset.card_le_card hsubset

/-- A first-side outside-fiber residual leaves exactly three or four sources
in the actual fiber of the first collision blocker. -/
theorem freshOutsideFirst_actualBlockerFiber_card_three_or_four
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩).card = 3 ∨
      (actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩).card = 4 := by
  let anchor : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let source₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  have hanchor : anchor ∈ actualBlockerFiber H anchor :=
    first_pair_mem_actualBlockerFiber (H := H) anchor anchor rfl
  have hsource₂ : source₂ ∈ actualBlockerFiber H anchor := by
    apply first_pair_mem_actualBlockerFiber (H := H) anchor source₂
    apply Subtype.ext
    exact P.blockers_eq.symm
  have hsource : Q.source ∈ actualBlockerFiber H anchor := by
    apply first_pair_mem_actualBlockerFiber (H := H) anchor Q.source
    exact Q.blockers_eq
  have hanchor₂ : anchor ≠ source₂ := by
    intro h
    apply P.sources_ne
    simpa [anchor, source₂] using congrArg Subtype.val h
  have hanchorQ : anchor ≠ Q.source := by
    intro h
    apply Q.source_ne_first₁
    simpa [anchor] using h.symm
  have hsource₂Q : source₂ ≠ Q.source := by
    intro h
    apply Q.source_ne_first₂
    simpa [source₂] using h.symm
  have hlower : 3 ≤ (actualBlockerFiber H anchor).card :=
    three_distinct_subset_actualBlockerFiber (H := H) anchor anchor source₂ Q.source
      hanchor hsource₂ hsource hanchor₂ hanchorQ hsource₂Q
  have hupper : (actualBlockerFiber H anchor).card ≤ 4 :=
    actualBlockerFiber_card_le_four H anchor
  dsimp [anchor] at hlower hupper ⊢
  omega

/-- A second-side outside-fiber residual has the symmetric finite landing. -/
theorem freshOutsideSecond_actualBlockerFiber_card_three_or_four
    (Q : FreshOutsideSecondBlockerFiber P Pρ) :
    (actualBlockerFiber H ⟨Pρ.source₁, Pρ.source₁_mem_A⟩).card = 3 ∨
      (actualBlockerFiber H ⟨Pρ.source₁, Pρ.source₁_mem_A⟩).card = 4 := by
  let anchor : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let source₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have hanchor : anchor ∈ actualBlockerFiber H anchor :=
    first_pair_mem_actualBlockerFiber (H := H) anchor anchor rfl
  have hsource₂ : source₂ ∈ actualBlockerFiber H anchor := by
    apply first_pair_mem_actualBlockerFiber (H := H) anchor source₂
    apply Subtype.ext
    exact Pρ.blockers_eq.symm
  have hsource : Q.source ∈ actualBlockerFiber H anchor := by
    apply first_pair_mem_actualBlockerFiber (H := H) anchor Q.source
    exact Q.blockers_eq
  have hanchor₂ : anchor ≠ source₂ := by
    intro h
    apply Pρ.sources_ne
    simpa [anchor, source₂] using congrArg Subtype.val h
  have hanchorQ : anchor ≠ Q.source := by
    intro h
    apply Q.source_ne_second₁
    simpa [anchor] using h.symm
  have hsource₂Q : source₂ ≠ Q.source := by
    intro h
    apply Q.source_ne_second₂
    simpa [source₂] using h.symm
  have hlower : 3 ≤ (actualBlockerFiber H anchor).card :=
    three_distinct_subset_actualBlockerFiber (H := H) anchor anchor source₂ Q.source
      hanchor hsource₂ hsource hanchor₂ hanchorQ hsource₂Q
  have hupper : (actualBlockerFiber H anchor).card ≤ 4 :=
    actualBlockerFiber_card_le_four H anchor
  dsimp [anchor] at hlower hupper ⊢
  omega

end
end ATailFrontierLiveClosure
end Problem97
