import Erdos9796Proof.P97.ATail.BlockerVExactFifteenFourRowCoverage
import Mathlib.Order.Fin.Basic

namespace Problem97.ATailFrontierLiveClosure

private theorem not_mem_of_inter_card_le_two_of_three_cap_points
    {α : Type} [DecidableEq α]
    {support cap : Finset α} {extra first second : α}
    (hextraCap : extra ∈ cap) (hfirstCap : first ∈ cap)
    (hsecondCap : second ∈ cap)
    (hfirstSupport : first ∈ support) (hsecondSupport : second ∈ support)
    (hextraFirst : extra ≠ first) (hextraSecond : extra ≠ second)
    (hfirstSecond : first ≠ second)
    (hcard : (support ∩ cap).card ≤ 2) :
    extra ∉ support := by
  intro hextraSupport
  have hsubset : {extra, first, second} ⊆ support ∩ cap := by
    intro point hpoint
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hextraSupport, hextraCap⟩
    · exact Finset.mem_inter.mpr ⟨hfirstSupport, hfirstCap⟩
    · exact Finset.mem_inter.mpr ⟨hsecondSupport, hsecondCap⟩
  have hthree : ({extra, first, second} : Finset α).card = 3 := by
    simp [hextraFirst, hextraSecond, hfirstSecond]
  have := (Finset.card_le_card hsubset).trans hcard
  omega

private theorem support_subset_image_skip
    {n : ℕ} {α : Type} [DecidableEq α]
    {boundary : Fin (n + 1) → α} {carrier support : Finset α}
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hsupport : support ⊆ carrier) (gap : Fin (n + 1))
    (hgap : boundary gap ∉ support) :
    support ⊆ Finset.univ.image (fun i : Fin n => boundary (gap.succAbove i)) := by
  intro point hpoint
  have hcarrier := hsupport hpoint
  rw [← hboundaryImage] at hcarrier
  rcases Finset.mem_image.mp hcarrier with ⟨index, _hindex, hindex⟩
  have hne : index ≠ gap := by
    intro heq
    apply hgap
    rw [← hindex] at hpoint
    simpa [heq] using hpoint
  rcases Fin.exists_succAbove_eq_iff.mpr hne with ⟨index', hindex'⟩
  exact Finset.mem_image.mpr ⟨index', Finset.mem_univ _, by simpa [hindex'] using hindex⟩

private theorem seven_strict_interior_indices_ten
    (a b c d e f g : Fin 10)
    (ha : 0 < a) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hg : g < 9) :
    ∃ gap : Fin 10,
      0 < gap ∧ gap < 9 ∧
      a = gap.succAbove (1 : Fin 9) ∧
      b = gap.succAbove (2 : Fin 9) ∧
      c = gap.succAbove (3 : Fin 9) ∧
      d = gap.succAbove (4 : Fin 9) ∧
      e = gap.succAbove (5 : Fin 9) ∧
      f = gap.succAbove (6 : Fin 9) ∧
      g = gap.succAbove (7 : Fin 9) := by
  obtain ⟨gapNat, hgapLow, hgapHigh, hposA, hposB, hposC,
      hposD, hposE, hposF, hposG⟩ :
      ∃ gapNat : ℕ,
        0 < gapNat ∧ gapNat < 9 ∧
        a.1 = (if 1 < gapNat then 1 else 2) ∧
        b.1 = (if 2 < gapNat then 2 else 3) ∧
        c.1 = (if 3 < gapNat then 3 else 4) ∧
        d.1 = (if 4 < gapNat then 4 else 5) ∧
        e.1 = (if 5 < gapNat then 5 else 6) ∧
        f.1 = (if 6 < gapNat then 6 else 7) ∧
        g.1 = (if 7 < gapNat then 7 else 8) := by
    by_cases ha1 : a.1 = 1
    · by_cases hb2 : b.1 = 2
      · by_cases hc3 : c.1 = 3
        · by_cases hd4 : d.1 = 4
          · by_cases he5 : e.1 = 5
            · by_cases hf6 : f.1 = 6
              · by_cases hg7 : g.1 = 7
                · refine ⟨8, by omega, by omega, ?_⟩
                  norm_num
                  omega
                · refine ⟨7, by omega, by omega, ?_⟩
                  norm_num
                  omega
              · refine ⟨6, by omega, by omega, ?_⟩
                norm_num
                omega
            · refine ⟨5, by omega, by omega, ?_⟩
              norm_num
              omega
          · refine ⟨4, by omega, by omega, ?_⟩
            norm_num
            omega
        · refine ⟨3, by omega, by omega, ?_⟩
          norm_num
          omega
      · refine ⟨2, by omega, by omega, ?_⟩
        norm_num
        omega
    · refine ⟨1, by omega, by omega, ?_⟩
      norm_num
      omega
  let gap : Fin 10 := ⟨gapNat, by omega⟩
  refine ⟨gap, by simpa [gap], by simpa [gap], ?_⟩
  have hsucc (x : Fin 10) (i : Fin 9)
      (hxi : x.1 = if i.1 < gapNat then i.1 else i.1 + 1) :
      x = gap.succAbove i := by
    unfold Fin.succAbove
    split
    · have hi : i.1 < gapNat := by simpa [gap] using ‹i.castSucc < gap›
      rw [if_pos hi] at hxi
      apply Fin.ext
      simpa using hxi
    · have hi : ¬ i.1 < gapNat := by
        simpa [gap] using ‹¬ i.castSucc < gap›
      rw [if_neg hi] at hxi
      apply Fin.ext
      simpa using hxi
  exact ⟨hsucc a 1 (by simpa using hposA), hsucc b 2 (by simpa using hposB),
    hsucc c 3 (by simpa using hposC), hsucc d 4 (by simpa using hposD),
    hsucc e 5 (by simpa using hposE), hsucc f 6 (by simpa using hposF),
    hsucc g 7 (by simpa using hposG)⟩

private def SevenSkipOrder
    (a b c d e f g : Fin 10) : Prop :=
  ∃ gap : Fin 10,
    0 < gap ∧ gap < 9 ∧
    a = gap.succAbove (1 : Fin 9) ∧
    b = gap.succAbove (2 : Fin 9) ∧
    c = gap.succAbove (3 : Fin 9) ∧
    d = gap.succAbove (4 : Fin 9) ∧
    e = gap.succAbove (5 : Fin 9) ∧
    f = gap.succAbove (6 : Fin 9) ∧
    g = gap.succAbove (7 : Fin 9)

private theorem seven_index_order_classification_ten
    (iu iv ic id ixv ie ixu : Fin 10)
    (hu0 : 0 < iu) (hu8 : iu < 9)
    (hv0 : 0 < iv) (hv8 : iv < 9)
    (hc0 : 0 < ic) (hc8 : ic < 9)
    (hd0 : 0 < id) (hd8 : id < 9)
    (hxv0 : 0 < ixv) (hxv8 : ixv < 9)
    (he0 : 0 < ie) (he8 : ie < 9)
    (hxu0 : 0 < ixu) (hxu8 : ixu < 9)
    (he_ne_xv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hD : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hC : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hE : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    SevenSkipOrder iu iv ic id ixv ie ixu ∨
    SevenSkipOrder iu iv ic id ie ixv ixu ∨
    SevenSkipOrder ixu ie ixv id ic iv iu ∨
    SevenSkipOrder ixu ixv ie id ic iv iu := by
  rcases hXv with hXv | hXv
  · have hV' : iu < iv ∧ iv < ixv := by
      rcases hV with hV | hV
      · exact hV
      · omega
    have hD' : iv < id ∧ id < ixv := by
      rcases hD with hD | hD
      · exact hD
      · omega
    have hC' : iv < ic ∧ ic < id := by
      rcases hC with hC | hC
      · exact hC
      · omega
    have hE' : id < ie ∧ ie < ixu := by
      rcases hE with hE | hE
      · exact hE
      · omega
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; left
      exact seven_strict_interior_indices_ten iu iv ic id ie ixv ixu
        hu0 hV'.1 hC'.1 hC'.2 hE'.1 hlt hXv.2 hxu8
    · left
      exact seven_strict_interior_indices_ten iu iv ic id ixv ie ixu
        hu0 hV'.1 hC'.1 hC'.2 hD'.2 hgt hE'.2 hxu8
  · have hV' : ixv < iv ∧ iv < iu := by
      rcases hV with hV | hV
      · omega
      · exact hV
    have hD' : ixv < id ∧ id < iv := by
      rcases hD with hD | hD
      · omega
      · exact hD
    have hC' : id < ic ∧ ic < iv := by
      rcases hC with hC | hC
      · omega
      · exact hC
    have hE' : ixu < ie ∧ ie < id := by
      rcases hE with hE | hE
      · omega
      · exact hE
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; right; left
      exact seven_strict_interior_indices_ten ixu ie ixv id ic iv iu
        hxu0 hE'.1 hlt hD'.1 hC'.1 hC'.2 hV'.2 hu8
    · right; right; right
      exact seven_strict_interior_indices_ten ixu ixv ie id ic iv iu
        hxu0 hXv.1 hgt hE'.2 hC'.1 hC'.2 hV'.2 hu8

private theorem skip_position_embedding_forward
    (gap : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .forward order
        (fun point => gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)) := by
  intro point₁ point₂ hlt
  exact Fin.succAbove_lt_succAbove_iff.mpr hlt

private theorem skip_position_embedding_reverse
    (gap : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .reverse order
        (fun point => Fin.rev (gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))) := by
  intro point₁ point₂ hlt
  change
    (Fin.rev (gap.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₂))).val <
      (Fin.rev (gap.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₁))).val
  rw [Fin.val_rev, Fin.val_rev]
  have hsucc :
      gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₁) <
        gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₂) :=
    (Fin.succAbove_lt_succAbove_iff (p := gap)).mpr hlt
  omega

private def reverseGapTen (gap : Fin 10) : Fin 10 :=
  ⟨9 - gap.val, by omega⟩

private theorem reverse_gap_succAbove_sum
    (gap : Fin 10) (j p : Fin 9) (hsum : p.val + j.val = 8) :
    ((reverseGapTen gap).succAbove p).val + (gap.succAbove j).val = 9 := by
  by_cases hj : j.castSucc < gap
  · change j.val < gap.val at hj
    have hp : reverseGapTen gap ≤ p.castSucc := by
      change 9 - gap.val ≤ p.val
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hp,
      Fin.succAbove_of_castSucc_lt _ _ hj]
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega
  · have hj' : gap ≤ j.castSucc := le_of_not_gt hj
    change gap.val ≤ j.val at hj'
    have hp : p.castSucc < reverseGapTen gap := by
      change p.val < 9 - gap.val
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hp,
      Fin.succAbove_of_le_castSucc _ _ hj']
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega

private theorem gapTen_castLE_succAbove_val
    (gap : Fin 10) (p : Fin 15) (j : Fin 9) (hp : p.val = j.val) :
    ((Fin.castLE (by omega) gap : Fin 16).succAbove p).val =
      (gap.succAbove j).val := by
  let gap16 : Fin 16 := Fin.castLE (by omega) gap
  by_cases hleft : p.castSucc < gap16
  · have hright : j.castSucc < gap := by
      change j.val < gap.val
      change p.val < gap.val at hleft
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hleft,
      Fin.succAbove_of_castSucc_lt _ _ hright]
    simp only [Fin.val_castSucc]
    exact hp
  · have hleft' : gap16 ≤ p.castSucc := le_of_not_gt hleft
    have hright : gap ≤ j.castSucc := by
      change gap.val ≤ j.val
      change gap.val ≤ p.val at hleft'
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hleft',
      Fin.succAbove_of_le_castSucc _ _ hright]
    simp only [Fin.val_succ]
    omega

private theorem reverseGapTen_castLE_succAbove_sum
    (gap : Fin 10) (p : Fin 15) (j : Fin 9) (hsum : p.val + j.val = 8) :
    ((Fin.castLE (by omega) (reverseGapTen gap) : Fin 16).succAbove p).val +
        (gap.succAbove j).val = 9 := by
  have hpLt : p.val < 9 := by omega
  let p9 : Fin 9 := ⟨p.val, hpLt⟩
  have hcast := gapTen_castLE_succAbove_val (reverseGapTen gap) p p9 rfl
  have hrev := reverse_gap_succAbove_sum gap j p9 (by simpa [p9] using hsum)
  omega

end Problem97.ATailFrontierLiveClosure
