/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmanson
import Erdos9796Proof.P97.ATail.TwoKalmansonEqualityChainUnorderedDSchemas

/-!
# Swapped-D/E two-Kalmanson clauses for exact seventeen

This module extends the checked two-Kalmanson child by the next CEGAR
placement of the same five-row obstruction:

```text
C : B,D    D : C,A    A : D,F,E    F : A,B    G : E,C.
```

The previous child instantiated `A < B < C < D < E < F < G`.  The exact SAT
survivor exposed `A < B < C < E < D < F < G`.  The source theorem is stronger:
the metric contradiction only needs `A < B < C < E < F < G`, so the boundary
position of the row center `D` is immaterial.  This child conservatively adds
the newly exposed swapped placement while preserving the immutable parent
root.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChain
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmanson
open TwoKalmansonEqualityChainBridge

/-- Eleven selected-row hits for the swapped-`D/E` placement. -/
def twoKalmansonSwappedDEHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, e, d, f, g] =>
      let p := placedLabel order direction cut
      [(p c, p b), (p c, p d),
        (p d, p c), (p d, p 0),
        (p 0, p d), (p 0, p f), (p 0, p e),
        (p f, p 0), (p f, p b),
        (p g, p e), (p g, p c)]
  | _ => []

private theorem false_of_twoKalmansonSwappedDE_at {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c e d f g : Label)
    (horder : order = source.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hce : c < e)
    (hed : e < d) (hdf : d < f) (hfg : f < g)
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
  · exact
      false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift
        source.carrier_convexIndep source.cardBoundary_injective
        source.cardBoundary_image source.cardBoundary_ccw
        (source.toCardIndex (consumerCut source.orientation direction cut))
        (source.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
        (source.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
        (source.toCardIndex_lt (localPosition_lt_of_same hsame hce))
        (source.toCardIndex_lt
          (localPosition_lt_of_same hsame (hed.trans hdf)))
        (source.toCardIndex_lt (localPosition_lt_of_same hsame hfg))
        (placedRow source order direction cut c horder)
        (placedRow source order direction cut d horder)
        (placedRow source order direction cut 0 horder)
        (placedRow source order direction cut f horder)
        (placedRow source order direction cut g horder)
        hbC' hdC' hcD' haD' hdA' hfA' heA' haF' hbF' heG' hcG'
  · exact
      false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift_of_decreasing
        source.carrier_convexIndep source.cardBoundary_injective
        source.cardBoundary_image source.cardBoundary_ccw
        (source.toCardIndex (consumerCut source.orientation direction cut))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hce))
        ((source.toCardIndex_lt (localPosition_lt_of_ne hsame hdf)).trans
          (source.toCardIndex_lt (localPosition_lt_of_ne hsame hed)))
        (source.toCardIndex_lt (localPosition_lt_of_ne hsame hfg))
        (placedRow source order direction cut c horder)
        (placedRow source order direction cut d horder)
        (placedRow source order direction cut 0 horder)
        (placedRow source order direction cut f horder)
        (placedRow source order direction cut g horder)
        hbC' hdC' hcD' haD' hdA' hfA' heA' haF' hbF' heG' hcG'

/-- Every generated swapped-`D/E` clause is true under a source realization. -/
theorem sourceAssign_twoKalmansonSwappedDEClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ sixOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (nogoodClause order
        (twoKalmansonSwappedDEHits order direction cut offsets)) = true := by
  obtain ⟨b, c, e, d, f, g, rfl, h0b, hbc, hce, hed, hdf, hfg⟩ :=
    sixOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        twoKalmansonSwappedDEHits order direction cut [b, c, e, d, f, g]) :
      placedLabel order direction cut point ∈
        source.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_twoKalmansonSwappedDE_at source order direction cut b c e d f g
    horder.symm h0b hbc hce hed hdf hfg
    (get c b (by simp [twoKalmansonSwappedDEHits]))
    (get c d (by simp [twoKalmansonSwappedDEHits]))
    (get d c (by simp [twoKalmansonSwappedDEHits]))
    (get d 0 (by simp [twoKalmansonSwappedDEHits]))
    (get 0 d (by simp [twoKalmansonSwappedDEHits]))
    (get 0 f (by simp [twoKalmansonSwappedDEHits]))
    (get 0 e (by simp [twoKalmansonSwappedDEHits]))
    (get f 0 (by simp [twoKalmansonSwappedDEHits]))
    (get f b (by simp [twoKalmansonSwappedDEHits]))
    (get g e (by simp [twoKalmansonSwappedDEHits]))
    (get g c (by simp [twoKalmansonSwappedDEHits]))

/-- Complete guarded cyclic orbit of the swapped-`D/E` placement. -/
def twoKalmansonSwappedDEClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        sixOffsetChoices.map fun offsets =>
          nogoodClause order
            (twoKalmansonSwappedDEHits order direction cut offsets)

/-- Every source realization satisfies the complete swapped-`D/E` family. -/
theorem sourceAssign_twoKalmansonSwappedDEClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twoKalmansonSwappedDEClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twoKalmansonSwappedDEClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_twoKalmansonSwappedDEClause source order direction cut offsets
    hoffsets

/-- Lean-authoritative child root after the swapped-`D/E` placement. -/
def extendedTwoKalmansonSwappedDECnf : Std.Sat.CNF Atom :=
  extendedTwoKalmansonCnf ++ twoKalmansonSwappedDEClauses

/-- Exact size of the complete swapped-`D/E` family. -/
theorem twoKalmansonSwappedDEClauses_length :
    twoKalmansonSwappedDEClauses.length = 544544 := by
  native_decide

/-- Exact clause count of the Lean-authoritative swapped-`D/E` child root. -/
theorem extendedTwoKalmansonSwappedDECnf_clause_count :
    extendedTwoKalmansonSwappedDECnf.length = 5846076 := by
  simp [extendedTwoKalmansonSwappedDECnf, extendedTwoKalmansonCnf_clause_count,
    twoKalmansonSwappedDEClauses_length]

/-- Gate B for the complete swapped-`D/E` child root. -/
theorem sourceAssign_extendedTwoKalmansonSwappedDECnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwoKalmansonSwappedDECnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwoKalmansonSwappedDECnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedTwoKalmansonCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_twoKalmansonSwappedDEClauses source clause hnew

/-- Certificate-to-source landing contract for the swapped-`D/E` child root. -/
theorem false_of_sourceRealization_of_extendedTwoKalmansonSwappedDECnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwoKalmansonSwappedDECnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedTwoKalmansonSwappedDECnf source⟩

#print axioms sourceAssign_twoKalmansonSwappedDEClause
#print axioms sourceAssign_extendedTwoKalmansonSwappedDECnf
#print axioms false_of_sourceRealization_of_extendedTwoKalmansonSwappedDECnf_unsat

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
end Problem97
