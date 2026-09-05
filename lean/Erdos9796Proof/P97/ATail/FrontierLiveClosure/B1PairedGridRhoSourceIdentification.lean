/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

/-!
# B1 paired-grid radius/source identification

The equality arm of the paired-grid split identifies a positive exact-four
radius distinct from the retained radius with the grid's other radius, then
transports the retained collision pair across that equality.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPairedCommonDeletionNormalForm
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- A positive exact-four radius distinct from the retained radius must be the
second radius of a saturated paired grid.  This is the equality arm of the
grid/source-packet split; the other-radius producer is intentionally handled
elsewhere. -/
theorem pairedGrid_otherRadius_eq_of_rho
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O)
    (hRhoPos : 0 < ρ)
    (hRhoFour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hRhoNe : ρ ≠ radius) :
    Gr.otherRadius = ρ := by
  have hRhoFour' :
      4 ≤ (SelectedClass D.A S.oppApex1 ρ).card := by
    omega
  rcases Gr.richClass_mem ρ hRhoPos hRhoFour' with hρ | hρ
  · exact (hRhoNe hρ).elim
  · exact hρ.symm

/-- In the equality arm, the paired grid's strict other-radius points are
exactly the two strict-cap sources of the retained collision at radius ρ. -/
theorem pairedGrid_otherRadius_strictCap_eq_rho_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hRhoPos : 0 < ρ)
    (hRhoFour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hRhoNe : ρ ≠ radius)
    (hRhoInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}) :
    Gr.otherRadius = ρ ∧
      SelectedClass D.A S.oppApex1 Gr.otherRadius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂} := by
  have hRadius :
      Gr.otherRadius = ρ :=
    pairedGrid_otherRadius_eq_of_rho Gr hRhoPos hRhoFour hRhoNe
  refine ⟨hRadius, ?_⟩
  simpa [hRadius] using hRhoInteriorEq

end ATailFrontierLiveClosure
end Problem97
