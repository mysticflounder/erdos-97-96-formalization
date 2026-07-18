/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureAggregate

/-!
# Transport between centered and global shell charts

This module identifies every row-centered re-cut with a natural-number shift
of the common global edge lift. It also extends the exact full-turn identity
from the zeroth cut to every period translate.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97

open EuclideanGeometry

namespace ShellCurvatureConstruction

open Fin.NatCast

/-- The reversed periodic boundary point is unchanged after one full period. -/
theorem reverseCyclicPoint_add_period {n i : ℕ}
    (point : Fin (n + 1) → ℝ²) :
    reverseCyclicPoint point (i + (n + 1)) =
      reverseCyclicPoint point i := by
  simp [reverseCyclicPoint, reverseCyclicIndex, Nat.cast_add]

/-- Exterior turn is periodic with the boundary cardinality. -/
theorem exteriorTurn_add_period {n i : ℕ}
    (point : Fin (n + 1) → ℝ²) :
    exteriorTurn point (i + (n + 1)) = exteriorTurn point i := by
  simp only [exteriorTurn]
  rw [reverseCyclicPoint_add_period, show i + (n + 1) + 1 =
      (i + 1) + (n + 1) by omega, reverseCyclicPoint_add_period,
    show i + (n + 1) + 2 = (i + 2) + (n + 1) by omega,
    reverseCyclicPoint_add_period]

/-- The coherent edge lift gains exactly one full turn after every boundary
period, independently of the starting natural index. -/
theorem edgeLift_add_period {n i : ℕ} (hn : 3 ≤ n + 1)
    {point : Fin (n + 1) → ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) :
    edgeLift point (i + (n + 1)) = edgeLift point i + 2 * Real.pi := by
  induction i with
  | zero =>
      simpa using edgeLift_full_turn hn hinj hccw
  | succ i ih =>
      rw [show i + 1 + (n + 1) = (i + (n + 1)) + 1 by omega,
        edgeLift_succ, ih, edgeLift_succ]
      rw [show i + (n + 1) = i + (n + 1) by rfl,
        exteriorTurn_add_period]
      ring

/-- Arc curvature in the automatic infinite lift is unchanged when both
endpoints are translated by one boundary period. -/
theorem openWindowArcCurvature_automatic_add_period
    {n i j : ℕ} (hn : 3 ≤ n + 1)
    {point : Fin (n + 1) → ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hij : i < j) :
    ShellCurvature.openWindowArcCurvature
        (openFundamentalWindowAngleChartOfCcwBoundary hn point hinj hccw)
        (i + (n + 1)) (j + (n + 1)) =
      ShellCurvature.openWindowArcCurvature
        (openFundamentalWindowAngleChartOfCcwBoundary hn point hinj hccw)
        i j := by
  change edgeLift point (j + (n + 1) - 1) -
      edgeLift point (i + (n + 1)) =
    edgeLift point (j - 1) - edgeLift point i
  rw [show j + (n + 1) - 1 = (j - 1) + (n + 1) by omega,
    edgeLift_add_period hn hinj hccw,
    edgeLift_add_period hn hinj hccw]
  ring

end ShellCurvatureConstruction

namespace ShellCurvatureRows
namespace ShellBoundaryIndexing

open _root_.Problem97.ShellCurvatureConstruction
open Fin.NatCast

/-- Natural coordinate in the global reversed chart of the chosen re-cut
center. -/
def globalChartStartAt {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : ℕ :=
  (-B.indexOf center).val

/-- A re-cut boundary point is the corresponding translate of the common
global reversed boundary window. -/
theorem reverseCyclicPoint_boundaryAt_eq_globalShift
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) (i : ℕ) :
    reverseCyclicPoint (B.boundaryAt center) i =
      reverseCyclicPoint B.boundary (B.globalChartStartAt center + i) := by
  simp only [reverseCyclicPoint, reverseCyclicIndex, boundaryAt]
  congr 1
  have hcast :
      ((B.globalChartStartAt center + i : ℕ) : Fin (B.n + 1)) =
        (B.globalChartStartAt center : Fin (B.n + 1)) +
          (i : Fin (B.n + 1)) := by
    exact Nat.cast_add _ _
  have hstart :
      (B.globalChartStartAt center : Fin (B.n + 1)) =
        -B.indexOf center := by
    exact Fin.cast_val_eq_self (-B.indexOf center)
  rw [hcast, hstart]
  abel

/-- Exterior turns in a re-cut chart are translated exterior turns of the
common global lift. -/
theorem exteriorTurn_boundaryAt_eq_globalShift
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) (i : ℕ) :
    exteriorTurn (B.boundaryAt center) i =
      exteriorTurn B.boundary (B.globalChartStartAt center + i) := by
  simp only [exteriorTurn]
  rw [B.reverseCyclicPoint_boundaryAt_eq_globalShift center i,
    B.reverseCyclicPoint_boundaryAt_eq_globalShift center (i + 1),
    B.reverseCyclicPoint_boundaryAt_eq_globalShift center (i + 2)]
  simp only [Nat.add_assoc]

/-- A re-cut edge lift is the translated global edge lift plus one constant
depending only on the chosen cut. -/
theorem edgeLift_boundaryAt_eq_globalShift_add_constant
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) (i : ℕ) :
    edgeLift (B.boundaryAt center) i =
      edgeLift B.boundary (B.globalChartStartAt center + i) +
        (edgeLift (B.boundaryAt center) 0 -
          edgeLift B.boundary (B.globalChartStartAt center)) := by
  induction i with
  | zero => ring
  | succ i ih =>
      rw [edgeLift_succ, ih,
        B.exteriorTurn_boundaryAt_eq_globalShift center i]
      rw [show B.globalChartStartAt center + (i + 1) =
          (B.globalChartStartAt center + i) + 1 by omega,
        edgeLift_succ]
      ring

/-- Differences of re-cut edge lifts are exactly translated differences in
the common global lift. -/
theorem edgeLift_boundaryAt_sub_eq_globalShift
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) (i j : ℕ) :
    edgeLift (B.boundaryAt center) j - edgeLift (B.boundaryAt center) i =
      edgeLift B.boundary (B.globalChartStartAt center + j) -
        edgeLift B.boundary (B.globalChartStartAt center + i) := by
  rw [B.edgeLift_boundaryAt_eq_globalShift_add_constant center i,
    B.edgeLift_boundaryAt_eq_globalShift_add_constant center j]
  ring

/-- Every open arc in a centered re-cut is exactly the corresponding
translated arc-curvature difference of the common global chart. The translated
indices may lie in the second natural lift of the global period. -/
theorem openWindowArcCurvature_chartAt_eq_globalShift
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) {i j : ℕ} (hij : i < j) :
    ShellCurvature.openWindowArcCurvature (B.chartAt center) i j =
      ShellCurvature.openWindowArcCurvature B.chart
        (B.globalChartStartAt center + i)
        (B.globalChartStartAt center + j) := by
  change edgeLift (B.boundaryAt center) (j - 1) -
      edgeLift (B.boundaryAt center) i =
    edgeLift B.boundary
        (B.globalChartStartAt center + j - 1) -
      edgeLift B.boundary (B.globalChartStartAt center + i)
  rw [B.edgeLift_boundaryAt_sub_eq_globalShift center i (j - 1)]
  congr 2
  omega

/-- The common global chart's infinite lift has period `2π`, so translating
both endpoints by one carrier cardinality preserves arc curvature. -/
theorem openWindowArcCurvature_chart_add_period
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {i j : ℕ} (hij : i < j) :
    ShellCurvature.openWindowArcCurvature B.chart
        (i + (B.n + 1)) (j + (B.n + 1)) =
      ShellCurvature.openWindowArcCurvature B.chart i j := by
  simpa [chart] using
    openWindowArcCurvature_automatic_add_period B.three_le
      B.boundary_injective B.boundary_ccw hij

/-- The four quarter-turn inequalities for one centered row, expressed in the
single common infinite lift of the global boundary chart. -/
noncomputable def HasGlobalShiftedQuarterTurnSeparation
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) : Prop :=
  let s := B.globalChartStartAt (shellCenterLabel K)
  let i₁ := B.centeredSupportIndex K 1
  let i₂ := B.centeredSupportIndex K 2
  Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart s (s + i₁) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart s (s + i₂) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart
      (s + i₁) (s + (B.n + 1)) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart
      (s + i₂) (s + (B.n + 1))

/-- Every canonical centered support index is positive because the re-cut
center is not one of its own four shell points. -/
theorem centeredSupportIndex_pos
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) (i : Fin 4) :
    0 < B.centeredSupportIndex K i := by
  have hmem := B.centeredChart_point_supportOrder_mem K i
  have hcenter := B.chartAt_point_zero (shellCenterLabel K)
  by_contra hi
  have hi0 : B.centeredSupportIndex K i = 0 := by omega
  have hpoint :
      (B.chartAt (shellCenterLabel K)).point
          (B.centeredSupportIndex K i) = center := by
    rw [hi0]
    simpa [shellCenterLabel] using hcenter
  change (B.chartAt (shellCenterLabel K)).point
      (B.centeredSupportIndex K i) ∈ K.support at hmem
  rw [hpoint] at hmem
  exact K.center_not_mem_support hmem

/-- The row-centered quarter-turn conclusion transports verbatim into one
common infinite global lift. The only row-dependent datum is the translated
window start. -/
theorem centeredShell_has_globalShiftedQuarterTurnSeparation
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) :
    B.HasGlobalShiftedQuarterTurnSeparation K := by
  let s := B.globalChartStartAt (shellCenterLabel K)
  let i₁ := B.centeredSupportIndex K 1
  let i₂ := B.centeredSupportIndex K 2
  have hsep := B.centeredShell_has_quarterTurnSeparation K
  have hi₁ : 0 < i₁ := by
    simpa [i₁] using B.centeredSupportIndex_pos K (1 : Fin 4)
  have hi₂ : 0 < i₂ := by
    simpa [i₂] using B.centeredSupportIndex_pos K (2 : Fin 4)
  have hi₁End : i₁ < B.n + 1 := by
    simpa [i₁, centeredSupportIndex] using
      (B.centeredSupportOrder K (1 : Fin 4)).isLt
  have hi₂End : i₂ < B.n + 1 := by
    simpa [i₂, centeredSupportIndex] using
      (B.centeredSupportOrder K (2 : Fin 4)).isLt
  rcases hsep with ⟨h₁, h₂, h₃, h₄⟩
  refine ⟨?_, ?_, ?_, ?_⟩
  · simpa [HasGlobalShiftedQuarterTurnSeparation, s, i₁, i₂] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift
        (shellCenterLabel K) hi₁ ▸ h₁)
  · simpa [HasGlobalShiftedQuarterTurnSeparation, s, i₁, i₂] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift
        (shellCenterLabel K) hi₂ ▸ h₂)
  · simpa [HasGlobalShiftedQuarterTurnSeparation, s, i₁, i₂,
      centeredShellChart] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift
        (shellCenterLabel K) hi₁End ▸ h₃)
  · simpa [HasGlobalShiftedQuarterTurnSeparation, s, i₁, i₂,
      centeredShellChart] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift
        (shellCenterLabel K) hi₂End ▸ h₄)

end ShellBoundaryIndexing
end ShellCurvatureRows

end Problem97
