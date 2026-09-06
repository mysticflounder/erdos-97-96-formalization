/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.FiniteRowCardinality
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# Exact-fifteen four-row coverage for the BlockerV residual

At carrier cardinality fifteen, the second opposite cap in the surviving
`BlockerV` residual has seven strict-interior points.  Four selected rows have
two fixed hits in this cap and hence exactly two hits among the six points
outside it.  There are only two possible cyclic orders for the seven interior
points.

This file exhausts the resulting `2 * 15^4` finite patterns.  Pairwise cyclic
separation of shared row pairs forces one of sixteen three-row metric motifs.
The theorem is deliberately stated independently of the geometric ingress;
`Rigid221SourceHeavy` supplies the exact profile, cyclic position embedding,
and four realized rows.  Pairwise separation is derived here from those data.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace BlockerVExactFifteenFourRowCoverage

/-- One row's two support points outside the nine-point long cap. -/
abbrev OutsidePair := {s : Finset (Fin 6) // s.card = 2}

/-- Labels of the six points outside the long cap in the exact-fifteen model. -/
def outsideLabel (i : Fin 6) : Fin 15 :=
  match i.1 with
  | 0 => 1
  | 1 => 3
  | 2 => 4
  | 3 => 5
  | 4 => 13
  | _ => 14

/-- The four row centers, in the order `v`, `xv`, `deleted`, `c`. -/
def centerLabel (row : Fin 4) : Fin 15 :=
  match row.1 with
  | 0 => 8
  | 1 => 9
  | 2 => 10
  | _ => 11

/-- First fixed long-cap hit of each row. -/
def fixedHit₁ (row : Fin 4) : Fin 15 :=
  match row.1 with
  | 0 => 6
  | 1 => 6
  | 2 => 8
  | _ => 8

/-- Second fixed long-cap hit of each row. -/
def fixedHit₂ (row : Fin 4) : Fin 15 :=
  match row.1 with
  | 0 => 9
  | 1 => 7
  | 2 => 9
  | _ => 10

/-- Whether a label belongs to the nine-point long cap.  Equivalently, it is
not one of the six labels enumerated by `outsideLabel`. -/
def longLabelBool (point : Fin 15) : Bool :=
  !(outsideLabel 0 == point || outsideLabel 1 == point ||
    outsideLabel 2 == point || outsideLabel 3 == point ||
    outsideLabel 4 == point || outsideLabel 5 == point)

/-- The outside labels selected by one actual row-membership predicate. -/
def outsideHits (membership : Fin 15 → Bool) : Finset (Fin 6) :=
  Finset.univ.filter fun i => membership (outsideLabel i)

/-- A four-element row containing its two fixed long-cap hits and at most two
long-cap labels has exactly two outside labels.  Keeping this finite
normalization in the certificate bank means the geometric ingress never has
to choose or order the two anonymous outside points. -/
theorem outsideHits_card_eq_two
    (membership : Fin 15 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2) :
    (outsideHits membership).card = 2 := by
  let support : Finset (Fin 15) := Finset.univ.filter fun p ↦ membership p
  let cap : Finset (Fin 15) := Finset.univ.filter fun p ↦ longLabelBool p
  have hinter : support ∩ cap =
      Finset.univ.filter (fun p ↦ membership p && longLabelBool p) := by
    ext p
    simp [support, cap, Bool.and_eq_true]
  have hcap : (support ∩ cap).card ≤ 2 := by
    rw [hinter]
    exact hlong
  have hcap₁ : ∀ r : Fin 4, longLabelBool (fixedHit₁ r) = true := by decide
  have hcap₂ : ∀ r : Fin 4, longLabelBool (fixedHit₂ r) = true := by decide
  have hdistinct : ∀ r : Fin 4, fixedHit₁ r ≠ fixedHit₂ r := by decide
  have houtside : (support \ cap).card = 2 :=
    FiniteRowCardinality.outsideSlice_card_eq_two support cap (fixedHit₁ row) (fixedHit₂ row)
      htotal hcap (by simp [support, cap, hfixed₁, hcap₁])
      (by simp [support, cap, hfixed₂, hcap₂]) (hdistinct row)
  have hinj : Function.Injective outsideLabel := by decide
  have hlabel : ∀ i, longLabelBool (outsideLabel i) = false := by decide
  have hcover : ∀ p : Fin 15,
      longLabelBool p = false ↔ ∃ i, outsideLabel i = p := by decide
  have himage : (outsideHits membership).image outsideLabel = support \ cap := by
    ext p
    simp only [Finset.mem_image, outsideHits, Finset.mem_filter, Finset.mem_univ,
      true_and, Finset.mem_sdiff, support, cap]
    constructor
    · rintro ⟨i, hi, rfl⟩
      exact ⟨hi, by simp [hlabel i]⟩
    · rintro ⟨hm, hc⟩
      have hfalse : longLabelBool p = false := by simpa using hc
      obtain ⟨i, rfl⟩ := (hcover p).mp hfalse
      exact ⟨i, hm, rfl⟩
  rw [← himage, Finset.card_image_of_injective _ hinj] at houtside
  exact houtside

/-- The normalized outside pair attached to one actual four-point row. -/
def outsidePairOfMembership
    (membership : Fin 15 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2) : OutsidePair :=
  ⟨outsideHits membership,
    outsideHits_card_eq_two membership row htotal hfixed₁ hfixed₂ hlong⟩

/-- Computable membership in the selected four-row determined by its outside pair. -/
def hitsBool (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 15) : Bool :=
  point == fixedHit₁ row || point == fixedHit₂ row ||
    (decide ((0 : Fin 6) ∈ (rows row).1) && outsideLabel 0 == point) ||
    (decide ((1 : Fin 6) ∈ (rows row).1) && outsideLabel 1 == point) ||
    (decide ((2 : Fin 6) ∈ (rows row).1) && outsideLabel 2 == point) ||
    (decide ((3 : Fin 6) ∈ (rows row).1) && outsideLabel 3 == point) ||
    (decide ((4 : Fin 6) ∈ (rows row).1) && outsideLabel 4 == point) ||
    (decide ((5 : Fin 6) ∈ (rows row).1) && outsideLabel 5 == point)

/-- Membership in the selected four-row determined by its outside pair. -/
def Hits (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 15) : Prop :=
  hitsBool rows row point = true

instance (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 15) :
    Decidable (Hits rows row point) := by
  unfold Hits
  infer_instance

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Every encoded hit of a normalized row is an actual hit of the original
membership predicate. -/
theorem membership_of_hits_outsidePairOfMembership
    (rows : Fin 4 → OutsidePair) (membership : Fin 15 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2)
    (hrow : rows row =
      outsidePairOfMembership membership row htotal hfixed₁ hfixed₂ hlong)
    (point : Fin 15) :
    hitsBool rows row point = true →
      membership point = true := by
  intro hhit
  simp only [hitsBool, Bool.or_eq_true, or_assoc] at hhit
  rcases hhit with hhit | hhit | hhit | hhit | hhit | hhit | hhit | hhit
  · have heq : point = fixedHit₁ row := by
      simpa only [beq_iff_eq] using hhit
    rw [heq]
    exact hfixed₁
  · have heq : point = fixedHit₂ row := by
      simpa only [beq_iff_eq] using hhit
    rw [heq]
    exact hfixed₂
  all_goals
    simp only [hrow, outsidePairOfMembership, outsideHits,
      Bool.and_eq_true, decide_eq_true_eq, Finset.mem_filter,
      Finset.mem_univ, true_and, beq_iff_eq] at hhit
    rcases hhit with ⟨hmem, heq⟩
    rw [← heq]
    exact hmem

/-- Position of a point in either of the two source-forced cyclic orders. -/
def position (order : Fin 2) (point : Fin 15) : Fin 15 :=
  if order = 0 then
    match point.1 with
    | 0 => 0
    | 1 => 12
    | 2 => 8
    | 3 => 9
    | 4 => 10
    | 5 => 11
    | 6 => 1
    | 7 => 7
    | 8 => 2
    | 9 => 5
    | 10 => 4
    | 11 => 3
    | 12 => 6
    | 13 => 13
    | _ => 14
  else
    match point.1 with
    | 0 => 0
    | 1 => 12
    | 2 => 8
    | 3 => 9
    | 4 => 10
    | 5 => 11
    | 6 => 1
    | 7 => 7
    | 8 => 2
    | 9 => 6
    | 10 => 4
    | 11 => 3
    | 12 => 5
    | 13 => 13
    | _ => 14

/-- Every pair shared by two rows separates their two centers cyclically. -/
def PairwiseSeparated (order : Fin 2) (rows : Fin 4 → OutsidePair) : Prop :=
  ∀ row₁ row₂ point₁ point₂,
    row₁.1 < row₂.1 → point₁.1 < point₂.1 →
    Hits rows row₁ point₁ → Hits rows row₁ point₂ →
    Hits rows row₂ point₁ → Hits rows row₂ point₂ →
    (SurplusCOMPGBank.btw
        (position order (centerLabel row₁))
        (position order (centerLabel row₂))
        (position order point₁) ↔
      ¬ SurplusCOMPGBank.btw
        (position order (centerLabel row₁))
        (position order (centerLabel row₂))
        (position order point₂))

instance (order : Fin 2) (rows : Fin 4 → OutsidePair) :
    Decidable (PairwiseSeparated order rows) := by
  unfold PairwiseSeparated
  infer_instance

/-- One pair hit in one of the four rows. -/
structure PairHit where
  row : Fin 4
  point₁ : Fin 15
  point₂ : Fin 15
deriving DecidableEq, Repr

private def pairHit (row point₁ point₂ : Nat)
    (hrow : row < 4 := by omega)
    (hpoint₁ : point₁ < 15 := by omega)
    (hpoint₂ : point₂ < 15 := by omega) : PairHit :=
  ⟨⟨row, hrow⟩, ⟨point₁, hpoint₁⟩, ⟨point₂, hpoint₂⟩⟩

/-- The sixteen concrete metric motifs covering the finite four-row search. -/
def motif (index : Fin 16) : List PairHit :=
  match index.1 with
  | 0 => [pairHit 3 3 8, pairHit 2 1 8, pairHit 1 1 3]
  | 1 => [pairHit 3 4 8, pairHit 2 1 8, pairHit 1 1 4]
  | 2 => [pairHit 3 5 8, pairHit 2 1 8, pairHit 1 1 5]
  | 3 => [pairHit 3 5 8, pairHit 2 8 14, pairHit 1 5 14]
  | 4 => [pairHit 0 1 9, pairHit 3 1 8, pairHit 2 8 9]
  | 5 => [pairHit 0 3 9, pairHit 3 3 8, pairHit 2 8 9]
  | 6 => [pairHit 0 4 9, pairHit 3 4 8, pairHit 2 8 9]
  | 7 => [pairHit 0 5 9, pairHit 3 5 8, pairHit 2 8 9]
  | 8 => [pairHit 0 6 9, pairHit 2 1 9, pairHit 1 1 6]
  | 9 => [pairHit 0 6 9, pairHit 2 3 9, pairHit 1 3 6]
  | 10 => [pairHit 0 6 9, pairHit 2 4 9, pairHit 1 4 6]
  | 11 => [pairHit 0 6 9, pairHit 2 5 9, pairHit 1 5 6]
  | 12 => [pairHit 0 6 9, pairHit 2 9 13, pairHit 1 6 13]
  | 13 => [pairHit 0 6 9, pairHit 2 9 14, pairHit 1 6 14]
  | 14 => [pairHit 0 9 13, pairHit 3 8 13, pairHit 2 8 9]
  | _ => [pairHit 0 9 14, pairHit 3 8 14, pairHit 2 8 9]

/-- All three pair hits of a metric motif occur in the selected rows. -/
def MotifOccurs (rows : Fin 4 → OutsidePair) (index : Fin 16) : Prop :=
  (motif index).all fun hit =>
    hitsBool rows hit.row hit.point₁ && hitsBool rows hit.row hit.point₂

instance (rows : Fin 4 → OutsidePair) (index : Fin 16) :
    Decidable (MotifOccurs rows index) := by
  unfold MotifOccurs
  infer_instance

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Native evaluation exhausts the `2 * 15^4` finite assignment space.
/-- Exhaustive `2 * 15^4` coverage of the exact-fifteen four-row core. -/
theorem exists_metricMotif_of_pairwiseSeparated :
    ∀ (order : Fin 2) (rows : Fin 4 → OutsidePair),
      PairwiseSeparated order rows → ∃ index : Fin 16, MotifOccurs rows index := by
  native_decide

/-- The two possible orientations in which the named exact-fifteen order can
sit in a fixed CCW boundary enumeration. -/
inductive Orientation where
  | forward
  | reverse
deriving DecidableEq

/-- Strict comparison of boundary indices in the selected orientation. -/
def OrientedLt {n : ℕ} (orientation : Orientation)
    (labelIndex : Fin 15 → Fin n) (point₁ point₂ : Fin 15) : Prop :=
  match orientation with
  | .forward => labelIndex point₁ < labelIndex point₂
  | .reverse => labelIndex point₂ < labelIndex point₁

/-- The boundary indices assigned to the fifteen labels respect the selected
exact-fifteen cyclic order, in either global orientation. -/
def PositionEmbedding {n : ℕ} (orientation : Orientation) (order : Fin 2)
    (labelIndex : Fin 15 → Fin n) : Prop :=
  ∀ point₁ point₂,
    position order point₁ < position order point₂ →
      OrientedLt orientation labelIndex point₁ point₂

/-- Every two encoded hits in one of the four rows lie on that row's shell. -/
def RealizesRows {n : ℕ} (boundary : Fin n → ℝ²) (labelIndex : Fin 15 → Fin n)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∀ row point₁ point₂,
    Hits rows row point₁ → Hits rows row point₂ →
      dist (boundary (labelIndex (centerLabel row))) (boundary (labelIndex point₁)) =
        dist (boundary (labelIndex (centerLabel row))) (boundary (labelIndex point₂))

/-- Each of the two encoded exact-fifteen orders is a permutation of the labels. -/
theorem position_injective (order : Fin 2) :
    Function.Injective (position order) := by
  fin_cases order <;> decide

/-- An order-preserving exact-fifteen label map is injective. -/
theorem labelIndex_injective_of_positionEmbedding {n : ℕ}
    (orientation : Orientation) (order : Fin 2)
    (labelIndex : Fin 15 → Fin n)
    (hposition : PositionEmbedding orientation order labelIndex) :
    Function.Injective labelIndex := by
  intro point₁ point₂ heq
  by_contra hne
  have hposne : position order point₁ ≠ position order point₂ := by
    intro h
    exact hne (position_injective order h)
  rcases lt_or_gt_of_ne hposne with hlt | hgt
  · cases orientation with
    | forward => exact (ne_of_lt (hposition point₁ point₂ hlt)) heq
    | reverse => exact (ne_of_gt (hposition point₁ point₂ hlt)) heq
  · cases orientation with
    | forward => exact (ne_of_gt (hposition point₂ point₁ hgt)) heq
    | reverse => exact (ne_of_lt (hposition point₂ point₁ hgt)) heq

/-- `PositionEmbedding` reflects as well as preserves oriented comparisons
between labels. -/
theorem position_lt_iff_orientedLt {n : ℕ} (orientation : Orientation)
    (order : Fin 2)
    (labelIndex : Fin 15 → Fin n)
    (hposition : PositionEmbedding orientation order labelIndex)
    (point₁ point₂ : Fin 15) :
    position order point₁ < position order point₂ ↔
      OrientedLt orientation labelIndex point₁ point₂ := by
  constructor
  · exact hposition point₁ point₂
  · intro horiented
    rcases lt_trichotomy (position order point₁) (position order point₂) with h | h | h
    · exact h
    · have heq := position_injective order h
      subst point₂
      cases orientation <;> exact (lt_irrefl _ horiented).elim
    · have hreverse := hposition point₂ point₁ h
      cases orientation with
      | forward =>
          exact (not_lt_of_ge (le_of_lt hreverse) horiented).elim
      | reverse =>
          exact (not_lt_of_ge (le_of_lt horiented) hreverse).elim

/-- Pairwise separation is not an additional source-side ingress obligation:
it follows from a realized row system in an injective CCW boundary embedding. -/
theorem pairwiseSeparated_of_positionEmbedding_realizesRows
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (labelIndex : Fin 15 → Fin n)
    (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order labelIndex)
    (hrows : RealizesRows boundary labelIndex rows) :
    PairwiseSeparated order rows := by
  intro row₁ row₂ point₁ point₂ hrow hpoint hp11 hp12 hp21 hp22
  have hlabelInjective :=
    labelIndex_injective_of_positionEmbedding orientation order labelIndex hposition
  have hcenters : centerLabel row₁ ≠ centerLabel row₂ := by
    fin_cases row₁ <;> fin_cases row₂ <;> simp_all [centerLabel]
  have hpoint₂_ne_center₁ : point₂ ≠ centerLabel row₁ := by
    intro heq
    subst point₂
    fin_cases row₁ <;> simp [Hits, hitsBool, fixedHit₁, fixedHit₂,
      centerLabel, outsideLabel] at hp12
  have hpoint₂_ne_center₂ : point₂ ≠ centerLabel row₂ := by
    intro heq
    subst point₂
    fin_cases row₂ <;> simp [Hits, hitsBool, fixedHit₁, fixedHit₂,
      centerLabel, outsideLabel] at hp22
  have hfirst :
      dist (boundary (labelIndex point₁))
          (boundary (labelIndex (centerLabel row₁))) =
        dist (boundary (labelIndex point₂))
          (boundary (labelIndex (centerLabel row₁))) := by
    simpa only [dist_comm] using hrows row₁ point₁ point₂ hp11 hp12
  have hsecond :
      dist (boundary (labelIndex point₁))
          (boundary (labelIndex (centerLabel row₂))) =
        dist (boundary (labelIndex point₂))
          (boundary (labelIndex (centerLabel row₂))) := by
    simpa only [dist_comm] using hrows row₂ point₁ point₂ hp21 hp22
  have hsep := SurplusCOMPGBank.btw_sep hboundaryCcw hboundaryInjective
    (hlabelInjective.ne hcenters)
    (hlabelInjective.ne hpoint₂_ne_center₁)
    (hlabelInjective.ne hpoint₂_ne_center₂)
    hfirst hsecond
    (hboundaryInjective.ne (hlabelInjective.ne (ne_of_lt hpoint)))
  have hbtw (x y z : Fin 15) :
      SurplusCOMPGBank.btw
          (position order x) (position order y) (position order z) ↔
        SurplusCOMPGBank.btw
          (labelIndex x) (labelIndex y) (labelIndex z) := by
    unfold SurplusCOMPGBank.btw
    rw [position_lt_iff_orientedLt orientation order labelIndex hposition x z,
      position_lt_iff_orientedLt orientation order labelIndex hposition z y,
      position_lt_iff_orientedLt orientation order labelIndex hposition y z,
      position_lt_iff_orientedLt orientation order labelIndex hposition z x]
    cases orientation <;> simp only [OrientedLt, and_comm, or_comm]
  rw [hbtw, hbtw]
  exact hsep

attribute [local simp] and_assoc

/-- Orientation-neutral consumer for the six-point motif.  In the reverse
branch the same six points are supplied to the reflected Kalmanson kernel in
the opposite order. -/
private theorem false_of_oriented_six_shell_equalities
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 15 → Fin A.card)
    {p0 p1 p2 p3 p4 p5 : Fin 15}
    (h01 : OrientedLt orientation labelIndex p0 p1)
    (h12 : OrientedLt orientation labelIndex p1 p2)
    (h23 : OrientedLt orientation labelIndex p2 p3)
    (h34 : OrientedLt orientation labelIndex p3 p4)
    (h45 : OrientedLt orientation labelIndex p4 p5)
    (h140 : dist (boundary (labelIndex p1)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p1)) (boundary (labelIndex p0)))
    (h250 : dist (boundary (labelIndex p2)) (boundary (labelIndex p5)) =
      dist (boundary (labelIndex p2)) (boundary (labelIndex p0)))
    (h354 : dist (boundary (labelIndex p3)) (boundary (labelIndex p5)) =
      dist (boundary (labelIndex p3)) (boundary (labelIndex p4))) :
    False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_140_250_354
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h01 h12 h23 h34 h45 h140 h250 h354
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_415_305_201
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h45 h34 h23 h12 h01 h140 h250 h354

/-- Orientation-neutral consumer for the `043/140/203` five-point motif. -/
private theorem false_of_oriented_five_shell_equalities_B
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 15 → Fin A.card)
    {p0 p1 p2 p3 p4 : Fin 15}
    (h01 : OrientedLt orientation labelIndex p0 p1)
    (h12 : OrientedLt orientation labelIndex p1 p2)
    (h23 : OrientedLt orientation labelIndex p2 p3)
    (h34 : OrientedLt orientation labelIndex p3 p4)
    (h043 : dist (boundary (labelIndex p0)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p0)) (boundary (labelIndex p3)))
    (h140 : dist (boundary (labelIndex p1)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p1)) (boundary (labelIndex p0)))
    (h203 : dist (boundary (labelIndex p2)) (boundary (labelIndex p0)) =
      dist (boundary (labelIndex p2)) (boundary (labelIndex p3))) :
    False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h01 h12 h23 h34 h043 h140 h203
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_410_304_241
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h34 h23 h12 h01 h043.symm h140 h203

/-- Orientation-neutral consumer for the `103/243/340` five-point motif. -/
private theorem false_of_oriented_five_shell_equalities_C
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 15 → Fin A.card)
    {p0 p1 p2 p3 p4 : Fin 15}
    (h01 : OrientedLt orientation labelIndex p0 p1)
    (h12 : OrientedLt orientation labelIndex p1 p2)
    (h23 : OrientedLt orientation labelIndex p2 p3)
    (h34 : OrientedLt orientation labelIndex p3 p4)
    (h103 : dist (boundary (labelIndex p1)) (boundary (labelIndex p0)) =
      dist (boundary (labelIndex p1)) (boundary (labelIndex p3)))
    (h243 : dist (boundary (labelIndex p2)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p2)) (boundary (labelIndex p3)))
    (h340 : dist (boundary (labelIndex p3)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p3)) (boundary (labelIndex p0))) :
    False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h01 h12 h23 h34 h103 h243 h340
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_341_201_104
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h34 h23 h12 h01 h103 h243 h340

/-- The exhaustive four-row coverage and the three Kalmanson kernels together
rule out every geometrically realized exact-fifteen assignment. -/
theorem false_of_pairwiseSeparated_realizedRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (labelIndex : Fin 15 → Fin A.card)
    (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order labelIndex)
    (hrows : RealizesRows boundary labelIndex rows)
    (hseparated : PairwiseSeparated order rows) :
    False := by
  obtain ⟨motifIndex, hmotif⟩ :=
    exists_metricMotif_of_pairwiseSeparated order rows hseparated
  fin_cases motifIndex
  · have hm :
        Hits rows 3 3 ∧ Hits rows 3 8 ∧ Hits rows 2 1 ∧
          Hits rows 2 8 ∧ Hits rows 1 1 ∧ Hits rows 1 3 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h33, h38, h21, h28, h11, h13⟩
    exact false_of_oriented_six_shell_equalities
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 3 (by fin_cases order <;> decide))
      (hposition 3 1 (by fin_cases order <;> decide))
      (hrows 3 3 8 h33 h38) (hrows 2 1 8 h21 h28) (hrows 1 1 3 h11 h13)
  · have hm :
        Hits rows 3 4 ∧ Hits rows 3 8 ∧ Hits rows 2 1 ∧
          Hits rows 2 8 ∧ Hits rows 1 1 ∧ Hits rows 1 4 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h34, h38, h21, h28, h11, h14⟩
    exact false_of_oriented_six_shell_equalities
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 4 (by fin_cases order <;> decide))
      (hposition 4 1 (by fin_cases order <;> decide))
      (hrows 3 4 8 h34 h38) (hrows 2 1 8 h21 h28) (hrows 1 1 4 h11 h14)
  · have hm :
        Hits rows 3 5 ∧ Hits rows 3 8 ∧ Hits rows 2 1 ∧
          Hits rows 2 8 ∧ Hits rows 1 1 ∧ Hits rows 1 5 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h35, h38, h21, h28, h11, h15⟩
    exact false_of_oriented_six_shell_equalities
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 5 (by fin_cases order <;> decide))
      (hposition 5 1 (by fin_cases order <;> decide))
      (hrows 3 5 8 h35 h38) (hrows 2 1 8 h21 h28) (hrows 1 1 5 h11 h15)
  · have hm :
        Hits rows 3 5 ∧ Hits rows 3 8 ∧ Hits rows 2 8 ∧
          Hits rows 2 14 ∧ Hits rows 1 5 ∧ Hits rows 1 14 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h35, h38, h28, h214, h15, h114⟩
    exact false_of_oriented_six_shell_equalities
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 5 (by fin_cases order <;> decide))
      (hposition 5 14 (by fin_cases order <;> decide))
      (hrows 3 5 8 h35 h38) (hrows 2 14 8 h214 h28) (hrows 1 14 5 h114 h15)
  · have hm :
        Hits rows 0 1 ∧ Hits rows 0 9 ∧ Hits rows 3 1 ∧
          Hits rows 3 8 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h01, h09, h31, h38, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 1 (by fin_cases order <;> decide))
      (hrows 0 1 9 h01 h09) (hrows 3 1 8 h31 h38) (hrows 2 8 9 h28 h29)
  · have hm :
        Hits rows 0 3 ∧ Hits rows 0 9 ∧ Hits rows 3 3 ∧
          Hits rows 3 8 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h03, h09, h33, h38, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 3 (by fin_cases order <;> decide))
      (hrows 0 3 9 h03 h09) (hrows 3 3 8 h33 h38) (hrows 2 8 9 h28 h29)
  · have hm :
        Hits rows 0 4 ∧ Hits rows 0 9 ∧ Hits rows 3 4 ∧
          Hits rows 3 8 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h04, h09, h34, h38, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 4 (by fin_cases order <;> decide))
      (hrows 0 4 9 h04 h09) (hrows 3 4 8 h34 h38) (hrows 2 8 9 h28 h29)
  · have hm :
        Hits rows 0 5 ∧ Hits rows 0 9 ∧ Hits rows 3 5 ∧
          Hits rows 3 8 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h05, h09, h35, h38, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 5 (by fin_cases order <;> decide))
      (hrows 0 5 9 h05 h09) (hrows 3 5 8 h35 h38) (hrows 2 8 9 h28 h29)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 1 ∧
          Hits rows 2 9 ∧ Hits rows 1 1 ∧ Hits rows 1 6 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h21, h29, h11, h16⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 1 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 1 9 h21 h29) (hrows 1 1 6 h11 h16)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 3 ∧
          Hits rows 2 9 ∧ Hits rows 1 3 ∧ Hits rows 1 6 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h23, h29, h13, h16⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 3 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 3 9 h23 h29) (hrows 1 3 6 h13 h16)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 4 ∧
          Hits rows 2 9 ∧ Hits rows 1 4 ∧ Hits rows 1 6 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h24, h29, h14, h16⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 4 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 4 9 h24 h29) (hrows 1 4 6 h14 h16)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 5 ∧
          Hits rows 2 9 ∧ Hits rows 1 5 ∧ Hits rows 1 6 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h25, h29, h15, h16⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 5 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 5 9 h25 h29) (hrows 1 5 6 h15 h16)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 9 ∧
          Hits rows 2 13 ∧ Hits rows 1 6 ∧ Hits rows 1 13 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h29, h213, h16, h113⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 13 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 13 9 h213 h29) (hrows 1 13 6 h113 h16)
  · have hm :
        Hits rows 0 6 ∧ Hits rows 0 9 ∧ Hits rows 2 9 ∧
          Hits rows 2 14 ∧ Hits rows 1 6 ∧ Hits rows 1 14 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h06, h09, h29, h214, h16, h114⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 6 8 (by fin_cases order <;> decide))
      (hposition 8 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 14 (by fin_cases order <;> decide))
      (hrows 0 6 9 h06 h09) (hrows 2 14 9 h214 h29) (hrows 1 14 6 h114 h16)
  · have hm :
        Hits rows 0 9 ∧ Hits rows 0 13 ∧ Hits rows 3 8 ∧
          Hits rows 3 13 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h09, h013, h38, h313, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 13 (by fin_cases order <;> decide))
      (hrows 0 13 9 h013 h09) (hrows 3 13 8 h313 h38) (hrows 2 8 9 h28 h29)
  · have hm :
        Hits rows 0 9 ∧ Hits rows 0 14 ∧ Hits rows 3 8 ∧
          Hits rows 3 14 ∧ Hits rows 2 8 ∧ Hits rows 2 9 := by
      simpa [MotifOccurs, motif, pairHit, Hits, Bool.and_eq_true] using hmotif
    rcases hm with ⟨h09, h014, h38, h314, h28, h29⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 14 (by fin_cases order <;> decide))
      (hrows 0 14 9 h014 h09) (hrows 3 14 8 h314 h38) (hrows 2 8 9 h28 h29)

/-- Consumer-facing form of the exact-fifteen obstruction.  The source adapter
only has to realize the two possible cyclic orders and the four shell rows;
pairwise separation is a consequence of convex boundary geometry. -/
theorem false_of_positionEmbedding_realizedRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (labelIndex : Fin 15 → Fin A.card)
    (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order labelIndex)
    (hrows : RealizesRows boundary labelIndex rows) :
    False := by
  exact false_of_pairwiseSeparated_realizedRows hA hboundaryInjective
    hboundaryImage hboundaryCcw orientation order labelIndex rows hposition hrows
    (pairwiseSeparated_of_positionEmbedding_realizesRows
      hboundaryInjective hboundaryCcw orientation order labelIndex rows hposition hrows)

/-- Geometric ingress in terms of the four actual row-membership predicates.
The finite bank normalizes the two anonymous outside hits of every row and
then invokes `false_of_positionEmbedding_realizedRows`. -/
theorem false_of_positionEmbedding_membershipRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2)
    (labelIndex : Fin 15 → Fin A.card)
    (membership : Fin 4 → Fin 15 → Bool)
    (hposition : PositionEmbedding orientation order labelIndex)
    (htotal : ∀ row,
      (Finset.univ.filter fun point => membership row point).card = 4)
    (hfixed₁ : ∀ row, membership row (fixedHit₁ row) = true)
    (hfixed₂ : ∀ row, membership row (fixedHit₂ row) = true)
    (hlong : ∀ row,
      (Finset.univ.filter fun point =>
        membership row point && longLabelBool point).card ≤ 2)
    (hshell : ∀ row point₁ point₂,
      membership row point₁ = true → membership row point₂ = true →
        dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₁)) =
          dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₂))) :
    False := by
  let rows : Fin 4 → OutsidePair := fun row =>
    outsidePairOfMembership (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row)
  apply false_of_positionEmbedding_realizedRows hA hboundaryInjective
    hboundaryImage hboundaryCcw orientation order labelIndex rows hposition
  intro row point₁ point₂ hhit₁ hhit₂
  apply hshell row point₁ point₂
  · exact membership_of_hits_outsidePairOfMembership rows (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row) (by rfl)
      point₁ hhit₁
  · exact membership_of_hits_outsidePairOfMembership rows (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row) (by rfl)
      point₂ hhit₂

end BlockerVExactFifteenFourRowCoverage
end Problem97
