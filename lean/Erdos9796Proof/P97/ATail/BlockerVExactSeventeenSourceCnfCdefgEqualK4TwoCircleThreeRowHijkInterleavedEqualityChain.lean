/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
import Erdos9796Proof.P97.ATail.TwoCircleEqualityChainSchemas

/-!
# Two-circle equality-chain clauses for the exact-seventeen source CNF

This module extends the checked interleaved child by every cyclic placement of
the cardinality-independent five-row obstruction

```text
Q : Y,T    V : U,Y    T : Q,W    U : Q,W    W : U,T
```

on six boundary positions `Q < U < W < Y < T < V`. Both source orientations
are proved impossible before the clauses enter the Lean-authoritative CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
open TwoCircleEqualityChainBridge

/-- Ten selected-row hits for the two-circle equality-chain obstruction. -/
def equalityChainHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [u, w, y, t, v] =>
      let p := placedLabel order direction cut
      [(p 0, p y), (p 0, p t),
        (p v, p u), (p v, p y),
        (p t, p 0), (p t, p w),
        (p u, p 0), (p u, p w),
        (p w, p u), (p w, p t)]
  | _ => []

private theorem false_of_equalityChain_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut u w y t v : Label)
    (horder : order = r.model.order)
    (h0u : (0 : Label) < u) (huw : u < w) (hwy : w < y)
    (hyt : y < t) (htv : t < v)
    (hyQ : placedLabel order direction cut y ∈
      r.model.selected (placedLabel order direction cut 0))
    (htQ : placedLabel order direction cut t ∈
      r.model.selected (placedLabel order direction cut 0))
    (huV : placedLabel order direction cut u ∈
      r.model.selected (placedLabel order direction cut v))
    (hyV : placedLabel order direction cut y ∈
      r.model.selected (placedLabel order direction cut v))
    (hqT : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut t))
    (hwT : placedLabel order direction cut w ∈
      r.model.selected (placedLabel order direction cut t))
    (hqU : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut u))
    (hwU : placedLabel order direction cut w ∈
      r.model.selected (placedLabel order direction cut u))
    (huW : placedLabel order direction cut u ∈
      r.model.selected (placedLabel order direction cut w))
    (htW : placedLabel order direction cut t ∈
      r.model.selected (placedLabel order direction cut w)) : False := by
  have hyQ' := mem_placedRow_of_mem_model r order direction cut 0 y horder hyQ
  have htQ' := mem_placedRow_of_mem_model r order direction cut 0 t horder htQ
  have huV' := mem_placedRow_of_mem_model r order direction cut v u horder huV
  have hyV' := mem_placedRow_of_mem_model r order direction cut v y horder hyV
  have hqT' := mem_placedRow_of_mem_model r order direction cut t 0 horder hqT
  have hwT' := mem_placedRow_of_mem_model r order direction cut t w horder hwT
  have hqU' := mem_placedRow_of_mem_model r order direction cut u 0 horder hqU
  have hwU' := mem_placedRow_of_mem_model r order direction cut u w horder hwU
  have huW' := mem_placedRow_of_mem_model r order direction cut w u horder huW
  have htW' := mem_placedRow_of_mem_model r order direction cut w t horder htW
  by_cases hsame : r.orientation = direction
  · exact false_of_five_selected_rows_two_circle_chain_cyclicShift
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0u))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame huw))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hwy))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hyt))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame htv))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut v horder)
      (placedRow r order direction cut t horder)
      (placedRow r order direction cut u horder)
      (placedRow r order direction cut w horder)
      hyQ' htQ' huV' hyV' hqT' hwT' hqU' hwU' huW' htW'
  · exact false_of_five_selected_rows_two_circle_chain_cyclicShift_of_decreasing
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0u))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame huw))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hwy))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hyt))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame htv))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut v horder)
      (placedRow r order direction cut t horder)
      (placedRow r order direction cut u horder)
      (placedRow r order direction cut w horder)
      hyQ' htQ' huV' hyV' hqT' hwT' hqU' hwU' huW' htW'

/-- Every generated equality-chain clause is true under a source realization. -/
theorem sourceAssign_equalityChainClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈
      ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (equalityChainHits order direction cut offsets)) = true := by
  obtain ⟨u, w, y, t, v, rfl, h0u, huw, hwy, hyt, htv⟩ :=
    ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices_shape
      offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        equalityChainHits order direction cut [u, w, y, t, v]) :
      placedLabel order direction cut point ∈
        r.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_equalityChain_at r order direction cut u w y t v horder.symm
    h0u huw hwy hyt htv
    (get 0 y (by simp [equalityChainHits]))
    (get 0 t (by simp [equalityChainHits]))
    (get v u (by simp [equalityChainHits]))
    (get v y (by simp [equalityChainHits]))
    (get t 0 (by simp [equalityChainHits]))
    (get t w (by simp [equalityChainHits]))
    (get u 0 (by simp [equalityChainHits]))
    (get u w (by simp [equalityChainHits]))
    (get w u (by simp [equalityChainHits]))
    (get w t (by simp [equalityChainHits]))

/-- Complete guarded cyclic orbit of the two-circle equality-chain clause. -/
def equalityChainClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices.map fun offsets =>
          nogoodClause order (equalityChainHits order direction cut offsets)

/-- Every source realization satisfies the complete equality-chain family. -/
theorem sourceAssign_equalityChainClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ equalityChainClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [equalityChainClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_equalityChainClause r order direction cut offsets hoffsets

/-- Lean-authoritative child root after the two-circle equality-chain family. -/
def extendedEqualityChainCnf : Std.Sat.CNF Atom :=
  extendedInterleavedCnf ++ equalityChainClauses

/-- Exact size of the complete two-circle equality-chain family. -/
theorem equalityChainClauses_length : equalityChainClauses.length = 297024 := by
  native_decide

/-- Exact clause count of the Lean-authoritative equality-chain child root. -/
theorem extendedEqualityChainCnf_clause_count :
    extendedEqualityChainCnf.length = 4212444 := by
  simp [extendedEqualityChainCnf, extendedInterleavedCnf_clause_count,
    equalityChainClauses_length]

/-- Gate B for the complete equality-chain child root. -/
theorem sourceAssign_extendedEqualityChainCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedEqualityChainCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedEqualityChainCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedInterleavedCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_equalityChainClauses r clause hnew

/-- Certificate-to-source landing contract for the equality-chain child root. -/
theorem false_of_sourceRealization_of_extendedEqualityChainCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedEqualityChainCnf = true) : False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedEqualityChainCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain
end Problem97
