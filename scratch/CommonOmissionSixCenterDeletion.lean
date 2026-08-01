import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.FirstFiberOverlapDescent
import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer

/-!
# Common-omission six-center deletion package

Scratch-only checked extraction for the open common-endpoint arm in
`ATail/FrontierLiveClosure.lean`.  A collision endpoint omitted by both
cap-source rows gives a common deletion at their two blocker centers.  The
localized collision packets add the first Moser apex and the opposite
collision blocker, while the two robust apex inputs add the remaining Moser
apices.

For a non-anchored collision endpoint, the only residual is that the relevant
mutual-omission cycle selected the other endpoint.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ScratchCommonOmissionSixCenterDeletion

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer

attribute [local instance] Classical.propDecidable

/-- The exact source witness exposed by the live cap-eight first-fiber route. -/
abbrev FirstFiberCapSourceWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  8 ≤ (S.capByIndex S.oppIndex1).card ∧
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    source.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support.card = 4 ∧
    CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
    CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂

/-- The two cap-source rows contain one another's sources. -/
abbrev TwoCapSourcesMutualCrossMembership
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  source'.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    source.1 ∈
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.support

/-- Explicit pairwise distinctness for six named centers. -/
abbrev PairwiseDistinctSix
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  c₀ ≠ c₁ ∧ c₀ ≠ c₂ ∧ c₀ ≠ c₃ ∧ c₀ ≠ c₄ ∧ c₀ ≠ c₅ ∧
    c₁ ≠ c₂ ∧ c₁ ≠ c₃ ∧ c₁ ≠ c₄ ∧ c₁ ≠ c₅ ∧
    c₂ ≠ c₃ ∧ c₂ ≠ c₄ ∧ c₂ ≠ c₅ ∧
    c₃ ≠ c₄ ∧ c₃ ≠ c₅ ∧ c₄ ≠ c₅

/-- One deletion preserves exact-four rows at six pairwise-distinct centers. -/
abbrev SixDistinctCenterDeletionSurvival
    (D : CounterexampleData) (deleted c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  PairwiseDistinctSix c₀ c₁ c₂ c₃ c₄ c₅ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₀ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₁ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₂ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₃ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₄ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₅

/-- The endpoint-specific six-center package.  The opposite blocker is the
second collision blocker when deleting a `P` endpoint, and conversely. -/
abbrev EndpointSpecificSixCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (z : ℝ²) : Prop :=
  (z = P.source₁ ∧
      SixDistinctCenterDeletionSurvival D z
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex) ∨
    (z = Pρ.source₁ ∧
      SixDistinctCenterDeletionSurvival D z
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex) ∨
    (z = P.source₂ ∧
      SixDistinctCenterDeletionSurvival D z
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex) ∨
    (z = Pρ.source₂ ∧
      SixDistinctCenterDeletionSurvival D z
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex)

private theorem apices_pairwise
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 ∧
      S.oppApex1 ≠ S.surplusApex ∧
      S.oppApex2 ≠ S.surplusApex := by
  have h12 := S.triangle.v12_ne
  have h21 := h12.symm
  have h23 := S.triangle.v23_ne
  have h32 := h23.symm
  have h13 := S.triangle.v13_ne
  have h31 := h13.symm
  generalize hidx : S.surplusIdx = idx
  fin_cases idx <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusApex, hidx, h12, h21, h23, h32, h13, h31]

/-- A common omitted collision endpoint yields six pairwise-distinct robust
centers surviving its deletion, except precisely when a non-anchored omitted
endpoint disagrees with the endpoint selected by its mutual-omission cycle.

The two robust inputs are exactly the projections supplied in the live route
by `T.oppApex2_rich` and `T.surplusApex_rich`. -/
theorem endpointSpecificSixCenterDeletion_of_commonOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (R₂ : FullyDeletionRobustAt D S.oppApex2)
    (R₃ : FullyDeletionRobustAt D S.surplusApex)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe : H.blockerVertex source ≠ H.blockerVertex source')
    (z : ℝ²)
    (hzPairs :
      z ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}))
    (hzSource :
      z ∉ (H.selectedAt source.1
        source.2).toCriticalFourShell.support)
    (hzSource' :
      z ∉ (H.selectedAt source'.1
        source'.2).toCriticalFourShell.support) :
    EndpointSpecificSixCenterDeletion P Pρ source source' z ∨
      (z = P.source₂ ∧ MPρ.collisionSource = P.source₁) ∨
      (z = Pρ.source₂ ∧ MP.collisionSource = Pρ.source₁) := by
  rcases hsource with
    ⟨_, _, _, hcP, hcPρ, hcApex1, hcApex2, _, _, _, _⟩
  rcases hsource' with
    ⟨_, _, _, hcP', hcPρ', hcApex1', hcApex2', _, _, _, _⟩
  rcases hmutual with ⟨_, _⟩
  have hcSurplus :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    R₃.centerAt_ne H source.1 source.2
  have hcSurplus' :
      H.centerAt source'.1 source'.2 ≠ S.surplusApex :=
    R₃.centerAt_ne H source'.1 source'.2
  have hcNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro h
    apply hblockersNe
    apply Subtype.ext
    exact h
  have hapices := apices_pairwise S
  have hdistinctP :
      PairwiseDistinctSix
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex := by
    exact
      ⟨hcNe, hcApex1, hcP, hcApex2, hcSurplus,
        hcApex1', hcP', hcApex2', hcSurplus',
        LPρ.packet.centers_ne,
        hapices.1, hapices.2.1,
        R₂.centerAt_ne H P.source₁ P.source₁_mem_A,
        R₃.centerAt_ne H P.source₁ P.source₁_mem_A,
        hapices.2.2⟩
  have hdistinctPρ :
      PairwiseDistinctSix
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)
        S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex := by
    exact
      ⟨hcNe, hcApex1, hcPρ, hcApex2, hcSurplus,
        hcApex1', hcPρ', hcApex2', hcSurplus',
        LP.packet.centers_ne,
        hapices.1, hapices.2.1,
        R₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A,
        R₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A,
        hapices.2.2⟩
  have hzAtSource :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt source.1 source.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H source.2).2 hzSource
  have hzAtSource' :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt source'.1 source'.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H source'.2).2 hzSource'
  simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hzPairs
  rcases hzPairs with (rfl | rfl) | (rfl | rfl)
  · left
    left
    refine ⟨rfl, hdistinctPρ, hzAtSource, hzAtSource', ?_, ?_, ?_, ?_⟩
    · simpa only [hLP] using LP.packet.survives₁
    · simpa only [hLP] using LP.packet.survives₂
    · exact R₂.survives P.source₁ P.source₁_mem_A
    · exact R₃.survives P.source₁ P.source₁_mem_A
  · rcases MPρ.collisionSource_eq with hfirst | hsecond
    · right
      left
      exact ⟨rfl, hfirst⟩
    · left
      right
      right
      left
      refine ⟨rfl, hdistinctPρ, hzAtSource, hzAtSource', ?_, ?_, ?_, ?_⟩
      · simpa only [hsecond] using MPρ.collisionSourcePacket.survives₁
      · simpa only [hsecond, hLPρ] using
          MPρ.collisionSourcePacket.survives₂
      · exact R₂.survives P.source₂ P.source₂_mem_A
      · exact R₃.survives P.source₂ P.source₂_mem_A
  · left
    right
    left
    refine ⟨rfl, hdistinctP, hzAtSource, hzAtSource', ?_, ?_, ?_, ?_⟩
    · simpa only [hLPρ] using LPρ.packet.survives₁
    · simpa only [hLPρ] using LPρ.packet.survives₂
    · exact R₂.survives Pρ.source₁ Pρ.source₁_mem_A
    · exact R₃.survives Pρ.source₁ Pρ.source₁_mem_A
  · rcases MP.collisionSource_eq with hfirst | hsecond
    · right
      right
      exact ⟨rfl, hfirst⟩
    · left
      right
      right
      right
      refine ⟨rfl, hdistinctP, hzAtSource, hzAtSource', ?_, ?_, ?_, ?_⟩
      · simpa only [hsecond] using MP.collisionSourcePacket.survives₁
      · simpa only [hsecond, hLP] using
          MP.collisionSourcePacket.survives₂
      · exact R₂.survives Pρ.source₂ Pρ.source₂_mem_A
      · exact R₃.survives Pρ.source₂ Pρ.source₂_mem_A

end ScratchCommonOmissionSixCenterDeletion
end Problem97
