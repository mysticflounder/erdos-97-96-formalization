import Mathlib
import «RichCoverConstructive»
import «PairCutScratch»

set_option maxRecDepth 100000
set_option maxHeartbeats 1000000

namespace Problem97

lemma rich_count_contradiction (x y p q u v s w z t m n : Nat)
    (hx : x + y + p + q = 2)
    (hu : u + v + s = 2)
    (hw : w + z + t = 2)
    (hp : p ≤ 1) (hq : q ≤ 1) (hs : s ≤ 1) (ht : t ≤ 1)
    (hm : m ≤ q) (hm' : m ≤ s) (hm'' : q + s ≤ 1 + m)
    (hn : n ≤ p) (hn' : n ≤ t) (hn'' : p + t ≤ 1 + n)
    (h1 : x + u + m ≤ 1)
    (h2 : y + w + n ≤ 1)
    (h3 : v + z ≤ 1) : False := by
  omega

lemma card_ifMem_le_one (p : CU) (e : Finset CU) : (ifMem p e).card ≤ 1 := by
  by_cases h : p ∈ e <;> simp [ifMem, h]

lemma card_inter_singleton_le (p : CU) (e f : Finset CU) :
    (e ∩ f ∩ ({p} : Finset CU)).card ≤ (e ∩ ({p} : Finset CU)).card := by
  apply Finset.card_le_card
  intro x hx
  have h' := Finset.mem_inter.mp hx
  simpa only [Finset.mem_inter] using
    And.intro (Finset.mem_inter.mp h'.1 |>.1) h'.2

lemma shared_singleton_card_le (p : CU) (e f : Finset CU) :
    (e ∩ f ∩ ({p} : Finset CU)).card ≤ (f ∩ ({p} : Finset CU)).card := by
  apply Finset.card_le_card
  intro x hx
  have h' := Finset.mem_inter.mp hx
  simpa only [Finset.mem_inter] using
    And.intro (Finset.mem_inter.mp h'.1 |>.2) h'.2

lemma card_inter_singleton_le_one (p : CU) (e : Finset CU) :
    (e ∩ ({p} : Finset CU)).card ≤ 1 := by
  have hsub : e ∩ ({p} : Finset CU) ⊆ ({p} : Finset CU) := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  simpa using Finset.card_le_card hsub

lemma singleton_pair_card_bound (p : CU) (e f : Finset CU) :
    (e ∩ ({p} : Finset CU)).card + (f ∩ ({p} : Finset CU)).card ≤
      1 + (e ∩ f ∩ ({p} : Finset CU)).card := by
  by_cases he : p ∈ e <;> by_cases hf : p ∈ f <;>
    simp [Finset.card_eq_one, he, hf]

lemma triple_shared_subset_K01 (e0 e1 : Finset CU) :
    (e0 ∩ e1 ∩ ({14} : Finset CU)) ⊆ K01 e0 e1 := by
  intro x hx
  have h0 : x ∈ e0 := (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).1
  have h1 : x ∈ e1 := (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2
  have h14 : x ∈ ({14} : Finset CU) := (Finset.mem_inter.mp hx).2
  have hx14 : x = (14 : CU) := by simpa using h14
  subst x
  simp [K01, CD01, h0, h1]

lemma triple_shared_subset_K02 (e0 e2 : Finset CU) :
    (e0 ∩ e2 ∩ ({13} : Finset CU)) ⊆ K02 e0 e2 := by
  intro x hx
  have h0 : x ∈ e0 := (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).1
  have h2 : x ∈ e2 := (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2
  have h13 : x ∈ ({13} : Finset CU) := (Finset.mem_inter.mp hx).2
  have hx13 : x = (13 : CU) := by simpa using h13
  subst x
  simp [K02, CD02, h0, h2]

lemma cross01_shared_disjoint (e0 e1 : Finset CU) :
    Disjoint (cross01a e0) (e0 ∩ e1 ∩ ({14} : Finset CU)) := by
  rw [Finset.disjoint_left]
  intro x hA hM
  have hI1 : x ∈ CI1 := (Finset.mem_inter.mp hA).2
  have h14 : x ∈ ({14} : Finset CU) := (Finset.mem_inter.mp hM).2
  fin_cases x <;> simp_all [CI1]

lemma cross01b_shared_disjoint (e0 e1 : Finset CU) :
    Disjoint (cross01b e1) (e0 ∩ e1 ∩ ({14} : Finset CU)) := by
  rw [Finset.disjoint_left]
  intro x hB hM
  have hI0 : x ∈ CI0 := (Finset.mem_inter.mp hB).2
  have h14 : x ∈ ({14} : Finset CU) := (Finset.mem_inter.mp hM).2
  fin_cases x <;> simp_all [CI0]

lemma cross02_shared_disjoint (e0 e2 : Finset CU) :
    Disjoint (cross02a e0) (e0 ∩ e2 ∩ ({13} : Finset CU)) := by
  rw [Finset.disjoint_left]
  intro x hA hM
  have hI2 : x ∈ CI2 := (Finset.mem_inter.mp hA).2
  have h13 : x ∈ ({13} : Finset CU) := (Finset.mem_inter.mp hM).2
  fin_cases x <;> simp_all [CI2]

lemma cross02b_shared_disjoint (e0 e2 : Finset CU) :
    Disjoint (cross02b e2) (e0 ∩ e2 ∩ ({13} : Finset CU)) := by
  rw [Finset.disjoint_left]
  intro x hB hM
  have hI0 : x ∈ CI0 := (Finset.mem_inter.mp hB).2
  have h13 : x ∈ ({13} : Finset CU) := (Finset.mem_inter.mp hM).2
  fin_cases x <;> simp_all [CI0]

lemma pair_cut_card_01_shared (e0 e1 : Finset CU)
    (hK : (K01 e0 e1).card ≤ 1) :
    (cross01a e0).card + (cross01b e1).card +
      (e0 ∩ e1 ∩ ({14} : Finset CU)).card ≤ 1 := by
  apply card_sum_three_le_one
    (cross01a e0) (cross01b e1) (e0 ∩ e1 ∩ ({14} : Finset CU)) (K01 e0 e1)
  · exact cross01_disjoint e0 e1
  · exact cross01_shared_disjoint e0 e1
  · exact cross01b_shared_disjoint e0 e1
  · intro x hx
    rcases Finset.mem_union.mp hx with hxy | hm
    · exact cross01_subset_K01 e0 e1 hxy
    · exact triple_shared_subset_K01 e0 e1 hm
  · exact hK

lemma pair_cut_card_02_shared (e0 e2 : Finset CU)
    (hK : (K02 e0 e2).card ≤ 1) :
    (cross02a e0).card + (cross02b e2).card +
      (e0 ∩ e2 ∩ ({13} : Finset CU)).card ≤ 1 := by
  apply card_sum_three_le_one
    (cross02a e0) (cross02b e2) (e0 ∩ e2 ∩ ({13} : Finset CU)) (K02 e0 e2)
  · exact cross02_disjoint e0 e2
  · exact cross02_shared_disjoint e0 e2
  · exact cross02b_shared_disjoint e0 e2
  · intro x hx
    rcases Finset.mem_union.mp hx with hxy | hm
    · exact cross02_subset_K02 e0 e2 hxy
    · exact triple_shared_subset_K02 e0 e2 hm
  · exact hK

lemma rich_extras_no_12
    (e0 e1 e2 : Finset CU)
    (he0 : e0.card = 2) (he1 : e1.card = 2) (he2 : e2.card = 2)
    (hd0 : Disjoint e0 (CI0 ∪ ({12} : Finset CU)))
    (hd1 : Disjoint e1 (CI1 ∪ ({13} : Finset CU)))
    (hd2 : Disjoint e2 (CI2 ∪ ({14} : Finset CU)))
    (h12_1 : (12 : CU) ∉ e1) (h12_2 : (12 : CU) ∉ e2)
    (hcut01 : (K01 e0 e1).card ≤ 1)
    (hcut02 : (K02 e0 e2).card ≤ 1)
    (hcut12 : (K12 e1 e2).card ≤ 1) : False := by
  have hE0 := extra0_decomp_inter e0 hd0
  have hE1 := extra1_decomp_inter e1 hd1 h12_1
  have hE2 := extra2_decomp_inter e2 hd2 h12_2
  have hcover0 : e0 ⊆ cross01a e0 ∪ cross02a e0 ∪
      (e0 ∩ ({13} : Finset CU)) ∪ (e0 ∩ ({14} : Finset CU)) := by
    intro x hx
    rw [hE0] at hx
    exact hx
  have hcover1 : e1 ⊆ cross01b e1 ∪ cross12a e1 ∪
      (e1 ∩ ({12} : Finset CU)) ∪ (e1 ∩ ({14} : Finset CU)) := by
    intro x hx
    rw [hE1] at hx
    exact hx
  have hcover2 : e2 ⊆ cross02b e2 ∪ cross12b e2 ∪
      (e2 ∩ ({12} : Finset CU)) ∪ (e2 ∩ ({13} : Finset CU)) := by
    intro x hx
    rw [hE2] at hx
    exact hx
  have hsub0a : cross01a e0 ⊆ e0 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub0b : cross02a e0 ⊆ e0 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub0c : e0 ∩ ({13} : Finset CU) ⊆ e0 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub0d : e0 ∩ ({14} : Finset CU) ⊆ e0 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub1a : cross01b e1 ⊆ e1 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub1b : cross12a e1 ⊆ e1 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub1c : e1 ∩ ({12} : Finset CU) ⊆ e1 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub1d : e1 ∩ ({14} : Finset CU) ⊆ e1 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub2a : cross02b e2 ⊆ e2 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub2b : cross12b e2 ⊆ e2 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub2c : e2 ∩ ({12} : Finset CU) ⊆ e2 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hsub2d : e2 ∩ ({13} : Finset CU) ⊆ e2 := by
    intro x hx
    exact (Finset.mem_inter.mp hx).1
  have hcard0 : e0.card = (cross01a e0).card + (cross02a e0).card +
      (e0 ∩ ({13} : Finset CU)).card + (e0 ∩ ({14} : Finset CU)).card := by
    apply card_sum_eq_of_cover4 e0 (cross01a e0) (cross02a e0)
      (e0 ∩ ({13} : Finset CU)) (e0 ∩ ({14} : Finset CU))
    · exact he0
    · exact hcover0
    · exact hsub0a
    · exact hsub0b
    · exact hsub0c
    · exact hsub0d
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
    · exact inter_disjoint_of_disjoint (C := e0) (D := e0) (by decide)
  have hcard1 : e1.card = (cross01b e1).card + (cross12a e1).card +
      (e1 ∩ ({12} : Finset CU)).card + (e1 ∩ ({14} : Finset CU)).card := by
    apply card_sum_eq_of_cover4 e1 (cross01b e1) (cross12a e1)
      (e1 ∩ ({12} : Finset CU)) (e1 ∩ ({14} : Finset CU))
    · exact he1
    · exact hcover1
    · exact hsub1a
    · exact hsub1b
    · exact hsub1c
    · exact hsub1d
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
    · exact inter_disjoint_of_disjoint (C := e1) (D := e1) (by decide)
  have hcard2 : e2.card = (cross02b e2).card + (cross12b e2).card +
      (e2 ∩ ({12} : Finset CU)).card + (e2 ∩ ({13} : Finset CU)).card := by
    apply card_sum_eq_of_cover4 e2 (cross02b e2) (cross12b e2)
      (e2 ∩ ({12} : Finset CU)) (e2 ∩ ({13} : Finset CU))
    · exact he2
    · exact hcover2
    · exact hsub2a
    · exact hsub2b
    · exact hsub2c
    · exact hsub2d
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
    · exact inter_disjoint_of_disjoint (C := e2) (D := e2) (by decide)
  let x : Nat := (cross01a e0).card
  let y : Nat := (cross02a e0).card
  let p : Nat := (e0 ∩ ({13} : Finset CU)).card
  let q : Nat := (e0 ∩ ({14} : Finset CU)).card
  let u : Nat := (cross01b e1).card
  let v : Nat := (cross12a e1).card
  let s : Nat := (e1 ∩ ({14} : Finset CU)).card
  let w : Nat := (cross02b e2).card
  let z : Nat := (cross12b e2).card
  let t : Nat := (e2 ∩ ({13} : Finset CU)).card
  let m : Nat := (e0 ∩ e1 ∩ ({14} : Finset CU)).card
  let n : Nat := (e0 ∩ e2 ∩ ({13} : Finset CU)).card
  have hx : x + y + p + q = 2 := by
    dsimp [x, y, p, q]
    omega
  have hu : u + v + s = 2 := by
    have hz : (e1 ∩ ({12} : Finset CU)).card = 0 := by simp [h12_1]
    dsimp [u, v, s]
    omega
  have hw : w + z + t = 2 := by
    have hz : (e2 ∩ ({12} : Finset CU)).card = 0 := by simp [h12_2]
    dsimp [w, z, t]
    omega
  have hp : p ≤ 1 := by
    dsimp [p]
    exact card_inter_singleton_le_one 13 e0
  have hq : q ≤ 1 := by
    dsimp [q]
    exact card_inter_singleton_le_one 14 e0
  have hs : s ≤ 1 := by
    dsimp [s]
    exact card_inter_singleton_le_one 14 e1
  have ht : t ≤ 1 := by
    dsimp [t]
    exact card_inter_singleton_le_one 13 e2
  have hm : m ≤ q := by
    dsimp [m, q]
    exact card_inter_singleton_le 14 e0 e1
  have hm' : m ≤ s := by
    dsimp [m, s]
    exact shared_singleton_card_le 14 e0 e1
  have hm'' : q + s ≤ 1 + m := by
    dsimp [m, q, s]
    exact singleton_pair_card_bound 14 e0 e1
  have hn : n ≤ p := by
    dsimp [n, p]
    exact card_inter_singleton_le 13 e0 e2
  have hn' : n ≤ t := by
    dsimp [n, t]
    exact shared_singleton_card_le 13 e0 e2
  have hn'' : p + t ≤ 1 + n := by
    dsimp [n, p, t]
    exact singleton_pair_card_bound 13 e0 e2
  have h1 : x + u + m ≤ 1 := by
    dsimp [x, u, m]
    exact pair_cut_card_01_shared e0 e1 hcut01
  have h2 : y + w + n ≤ 1 := by
    dsimp [y, w, n]
    exact pair_cut_card_02_shared e0 e2 hcut02
  have h3 : v + z ≤ 1 := by
    dsimp [v, z]
    exact pair_cut_card_12 e1 e2 hcut12
  exact rich_count_contradiction x y p q u v s w z t m n hx hu hw hp hq hs ht
    hm hm' hm'' hn hn' hn'' h1 h2 h3

theorem rich_apex_cover_12_constructive_core
    (e0 e1 e2 : Finset CU)
    (he0 : e0.card = 2) (he1 : e1.card = 2) (he2 : e2.card = 2)
    (hd0 : Disjoint e0 (CI0 ∪ ({12} : Finset CU)))
    (hd1 : Disjoint e1 (CI1 ∪ ({13} : Finset CU)))
    (hd2 : Disjoint e2 (CI2 ∪ ({14} : Finset CU)))
    (hcut01 : (K01 e0 e1).card ≤ 1)
    (hcut02 : (K02 e0 e2).card ≤ 1)
    (hcut12 : (K12 e1 e2).card ≤ 1) :
    (12 : CU) ∈ (CI1 ∪ e1) ∪ (CI2 ∪ e2) := by
  by_contra hnot
  have hnot1 : (12 : CU) ∉ e1 := by
    intro hx
    apply hnot
    simp only [Finset.mem_union]
    exact Or.inl (Or.inr hx)
  have hnot2 : (12 : CU) ∉ e2 := by
    intro hx
    apply hnot
    simp only [Finset.mem_union]
    exact Or.inr (Or.inr hx)
  exact rich_extras_no_12 e0 e1 e2 he0 he1 he2 hd0 hd1 hd2
    hnot1 hnot2 hcut01 hcut02 hcut12

end Problem97
