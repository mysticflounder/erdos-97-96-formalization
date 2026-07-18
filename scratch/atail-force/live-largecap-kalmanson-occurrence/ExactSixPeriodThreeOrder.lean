import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Exact-six obstruction for a period-three shared cap order

This scratch file isolates the finite ordered-set consequence of the
source-faithful exact-five all-reverse packet.  Three distinct cycle sources
and a strict blocker between every consecutive pair force at least five
points in the common strict-cap interior.  Hence the packet cannot occur when
that interior has cardinality at most four (equivalently, on an exact
six-point closed cap).
-/

namespace Problem97
namespace LiveLargeCapKalmansonOccurrence

attribute [local instance] Classical.propDecidable

/-- `b` lies strictly between `a` and `c` in either orientation. -/
def StrictBetween {α : Type*} [LT α] (a b c : α) : Prop :=
  (a < b ∧ b < c) ∨ (c < b ∧ b < a)

private theorem StrictBetween.swap
    {α : Type*} [LT α] {a b c : α}
    (h : StrictBetween a b c) : StrictBetween c b a := by
  simpa [StrictBetween, or_comm] using h

private theorem five_le_card_of_two_adjacent_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (x y z bx bz : α)
    (hxU : x ∈ U) (hyU : y ∈ U) (hzU : z ∈ U)
    (hbxU : bx ∈ U) (hbzU : bz ∈ U)
    (hxy : x < y) (hyz : y < z)
    (hbx : StrictBetween x bx y)
    (hbz : StrictBetween y bz z) :
    5 ≤ U.card := by
  have hxbx : x < bx := by
    rcases hbx with h | h <;> order
  have hbx_y : bx < y := by
    rcases hbx with h | h <;> order
  have hybz : y < bz := by
    rcases hbz with h | h <;> order
  have hbzz : bz < z := by
    rcases hbz with h | h <;> order
  let f : Fin 5 → ↑U := ![
    ⟨x, hxU⟩, ⟨bx, hbxU⟩, ⟨y, hyU⟩, ⟨bz, hbzU⟩, ⟨z, hzU⟩]
  have hf : Function.Injective f := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp [f] at hij ⊢ <;> order
  have hcard := Fintype.card_le_of_injective f hf
  simpa using hcard

/-- A three-cycle whose three consecutive source pairs all strictly straddle
blockers in the same carrier requires at least five carrier points. -/
theorem five_le_card_of_periodThree_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (q0 q1 q2 b0 b1 b2 : α)
    (hq0U : q0 ∈ U) (hq1U : q1 ∈ U) (hq2U : q2 ∈ U)
    (hb0U : b0 ∈ U) (hb1U : b1 ∈ U) (hb2U : b2 ∈ U)
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (h0 : StrictBetween q0 b0 q1)
    (h1 : StrictBetween q1 b1 q2)
    (h2 : StrictBetween q2 b2 q0) :
    5 ≤ U.card := by
  rcases lt_trichotomy q0 q1 with h01 | h01 | h10
  · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
    · exact five_le_card_of_two_adjacent_straddles U q0 q1 q2 b0 b1
        hq0U hq1U hq2U hb0U hb1U h01 h12 h0 h1
    · exact False.elim (hq12 h12)
    · have h02 : q0 < q2 ∨ q2 < q0 := lt_or_gt_of_ne hq20.symm
      rcases h02 with h02 | h20
      · have h2' : StrictBetween q0 b2 q2 := by
          exact h2.swap
        have h1' : StrictBetween q2 b1 q1 := h1.swap
        exact five_le_card_of_two_adjacent_straddles U q0 q2 q1 b2 b1
          hq0U hq2U hq1U hb2U hb1U h02 h21 h2' h1'
      · have h0' : StrictBetween q1 b0 q0 := by
          exact h0.swap
        exact five_le_card_of_two_adjacent_straddles U q2 q0 q1 b2 b0
          hq2U hq0U hq1U hb2U hb0U h20 h01 h2 h0
  · exact False.elim (hq01 h01)
  · rcases lt_trichotomy q0 q2 with h02 | h02 | h20
    · have h2' : StrictBetween q0 b2 q2 := by
        exact h2.swap
      have h0' : StrictBetween q1 b0 q0 := h0.swap
      exact five_le_card_of_two_adjacent_straddles U q1 q0 q2 b0 b2
        hq1U hq0U hq2U hb0U hb2U h10 h02 h0' h2'
    · exact False.elim (hq20 h02.symm)
    · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
      · have h0' : StrictBetween q1 b0 q0 := by
          exact h0.swap
        exact five_le_card_of_two_adjacent_straddles U q1 q2 q0 b1 b2
          hq1U hq2U hq0U hb1U hb2U h12 h20 h1 h2
      · exact False.elim (hq12 h12)
      · have h0' : StrictBetween q1 b0 q0 := by
          exact h0.swap
        have h1' : StrictBetween q2 b1 q1 := by
          exact h1.swap
        exact five_le_card_of_two_adjacent_straddles U q2 q1 q0 b1 b0
          hq2U hq1U hq0U hb1U hb0U h21 h10 h1' h0'

/-- Four carrier points cannot support a source-faithful period-three
strict-straddle packet. -/
theorem false_of_periodThree_straddles_card_le_four
    {α : Type*} [LinearOrder α]
    (U : Finset α) (q0 q1 q2 b0 b1 b2 : α)
    (hU : U.card ≤ 4)
    (hq0U : q0 ∈ U) (hq1U : q1 ∈ U) (hq2U : q2 ∈ U)
    (hb0U : b0 ∈ U) (hb1U : b1 ∈ U) (hb2U : b2 ∈ U)
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (h0 : StrictBetween q0 b0 q1)
    (h1 : StrictBetween q1 b1 q2)
    (h2 : StrictBetween q2 b2 q0) : False := by
  have := five_le_card_of_periodThree_straddles U q0 q1 q2 b0 b1 b2
    hq0U hq1U hq2U hb0U hb1U hb2U hq01 hq12 hq20 h0 h1 h2
  omega

#print axioms five_le_card_of_periodThree_straddles
#print axioms false_of_periodThree_straddles_card_le_four

end LiveLargeCapKalmansonOccurrence
end Problem97
