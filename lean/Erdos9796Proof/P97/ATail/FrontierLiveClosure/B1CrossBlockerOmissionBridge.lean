/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

/-!
# Cross-blocker coincidence omissions

The coincidence split identifies one blocker center with one source from the
other retained pair.  Since a positive-radius critical shell omits its own
center, each equality arm gives the corresponding named cross-row omission.
This is only an omission bridge: the four-way disjunction does not by itself
negate `CollisionCrossHit`, whose other three memberships may still hold.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailTwoCollisionGlobalProducer
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailBlockerMultiplicityGeometry

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

/-- Every arm of `CrossBlockerCoincidence` gives the matching named source
omission from the opposite critical shell. -/
theorem crossBlockerCoincidence_implies_named_cross_omission
    (hcoincidence : CrossBlockerCoincidence P Pρ) :
    Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
      Pρ.source₂ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
        P.source₁ ∉
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₂ ∉
            (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rcases hcoincidence with h₁ | h₂ | h₃ | h₄
  · left
    intro hmem
    apply (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    have hmemT : Pρ.source₁ ∈ T := hmem
    have hcenterT : H.centerAt P.source₁ P.source₁_mem_A ∈ T := by
      rw [h₁]
      exact hmemT
    exact hcenterT
  · right
    left
    intro hmem
    apply (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    have hmemT : Pρ.source₂ ∈ T := hmem
    have hcenterT : H.centerAt P.source₁ P.source₁_mem_A ∈ T := by
      rw [h₂]
      exact hmemT
    exact hcenterT
  · right
    right
    left
    intro hmem
    apply (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support
    have hmemT : P.source₁ ∈ T := hmem
    have hcenterT : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ T := by
      rw [h₃]
      exact hmemT
    exact hcenterT
  · right
    right
    right
    intro hmem
    apply (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support
    have hmemT : P.source₂ ∈ T := hmem
    have hcenterT : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ T := by
      rw [h₄]
      exact hmemT
    exact hcenterT

end
end ATailFrontierLiveClosure
end Problem97
