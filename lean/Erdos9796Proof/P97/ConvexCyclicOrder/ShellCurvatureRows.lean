/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureConstruct
import Erdos9796Proof.P97.ConvexCyclicOrder.Construct
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Placing actual critical rows in shell-curvature charts

This module constructs one global cyclic boundary indexing for a finite
convex-independent carrier and canonically sorts every exact four-point shell.
For the shell-curvature conclusion it re-cuts that boundary separately at each
row center, then applies the construction to all five actual rows of
`U1Depth5.CriticalSourceRows`.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ShellCurvatureRows

open EuclideanGeometry

/-- A carrier label carrying its ambient-membership proof. -/
abbrev CarrierLabel (A : Finset ℝ²) := {x : ℝ² // x ∈ A}

/-- One global boundary indexing in the successor form required by the
automatic open-window shell chart. -/
structure ShellBoundaryIndexing (A : Finset ℝ²) where
  n : ℕ
  three_le : 3 ≤ n + 1
  boundary : Fin (n + 1) → ℝ²
  indexOf : CarrierLabel A → Fin (n + 1)
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : IsCcwConvexPolygon boundary
  index_injective : Function.Injective indexOf
  point_eq : ∀ label, boundary (indexOf label) = label.1

/-- Convex independence and non-collinearity supply the successor-indexed
boundary data needed by the shell-curvature constructor. -/
theorem exists_shellBoundaryIndexing {A : Finset ℝ²}
    (hconv : ConvexIndep A) (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²)) :
    Nonempty (ShellBoundaryIndexing A) := by
  classical
  rcases exists_isCcwConvexPolygon_of_convexIndep hconv hnoncoll with
    ⟨N, hN, boundary, hboundaryInj, hboundaryImage, hboundaryCcw⟩
  cases N with
  | zero => omega
  | succ n =>
      have hex (label : CarrierLabel A) :
          ∃ i : Fin (n + 1), boundary i = label.1 := by
        have hmem : label.1 ∈ Finset.univ.image boundary := by
          rw [hboundaryImage]
          exact label.2
        rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
        exact ⟨i, hpoint⟩
      let indexOf : CarrierLabel A → Fin (n + 1) :=
        fun label ↦ Classical.choose (hex label)
      have hpoint : ∀ label, boundary (indexOf label) = label.1 :=
        fun label ↦ Classical.choose_spec (hex label)
      have hindexInj : Function.Injective indexOf := by
        intro a b hab
        apply Subtype.ext
        calc
          a.1 = boundary (indexOf a) := (hpoint a).symm
          _ = boundary (indexOf b) := congrArg boundary hab
          _ = b.1 := hpoint b
      exact ⟨{
        n := n
        three_le := hN
        boundary := boundary
        indexOf := indexOf
        boundary_injective := hboundaryInj
        boundary_image := hboundaryImage
        boundary_ccw := hboundaryCcw
        index_injective := hindexInj
        point_eq := hpoint }⟩

namespace ShellBoundaryIndexing

/-- The automatically constructed coherent angle chart for the whole carrier. -/
noncomputable def chart {A : Finset ℝ²} (B : ShellBoundaryIndexing A) :
    ShellCurvature.OpenFundamentalWindowAngleChart :=
  ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary
    B.three_le B.boundary B.boundary_injective B.boundary_ccw

/-- The index of a carrier point in the reversed chart orientation. -/
def chartIndexOf {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (label : CarrierLabel A) : Fin (B.n + 1) :=
  -(B.indexOf label)

theorem chartIndexOf_injective {A : Finset ℝ²} (B : ShellBoundaryIndexing A) :
    Function.Injective B.chartIndexOf := by
  intro a b hab
  apply B.index_injective
  exact neg_injective hab

/-- The chart point at a carrier label's reversed index is that carrier point. -/
theorem chart_point_chartIndexOf {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (label : CarrierLabel A) :
    B.chart.point (B.chartIndexOf label).val = label.1 := by
  simp only [chart, ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary,
    chartIndexOf, ShellCurvatureConstruction.reverseCyclicPoint,
    ShellCurvatureConstruction.reverseCyclicIndex]
  simpa using B.point_eq label

/-- The four reversed boundary indices occupied by an exact critical shell. -/
noncomputable def supportIndices {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) :
    Finset (Fin (B.n + 1)) :=
  K.support.attach.image fun z ↦
    B.chartIndexOf ⟨z.1, K.support_subset_A z.2⟩

theorem supportIndices_card {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) :
    (B.supportIndices K).card = 4 := by
  classical
  have hinj : Function.Injective (fun z : K.support ↦
      B.chartIndexOf ⟨z.1, K.support_subset_A z.2⟩) := by
    intro a b hab
    have hlabel := B.chartIndexOf_injective hab
    apply Subtype.ext
    exact congrArg (fun label : CarrierLabel A ↦ label.1) hlabel
  rw [supportIndices, Finset.card_image_of_injective _ hinj]
  simpa using K.support_card

/-- The canonical increasing order of an exact shell's four chart indices. -/
noncomputable def supportOrder {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {q center : ℝ²} (K : CriticalFourShell A q center) :
    Fin 4 ↪o Fin (B.n + 1) :=
  (B.supportIndices K).orderEmbOfFin (B.supportIndices_card K)

/-- Each canonically ordered chart position is one of the shell points. -/
theorem chart_point_supportOrder_mem {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) (i : Fin 4) :
    B.chart.point (B.supportOrder K i).val ∈ K.support := by
  classical
  have hi : B.supportOrder K i ∈ B.supportIndices K := by
    exact Finset.orderEmbOfFin_mem _ (B.supportIndices_card K) i
  rw [supportIndices] at hi
  rcases Finset.mem_image.mp hi with ⟨z, _hz, hzi⟩
  have hpoint := B.chart_point_chartIndexOf
    (⟨z.1, K.support_subset_A z.2⟩ : CarrierLabel A)
  rw [hzi] at hpoint
  rw [hpoint]
  exact z.2

/-- Every shell point occurs at one of the four canonical chart positions. -/
theorem exists_supportOrder_point_eq {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center z : ℝ²}
    (K : CriticalFourShell A q center) (hz : z ∈ K.support) :
    ∃ i : Fin 4, B.chart.point (B.supportOrder K i).val = z := by
  classical
  let label : CarrierLabel A := ⟨z, K.support_subset_A hz⟩
  have hindex : B.chartIndexOf label ∈ B.supportIndices K := by
    rw [supportIndices]
    exact Finset.mem_image.mpr ⟨⟨z, hz⟩, Finset.mem_attach _ _, rfl⟩
  have hrange : B.chartIndexOf label ∈ Set.range (B.supportOrder K) := by
    simpa [supportOrder] using hindex
  rcases hrange with ⟨i, hi⟩
  refine ⟨i, ?_⟩
  rw [hi]
  exact B.chart_point_chartIndexOf label

/-- The canonical four positions enumerate the shell support exactly. -/
theorem image_chart_point_supportOrder {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    Finset.univ.image (fun i : Fin 4 ↦
      B.chart.point (B.supportOrder K i).val) = K.support := by
  classical
  ext z
  constructor
  · intro hz
    rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
    exact B.chart_point_supportOrder_mem K i
  · intro hz
    rcases B.exists_supportOrder_point_eq K hz with ⟨i, hi⟩
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, hi⟩

/- ## Re-cutting the chart at an actual critical-row center -/

/-- Cyclically re-cut the upstream boundary at a chosen carrier point. -/
def boundaryAt {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) (i : Fin (B.n + 1)) : ℝ² :=
  B.boundary (i + B.indexOf center)

theorem boundaryAt_injective {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : Function.Injective (B.boundaryAt center) :=
  injective_cyclicShift B.boundary_injective (B.indexOf center)

theorem boundaryAt_ccw {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : IsCcwConvexPolygon (B.boundaryAt center) :=
  isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw
    (B.indexOf center)

/-- The automatic shell chart re-cut at a chosen carrier point. -/
noncomputable def chartAt {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : ShellCurvature.OpenFundamentalWindowAngleChart :=
  ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary
    B.three_le (B.boundaryAt center) (B.boundaryAt_injective center)
      (B.boundaryAt_ccw center)

@[simp] theorem chartAt_windowStart {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A) :
    (B.chartAt center).windowStart = 0 := rfl

@[simp] theorem chartAt_windowEnd {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A) :
    (B.chartAt center).windowEnd = B.n + 1 := rfl

/-- Reversed chart coordinate of a carrier point after re-cutting at `center`. -/
def chartIndexAt {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center label : CarrierLabel A) : Fin (B.n + 1) :=
  B.indexOf center - B.indexOf label

theorem chartIndexAt_injective {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : Function.Injective (B.chartIndexAt center) := by
  intro a b hab
  apply B.index_injective
  change B.indexOf center - B.indexOf a =
    B.indexOf center - B.indexOf b at hab
  exact sub_right_injective hab

/-- The centered chart realizes every carrier point at its re-cut coordinate. -/
theorem chartAt_point_chartIndexAt {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center label : CarrierLabel A) :
    (B.chartAt center).point (B.chartIndexAt center label).val = label.1 := by
  change B.boundary
      (ShellCurvatureConstruction.reverseCyclicIndex B.n
          (B.chartIndexAt center label).val + B.indexOf center) = label.1
  rw [show
    ShellCurvatureConstruction.reverseCyclicIndex B.n
        (B.chartIndexAt center label).val + B.indexOf center =
      B.indexOf label by
    simp only [ShellCurvatureConstruction.reverseCyclicIndex, chartIndexAt,
      Fin.cast_val_eq_self]
    abel]
  exact B.point_eq label

/-- The chosen re-cut center is the zeroth point of its chart. -/
theorem chartAt_point_zero {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : (B.chartAt center).point 0 = center.1 := by
  have hpoint := B.chartAt_point_chartIndexAt center center
  simpa [chartIndexAt] using hpoint

/-- An exact critical shell's center is an ambient carrier label. -/
def shellCenterLabel {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) : CarrierLabel A :=
  ⟨center, (Finset.mem_erase.mp K.center_mem).2⟩

/-- The four centered-chart indices occupied by an exact critical shell. -/
noncomputable def centeredSupportIndices {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) : Finset (Fin (B.n + 1)) :=
  K.support.attach.image fun z ↦
    B.chartIndexAt (shellCenterLabel K)
      ⟨z.1, K.support_subset_A z.2⟩

theorem centeredSupportIndices_card {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    (B.centeredSupportIndices K).card = 4 := by
  classical
  have hinj : Function.Injective (fun z : K.support ↦
      B.chartIndexAt (shellCenterLabel K)
        ⟨z.1, K.support_subset_A z.2⟩) := by
    intro a b hab
    have hlabel := B.chartIndexAt_injective (shellCenterLabel K) hab
    apply Subtype.ext
    exact congrArg (fun label : CarrierLabel A ↦ label.1) hlabel
  rw [centeredSupportIndices, Finset.card_image_of_injective _ hinj]
  simpa using K.support_card

/-- Increasing order of a shell's four points in the chart re-cut at its center. -/
noncomputable def centeredSupportOrder {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) : Fin 4 ↪o Fin (B.n + 1) :=
  (B.centeredSupportIndices K).orderEmbOfFin
    (B.centeredSupportIndices_card K)

theorem centeredChart_point_supportOrder_mem {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) (i : Fin 4) :
    (B.chartAt (shellCenterLabel K)).point
        (B.centeredSupportOrder K i).val ∈ K.support := by
  classical
  have hi : B.centeredSupportOrder K i ∈ B.centeredSupportIndices K := by
    exact Finset.orderEmbOfFin_mem _ (B.centeredSupportIndices_card K) i
  rw [centeredSupportIndices] at hi
  rcases Finset.mem_image.mp hi with ⟨z, _hz, hzi⟩
  have hpoint := B.chartAt_point_chartIndexAt (shellCenterLabel K)
    (⟨z.1, K.support_subset_A z.2⟩ : CarrierLabel A)
  rw [hzi] at hpoint
  rw [hpoint]
  exact z.2

/-- The four centered positions enumerate the exact shell support. -/
theorem image_centeredChart_point_supportOrder {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    Finset.univ.image (fun i : Fin 4 ↦
      (B.chartAt (shellCenterLabel K)).point
        (B.centeredSupportOrder K i).val) = K.support := by
  classical
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
    exact B.centeredChart_point_supportOrder_mem K i
  · rw [Finset.card_image_of_injective]
    · simpa using K.support_card.le
    · intro i j hij
      change (B.chartAt (shellCenterLabel K)).point
          (B.centeredSupportOrder K i).val =
        (B.chartAt (shellCenterLabel K)).point
          (B.centeredSupportOrder K j).val at hij
      apply (B.centeredSupportOrder K).injective
      apply Fin.ext
      exact (B.chartAt (shellCenterLabel K)).point_injective_before_end
        (by simp)
        (by simpa using (B.centeredSupportOrder K i).isLt)
        (by simp)
        (by simpa using (B.centeredSupportOrder K j).isLt) hij

/-- The shell-facing chart, re-cut separately at this row's actual center. -/
noncomputable def centeredShellChart {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    ShellCurvature.OpenFundamentalWindowAngleChart :=
  B.chartAt (shellCenterLabel K)

/-- Natural coordinate of the `i`-th shell point in its centered chart. -/
noncomputable def centeredSupportIndex {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) (i : Fin 4) : ℕ :=
  (B.centeredSupportOrder K i).val

/-- The four quarter-turn conclusions supplied by the shell-curvature theorem
for one exact critical row after re-cutting the common boundary at its center. -/
noncomputable def HasCenteredQuarterTurnSeparation {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) : Prop :=
  Real.pi / 2 < ShellCurvature.openWindowArcCurvature
      (B.centeredShellChart K) 0 (B.centeredSupportIndex K 1) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature
      (B.centeredShellChart K) 0 (B.centeredSupportIndex K 2) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature
      (B.centeredShellChart K) (B.centeredSupportIndex K 1)
        (B.centeredShellChart K).windowEnd ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature
      (B.centeredShellChart K) (B.centeredSupportIndex K 2)
        (B.centeredShellChart K).windowEnd

/-- Every actual exact critical shell satisfies the shell-curvature
quarter-turn separation in the chart re-cut at its own center. -/
theorem centeredShell_has_quarterTurnSeparation {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    B.HasCenteredQuarterTurnSeparation K := by
  let C := B.centeredShellChart K
  let idx : Fin 4 → ℕ := B.centeredSupportIndex K
  have hcenterPoint : C.point 0 = center := by
    simpa [C, centeredShellChart, shellCenterLabel] using
      B.chartAt_point_zero (shellCenterLabel K)
  have hmem (i : Fin 4) : C.point (idx i) ∈ K.support := by
    simpa [C, idx, centeredShellChart, centeredSupportIndex] using
      B.centeredChart_point_supportOrder_mem K i
  have hidx0ne : B.centeredSupportOrder K 0 ≠ 0 := by
    intro hzero
    have hzeroMem := hmem 0
    have hidxZero : idx 0 = 0 := by
      simp [idx, centeredSupportIndex, hzero]
    rw [hidxZero, hcenterPoint] at hzeroMem
    exact K.center_not_mem_support hzeroMem
  have h0q1 : 0 < idx 0 := by
    have hval : idx 0 ≠ 0 := by
      intro hzero
      apply hidx0ne
      apply Fin.ext
      simpa [idx, centeredSupportIndex] using hzero
    omega
  have hq1q2 : idx 0 < idx 1 := by
    exact (B.centeredSupportOrder K).strictMono
      (by decide : (0 : Fin 4) < 1)
  have hq2q3 : idx 1 < idx 2 := by
    exact (B.centeredSupportOrder K).strictMono
      (by decide : (1 : Fin 4) < 2)
  have hq3q4 : idx 2 < idx 3 := by
    exact (B.centeredSupportOrder K).strictMono
      (by decide : (2 : Fin 4) < 3)
  have hq4end : idx 3 < C.windowEnd := by
    simpa [C, idx, centeredShellChart, centeredSupportIndex] using
      (B.centeredSupportOrder K 3).isLt
  have heqFirst :
      dist (C.point 0) (C.point (idx 0)) =
        dist (C.point 0) (C.point (idx 1)) := by
    rw [hcenterPoint]
    exact (K.support_eq_radius _ (hmem 0)).trans
      (K.support_eq_radius _ (hmem 1)).symm
  have heqLast :
      dist (C.point 0) (C.point (idx 2)) =
        dist (C.point 0) (C.point (idx 3)) := by
    rw [hcenterPoint]
    exact (K.support_eq_radius _ (hmem 2)).trans
      (K.support_eq_radius _ (hmem 3)).symm
  have hsep :=
    ShellCurvature.openWindow_two_sided_quarter_turn_separation_of_equal_radius
      C (p := 0) (q1 := idx 0) (q2 := idx 1) (q3 := idx 2) (q4 := idx 3)
      (by simp [C, centeredShellChart]) h0q1 hq1q2 hq2q3 hq3q4 hq4end
      C.point_period heqFirst heqLast
  simpa [HasCenteredQuarterTurnSeparation, C, idx, centeredShellChart,
    centeredSupportIndex] using hsep


end ShellBoundaryIndexing

/-- All five actual critical-source rows admit exact sorted placements inside
one common boundary chart. This fixed-cut result records placement only; the
shell-facing quarter-turn theorem below re-cuts separately at each row center. -/
theorem exists_common_boundaryChartPlacements_for_criticalSourceRows
    (D : CounterexampleData) {q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    ∃ B : ShellBoundaryIndexing D.A,
      ∀ source : U1Depth5.CriticalSource,
        Finset.univ.image (fun i : Fin 4 ↦
          B.chart.point
            (B.supportOrder
              (rows.rowAt source).selected.toCriticalFourShell i).val) =
          (rows.rowAt source).selected.toCriticalFourShell.support := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨B⟩
  exact ⟨B, fun source ↦
    B.image_chart_point_supportOrder
      (rows.rowAt source).selected.toCriticalFourShell⟩

/-- The five actual critical-source rows simultaneously inherit the automatic
quarter-turn separation, using five center-specific re-cuts of one underlying
global boundary indexing. -/
theorem exists_perRow_quarterTurnSeparation_for_criticalSourceRows
    (D : CounterexampleData) {q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    ∃ B : ShellBoundaryIndexing D.A,
      ∀ source : U1Depth5.CriticalSource,
        B.HasCenteredQuarterTurnSeparation
          (rows.rowAt source).selected.toCriticalFourShell := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨B⟩
  exact ⟨B, fun source ↦
    B.centeredShell_has_quarterTurnSeparation
      (rows.rowAt source).selected.toCriticalFourShell⟩

end ShellCurvatureRows
end Problem97
