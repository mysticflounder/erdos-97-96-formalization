import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# Scratch: first global-K4 continuation beyond the local ATAIL packet

This file deliberately lives under `scratch/`.  It isolates the smallest
branch-complete use of all-center `K4` visible after the exact 35-point
regression: a selected four-class at the second opposite apex has at least two
support points in the strict interior of the opposite cap, and global `K4`
then supplies a selected four-class centered at every such point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalCriticalContinuation

attribute [local instance] Classical.propDecidable

/-- If a four-point finite set is covered by three regions, and its
intersections with the first two regions have size at most one, at least two
points lie in the third region. -/
private theorem two_le_third_inter_of_card_four
    {alpha : Type _} [DecidableEq alpha]
    {T B₁ B₂ I : Finset alpha}
    (hcard : T.card = 4)
    (hcover : T ⊆ B₁ ∪ B₂ ∪ I)
    (hB₁ : (T ∩ B₁).card ≤ 1)
    (hB₂ : (T ∩ B₂).card ≤ 1) :
    2 ≤ (T ∩ I).card := by
  have hdecomp : T = (T ∩ B₁) ∪ (T ∩ B₂) ∪ (T ∩ I) := by
    ext x
    constructor
    · intro hxT
      have hx := hcover hxT
      simp only [Finset.mem_union, Finset.mem_inter] at hx ⊢
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact Or.inl (Or.inl ⟨hxT, hxB₁⟩)
      · exact Or.inl (Or.inr ⟨hxT, hxB₂⟩)
      · exact Or.inr ⟨hxT, hxI⟩
    · intro hx
      simp only [Finset.mem_union, Finset.mem_inter] at hx
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact hxB₁.1
      · exact hxB₂.1
      · exact hxI.1
  have hcard_le :
      T.card ≤ (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
    calc
      T.card = (((T ∩ B₁) ∪ (T ∩ B₂)) ∪ (T ∩ I)).card := by
        exact congrArg Finset.card hdecomp
      _ ≤ ((T ∩ B₁) ∪ (T ∩ B₂)).card + (T ∩ I).card :=
        Finset.card_union_le _ _
      _ ≤ ((T ∩ B₁).card + (T ∩ B₂).card) + (T ∩ I).card :=
        Nat.add_le_add_right (Finset.card_union_le _ _) _
      _ = (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
        rw [Nat.add_assoc]
  omega

/-- A selected four-class at the second opposite apex contributes at least two
support points in the part of `oppCap2` outside both adjacent closed caps.

This is independent of the `(m,4,4)` cardinality specialization: it uses only
the exact-radius cover, the two adjacent one-hit theorems, and the fact that
the chosen support has exactly four points. -/
theorem secondApex_support_strictInterior_card_ge_two
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    2 ≤ (K.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))).card := by
  let F := D.A.filter fun x => dist x D.packet.oppApex2 = K.radius
  have hsupportF : K.support ⊆ F := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨K.support_subset_A hx, by simpa [dist_comm] using K.support_eq_radius x hx⟩
  have hcover : K.support ⊆
      D.packet.surplusCap ∪ D.packet.oppCap1 ∪
        (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)) :=
    fun _ hx => U2NonSurplusSqueeze.oppApex2_exactRadiusClass_cover D K.radius
      (hsupportF hx)
  have hsurplus : (K.support ∩ D.packet.surplusCap).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.surplusCap).card ≤
          (F ∩ D.packet.surplusCap).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit D K.radius
  have hother : (K.support ∩ D.packet.oppCap1).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.oppCap1).card ≤
          (F ∩ D.packet.oppCap1).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_otherCap_one_hit D K.radius
  exact two_le_third_inter_of_card_four K.support_card hcover hsurplus hother

/-- The first genuinely global continuation beyond the local ATAIL packet.

There are at least two second-apex support witnesses in the strict opposite-cap
interior, and all-center `K4` supplies a selected four-class centered at every
one of them.  A local-K4 surrogate at only the six named ATAIL centers cannot
prove the second conjunct. -/
theorem secondApex_two_globalK4_continuations
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    let I := D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)
    2 ≤ (K.support ∩ I).card ∧
      ∀ z ∈ K.support ∩ I, Nonempty (SelectedFourClass D.A z) := by
  dsimp only
  refine ⟨secondApex_support_strictInterior_card_ge_two D K, ?_⟩
  intro z hz
  exact exists_selectedFourClass_of_globalK4 D.K4
    (K.support_subset_A (Finset.mem_inter.mp hz).1)

end ATailGlobalCriticalContinuation
end Problem97
