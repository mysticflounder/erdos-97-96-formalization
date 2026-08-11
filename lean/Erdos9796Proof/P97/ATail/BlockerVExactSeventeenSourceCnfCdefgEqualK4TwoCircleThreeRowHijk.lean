/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow

/-!
# Checked H--K Kalmanson clauses for the exact-seventeen source CNF

This module extends the checked three-row child by every cyclic placement of
the already-banked six-point selected-row schemas H, I, J, and K. Both source
orientations are proved impossible before any clause enters the
Lean-authoritative child CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open CapCrossingKalmansonBridge

/-- The four six-point selected-row schemas admitted by this child. -/
inductive SixSchema
  | H | I | J | K
  deriving DecidableEq

/-- Canonical enumeration of the four six-point schemas. -/
def sixSchemas : List SixSchema := [.H, .I, .J, .K]

/-- Increasing five-offset choices for six-point cyclic placements. -/
def fiveOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 5

/-- Every enumerated five-offset list is strictly ordered after zero. -/
theorem fiveOffsetChoices_shape :
    ∀ offsets, offsets ∈ fiveOffsetChoices →
      ∃ b c d e f : Label,
        offsets = [b, c, d, e, f] ∧
          (0 : Label) < b ∧ b < c ∧ c < d ∧ d < e ∧ e < f := by
  intro offsets hoffsets
  obtain ⟨hsub, hlen⟩ := List.mem_sublistsLen.mp hoffsets
  have hp : offsets.Pairwise (· < ·) :=
    List.Pairwise.sublist hsub positiveOffsets_pairwise
  rcases offsets with _ | ⟨b, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨c, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨d, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨e, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨f, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨g, offsets⟩
  · refine ⟨b, c, d, e, f, rfl, positiveOffsets_pos b ?_, ?_⟩
    · exact hsub.subset (by simp)
    · simp only [List.pairwise_cons, List.mem_cons, forall_eq_or_imp] at hp
      aesop
  · simp at hlen

/-- Selected-row hits for schemas H--K at one six-point placement. -/
def sixSchemaHits (schema : SixSchema) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let p := placedLabel order direction cut
      match schema with
      | .H =>
          [(p 0, p b), (p 0, p d), (p c, p e), (p c, p f),
            (p e, p d), (p e, p f), (p f, p b), (p f, p e)]
      | .I =>
          [(p 0, p b), (p 0, p e), (p d, p b), (p d, p e),
            (p b, p c), (p b, p f), (p e, p c), (p e, p f)]
      | .J =>
          [(p 0, p b), (p 0, p d), (p b, p 0), (p b, p c),
            (p e, p 0), (p e, p b), (p f, p c), (p f, p d)]
      | .K =>
          [(p e, p d), (p e, p b), (p e, p f),
            (p d, p 0), (p d, p c),
            (p 0, p e), (p 0, p b), (p 0, p c),
            (p b, p 0), (p b, p f)]
  | _ => []

private theorem false_of_H_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hdA : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut 0))
    (heC : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut c))
    (hfC : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut c))
    (hdE : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut e))
    (hbF : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut f))
    (heF : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut f)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hdA' := mem_placedRow_of_mem_model r order direction cut 0 d horder hdA
  have heC' := mem_placedRow_of_mem_model r order direction cut c e horder heC
  have hfC' := mem_placedRow_of_mem_model r order direction cut c f horder hfC
  have hdE' := mem_placedRow_of_mem_model r order direction cut e d horder hdE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  have hbF' := mem_placedRow_of_mem_model r order direction cut f b horder hbF
  have heF' := mem_placedRow_of_mem_model r order direction cut f e horder heF
  by_cases hsame : r.orientation = direction
  · exact false_of_four_selected_rows_in_six_ccw_order_H_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut c horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hbA' hdA' heC' hfC' hdE' hfE' hbF' heF'
  · exact false_of_four_selected_rows_in_six_ccw_order_H_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut c horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hbA' hdA' heC' hfC' hdE' hfE' hbF' heF'

private theorem false_of_I_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut 0))
    (heA : placedLabel order direction cut e ∈ r.model.selected (placedLabel order direction cut 0))
    (hbD : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut d))
    (heD : placedLabel order direction cut e ∈ r.model.selected (placedLabel order direction cut d))
    (hcB : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut b))
    (hfB : placedLabel order direction cut f ∈ r.model.selected (placedLabel order direction cut b))
    (hcE : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈ r.model.selected (placedLabel order direction cut e)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have heA' := mem_placedRow_of_mem_model r order direction cut 0 e horder heA
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  have heD' := mem_placedRow_of_mem_model r order direction cut d e horder heD
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have hfB' := mem_placedRow_of_mem_model r order direction cut b f horder hfB
  have hcE' := mem_placedRow_of_mem_model r order direction cut e c horder hcE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  by_cases hsame : r.orientation = direction
  · exact false_of_four_selected_rows_in_six_ccw_order_I_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut d horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      hbA' heA' hbD' heD' hcB' hfB' hcE' hfE'
  · exact false_of_four_selected_rows_in_six_ccw_order_I_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut d horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      hbA' heA' hbD' heD' hcB' hfB' hcE' hfE'

private theorem false_of_J_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut 0))
    (hdA : placedLabel order direction cut d ∈ r.model.selected (placedLabel order direction cut 0))
    (haB : placedLabel order direction cut 0 ∈ r.model.selected (placedLabel order direction cut b))
    (hcB : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut b))
    (haE : placedLabel order direction cut 0 ∈ r.model.selected (placedLabel order direction cut e))
    (hbE : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut e))
    (hcF : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut f))
    (hdF : placedLabel order direction cut d ∈ r.model.selected (placedLabel order direction cut f)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hdA' := mem_placedRow_of_mem_model r order direction cut 0 d horder hdA
  have haB' := mem_placedRow_of_mem_model r order direction cut b 0 horder haB
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have haE' := mem_placedRow_of_mem_model r order direction cut e 0 horder haE
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hcF' := mem_placedRow_of_mem_model r order direction cut f c horder hcF
  have hdF' := mem_placedRow_of_mem_model r order direction cut f d horder hdF
  by_cases hsame : r.orientation = direction
  · exact false_of_four_selected_rows_in_six_ccw_order_J_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hbA' hdA' haB' hcB' haE' hbE' hcF' hdF'
  · exact false_of_four_selected_rows_in_six_ccw_order_J_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hbA' hdA' haB' hcB' haE' hbE' hcF' hdF'

private theorem false_of_K_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hdE : placedLabel order direction cut d ∈ r.model.selected (placedLabel order direction cut e))
    (hbE : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈ r.model.selected (placedLabel order direction cut e))
    (haD : placedLabel order direction cut 0 ∈ r.model.selected (placedLabel order direction cut d))
    (hcD : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut d))
    (heA : placedLabel order direction cut e ∈ r.model.selected (placedLabel order direction cut 0))
    (hbA : placedLabel order direction cut b ∈ r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈ r.model.selected (placedLabel order direction cut 0))
    (haB : placedLabel order direction cut 0 ∈ r.model.selected (placedLabel order direction cut b))
    (hfB : placedLabel order direction cut f ∈ r.model.selected (placedLabel order direction cut b)) : False := by
  have hdE' := mem_placedRow_of_mem_model r order direction cut e d horder hdE
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  have haD' := mem_placedRow_of_mem_model r order direction cut d 0 horder haD
  have hcD' := mem_placedRow_of_mem_model r order direction cut d c horder hcD
  have heA' := mem_placedRow_of_mem_model r order direction cut 0 e horder heA
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have haB' := mem_placedRow_of_mem_model r order direction cut b 0 horder haB
  have hfB' := mem_placedRow_of_mem_model r order direction cut b f horder hfB
  by_cases hsame : r.orientation = direction
  · exact false_of_four_selected_rows_in_six_ccw_order_K_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut d horder)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      hdE' hbE' hfE' haD' hcD' heA' hbA' hcA' haB' hfB'
  · exact false_of_four_selected_rows_in_six_ccw_order_K_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut d horder)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      hdE' hbE' hfE' haD' hcD' heA' hbA' hcA' haB' hfB'

/-- Every generated H--K clause is true under a source realization. -/
theorem sourceAssign_sixSchemaClause {A : Finset ℝ²}
    (r : SourceRealization A) (schema : SixSchema) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (sixSchemaHits schema order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        sixSchemaHits schema order direction cut [b, c, d, e, f]) :
      placedLabel order direction cut point ∈
        r.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  cases schema with
  | H =>
      exact false_of_H_at r order direction cut b c d e f horder.symm
        h0b hbc hcd hde hef
        (get 0 b (by simp [sixSchemaHits])) (get 0 d (by simp [sixSchemaHits]))
        (get c e (by simp [sixSchemaHits])) (get c f (by simp [sixSchemaHits]))
        (get e d (by simp [sixSchemaHits])) (get e f (by simp [sixSchemaHits]))
        (get f b (by simp [sixSchemaHits])) (get f e (by simp [sixSchemaHits]))
  | I =>
      exact false_of_I_at r order direction cut b c d e f horder.symm
        h0b hbc hcd hde hef
        (get 0 b (by simp [sixSchemaHits])) (get 0 e (by simp [sixSchemaHits]))
        (get d b (by simp [sixSchemaHits])) (get d e (by simp [sixSchemaHits]))
        (get b c (by simp [sixSchemaHits])) (get b f (by simp [sixSchemaHits]))
        (get e c (by simp [sixSchemaHits])) (get e f (by simp [sixSchemaHits]))
  | J =>
      exact false_of_J_at r order direction cut b c d e f horder.symm
        h0b hbc hcd hde hef
        (get 0 b (by simp [sixSchemaHits])) (get 0 d (by simp [sixSchemaHits]))
        (get b 0 (by simp [sixSchemaHits])) (get b c (by simp [sixSchemaHits]))
        (get e 0 (by simp [sixSchemaHits])) (get e b (by simp [sixSchemaHits]))
        (get f c (by simp [sixSchemaHits])) (get f d (by simp [sixSchemaHits]))
  | K =>
      exact false_of_K_at r order direction cut b c d e f horder.symm
        h0b hbc hcd hde hef
        (get e d (by simp [sixSchemaHits])) (get e b (by simp [sixSchemaHits]))
        (get e f (by simp [sixSchemaHits])) (get d 0 (by simp [sixSchemaHits]))
        (get d c (by simp [sixSchemaHits])) (get 0 e (by simp [sixSchemaHits]))
        (get 0 b (by simp [sixSchemaHits])) (get 0 c (by simp [sixSchemaHits]))
        (get b 0 (by simp [sixSchemaHits])) (get b f (by simp [sixSchemaHits]))

/-- Complete guarded H--K clause family. -/
def hijkClauses : Std.Sat.CNF Atom :=
  sixSchemas.flatMap fun schema =>
    namedOrders.flatMap fun order =>
      directions.flatMap fun direction =>
        labels.flatMap fun cut =>
          fiveOffsetChoices.map fun offsets =>
            nogoodClause order (sixSchemaHits schema order direction cut offsets)

/-- Every source realization satisfies the complete H--K family. -/
theorem sourceAssign_hijkClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ hijkClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [hijkClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨schema, _hschema, order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_sixSchemaClause r schema order direction cut offsets hoffsets

/-- Lean-authoritative child root after the complete H--K family. -/
def extendedHijkCnf : Std.Sat.CNF Atom :=
  extendedThreeRowCnf ++ hijkClauses

/-- Exact size of the complete H--K clause family. -/
theorem hijkClauses_length : hijkClauses.length = 1188096 := by
  native_decide

/-- Exact clause count of the Lean-authoritative H--K child root. -/
theorem extendedHijkCnf_clause_count : extendedHijkCnf.length = 3618396 := by
  simp [extendedHijkCnf, extendedThreeRowCnf_clause_count, hijkClauses_length]

/-- Gate B for the complete H--K child root. -/
theorem sourceAssign_extendedHijkCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedHijkCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedHijkCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedThreeRowCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_hijkClauses r clause hnew

/-- Certificate-to-source landing contract for the complete H--K root. -/
theorem false_of_sourceRealization_of_extendedHijkCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedHijkCnf = true) : False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedHijkCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
end Problem97
