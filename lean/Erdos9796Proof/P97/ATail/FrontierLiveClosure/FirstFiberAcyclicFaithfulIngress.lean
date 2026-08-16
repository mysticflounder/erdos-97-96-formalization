/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber

/-!
# Acyclic faithful-carrier ingress for the first-fiber deletion packet

The historical faithful five/six-center declarations live in
`TwoSourceFirstFiberCollision`, downstream of `TwoSourceFreshThirdResidual`.
That placement makes them unavailable to the early FirstNonHit ingress without
an import cycle.  This module gives the minimal source-clean six-center form
and a direct adapter from the raw deletion residual.  It intentionally proves
only a positive faithful carrier packet, not a contradiction.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

namespace TwoSourceExactCollisionRowsTerminal

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
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)

/-- A lower, acyclic copy of the four six-center faithful deletion arms.
The distinct-center proof is bundled into each carrier boundary. -/
abbrev FirstFiberCollisionSixCenterAcyclicFaithfulResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A))

private theorem firstFiberAcyclic_oppApex1_mem_A : S.oppApex1 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem firstFiberAcyclic_oppApex2_mem_A : S.oppApex2 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem firstFiberAcyclic_surplusApex_mem_A :
    S.surplusApex ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

include T in
/-- Convert the raw five-center deletion disjunction directly to the faithful
six-center carrier boundary.  The cap-source witness separates the three
blocker centers, while tri-apex robustness separates every blocker center
from the three Moser apices. -/
theorem collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (hdeletion :
      ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    FirstFiberCollisionSixCenterAcyclicFaithfulResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  classical
  rcases source_witness with
    ⟨_, _, _, hsourceNeP, hsourceNePρ, _, _, _, _, _, _⟩
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hsourceNeApex₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source.1 source.2
  have hsourceNeApex₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source.1 source.2
  have hsourceNeApex₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source.1 source.2
  have hPNeApex₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₃ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPρNeApex₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₃ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hApex₁NeApex₂ : S.oppApex1 ≠ S.oppApex2 := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have hApex₁NeApex₃ : S.oppApex1 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1.symm
  have hApex₂NeApex₃ : S.oppApex2 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2.symm
  have hsourceBlockerMem : H.centerAt source.1 source.2 ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 blocker_mem_capInterior
  have hPBlockerMem : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 P.blocker_mem_capInterior
  have hPρBlockerMem : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 Pρ.blocker_mem_capInterior
  have hApex₁Mem : S.oppApex1 ∈ D.A :=
    firstFiberAcyclic_oppApex1_mem_A (S := S)
  have hApex₂Mem : S.oppApex2 ∈ D.A :=
    firstFiberAcyclic_oppApex2_mem_A (S := S)
  have hApex₃Mem : S.surplusApex ∈ D.A :=
    firstFiberAcyclic_surplusApex_mem_A (S := S)
  have hcentersP :
      ({H.centerAt source.1 source.2, S.oppApex1,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5 := by
    simp [hsourceNeP, hsourceNeApex₁, hsourceNeApex₂,
      hsourceNeApex₃, hPNeApex₁.symm, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃]
  have hcentersPρ :
      ({H.centerAt source.1 source.2, S.oppApex1,
          H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5 := by
    simp [hsourceNePρ, hsourceNeApex₁, hsourceNeApex₂,
      hsourceNeApex₃, hPρNeApex₁.symm, hPρNeApex₂, hPρNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃]
  rcases hdeletion with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases
      ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₁_mem_A hP₁ with ⟨E⟩
    rcases E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPρBlockerMem hApex₂Mem hApex₃Mem hcentersPρ with ⟨C⟩
    exact Or.inl C.toActualBlockerSixCenterBoundary
  · rcases
      ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₁_mem_A hPρ₁ with ⟨E⟩
    rcases E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPBlockerMem hApex₂Mem hApex₃Mem hcentersP with ⟨C⟩
    exact Or.inr (Or.inl C.toActualBlockerSixCenterBoundary)
  · rcases
      ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₂_mem_A hP₂ with ⟨E⟩
    rcases E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPρBlockerMem hApex₂Mem hApex₃Mem hcentersPρ with ⟨C⟩
    exact Or.inr (Or.inr (Or.inl (by
      simpa only [P.blockers_eq] using
        C.toActualBlockerSixCenterBoundary)))
  · rcases
      ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₂_mem_A hPρ₂ with ⟨E⟩
    rcases E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPBlockerMem hApex₂Mem hApex₃Mem hcentersP with ⟨C⟩
    exact Or.inr (Or.inr (Or.inr (by
      simpa only [Pρ.blockers_eq] using
        C.toActualBlockerSixCenterBoundary)))

#print axioms collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
