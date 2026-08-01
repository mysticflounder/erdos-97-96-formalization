import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Scratch classifier for the fresh-third no-alignment frontier

This file is intentionally outside the production Lean library.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace FreshThirdNoAlignmentLeanSplit

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

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
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)

include T

/-- A source-local blocker-cap localization proof placed before the proposed
classifier.  This deliberately does not use the later production declaration
`exists_blockerCenter_mem_capInteriorByIndex`. -/
theorem exists_blockerCenter_mem_capInteriorByIndex_early
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ i : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i := by
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  have hblockerNe₁ : H.blockerVertex source ≠ apex₁ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H source apex₁.2
  have hblockerNe₂ : H.blockerVertex source ≠ apex₂ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H source apex₂.2
  have hblockerNe₃ : H.blockerVertex source ≠ apex₃ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H source apex₃.2
  have hcenterNe₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 := by
    intro h
    apply hblockerNe₁
    apply Subtype.ext
    simpa [apex₁] using h
  have hcenterNe₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 := by
    intro h
    apply hblockerNe₂
    apply Subtype.ext
    simpa [apex₂] using h
  have hcenterNe₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex := by
    intro h
    apply hblockerNe₃
    apply Subtype.ext
    simpa [apex₃] using h
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      (H.blockerVertex source).2 with htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim (hcenterNe₃ (by simpa using hsurplus))
    · exact False.elim (hcenterNe₁ (by simpa using hfirst))
    · exact False.elim (hcenterNe₂ (by simpa using hsecond))
  · exact hcap

/-- Exhaustive propositional classifier for the cap-source/fresh-third packet.
Only its final arm has the hypotheses of
`FreshThirdSameCapCrossRowAlignment`; the other six are the residual frontier. -/
theorem capSource_freshThirdBlockerFiber_sevenBranchClassifier
    (source : CriticalShellSystem.CarrierVertex D.A)
    (_hsource :
      TwoSourceExactCollisionRowsTerminal.CapSourceThirdCanonicalRowWitness
        P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ) :
    ∃ i j : Fin 3,
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex i ∧
      H.centerAt source.1 source.2 ∈
          S.capInteriorByIndex j ∧
      (H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt source.1 source.2 ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support) ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.source₂.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support) ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          i ≠ j) ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          i = j ∧
          Q.source₁.1 ∈ S.capByIndex i) ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          i = j ∧
          Q.source₁.1 ∉ S.capByIndex i ∧
          Q.source₂.1 ∈ S.capByIndex i) ∨
       (H.centerAt Q.source₁.1 Q.source₁.2 ≠
            H.centerAt source.1 source.2 ∧
          Q.source₁.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          i = j ∧
          Q.source₁.1 ∉ S.capByIndex i ∧
          Q.source₂.1 ∉ S.capByIndex i)) := by
  rcases exists_blockerCenter_mem_capInteriorByIndex_early T Q.source₁ with
    ⟨i, hi⟩
  rcases exists_blockerCenter_mem_capInteriorByIndex_early T source with
    ⟨j, hj⟩
  refine ⟨i, j, hi, hj, ?_⟩
  by_cases hcenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt source.1 source.2
  · exact Or.inl hcenters
  by_cases hsource₁Row :
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · by_cases hsource₂Row :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support
    · by_cases hij : i = j
      · by_cases hsource₁Cap : Q.source₁.1 ∈ S.capByIndex i
        · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
            ⟨hcenters, hsource₁Row, hsource₂Row, hij, hsource₁Cap⟩))))
        · by_cases hsource₂Cap : Q.source₂.1 ∈ S.capByIndex i
          · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
              ⟨hcenters, hsource₁Row, hsource₂Row, hij,
                hsource₁Cap, hsource₂Cap⟩)))))
          · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
              ⟨hcenters, hsource₁Row, hsource₂Row, hij,
                hsource₁Cap, hsource₂Cap⟩)))))
      · exact Or.inr (Or.inr (Or.inr (Or.inl
          ⟨hcenters, hsource₁Row, hsource₂Row, hij⟩)))
    · exact Or.inr (Or.inr (Or.inl
        ⟨hcenters, hsource₁Row, hsource₂Row⟩))
  · exact Or.inr (Or.inl ⟨hcenters, hsource₁Row⟩)

end

end FreshThirdNoAlignmentLeanSplit
end ATailFrontierLiveClosure
end Problem97
