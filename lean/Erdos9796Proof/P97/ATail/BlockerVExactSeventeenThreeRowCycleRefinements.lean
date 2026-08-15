/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySixthModelRefinements
import Erdos9796Proof.P97.ATail.KalmansonThreeRowCycleSchemas

/-!
# Complete three-row cycle refinements for the exact-seventeen source CNF

Three selected distance classes may form a six-incidence cycle on six distinct
boundary points.  The three clause families below enumerate every cyclic
placement of the three order types ruled out by the source-clean Kalmanson
consumers in `KalmansonThreeRowCycleSchemas`.

The clauses are generated for both source-forced named orders, both cyclic
directions, all seventeen cuts, and every increasing five-offset choice.  Their
soundness is proved from `SourceRealization`; the solver is not trusted to
justify any learned clause.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThreeRowCycleRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortySixthModelRefinements
open CapCrossingKalmansonBridge

/-- The adjacent/adjacent three-row cycle at one cyclic placement. -/
def adjacentAdjacentCycleHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point c),
        (point d, point c), (point d, point f),
        (point e, point b), (point e, point f)]
  | _ => []

/-- The left adjacent/inner-outer three-row cycle at one cyclic placement. -/
def adjacentInnerOuterLeftCycleHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point c),
        (point e, point b), (point e, point d),
        (point f, point c), (point f, point d)]
  | _ => []

/-- The right adjacent/inner-outer three-row cycle at one cyclic placement. -/
def adjacentInnerOuterRightCycleHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point d),
        (point e, point b), (point e, point c),
        (point f, point c), (point f, point d)]
  | _ => []

/-- A source-authenticated adjacent/adjacent cycle is impossible at every
normalized cyclic placement. -/
theorem false_of_adjacentAdjacentCycle_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcD : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut d))
    (hfD : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut d))
    (hbE : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut e)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have hcD' := mem_placedRow_of_mem_model r order direction cut d c horder hcD
  have hfD' := mem_placedRow_of_mem_model r order direction cut d f horder hfD
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  by_cases hsame : r.orientation = direction
  · exact false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut d horder)
      (placedRow r order direction cut e horder)
      hbA' hcA' hcD' hfD' hbE' hfE'
  · exact
      false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift_of_decreasing
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut d horder)
        (placedRow r order direction cut e horder)
        hbA' hcA' hcD' hfD' hbE' hfE'

/-- A source-authenticated left adjacent/inner-outer cycle is impossible at
every normalized cyclic placement. -/
theorem false_of_adjacentInnerOuterLeftCycle_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut b c d e f : Label) (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbE : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut e))
    (hdE : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut e))
    (hcF : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut f))
    (hdF : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut f)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hdE' := mem_placedRow_of_mem_model r order direction cut e d horder hdE
  have hcF' := mem_placedRow_of_mem_model r order direction cut f c horder hcF
  have hdF' := mem_placedRow_of_mem_model r order direction cut f d horder hdF
  by_cases hsame : r.orientation = direction
  · exact
      false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_left_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut e horder)
        (placedRow r order direction cut f horder)
        hbA' hcA' hbE' hdE' hcF' hdF'
  · exact
      false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_left_cyclicShift_of_decreasing
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut e horder)
        (placedRow r order direction cut f horder)
        hbA' hcA' hbE' hdE' hcF' hdF'

/-- A source-authenticated right adjacent/inner-outer cycle is impossible at
every normalized cyclic placement. -/
theorem false_of_adjacentInnerOuterRightCycle_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut b c d e f : Label) (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hdA : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbE : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut e))
    (hcE : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut e))
    (hcF : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut f))
    (hdF : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut f)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hdA' := mem_placedRow_of_mem_model r order direction cut 0 d horder hdA
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hcE' := mem_placedRow_of_mem_model r order direction cut e c horder hcE
  have hcF' := mem_placedRow_of_mem_model r order direction cut f c horder hcF
  have hdF' := mem_placedRow_of_mem_model r order direction cut f d horder hdF
  by_cases hsame : r.orientation = direction
  · exact
      false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_right_cyclicShift
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
        (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut e horder)
        (placedRow r order direction cut f horder)
        hbA' hdA' hbE' hcE' hcF' hdF'
  · exact
      false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_right_cyclicShift_of_decreasing
        r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
        r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
        (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
        (placedRow r order direction cut 0 horder)
        (placedRow r order direction cut e horder)
        (placedRow r order direction cut f horder)
        hbA' hdA' hbE' hcE' hcF' hdF'

/-- The adjacent/adjacent clause at one normalized cyclic placement is true
under every source realization. -/
theorem sourceAssign_adjacentAdjacentCycleClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (adjacentAdjacentCycleHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_adjacentAdjacentCycle_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut b)
      (by simp [adjacentAdjacentCycleHits])
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut c)
      (by simp [adjacentAdjacentCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut c)
      (by simp [adjacentAdjacentCycleHits])
  · exact hall (placedLabel order direction cut d, placedLabel order direction cut f)
      (by simp [adjacentAdjacentCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut b)
      (by simp [adjacentAdjacentCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut f)
      (by simp [adjacentAdjacentCycleHits])

/-- The left adjacent/inner-outer clause at one normalized cyclic placement is
true under every source realization. -/
theorem sourceAssign_adjacentInnerOuterLeftCycleClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order
        (adjacentInnerOuterLeftCycleHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_adjacentInnerOuterLeftCycle_at r order direction cut b c d e f
    horder.symm h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut b)
      (by simp [adjacentInnerOuterLeftCycleHits])
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut c)
      (by simp [adjacentInnerOuterLeftCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut b)
      (by simp [adjacentInnerOuterLeftCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut d)
      (by simp [adjacentInnerOuterLeftCycleHits])
  · exact hall (placedLabel order direction cut f, placedLabel order direction cut c)
      (by simp [adjacentInnerOuterLeftCycleHits])
  · exact hall (placedLabel order direction cut f, placedLabel order direction cut d)
      (by simp [adjacentInnerOuterLeftCycleHits])

/-- The right adjacent/inner-outer clause at one normalized cyclic placement is
true under every source realization. -/
theorem sourceAssign_adjacentInnerOuterRightCycleClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order
        (adjacentInnerOuterRightCycleHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_adjacentInnerOuterRightCycle_at r order direction cut b c d e f
    horder.symm h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut b)
      (by simp [adjacentInnerOuterRightCycleHits])
  · exact hall (placedLabel order direction cut 0, placedLabel order direction cut d)
      (by simp [adjacentInnerOuterRightCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut b)
      (by simp [adjacentInnerOuterRightCycleHits])
  · exact hall (placedLabel order direction cut e, placedLabel order direction cut c)
      (by simp [adjacentInnerOuterRightCycleHits])
  · exact hall (placedLabel order direction cut f, placedLabel order direction cut c)
      (by simp [adjacentInnerOuterRightCycleHits])
  · exact hall (placedLabel order direction cut f, placedLabel order direction cut d)
      (by simp [adjacentInnerOuterRightCycleHits])

private def completeCycleClauseFamily
    (hits : NamedOrder → Orientation → Label → List Label → List Hit) :
    Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order ↦
    directions.flatMap fun direction ↦
      labels.flatMap fun cut ↦
        fiveOffsetChoices.map fun offsets ↦
          nogoodClause order (hits order direction cut offsets)

/-- Complete guarded adjacent/adjacent cycle clause family. -/
def adjacentAdjacentCycleClauses : Std.Sat.CNF Atom :=
  completeCycleClauseFamily adjacentAdjacentCycleHits

/-- Complete guarded left adjacent/inner-outer cycle clause family. -/
def adjacentInnerOuterLeftCycleClauses : Std.Sat.CNF Atom :=
  completeCycleClauseFamily adjacentInnerOuterLeftCycleHits

/-- Complete guarded right adjacent/inner-outer cycle clause family. -/
def adjacentInnerOuterRightCycleClauses : Std.Sat.CNF Atom :=
  completeCycleClauseFamily adjacentInnerOuterRightCycleHits

private theorem mem_completeCycleClauseFamily
    {hits : NamedOrder → Orientation → Label → List Label → List Hit}
    {clause : Std.Sat.CNF.Clause Atom}
    (hclause : clause ∈ completeCycleClauseFamily hits) :
    ∃ order ∈ namedOrders, ∃ direction ∈ directions, ∃ cut ∈ labels,
      ∃ offsets ∈ fiveOffsetChoices,
        nogoodClause order (hits order direction cut offsets) = clause := by
  simpa only [completeCycleClauseFamily, List.mem_flatMap, List.mem_map] using hclause

/-- Every complete adjacent/adjacent cycle clause is source-valid. -/
theorem sourceAssign_adjacentAdjacentCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ adjacentAdjacentCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ :=
    mem_completeCycleClauseFamily (hits := adjacentAdjacentCycleHits) hclause
  exact sourceAssign_adjacentAdjacentCycleClause r order direction cut offsets hoffsets

/-- Every complete left adjacent/inner-outer cycle clause is source-valid. -/
theorem sourceAssign_adjacentInnerOuterLeftCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ adjacentInnerOuterLeftCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ :=
    mem_completeCycleClauseFamily (hits := adjacentInnerOuterLeftCycleHits) hclause
  exact sourceAssign_adjacentInnerOuterLeftCycleClause r order direction cut offsets hoffsets

/-- Every complete right adjacent/inner-outer cycle clause is source-valid. -/
theorem sourceAssign_adjacentInnerOuterRightCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ adjacentInnerOuterRightCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ :=
    mem_completeCycleClauseFamily (hits := adjacentInnerOuterRightCycleHits) hclause
  exact sourceAssign_adjacentInnerOuterRightCycleClause r order direction cut offsets hoffsets

/-- Complete source-valid three-row cycle clause bank. -/
def threeRowCycleClauses : Std.Sat.CNF Atom :=
  adjacentAdjacentCycleClauses ++ adjacentInnerOuterLeftCycleClauses ++
    adjacentInnerOuterRightCycleClauses

theorem adjacentAdjacentCycleClauses_length :
    adjacentAdjacentCycleClauses.length = 297024 := by
  simp [adjacentAdjacentCycleClauses, completeCycleClauseFamily, namedOrders,
    directions, labels, fiveOffsetChoices_length]

theorem adjacentInnerOuterLeftCycleClauses_length :
    adjacentInnerOuterLeftCycleClauses.length = 297024 := by
  simp [adjacentInnerOuterLeftCycleClauses, completeCycleClauseFamily, namedOrders,
    directions, labels, fiveOffsetChoices_length]

theorem adjacentInnerOuterRightCycleClauses_length :
    adjacentInnerOuterRightCycleClauses.length = 297024 := by
  simp [adjacentInnerOuterRightCycleClauses, completeCycleClauseFamily, namedOrders,
    directions, labels, fiveOffsetChoices_length]

theorem threeRowCycleClauses_length : threeRowCycleClauses.length = 891072 := by
  simp [threeRowCycleClauses, adjacentAdjacentCycleClauses_length,
    adjacentInnerOuterLeftCycleClauses_length,
    adjacentInnerOuterRightCycleClauses_length]

/-- Every source realization satisfies the complete three-row cycle bank. -/
theorem sourceAssign_threeRowCycleClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ threeRowCycleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [threeRowCycleClauses, List.mem_append] at hclause
  rcases hclause with hclause | hright
  · rcases hclause with haa | hleft
    · exact sourceAssign_adjacentAdjacentCycleClauses r clause haa
    · exact sourceAssign_adjacentInnerOuterLeftCycleClauses r clause hleft
  · exact sourceAssign_adjacentInnerOuterRightCycleClauses r clause hright

/-- Child46 extended by the complete source-valid three-row cycle bank. -/
def extendedThreeRowCycleCnf : Std.Sat.CNF Atom :=
  extendedFortySixthModelRefinementsCnf ++ threeRowCycleClauses

theorem extendedThreeRowCycleCnf_length : extendedThreeRowCycleCnf.length = 6739936 := by
  simp [extendedThreeRowCycleCnf, extendedFortySixthModelRefinementsCnf_length,
    threeRowCycleClauses_length]

/-- Every source realization satisfies the complete extended formula. -/
theorem sourceAssign_extendedThreeRowCycleCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedThreeRowCycleCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThreeRowCycleCnf, List.mem_append] at hclause
  rcases hclause with hparent | hcycle
  · have h := sourceAssign_extendedFortySixthModelRefinementsCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_threeRowCycleClauses r clause hcycle

/-- Explicit terminal landing contract for the complete three-row cycle root. -/
theorem false_of_sourceRealization_of_extendedThreeRowCycleCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThreeRowCycleCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedThreeRowCycleCnf source⟩

#print axioms sourceAssign_threeRowCycleClauses
#print axioms sourceAssign_extendedThreeRowCycleCnf
#print axioms false_of_sourceRealization_of_extendedThreeRowCycleCnf_unsat

end ATailBlockerVExactSeventeenThreeRowCycleRefinements
end Problem97
