import Mathlib

/-!
Finite consequences for one set hitting two disjoint source pairs.

The lower bound and the cardinality-two classification do not actually need
the hitting set to be contained in the union.  Containment supplies the exact
cardinality decomposition into the two intersections.
-/

namespace CommonHittingSetTwoDisjointPairsScratch

variable {α : Type*} [DecidableEq α]

theorem two_le_card_of_hits_disjoint
    {P Q V : Finset α}
    (hdisj : Disjoint P Q)
    (hP : (V ∩ P).Nonempty)
    (hQ : (V ∩ Q).Nonempty) :
    2 ≤ V.card := by
  rcases hP with ⟨x, hx⟩
  rcases Finset.mem_inter.mp hx with ⟨hxV, hxP⟩
  rcases hQ with ⟨y, hy⟩
  rcases Finset.mem_inter.mp hy with ⟨hyV, hyQ⟩
  have hxy : x ≠ y := by
    intro h
    subst y
    exact Finset.disjoint_left.mp hdisj hxP hyQ
  have hpair : ({x, y} : Finset α) ⊆ V := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxV
    · exact hyV
  calc
    2 = ({x, y} : Finset α).card := by simp [hxy]
    _ ≤ V.card := Finset.card_le_card hpair

theorem card_eq_inter_add_inter_of_subset_union
    {P Q V : Finset α}
    (hdisj : Disjoint P Q)
    (hsub : V ⊆ P ∪ Q) :
    V.card = (V ∩ P).card + (V ∩ Q).card := by
  have hdecomp : V = (V ∩ P) ∪ (V ∩ Q) := by
    ext x
    simp only [Finset.mem_union, Finset.mem_inter]
    constructor
    · intro hxV
      rcases Finset.mem_union.mp (hsub hxV) with hxP | hxQ
      · exact Or.inl ⟨hxV, hxP⟩
      · exact Or.inr ⟨hxV, hxQ⟩
    · rintro (⟨hxV, _⟩ | ⟨hxV, _⟩) <;> exact hxV
  have hinterDisj : Disjoint (V ∩ P) (V ∩ Q) :=
    hdisj.mono Finset.inter_subset_right Finset.inter_subset_right
  calc
    V.card = ((V ∩ P) ∪ (V ∩ Q)).card :=
      congrArg Finset.card hdecomp
    _ = (V ∩ P).card + (V ∩ Q).card :=
      Finset.card_union_of_disjoint hinterDisj

theorem card_eq_two_iff_inter_cards_eq_one
    {P Q V : Finset α}
    (hdisj : Disjoint P Q)
    (hsub : V ⊆ P ∪ Q)
    (hP : (V ∩ P).Nonempty)
    (hQ : (V ∩ Q).Nonempty) :
    V.card = 2 ↔
      (V ∩ P).card = 1 ∧ (V ∩ Q).card = 1 := by
  have hcard := card_eq_inter_add_inter_of_subset_union hdisj hsub
  have hPpos : 0 < (V ∩ P).card := Finset.card_pos.mpr hP
  have hQpos : 0 < (V ∩ Q).card := Finset.card_pos.mpr hQ
  constructor <;> omega

theorem card_eq_two_iff_eq_cross_pair
    {P Q V : Finset α}
    (hdisj : Disjoint P Q)
    (hP : (V ∩ P).Nonempty)
    (hQ : (V ∩ Q).Nonempty) :
    V.card = 2 ↔
      ∃ x ∈ P, ∃ y ∈ Q, V = {x, y} := by
  constructor
  · intro hcard
    rcases hP with ⟨x, hx⟩
    rcases Finset.mem_inter.mp hx with ⟨hxV, hxP⟩
    rcases hQ with ⟨y, hy⟩
    rcases Finset.mem_inter.mp hy with ⟨hyV, hyQ⟩
    have hxy : x ≠ y := by
      intro h
      subst y
      exact Finset.disjoint_left.mp hdisj hxP hyQ
    have hpair : ({x, y} : Finset α) ⊆ V := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hxV
      · exact hyV
    refine ⟨x, hxP, y, hyQ, ?_⟩
    exact
      (Finset.eq_of_subset_of_card_le hpair
        (by simp [hxy, hcard])).symm
  · rintro ⟨x, hxP, y, hyQ, rfl⟩
    have hxy : x ≠ y := by
      intro h
      subst y
      exact Finset.disjoint_left.mp hdisj hxP hyQ
    simp [hxy]

theorem pair_card_bounds_of_hits_of_subset_union
    {a b c d : α} {V : Finset α}
    (hdisj : Disjoint ({a, b} : Finset α) {c, d})
    (hsub : V ⊆ ({a, b} : Finset α) ∪ {c, d})
    (hP : (V ∩ {a, b}).Nonempty)
    (hQ : (V ∩ {c, d}).Nonempty) :
    2 ≤ V.card ∧ V.card ≤ 4 := by
  have hlower := two_le_card_of_hits_disjoint hdisj hP hQ
  have hcard := card_eq_inter_add_inter_of_subset_union hdisj hsub
  have hPcard : (V ∩ {a, b}).card ≤ 2 := by
    calc
      (V ∩ {a, b}).card ≤ ({a, b} : Finset α).card :=
        Finset.card_le_card Finset.inter_subset_right
      _ ≤ 2 := by
        simpa using Finset.card_insert_le a ({b} : Finset α)
  have hQcard : (V ∩ {c, d}).card ≤ 2 := by
    calc
      (V ∩ {c, d}).card ≤ ({c, d} : Finset α).card :=
        Finset.card_le_card Finset.inter_subset_right
      _ ≤ 2 := by
        simpa using Finset.card_insert_le c ({d} : Finset α)
  omega

theorem pair_card_eq_two_iff_four_cross_pairs
    {a b c d : α} {V : Finset α}
    (hdisj : Disjoint ({a, b} : Finset α) {c, d})
    (hP : (V ∩ {a, b}).Nonempty)
    (hQ : (V ∩ {c, d}).Nonempty) :
    V.card = 2 ↔
      V = {a, c} ∨ V = {a, d} ∨ V = {b, c} ∨ V = {b, d} := by
  constructor
  · intro hcard
    rcases (card_eq_two_iff_eq_cross_pair hdisj hP hQ).mp hcard with
      ⟨x, hx, y, hy, hV⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx hy
    rcases hx with rfl | rfl <;> rcases hy with rfl | rfl
    · exact Or.inl hV
    · exact Or.inr (Or.inl hV)
    · exact Or.inr (Or.inr (Or.inl hV))
    · exact Or.inr (Or.inr (Or.inr hV))
  · intro hV
    apply (card_eq_two_iff_eq_cross_pair hdisj hP hQ).mpr
    rcases hV with hV | hV | hV | hV
    · exact ⟨a, by simp, c, by simp, hV⟩
    · exact ⟨a, by simp, d, by simp, hV⟩
    · exact ⟨b, by simp, c, by simp, hV⟩
    · exact ⟨b, by simp, d, by simp, hV⟩

end CommonHittingSetTwoDisjointPairsScratch
