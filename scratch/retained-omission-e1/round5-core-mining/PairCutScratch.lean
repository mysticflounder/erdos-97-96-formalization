import Mathlib

import «RichCoverConstructive»

namespace Problem97

def K01 (e0 e1 : Finset CU) : Finset CU :=
  (CI0 ∪ e0) ∩ (CI1 ∪ e1) ∩ CD01

def K02 (e0 e2 : Finset CU) : Finset CU :=
  (CI0 ∪ e0) ∩ (CI2 ∪ e2) ∩ CD02

def K12 (e1 e2 : Finset CU) : Finset CU :=
  (CI1 ∪ e1) ∩ (CI2 ∪ e2) ∩ CD12

lemma cross01_disjoint (e0 e1 : Finset CU) :
    Disjoint (cross01a e0) (cross01b e1) := by
  rw [Finset.disjoint_left]
  intro x h0 h1
  have hci1 : x ∈ CI1 := (Finset.mem_inter.mp h0).2
  have hci0 : x ∈ CI0 := (Finset.mem_inter.mp h1).2
  fin_cases x <;> simp_all [CI0, CI1]

lemma cross02_disjoint (e0 e2 : Finset CU) :
    Disjoint (cross02a e0) (cross02b e2) := by
  rw [Finset.disjoint_left]
  intro x h0 h1
  have hci2 : x ∈ CI2 := (Finset.mem_inter.mp h0).2
  have hci0 : x ∈ CI0 := (Finset.mem_inter.mp h1).2
  fin_cases x <;> simp_all [CI0, CI2]

lemma cross12_disjoint (e1 e2 : Finset CU) :
    Disjoint (cross12a e1) (cross12b e2) := by
  rw [Finset.disjoint_left]
  intro x h1 h2
  have hci2 : x ∈ CI2 := (Finset.mem_inter.mp h1).2
  have hci1 : x ∈ CI1 := (Finset.mem_inter.mp h2).2
  fin_cases x <;> simp_all [CI1, CI2]

lemma cross01_subset_K01 (e0 e1 : Finset CU) :
    cross01a e0 ∪ cross01b e1 ⊆ K01 e0 e1 := by
  intro x hx
  rcases Finset.mem_union.mp hx with hxa | hxb
  · have he0 : x ∈ e0 := (Finset.mem_inter.mp hxa).1
    have hci1 : x ∈ CI1 := (Finset.mem_inter.mp hxa).2
    simp [K01, CD01, he0, hci1]
  · have he1 : x ∈ e1 := (Finset.mem_inter.mp hxb).1
    have hci0 : x ∈ CI0 := (Finset.mem_inter.mp hxb).2
    simp [K01, CD01, he1, hci0]

lemma cross02_subset_K02 (e0 e2 : Finset CU) :
    cross02a e0 ∪ cross02b e2 ⊆ K02 e0 e2 := by
  intro x hx
  rcases Finset.mem_union.mp hx with hxa | hxb
  · have he0 : x ∈ e0 := (Finset.mem_inter.mp hxa).1
    have hci2 : x ∈ CI2 := (Finset.mem_inter.mp hxa).2
    simp [K02, CD02, he0, hci2]
  · have he2 : x ∈ e2 := (Finset.mem_inter.mp hxb).1
    have hci0 : x ∈ CI0 := (Finset.mem_inter.mp hxb).2
    simp [K02, CD02, he2, hci0]

lemma cross12_subset_K12 (e1 e2 : Finset CU) :
    cross12a e1 ∪ cross12b e2 ⊆ K12 e1 e2 := by
  intro x hx
  rcases Finset.mem_union.mp hx with hxa | hxb
  · have he1 : x ∈ e1 := (Finset.mem_inter.mp hxa).1
    have hci2 : x ∈ CI2 := (Finset.mem_inter.mp hxa).2
    simp [K12, CD12, he1, hci2]
  · have he2 : x ∈ e2 := (Finset.mem_inter.mp hxb).1
    have hci1 : x ∈ CI1 := (Finset.mem_inter.mp hxb).2
    simp [K12, CD12, he2, hci1]

lemma pair_cut_card_01 (e0 e1 : Finset CU) (hK : (K01 e0 e1).card ≤ 1) :
    (cross01a e0).card + (cross01b e1).card ≤ 1 :=
  card_sum_two_le_one _ _ _ (cross01_disjoint e0 e1)
    (cross01_subset_K01 e0 e1) hK

lemma pair_cut_card_02 (e0 e2 : Finset CU) (hK : (K02 e0 e2).card ≤ 1) :
    (cross02a e0).card + (cross02b e2).card ≤ 1 :=
  card_sum_two_le_one _ _ _ (cross02_disjoint e0 e2)
    (cross02_subset_K02 e0 e2) hK

lemma pair_cut_card_12 (e1 e2 : Finset CU) (hK : (K12 e1 e2).card ≤ 1) :
    (cross12a e1).card + (cross12b e2).card ≤ 1 :=
  card_sum_two_le_one _ _ _ (cross12_disjoint e1 e2)
    (cross12_subset_K12 e1 e2) hK

end Problem97
