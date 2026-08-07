/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Phase3SharedPairSeparation
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
`Rigid221SourceHeavy` supplies the exact profile, the four rows, and the
separation hypotheses.
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
    SurplusCOMPGBank.btw
        (position order (centerLabel row₁))
        (position order (centerLabel row₂))
        (position order point₁) ↔
      ¬ SurplusCOMPGBank.btw
        (position order (centerLabel row₁))
        (position order (centerLabel row₂))
        (position order point₂)

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

/-- The boundary indices assigned to the fifteen labels respect the selected
exact-fifteen cyclic order. -/
def PositionEmbedding {n : ℕ} (order : Fin 2) (labelIndex : Fin 15 → Fin n) : Prop :=
  ∀ point₁ point₂,
    position order point₁ < position order point₂ → labelIndex point₁ < labelIndex point₂

/-- Every two encoded hits in one of the four rows lie on that row's shell. -/
def RealizesRows {n : ℕ} (boundary : Fin n → ℝ²) (labelIndex : Fin 15 → Fin n)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∀ row point₁ point₂,
    Hits rows row point₁ → Hits rows row point₂ →
      dist (boundary (labelIndex (centerLabel row))) (boundary (labelIndex point₁)) =
        dist (boundary (labelIndex (centerLabel row))) (boundary (labelIndex point₂))

attribute [local simp] and_assoc

/-- The exhaustive four-row coverage and the three Kalmanson kernels together
rule out every geometrically realized exact-fifteen assignment. -/
theorem false_of_pairwiseSeparated_realizedRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (order : Fin 2) (labelIndex : Fin 15 → Fin A.card)
    (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding order labelIndex)
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
    exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_140_250_354
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_140_250_354
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_140_250_354
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_140_250_354
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
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
    exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
      hA hboundaryInjective hboundaryImage hboundaryCcw
      (hposition 8 11 (by fin_cases order <;> decide))
      (hposition 11 10 (by fin_cases order <;> decide))
      (hposition 10 9 (by fin_cases order <;> decide))
      (hposition 9 14 (by fin_cases order <;> decide))
      (hrows 0 14 9 h014 h09) (hrows 3 14 8 h314 h38) (hrows 2 8 9 h28 h29)

end BlockerVExactFifteenFourRowCoverage
end Problem97
