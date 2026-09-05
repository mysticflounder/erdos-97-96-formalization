/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CrossBlockerFiberBridge

/-!
# Card-sensitive blocker information for the outside-fiber bridge

The outside-fiber bridge leaves an actual blocker fiber of cardinality three
or four.  This module records the source-facing information that the
cardinality split supplies about the second outside point:

* at card four, maximality makes that point an actual member of the anchor
  blocker fiber;
* at card three, the four named sources would be distinct if it had the
  anchor blocker, so its actual blocker is different.

This is a normalization bridge only; it does not claim the resulting
card-sensitive alternatives are contradictory.
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

/-- At card four, the second outside point is in the first actual blocker
fiber, because that fiber exhausts its selected support. -/
theorem freshOutsideFirst_otherOutsidePoint_mem_actualBlockerFiber_of_card_eq_four
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hcard :
      (actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩).card = 4) :
    (⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ∈
      actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩ := by
  let anchor : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let other : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩
  have himage :=
    actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
      H anchor (by simpa [anchor] using hcard)
  have hpoint :
      Q.otherOutsidePoint ∈
        (actualBlockerFiber H anchor).image (fun source => source.1) := by
    rw [himage]
    exact Q.otherOutsidePoint_mem_shell
  rcases Finset.mem_image.mp hpoint with ⟨source, hsource, hsource_eq⟩
  have hsource_eq' : source = other := by
    apply Subtype.ext
    exact hsource_eq
  rw [hsource_eq'] at hsource
  simpa [anchor, other] using hsource

private theorem freshOutsideFirst_four_distinct_sources
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    ({(⟨P.source₁, P.source₁_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A),
      ⟨P.source₂, P.source₂_mem_A⟩, Q.source,
      ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩} :
        Finset (CriticalShellSystem.CarrierVertex D.A)).card = 4 := by
  have hsource₁_mem_cap :
      P.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hsource₂_mem_cap :
      P.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  have h₁₂ :
      (⟨P.source₁, P.source₁_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ≠
        ⟨P.source₂, P.source₂_mem_A⟩ := by
    intro h
    apply P.sources_ne
    exact congrArg Subtype.val h
  have h₁Q :
      (⟨P.source₁, P.source₁_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ≠ Q.source := by
    intro h
    exact Q.source_ne_first₁ h.symm
  have h₁o :
      (⟨P.source₁, P.source₁_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ≠
        ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    have hp : P.source₁ = Q.otherOutsidePoint :=
      congrArg Subtype.val h
    rw [← hp]
    exact hsource₁_mem_cap
  have h₂Q :
      (⟨P.source₂, P.source₂_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ≠ Q.source := by
    intro h
    exact Q.source_ne_first₂ h.symm
  have h₂o :
      (⟨P.source₂, P.source₂_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ≠
        ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    have hp : P.source₂ = Q.otherOutsidePoint :=
      congrArg Subtype.val h
    rw [← hp]
    exact hsource₂_mem_cap
  have hQo :
      Q.source ≠
        ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ := by
    intro h
    apply Q.otherOutsidePoint_ne_source
    exact (congrArg Subtype.val h).symm
  simp [h₁₂, h₁Q, h₁o, h₂Q, h₂o, hQo]

/-- At card three, the second outside point cannot have the first collision
blocker's actual blocker: that would give four distinct fiber sources. -/
theorem freshOutsideFirst_otherOutsidePoint_not_mem_actualBlockerFiber_of_card_eq_three
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hcard :
      (actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩).card = 3) :
    (⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ∉
      actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩ := by
  let anchor : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let source₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let other : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩
  intro hother
  have hanchor : anchor ∈ actualBlockerFiber H anchor := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, rfl⟩
  have hsource₂ : source₂ ∈ actualBlockerFiber H anchor := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    apply Subtype.ext
    exact P.blockers_eq.symm
  have hsource : Q.source ∈ actualBlockerFiber H anchor := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, Q.blockers_eq⟩
  have hsubset :
      ({anchor, source₂, Q.source, other} :
        Finset (CriticalShellSystem.CarrierVertex D.A)) ⊆
        actualBlockerFiber H anchor := by
    intro source hsource'
    simp only [Finset.mem_insert, Finset.mem_singleton] at hsource'
    rcases hsource' with rfl | rfl | rfl | rfl
    · exact hanchor
    · exact hsource₂
    · exact hsource
    · exact hother
  have hle := Finset.card_le_card hsubset
  have hfour := freshOutsideFirst_four_distinct_sources (P := P) (Pρ := Pρ) Q
  have hfour' :
      ({anchor, source₂, Q.source, other} :
        Finset (CriticalShellSystem.CarrierVertex D.A)).card = 4 := by
    simpa [anchor, source₂, other] using hfour
  rw [hfour', hcard] at hle
  omega

/-- The card-three branch records the corresponding blocker inequality. -/
theorem freshOutsideFirst_otherOutsidePoint_blocker_ne_of_card_eq_three
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hcard :
      (actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩).card = 3) :
    H.blockerVertex
        ⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  intro hblockers
  have hmem :
      (⟨Q.otherOutsidePoint, Q.otherOutsidePoint_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A) ∈
      actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩ :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _, hblockers⟩
  exact
    freshOutsideFirst_otherOutsidePoint_not_mem_actualBlockerFiber_of_card_eq_three
      (P := P) (Pρ := Pρ) Q hcard hmem

end
end ATailFrontierLiveClosure
end Problem97
