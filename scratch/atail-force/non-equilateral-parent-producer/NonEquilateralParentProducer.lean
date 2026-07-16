/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import NonEquilateralContinuation

/-!
# Scratch: the checked non-equilateral parent frontier

This file attacks the proposed strict-`oppCap1` common-hit producer at the
strongest surface currently exposed by the continuation dispatcher.  The
common hit itself does not follow from the row and cap data.  What does follow
is an exact support dichotomy:

* either one native continuation row has at least two surplus-cap members; or
* the two rows have distinct, mutually exclusive witnesses in strict
  `oppCap1`.

The proof retains the original selected rows.  In the second arm, exclusivity
uses the non-equilateral equal-radius residual and the existing ordered-cap
terminal: a strict point cannot lie in both rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailNonEquilateralParentProducerScratch

open ATailContinuationGeometryClassifier
open ATailContinuationBankMatchScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralContinuationScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The strict part of the first opposite cap, after deleting both adjacent
closed caps. -/
noncomputable def strictOppCap1Region {A : Finset ℝ²} (S : SurplusCapPacket A) :
    Finset ℝ² :=
  S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

private theorem mem_some_cap
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {x : ℝ²} (hxA : x ∈ A) :
    x ∈ CP.C1 ∨ x ∈ CP.C2 ∨ x ∈ CP.C3 := by
  by_contra hnone
  have hC1 : x ∉ CP.C1 := by
    intro hx
    exact hnone (Or.inl hx)
  have hC2 : x ∉ CP.C2 := by
    intro hx
    exact hnone (Or.inr (Or.inl hx))
  have hC3 : x ∉ CP.C3 := by
    intro hx
    exact hnone (Or.inr (Or.inr hx))
  by_cases hxM : x ∈ M.verts
  · have htwo := CP.moser_in_two x hxM
    simp [hC1, hC2, hC3] at htwo
  · have hone := CP.nonmoser_in_one x hxA hxM
    simp [hC1, hC2, hC3] at hone

/-- Every carrier point outside `oppCap2` is either in the surplus cap or in
strict `oppCap1`.  This is the selector-normalized cap-cover fact used by the
row dichotomy below. -/
theorem mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) (hxOutside : x ∉ S.oppCap2) :
    x ∈ S.surplusCap ∨ x ∈ strictOppCap1Region S := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have hxOutside' : x ∉ S.partition.C3 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOutside
    by_cases hxSurplus : x ∈ S.partition.C1
    · exact Or.inl (by
        simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
    · have hxOpp1 : x ∈ S.partition.C2 := by
        rcases mem_some_cap S.partition hxA with hxC1 | hxC2 | hxC3
        · exact False.elim (hxSurplus hxC1)
        · exact hxC2
        · exact False.elim (hxOutside' hxC3)
      apply Or.inr
      have hxUnion : x ∉ S.partition.C1 ∪ S.partition.C3 := by
        intro hx
        rcases Finset.mem_union.mp hx with hxC1 | hxC3
        · exact hxSurplus hxC1
        · exact hxOutside' hxC3
      have hxRaw :
          x ∈ S.partition.C2 \ (S.partition.C1 ∪ S.partition.C3) :=
        Finset.mem_sdiff.mpr ⟨hxOpp1, hxUnion⟩
      simpa [strictOppCap1Region, SurplusCapPacket.oppCap1,
        SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi] using
        hxRaw
  · have hxOutside' : x ∉ S.partition.C1 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOutside
    by_cases hxSurplus : x ∈ S.partition.C2
    · exact Or.inl (by
        simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
    · have hxOpp1 : x ∈ S.partition.C3 := by
        rcases mem_some_cap S.partition hxA with hxC1 | hxC2 | hxC3
        · exact False.elim (hxOutside' hxC1)
        · exact False.elim (hxSurplus hxC2)
        · exact hxC3
      apply Or.inr
      have hxUnion : x ∉ S.partition.C2 ∪ S.partition.C1 := by
        intro hx
        rcases Finset.mem_union.mp hx with hxC2 | hxC1
        · exact hxSurplus hxC2
        · exact hxOutside' hxC1
      have hxRaw :
          x ∈ S.partition.C3 \ (S.partition.C2 ∪ S.partition.C1) :=
        Finset.mem_sdiff.mpr ⟨hxOpp1, hxUnion⟩
      simpa [strictOppCap1Region, SurplusCapPacket.oppCap1,
        SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi] using
        hxRaw
  · have hxOutside' : x ∉ S.partition.C2 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOutside
    by_cases hxSurplus : x ∈ S.partition.C3
    · exact Or.inl (by
        simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
    · have hxOpp1 : x ∈ S.partition.C1 := by
        rcases mem_some_cap S.partition hxA with hxC1 | hxC2 | hxC3
        · exact hxC1
        · exact False.elim (hxOutside' hxC2)
        · exact False.elim (hxSurplus hxC3)
      apply Or.inr
      have hxUnion : x ∉ S.partition.C3 ∪ S.partition.C2 := by
        intro hx
        rcases Finset.mem_union.mp hx with hxC3 | hxC2
        · exact hxSurplus hxC3
        · exact hxOutside' hxC2
      have hxRaw :
          x ∈ S.partition.C1 \ (S.partition.C3 ∪ S.partition.C2) :=
        Finset.mem_sdiff.mpr ⟨hxOpp1, hxUnion⟩
      simpa [strictOppCap1Region, SurplusCapPacket.oppCap1,
        SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi] using
        hxRaw

/-- A four-row with at least two members outside `oppCap2` either has two
surplus-cap members or has a strict-`oppCap1` member. -/
theorem selectedRow_surplusHeavy_or_strictOppCap1Hit
    {A : Finset ℝ²} (S : SurplusCapPacket A) {center : ℝ²}
    (R : SelectedFourClass A center)
    (htwo : 2 ≤ (R.support \ S.oppCap2).card) :
    2 ≤ (R.support ∩ S.surplusCap).card ∨
      ∃ x : ℝ², x ∈ R.support ∧ x ∈ strictOppCap1Region S := by
  by_cases hstrict :
      ∃ x : ℝ², x ∈ R.support ∧ x ∈ strictOppCap1Region S
  · exact Or.inr hstrict
  · left
    have hsub : R.support \ S.oppCap2 ⊆ R.support ∩ S.surplusCap := by
      intro x hx
      rcases Finset.mem_sdiff.mp hx with ⟨hxR, hxOutside⟩
      refine Finset.mem_inter.mpr ⟨hxR, ?_⟩
      rcases
          mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
            S (R.support_subset_A hxR) hxOutside with hxSurplus | hxStrict
      · exact hxSurplus
      · exact False.elim (hstrict ⟨x, hxR, hxStrict⟩)
    exact le_trans htwo (Finset.card_le_card hsub)

/-- The strongest checked native-support alternative for a non-equilateral
continuation. -/
noncomputable def NonEquilateralSupportDichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  2 ≤ (P.row₁.support ∩ S.surplusCap).card ∨
    2 ≤ (P.row₂.support ∩ S.surplusCap).card ∨
    ∃ x y : ℝ²,
      x ∈ P.row₁.support ∧
      x ∉ P.row₂.support ∧
      x ∈ strictOppCap1Region S ∧
      y ∈ P.row₂.support ∧
      y ∉ P.row₁.support ∧
      y ∈ strictOppCap1Region S ∧
      x ≠ y

/-- Non-equilateral equal-radius geometry turns the per-row cap alternatives
into a two-row dichotomy.  If neither row is surplus-heavy, their strict
first-cap witnesses are distinct and mutually exclusive: a common witness
would be the already-forbidden strict common hit. -/
theorem nonEquilateralSupportDichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    NonEquilateralSupportDichotomy P := by
  rcases selectedRow_surplusHeavy_or_strictOppCap1Hit S P.row₁
      P.two_le_row₁_support_outside_oppCap2 with hheavy₁ | ⟨x, hx₁, hxStrict⟩
  · exact Or.inl hheavy₁
  rcases selectedRow_surplusHeavy_or_strictOppCap1Hit S P.row₂
      P.two_le_row₂_support_outside_oppCap2 with hheavy₂ | ⟨y, hy₂, hyStrict⟩
  · exact Or.inr (Or.inl hheavy₂)
  · have hxNot₂ : x ∉ P.row₂.support := by
      intro hx₂
      exact false_of_nonEquilateral_of_strictOppCap1CommonHit N
        ⟨x, hx₁, hx₂, by simpa [strictOppCap1Region] using hxStrict⟩
    have hyNot₁ : y ∉ P.row₁.support := by
      intro hy₁
      exact false_of_nonEquilateral_of_strictOppCap1CommonHit N
        ⟨y, hy₁, hy₂, by simpa [strictOppCap1Region] using hyStrict⟩
    have hxy : x ≠ y := by
      intro h
      subst y
      exact hxNot₂ hy₂
    exact Or.inr (Or.inr
      ⟨x, y, hx₁, hxNot₂, hxStrict, hy₂, hyNot₁, hyStrict, hxy⟩)

/- ## Quantifier-correct continuation closure -/

/-- The eliminator for one *already selected* routed branch.  Unlike
`FrontierContinuationEliminators`, this asks only for the consumer matching
the branch carried by the chosen dispatch. -/
def RoutedBranchEliminator
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (_branch : RoutedContinuationBranch H P) : Prop :=
  (CrossSurvivalOutput P ∧ (CrossSurvivalOutput P → False)) ∨
    (NonEquilateralOutput H P ∧ (NonEquilateralOutput H P → False)) ∨
    (P.EquilateralResidual ∧ (P.EquilateralResidual → False))

/-- Choice-first closure at one concrete frontier.  Both the trimmed
second-apex row and the two continuation rows are selected before asking for
the single branch consumer that is actually needed. -/
def ChoiceFirstFrontierContinuationContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : ATailCriticalPairFrontier.CriticalPairFrontier D S r H) : Prop :=
  ∃ P : FrontierContinuationDispatch F,
    RoutedBranchEliminator P.branch

/-- Three callbacks for one chosen dispatch imply the branch-local
eliminator.  This is the exact bridge from
`ChosenContinuationEliminators` in `FavorableSystemParentSurface.lean` to the
branch-only operational surface here.  Once the dispatch already carries an
exhaustive branch, the downstream selector audit shows that this eliminator
is propositionally equivalent to `False`; the gain is construction order,
not logical strength. -/
theorem routedBranchEliminator_of_callbacks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (branch : RoutedContinuationBranch H P)
    (cross : CrossSurvivalOutput P → False)
    (nonEquilateral : NonEquilateralOutput H P → False)
    (equilateral : P.EquilateralResidual → False) :
    RoutedBranchEliminator branch := by
  rcases branch with hcross | hnon | heq
  · exact Or.inl ⟨hcross, cross⟩
  · exact Or.inr (Or.inl ⟨hnon, nonEquilateral⟩)
  · exact Or.inr (Or.inr ⟨heq, equilateral⟩)

/-- A choice-first frontier closure is sufficient.  No universal
quantification over alternative trimmed rows or alternative global-K4 row
choices is used. -/
theorem false_of_criticalPairFrontier_of_choiceFirstContinuationContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : ATailCriticalPairFrontier.CriticalPairFrontier D S r H)
    (C : ChoiceFirstFrontierContinuationContent F) : False := by
  rcases C with ⟨P, hclose⟩
  rcases hclose with ⟨hcross, close⟩ | ⟨hnon, close⟩ | ⟨heq, close⟩
  · exact close hcross
  · exact close hnon
  · exact close heq

/-- The old universal eliminator implies the choice-first interface.  This
adapter records the smaller choice-explicit construction order used by the
parent.  The reverse adapter is proved downstream via the common `False`
surface, so no strict logical-strength claim is intended here. -/
theorem choiceFirstContinuationContent_of_universalEliminators
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : ATailCriticalPairFrontier.CriticalPairFrontier D S r H)
    (E : FrontierContinuationEliminators F) :
    ChoiceFirstFrontierContinuationContent F := by
  rcases nonempty_frontierContinuationDispatch F with ⟨P⟩
  refine ⟨P, ?_⟩
  exact routedBranchEliminator_of_callbacks P.branch
    (E.crossSurvival P.secondApex P.rows)
    (E.nonEquilateral P.secondApex P.rows)
    (false_of_equilateralResidual_of_jointTransitionCoreEliminator
      D S H E.equilateralJoint P.rows)

#print axioms mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
#print axioms selectedRow_surplusHeavy_or_strictOppCap1Hit
#print axioms nonEquilateralSupportDichotomy
#print axioms routedBranchEliminator_of_callbacks
#print axioms false_of_criticalPairFrontier_of_choiceFirstContinuationContent
#print axioms choiceFirstContinuationContent_of_universalEliminators

end ATailNonEquilateralParentProducerScratch
end Problem97
