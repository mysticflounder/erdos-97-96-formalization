import Erdos9796Proof.P97.ATail.MinimalDeletionCore
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover

/-!
# Non-singleton minimal-deletion cores are robust

Scratch-only classification of the production `MinimalDeletionCore` arm.
Two sources give two support-disjoint exact selected four-classes at the core
center.  Hence that center is fully deletion robust and cannot be a
unique-four center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstFiberGlobalTerminal

open ATAILStageOneMinimalDeletionCore

attribute [local instance] Classical.propDecidable

theorem fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two
    {D : CounterexampleData} {U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A U center)
    (hUcard : 2 ≤ U.card) :
    FullyDeletionRobustAt D center := by
  have hone : 1 < U.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hs, t, ht, hst⟩
  let sU : {x : ℝ² // x ∈ U} := ⟨s, hs⟩
  let tU : {x : ℝ² // x ∈ U} := ⟨t, ht⟩
  have hstU : sU ≠ tU := by
    intro heq
    exact hst (congrArg Subtype.val heq)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    (K.shellAt sU).toSelectedFourClass
    (K.shellAt tU).toSelectedFourClass
    (by
      simpa [CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using
        K.supports_pairwise_disjoint sU tU hstU)

theorem not_isUniqueFourCenter_of_minimalDeletionCore_card_ge_two
    {D : CounterexampleData} {U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A U center)
    (hUcard : 2 ≤ U.card) :
    ¬ IsUniqueFourCenter D.A center :=
  not_isUniqueFourCenter_of_fullyDeletionRobust
    (fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two K hUcard)

end FirstFiberGlobalTerminal
end Problem97
