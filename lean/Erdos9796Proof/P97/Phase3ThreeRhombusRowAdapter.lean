/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SevenPointThreeRhombus

/-!
# Phase-3 three-rhombus row adapter

Thirteen positive row memberships, together with the same-row equidistance semantics, produce
the ten equal edges in the seven-point three-rhombus obstruction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Phase3ThreeRhombusRowAdapter

/-- The canonical thirteen positive memberships on seven distinct labels cannot occur in an
injective planar realization whose members of each row are equidistant from its center. -/
theorem false_of_thirteen_row_memberships
    {ι : Type*}
    (pointOf : ι → ℝ²)
    (selected : ι → ι → Prop)
    (hinjective : Function.Injective pointOf)
    (hequidist : ∀ {center a b : ι}, selected center a → selected center b →
      dist (pointOf center) (pointOf a) = dist (pointOf center) (pointOf b))
    {x0 x1 x2 x3 x4 x5 x6 : ι}
    (hpair : List.Pairwise (fun x y : ι ↦ x ≠ y) [x0, x1, x2, x3, x4, x5, x6])
    (h01 : selected x0 x1) (h03 : selected x0 x3)
    (h04 : selected x0 x4) (h06 : selected x0 x6)
    (h21 : selected x2 x1) (h23 : selected x2 x3) (h25 : selected x2 x5)
    (h52 : selected x5 x2) (h54 : selected x5 x4) (h56 : selected x5 x6)
    (h30 : selected x3 x0) (h32 : selected x3 x2) (h34 : selected x3 x4) :
    False := by
  have hpointPair :
      List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
        [pointOf x0, pointOf x1, pointOf x2, pointOf x3, pointOf x4, pointOf x5,
          pointOf x6] := by
    simpa using List.Pairwise.map (S := fun x y : ℝ² ↦ x ≠ y) pointOf
      (fun _ _ hxy hEq ↦ hxy (hinjective hEq)) hpair
  have h01_03 : dist (pointOf x0) (pointOf x1) = dist (pointOf x0) (pointOf x3) :=
    hequidist h01 h03
  have h01_04 : dist (pointOf x0) (pointOf x1) = dist (pointOf x0) (pointOf x4) :=
    hequidist h01 h04
  have h01_06 : dist (pointOf x0) (pointOf x1) = dist (pointOf x0) (pointOf x6) :=
    hequidist h01 h06
  have h01_23 : dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x3) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x0) (pointOf x3) := h01_03
      _ = dist (pointOf x3) (pointOf x0) := dist_comm _ _
      _ = dist (pointOf x3) (pointOf x2) := hequidist h30 h32
      _ = dist (pointOf x2) (pointOf x3) := dist_comm _ _
  have h01_12 : dist (pointOf x0) (pointOf x1) = dist (pointOf x1) (pointOf x2) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x3) := h01_23
      _ = dist (pointOf x2) (pointOf x1) := hequidist h23 h21
      _ = dist (pointOf x1) (pointOf x2) := dist_comm _ _
  have h01_25 : dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x5) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x3) := h01_23
      _ = dist (pointOf x2) (pointOf x5) := hequidist h23 h25
  have h01_34 : dist (pointOf x0) (pointOf x1) = dist (pointOf x3) (pointOf x4) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x3) := h01_23
      _ = dist (pointOf x3) (pointOf x2) := dist_comm _ _
      _ = dist (pointOf x3) (pointOf x4) := hequidist h32 h34
  have h01_45 : dist (pointOf x0) (pointOf x1) = dist (pointOf x4) (pointOf x5) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x5) := h01_25
      _ = dist (pointOf x5) (pointOf x2) := dist_comm _ _
      _ = dist (pointOf x5) (pointOf x4) := hequidist h52 h54
      _ = dist (pointOf x4) (pointOf x5) := dist_comm _ _
  have h01_56 : dist (pointOf x0) (pointOf x1) = dist (pointOf x5) (pointOf x6) := by
    calc
      dist (pointOf x0) (pointOf x1) = dist (pointOf x2) (pointOf x5) := h01_25
      _ = dist (pointOf x5) (pointOf x2) := dist_comm _ _
      _ = dist (pointOf x5) (pointOf x6) := hequidist h52 h56
  exact SevenPointThreeRhombus.false_of_ten_equal_edges hpointPair
    h01_03 h01_04 h01_06 h01_12 h01_23 h01_25 h01_34 h01_45 h01_56

end Phase3ThreeRhombusRowAdapter
end Problem97
