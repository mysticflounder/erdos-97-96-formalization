import Mathlib

namespace Problem97

set_option maxRecDepth 100000

abbrev CU := Fin 15

def CI0 : Finset CU := {0, 1, 2, 3}
def CI1 : Finset CU := {4, 5, 6, 7}
def CI2 : Finset CU := {8, 9, 10, 11}

def ifMem (p : CU) (s : Finset CU) : Finset CU :=
  if p ∈ s then {p} else ∅

def cross01a (e0 : Finset CU) := e0 ∩ CI1
def cross01b (e1 : Finset CU) := e1 ∩ CI0
def cross02a (e0 : Finset CU) := e0 ∩ CI2
def cross02b (e2 : Finset CU) := e2 ∩ CI0
def cross12a (e1 : Finset CU) := e1 ∩ CI2
def cross12b (e2 : Finset CU) := e2 ∩ CI1

lemma CU_partition : (Finset.univ : Finset CU) =
    CI0 ∪ CI1 ∪ CI2 ∪ ({12, 13, 14} : Finset CU) := by
  decide

lemma extra0_decomp (e0 : Finset CU)
    (hdisj : Disjoint e0 (CI0 ∪ ({12} : Finset CU))) :
    e0 = cross01a e0 ∪ cross02a e0 ∪ ifMem 13 e0 ∪ ifMem 14 e0 := by
  have hnot0 : ∀ {x : CU}, x ∈ e0 → x ∉ CI0 := by
    intro x hx hx0
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_left _ hx0)
  have hnot12 : (12 : CU) ∉ e0 := by
    intro hx
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_right _ (by simp))
  have hcover : e0 ⊆ CI1 ∪ CI2 ∪ ({13, 14} : Finset CU) := by
    intro x hx
    have hpart : x ∈ CI0 ∪ CI1 ∪ CI2 ∪ ({12, 13, 14} : Finset CU) := by
      rw [← CU_partition]
      simp
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hpart ⊢
    rcases hpart with hleft | hright
    · rcases hleft with hleft' | hx2
      · rcases hleft' with hx0 | hx1
        · exact False.elim (hnot0 hx hx0)
        · exact Or.inl (Or.inl hx1)
      · exact Or.inl (Or.inr hx2)
    · rcases hright with hx12 | hrest
      · exact False.elim (hnot12 (by simpa [hx12] using hx))
      · rcases hrest with hx13 | hx14
        · exact Or.inr (Or.inl hx13)
        · exact Or.inr (Or.inr hx14)
  by_cases h13 : (13 : CU) ∈ e0 <;> by_cases h14 : (14 : CU) ∈ e0
  all_goals
    ext x
    constructor
    · intro hx
      have h := hcover hx
      simp [cross01a, cross02a, ifMem, h13, h14] at h ⊢
      aesop
    · intro hx
      simp [cross01a, cross02a, ifMem, h13, h14] at hx ⊢
      aesop

lemma extra1_decomp (e1 : Finset CU)
    (hdisj : Disjoint e1 (CI1 ∪ ({13} : Finset CU)))
    (h12 : (12 : CU) ∉ e1) :
    e1 = cross01b e1 ∪ cross12a e1 ∪ ifMem 12 e1 ∪ ifMem 14 e1 := by
  have hnot1 : ∀ {x : CU}, x ∈ e1 → x ∉ CI1 := by
    intro x hx hx1
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_left _ hx1)
  have hnot13 : (13 : CU) ∉ e1 := by
    intro hx
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_right _ (by simp))
  have hcover : e1 ⊆ CI0 ∪ CI2 ∪ ({12, 14} : Finset CU) := by
    intro x hx
    have hpart : x ∈ CI0 ∪ CI1 ∪ CI2 ∪ ({12, 13, 14} : Finset CU) := by
      rw [← CU_partition]
      simp
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hpart ⊢
    rcases hpart with hleft | hright
    · rcases hleft with hleft' | hx2
      · rcases hleft' with hx0 | hx1
        · exact Or.inl (Or.inl hx0)
        · exact False.elim (hnot1 hx hx1)
      · exact Or.inl (Or.inr hx2)
    · rcases hright with hx12 | hrest
      · exact Or.inr (Or.inl hx12)
      · rcases hrest with hx13 | hx14
        · exact False.elim (hnot13 (by simpa [hx13] using hx))
        · exact Or.inr (Or.inr hx14)
  by_cases h14 : (14 : CU) ∈ e1
  all_goals
    ext x
    constructor
    · intro hx
      have h := hcover hx
      simp [cross01b, cross12a, ifMem, h12, h14] at h ⊢
      aesop
    · intro hx
      simp [cross01b, cross12a, ifMem, h12, h14] at hx ⊢
      aesop

lemma extra2_decomp (e2 : Finset CU)
    (hdisj : Disjoint e2 (CI2 ∪ ({14} : Finset CU)))
    (h12 : (12 : CU) ∉ e2) :
    e2 = cross02b e2 ∪ cross12b e2 ∪ ifMem 12 e2 ∪ ifMem 13 e2 := by
  have hnot2 : ∀ {x : CU}, x ∈ e2 → x ∉ CI2 := by
    intro x hx hx2
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_left _ hx2)
  have hnot14 : (14 : CU) ∉ e2 := by
    intro hx
    exact (Finset.disjoint_left.mp hdisj hx) (Finset.mem_union_right _ (by simp))
  have hcover : e2 ⊆ CI0 ∪ CI1 ∪ ({12, 13} : Finset CU) := by
    intro x hx
    have hpart : x ∈ CI0 ∪ CI1 ∪ CI2 ∪ ({12, 13, 14} : Finset CU) := by
      rw [← CU_partition]
      simp
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hpart ⊢
    rcases hpart with hleft | hright
    · rcases hleft with hleft' | hx2
      · rcases hleft' with hx0 | hx1
        · exact Or.inl (Or.inl hx0)
        · exact Or.inl (Or.inr hx1)
      · exact False.elim (hnot2 hx hx2)
    · rcases hright with hx12 | hrest
      · exact Or.inr (Or.inl hx12)
      · rcases hrest with hx13 | hx14
        · exact Or.inr (Or.inr hx13)
        · exact False.elim (hnot14 (by simpa [hx14] using hx))
  by_cases h13 : (13 : CU) ∈ e2
  all_goals
    ext x
    constructor
    · intro hx
      have h := hcover hx
      simp [cross02b, cross12b, ifMem, h12, h13] at h ⊢
      aesop
    · intro hx
      simp [cross02b, cross12b, ifMem, h12, h13] at hx ⊢
      aesop

lemma extra0_decomp_inter (e0 : Finset CU)
    (hdisj : Disjoint e0 (CI0 ∪ ({12} : Finset CU))) :
    e0 = cross01a e0 ∪ cross02a e0 ∪ (e0 ∩ ({13} : Finset CU)) ∪
      (e0 ∩ ({14} : Finset CU)) := by
  calc
    e0 = cross01a e0 ∪ cross02a e0 ∪ ifMem 13 e0 ∪ ifMem 14 e0 :=
      extra0_decomp e0 hdisj
    _ = cross01a e0 ∪ cross02a e0 ∪ (e0 ∩ ({13} : Finset CU)) ∪
        (e0 ∩ ({14} : Finset CU)) := by
      ext x
      by_cases h13 : (13 : CU) ∈ e0 <;> by_cases h14 : (14 : CU) ∈ e0 <;>
        simp [ifMem, h13, h14]

lemma extra1_decomp_inter (e1 : Finset CU)
    (hdisj : Disjoint e1 (CI1 ∪ ({13} : Finset CU)))
    (h12 : (12 : CU) ∉ e1) :
    e1 = cross01b e1 ∪ cross12a e1 ∪ (e1 ∩ ({12} : Finset CU)) ∪
      (e1 ∩ ({14} : Finset CU)) := by
  calc
    e1 = cross01b e1 ∪ cross12a e1 ∪ ifMem 12 e1 ∪ ifMem 14 e1 :=
      extra1_decomp e1 hdisj h12
    _ = cross01b e1 ∪ cross12a e1 ∪ (e1 ∩ ({12} : Finset CU)) ∪
        (e1 ∩ ({14} : Finset CU)) := by
      ext x
      by_cases h12' : (12 : CU) ∈ e1 <;> by_cases h14 : (14 : CU) ∈ e1 <;>
        simp [ifMem, h12', h14]

lemma extra2_decomp_inter (e2 : Finset CU)
    (hdisj : Disjoint e2 (CI2 ∪ ({14} : Finset CU)))
    (h12 : (12 : CU) ∉ e2) :
    e2 = cross02b e2 ∪ cross12b e2 ∪ (e2 ∩ ({12} : Finset CU)) ∪
      (e2 ∩ ({13} : Finset CU)) := by
  calc
    e2 = cross02b e2 ∪ cross12b e2 ∪ ifMem 12 e2 ∪ ifMem 13 e2 :=
      extra2_decomp e2 hdisj h12
    _ = cross02b e2 ∪ cross12b e2 ∪ (e2 ∩ ({12} : Finset CU)) ∪
        (e2 ∩ ({13} : Finset CU)) := by
      ext x
      by_cases h12' : (12 : CU) ∈ e2 <;> by_cases h13 : (13 : CU) ∈ e2 <;>
        simp [ifMem, h12', h13]

def CD01 : Finset CU := CI0 ∪ CI1 ∪ ({14} : Finset CU)
def CD02 : Finset CU := CI0 ∪ CI2 ∪ ({13} : Finset CU)
def CD12 : Finset CU := CI1 ∪ CI2 ∪ ({12} : Finset CU)

lemma card_sum_two_le_one
    {α : Type*} [DecidableEq α]
    (A B K : Finset α) (hdisj : Disjoint A B)
    (hsub : A ∪ B ⊆ K) (hK : K.card ≤ 1) :
    A.card + B.card ≤ 1 := by
  have hcard : (A ∪ B).card = A.card + B.card :=
    Finset.card_union_of_disjoint hdisj
  have hle : (A ∪ B).card ≤ K.card := Finset.card_le_card hsub
  omega

lemma card_sum_three_le_one
    {α : Type*} [DecidableEq α]
    (A B C K : Finset α)
    (hAB : Disjoint A B) (hAC : Disjoint A C) (hBC : Disjoint B C)
    (hsub : A ∪ B ∪ C ⊆ K) (hK : K.card ≤ 1) :
    A.card + B.card + C.card ≤ 1 := by
  have hABC : Disjoint (A ∪ B) C := by
    rw [Finset.disjoint_left]
    intro x hxAB hxC
    rcases Finset.mem_union.mp hxAB with hxA | hxB
    · exact Finset.disjoint_left.mp hAC hxA hxC
    · exact Finset.disjoint_left.mp hBC hxB hxC
  have hcardAB : (A ∪ B).card = A.card + B.card :=
    Finset.card_union_of_disjoint hAB
  have hcard : (A ∪ B ∪ C).card = A.card + B.card + C.card := by
    rw [Finset.card_union_of_disjoint hABC, hcardAB]
  have hle : (A ∪ B ∪ C).card ≤ K.card := Finset.card_le_card hsub
  omega

lemma card_sum_eq_of_cover4
    {α : Type*} [DecidableEq α]
    (E A B C D : Finset α) (hE : E.card = 2)
    (hcover : E ⊆ A ∪ B ∪ C ∪ D)
    (hA : A ⊆ E) (hB : B ⊆ E) (hC : C ⊆ E) (hD : D ⊆ E)
    (hAB : Disjoint A B) (hAC : Disjoint A C) (hAD : Disjoint A D)
    (hBC : Disjoint B C) (hBD : Disjoint B D) (hCD : Disjoint C D) :
    E.card = A.card + B.card + C.card + D.card := by
  have hABC : Disjoint (A ∪ B) C := by
    rw [Finset.disjoint_left]
    intro x hxAB hxC
    rcases Finset.mem_union.mp hxAB with hxA | hxB
    · exact Finset.disjoint_left.mp hAC hxA hxC
    · exact Finset.disjoint_left.mp hBC hxB hxC
  have hABCD : Disjoint (A ∪ B ∪ C) D := by
    rw [Finset.disjoint_left]
    intro x hxABC hxD
    rcases Finset.mem_union.mp hxABC with hxAB | hxC
    · rcases Finset.mem_union.mp hxAB with hxA | hxB
      · exact Finset.disjoint_left.mp hAD hxA hxD
      · exact Finset.disjoint_left.mp hBD hxB hxD
    · exact Finset.disjoint_left.mp hCD hxC hxD
  have hcard : (A ∪ B ∪ C ∪ D).card = A.card + B.card + C.card + D.card := by
    rw [Finset.card_union_of_disjoint hABCD]
    rw [Finset.card_union_of_disjoint hABC]
    rw [Finset.card_union_of_disjoint hAB]
  have hlow : A.card + B.card + C.card + D.card ≤ E.card := by
    rw [← hcard]
    exact Finset.card_le_card (by
      intro x hx
      simp at hx ⊢
      rcases hx with hxA | hxB | hxC | hxD
      · exact hA hxA
      · exact hB hxB
      · exact hC hxC
      · exact hD hxD)
  have hupp : E.card ≤ A.card + B.card + C.card + D.card := by
    calc
      E.card ≤ (A ∪ B ∪ C ∪ D).card := Finset.card_le_card hcover
      _ ≤ (A ∪ B ∪ C).card + D.card := Finset.card_union_le _ _
      _ ≤ ((A ∪ B).card + C.card) + D.card := by
        gcongr
        exact Finset.card_union_le _ _
      _ ≤ ((A.card + B.card) + C.card) + D.card := by
        gcongr
        exact Finset.card_union_le _ _
      _ = A.card + B.card + C.card + D.card := by omega
  omega

lemma inter_disjoint_of_disjoint
    {α : Type*} [DecidableEq α] {A B C D : Finset α}
    (h : Disjoint A B) : Disjoint (C ∩ A) (D ∩ B) := by
  rw [Finset.disjoint_left]
  intro x hxA hxB
  exact Finset.disjoint_left.mp h (Finset.mem_inter.mp hxA).2
    (Finset.mem_inter.mp hxB).2

end Problem97
