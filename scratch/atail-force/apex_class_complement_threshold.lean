/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Opposite-apex class complement threshold

This scratch module isolates the strongest direct cap/cardinality consequence
of an exact five-point class at the first opposite apex.  The surplus-cap
one-hit bounds leave at least four members of that class outside the surplus
cap.  Hence a second-apex class whose cardinality is at least the size of the
off-surplus carrier minus one must meet it twice.  The resulting double-apex
pair is forbidden by the existing reflection theorem.

Thus, in any surviving branch, every second-apex class has cardinality at
most `|A \ surplusCap| - 2`.  At carrier card twelve this means at most four
when the surplus cap has cardinality six, and at most five when it has
cardinality five.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILApexClassComplementThresholdScratch

private theorem two_le_inter_of_five_and_one_hits
    {α : Type*} [DecidableEq α]
    (Omega F G S : Finset α)
    (hFsub : F ⊆ Omega ∪ S) (hGsub : G ⊆ Omega ∪ S)
    (hFcard : F.card = 5)
    (hFS : (F ∩ S).card ≤ 1) (hGS : (G ∩ S).card ≤ 1)
    (hthreshold : Omega.card ≤ G.card + 1) :
    2 ≤ ((F ∩ G) \ S).card := by
  let TF := F \ S
  let TG := G \ S
  have hTFsub : TF ⊆ Omega := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxF, hxS⟩
    rcases Finset.mem_union.mp (hFsub hxF) with hxO | hxS'
    · exact hxO
    · exact False.elim (hxS hxS')
  have hTGsub : TG ⊆ Omega := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxG, hxS⟩
    rcases Finset.mem_union.mp (hGsub hxG) with hxO | hxS'
    · exact hxO
    · exact False.elim (hxS hxS')
  have hTFfour : 4 ≤ TF.card := by
    have hsplit := Finset.card_sdiff_add_card_inter F S
    change 4 ≤ (F \ S).card
    omega
  have hGle : G.card ≤ TG.card + 1 := by
    have hsplit := Finset.card_sdiff_add_card_inter G S
    change G.card ≤ (G \ S).card + 1
    omega
  have hunionSub : TF ∪ TG ⊆ Omega := Finset.union_subset hTFsub hTGsub
  have hunionCard : (TF ∪ TG).card ≤ Omega.card :=
    Finset.card_le_card hunionSub
  have hsplit := Finset.card_union_add_card_inter TF TG
  have hinter : 2 ≤ (TF ∩ TG).card := by
    omega
  have heq : TF ∩ TG = (F ∩ G) \ S := by
    ext x
    simp [TF, TG, and_assoc, and_left_comm, and_comm]
  simpa [heq] using hinter

/-- A first-apex five-class and a sufficiently large second-apex class force
the forbidden double-apex pair. -/
theorem false_of_firstApex_card_five_secondApex_complement_threshold
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r rho : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5)
    (hthreshold :
      (D.A \ S.surplusCap).card ≤
        (D.A.filter fun x => dist x S.oppApex2 = rho).card + 1) :
    False := by
  classical
  let F := D.A.filter fun x => dist x S.oppApex1 = r
  let G := D.A.filter fun x => dist x S.oppApex2 = rho
  let Omega := D.A \ S.surplusCap
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFsub : F ⊆ Omega ∪ S.surplusCap := by
    intro x hx
    have hxA : x ∈ D.A := (Finset.mem_filter.mp hx).1
    by_cases hxS : x ∈ S.surplusCap
    · exact Finset.mem_union.mpr (Or.inr hxS)
    · exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_sdiff.mpr ⟨hxA, hxS⟩))
  have hGsub : G ⊆ Omega ∪ S.surplusCap := by
    intro x hx
    have hxA : x ∈ D.A := (Finset.mem_filter.mp hx).1
    by_cases hxS : x ∈ S.surplusCap
    · exact Finset.mem_union.mpr (Or.inr hxS)
    · exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_sdiff.mpr ⟨hxA, hxS⟩))
  have hFS : (F ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, F] using
      Problem97.U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hGS : (G ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, G] using
      Problem97.U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit DS rho
  have htwo : 2 ≤ ((F ∩ G) \ S.surplusCap).card :=
    two_le_inter_of_five_and_one_hits Omega F G S.surplusCap
      hFsub hGsub (by simpa [F] using hfirst) hFS hGS
      (by simpa [Omega, G] using hthreshold)
  have hone : 1 < ((F ∩ G) \ S.surplusCap).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxFG, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwFG, hwOff⟩
  rcases Finset.mem_inter.mp hxFG with ⟨hxF, hxG⟩
  rcases Finset.mem_inter.mp hwFG with ⟨hwF, hwG⟩
  rcases Finset.mem_filter.mp hxF with ⟨hxA, hxFirst⟩
  rcases Finset.mem_filter.mp hwF with ⟨hwA, hwFirst⟩
  have hxSecond := (Finset.mem_filter.mp hxG).2
  have hwSecond := (Finset.mem_filter.mp hwG).2
  exact
    U1LargeCapRouteBTailMetricResidualTarget.U2NonSurplusSqueeze.oppCap2_escape_gen
      D S hxA hwA hxOff hwOff hxw
      hxFirst hwFirst hxSecond hwSecond

/-- Contrapositive size bound for every second-apex radius class in the
first-apex card-five branch. -/
theorem secondApex_class_card_add_two_le_complement
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r rho : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5) :
    (D.A.filter fun x => dist x S.oppApex2 = rho).card + 2 ≤
      (D.A \ S.surplusCap).card := by
  by_contra hbound
  have hthreshold :
      (D.A \ S.surplusCap).card ≤
        (D.A.filter fun x => dist x S.oppApex2 = rho).card + 1 := by
    omega
  exact false_of_firstApex_card_five_secondApex_complement_threshold
    D S hfirst hthreshold

/-- Exact finite incidence shadow for the remaining threshold gap.

The three closed caps have the card-twelve `(5,5,5)` profile, cover the
carrier, have the standard pairwise-singleton/triple-empty overlap pattern,
and two five-point classes each have one surplus hit.  Nevertheless their
off-surplus intersection has cardinality only one.  This is a countermodel to
closure from these incidence/cardinality fields alone, not a Euclidean
realizability claim. -/
theorem pure_cap_count_shadow :
    ∃ C0 C1 C2 F G : Finset (Fin 12),
      C0.card = 5 ∧ C1.card = 5 ∧ C2.card = 5 ∧
      C0 ∪ C1 ∪ C2 = Finset.univ ∧
      (C0 ∩ C1).card = 1 ∧ (C1 ∩ C2).card = 1 ∧
      (C2 ∩ C0).card = 1 ∧ (C0 ∩ C1 ∩ C2).card = 0 ∧
      F.card = 5 ∧ G.card = 5 ∧
      (F ∩ C0).card = 1 ∧ (G ∩ C0).card = 1 ∧
      ((F ∩ G) \ C0).card = 1 := by
  refine ⟨{0, 1, 5, 6, 7}, {1, 2, 8, 9, 10},
    {0, 2, 3, 4, 11}, {5, 2, 3, 4, 8}, {6, 8, 9, 10, 11}, ?_⟩
  decide

#print axioms two_le_inter_of_five_and_one_hits
#print axioms false_of_firstApex_card_five_secondApex_complement_threshold
#print axioms secondApex_class_card_add_two_le_complement
#print axioms pure_cap_count_shadow

end ATAILApexClassComplementThresholdScratch
end Problem97
