import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Equal-blocker complementary-membership scratch terminal

The complementary collision-endpoint choices become six distinct points on
one four-point selected support when the two cap-source blockers are equal.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
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
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal
namespace EqualBlockerComplementaryScratch

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

/-- Equal actual blockers turn the complementary choices for both collision
pairs into all four endpoints on one support.  Together with the two distinct
mutually incident cap sources this would put six distinct points on a support
of cardinality four. -/
theorem false_of_equalBlockers_complementaryMembership
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersEq :
      H.blockerVertex source = H.blockerVertex source')
    (hcomplementary :
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)))) :
    False := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  change
    (((P.source₁ ∈ K ∧ P.source₂ ∈ K') ∨
        (P.source₂ ∈ K ∧ P.source₁ ∈ K')) ∧
      ((Pρ.source₁ ∈ K ∧ Pρ.source₂ ∈ K') ∨
        (Pρ.source₂ ∈ K ∧ Pρ.source₁ ∈ K'))) at hcomplementary
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val hblockersEq
  have hsupportsEq : K = K' := by
    exact
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 source'.2 hcentersEq
  rcases hsource with
    ⟨_, _, hsourceOutside, _, _, _, _, hsourceMem, hsupportCard, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  change source.1 ∈ K at hsourceMem
  change K.card = 4 at hsupportCard
  have hsource'Mem : source'.1 ∈ K := hmutual.1
  have hP₁Mem : P.source₁ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hP₂Mem : P.source₂ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hPρ₁Mem : Pρ.source₁ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hPρ₂Mem : Pρ.source₂ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hsourceNeP₁ : source.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNeP₂ : source.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₁ : source.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₂ : source.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsource'NeP₁ : source'.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NeP₂ : source'.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₁ : source'.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₂ : source'.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hP₁NotPairρ :
      P.source₁ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₂NotPairρ :
      P.source₂ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₁NePρ₁ : P.source₁ ≠ Pρ.source₁ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₁NePρ₂ : P.source₁ ≠ Pρ.source₂ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₂NePρ₁ : P.source₂ ≠ Pρ.source₁ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  have hP₂NePρ₂ : P.source₂ ≠ Pρ.source₂ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  let six : Finset ℝ² :=
    {source.1, source'.1,
      P.source₁, P.source₂, Pρ.source₁, Pρ.source₂}
  have hsixSubset : six ⊆ K := by
    intro x hx
    simp only [six, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl
    · exact hsourceMem
    · exact hsource'Mem
    · exact hP₁Mem
    · exact hP₂Mem
    · exact hPρ₁Mem
    · exact hPρ₂Mem
  have hsixCard : six.card = 6 := by
    simp [six, hsourcesNe,
      hsourceNeP₁, hsourceNeP₂, hsourceNePρ₁, hsourceNePρ₂,
      hsource'NeP₁, hsource'NeP₂, hsource'NePρ₁, hsource'NePρ₂,
      P.sources_ne, Pρ.sources_ne,
      hP₁NePρ₁, hP₁NePρ₂, hP₂NePρ₁, hP₂NePρ₂]
  have hcardLe : six.card ≤ K.card :=
    Finset.card_le_card hsixSubset
  rw [hsixCard, hsupportCard] at hcardLe
  omega

end

end EqualBlockerComplementaryScratch
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
