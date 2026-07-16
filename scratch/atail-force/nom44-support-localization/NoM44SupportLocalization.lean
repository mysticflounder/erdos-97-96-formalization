import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# No-M44 support-localization audit (scratch)

This file checks two exact boundaries for the live ATAIL critical-pair
frontier.

* A fixed second-apex selected four-class has at most one point in the
  off-surplus first-apex marginal.  Therefore a two-hit lower bound is already
  a contradiction, not an intermediate incidence fact.
* Once a non-surplus cap has cardinality at least five, the fixed surplus-cap
  packet is already known not to be `IsM44`; no support-localization statement
  follows merely by reusing that local cardinality consequence.

The file is scratch-only and is not imported by the production tree.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailNoM44SupportLocalization

open ATailCriticalPairFrontier

/-- Any selected four-class at the second opposite apex has at most one
member in a fixed off-surplus first-apex marginal. -/
theorem secondApexFourClass_inter_firstApexMarginal_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (K2 : SelectedFourClass D.A S.oppApex2) :
    (K2.support ∩
      ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap)).card ≤ 1 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \
    S.surplusCap
  have hsub :
      K2.support ∩ T ⊆
        T.filter fun x => x ∈ SelectedClass D.A S.oppApex2 K2.radius := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxK2, hxT⟩
    refine Finset.mem_filter.mpr ⟨hxT, ?_⟩
    exact mem_selectedClass.mpr
      ⟨K2.support_subset_A hxK2, K2.support_eq_radius x hxK2⟩
  have hupper :
      (T.filter fun x =>
        x ∈ SelectedClass D.A S.oppApex2 K2.radius).card ≤ 1 := by
    simpa [T] using
      firstApex_marginal_inter_secondClass_card_le_one
        D S r K2.radius
  exact (Finset.card_le_card hsub).trans hupper

/-- The proposed direct two-hit output is already contradiction-strength. -/
theorem false_of_secondApexFourClass_two_hits_firstApexMarginal
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (K2 : SelectedFourClass D.A S.oppApex2)
    (htwo :
      2 ≤ (K2.support ∩
        ((D.A.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap)).card) :
    False := by
  have hone :=
    secondApexFourClass_inter_firstApexMarginal_card_le_one D S r K2
  omega

/-- A non-surplus cap of cardinality at least five already refutes `IsM44`
for the fixed surplus-cap packet.  This is the local packet consequence used
when no-`M44` produces the second large cap. -/
theorem not_isM44_of_nonSurplus_cap_card_ge_five
    {A : Finset ℝ²} (S : SurplusCapPacket A) (j : Fin 3)
    (hjne : j ≠ S.surplusIdx)
    (hj5 : 5 ≤ (S.capByIndex j).card) :
    ¬ S.IsM44 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    fin_cases j <;>
    simp only [SurplusCapPacket.IsM44, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, SurplusCapPacket.capByIndex, hi] at hjne hj5 ⊢ <;>
    omega

#print axioms
  Problem97.ATailNoM44SupportLocalization.secondApexFourClass_inter_firstApexMarginal_card_le_one
#print axioms
  Problem97.ATailNoM44SupportLocalization.false_of_secondApexFourClass_two_hits_firstApexMarginal
#print axioms
  Problem97.ATailNoM44SupportLocalization.not_isM44_of_nonSurplus_cap_card_ge_five

end ATailNoM44SupportLocalization
end Problem97
