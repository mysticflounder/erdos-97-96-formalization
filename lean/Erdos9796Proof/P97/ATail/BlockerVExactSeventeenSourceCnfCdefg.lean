/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnf
import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

/-!
# Checked C--G theorem-bank clauses for the exact-seventeen source CNF

This module generates the cyclic placements of the source-clean Kalmanson
schemas C through G directly in Lean.  Every clause is guarded by its named
source order.  The soundness proof transports positive finite hit atoms back
to genuine selected carrier rows before invoking the corresponding geometric
consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefg

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open CapCrossingKalmansonBridge

abbrev Hit := Label × Label

/-- The two cyclic directions enumerated by the theorem bank. -/
def directions : List Orientation := [.forward, .reverse]

/-- The two source-forced named orders. -/
def namedOrders : List NamedOrder := List.ofFn id

/-- Positive offsets from a normalized cyclic-window start. -/
def positiveOffsets : List Label := labels.tail

/-- Increasing five-offset choices for six-point schemas. -/
def fiveOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 5

/-- Increasing six-offset choices for seven-point schemas. -/
def sixOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 6

/-- The canonical positive offsets occur in strict boundary order.  Keeping
this as a small finite fact avoids asking `native_decide` to normalize every
five- or six-element sublist separately. -/
theorem positiveOffsets_pairwise : positiveOffsets.Pairwise (· < ·) := by
  native_decide

/-- Every canonical positive offset is genuinely nonzero. -/
theorem positiveOffsets_pos :
    ∀ x ∈ positiveOffsets, (0 : Label) < x := by
  native_decide

/-- Position in the canonical named order reached in the chosen direction. -/
def sourcePosition (direction : Orientation) (cut offset : Label) : Label :=
  match direction with
  | .forward => cut + offset
  | .reverse => cut - offset

/-- Canonical label at a cyclic offset from a cut. -/
def placedLabel (order : NamedOrder) (direction : Orientation)
    (cut offset : Label) : Label :=
  labelAtPosition order (sourcePosition direction cut offset)

/-- Local consumer index before applying the cyclic cut. -/
def localPosition (sourceOrientation direction : Orientation)
    (offset : Label) : Label :=
  if sourceOrientation = direction then offset else Fin.rev offset

theorem localPosition_lt_of_same {sourceOrientation direction : Orientation}
    (hsame : sourceOrientation = direction) {left right : Label}
    (hlt : left < right) :
    localPosition sourceOrientation direction left <
      localPosition sourceOrientation direction right := by
  subst sourceOrientation
  simpa [localPosition] using hlt

theorem localPosition_lt_of_ne {sourceOrientation direction : Orientation}
    (hne : sourceOrientation ≠ direction) {left right : Label}
    (hlt : left < right) :
    localPosition sourceOrientation direction right <
      localPosition sourceOrientation direction left := by
  cases sourceOrientation <;> cases direction <;>
    simp_all [localPosition, Fin.rev_lt_rev]

/-- Consumer cut which reconciles the source orientation and clause direction. -/
def consumerCut (sourceOrientation direction : Orientation)
    (cut : Label) : Label :=
  match sourceOrientation, direction with
  | .forward, .forward => cut
  | .forward, .reverse => cut + 1
  | .reverse, .forward => 0 - cut
  | .reverse, .reverse => Fin.rev cut

/-- Finite regression for the four orientation/direction coordinate formulas. -/
theorem expectedLabelIndex_placedLabel :
    ∀ sourceOrientation direction order cut offset,
      expectedLabelIndex sourceOrientation order
          (placedLabel order direction cut offset) =
        localPosition sourceOrientation direction offset +
          consumerCut sourceOrientation direction cut := by
  intro sourceOrientation direction
  cases sourceOrientation <;> cases direction <;> native_decide

/-- A placed source label denotes the boundary point expected by a cyclic
Kalmanson consumer. -/
theorem placedPoint_eq {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut offset : Label)
    (horder : order = r.model.order) :
    r.boundary (r.labelIndex (placedLabel order direction cut offset)) =
      r.cardBoundary
        (r.toCardIndex (localPosition r.orientation direction offset) +
          r.toCardIndex (consumerCut r.orientation direction cut)) := by
  subst order
  rw [r.labelIndex_eq, expectedLabelIndex_placedLabel]
  rw [← r.toCardIndex_add, r.cardBoundary_toCardIndex]

/-- Genuine selected row at a placed source center, cast to the consumer's
cyclicly shifted boundary index. -/
noncomputable def placedRow {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut centerOffset : Label)
    (horder : order = r.model.order) :
    SelectedFourClass A
      (r.cardBoundary
        (r.toCardIndex (localPosition r.orientation direction centerOffset) +
          r.toCardIndex (consumerCut r.orientation direction cut))) :=
  let row := r.selectedRow (placedLabel order direction cut centerOffset)
  { support := row.support
    support_subset_A := row.support_subset_A
    support_card := row.support_card
    radius := row.radius
    radius_pos := row.radius_pos
    support_eq_radius := by
      intro point hpoint
      rw [← placedPoint_eq r order direction cut centerOffset horder]
      exact row.support_eq_radius point hpoint
    center_not_mem := by
      rw [← placedPoint_eq r order direction cut centerOffset horder]
      exact row.center_not_mem }

/-- Casting the center of a placed row does not change its finite support. -/
theorem placedRow_support {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut centerOffset : Label)
    (horder : order = r.model.order) :
    (placedRow r order direction cut centerOffset horder).support =
      (r.selectedRow (placedLabel order direction cut centerOffset)).support := by
  rfl

/-- Transport a positive placed hit atom to the row used by a cyclic consumer. -/
theorem mem_placedRow_of_mem_model {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut centerOffset pointOffset : Label)
    (horder : order = r.model.order)
    (hmem : placedLabel order direction cut pointOffset ∈
      r.model.selected (placedLabel order direction cut centerOffset)) :
    r.cardBoundary
        (r.toCardIndex (localPosition r.orientation direction pointOffset) +
          r.toCardIndex (consumerCut r.orientation direction cut)) ∈
      (placedRow r order direction cut centerOffset horder).support := by
  rw [placedRow_support]
  simpa only [placedPoint_eq r order direction cut pointOffset horder] using
    r.mem_selectedRow_of_mem_model hmem

/-- A guarded negative-hit clause for one forbidden incidence motif. -/
def nogoodClause (order : NamedOrder) (hits : List Hit) :
    Std.Sat.CNF.Clause Atom :=
  neg (.namedOrder order) ::
    hits.map fun hit => neg (.hit hit.1 hit.2)

/-- Semantic admission rule for a guarded incidence nogood. -/
theorem sourceAssign_nogoodClause (model : SourceModel)
    (order : NamedOrder) (hits : List Hit)
    (hforbidden : model.order = order →
      ¬ ∀ hit ∈ hits, hit.2 ∈ model.selected hit.1) :
    Std.Sat.CNF.Clause.eval (sourceAssign model)
      (nogoodClause order hits) = true := by
  classical
  by_cases horder : model.order = order
  · have hnotall := hforbidden horder
    push_neg at hnotall
    obtain ⟨hit, hhits, hnotmem⟩ := hnotall
    apply (clause_eval_iff model _).2
    refine ⟨.hit hit.1 hit.2, false, ?_, ?_⟩
    · simp [nogoodClause, neg, hhits]
    · simp [sourceAssign, hnotmem]
  · apply (clause_eval_iff model _).2
    refine ⟨.namedOrder order, false, ?_, ?_⟩
    · simp [nogoodClause, neg]
    · have hne : order ≠ model.order := fun h => horder h.symm
      simp [sourceAssign, hne]

/-- Every enumerated five-offset list has the strict shape needed by a
six-point consumer. -/
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

/-- Every enumerated six-offset list has the strict shape needed by a
seven-point consumer. -/
theorem sixOffsetChoices_shape :
    ∀ offsets, offsets ∈ sixOffsetChoices →
      ∃ b c d e f g : Label,
        offsets = [b, c, d, e, f, g] ∧
          (0 : Label) < b ∧ b < c ∧ c < d ∧ d < e ∧ e < f ∧ f < g := by
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
  · simp at hlen
  rcases offsets with _ | ⟨h, offsets⟩
  · refine ⟨b, c, d, e, f, g, rfl, positiveOffsets_pos b ?_, ?_⟩
    · exact hsub.subset (by simp)
    · simp only [List.pairwise_cons, List.mem_cons, forall_eq_or_imp] at hp
      aesop
  · simp at hlen

/-- Exact finite size of the six-point placement choice set. -/
theorem fiveOffsetChoices_length : fiveOffsetChoices.length = 4368 := by
  rw [fiveOffsetChoices, List.length_sublistsLen]
  native_decide

/-- Exact finite size of the seven-point placement choice set. -/
theorem sixOffsetChoices_length : sixOffsetChoices.length = 8008 := by
  rw [sixOffsetChoices, List.length_sublistsLen]
  native_decide

/-- Schema D placed at an arbitrary cyclic cut and direction. -/
def schemaDHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point e), (point 0, point b),
        (point e, point 0), (point e, point c), (point e, point f),
        (point b, point e), (point b, point f),
        (point d, point e), (point d, point b), (point d, point c)]
  | _ => []

/-- Source-authenticated schema D is impossible at every normalized cyclic
placement. -/
theorem false_of_schemaD_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (heA : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (haE : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut e))
    (hcE : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut e))
    (heB : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut b))
    (hfB : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut b))
    (heD : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut d))
    (hbD : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut d))
    (hcD : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut d)) : False := by
  have heA' := mem_placedRow_of_mem_model r order direction cut 0 e horder heA
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have haE' := mem_placedRow_of_mem_model r order direction cut e 0 horder haE
  have hcE' := mem_placedRow_of_mem_model r order direction cut e c horder hcE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  have heB' := mem_placedRow_of_mem_model r order direction cut b e horder heB
  have hfB' := mem_placedRow_of_mem_model r order direction cut b f horder hfB
  have heD' := mem_placedRow_of_mem_model r order direction cut d e horder heD
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  have hcD' := mem_placedRow_of_mem_model r order direction cut d c horder hcD
  by_cases hsame : r.orientation = direction
  · have hAB := localPosition_lt_of_same hsame h0b
    have hBC := localPosition_lt_of_same hsame hbc
    have hCD := localPosition_lt_of_same hsame hcd
    have hDE := localPosition_lt_of_same hsame hde
    have hEF := localPosition_lt_of_same hsame hef
    exact false_of_four_selected_rows_in_six_ccw_order_D_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      heA' hbA' haE' hcE' hfE' heB' hfB' heD' hbD' hcD'
  · have hBA := localPosition_lt_of_ne hsame h0b
    have hCB := localPosition_lt_of_ne hsame hbc
    have hDC := localPosition_lt_of_ne hsame hcd
    have hED := localPosition_lt_of_ne hsame hde
    have hFE := localPosition_lt_of_ne hsame hef
    exact false_of_four_selected_rows_in_six_ccw_order_D_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      heA' hbA' haE' hcE' hfE' heB' hfB' heD' hbD' hcD'

/-- Every single generated schema-D clause is true under a source-authenticated
realization. -/
theorem sourceAssign_schemaDClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (schemaDHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_schemaD_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut e) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut b) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut 0) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut c) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut f) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut e) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut f) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut e) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut b) (by simp [schemaDHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut c) (by simp [schemaDHits])

/-- Complete guarded schema-D cyclic-placement clause family. -/
def schemaDClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        fiveOffsetChoices.map fun offsets =>
          nogoodClause order (schemaDHits order direction cut offsets)

/-- Every clause in the complete schema-D family is admitted by each
source-authenticated realization. -/
theorem sourceAssign_schemaDClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ schemaDClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [schemaDClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_schemaDClause r order direction cut offsets hoffsets

/-- Schema E placed at an arbitrary cyclic cut and direction. -/
def schemaEHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point f), (point 0, point d),
        (point e, point b), (point e, point c),
        (point b, point 0), (point b, point c), (point b, point d),
        (point c, point f), (point c, point b)]
  | _ => []

/-- Source-authenticated schema E is impossible at every normalized cyclic
placement. -/
theorem false_of_schemaE_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hfA : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut 0))
    (hdA : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbE : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut e))
    (hcE : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut e))
    (haB : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut b))
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (hdB : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut b))
    (hfC : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut c))
    (hbC : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut c)) : False := by
  have hfA' := mem_placedRow_of_mem_model r order direction cut 0 f horder hfA
  have hdA' := mem_placedRow_of_mem_model r order direction cut 0 d horder hdA
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  have hcE' := mem_placedRow_of_mem_model r order direction cut e c horder hcE
  have haB' := mem_placedRow_of_mem_model r order direction cut b 0 horder haB
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have hdB' := mem_placedRow_of_mem_model r order direction cut b d horder hdB
  have hfC' := mem_placedRow_of_mem_model r order direction cut c f horder hfC
  have hbC' := mem_placedRow_of_mem_model r order direction cut c b horder hbC
  by_cases hsame : r.orientation = direction
  · have hAB := localPosition_lt_of_same hsame h0b
    have hBC := localPosition_lt_of_same hsame hbc
    have hCD := localPosition_lt_of_same hsame hcd
    have hDE := localPosition_lt_of_same hsame hde
    have hEF := localPosition_lt_of_same hsame hef
    exact false_of_four_selected_rows_in_six_ccw_order_E_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut c horder)
      hfA' hdA' hbE' hcE' haB' hcB' hdB' hfC' hbC'
  · have hBA := localPosition_lt_of_ne hsame h0b
    have hCB := localPosition_lt_of_ne hsame hbc
    have hDC := localPosition_lt_of_ne hsame hcd
    have hED := localPosition_lt_of_ne hsame hde
    have hFE := localPosition_lt_of_ne hsame hef
    exact false_of_four_selected_rows_in_six_ccw_order_E_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut c horder)
      hfA' hdA' hbE' hcE' haB' hcB' hdB' hfC' hbC'

/-- Every single generated schema-E clause is true under a source-authenticated
realization. -/
theorem sourceAssign_schemaEClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (schemaEHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_schemaE_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut f) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut d) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut b) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut c) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut 0) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut c) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut d) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut f) (by simp [schemaEHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut b) (by simp [schemaEHits])

/-- Complete guarded schema-E cyclic-placement clause family. -/
def schemaEClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        fiveOffsetChoices.map fun offsets =>
          nogoodClause order (schemaEHits order direction cut offsets)

/-- Every clause in the complete schema-E family is admitted by each
source-authenticated realization. -/
theorem sourceAssign_schemaEClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ schemaEClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [schemaEClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_schemaEClause r order direction cut offsets hoffsets

/-- Schema C placed at an arbitrary cyclic cut and direction. -/
def schemaCHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f, g] =>
      let point := placedLabel order direction cut
      [(point 0, point f), (point 0, point b),
        (point f, point 0), (point f, point d), (point f, point g),
        (point c, point d), (point c, point g),
        (point e, point f), (point e, point b)]
  | _ => []

/-- Source-authenticated schema C is impossible at every normalized cyclic
placement. -/
theorem false_of_schemaC_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f g : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hfA : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (haF : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut f))
    (hdF : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut f))
    (hgF : placedLabel order direction cut g ∈
      r.model.selected (placedLabel order direction cut f))
    (hdC : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut c))
    (hgC : placedLabel order direction cut g ∈
      r.model.selected (placedLabel order direction cut c))
    (hfE : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut e))
    (hbE : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut e)) : False := by
  have hfA' := mem_placedRow_of_mem_model r order direction cut 0 f horder hfA
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have haF' := mem_placedRow_of_mem_model r order direction cut f 0 horder haF
  have hdF' := mem_placedRow_of_mem_model r order direction cut f d horder hdF
  have hgF' := mem_placedRow_of_mem_model r order direction cut f g horder hgF
  have hdC' := mem_placedRow_of_mem_model r order direction cut c d horder hdC
  have hgC' := mem_placedRow_of_mem_model r order direction cut c g horder hgC
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  have hbE' := mem_placedRow_of_mem_model r order direction cut e b horder hbE
  by_cases hsame : r.orientation = direction
  · have hAB := localPosition_lt_of_same hsame h0b
    have hBC := localPosition_lt_of_same hsame hbc
    have hCD := localPosition_lt_of_same hsame hcd
    have hDE := localPosition_lt_of_same hsame hde
    have hEF := localPosition_lt_of_same hsame hef
    have hFG := localPosition_lt_of_same hsame hfg
    exact false_of_four_selected_rows_in_seven_ccw_order_C_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF) (r.toCardIndex_lt hFG)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut f horder)
      (placedRow r order direction cut c horder)
      (placedRow r order direction cut e horder)
      hfA' hbA' haF' hdF' hgF' hdC' hgC' hfE' hbE'
  · have hBA := localPosition_lt_of_ne hsame h0b
    have hCB := localPosition_lt_of_ne hsame hbc
    have hDC := localPosition_lt_of_ne hsame hcd
    have hED := localPosition_lt_of_ne hsame hde
    have hFE := localPosition_lt_of_ne hsame hef
    have hGF := localPosition_lt_of_ne hsame hfg
    exact false_of_four_selected_rows_in_seven_ccw_order_C_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE) (r.toCardIndex_lt hGF)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut f horder)
      (placedRow r order direction cut c horder)
      (placedRow r order direction cut e horder)
      hfA' hbA' haF' hdF' hgF' hdC' hgC' hfE' hbE'

/-- Every single generated schema-C clause is true under a source-authenticated
realization. -/
theorem sourceAssign_schemaCClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ sixOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (schemaCHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, g, rfl, h0b, hbc, hcd, hde, hef, hfg⟩ :=
    sixOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_schemaC_at r order direction cut b c d e f g horder.symm
    h0b hbc hcd hde hef hfg
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut f) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut b) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut 0) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut d) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut g) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut d) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut g) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut f) (by simp [schemaCHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut b) (by simp [schemaCHits])

/-- Complete guarded schema-C cyclic-placement clause family. -/
def schemaCClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        sixOffsetChoices.map fun offsets =>
          nogoodClause order (schemaCHits order direction cut offsets)

/-- Every clause in the complete schema-C family is admitted by each
source-authenticated realization. -/
theorem sourceAssign_schemaCClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ schemaCClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [schemaCClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_schemaCClause r order direction cut offsets hoffsets

/-- Schema F placed at an arbitrary cyclic cut and direction. -/
def schemaFHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f, g] =>
      let point := placedLabel order direction cut
      [(point 0, point f), (point 0, point c),
        (point f, point 0), (point f, point g), (point f, point c),
        (point b, point f), (point b, point e),
        (point d, point b), (point d, point e), (point d, point g)]
  | _ => []

/-- Source-authenticated schema F is impossible at every normalized cyclic
placement. -/
theorem false_of_schemaF_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f g : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hfA : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (haF : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut f))
    (hgF : placedLabel order direction cut g ∈
      r.model.selected (placedLabel order direction cut f))
    (hcF : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut f))
    (hfB : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut b))
    (heB : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut b))
    (hbD : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut d))
    (heD : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut d))
    (hgD : placedLabel order direction cut g ∈
      r.model.selected (placedLabel order direction cut d)) : False := by
  have hfA' := mem_placedRow_of_mem_model r order direction cut 0 f horder hfA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have haF' := mem_placedRow_of_mem_model r order direction cut f 0 horder haF
  have hgF' := mem_placedRow_of_mem_model r order direction cut f g horder hgF
  have hcF' := mem_placedRow_of_mem_model r order direction cut f c horder hcF
  have hfB' := mem_placedRow_of_mem_model r order direction cut b f horder hfB
  have heB' := mem_placedRow_of_mem_model r order direction cut b e horder heB
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  have heD' := mem_placedRow_of_mem_model r order direction cut d e horder heD
  have hgD' := mem_placedRow_of_mem_model r order direction cut d g horder hgD
  by_cases hsame : r.orientation = direction
  · have hAB := localPosition_lt_of_same hsame h0b
    have hBC := localPosition_lt_of_same hsame hbc
    have hCD := localPosition_lt_of_same hsame hcd
    have hDE := localPosition_lt_of_same hsame hde
    have hEF := localPosition_lt_of_same hsame hef
    have hFG := localPosition_lt_of_same hsame hfg
    exact false_of_four_selected_rows_in_seven_ccw_order_F_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF) (r.toCardIndex_lt hFG)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut f horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      hfA' hcA' haF' hgF' hcF' hfB' heB' hbD' heD' hgD'
  · have hBA := localPosition_lt_of_ne hsame h0b
    have hCB := localPosition_lt_of_ne hsame hbc
    have hDC := localPosition_lt_of_ne hsame hcd
    have hED := localPosition_lt_of_ne hsame hde
    have hFE := localPosition_lt_of_ne hsame hef
    have hGF := localPosition_lt_of_ne hsame hfg
    exact false_of_four_selected_rows_in_seven_ccw_order_F_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE) (r.toCardIndex_lt hGF)
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut f horder)
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut d horder)
      hfA' hcA' haF' hgF' hcF' hfB' heB' hbD' heD' hgD'

/-- Every single generated schema-F clause is true under a source-authenticated
realization. -/
theorem sourceAssign_schemaFClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ sixOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (schemaFHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, g, rfl, h0b, hbc, hcd, hde, hef, hfg⟩ :=
    sixOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_schemaF_at r order direction cut b c d e f g horder.symm
    h0b hbc hcd hde hef hfg
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut f) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut c) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut 0) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut g) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut f,
      placedLabel order direction cut c) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut f) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut e) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut b) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut e) (by simp [schemaFHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut g) (by simp [schemaFHits])

/-- Complete guarded schema-F cyclic-placement clause family. -/
def schemaFClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        sixOffsetChoices.map fun offsets =>
          nogoodClause order (schemaFHits order direction cut offsets)

/-- Every clause in the complete schema-F family is admitted by each
source-authenticated realization. -/
theorem sourceAssign_schemaFClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ schemaFClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [schemaFClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_schemaFClause r order direction cut offsets hoffsets

/-- Schema G placed at an arbitrary cyclic cut and direction. -/
def schemaGHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point d),
        (point b, point c), (point b, point f),
        (point c, point b), (point c, point d),
        (point e, point c), (point e, point f)]
  | _ => []

/-- Source-authenticated schema G is impossible at every normalized cyclic
placement.  This is the geometric semantic core behind each generated clause. -/
theorem false_of_schemaG_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hdA : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (hfB : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut b))
    (hbC : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut c))
    (hdC : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut c))
    (hcE : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut e))
    (hfE : placedLabel order direction cut f ∈
      r.model.selected (placedLabel order direction cut e)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hdA' := mem_placedRow_of_mem_model r order direction cut 0 d horder hdA
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have hfB' := mem_placedRow_of_mem_model r order direction cut b f horder hfB
  have hbC' := mem_placedRow_of_mem_model r order direction cut c b horder hbC
  have hdC' := mem_placedRow_of_mem_model r order direction cut c d horder hdC
  have hcE' := mem_placedRow_of_mem_model r order direction cut e c horder hcE
  have hfE' := mem_placedRow_of_mem_model r order direction cut e f horder hfE
  cases horientation : r.orientation <;> cases direction
  · have hAB : localPosition r.orientation .forward 0 <
        localPosition r.orientation .forward b := by
      simpa [horientation, localPosition] using h0b
    have hBC : localPosition r.orientation .forward b <
        localPosition r.orientation .forward c := by
      simpa [horientation, localPosition] using hbc
    have hCD : localPosition r.orientation .forward c <
        localPosition r.orientation .forward d := by
      simpa [horientation, localPosition] using hcd
    have hDE : localPosition r.orientation .forward d <
        localPosition r.orientation .forward e := by
      simpa [horientation, localPosition] using hde
    have hEF : localPosition r.orientation .forward e <
        localPosition r.orientation .forward f := by
      simpa [horientation, localPosition] using hef
    exact false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation .forward cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF)
      (placedRow r order .forward cut 0 horder)
      (placedRow r order .forward cut b horder)
      (placedRow r order .forward cut c horder)
      (placedRow r order .forward cut e horder)
      hbA' hdA' hcB' hfB' hbC' hdC' hcE' hfE'
  · have hBA : localPosition r.orientation .reverse b <
        localPosition r.orientation .reverse 0 := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 h0b
    have hCB : localPosition r.orientation .reverse c <
        localPosition r.orientation .reverse b := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hbc
    have hDC : localPosition r.orientation .reverse d <
        localPosition r.orientation .reverse c := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hcd
    have hED : localPosition r.orientation .reverse e <
        localPosition r.orientation .reverse d := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hde
    have hFE : localPosition r.orientation .reverse f <
        localPosition r.orientation .reverse e := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hef
    exact false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation .reverse cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE)
      (placedRow r order .reverse cut 0 horder)
      (placedRow r order .reverse cut b horder)
      (placedRow r order .reverse cut c horder)
      (placedRow r order .reverse cut e horder)
      hbA' hdA' hcB' hfB' hbC' hdC' hcE' hfE'
  · have hBA : localPosition r.orientation .forward b <
        localPosition r.orientation .forward 0 := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 h0b
    have hCB : localPosition r.orientation .forward c <
        localPosition r.orientation .forward b := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hbc
    have hDC : localPosition r.orientation .forward d <
        localPosition r.orientation .forward c := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hcd
    have hED : localPosition r.orientation .forward e <
        localPosition r.orientation .forward d := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hde
    have hFE : localPosition r.orientation .forward f <
        localPosition r.orientation .forward e := by
      simpa [horientation, localPosition] using (Fin.rev_lt_rev).2 hef
    exact false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation .forward cut))
      (r.toCardIndex_lt hBA) (r.toCardIndex_lt hCB) (r.toCardIndex_lt hDC)
      (r.toCardIndex_lt hED) (r.toCardIndex_lt hFE)
      (placedRow r order .forward cut 0 horder)
      (placedRow r order .forward cut b horder)
      (placedRow r order .forward cut c horder)
      (placedRow r order .forward cut e horder)
      hbA' hdA' hcB' hfB' hbC' hdC' hcE' hfE'
  · have hAB : localPosition r.orientation .reverse 0 <
        localPosition r.orientation .reverse b := by
      simpa [horientation, localPosition] using h0b
    have hBC : localPosition r.orientation .reverse b <
        localPosition r.orientation .reverse c := by
      simpa [horientation, localPosition] using hbc
    have hCD : localPosition r.orientation .reverse c <
        localPosition r.orientation .reverse d := by
      simpa [horientation, localPosition] using hcd
    have hDE : localPosition r.orientation .reverse d <
        localPosition r.orientation .reverse e := by
      simpa [horientation, localPosition] using hde
    have hEF : localPosition r.orientation .reverse e <
        localPosition r.orientation .reverse f := by
      simpa [horientation, localPosition] using hef
    exact false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation .reverse cut))
      (r.toCardIndex_lt hAB) (r.toCardIndex_lt hBC) (r.toCardIndex_lt hCD)
      (r.toCardIndex_lt hDE) (r.toCardIndex_lt hEF)
      (placedRow r order .reverse cut 0 horder)
      (placedRow r order .reverse cut b horder)
      (placedRow r order .reverse cut c horder)
      (placedRow r order .reverse cut e horder)
      hbA' hdA' hcB' hfB' hbC' hdC' hcE' hfE'

/-- Every single generated schema-G clause is true under a source-authenticated
realization. -/
theorem sourceAssign_schemaGClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (schemaGHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_schemaG_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut b) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut d) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut c) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut b,
      placedLabel order direction cut f) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut b) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut c,
      placedLabel order direction cut d) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut c) (by simp [schemaGHits])
  · exact hall (placedLabel order direction cut e,
      placedLabel order direction cut f) (by simp [schemaGHits])

/-- Complete guarded schema-G cyclic-placement clause family. -/
def schemaGClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        fiveOffsetChoices.map fun offsets =>
          nogoodClause order (schemaGHits order direction cut offsets)

/-- Every clause in the complete schema-G family is admitted by each
source-authenticated realization. -/
theorem sourceAssign_schemaGClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ schemaGClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [schemaGClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_schemaGClause r order direction cut offsets hoffsets

/-- Complete source-checked C--G theorem-bank clause family. -/
def cdefgClauses : Std.Sat.CNF Atom :=
  schemaCClauses ++ schemaDClauses ++ schemaEClauses ++ schemaFClauses ++
    schemaGClauses

/-- Every source realization satisfies every clause in the C--G theorem bank. -/
theorem sourceAssign_cdefgClauses {A : Finset ℝ²} (r : SourceRealization A) :
    ∀ clause ∈ cdefgClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [cdefgClauses, List.mem_append] at hclause
  rcases hclause with hclause | hG
  · rcases hclause with hclause | hF
    · rcases hclause with hclause | hE
      · rcases hclause with hC | hD
        · exact sourceAssign_schemaCClauses r clause hC
        · exact sourceAssign_schemaDClauses r clause hD
      · exact sourceAssign_schemaEClauses r clause hE
    · exact sourceAssign_schemaFClauses r clause hF
  · exact sourceAssign_schemaGClauses r clause hG

/-- Lean-authoritative exact-seventeen formula: the checked Boolean base plus
all checked cyclic placements of Kalmanson schemas C through G. -/
def extendedCnf : Std.Sat.CNF Atom := baseCnf ++ cdefgClauses

/-- Exact size of one six-point schema family over both source orders, both
directions, all seventeen cuts, and all increasing offset choices. -/
theorem schemaDClauses_length : schemaDClauses.length = 297024 := by
  simp [schemaDClauses, namedOrders, directions, labels,
    fiveOffsetChoices_length]

/-- Exact size of the other six-point schema families. -/
theorem schemaEClauses_length : schemaEClauses.length = 297024 := by
  simp [schemaEClauses, namedOrders, directions, labels,
    fiveOffsetChoices_length]

theorem schemaGClauses_length : schemaGClauses.length = 297024 := by
  simp [schemaGClauses, namedOrders, directions, labels,
    fiveOffsetChoices_length]

/-- Exact size of each seven-point schema family. -/
theorem schemaCClauses_length : schemaCClauses.length = 544544 := by
  simp [schemaCClauses, namedOrders, directions, labels,
    sixOffsetChoices_length]

theorem schemaFClauses_length : schemaFClauses.length = 544544 := by
  simp [schemaFClauses, namedOrders, directions, labels,
    sixOffsetChoices_length]

/-- Exact count of all checked C--G theorem-bank clauses. -/
theorem cdefgClauses_length : cdefgClauses.length = 1980160 := by
  simp [cdefgClauses, schemaCClauses_length, schemaDClauses_length,
    schemaEClauses_length, schemaFClauses_length, schemaGClauses_length]

/-- Exact clause count of the complete Lean-authoritative formula. -/
theorem extendedCnf_clause_count : extendedCnf.length = 2189852 := by
  simp [extendedCnf, baseCnf_clause_count, cdefgClauses_length]

/-- Gate B with the checked theorem bank: every geometric source realization
induces a satisfying assignment of the complete extended formula. -/
theorem sourceAssign_extendedCnf {A : Finset ℝ²} (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCnf, List.mem_append] at hclause
  rcases hclause with hbase | hcdefg
  · have hbaseAll := sourceAssign_baseCnf r.model
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hbaseAll
    exact hbaseAll clause hbase
  · exact sourceAssign_cdefgClauses r clause hcdefg

/-- Every geometric source realization therefore has a concrete satisfying
assignment for the complete checked exact-seventeen formula. -/
theorem SourceRealization.extendedCnf_sat {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∃ assignment, Std.Sat.CNF.eval assignment extendedCnf = true :=
  ⟨sourceAssign r.model, sourceAssign_extendedCnf r⟩

/-- Certificate-to-source landing contract.  Any checked proof that the exact
Lean-owned extended CNF is unsatisfiable rules out every source realization;
the exact-cover extractor can then consume this theorem in the unchanged
cap-nine production leaf. -/
theorem false_of_sourceRealization_of_extendedCnf_unsat {A : Finset ℝ²}
    (hsource : Nonempty (SourceRealization A))
    (hunsat :
      ¬ ∃ assignment, Std.Sat.CNF.eval assignment extendedCnf = true) :
    False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefg
end Problem97
