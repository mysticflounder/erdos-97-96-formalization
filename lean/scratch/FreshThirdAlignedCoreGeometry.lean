import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

/-!
# FreshThird aligned-core finite-ingress probe

Kernel-check the shell identities and two-circle bounds used by the v5
retained-arm diagnostic without promoting a new production interface.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

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
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})

include hfrontierInteriorEq hρInteriorEq T hpairsDisjoint in
/-- Kernel-checking surface for the source clauses used by the retained-arm
finite diagnostic.  A fixed cross-pair minimal core restores exactly the two
retained first-apex radius classes, and every canonical row meets either class
in at most two points. -/
theorem fixedDeletionCore_exactRetainedShells_and_rowBounds
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness
      (S := S) (H := H) P Pρ source)
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hpacket : FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source x y) :
    ∃ K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1,
      let sx : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨x, by simp⟩
      let sy : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨y, by simp⟩
      (K.shellAt sx).toCriticalFourShell.support =
          SelectedClass D.A S.oppApex1 radius ∧
        (K.shellAt sy).toCriticalFourShell.support =
          SelectedClass D.A S.oppApex1 ρ ∧
        Disjoint
          (K.shellAt sx).toCriticalFourShell.support
          (K.shellAt sy).toCriticalFourShell.support ∧
        source.1 ∉ (K.shellAt sx).toCriticalFourShell.support ∧
        source.1 ∉ (K.shellAt sy).toCriticalFourShell.support ∧
        (((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
              (K.shellAt sx).toCriticalFourShell.support).card ≤ 2) ∧
        (((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
              (K.shellAt sy).toCriticalFourShell.support).card ≤ 2) := by
  classical
  let K := Classical.choice hpacket.2.2.2.2
  let sx : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨x, by simp⟩
  let sy : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨y, by simp⟩
  have hxSelected : x ∈ SelectedClass D.A S.oppApex1 radius := by
    have hxIntersection :
        x ∈ SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      rw [hfrontierInteriorEq]
      exact hxPair
    exact (Finset.mem_inter.mp hxIntersection).1
  have hySelected : y ∈ SelectedClass D.A S.oppApex1 ρ := by
    have hyIntersection :
        y ∈ SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
      rw [hρInteriorEq]
      exact hyPair
    exact (Finset.mem_inter.mp hyIntersection).1
  have hxRadius :
      (K.shellAt sx).toCriticalFourShell.radius = radius := by
    exact
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore.shellAt_radius_eq
        K sx).trans (mem_selectedClass.mp hxSelected).2
  have hyRadius :
      (K.shellAt sy).toCriticalFourShell.radius = ρ := by
    exact
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore.shellAt_radius_eq
        K sy).trans (mem_selectedClass.mp hySelected).2
  have hxSupport :
      (K.shellAt sx).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius := by
    rw [(K.shellAt sx).toCriticalFourShell.support_eq, hxRadius]
    rfl
  have hySupport :
      (K.shellAt sy).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 ρ := by
    rw [(K.shellAt sy).toCriticalFourShell.support_eq, hyRadius]
    rfl
  have hxy : x ≠ y := by
    intro hxy
    subst y
    exact (Finset.disjoint_left.mp hpairsDisjoint) hxPair hyPair
  have hsxy : sx ≠ sy := by
    intro hsxy
    exact hxy (Subtype.ext_iff.mp hsxy)
  have hsourceNotX :
      source.1 ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hsourceSelected
    have hsourcePair :
        source.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← hfrontierInteriorEq]
      exact Finset.mem_inter.mpr ⟨hsourceSelected, hsource.2.1⟩
    exact hsource.2.2.1 (Finset.mem_union_left _ hsourcePair)
  have hsourceNotY :
      source.1 ∉ SelectedClass D.A S.oppApex1 ρ := by
    intro hsourceSelected
    have hsourcePair :
        source.1 ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [← hρInteriorEq]
      exact Finset.mem_inter.mpr ⟨hsourceSelected, hsource.2.1⟩
    exact hsource.2.2.1 (Finset.mem_union_right _ hsourcePair)
  refine ⟨K, hxSupport, hySupport,
    K.supports_pairwise_disjoint sx sy hsxy, ?_, ?_, ?_, ?_⟩
  · rw [hxSupport]
    exact hsourceNotX
  · rw [hySupport]
    exact hsourceNotY
  · rw [hxSupport]
    exact criticalShell_inter_selectedClass_card_le_two_of_apexRich
      H source.1 source.2 T.oppApex1_rich radius
  · rw [hySupport]
    exact criticalShell_inter_selectedClass_card_le_two_of_apexRich
      H source.1 source.2 T.oppApex1_rich ρ

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
