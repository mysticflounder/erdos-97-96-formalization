/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefg
import Erdos9796Proof.P97.ATail.SixPointSparseEuclideanObstruction

/-!
# Complete exact-seventeen sparse six-point bank

This module places the cardinality-generic sparse six-point Euclidean
obstruction at every cyclic cut and in both directions of the exact-seventeen
source order.  Only named order zero is emitted because the cocircular-fan
source reduction has already eliminated the other named order.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFullBank

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open SixPointSparseEuclideanObstruction

/-- Six selected-row hits for the sparse Euclidean obstruction at one cyclic
placement.  For ordered offsets `0 < b < c < d < e < f`, row zero contains
`b,d,f`, while row `c` contains `b,d,e`. -/
def sparseSixPointHits (direction : Orientation) (cut : Label)
    (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel 0 direction cut
      [(point 0, point b), (point 0, point d), (point 0, point f),
        (point c, point b), (point c, point d), (point c, point e)]
  | _ => []

/-- The source realization cannot contain one placed sparse six-point
occurrence. -/
theorem false_of_sparseSixPoint_at {A : Finset ℝ²}
    (r : SourceRealization A) (direction : Orientation)
    (cut b c d e f : Label) (horder : (0 : NamedOrder) = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hb0 : placedLabel 0 direction cut b ∈
      r.model.selected (placedLabel 0 direction cut 0))
    (hd0 : placedLabel 0 direction cut d ∈
      r.model.selected (placedLabel 0 direction cut 0))
    (hf0 : placedLabel 0 direction cut f ∈
      r.model.selected (placedLabel 0 direction cut 0))
    (hbc' : placedLabel 0 direction cut b ∈
      r.model.selected (placedLabel 0 direction cut c))
    (hdc : placedLabel 0 direction cut d ∈
      r.model.selected (placedLabel 0 direction cut c))
    (hec : placedLabel 0 direction cut e ∈
      r.model.selected (placedLabel 0 direction cut c)) : False := by
  have hb0' := mem_placedRow_of_mem_model r 0 direction cut 0 b horder hb0
  have hd0' := mem_placedRow_of_mem_model r 0 direction cut 0 d horder hd0
  have hf0' := mem_placedRow_of_mem_model r 0 direction cut 0 f horder hf0
  have hbc'' := mem_placedRow_of_mem_model r 0 direction cut c b horder hbc'
  have hdc' := mem_placedRow_of_mem_model r 0 direction cut c d horder hdc
  have hec' := mem_placedRow_of_mem_model r 0 direction cut c e horder hec
  by_cases hsame : r.orientation = direction
  · have h01 := localPosition_lt_of_same hsame h0b
    have h12 := localPosition_lt_of_same hsame hbc
    have h23 := localPosition_lt_of_same hsame hcd
    have h34 := localPosition_lt_of_same hsame hde
    have h45 := localPosition_lt_of_same hsame hef
    exact false_of_six_ccw_two_selected_rows_cyclicShift
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt h01) (r.toCardIndex_lt h12)
      (r.toCardIndex_lt h23) (r.toCardIndex_lt h34)
      (r.toCardIndex_lt h45)
      (placedRow r 0 direction cut 0 horder)
      (placedRow r 0 direction cut c horder)
      hb0' hd0' hf0' hbc'' hdc' hec'
  · have h10 := localPosition_lt_of_ne hsame h0b
    have h21 := localPosition_lt_of_ne hsame hbc
    have h32 := localPosition_lt_of_ne hsame hcd
    have h43 := localPosition_lt_of_ne hsame hde
    have h54 := localPosition_lt_of_ne hsame hef
    exact false_of_six_ccw_two_selected_rows_cyclicShift_of_decreasing
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt h10) (r.toCardIndex_lt h21)
      (r.toCardIndex_lt h32) (r.toCardIndex_lt h43)
      (r.toCardIndex_lt h54)
      (placedRow r 0 direction cut 0 horder)
      (placedRow r 0 direction cut c horder)
      hb0' hd0' hf0' hbc'' hdc' hec'

/-- Guarded clause for one cyclic sparse six-point placement. -/
def sparseSixPointClause (direction : Orientation) (cut : Label)
    (offsets : List Label) : Std.Sat.CNF.Clause Atom :=
  nogoodClause 0 (sparseSixPointHits direction cut offsets)

/-- Every generated sparse six-point clause is true in a source realization. -/
theorem sourceAssign_sparseSixPointClause {A : Finset ℝ²}
    (r : SourceRealization A) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (sparseSixPointClause direction cut offsets) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_sparseSixPoint_at r direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
  · exact hall (placedLabel 0 direction cut 0,
      placedLabel 0 direction cut b) (by simp [sparseSixPointHits])
  · exact hall (placedLabel 0 direction cut 0,
      placedLabel 0 direction cut d) (by simp [sparseSixPointHits])
  · exact hall (placedLabel 0 direction cut 0,
      placedLabel 0 direction cut f) (by simp [sparseSixPointHits])
  · exact hall (placedLabel 0 direction cut c,
      placedLabel 0 direction cut b) (by simp [sparseSixPointHits])
  · exact hall (placedLabel 0 direction cut c,
      placedLabel 0 direction cut d) (by simp [sparseSixPointHits])
  · exact hall (placedLabel 0 direction cut c,
      placedLabel 0 direction cut e) (by simp [sparseSixPointHits])

/-- Complete order-zero sparse six-point cyclic family. -/
def sparseSixPointFullBankClauses : Std.Sat.CNF Atom :=
  directions.flatMap fun direction =>
    labels.flatMap fun cut =>
      fiveOffsetChoices.map fun offsets =>
        sparseSixPointClause direction cut offsets

theorem sparseSixPointFullBankClauses_length :
    sparseSixPointFullBankClauses.length = 148512 := by
  native_decide

theorem sourceAssign_sparseSixPointFullBankClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ sparseSixPointFullBankClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [sparseSixPointFullBankClauses, List.mem_flatMap,
    List.mem_map] at hclause
  obtain ⟨direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_sparseSixPointClause r direction cut offsets hoffsets

#print axioms sourceAssign_sparseSixPointClause
#print axioms sourceAssign_sparseSixPointFullBankClauses

end ATailBlockerVExactSeventeenSparseSixPointFullBank
end Problem97
