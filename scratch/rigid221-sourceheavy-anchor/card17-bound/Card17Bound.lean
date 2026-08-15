import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement
import Erdos9796Proof.P97.CapSelectedRowCounting

/-! # Scratch card-17 bound for the rigid-221 second-opposite branch -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open CapSelectedRowCounting

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The card-17 counting kernel.  The explicit budget is exactly the field
carried by `ExactFourSecondOppositeCapGrowth`; it is not implied merely by
`6 ≤ S.oppCap2.card`. -/
theorem card_le_seventeen_of_secondOpposite_exactBudget
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hbudget : S.oppCap2.card + 6 = D.A.card) :
    D.A.card ≤ 17 := by
  classical
  rcases exists_faithfulCarrierPattern_of_globalK4 D.K4 P.u.2 with ⟨G⟩
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcount :=
    orderedCap_card_add_four_le_choose_outside
      Packet Hside Hord D.convex G
  have hcap' : Finset.univ.image L.points = S.oppCap2 := by
    rw [hcap, capByIndex_oppIndex2_eq_oppCap2 S]
  have himageCard : (Finset.univ.image L.points).card = m := by
    rw [Finset.card_image_of_injective _ L.injective, Finset.card_univ,
      Fintype.card_fin]
  have hm : m = S.oppCap2.card := by
    rw [hcap'] at himageCard
    exact himageCard.symm
  have hsubset : S.oppCap2 ⊆ D.A := by
    rw [← capByIndex_oppIndex2_eq_oppCap2 S]
    exact S.capByIndex_subset S.oppIndex2
  have houtside : (D.A \ S.oppCap2).card = 6 := by
    rw [Finset.card_sdiff_of_subset hsubset]
    omega
  have hcount' :
      S.oppCap2.card + 4 ≤ Nat.choose 6 2 := by
    calc
      S.oppCap2.card + 4 = m + 4 := by omega
      _ ≤ Nat.choose (D.A \ Finset.univ.image L.points).card 2 := hcount
      _ = Nat.choose 6 2 := by rw [hcap', houtside]
  norm_num [Nat.choose] at hcount'
  omega

/-- The requested bound when `P.surface.capGrowth` is known to be its exact
second-opposite constructor. -/
theorem card_le_seventeen_of_secondOpposite_growthArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond : 6 ≤ S.oppCap2.card)
    (profile : ExactFourSecondOppositeCapGrowth S)
    (hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile) :
    D.A.card ≤ 17 := by
  have _ := hgrowth
  have hcapSum := S.capSum
  have hexact := profile.secondOppCap_card_add_six_eq_carrier
  have hbudget : S.oppCap2.card + 6 = D.A.card := by
    rw [profile.surplusCap_card_eq_five,
      profile.firstOppCap_card_eq_four] at hcapSum
    omega
  exact card_le_seventeen_of_secondOpposite_exactBudget P hsecond hbudget

/-- `P.surface.capGrowth` yields the card bound whenever it is identified with
its exact second-opposite constructor.  The active lower bound alone does not
supply such an identification. -/
theorem capGrowth_secondOpposite_implies_card_le_seventeen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond : 6 ≤ S.oppCap2.card) :
    ∀ profile : ExactFourSecondOppositeCapGrowth S,
      P.surface.capGrowth = ExactFourRobustCapGrowth.secondOpposite profile →
        D.A.card ≤ 17 := by
  intro profile hgrowth
  exact card_le_seventeen_of_secondOpposite_growthArm
    P hsecond profile hgrowth

#print axioms card_le_seventeen_of_secondOpposite_exactBudget
#print axioms card_le_seventeen_of_secondOpposite_growthArm
#print axioms capGrowth_secondOpposite_implies_card_le_seventeen

end ATailFrontierLiveClosure
end Problem97
