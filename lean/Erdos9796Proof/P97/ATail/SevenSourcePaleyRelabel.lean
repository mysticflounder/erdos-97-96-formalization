/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.SevenSourceTournament

/-!
# Kernel-clean seven-source Paley relabeling

This file separates the hand classification of the seven-row incidence
surface from the historical Boolean classifier.  The only finite case split
below is on the two orientations of each of the two three-cycles; no
enumeration of seven-row systems is used.
-/

namespace Problem97
namespace SevenSourcePaleyRelabel

abbrev Vertex := Fin 7

private theorem rows_injective
    (rows : Vertex → Finset Vertex)
    (hself : ∀ i, i ∈ rows i)
    (hone : ∀ i j, i ≠ j → (j ∈ rows i ↔ i ∉ rows j)) :
    Function.Injective rows := by
  intro i j hij
  by_contra hne
  have hji : j ∈ rows i := by simpa [hij] using hself j
  have hnot : i ∉ rows j := (hone i j hne).mp hji
  exact hnot (by simpa [hij] using hself i)

private theorem row_membership_count
    (rows : Vertex → Finset Vertex)
    (hcard : ∀ i, (rows i).card = 4)
    (hself : ∀ i, i ∈ rows i)
    (hone : ∀ i j, i ≠ j → (j ∈ rows i ↔ i ∉ rows j))
    (x : Vertex) :
    (Finset.univ.filter (fun i => x ∈ rows i)).card = 4 := by
  have hset :
      Finset.univ.filter (fun i => x ∈ rows i) =
        insert x (Finset.univ \ rows x) := by
    ext i
    by_cases hix : i = x
    · subst i
      simp [hself]
    · have hrel : x ∈ rows i ↔ i ∉ rows x :=
        by simpa only [not_not] using
          (not_congr (hone x i (Ne.symm hix))).symm
      simp [hix, hrel]
  rw [hset, Finset.card_insert_of_notMem]
  · rw [Finset.card_sdiff_of_subset (Finset.subset_univ (rows x))]
    simp [hcard]
  · simp [hself]

private theorem complement_eq_three_with_two
    (rows : Vertex → Finset Vertex)
    (i x : Vertex)
    (hcard : (rows i).card = 4)
    (hzero : 0 ∈ (Finset.univ \ rows i))
    (hx : x ∈ (Finset.univ \ rows i))
    (hxzero : x ≠ 0) :
    ∃ d, d ≠ 0 ∧ d ≠ x ∧
      (Finset.univ \ rows i) = {0, x, d} := by
  let M := Finset.univ \ rows i
  have hMcard : M.card = 3 := by
    dsimp [M]
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ (rows i))]
    simp [hcard]
  have hMzero : 0 ∈ M := hzero
  have hxMzero : x ∈ M.erase 0 := by
    exact Finset.mem_erase.mpr ⟨hxzero, hx⟩
  have hMzeroCard : (M.erase 0).card = 2 := by
    simp [hMcard, hMzero]
  have hrestCard : ((M.erase 0).erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxMzero]
    simp [hMzeroCard]
  obtain ⟨d, hd⟩ := Finset.card_eq_one.mp hrestCard
  have hdrest : d ∈ (M.erase 0).erase x := by
    rw [hd]
    simp
  have hdx : d ≠ x := (Finset.mem_erase.mp hdrest).1
  have hdzero : d ≠ 0 :=
    (Finset.mem_erase.mp (Finset.mem_of_mem_erase hdrest)).1
  have hMrest : M.erase 0 = {x, d} := by
    calc
      M.erase 0 = insert x ((M.erase 0).erase x) :=
        (Finset.insert_erase hxMzero).symm
      _ = {x, d} := by rw [hd]
  have hM : M = {0, x, d} := by
    calc
      M = insert 0 (M.erase 0) := (Finset.insert_erase hMzero).symm
      _ = {0, x, d} := by rw [hMrest]
  refine ⟨d, hdzero, hdx, ?_⟩
  simpa [M] using hM

private theorem complement_eq_three_of_mem
    (rows : Vertex → Finset Vertex)
    (i x y z : Vertex)
    (hcard : (rows i).card = 4)
    (hx : x ∈ (Finset.univ \ rows i))
    (hy : y ∈ (Finset.univ \ rows i))
    (hz : z ∈ (Finset.univ \ rows i))
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    (Finset.univ \ rows i) = {x, y, z} := by
  have hMcard : (Finset.univ \ rows i).card = 3 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ (rows i))]
    simp [hcard]
  have hsub : ({x, y, z} : Finset Vertex) ⊆ Finset.univ \ rows i := by
    intro t ht
    simp only [Finset.mem_insert, Finset.mem_singleton] at ht
    rcases ht with rfl | rfl | rfl
    · exact hx
    · exact hy
    · exact hz
  exact (Finset.eq_of_subset_of_card_le hsub (by
    simp [hMcard, hxy, hxz, hyz])).symm

private theorem pairwise_inter_eq_two
    (rows : Vertex → Finset Vertex)
    (hcard : ∀ i, (rows i).card = 4)
    (hself : ∀ i, i ∈ rows i)
    (hone : ∀ i j, i ≠ j → (j ∈ rows i ↔ i ∉ rows j))
    (hinter : ∀ i j, i ≠ j → ((rows i) ∩ rows j).card ≤ 2) :
    ∀ i j, i ≠ j → ((rows i) ∩ rows j).card = 2 := by
  classical
  have hinj : Function.Injective rows := rows_injective rows hself hone
  let family : Finset (Finset Vertex) := Finset.univ.image rows
  have hfamily_card : family.card = 7 := by
    simp [family, Finset.card_image_of_injective _ hinj, Fintype.card_fin]
  have hfamily_mem (i : Vertex) : rows i ∈ family := by
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  have hfamily_count (x : Vertex) :
      (family.filter (fun s => x ∈ s)).card = 4 := by
    let indices := Finset.univ.filter (fun i => x ∈ rows i)
    have hbij : indices.card = (family.filter (fun s => x ∈ s)).card := by
      apply Finset.card_bij (s := indices)
        (t := family.filter (fun s => x ∈ s)) (fun i _ => rows i)
      · intro i hi
        exact Finset.mem_filter.mpr ⟨hfamily_mem i, (by simpa [indices] using hi)⟩
      · intro i hi j hj heq
        exact hinj heq
      · intro s hs
        rcases Finset.mem_image.mp (Finset.mem_filter.mp hs).1 with
          ⟨i, hi, rfl⟩
        exact ⟨i, Finset.mem_filter.mpr ⟨hi,
          (Finset.mem_filter.mp hs).2⟩, rfl⟩
    rw [← hbij]
    exact row_membership_count rows hcard hself hone x
  intro i j hij
  have hsum :
      (∑ s ∈ family, ((rows i) ∩ s).card) = 16 := by
    calc
      (∑ s ∈ family, ((rows i) ∩ s).card) = (rows i).card * 4 := by
        simpa using (Finset.sum_card_inter
          (s := rows i) (B := family)
          (fun x _ => hfamily_count x))
      _ = 16 := by simp [hcard]
  have herase_le :
      (∑ s ∈ family.erase (rows i), ((rows i) ∩ s).card) ≤ 12 := by
    calc
      (∑ s ∈ family.erase (rows i), ((rows i) ∩ s).card) ≤
          ∑ _s ∈ family.erase (rows i), 2 := by
        apply Finset.sum_le_sum
        intro s hs
        rcases Finset.mem_image.mp (Finset.mem_of_mem_erase hs) with
          ⟨k, hk, rfl⟩
        have hik : i ≠ k := by
          intro h
          exact (Finset.mem_erase.mp hs).1 (by simpa [h])
        exact hinter i k hik
      _ = (family.erase (rows i)).card * 2 := by simp
      _ = 12 := by simp [hfamily_card, hfamily_mem]
  have herase_eq :
      (∑ s ∈ family.erase (rows i), ((rows i) ∩ s).card) = 12 := by
    have hsum' :
        (∑ s ∈ family.erase (rows i), ((rows i) ∩ s).card) +
          ((rows i) ∩ rows i).card = 16 := by
      exact (Finset.sum_erase_add family
        (fun s => ((rows i) ∩ s).card) (hfamily_mem i)).trans hsum
    have hselfterm : ((rows i) ∩ rows i).card = 4 := by
      simp [hcard]
    omega
  have hterm_eq (s : Finset Vertex)
      (hs : s ∈ family.erase (rows i)) :
      ((rows i) ∩ s).card = 2 := by
    have hle : ((rows i) ∩ s).card ≤ 2 := by
      rcases Finset.mem_image.mp (Finset.mem_of_mem_erase hs) with
        ⟨k, hk, rfl⟩
      have hik : i ≠ k := by
        intro h
        exact (Finset.mem_erase.mp hs).1 (by simpa [h])
      exact hinter i k hik
    by_contra hne
    have hlt : ((rows i) ∩ s).card ≤ 1 := by omega
    have hrest_le :
        (∑ t ∈ (family.erase (rows i)).erase s,
          ((rows i) ∩ t).card) ≤ 10 := by
      calc
        (∑ t ∈ (family.erase (rows i)).erase s,
            ((rows i) ∩ t).card) ≤
            ∑ _t ∈ (family.erase (rows i)).erase s, 2 := by
          apply Finset.sum_le_sum
          intro t ht
          exact le_trans
            (by
              rcases Finset.mem_image.mp
                  (Finset.mem_of_mem_erase
                    (Finset.mem_of_mem_erase ht)) with
                ⟨k, hk, rfl⟩
              have hik : i ≠ k := by
                intro h
                exact (Finset.mem_erase.mp
                  (Finset.mem_of_mem_erase ht)).1 (by simpa [h])
              exact hinter i k hik)
            (Nat.le_refl 2)
        _ = ((family.erase (rows i)).erase s).card * 2 := by simp
        _ = 10 := by
          simp [hfamily_card, hfamily_mem, hs]
    have hsum' :
        (∑ t ∈ (family.erase (rows i)).erase s,
          ((rows i) ∩ t).card) + ((rows i) ∩ s).card = 12 := by
      exact (Finset.sum_erase_add (family.erase (rows i))
        (fun t => ((rows i) ∩ t).card) hs).trans herase_eq
    omega
  have hrowsjmem : rows j ∈ family.erase (rows i) := by
    refine Finset.mem_erase.mpr ⟨?_, hfamily_mem j⟩
    intro heq
    exact hij (hinj heq.symm)
  exact hterm_eq (rows j) hrowsjmem

private theorem exactly_one_other_in_row
    (rows : Vertex → Finset Vertex)
    (x y z : Vertex)
    (hrow0 : rows 0 = {0, x, y, z})
    (hxrow0 : x ∈ rows 0)
    (hyrow0 : y ∈ rows 0)
    (hzrow0 : z ∈ rows 0)
    (hzero : 0 ∉ rows x)
    (hselfx : x ∈ rows x)
    (hinter : (rows x ∩ rows 0).card = 2)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    (y ∈ rows x ∧ z ∉ rows x) ∨
      (y ∉ rows x ∧ z ∈ rows x) := by
  by_cases hy : y ∈ rows x
  · have hz : z ∉ rows x := by
      intro hz
      have hsub : ∀ ⦃t : Vertex⦄,
          t ∈ ({x, y, z} : Finset Vertex) →
            t ∈ (rows x ∩ rows 0 : Finset Vertex) := by
        intro t ht
        simp only [Finset.mem_insert, Finset.mem_singleton] at ht
        rcases ht with rfl | rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hselfx, hxrow0⟩
        · exact Finset.mem_inter.mpr ⟨hy, hyrow0⟩
        · exact Finset.mem_inter.mpr ⟨hz, hzrow0⟩
      have hle := Finset.card_le_card hsub
      have hcard3 : ({x, y, z} : Finset Vertex).card = 3 := by
        simp [hxy, hxz, hyz]
      rw [hcard3, hinter] at hle
      omega
    exact Or.inl ⟨hy, hz⟩
  · have hz : z ∈ rows x := by
      by_contra hz
      have hsub : ∀ ⦃t : Vertex⦄,
          t ∈ (rows x ∩ rows 0 : Finset Vertex) →
            t ∈ ({x} : Finset Vertex) := by
        intro t ht
        have hcases : t = 0 ∨ t = x ∨ t = y ∨ t = z := by
          simpa [hrow0] using (Finset.mem_inter.mp ht).2
        rcases hcases with rfl | rfl | rfl | rfl
        · exact (hzero (Finset.mem_inter.mp ht).1).elim
        · simp
        · exact (hy (Finset.mem_inter.mp ht).1).elim
        · exact (hz (Finset.mem_inter.mp ht).1).elim
      have hle := Finset.card_le_card hsub
      rw [hinter] at hle
      simp at hle
    exact Or.inr ⟨hy, hz⟩

private theorem normalized_rows
    (rows : Vertex → Finset Vertex)
    (hcard : ∀ i, (rows i).card = 4)
    (hself : ∀ i, i ∈ rows i)
    (hone : ∀ i j, i ≠ j → (j ∈ rows i ↔ i ∉ rows j))
    (hinter : ∀ i j, i ≠ j → ((rows i) ∩ rows j).card ≤ 2) :
    ∃ a b c d e f : Vertex,
      ({0, a, b, c, d, e, f} : Finset Vertex).card = 7 ∧
      rows 0 = {0, a, b, c} ∧
      rows a = {a, b, e, f} ∧
      rows b = {b, c, d, f} ∧
      rows c = {c, a, d, e} ∧
      rows d = {0, a, d, f} ∧
      rows e = {0, b, e, d} ∧
      rows f = {0, c, f, e} := by
  classical
  have hinterEq := pairwise_inter_eq_two rows hcard hself hone hinter
  have hzero : (0 : Vertex) ∈ rows 0 := hself 0
  have hAcard : ((rows 0).erase 0).card = 3 := by
    simp [hcard, hzero]
  obtain ⟨a0, b0, c0, hab0, hac0, hbc0, hAeq⟩ :=
    Finset.card_eq_three.mp hAcard
  have haA : a0 ∈ (rows 0).erase 0 := by rw [hAeq]; simp
  have hbA0 : b0 ∈ (rows 0).erase 0 := by rw [hAeq]; simp
  have hcA0 : c0 ∈ (rows 0).erase 0 := by rw [hAeq]; simp
  have ha0 : a0 ≠ 0 := (Finset.mem_erase.mp haA).1
  have hb0 : b0 ≠ 0 := (Finset.mem_erase.mp hbA0).1
  have hc0 : c0 ≠ 0 := (Finset.mem_erase.mp hcA0).1
  have haRow0 : a0 ∈ rows 0 := (Finset.mem_erase.mp haA).2
  have hb0Row0 : b0 ∈ rows 0 := (Finset.mem_erase.mp hbA0).2
  have hc0Row0 : c0 ∈ rows 0 := (Finset.mem_erase.mp hcA0).2
  have hrow0 : rows 0 = {0, a0, b0, c0} := by
    calc
      rows 0 = insert 0 ((rows 0).erase 0) :=
        (Finset.insert_erase hzero).symm
      _ = {0, a0, b0, c0} := by rw [hAeq]
  have hzero_a : 0 ∉ rows a0 :=
    (hone 0 a0 (Ne.symm ha0)).mp haRow0
  have hinter_a : (rows a0 ∩ rows 0).card = 2 := by
    simpa [Finset.inter_comm] using hinterEq 0 a0 (Ne.symm ha0)
  have hAorient := exactly_one_other_in_row rows a0 b0 c0 hrow0
    haRow0 hb0Row0 hc0Row0 hzero_a (hself a0) hinter_a hab0 hac0 hbc0
  let b : Vertex := if b0 ∈ rows a0 then b0 else c0
  let c : Vertex := if b0 ∈ rows a0 then c0 else b0
  have hrow0' : rows 0 = {0, a0, b, c} := by
    ext x
    rw [hrow0]
    by_cases h : b0 ∈ rows a0 <;>
      simp [b, c, h, or_comm, or_left_comm, or_assoc]
  have hbA : b ∈ rows a0 := by
    by_cases h : b0 ∈ rows a0
    · simp [b, h]
    · rcases hAorient with ⟨hb, _⟩ | ⟨_, hc⟩
      · exact (h hb).elim
      · simpa [b, h] using hc
  have hcNotA : c ∉ rows a0 := by
    by_cases h : b0 ∈ rows a0
    · rcases hAorient with ⟨_, hc⟩ | ⟨hb, _⟩
      · simpa [c, h] using hc
      · exact (hb h).elim
    · rcases hAorient with ⟨hb, _⟩ | ⟨_, hc⟩
      · exact (h hb).elim
      · exact (by simpa [c, h] using hc : c ∉ rows a0)
  have hbRow0 : b ∈ rows 0 := by
    by_cases h : b0 ∈ rows a0
    · simpa [b, h] using hb0Row0
    · simpa [b, h] using hc0Row0
  have hcRow0 : c ∈ rows 0 := by
    by_cases h : b0 ∈ rows a0
    · simpa [c, h] using hc0Row0
    · simpa [c, h] using hb0Row0
  have hb0' : b ≠ 0 := by
    by_cases h : b0 ∈ rows a0 <;> simp [b, h, hb0, hc0]
  have hc0' : c ≠ 0 := by
    by_cases h : b0 ∈ rows a0 <;> simp [c, h, hb0, hc0]
  have hab : a0 ≠ b := by
    by_cases h : b0 ∈ rows a0 <;> simp [b, h, hab0, hac0]
  have hac : a0 ≠ c := by
    by_cases h : b0 ∈ rows a0 <;> simp [c, h, hab0, hac0]
  have hbc : b ≠ c := by
    by_cases h : b0 ∈ rows a0
    · simpa [b, c, h] using hbc0
    · simpa [b, c, h] using hbc0.symm
  have hzero_b : 0 ∉ rows b :=
    (hone 0 b (Ne.symm hb0')).mp hbRow0
  have hzero_c : 0 ∉ rows c :=
    (hone 0 c (Ne.symm hc0')).mp hcRow0
  have hinter_b : (rows b ∩ rows 0).card = 2 := by
    simpa [Finset.inter_comm] using hinterEq 0 b (Ne.symm hb0')
  have hinter_c : (rows c ∩ rows 0).card = 2 := by
    simpa [Finset.inter_comm] using hinterEq 0 c (Ne.symm hc0')
  have haNotB : a0 ∉ rows b := (hone a0 b hab).mp hbA
  have hrow0_b : rows 0 = {0, b, a0, c} := by
    ext x
    rw [hrow0']
    simp [or_comm, or_left_comm, or_assoc]
  have hBorient := exactly_one_other_in_row rows b a0 c hrow0_b
    hbRow0 haRow0 hcRow0 hzero_b (hself b) hinter_b hab.symm hbc
      hac
  have hcB : c ∈ rows b := by
    rcases hBorient with ⟨ha, _⟩ | ⟨_, hc⟩
    · exact (haNotB ha).elim
    · exact hc
  have hbNotC : b ∉ rows c := (hone b c hbc).mp hcB
  have hrow0_c : rows 0 = {0, c, a0, b} := by
    ext x
    rw [hrow0']
    simp [or_comm, or_left_comm, or_assoc]
  have hCorient := exactly_one_other_in_row rows c a0 b hrow0_c
    hcRow0 haRow0 hbRow0 hzero_c (hself c) hinter_c hac.symm hbc.symm
      hab
  have haC : a0 ∈ rows c := by
    rcases hCorient with ⟨ha, _⟩ | ⟨_, hb⟩
    · exact ha
    · exact (hbNotC hb).elim
  let B : Finset Vertex := Finset.univ \ rows 0
  have hBcard : B.card = 3 := by
    dsimp [B]
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ (rows 0))]
    simp [hcard]
  obtain ⟨d, hd0, hdc, hMa⟩ := complement_eq_three_with_two rows a0 c
    (hcard a0) (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hzero_a⟩)
    (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hcNotA⟩) hc0'
  obtain ⟨e, he0, hea, hMb⟩ := complement_eq_three_with_two rows b a0
    (hcard b) (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hzero_b⟩)
    (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, haNotB⟩) ha0
  obtain ⟨f, hf0, hfb, hMc⟩ := complement_eq_three_with_two rows c b
    (hcard c) (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hzero_c⟩)
    (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hbNotC⟩) hb0'
  have hdMa : d ∈ (Finset.univ \ rows a0) := by rw [hMa]; simp
  have heMb : e ∈ (Finset.univ \ rows b) := by rw [hMb]; simp
  have hfMc : f ∈ (Finset.univ \ rows c) := by rw [hMc]; simp
  have hdnot_a : d ∉ rows a0 := (Finset.mem_sdiff.mp hdMa).2
  have henot_b : e ∉ rows b := (Finset.mem_sdiff.mp heMb).2
  have hfnot_c : f ∉ rows c := (Finset.mem_sdiff.mp hfMc).2
  have hB_d : d ∈ B := by
    apply Finset.mem_sdiff.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    intro hdrow
    have hcases : d = 0 ∨ d = a0 ∨ d = b ∨ d = c := by
      simpa [hrow0'] using hdrow
    rcases hcases with h | h | h | h
    · exact hd0 h
    · exact hdnot_a (by simpa [h] using hself a0)
    · exact hdnot_a (by simpa [h] using hbA)
    · exact hdc h
  have hB_e : e ∈ B := by
    apply Finset.mem_sdiff.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    intro herow
    have hcases : e = 0 ∨ e = a0 ∨ e = b ∨ e = c := by
      simpa [hrow0'] using herow
    rcases hcases with h | h | h | h
    · exact he0 h
    · exact hea h
    · exact henot_b (by simpa [h] using hself b)
    · exact henot_b (by simpa [h] using hcB)
  have hB_f : f ∈ B := by
    apply Finset.mem_sdiff.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    intro hfrow
    have hcases : f = 0 ∨ f = a0 ∨ f = b ∨ f = c := by
      simpa [hrow0'] using hfrow
    rcases hcases with h | h | h | h
    · exact hf0 h
    · exact hfnot_c (by simpa [h] using haC)
    · exact hfb h
    · exact hfnot_c (by simpa [h] using hself c)
  have hbad_pair (x r s : Vertex)
      (hxB : x ∈ B) (hr0 : r ∈ rows 0) (hs0 : s ∈ rows 0)
      (hrzero : r ≠ 0) (hszero : s ≠ 0) (hrs : r ≠ s)
      (hr : x ∉ rows r) (hs : x ∉ rows s) : False := by
    have hxnot0 : x ∉ rows 0 := (Finset.mem_sdiff.mp hxB).2
    have hxzero : x ≠ 0 := by
      intro hx
      exact hxnot0 (by simpa [hx] using hzero)
    have hxr : x ≠ r := by
      intro h
      exact hxnot0 (by simpa [h] using hr0)
    have hxs : x ≠ s := by
      intro h
      exact hxnot0 (by simpa [h] using hs0)
    have hx0 : 0 ∈ rows x := by
      by_contra h
      exact hxnot0 ((hone 0 x hxzero.symm).mpr h)
    have hxrmem : r ∈ rows x := (hone x r hxr).mpr hr
    have hxs_mem : s ∈ rows x := (hone x s hxs).mpr hs
    have hsub : ∀ ⦃t : Vertex⦄,
        t ∈ ({0, r, s} : Finset Vertex) →
          t ∈ (rows x ∩ rows 0 : Finset Vertex) := by
      intro t ht
      simp only [Finset.mem_insert, Finset.mem_singleton] at ht
      rcases ht with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hx0, hzero⟩
      · exact Finset.mem_inter.mpr ⟨hxrmem, hr0⟩
      · exact Finset.mem_inter.mpr ⟨hxs_mem, hs0⟩
    have hle := Finset.card_le_card hsub
    have hcard3 : ({0, r, s} : Finset Vertex).card = 3 := by
      simp [Finset.card_insert_of_notMem, hrzero, hszero, hrs,
        hrzero.symm, hszero.symm]
    have hix : (rows x ∩ rows 0).card = 2 := by
      simpa [Finset.inter_comm] using hinterEq 0 x hxzero.symm
    rw [hcard3, hix] at hle
    omega
  have hde : d ≠ e := by
    intro h
    exact hbad_pair d a0 b hB_d haRow0 hbRow0 ha0 hb0' hab
      hdnot_a (by simpa [h] using henot_b)
  have hdf : d ≠ f := by
    intro h
    exact hbad_pair d a0 c hB_d haRow0 hcRow0 ha0 hc0' hac
      hdnot_a (by simpa [h] using hfnot_c)
  have hef : e ≠ f := by
    intro h
    exact hbad_pair e b c hB_e hbRow0 hcRow0 hb0' hc0' hbc
      henot_b (by simpa [h] using hfnot_c)
  have hBset : B = {d, e, f} := by
    have hsub : ({d, e, f} : Finset Vertex) ⊆ B := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl
      · exact hB_d
      · exact hB_e
      · exact hB_f
    have heq := Finset.eq_of_subset_of_card_le hsub (by
      simp [hBcard, hde, hdf, hef])
    exact heq.symm
  have hcross {x y : Vertex} (hx : x ∈ B) (hy : y ∈ rows 0) : x ≠ y := by
    intro h
    exact (Finset.mem_sdiff.mp hx).2 (by simpa [h] using hy)
  have hda : a0 ≠ d := Ne.symm (hcross hB_d haRow0)
  have hdb : b ≠ d := Ne.symm (hcross hB_d hbRow0)
  have hdc' : c ≠ d := Ne.symm (hcross hB_d hcRow0)
  have hea' : a0 ≠ e := Ne.symm (hcross hB_e haRow0)
  have heb : b ≠ e := Ne.symm (hcross hB_e hbRow0)
  have hec : c ≠ e := Ne.symm (hcross hB_e hcRow0)
  have hfa : a0 ≠ f := Ne.symm (hcross hB_f haRow0)
  have hfb' : b ≠ f := Ne.symm (hcross hB_f hbRow0)
  have hfc : c ≠ f := Ne.symm (hcross hB_f hcRow0)
  have hlabels : ({0, a0, b, c, d, e, f} : Finset Vertex).card = 7 := by
    have hfMem : f ∉ (∅ : Finset Vertex) := by simp
    have heMem : e ∉ ({f} : Finset Vertex) := by simp [hef]
    have hdMem : d ∉ ({e, f} : Finset Vertex) := by simp [hde, hdf]
    have hcMem : c ∉ ({d, e, f} : Finset Vertex) := by
      simp [hdc', hec, hfc]
    have hbMem : b ∉ ({c, d, e, f} : Finset Vertex) := by
      simp [hbc, hdb, heb, hfb']
    have haMem : a0 ∉ ({b, c, d, e, f} : Finset Vertex) := by
      simp [hab, hac, hda, hea', hfa]
    have hzeroMem : (0 : Vertex) ∉ ({a0, b, c, d, e, f} : Finset Vertex) := by
      simp [ha0, hb0', hc0', hd0, he0, hf0,
        ha0.symm, hb0'.symm, hc0'.symm, hd0.symm, he0.symm, hf0.symm]
    rw [Finset.card_insert_of_notMem hzeroMem,
      Finset.card_insert_of_notMem haMem,
      Finset.card_insert_of_notMem hbMem,
      Finset.card_insert_of_notMem hcMem,
      Finset.card_insert_of_notMem hdMem,
      Finset.card_insert_of_notMem heMem]
    simp
  have sdiff_three
      (u v w p q r s : Vertex)
      (hsub : ({p, q, r, s} : Finset Vertex) ⊆
        (Finset.univ \ {u, v, w} : Finset Vertex))
      (hcard_omit : ({u, v, w} : Finset Vertex).card = 3)
      (hcard_keep : ({p, q, r, s} : Finset Vertex).card = 4) :
      Finset.univ \ {u, v, w} = {p, q, r, s} := by
    have hcard := Finset.card_sdiff_add_card_eq_card
      (Finset.subset_univ ({u, v, w} : Finset Vertex))
    have huniv_card : (Finset.univ : Finset Vertex).card = 7 := by simp
    rw [hcard_omit, huniv_card] at hcard
    have hdiff : (Finset.univ \ {u, v, w} : Finset Vertex).card = 4 := by
      omega
    exact (Finset.eq_of_subset_of_card_le hsub (by rw [hdiff, hcard_keep])).symm
  have huniv : (Finset.univ : Finset Vertex) = {0, a0, b, c, d, e, f} := by
    have hsub : ({0, a0, b, c, d, e, f} : Finset Vertex) ⊆ Finset.univ :=
      Finset.subset_univ _
    have heq := Finset.eq_of_subset_of_card_le hsub (by
      simp [hlabels, Fintype.card_fin])
    exact heq.symm
  have hrowa : rows a0 = {a0, b, e, f} := by
    have hkeep : ({a0, b, e, f} : Finset Vertex) ⊆
        (Finset.univ \ {0, c, d} : Finset Vertex) := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [ha0, hac, hda]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hb0', hbc, hdb]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [he0, hec, hde, hec.symm, hde.symm]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hf0, hfc, hdf, hfc.symm, hdf.symm]⟩
    have hkeep_card : ({a0, b, e, f} : Finset Vertex).card = 4 :=
      Finset.card_eq_four.mpr ⟨a0, b, e, f, hab, hea', hfa, heb, hfb', hef, rfl⟩
    have hsdiff := sdiff_three 0 c d a0 b e f hkeep
      (Finset.card_eq_three.mpr ⟨0, c, d, hc0'.symm, hd0.symm, hdc', rfl⟩) hkeep_card
    calc
      rows a0 = Finset.univ \ (Finset.univ \ rows a0) := by simp
      _ = Finset.univ \ {0, c, d} := by rw [hMa]
      _ = {a0, b, e, f} := hsdiff
  have hrowb : rows b = {b, c, d, f} := by
    have hkeep : ({b, c, d, f} : Finset Vertex) ⊆
        (Finset.univ \ {0, a0, e} : Finset Vertex) := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hb0', hab.symm, heb]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hc0', hac.symm, hec]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hd0, hda.symm, hde]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hf0, hfa.symm, hef.symm]⟩
    have hkeep_card : ({b, c, d, f} : Finset Vertex).card = 4 :=
      Finset.card_eq_four.mpr ⟨b, c, d, f, hbc, hdb, hfb', hdc', hfc, hdf, rfl⟩
    have hsdiff := sdiff_three 0 a0 e b c d f hkeep
      (Finset.card_eq_three.mpr ⟨0, a0, e, ha0.symm, he0.symm, hea', rfl⟩) hkeep_card
    calc
      rows b = Finset.univ \ (Finset.univ \ rows b) := by simp
      _ = Finset.univ \ {0, a0, e} := by rw [hMb]
      _ = {b, c, d, f} := hsdiff
  have hrowc : rows c = {c, a0, d, e} := by
    have hkeep : ({c, a0, d, e} : Finset Vertex) ⊆
        (Finset.univ \ {0, b, f} : Finset Vertex) := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hc0', hbc.symm, hfc]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [ha0, hab, hfa, hfa.symm]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hd0, hdb.symm, hdf]⟩
      · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [he0, heb.symm, hef]⟩
    have hkeep_card : ({c, a0, d, e} : Finset Vertex).card = 4 :=
      Finset.card_eq_four.mpr ⟨c, a0, d, e, hac.symm, hdc', hec, hda, hea', hde, rfl⟩
    have hsdiff := sdiff_three 0 b f c a0 d e hkeep
      (Finset.card_eq_three.mpr ⟨0, b, f, hb0'.symm, hf0.symm, hfb', rfl⟩) hkeep_card
    calc
      rows c = Finset.univ \ (Finset.univ \ rows c) := by simp
      _ = Finset.univ \ {0, b, f} := by rw [hMc]
      _ = {c, a0, d, e} := hsdiff
  have hde_or : e ∈ rows d ∨ d ∈ rows e := by
    by_cases h : e ∈ rows d
    · exact Or.inl h
    · right
      by_contra hdrow
      exact h ((hone d e hde).mpr hdrow)
  rcases hde_or with hed | hde_rowe
  · have hdnot_e : d ∉ rows e := (hone d e hde).mp hed
    have hanot_e : a0 ∉ rows e := by
      apply (hone a0 e hea').mp
      rw [hrowa]
      simp
    have hcnot_e : c ∉ rows e := by
      apply (hone c e hec).mp
      rw [hrowc]
      simp
    have hMe : (Finset.univ \ rows e) = {a0, c, d} :=
      complement_eq_three_of_mem rows e a0 c d (hcard e)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hanot_e⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hcnot_e⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hdnot_e⟩)
        hac hda hdc'
    have hrowe : rows e = {0, b, e, f} := by
      have hkeep : ({0, b, e, f} : Finset Vertex) ⊆
          (Finset.univ \ {a0, c, d} : Finset Vertex) := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl | rfl
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [ha0.symm, hc0'.symm, hd0.symm]⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hab.symm, hbc, hdb]⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hea, hec.symm, hde.symm]⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hfa.symm, hfc.symm, hdf.symm]⟩
      have hkeep_card : ({0, b, e, f} : Finset Vertex).card = 4 :=
        Finset.card_eq_four.mpr ⟨0, b, e, f, hb0'.symm, he0.symm, hf0.symm,
          heb, hfb', hef, rfl⟩
      have hsdiff := sdiff_three a0 c d 0 b e f hkeep
        (Finset.card_eq_three.mpr ⟨a0, c, d, hac, hda, hdc', rfl⟩) hkeep_card
      calc
        rows e = Finset.univ \ (Finset.univ \ rows e) := by simp
        _ = Finset.univ \ {a0, c, d} := by rw [hMe]
        _ = {0, b, e, f} := hsdiff
    have hsub : ∀ ⦃t : Vertex⦄,
        t ∈ ({b, e, f} : Finset Vertex) →
          t ∈ (rows a0 ∩ rows e : Finset Vertex) := by
      intro t ht
      simp only [Finset.mem_insert, Finset.mem_singleton] at ht
      rcases ht with htb | hte | htf
      · subst t
        exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, by rw [hrowe]; simp⟩
      · subst t
        exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, hself e⟩
      · subst t
        exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, by rw [hrowe]; simp⟩
    have hle := Finset.card_le_card hsub
    have hcard3 : ({b, e, f} : Finset Vertex).card = 3 := by
        exact Finset.card_eq_three.mpr ⟨b, e, f, heb, hfb', hef, rfl⟩
    have hie : (rows a0 ∩ rows e).card = 2 :=
      hinterEq a0 e hea'
    rw [hcard3, hie] at hle
    omega
  · have hnot_ed : e ∉ rows d := by
      intro hed
      exact ((hone d e hde).mp hed) hde_rowe
    have hbnot_d : b ∉ rows d := by
      apply (hone b d hdb).mp
      rw [hrowb]
      simp
    have hcnot_d : c ∉ rows d := by
      apply (hone c d hdc').mp
      rw [hrowc]
      simp
    have hMd : (Finset.univ \ rows d) = {b, c, e} :=
      complement_eq_three_of_mem rows d b c e (hcard d)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hbnot_d⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hcnot_d⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hnot_ed⟩)
        hbc heb hec
    have hrowd : rows d = {0, a0, d, f} := by
      have hkeep : ({0, a0, d, f} : Finset Vertex) ⊆
          (Finset.univ \ {b, c, e} : Finset Vertex) := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl | rfl
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hb0'.symm, hc0'.symm, he0.symm]⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hab, hac, hea']⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hdb.symm, hdc'.symm, hde]⟩
        · exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hfb'.symm, hfc.symm, hef.symm]⟩
      have hkeep_card : ({0, a0, d, f} : Finset Vertex).card = 4 :=
        Finset.card_eq_four.mpr ⟨0, a0, d, f, ha0.symm, hd0.symm, hf0.symm,
          hda, hfa, hdf, rfl⟩
      have hsdiff := sdiff_three b c e 0 a0 d f hkeep
        (Finset.card_eq_three.mpr ⟨b, c, e, hbc, heb, hec, rfl⟩) hkeep_card
      calc
        rows d = Finset.univ \ (Finset.univ \ rows d) := by simp
        _ = Finset.univ \ {b, c, e} := by rw [hMd]
        _ = {0, a0, d, f} := hsdiff
    have hbe : b ∈ rows e := (hone e b heb.symm).mpr henot_b
    have hfa_e : a0 ∉ rows e := by
      apply (hone a0 e hea').mp
      rw [hrowa]
      simp
    have hfc_e : c ∉ rows e := by
      apply (hone c e hec).mp
      rw [hrowc]
      simp
    have hfnot_e : f ∉ rows e := by
      intro hfe
      have hsub : ∀ ⦃t : Vertex⦄,
          t ∈ ({b, e, f} : Finset Vertex) →
            t ∈ (rows a0 ∩ rows e : Finset Vertex) := by
        intro t ht
        simp only [Finset.mem_insert, Finset.mem_singleton] at ht
        rcases ht with htb | hte | htf
        · subst t
          exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, hbe⟩
        · subst t
          exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, hself e⟩
        · subst t
          exact Finset.mem_inter.mpr ⟨by rw [hrowa]; simp, hfe⟩
      have hle := Finset.card_le_card hsub
      have hcard3 : ({b, e, f} : Finset Vertex).card = 3 := by
        exact Finset.card_eq_three.mpr ⟨b, e, f, heb, hfb', hef, rfl⟩
      have hie : (rows a0 ∩ rows e).card = 2 := hinterEq a0 e hea'
      rw [hcard3, hie] at hle
      omega
    have hMe : (Finset.univ \ rows e) = {a0, c, f} :=
      complement_eq_three_of_mem rows e a0 c f (hcard e)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfa_e⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfc_e⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfnot_e⟩)
        hac hfa hfc
    have hrowe : rows e = {0, b, e, d} := by
      have hkeep : ({0, b, e, d} : Finset Vertex) ⊆
          (Finset.univ \ {a0, c, f} : Finset Vertex) := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with h0 | hb | he | hd
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [ha0.symm, hc0'.symm, hf0.symm]⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hab.symm, hbc, hfb']⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hea, hec.symm, hef]⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hda.symm, hdc'.symm, hdf]⟩
      have hkeep_card : ({0, b, e, d} : Finset Vertex).card = 4 :=
        Finset.card_eq_four.mpr ⟨0, b, e, d, hb0'.symm, he0.symm, hd0.symm,
          heb, hdb, hde.symm, rfl⟩
      have hsdiff := sdiff_three a0 c f 0 b e d hkeep
        (Finset.card_eq_three.mpr ⟨a0, c, f, hac, hfa, hfc, rfl⟩) hkeep_card
      calc
        rows e = Finset.univ \ (Finset.univ \ rows e) := by simp
        _ = Finset.univ \ {a0, c, f} := by rw [hMe]
        _ = {0, b, e, d} := hsdiff
    have hef_rowf : e ∈ rows f := (hone f e hef.symm).mpr hfnot_e
    have hfa_f : a0 ∉ rows f := by
      apply (hone a0 f hfa).mp
      rw [hrowa]
      simp
    have hfb_f : b ∉ rows f := by
      apply (hone b f hfb').mp
      rw [hrowb]
      simp
    have hfd_f : d ∉ rows f := by
      apply (hone d f hdf).mp
      rw [hrowd]
      simp
    have hMf : (Finset.univ \ rows f) = {a0, b, d} :=
      complement_eq_three_of_mem rows f a0 b d (hcard f)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfa_f⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfb_f⟩)
        (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hfd_f⟩)
        hab hda hdb
    have hrowf : rows f = {0, c, f, e} := by
      have hkeep : ({0, c, f, e} : Finset Vertex) ⊆
          (Finset.univ \ {a0, b, d} : Finset Vertex) := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with h0 | hc | hf | he
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [ha0.symm, hb0'.symm, hd0.symm]⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hac.symm, hbc.symm, hdc']⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hfa.symm, hfb'.symm, hdf.symm]⟩
        · subst x
          exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, by simp [hea, heb.symm, hde.symm]⟩
      have hkeep_card : ({0, c, f, e} : Finset Vertex).card = 4 :=
        Finset.card_eq_four.mpr ⟨0, c, f, e, hc0'.symm, hf0.symm, he0.symm,
          hfc, hec, hef.symm, rfl⟩
      have hsdiff := sdiff_three a0 b d 0 c f e hkeep
        (Finset.card_eq_three.mpr ⟨a0, b, d, hab, hda, hdb, rfl⟩) hkeep_card
      calc
        rows f = Finset.univ \ (Finset.univ \ rows f) := by simp
        _ = Finset.univ \ {a0, b, d} := by rw [hMf]
        _ = {0, c, f, e} := hsdiff
    exact ⟨a0, b, c, d, e, f, hlabels, hrow0', hrowa, hrowb, hrowc,
      hrowd, hrowe, hrowf⟩

/-- A four-row surface with exact one-way coverage and intersections at most two
is a relabeling of the literal seven-point Paley surface.  The proof uses only
the hand normalization above; in particular it does not call the historical
Boolean classifier. -/
theorem exists_perm_rows_eq_paley
    (rows : Vertex → Finset Vertex)
    (hcard : ∀ i, (rows i).card = 4)
    (hself : ∀ i, i ∈ rows i)
    (hcover : ∀ i j, i ≠ j → j ∈ rows i ∨ i ∈ rows j)
    (hinter : ∀ i j, i ≠ j → ((rows i) ∩ rows j).card ≤ 2) :
    ∃ σ : Equiv.Perm Vertex,
      ∀ i j, j ∈ rows i ↔
        σ j ∈ ({σ i, σ i + 1, σ i + 2, σ i + 4} : Finset Vertex) := by
  classical
  have hone :=
    (SevenSourceTournament.exact_support_surface_of_card_le_four_and_pairCovered
      rows (fun i => le_of_eq (hcard i)) hself hcover).2
  obtain ⟨a, b, c, d, e, f, hlabels, hrow0, hrowa, hrowb, hrowc,
      hrowd, hrowe, hrowf⟩ := normalized_rows rows hcard hself hone hinter
  let eMap : Vertex → Vertex := fun i =>
    match i.1 with
    | 0 => 0
    | 1 => a
    | 2 => b
    | 3 => f
    | 4 => c
    | 5 => e
    | _ => d
  have himage : (Finset.univ.image eMap) =
      ({0, a, b, c, d, e, f} : Finset Vertex) := by
    apply Finset.Subset.antisymm
    · intro y hy
      rcases Finset.mem_image.mp hy with ⟨i, -, rfl⟩
      fin_cases i <;> simp [eMap]
    · intro y hy
      simp only [Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · exact Finset.mem_image.mpr ⟨0, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨1, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨2, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨4, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨6, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨5, Finset.mem_univ _, by simp [eMap]⟩
      · exact Finset.mem_image.mpr ⟨3, Finset.mem_univ _, by simp [eMap]⟩
  have heMap_card : (Finset.univ.image eMap).card =
      (Finset.univ : Finset Vertex).card := by
    rw [himage, hlabels]
    simp
  have heMap_injOn : Set.InjOn eMap (↑(Finset.univ : Finset Vertex)) :=
    (Finset.card_image_iff).mp heMap_card
  have heMap_inj : Function.Injective eMap := by
    intro i j hij
    exact heMap_injOn (Finset.mem_univ i) (Finset.mem_univ j) hij
  have heMap_ne : ∀ {i j : Vertex}, i ≠ j → eMap i ≠ eMap j := by
    intro i j hij hEq
    exact hij (heMap_inj hEq)
  have heMap_bij : Function.Bijective eMap :=
    (Fintype.bijective_iff_injective_and_card eMap).2 ⟨heMap_inj, by simp⟩
  let eEquiv : Vertex ≃ Vertex := Equiv.ofBijective eMap heMap_bij
  let σ : Equiv.Perm Vertex := eEquiv.symm
  have hrow0_map : rows (eMap 0) = {eMap 0, eMap 1, eMap 2, eMap 4} := by
    simpa [eEquiv] using hrow0
  have hrowa_map : rows (eMap 1) = {eMap 1, eMap 2, eMap 5, eMap 3} := by
    simpa [eEquiv] using hrowa
  have hrowb_map : rows (eMap 2) = {eMap 2, eMap 4, eMap 6, eMap 3} := by
    simpa [eEquiv] using hrowb
  have hrowc_map : rows (eMap 4) = {eMap 4, eMap 1, eMap 6, eMap 5} := by
    simpa [eEquiv] using hrowc
  have hrowd_map : rows (eMap 6) = {eMap 0, eMap 1, eMap 6, eMap 3} := by
    simpa [eEquiv] using hrowd
  have hrowe_map : rows (eMap 5) = {eMap 0, eMap 2, eMap 5, eMap 6} := by
    simpa [eEquiv] using hrowe
  have hrowf_map : rows (eMap 3) = {eMap 0, eMap 4, eMap 3, eMap 5} := by
    simpa [eEquiv] using hrowf
  refine ⟨σ, ?_⟩
  intro i j
  rcases eEquiv.surjective i with ⟨i, rfl⟩
  rcases eEquiv.surjective j with ⟨j, rfl⟩
  change eMap j ∈ rows (eMap i) ↔
    eEquiv.symm (eMap j) ∈
      ({eEquiv.symm (eMap i), eEquiv.symm (eMap i) + 1,
        eEquiv.symm (eMap i) + 2, eEquiv.symm (eMap i) + 4} : Finset Vertex)
  have hsi : eEquiv.symm (eMap i) = i := by
    change eEquiv.symm (eEquiv i) = i
    exact eEquiv.symm_apply_apply i
  have hsj : eEquiv.symm (eMap j) = j := by
    change eEquiv.symm (eEquiv j) = j
    exact eEquiv.symm_apply_apply j
  rw [hsi, hsj]
  fin_cases i <;> fin_cases j <;>
    simp [hrow0_map, hrowa_map, hrowb_map, hrowc_map, hrowd_map,
      hrowe_map, hrowf_map, heMap_ne]

end SevenSourcePaleyRelabel
end Problem97

#print axioms Problem97.SevenSourcePaleyRelabel.exists_perm_rows_eq_paley
