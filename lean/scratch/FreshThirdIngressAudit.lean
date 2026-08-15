import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdPinnedFanPacket
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceTripleShellEscape
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdRetainedProducer
import Erdos9796Proof.P97.ATail.FirstApexInteriorPairGeometry
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.SelectedFourGeometry
import Erdos9796Proof.P97.ATail.TwoTripleRowSixPointEuclideanObstruction
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

namespace Problem97.ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion ATailGlobalMinimalDeletion
open ATailMinimalUniqueFourCover ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailCriticalSystemRebase ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

#check FrontierAllLargeCapsTriApexRobustResidual.oppApex1_rich
#print axioms fourth_fiber_or_larger_known_fiber_of_four_omissions

namespace TwoSourceExactCollisionRowsTerminal

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint : Disjoint ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
theorem audit_freshThird_fourOmissionBlockerMultiplicityIngress
    (Q : FreshThirdBlockerFiber P Pρ)
    {center : ℝ²}
    (hcenterA : center ∈ D.A)
    (hrobust : FullyDeletionRobustAt D center)
    (hcenterNeOpp₁ : center ≠ S.oppApex1)
    (hcenterNeOpp₂ : center ≠ S.oppApex2)
    (hcenterNeSurplus : center ≠ S.surplusApex) :
    (∃ x y, x ≠ y ∧ H.blockerVertex x = H.blockerVertex y ∧
        H.blockerVertex x ≠ H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠ H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠ H.blockerVertex Q.source₁) ∨
      (∃ x, x ≠ ⟨P.source₁, P.source₁_mem_A⟩ ∧
        x ≠ ⟨P.source₂, P.source₂_mem_A⟩ ∧
        H.blockerVertex x = H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩) ∨
      (∃ x, x ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        x ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩ ∧
        H.blockerVertex x = H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) ∨
      ∃ x, x ≠ Q.source₁ ∧ x ≠ Q.source₂ ∧
        H.blockerVertex x = H.blockerVertex Q.source₁ := by
  classical
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  let centerVertex : CriticalShellSystem.CarrierVertex D.A := ⟨center, hcenterA⟩
  let a₁ : CriticalShellSystem.CarrierVertex D.A := ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A := ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A := ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have homitted₁ : ∀ x, H.blockerVertex x ≠ apex₁ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H x apex₁.2
  have homitted₂ : ∀ x, H.blockerVertex x ≠ apex₂ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H x apex₂.2
  have homitted₃ : ∀ x, H.blockerVertex x ≠ apex₃ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H x apex₃.2
  have homitted₄ : ∀ x, H.blockerVertex x ≠ centerVertex := by
    intro x
    exact hrobust.blockerVertex_ne H x hcenterA
  have hapex₁₂ : apex₁ ≠ apex₂ := by
    intro h
    exact (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
      (by simpa [apex₁, apex₂] using congrArg Subtype.val h)
  have hapex₁₃ : apex₁ ≠ apex₃ := by
    intro h
    exact (S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1).symm
      (by simpa [apex₁, apex₃] using congrArg Subtype.val h)
  have hapex₂₃ : apex₂ ≠ apex₃ := by
    intro h
    exact (S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2).symm
      (by simpa [apex₂, apex₃] using congrArg Subtype.val h)
  have hapex₁₄ : apex₁ ≠ centerVertex := by
    intro h
    exact hcenterNeOpp₁ (by simpa [apex₁, centerVertex] using congrArg Subtype.val h.symm)
  have hapex₂₄ : apex₂ ≠ centerVertex := by
    intro h
    exact hcenterNeOpp₂ (by simpa [apex₂, centerVertex] using congrArg Subtype.val h.symm)
  have hapex₃₄ : apex₃ ≠ centerVertex := by
    intro h
    exact hcenterNeSurplus (by simpa [apex₃, centerVertex] using congrArg Subtype.val h.symm)
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  have hfc : H.blockerVertex Q.source₁ = H.blockerVertex Q.source₂ := Q.blockers_eq
  have hvaluesAB : H.blockerVertex a₁ ≠ H.blockerVertex b₁ := by
    intro h
    apply hblockersNe
    exact congrArg Subtype.val h.symm
  have hvaluesAC : H.blockerVertex a₁ ≠ H.blockerVertex Q.source₁ := Ne.symm Q.blocker_ne_first
  have hvaluesBC : H.blockerVertex b₁ ≠ H.blockerVertex Q.source₁ := Ne.symm Q.blocker_ne_second
  simpa [a₁, a₂, b₁, b₂] using
    (fourth_fiber_or_larger_known_fiber_of_four_omissions
      H.blockerVertex homitted₁ homitted₂ homitted₃ homitted₄
      hapex₁₂ hapex₁₃ hapex₁₄ hapex₂₃ hapex₂₄ hapex₃₄
      hfa hfb hfc hvaluesAB hvaluesAC hvaluesBC)

#print axioms audit_freshThird_fourOmissionBlockerMultiplicityIngress

end TwoSourceExactCollisionRowsTerminal
end Problem97.ATailFrontierLiveClosure
