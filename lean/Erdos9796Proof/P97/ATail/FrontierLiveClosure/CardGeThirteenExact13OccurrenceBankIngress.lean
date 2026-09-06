/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge

/-!
# Source occurrence pair for exact-thirteen bank ingress

The exclusive-apex partition identifies a two-point L pair in the other blocker.
This adapter preserves that blocker's provider tag and the actual source order.
It supplies no finite bank or coverage theorem.
-/

namespace Problem97.ATailFrontierLiveClosure
namespace CardGeThirteenExact13OccurrenceBankIngress

open CardGeThirteenExact13SourceOrderBridge

/-- The exact double-erased L pair gives source-entitled candidates at L and at
its actual other blocker, with the orientation certified by the source ingress. -/
theorem exists_occurrence_other_shared_pair (I : Input) :
    ∃ (W : ExclusiveApex18SupportPartition I.toExclusive)
      (j : Exact13Provider) (a b : Fin 13) (o : Bool),
      W.ell ∈ I.O.Lraw.erase I.X.tightSupport.zraw ∧
      (j = .c0 ∨ j = .c1) ∧
      W.otherSupport = I.providerPattern.supportOf j ∧
      (I.O.Lraw.erase I.X.tightSupport.zraw).erase W.ell = {a, b} ∧
      a ≠ b ∧ sourceOrderValid I o ∧
      candidatePredicate I ⟨.l, a, b, o⟩ ∧
      candidatePredicate I ⟨j, a, b, o⟩ := by
  classical
  obtain ⟨o, ho⟩ : ∃ o, sourceOrderValid I o := by
    rcases I.P.orientation with hd | hm
    · exact ⟨false, hd⟩
    · exact ⟨true, hm⟩
  obtain ⟨W, hell⟩ := exists_exclusiveApex18SupportPartition I.toExclusive
  change W.ell ∈ I.O.Lraw.erase I.X.tightSupport.zraw at hell
  have hthree := ExclusiveApex18Input.Lraw_erase_zraw_card I.toExclusive
  change (I.O.Lraw.erase I.X.tightSupport.zraw).card = 3 at hthree
  have htwo : ((I.O.Lraw.erase I.X.tightSupport.zraw).erase W.ell).card = 2 := by
    rw [Finset.card_erase_of_mem hell, hthree]
  obtain ⟨a, b, hab, hpair⟩ := Finset.card_eq_two.mp htwo
  have ha : a ∈ (I.O.Lraw.erase I.X.tightSupport.zraw).erase W.ell := by
    rw [hpair]; simp
  have hb : b ∈ (I.O.Lraw.erase I.X.tightSupport.zraw).erase W.ell := by
    rw [hpair]; simp
  have haL : a ∈ I.O.Lraw := (Finset.mem_erase.mp (Finset.mem_erase.mp ha).2).2
  have hbL : b ∈ I.O.Lraw := (Finset.mem_erase.mp (Finset.mem_erase.mp hb).2).2
  have haOther : a ∈ W.otherSupport := by
    rw [W.other_eq]
    exact Finset.mem_union_left _ ha
  have hbOther : b ∈ W.otherSupport := by
    rw [W.other_eq]
    exact Finset.mem_union_left _ hb
  obtain ⟨j, hj, hother⟩ : ∃ j : Exact13Provider,
      (j = .c0 ∨ j = .c1) ∧ W.otherSupport = I.providerPattern.supportOf j := by
    rcases W.chosen_cases with h | h
    · exact ⟨.c1, Or.inr rfl, h.2⟩
    · exact ⟨.c0, Or.inl rfl, h.2⟩
  rw [hother] at haOther hbOther
  exact ⟨W, j, a, b, o, hell, hj, hother, hpair, hab, ho,
    ⟨ho, hab, haL, hbL⟩, ⟨ho, hab, haOther, hbOther⟩⟩

#print axioms exists_occurrence_other_shared_pair

end CardGeThirteenExact13OccurrenceBankIngress
end Problem97.ATailFrontierLiveClosure
