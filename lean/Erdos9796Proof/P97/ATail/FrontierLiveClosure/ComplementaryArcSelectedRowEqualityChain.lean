/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Complementary-arc selected-row equality chains

This module records the source-native equality-path interface for the
complementary-arc obstruction.  A row witness carries only two selected
memberships, and a path is a list of such row steps together with harmless
edge reversals.  The terminal uses one strict complementary Kalmanson form.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ComplementaryArcSelectedRowEqualityChain

open Census554.EqualityCore
open CapCrossingKalmansonBridge

/-- Two memberships in one selected four-class give one equality of distances. -/
structure SelectedRowEqualityWitness
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²) where
  center : Fin n
  first : Fin n
  second : Fin n
  row : SelectedFourClass A (boundary center)
  first_mem : boundary first ∈ row.support
  second_mem : boundary second ∈ row.support

def SelectedRowEqualityWitness.leftEdge
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    (w : SelectedRowEqualityWitness (A := A) boundary) : Edge (Fin n) :=
  (w.center, w.first)

def SelectedRowEqualityWitness.rightEdge
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    (w : SelectedRowEqualityWitness (A := A) boundary) : Edge (Fin n) :=
  (w.center, w.second)

/-- A composable list of selected-row steps and edge reversals. -/
inductive PathStep
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²) where
  | row (w : SelectedRowEqualityWitness (A := A) boundary)
  | flip (first second : Fin n)

def PathStep.source
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    : PathStep (A := A) boundary → Edge (Fin n)
  | .row w => w.leftEdge
  | .flip first second => (first, second)

def PathStep.target
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    : PathStep (A := A) boundary → Edge (Fin n)
  | .row w => w.rightEdge
  | .flip first second => (second, first)

/-- The first edge, each step source, and the final edge form a path. -/
def PathData
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²) :
    Edge (Fin n) → List (PathStep (A := A) boundary) → Edge (Fin n) → Prop
  | first, [], last => first = last
  | first, step :: steps, last =>
      first = step.source ∧ PathData boundary step.target steps last

theorem edgeDist_eq_of_selectedRowEqualityWitness
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    (w : SelectedRowEqualityWitness (A := A) boundary) :
    edgeDist boundary w.leftEdge = edgeDist boundary w.rightEdge := by
  change dist (boundary w.center) (boundary w.first) =
    dist (boundary w.center) (boundary w.second)
  exact (w.row.support_eq_radius _ w.first_mem).trans
    (w.row.support_eq_radius _ w.second_mem).symm

theorem edgeDist_eq_of_selectedRowPathStep
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    (step : PathStep (A := A) boundary) :
    edgeDist boundary step.source = edgeDist boundary step.target := by
  cases step with
  | row w => exact edgeDist_eq_of_selectedRowEqualityWitness w
  | flip first second => simp [PathStep.source, PathStep.target, edgeDist, dist_comm]

theorem edgeDist_eq_of_selectedRowPath
    {A : Finset ℝ²} {n : ℕ} {boundary : Fin n → ℝ²}
    {first last : Edge (Fin n)}
    {steps : List (PathStep (A := A) boundary)}
    (hpath : PathData boundary first steps last) :
    edgeDist boundary first = edgeDist boundary last := by
  induction steps generalizing first with
  | nil =>
      simpa [PathData] using congrArg (edgeDist boundary) hpath
  | cons step steps ih =>
      simp only [PathData] at hpath
      rcases hpath with ⟨hsource, htail⟩
      subst first
      exact (edgeDist_eq_of_selectedRowPathStep step).trans (ih htail)

/-- The complementary-arc chain collapses one strict Kalmanson inequality. -/
theorem false_of_complementaryArc_selectedRowEqualityChain
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d : Fin n} (hab : a < b) (hbc : b < c) (hcd : c < d)
    {steps_ac : List (PathStep (A := A) boundary)}
    {steps_ab : List (PathStep (A := A) boundary)}
    (hpath_ac : PathData boundary (a, c) steps_ac (c, d))
    (hpath_ab : PathData boundary (a, b) steps_ab (b, d)) :
    False := by
  have hacd : edgeDist boundary (a, c) = edgeDist boundary (c, d) :=
    edgeDist_eq_of_selectedRowPath hpath_ac
  have habd : edgeDist boundary (a, b) = edgeDist boundary (b, d) :=
    edgeDist_eq_of_selectedRowPath hpath_ab
  have hK := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hboundaryInjective hboundaryImage hboundaryCcw hab hbc hcd
  change dist (boundary a) (boundary b) + dist (boundary c) (boundary d) <
    dist (boundary a) (boundary c) + dist (boundary b) (boundary d) at hK
  change dist (boundary a) (boundary c) = dist (boundary c) (boundary d) at hacd
  change dist (boundary a) (boundary b) = dist (boundary b) (boundary d) at habd
  linarith

/- The two `Fin 10` wrappers used by the exact structural replay. -/

theorem false_of_complementaryArc_selectedRowEqualityChain_fin10_r2
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 10 → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (rows : ∀ i : Fin 10, SelectedFourClass A (boundary i))
    (h1_0 : boundary 0 ∈ (rows 1).support)
    (h1_3 : boundary 3 ∈ (rows 1).support)
    (h0_2 : boundary 2 ∈ (rows 0).support)
    (h0_9 : boundary 9 ∈ (rows 0).support)
    (h9_8 : boundary 8 ∈ (rows 9).support)
    (h9_0 : boundary 0 ∈ (rows 9).support)
    (h8_9 : boundary 9 ∈ (rows 8).support)
    (h8_7 : boundary 7 ∈ (rows 8).support)
    (h7_8 : boundary 8 ∈ (rows 7).support)
    (h7_6 : boundary 6 ∈ (rows 7).support)
    (h6_7 : boundary 7 ∈ (rows 6).support)
    (h6_5 : boundary 5 ∈ (rows 6).support)
    (h5_6 : boundary 6 ∈ (rows 5).support)
    (h5_4 : boundary 4 ∈ (rows 5).support)
    (h4_5 : boundary 5 ∈ (rows 4).support)
    (h4_3 : boundary 3 ∈ (rows 4).support)
    (h3_4 : boundary 4 ∈ (rows 3).support)
    (h3_2 : boundary 2 ∈ (rows 3).support) :
    False := by
  let w0 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 0, first := 2, second := 9, row := rows 0
      first_mem := h0_2, second_mem := h0_9 }
  let w9 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 9, first := 0, second := 8, row := rows 9
      first_mem := h9_0, second_mem := h9_8 }
  let w8 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 8, first := 9, second := 7, row := rows 8
      first_mem := h8_9, second_mem := h8_7 }
  let w7 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 7, first := 8, second := 6, row := rows 7
      first_mem := h7_8, second_mem := h7_6 }
  let w6 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 6, first := 7, second := 5, row := rows 6
      first_mem := h6_7, second_mem := h6_5 }
  let w5 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 5, first := 6, second := 4, row := rows 5
      first_mem := h5_6, second_mem := h5_4 }
  let w4 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 4, first := 5, second := 3, row := rows 4
      first_mem := h4_5, second_mem := h4_3 }
  let w3 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 3, first := 4, second := 2, row := rows 3
      first_mem := h3_4, second_mem := h3_2 }
  let w1 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 1, first := 0, second := 3, row := rows 1
      first_mem := h1_0, second_mem := h1_3 }
  let pathAC : List (PathStep (A := A) boundary) :=
    [.row w0, .flip 0 9, .row w9, .flip 9 8, .row w8,
      .flip 8 7, .row w7, .flip 7 6, .row w6, .flip 6 5,
      .row w5, .flip 5 4, .row w4, .flip 4 3, .row w3, .flip 3 2]
  let pathAB : List (PathStep (A := A) boundary) :=
    [.flip 0 1, .row w1]
  apply false_of_complementaryArc_selectedRowEqualityChain hA
    hboundaryInjective hboundaryImage hboundaryCcw
    (a := (0 : Fin 10)) (b := (1 : Fin 10))
    (c := (2 : Fin 10)) (d := (3 : Fin 10))
    (steps_ac := pathAC) (steps_ab := pathAB)
    (hab := by decide) (hbc := by decide) (hcd := by decide)
  · simp [pathAC, w0, w9, w8, w7, w6, w5, w4, w3,
      PathData, PathStep.source, PathStep.target,
      SelectedRowEqualityWitness.leftEdge,
      SelectedRowEqualityWitness.rightEdge]
  · simp [pathAB, w1, PathData, PathStep.source, PathStep.target,
      SelectedRowEqualityWitness.leftEdge,
      SelectedRowEqualityWitness.rightEdge]

theorem false_of_complementaryArc_selectedRowEqualityChain_fin10_r3
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 10 → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (rows : ∀ i : Fin 10, SelectedFourClass A (boundary i))
    (h1_0 : boundary 0 ∈ (rows 1).support)
    (h1_4 : boundary 4 ∈ (rows 1).support)
    (h0_3 : boundary 3 ∈ (rows 0).support)
    (h0_9 : boundary 9 ∈ (rows 0).support)
    (h9_8 : boundary 8 ∈ (rows 9).support)
    (h9_0 : boundary 0 ∈ (rows 9).support)
    (h8_9 : boundary 9 ∈ (rows 8).support)
    (h8_7 : boundary 7 ∈ (rows 8).support)
    (h7_8 : boundary 8 ∈ (rows 7).support)
    (h7_6 : boundary 6 ∈ (rows 7).support)
    (h6_7 : boundary 7 ∈ (rows 6).support)
    (h6_5 : boundary 5 ∈ (rows 6).support)
    (h5_6 : boundary 6 ∈ (rows 5).support)
    (h5_4 : boundary 4 ∈ (rows 5).support)
    (h4_5 : boundary 5 ∈ (rows 4).support)
    (h4_3 : boundary 3 ∈ (rows 4).support) :
    False := by
  let w0 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 0, first := 3, second := 9, row := rows 0
      first_mem := h0_3, second_mem := h0_9 }
  let w9 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 9, first := 0, second := 8, row := rows 9
      first_mem := h9_0, second_mem := h9_8 }
  let w8 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 8, first := 9, second := 7, row := rows 8
      first_mem := h8_9, second_mem := h8_7 }
  let w7 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 7, first := 8, second := 6, row := rows 7
      first_mem := h7_8, second_mem := h7_6 }
  let w6 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 6, first := 7, second := 5, row := rows 6
      first_mem := h6_7, second_mem := h6_5 }
  let w5 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 5, first := 6, second := 4, row := rows 5
      first_mem := h5_6, second_mem := h5_4 }
  let w4 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 4, first := 5, second := 3, row := rows 4
      first_mem := h4_5, second_mem := h4_3 }
  let w1 : SelectedRowEqualityWitness (A := A) boundary :=
    { center := 1, first := 0, second := 4, row := rows 1
      first_mem := h1_0, second_mem := h1_4 }
  let pathAC : List (PathStep (A := A) boundary) :=
    [.row w0, .flip 0 9, .row w9, .flip 9 8, .row w8,
      .flip 8 7, .row w7, .flip 7 6, .row w6, .flip 6 5,
      .row w5, .flip 5 4, .row w4, .flip 4 3]
  let pathAB : List (PathStep (A := A) boundary) :=
    [.flip 0 1, .row w1]
  apply false_of_complementaryArc_selectedRowEqualityChain hA
    hboundaryInjective hboundaryImage hboundaryCcw
    (a := (0 : Fin 10)) (b := (1 : Fin 10))
    (c := (3 : Fin 10)) (d := (4 : Fin 10))
    (steps_ac := pathAC) (steps_ab := pathAB)
    (hab := by decide) (hbc := by decide) (hcd := by decide)
  · simp [pathAC, w0, w9, w8, w7, w6, w5, w4,
      PathData, PathStep.source, PathStep.target,
      SelectedRowEqualityWitness.leftEdge,
      SelectedRowEqualityWitness.rightEdge]
  · simp [pathAB, w1, PathData, PathStep.source, PathStep.target,
      SelectedRowEqualityWitness.leftEdge,
      SelectedRowEqualityWitness.rightEdge]

end ComplementaryArcSelectedRowEqualityChain
end Problem97
