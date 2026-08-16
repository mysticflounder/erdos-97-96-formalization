/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements
import Erdos9796Proof.P97.ATail.KalmansonSmallRoleCycleSchemas

/-!
# Complete small-role cycle refinements for the exact-seventeen source CNF

This module enumerates the source-valid cyclic placements of the four- and
five-role distance-class patterns ruled out by `KalmansonSmallRoleCycleSchemas`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSmallRoleCycleRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements
open CapCrossingKalmansonBridge

/-- Increasing four-offset choices for the five-role cycle. -/
def fiveRoleOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 4

/-- Every five-role offset choice gives four strictly increasing positive positions. -/
theorem fiveRoleOffsetChoices_shape :
    ∀ offsets, offsets ∈ fiveRoleOffsetChoices →
      ∃ b c d e : Label,
        offsets = [b, c, d, e] ∧
          (0 : Label) < b ∧ b < c ∧ c < d ∧ d < e := by
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
  · refine ⟨b, c, d, e, rfl, positiveOffsets_pos b ?_, ?_⟩
    · exact hsub.subset (by simp)
    · simp only [List.pairwise_cons, List.mem_cons, forall_eq_or_imp] at hp
      aesop
  · simp at hlen

/-- The four-role placement has a canonical auxiliary point in one of its two
usable open gaps. -/
def fourRoleAuxiliaryAdmissible : List Label → Bool
  | [b, c, d] => decide ((1 : Label) < b ∨ c + 1 < d)
  | _ => false

/-- Increasing three-offset choices for the four-role cycle, retaining exactly
the placements with an auxiliary point in `(0,b)` or `(c,d)`. -/
def fourRoleOffsetChoices : List (List Label) :=
  (positiveOffsets.sublistsLen 3).filter fourRoleAuxiliaryAdmissible

/-- Every retained four-role choice is strictly increasing and has one of the
two canonical auxiliary gaps. -/
theorem fourRoleOffsetChoices_shape :
    ∀ offsets, offsets ∈ fourRoleOffsetChoices →
      ∃ b c d : Label,
        offsets = [b, c, d] ∧
          (0 : Label) < b ∧ b < c ∧ c < d ∧
            ((1 : Label) < b ∨ c + 1 < d) := by
  intro offsets hoffsets
  obtain ⟨hbase, hadmissible⟩ := List.mem_filter.mp hoffsets
  have hthree : offsets ∈
      ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle.threeOffsetChoices := by
    simpa only [ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle.threeOffsetChoices]
      using hbase
  obtain ⟨b, c, d, rfl, h0b, hbc, hcd⟩ :=
    ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle.threeOffsetChoices_shape
      _ hthree
  exact ⟨b, c, d, rfl, h0b, hbc, hcd, by
    simpa only [fourRoleAuxiliaryAdmissible, decide_eq_true_eq] using hadmissible⟩

/-- Exact number of five-role offset choices: `C(16,4)`. -/
theorem fiveRoleOffsetChoices_length : fiveRoleOffsetChoices.length = 1820 := by
  rw [fiveRoleOffsetChoices, List.length_sublistsLen]
  native_decide

/-- Exact number of source-valid four-role offset choices.  These are the 560
increasing triples except the fourteen with `b = 1` and `d = c + 1`. -/
theorem fourRoleOffsetChoices_length : fourRoleOffsetChoices.length = 546 := by
  native_decide

/-- The six selected-class incidences in the five-role cycle. -/
def fiveRoleCycleHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point c),
        (point b, point c), (point b, point e),
        (point d, point b), (point d, point e)]
  | _ => []

/-- The six selected-class incidences in the four-role cycle. -/
def fourRoleCycleHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point c),
        (point b, point 0), (point b, point c),
        (point d, point 0), (point d, point b)]
  | _ => []

/-- A source-authenticated five-role cycle is impossible at every normalized
cyclic placement. -/
theorem false_of_fiveRoleCycle_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d) (hde : d < e)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (heB : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut b))
    (hbD : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut d))
    (heD : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut d)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have heB' := mem_placedRow_of_mem_model r order direction cut b e horder heB
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  have heD' := mem_placedRow_of_mem_model r order direction cut d e horder heD
  by_cases hsame : r.orientation = direction
  · exact false_of_three_selected_classes_of_a_lt_b_lt_c_lt_d_lt_e_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      hbA' hcA' hcB' heB' hbD' heD'
  · exact false_of_three_selected_classes_of_e_lt_d_lt_c_lt_b_lt_a_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      hbA' hcA' hcB' heB' hbD' heD'

/-- A source-authenticated four-role cycle is impossible whenever one of its
two canonical auxiliary gaps is nonempty. -/
theorem false_of_fourRoleCycle_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hgap : (1 : Label) < b ∨ c + 1 < d)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (haB : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut b))
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (haD : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut d))
    (hbD : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut d)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have haB' := mem_placedRow_of_mem_model r order direction cut b 0 horder haB
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have haD' := mem_placedRow_of_mem_model r order direction cut d 0 horder haD
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  rcases hgap with hfirst | hlast
  · by_cases hsame : r.orientation = direction
    · exact false_of_three_selected_classes_of_a_lt_x_lt_b_lt_c_lt_d_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame (by decide)))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hfirst))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut b horder)
        (placedRow r order direction cut d horder)
        hbA' hcA' haB' hcB' haD' hbD'
    · exact false_of_three_selected_classes_of_d_lt_c_lt_b_lt_x_lt_a_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame (by decide)))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hfirst))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut b horder)
        (placedRow r order direction cut d horder)
        hbA' hcA' haB' hcB' haD' hbD'
  · have hcx : c < c + 1 := by
      have hcdVal : c.val < d.val := hcd
      have hlastVal : (c.val + 1) % 17 < d.val := hlast
      change c.val < (c.val + 1) % 17
      omega
    by_cases hsame : r.orientation = direction
    · exact false_of_three_selected_classes_of_a_lt_b_lt_c_lt_x_lt_d_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hcx))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hlast))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut b horder)
        (placedRow r order direction cut d horder)
        hbA' hcA' haB' hcB' haD' hbD'
    · exact false_of_three_selected_classes_of_d_lt_x_lt_c_lt_b_lt_a_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcx))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hlast))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut b horder)
        (placedRow r order direction cut d horder)
        hbA' hcA' haB' hcB' haD' hbD'

/-- One guarded five-role cycle clause is true under every source realization. -/
theorem sourceAssign_fiveRoleCycleClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) (hoffsets : offsets ∈ fiveRoleOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (fiveRoleCycleHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, rfl, h0b, hbc, hcd, hde⟩ :=
    fiveRoleOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_fiveRoleCycle_at r order direction cut b c d e horder.symm
    h0b hbc hcd hde
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut b)
      (by simp [fiveRoleCycleHits])
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut c)
      (by simp [fiveRoleCycleHits])
  · exact hall (placedLabel order direction cut b, placedLabel order direction cut c)
      (by simp [fiveRoleCycleHits])
  · exact hall (placedLabel order direction cut b, placedLabel order direction cut e)
      (by simp [fiveRoleCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut b)
      (by simp [fiveRoleCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut e)
      (by simp [fiveRoleCycleHits])

/-- One guarded source-valid four-role cycle clause is true under every source
realization. -/
theorem sourceAssign_fourRoleCycleClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) (hoffsets : offsets ∈ fourRoleOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (fourRoleCycleHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, rfl, h0b, hbc, hcd, hgap⟩ :=
    fourRoleOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_fourRoleCycle_at r order direction cut b c d horder.symm
    h0b hbc hcd hgap
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut b)
      (by simp [fourRoleCycleHits])
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut c)
      (by simp [fourRoleCycleHits])
  · exact hall (placedLabel order direction cut b, placedLabel order direction cut 0)
      (by simp [fourRoleCycleHits])
  · exact hall (placedLabel order direction cut b, placedLabel order direction cut c)
      (by simp [fourRoleCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut 0)
      (by simp [fourRoleCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut b)
      (by simp [fourRoleCycleHits])

private def completeSmallRoleClauseFamily (choices : List (List Label))
    (hits : NamedOrder → Orientation → Label → List Label → List Hit) :
    Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order ↦
    directions.flatMap fun direction ↦
      labels.flatMap fun cut ↦
        choices.map fun offsets ↦
          nogoodClause order (hits order direction cut offsets)

/-- Complete guarded five-role cycle clause family. -/
def fiveRoleCycleClauses : Std.Sat.CNF Atom :=
  completeSmallRoleClauseFamily fiveRoleOffsetChoices fiveRoleCycleHits

/-- Complete guarded source-valid four-role cycle clause family. -/
def fourRoleCycleClauses : Std.Sat.CNF Atom :=
  completeSmallRoleClauseFamily fourRoleOffsetChoices fourRoleCycleHits

private theorem mem_completeSmallRoleClauseFamily
    {choices : List (List Label)}
    {hits : NamedOrder → Orientation → Label → List Label → List Hit}
    {clause : Std.Sat.CNF.Clause Atom}
    (hclause : clause ∈ completeSmallRoleClauseFamily choices hits) :
    ∃ order ∈ namedOrders, ∃ direction ∈ directions, ∃ cut ∈ labels,
      ∃ offsets ∈ choices,
        nogoodClause order (hits order direction cut offsets) = clause := by
  simpa only [completeSmallRoleClauseFamily, List.mem_flatMap, List.mem_map] using hclause

/-- Every complete five-role cycle clause is source-valid. -/
theorem sourceAssign_fiveRoleCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ fiveRoleCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ :=
    mem_completeSmallRoleClauseFamily (choices := fiveRoleOffsetChoices)
      (hits := fiveRoleCycleHits) hclause
  exact sourceAssign_fiveRoleCycleClause r order direction cut offsets hoffsets

/-- Every complete source-valid four-role cycle clause is source-valid. -/
theorem sourceAssign_fourRoleCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ fourRoleCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ :=
    mem_completeSmallRoleClauseFamily (choices := fourRoleOffsetChoices)
      (hits := fourRoleCycleHits) hclause
  exact sourceAssign_fourRoleCycleClause r order direction cut offsets hoffsets

/-- Complete small-role cycle clause bank. -/
def smallRoleCycleClauses : Std.Sat.CNF Atom :=
  fiveRoleCycleClauses ++ fourRoleCycleClauses

/-- Every source realization satisfies the complete small-role cycle bank. -/
theorem sourceAssign_smallRoleCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ smallRoleCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [smallRoleCycleClauses, List.mem_append] at hclause
  rcases hclause with hfive | hfour
  · exact sourceAssign_fiveRoleCycleClauses r clause hfive
  · exact sourceAssign_fourRoleCycleClauses r clause hfour

theorem fiveRoleCycleClauses_length : fiveRoleCycleClauses.length = 123760 := by
  simp [fiveRoleCycleClauses, completeSmallRoleClauseFamily, namedOrders,
    directions, labels, fiveRoleOffsetChoices_length]

theorem fourRoleCycleClauses_length : fourRoleCycleClauses.length = 37128 := by
  simp [fourRoleCycleClauses, completeSmallRoleClauseFamily, namedOrders,
    directions, labels, fourRoleOffsetChoices_length]

theorem smallRoleCycleClauses_length : smallRoleCycleClauses.length = 160888 := by
  simp [smallRoleCycleClauses, fiveRoleCycleClauses_length, fourRoleCycleClauses_length]

/-- The current exact-seventeen root extended by the complete source-valid
small-role cycle bank. -/
def extendedSmallRoleCycleCnf : Std.Sat.CNF Atom :=
  extendedCurrentRootTwoKalmansonSuccessorCnf ++ smallRoleCycleClauses

theorem extendedSmallRoleCycleCnf_length : extendedSmallRoleCycleCnf.length = 7198388 := by
  simp [extendedSmallRoleCycleCnf, extendedCurrentRootTwoKalmansonSuccessorCnf_length,
    smallRoleCycleClauses_length]

/-- Every source realization satisfies the complete extended formula. -/
theorem sourceAssign_extendedSmallRoleCycleCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedSmallRoleCycleCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedSmallRoleCycleCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsmall
  · have h := sourceAssign_extendedCurrentRootTwoKalmansonSuccessorCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_smallRoleCycleClauses r clause hsmall

/-- Terminal landing contract for the current root extended by the complete
small-role cycle bank. -/
theorem false_of_sourceRealization_of_extendedSmallRoleCycleCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedSmallRoleCycleCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model, sourceAssign_extendedSmallRoleCycleCnf source⟩

#print axioms sourceAssign_smallRoleCycleClauses
#print axioms sourceAssign_extendedSmallRoleCycleCnf
#print axioms false_of_sourceRealization_of_extendedSmallRoleCycleCnf_unsat

end ATailBlockerVExactSeventeenSmallRoleCycleRefinements
end Problem97
