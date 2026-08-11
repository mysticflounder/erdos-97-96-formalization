/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChain
import Erdos9796Proof.P97.ATail.TwoKalmansonEqualityChainSchemas

/-!
# Two-Kalmanson equality-chain clauses for exact seventeen

This module extends the checked perpendicular-bisector-chain child by every
cyclic placement of the cardinality-independent selected-row obstruction

```text
C : B,D    D : C,A    A : D,F,E    F : A,B    G : E,C
```

on seven boundary positions `A < B < C < D < E < F < G`.  The rows identify
the four left-hand distances of two strict Kalmanson inequalities with their
four right-hand distances, which is impossible in a strictly convex carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmanson

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChain
open TwoKalmansonEqualityChainBridge

/-- Eleven selected-row hits for the two-Kalmanson equality chain. -/
def twoKalmansonChainHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f, g] =>
      let p := placedLabel order direction cut
      [(p c, p b), (p c, p d),
        (p d, p c), (p d, p 0),
        (p 0, p d), (p 0, p f), (p 0, p e),
        (p f, p 0), (p f, p b),
        (p g, p e), (p g, p c)]
  | _ => []

private theorem false_of_twoKalmansonChain_at {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f g : Label)
    (horder : order = source.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hbC : placedLabel order direction cut b ∈
      source.model.selected (placedLabel order direction cut c))
    (hdC : placedLabel order direction cut d ∈
      source.model.selected (placedLabel order direction cut c))
    (hcD : placedLabel order direction cut c ∈
      source.model.selected (placedLabel order direction cut d))
    (haD : placedLabel order direction cut 0 ∈
      source.model.selected (placedLabel order direction cut d))
    (hdA : placedLabel order direction cut d ∈
      source.model.selected (placedLabel order direction cut 0))
    (hfA : placedLabel order direction cut f ∈
      source.model.selected (placedLabel order direction cut 0))
    (heA : placedLabel order direction cut e ∈
      source.model.selected (placedLabel order direction cut 0))
    (haF : placedLabel order direction cut 0 ∈
      source.model.selected (placedLabel order direction cut f))
    (hbF : placedLabel order direction cut b ∈
      source.model.selected (placedLabel order direction cut f))
    (heG : placedLabel order direction cut e ∈
      source.model.selected (placedLabel order direction cut g))
    (hcG : placedLabel order direction cut c ∈
      source.model.selected (placedLabel order direction cut g)) : False := by
  have hbC' := mem_placedRow_of_mem_model source order direction cut c b horder hbC
  have hdC' := mem_placedRow_of_mem_model source order direction cut c d horder hdC
  have hcD' := mem_placedRow_of_mem_model source order direction cut d c horder hcD
  have haD' := mem_placedRow_of_mem_model source order direction cut d 0 horder haD
  have hdA' := mem_placedRow_of_mem_model source order direction cut 0 d horder hdA
  have hfA' := mem_placedRow_of_mem_model source order direction cut 0 f horder hfA
  have heA' := mem_placedRow_of_mem_model source order direction cut 0 e horder heA
  have haF' := mem_placedRow_of_mem_model source order direction cut f 0 horder haF
  have hbF' := mem_placedRow_of_mem_model source order direction cut f b horder hbF
  have heG' := mem_placedRow_of_mem_model source order direction cut g e horder heG
  have hcG' := mem_placedRow_of_mem_model source order direction cut g c horder hcG
  by_cases hsame : source.orientation = direction
  · exact false_of_five_selected_rows_two_kalmanson_chain_cyclicShift
      source.carrier_convexIndep source.cardBoundary_injective
      source.cardBoundary_image source.cardBoundary_ccw
      (source.toCardIndex (consumerCut source.orientation direction cut))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (source.toCardIndex_lt (localPosition_lt_of_same hsame hfg))
      (placedRow source order direction cut c horder)
      (placedRow source order direction cut d horder)
      (placedRow source order direction cut 0 horder)
      (placedRow source order direction cut f horder)
      (placedRow source order direction cut g horder)
      hbC' hdC' hcD' haD' hdA' hfA' heA' haF' hbF' heG' hcG'
  · exact
      false_of_five_selected_rows_two_kalmanson_chain_cyclicShift_of_decreasing
        source.carrier_convexIndep source.cardBoundary_injective
        source.cardBoundary_image source.cardBoundary_ccw
        (source.toCardIndex (consumerCut source.orientation direction cut))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hfg))
        (placedRow source order direction cut c horder)
        (placedRow source order direction cut d horder)
        (placedRow source order direction cut 0 horder)
        (placedRow source order direction cut f horder)
        (placedRow source order direction cut g horder)
        hbC' hdC' hcD' haD' hdA' hfA' heA' haF' hbF' heG' hcG'

/-- Every generated two-Kalmanson equality-chain clause is true under a source
realization. -/
theorem sourceAssign_twoKalmansonChainClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ sixOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (nogoodClause order
        (twoKalmansonChainHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, g, rfl, h0b, hbc, hcd, hde, hef, hfg⟩ :=
    sixOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        twoKalmansonChainHits order direction cut [b, c, d, e, f, g]) :
      placedLabel order direction cut point ∈
        source.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_twoKalmansonChain_at source order direction cut b c d e f g
    horder.symm h0b hbc hcd hde hef hfg
    (get c b (by simp [twoKalmansonChainHits]))
    (get c d (by simp [twoKalmansonChainHits]))
    (get d c (by simp [twoKalmansonChainHits]))
    (get d 0 (by simp [twoKalmansonChainHits]))
    (get 0 d (by simp [twoKalmansonChainHits]))
    (get 0 f (by simp [twoKalmansonChainHits]))
    (get 0 e (by simp [twoKalmansonChainHits]))
    (get f 0 (by simp [twoKalmansonChainHits]))
    (get f b (by simp [twoKalmansonChainHits]))
    (get g e (by simp [twoKalmansonChainHits]))
    (get g c (by simp [twoKalmansonChainHits]))

/-- Complete guarded cyclic orbit of the two-Kalmanson equality chain. -/
def twoKalmansonChainClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        sixOffsetChoices.map fun offsets =>
          nogoodClause order
            (twoKalmansonChainHits order direction cut offsets)

/-- Every source realization satisfies the complete two-Kalmanson family. -/
theorem sourceAssign_twoKalmansonChainClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twoKalmansonChainClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twoKalmansonChainClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_twoKalmansonChainClause source order direction cut offsets
    hoffsets

/-- Lean-authoritative child root after the two-Kalmanson equality chain. -/
def extendedTwoKalmansonCnf : Std.Sat.CNF Atom :=
  extendedPerpBisectorChainCnf ++ twoKalmansonChainClauses

/-- Exact size of the complete two-Kalmanson equality-chain family. -/
theorem twoKalmansonChainClauses_length :
    twoKalmansonChainClauses.length = 544544 := by
  native_decide

/-- Exact clause count of the Lean-authoritative two-Kalmanson child root. -/
theorem extendedTwoKalmansonCnf_clause_count :
    extendedTwoKalmansonCnf.length = 5301532 := by
  simp [extendedTwoKalmansonCnf, extendedPerpBisectorChainCnf_clause_count,
    twoKalmansonChainClauses_length]

/-- Gate B for the complete two-Kalmanson child root. -/
theorem sourceAssign_extendedTwoKalmansonCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwoKalmansonCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwoKalmansonCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedPerpBisectorChainCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_twoKalmansonChainClauses source clause hnew

/-- Certificate-to-source landing contract for the two-Kalmanson child root. -/
theorem false_of_sourceRealization_of_extendedTwoKalmansonCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwoKalmansonCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedTwoKalmansonCnf source⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmanson
end Problem97
