import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# One-row confinement adapter (scratch validation)

This file checks the exact conditional consumer isolated by the U5 bounded-
support audit.  It deliberately assumes only one new geometric fact: a
selected four-class at the second opposite apex is confined to the retained
critical row at `q` together with the off-surplus first-apex marginal.

This is a scratch theorem only.  It is not a producer for the confinement
hypothesis and is not imported by the production tree.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace ATailU5BoundedSupportBridge

open ATailCriticalPairFrontier

/-- One-row confinement is already strong enough to close the critical-pair
frontier.  The two-circle overlap bound leaves two points of `K2` outside the
retained critical row; confinement places both in the first-apex marginal,
where `U2NonSurplusSqueeze.oppCap2_escape_gen` gives the contradiction. -/
theorem false_of_secondApexClass_support_subset_blockerSupport_union_marginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K2 : SelectedFourClass D.A S.oppApex2)
    (hconf :
      K2.support ⊆
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support ∪
          ((D.A.filter fun x => dist x S.oppApex1 = r) \
            S.surplusCap)) :
    False := by
  classical
  let Kq : SelectedFourClass D.A
      (H.centerAt F.pair.q F.pair.q_mem_A) :=
    (H.selectedAt F.pair.q F.pair.q_mem_A).toSelectedFourClass
  let T : Finset ℝ² :=
    (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  have hconf' : K2.support ⊆ Kq.support ∪ T := by
    simpa [Kq, T] using hconf
  have hoverlap : (K2.support ∩ Kq.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two K2 Kq
      F.pair.q_blocker_ne_oppApex2.symm
  have hsplit :
      (K2.support \ Kq.support).card +
          (K2.support ∩ Kq.support).card = 4 := by
    rw [Finset.card_sdiff_add_card_inter, K2.support_card]
  have htwo : 2 ≤ (K2.support \ Kq.support).card := by
    omega
  have hdiffT : K2.support \ Kq.support ⊆ T := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxK2, hxNotKq⟩
    rcases Finset.mem_union.mp (hconf' hxK2) with hxKq | hxT
    · exact False.elim (hxNotKq hxKq)
    · exact hxT
  have hone : 1 < (K2.support \ Kq.support).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxK2, _⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwK2, _⟩
  rcases Finset.mem_sdiff.mp (hdiffT hx) with ⟨hxFilter, hxOff⟩
  rcases Finset.mem_sdiff.mp (hdiffT hw) with ⟨hwFilter, hwOff⟩
  rcases Finset.mem_filter.mp hxFilter with ⟨hxA, hxFirst⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwFirst⟩
  have hxSecond : dist x S.oppApex2 = K2.radius := by
    simpa only [dist_comm] using K2.support_eq_radius x hxK2
  have hwSecond : dist w S.oppApex2 = K2.radius := by
    simpa only [dist_comm] using K2.support_eq_radius w hwK2
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S hxA hwA hxOff hwOff hxw hxFirst hwFirst hxSecond hwSecond

#print axioms
  Problem97.ATailU5BoundedSupportBridge.false_of_secondApexClass_support_subset_blockerSupport_union_marginal

end ATailU5BoundedSupportBridge

end Problem97
