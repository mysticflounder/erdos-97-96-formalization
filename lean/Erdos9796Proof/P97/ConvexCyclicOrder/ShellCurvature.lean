/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.MEC.ArcAngle
import Mathlib.Data.Fin.Rev
import Mathlib.Algebra.BigOperators.Group.Finset.Interval

/-!
# Lifted shell-curvature inequalities

This production module formalizes the analytic cores of Lemmas 30 and 37 in
`/tmp/verified-results.md`.

The source geometric object is a `CounterclockwiseAngleChart`.  It records actual
polygon vertices, real lifts of their edge and chord directions, the agreement
of those lifts with `Problem97.arcAngle`, strict increase of the edge lifts,
and the standard convex-polygon chord-direction bounds.  Its order is the
usual counterclockwise order used in the prose proof.  This is opposite the
project dependency's `EuclideanGeometry.IsCcwConvexPolygon` chirality;
`standardCounterclockwiseConvexPolygon_reverseLinear` below is the explicit
finite reversal bridge.

Over such a chart, this file proves:

* the four quantitative middle-target bounds
  `π / 2 + angle / 2 ≤ arcCurvature`;
* the strict two-sided quarter-turn separation of Lemma 30;
* telescoping of the closed middle-arc turn sum, including both endpoint
  turns;
* the exact complementary-arc identity; and
* the `≤ π - (a + c) / 2 < π` budget of Lemma 37.

The isosceles chord-direction identities (equations (59) and (60) in the prose
proof) are derived from Mathlib's oriented Pons asinorum theorem.  The final
equal-radius wrappers therefore consume actual metric equalities and the
lifted chart rather than assuming those equations.  The chart's ordered-triple
sign field supplies the positive apex orientations.

The remaining source adapter is the construction of the compatible unwrapped
real edge and chord lifts.  Lemma 30's separate cap-block conclusion also
remains in the earlier combinatorial lane; this module formalizes its curvature
conclusion without adding a project axiom or a new `sorry`.
-/

open scoped EuclideanGeometry Real

namespace Problem97
namespace ShellCurvature

/-- The usual counterclockwise chirality for a finite polygon enumeration.

The upstream predicate named `IsCcwConvexPolygon` uses the opposite sign in
the project's coordinates. -/
def StandardCounterclockwiseConvexPolygon {n : ℕ} (point : Fin n → ℝ²) : Prop :=
  ∀ ⦃i j k⦄, i < j → j < k →
    (∡ (point i) (point j) (point k)).sign = -1

/-- Reversing the linear order converts the upstream polygon chirality to the
standard counterclockwise convention used by the shell-curvature proof. -/
theorem standardCounterclockwiseConvexPolygon_reverseLinear
    {n : ℕ} {point : Fin n → ℝ²}
    (hpolygon : EuclideanGeometry.IsCcwConvexPolygon point) :
    StandardCounterclockwiseConvexPolygon (fun i => point i.rev) := by
  intro i j k hij hjk
  have hkj : k.rev < j.rev := Fin.rev_lt_rev.mpr hjk
  have hji : j.rev < i.rev := Fin.rev_lt_rev.mpr hij
  have hforward := hpolygon hkj hji
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (point k.rev) (point j.rev) (point i.rev)
  rw [hforward] at hswap
  simpa using hswap.symm

/-- A real lift of edge and chord directions along one lifted window of a
strictly convex polygon.

The `edgeArg_lifts` and `chordArg_lifts` fields connect the real chart to the
actual vertex geometry through `Problem97.arcAngle`.  The final three fields
are standard counterclockwise chirality, the chord-direction interval
(equation (58) of the prose proof), and the principal convex-turn bound. -/
structure CounterclockwiseAngleChart where
  point : ℕ → ℝ²
  edgeArg : ℕ → ℝ
  chordArg : ℕ → ℕ → ℝ
  edgeArg_lifts : ∀ i,
    ((edgeArg i : ℝ) : Real.Angle) = arcAngle (point i) (point (i + 1))
  chordArg_lifts : ∀ {i j}, i < j →
    ((chordArg i j : ℝ) : Real.Angle) = arcAngle (point i) (point j)
  edgeArg_strictMono : StrictMono edgeArg
  orderedTriple_sign_neg : ∀ {i j k}, i < j → j < k →
    (∡ (point i) (point j) (point k)).sign = -1
  chordArg_bounds : ∀ {i j}, i < j →
    edgeArg i ≤ chordArg i j ∧ chordArg i j ≤ edgeArg (j - 1)
  chordTurn_le_pi : ∀ {i j k}, i < j → j < k →
    chordArg j k - chordArg i j ≤ Real.pi

/-- At the first point of a counterclockwise ordered triple, the two forward
rays have positive oriented angle. -/
theorem CounterclockwiseAngleChart.apex_sign_pos
    (chart : CounterclockwiseAngleChart) {p q1 q2 : ℕ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2) :
    (∡ (chart.point q1) (chart.point p) (chart.point q2)).sign = 1 := by
  have hordered := chart.orderedTriple_sign_neg hpq1 hq1q2
  have hrotate :
      (∡ (chart.point q2) (chart.point p) (chart.point q1)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign,
      EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (chart.point q2) (chart.point p) (chart.point q1)
  rw [hrotate] at hswap
  simpa using hswap.symm

/-- The direction change from the radius `p → q1` to the chord `q1 → q2`
is the oriented exterior turn at `q1`. -/
theorem arcAngle_first_chord_turn
    {p q1 q2 : ℝ²} (hpq1 : p ≠ q1) (hq1q2 : q1 ≠ q2) :
    arcAngle q1 q2 - arcAngle p q1 =
      ∡ p q1 q2 + (Real.pi : Real.Angle) := by
  unfold arcAngle
  have he : (EuclideanSpace.basisFun (Fin 2) ℝ) 0 ≠ (0 : ℝ²) :=
    (EuclideanSpace.basisFun (Fin 2) ℝ).orthonormal.ne_zero 0
  have hpq1Vector : q1 - p ≠ 0 := sub_ne_zero.mpr hpq1.symm
  have hq1q2Vector : q2 - q1 ≠ 0 := sub_ne_zero.mpr hq1q2.symm
  rw [stdOrientation.oangle_sub_left he hpq1Vector hq1q2Vector]
  rw [show q1 - p = -(p - q1) by module]
  rw [stdOrientation.oangle_neg_left (sub_ne_zero.mpr hpq1) hq1q2Vector]
  rfl

/-- The direction change from the chord `q1 → q2` to the radius `q2 → p`
is the oriented exterior turn at `q2`. -/
theorem arcAngle_last_chord_turn
    {p q1 q2 : ℝ²} (hpq2 : p ≠ q2) (hq1q2 : q1 ≠ q2) :
    arcAngle q2 p - arcAngle q1 q2 =
      ∡ q1 q2 p + (Real.pi : Real.Angle) := by
  unfold arcAngle
  have he : (EuclideanSpace.basisFun (Fin 2) ℝ) 0 ≠ (0 : ℝ²) :=
    (EuclideanSpace.basisFun (Fin 2) ℝ).orthonormal.ne_zero 0
  have hpq2Vector : p - q2 ≠ 0 := sub_ne_zero.mpr hpq2
  have hq1q2Vector : q2 - q1 ≠ 0 := sub_ne_zero.mpr hq1q2.symm
  rw [stdOrientation.oangle_sub_left he hq1q2Vector hpq2Vector]
  rw [show q2 - q1 = -(q1 - q2) by module]
  rw [stdOrientation.oangle_neg_left (sub_ne_zero.mpr hq1q2) hpq2Vector]
  rfl

/-- Quotient-level form of the first isosceles chord identity (59).  Doubling
avoids choosing a branch of `Real.Angle`; the remaining branch selection is
exactly what the lifted real chart supplies. -/
theorem two_zsmul_first_chord_turn_eq_pi_add_apex_oangle
    {p q1 q2 : ℝ²} (hpq1 : p ≠ q1) (hq1q2 : q1 ≠ q2)
    (heq : dist p q1 = dist p q2) :
    (2 : ℤ) • (arcAngle q1 q2 - arcAngle p q1) =
      (Real.pi : Real.Angle) + ∡ q1 p q2 := by
  have hisosceles :=
    EuclideanGeometry.oangle_eq_pi_sub_two_zsmul_oangle_of_dist_eq
      (p₁ := p) (p₂ := q1) (p₃ := q2) hq1q2 heq
  rw [EuclideanGeometry.oangle_rev] at hisosceles
  have hbase :
      (2 : ℤ) • ∡ p q1 q2 = (Real.pi : Real.Angle) + ∡ q1 p q2 := by
    have hsum :
        -(∡ q1 p q2) + (2 : ℤ) • ∡ p q1 q2 =
          (Real.pi : Real.Angle) :=
      (eq_sub_iff_add_eq.mp hisosceles)
    rw [← hsum]
    abel
  rw [arcAngle_first_chord_turn hpq1 hq1q2]
  rw [smul_add, hbase]
  simp [two_zsmul]

/-- Quotient-level form of the terminal isosceles chord identity (60). -/
theorem two_zsmul_last_chord_turn_eq_pi_add_apex_oangle
    {p q1 q2 : ℝ²} (hpq1 : p ≠ q1) (hpq2 : p ≠ q2)
    (hq1q2 : q1 ≠ q2) (heq : dist p q1 = dist p q2) :
    (2 : ℤ) • (arcAngle q2 p - arcAngle q1 q2) =
      (Real.pi : Real.Angle) + ∡ q1 p q2 := by
  have hbaseAngles : ∡ p q1 q2 = ∡ q1 q2 p :=
    EuclideanGeometry.oangle_eq_oangle_of_dist_eq heq
  rw [arcAngle_last_chord_turn hpq2 hq1q2, ← hbaseAngles]
  have hfirst := two_zsmul_first_chord_turn_eq_pi_add_apex_oangle
    hpq1 hq1q2 heq
  rw [arcAngle_first_chord_turn hpq1 hq1q2] at hfirst
  exact hfirst

/-- Equation (59) modulo `2π`, now read directly from a lifted chart and an
equal-radius pair. -/
theorem chart_first_isosceles_chord_identity_mod_two_pi
    (chart : CounterclockwiseAngleChart) {p q1 q2 : ℕ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2)
    (hpq1Points : chart.point p ≠ chart.point q1)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (heq : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2)) :
    (2 : ℤ) •
        ((chart.chordArg q1 q2 - chart.chordArg p q1 : ℝ) : Real.Angle) =
      (Real.pi : Real.Angle) +
        ∡ (chart.point q1) (chart.point p) (chart.point q2) := by
  change (2 : ℤ) •
      (((chart.chordArg q1 q2 : ℝ) : Real.Angle) -
        ((chart.chordArg p q1 : ℝ) : Real.Angle)) = _
  rw [chart.chordArg_lifts hq1q2, chart.chordArg_lifts hpq1]
  exact two_zsmul_first_chord_turn_eq_pi_add_apex_oangle
    hpq1Points hq1q2Points heq

/-- Equation (60) modulo `2π`, read directly from a lifted chart and an
equal-radius pair. -/
theorem chart_last_isosceles_chord_identity_mod_two_pi
    (chart : CounterclockwiseAngleChart) {q1 q2 cycleEnd : ℕ}
    (hq1q2 : q1 < q2) (hq2end : q2 < cycleEnd)
    (hendq1Points : chart.point cycleEnd ≠ chart.point q1)
    (hendq2Points : chart.point cycleEnd ≠ chart.point q2)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (heq : dist (chart.point cycleEnd) (chart.point q1) =
      dist (chart.point cycleEnd) (chart.point q2)) :
    (2 : ℤ) •
        ((chart.chordArg q2 cycleEnd - chart.chordArg q1 q2 : ℝ) :
          Real.Angle) =
      (Real.pi : Real.Angle) +
        ∡ (chart.point q1) (chart.point cycleEnd) (chart.point q2) := by
  change (2 : ℤ) •
      (((chart.chordArg q2 cycleEnd : ℝ) : Real.Angle) -
        ((chart.chordArg q1 q2 : ℝ) : Real.Angle)) = _
  rw [chart.chordArg_lifts hq2end, chart.chordArg_lifts hq1q2]
  exact two_zsmul_last_chord_turn_eq_pi_add_apex_oangle
    hendq1Points hendq2Points hq1q2Points heq

/-- Select the positive real branch of the doubled isosceles turn identity.
The hypotheses are exactly the principal-branch bounds furnished by a strict
convex turn and a positively oriented nondegenerate apex angle. -/
theorem real_turn_eq_pi_div_two_add_half_of_two_zsmul
    {x a : ℝ} (hxpos : 0 < x) (hxpi : x ≤ Real.pi)
    (hapos : 0 < a) (hapi : a < Real.pi)
    (hdouble :
      (2 : ℤ) • ((x : ℝ) : Real.Angle) =
        (Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle)) :
    x = Real.pi / 2 + a / 2 := by
  have hxReal : (((x : ℝ) : Real.Angle).toReal) = x :=
    Real.Angle.toReal_coe_eq_self_iff.mpr
      ⟨by linarith [Real.pi_pos], hxpi⟩
  have hright :
      ((Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle)).toReal =
        a - Real.pi := by
    change (((Real.pi + a : ℝ) : Real.Angle).toReal) = a - Real.pi
    have h :=
      (Real.Angle.toReal_coe_eq_self_sub_two_pi_iff
        (θ := Real.pi + a)).mpr
        ⟨by linarith, by linarith [Real.pi_pos]⟩
    linarith
  have hreal := congrArg Real.Angle.toReal hdouble
  rw [hright] at hreal
  by_cases hxhalf : x ≤ Real.pi / 2
  · have hleft :
        ((2 : ℤ) • ((x : ℝ) : Real.Angle)).toReal = 2 * x := by
      have hraw :=
        (Real.Angle.two_zsmul_toReal_eq_two_mul
          (θ := ((x : ℝ) : Real.Angle))).mpr
        (by rw [hxReal]; exact ⟨by linarith [Real.pi_pos], hxhalf⟩)
      simpa [hxReal] using hraw
    rw [hleft] at hreal
    linarith
  · have hxhalf' : Real.pi / 2 < x := lt_of_not_ge hxhalf
    have hleft :
        ((2 : ℤ) • ((x : ℝ) : Real.Angle)).toReal =
          2 * x - 2 * Real.pi := by
      have hraw :=
        (Real.Angle.two_zsmul_toReal_eq_two_mul_sub_two_pi
          (θ := ((x : ℝ) : Real.Angle))).mpr (by rwa [hxReal])
      simpa [hxReal] using hraw
    rw [hleft] at hreal
    linarith

/-- Real-lift form of equation (59), derived from equal radius, positive apex
orientation, and the chart's strict-convex turn bound. -/
theorem chart_first_isosceles_chord_identity
    (chart : CounterclockwiseAngleChart) {p q1 q2 : ℕ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2)
    (hpq1Points : chart.point p ≠ chart.point q1)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (heq : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2))
    (hsign :
      (∡ (chart.point q1) (chart.point p) (chart.point q2)).sign = 1) :
    chart.chordArg q1 q2 - chart.chordArg p q1 =
      Real.pi / 2 +
        (∡ (chart.point q1) (chart.point p) (chart.point q2)).toReal / 2 := by
  let x := chart.chordArg q1 q2 - chart.chordArg p q1
  let a := (∡ (chart.point q1) (chart.point p) (chart.point q2)).toReal
  rcases chart.chordArg_bounds hpq1 with ⟨_hpq1Lower, hpq1Upper⟩
  rcases chart.chordArg_bounds hq1q2 with ⟨hq1q2Lower, _hq1q2Upper⟩
  have hedge : chart.edgeArg (q1 - 1) < chart.edgeArg q1 := by
    apply chart.edgeArg_strictMono
    omega
  have hxpos : 0 < x := by
    dsimp [x]
    linarith
  have hxpi : x ≤ Real.pi := chart.chordTurn_le_pi hpq1 hq1q2
  have haRange : a ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [a]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  have hdouble := chart_first_isosceles_chord_identity_mod_two_pi chart
    hpq1 hq1q2 hpq1Points hq1q2Points heq
  have hdouble' :
      (2 : ℤ) • ((x : ℝ) : Real.Angle) =
        (Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle) := by
    simpa [x, a] using hdouble
  exact real_turn_eq_pi_div_two_add_half_of_two_zsmul
    hxpos hxpi haRange.1 haRange.2 hdouble'

/-- Real-lift form of equation (60), derived from equal radius, positive apex
orientation, and the chart's strict-convex turn bound. -/
theorem chart_last_isosceles_chord_identity
    (chart : CounterclockwiseAngleChart) {q1 q2 cycleEnd : ℕ}
    (hq1q2 : q1 < q2) (hq2end : q2 < cycleEnd)
    (hendq1Points : chart.point cycleEnd ≠ chart.point q1)
    (hendq2Points : chart.point cycleEnd ≠ chart.point q2)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (heq : dist (chart.point cycleEnd) (chart.point q1) =
      dist (chart.point cycleEnd) (chart.point q2))
    (hsign :
      (∡ (chart.point q1) (chart.point cycleEnd) (chart.point q2)).sign = 1) :
    chart.chordArg q2 cycleEnd - chart.chordArg q1 q2 =
      Real.pi / 2 +
        (∡ (chart.point q1) (chart.point cycleEnd)
          (chart.point q2)).toReal / 2 := by
  let x := chart.chordArg q2 cycleEnd - chart.chordArg q1 q2
  let a :=
    (∡ (chart.point q1) (chart.point cycleEnd) (chart.point q2)).toReal
  rcases chart.chordArg_bounds hq1q2 with ⟨_hq1q2Lower, hq1q2Upper⟩
  rcases chart.chordArg_bounds hq2end with ⟨hq2endLower, _hq2endUpper⟩
  have hedge : chart.edgeArg (q2 - 1) < chart.edgeArg q2 := by
    apply chart.edgeArg_strictMono
    omega
  have hxpos : 0 < x := by
    dsimp [x]
    linarith
  have hxpi : x ≤ Real.pi := chart.chordTurn_le_pi hq1q2 hq2end
  have haRange : a ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [a]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  have hdouble := chart_last_isosceles_chord_identity_mod_two_pi chart
    hq1q2 hq2end hendq1Points hendq2Points hq1q2Points heq
  have hdouble' :
      (2 : ℤ) • ((x : ℝ) : Real.Angle) =
        (Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle) := by
    simpa [x, a] using hdouble
  exact real_turn_eq_pi_div_two_add_half_of_two_zsmul
    hxpos hxpi haRange.1 haRange.2 hdouble'

/-- Interior exterior-curvature spread `K(i,j) = φ_(j-1) - φ_i`. -/
def arcCurvature (chart : CounterclockwiseAngleChart) (i j : ℕ) : ℝ :=
  chart.edgeArg (j - 1) - chart.edgeArg i

/-- Exterior turn `τ_k = φ_k - φ_(k-1)` at the lifted vertex `k`. -/
def exteriorTurn (chart : CounterclockwiseAngleChart) (k : ℕ) : ℝ :=
  chart.edgeArg k - chart.edgeArg (k - 1)

/-- The exterior turns on a nonempty closed natural-number interval telescope.
In particular, both endpoint turns occur in the sum. -/
theorem sum_exterior_turn_Icc
    (chart : CounterclockwiseAngleChart) {m n : ℕ}
    (hmn : m ≤ n) :
    ∑ k ∈ Finset.Icc m n, exteriorTurn chart k =
      chart.edgeArg n - chart.edgeArg (m - 1) := by
  induction n, hmn using Nat.le_induction with
  | base =>
      simp [exteriorTurn]
  | succ n hmn ih =>
      have hinterval :
          insert (n + 1) (Finset.Icc m n) = Finset.Icc m (n + 1) := by
        ext k
        simp only [Finset.mem_insert, Finset.mem_Icc]
        omega
      rw [← hinterval]
      rw [Finset.sum_insert]
      · rw [ih]
        simp [exteriorTurn]
      · simp

/-- Quantitative chord-bound form of Lemmas 30 and 37.

The hypotheses `hfirst` and `hlast` are precisely the unwrapped isosceles
chord-direction formulas (59) and (60).  Weak chord-direction bounds then give
the four estimates (102) and (103). -/
theorem middle_target_curvature_lower_bounds
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ} {a c : ℝ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < cycleEnd)
    (hfirst : chart.chordArg q1 q2 - chart.chordArg p q1 =
      Real.pi / 2 + a / 2)
    (hlast : chart.chordArg q4 cycleEnd - chart.chordArg q3 q4 =
      Real.pi / 2 + c / 2) :
    Real.pi / 2 + a / 2 ≤ arcCurvature chart p q2 ∧
      Real.pi / 2 + a / 2 ≤ arcCurvature chart p q3 ∧
      Real.pi / 2 + c / 2 ≤ arcCurvature chart q2 cycleEnd ∧
      Real.pi / 2 + c / 2 ≤ arcCurvature chart q3 cycleEnd := by
  rcases chart.chordArg_bounds hpq1 with ⟨hpq1Lower, _hpq1Upper⟩
  rcases chart.chordArg_bounds hq1q2 with ⟨_hq1q2Lower, hq1q2Upper⟩
  rcases chart.chordArg_bounds hq3q4 with ⟨hq3q4Lower, _hq3q4Upper⟩
  rcases chart.chordArg_bounds hq4end with ⟨_hq4endLower, hq4endUpper⟩
  have hfirstBound :
      Real.pi / 2 + a / 2 ≤ arcCurvature chart p q2 := by
    simp only [arcCurvature]
    linarith
  have hlastBound :
      Real.pi / 2 + c / 2 ≤ arcCurvature chart q3 cycleEnd := by
    simp only [arcCurvature]
    linarith
  have hq2PredLeQ3Pred : q2 - 1 ≤ q3 - 1 := by omega
  have hedgeQ2Q3 : chart.edgeArg (q2 - 1) ≤ chart.edgeArg (q3 - 1) :=
    chart.edgeArg_strictMono.monotone hq2PredLeQ3Pred
  have hfirstExtended :
      Real.pi / 2 + a / 2 ≤ arcCurvature chart p q3 := by
    simp only [arcCurvature] at hfirstBound ⊢
    linarith
  have hedgeQ2Q3Start : chart.edgeArg q2 ≤ chart.edgeArg q3 :=
    chart.edgeArg_strictMono.monotone hq2q3.le
  have hlastExtended :
      Real.pi / 2 + c / 2 ≤ arcCurvature chart q2 cycleEnd := by
    simp only [arcCurvature] at hlastBound ⊢
    linarith
  exact ⟨hfirstBound, hfirstExtended, hlastExtended, hlastBound⟩

/-- Lemma 30, geometric core: each middle target consumes strictly more than
one quarter-turn of curvature on each side of the center. -/
theorem two_sided_quarter_turn_separation
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ} {a c : ℝ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < cycleEnd)
    (ha : 0 < a) (hc : 0 < c)
    (hfirst : chart.chordArg q1 q2 - chart.chordArg p q1 =
      Real.pi / 2 + a / 2)
    (hlast : chart.chordArg q4 cycleEnd - chart.chordArg q3 q4 =
      Real.pi / 2 + c / 2) :
    Real.pi / 2 < arcCurvature chart p q2 ∧
      Real.pi / 2 < arcCurvature chart p q3 ∧
      Real.pi / 2 < arcCurvature chart q2 cycleEnd ∧
      Real.pi / 2 < arcCurvature chart q3 cycleEnd := by
  rcases middle_target_curvature_lower_bounds chart hpq1 hq1q2 hq2q3
      hq3q4 hq4end hfirst hlast with ⟨hpq2, hpq3, hq2end, hq3end⟩
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

/-- Exact complementary-arc accounting used in Lemma 37.

The two open curvature arcs, the center turn, and the closed middle arc
partition one full `2π` turn. -/
theorem exact_complementary_arc_accounting
    (chart : CounterclockwiseAngleChart)
    {p q2 q3 cycleEnd : ℕ}
    (_hp : 0 < p) (hq2q3 : q2 ≤ q3)
    (hperiod : chart.edgeArg (cycleEnd - 1) =
      chart.edgeArg (p - 1) + 2 * Real.pi) :
    arcCurvature chart p q2 +
        (exteriorTurn chart p +
          ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k) +
        arcCurvature chart q3 cycleEnd =
      2 * Real.pi := by
  rw [sum_exterior_turn_Icc chart hq2q3]
  simp only [arcCurvature, exteriorTurn]
  rw [hperiod]
  ring

/-- Lemma 37: the center turn plus the closed middle-arc turns has budget at
most `π - (a+c)/2`, and hence is strictly below `π` for positive endpoint
angles.  The `Finset.Icc` sum contains both `q2` and `q3`. -/
theorem closed_middle_arc_add_center_turn_lt_pi
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ} {a c : ℝ}
    (_hp : 0 < p)
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < cycleEnd)
    (ha : 0 < a) (hc : 0 < c)
    (hfirst : chart.chordArg q1 q2 - chart.chordArg p q1 =
      Real.pi / 2 + a / 2)
    (hlast : chart.chordArg q4 cycleEnd - chart.chordArg q3 q4 =
      Real.pi / 2 + c / 2)
    (hperiod : chart.edgeArg (cycleEnd - 1) =
      chart.edgeArg (p - 1) + 2 * Real.pi) :
    exteriorTurn chart p +
        ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k ≤
      Real.pi - (a + c) / 2 ∧
    exteriorTurn chart p +
        ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k <
      Real.pi := by
  rcases middle_target_curvature_lower_bounds chart hpq1 hq1q2 hq2q3
      hq3q4 hq4end hfirst hlast with ⟨hpq2, _hpq3, _hq2end, hq3end⟩
  have hsum := sum_exterior_turn_Icc chart hq2q3.le
  have hbudget :
      exteriorTurn chart p +
          ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k ≤
        Real.pi - (a + c) / 2 := by
    rw [hsum]
    simp only [arcCurvature, exteriorTurn] at hpq2 hq3end ⊢
    linarith
  exact ⟨hbudget, by linarith⟩

/-- The two real isosceles chord identities needed by Lemmas 30 and 37,
derived from actual equal-distance data at the periodically identified center.
-/
theorem shell_endpoint_isosceles_chord_identities
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2)
    (hq2q3 : q2 < q3) (hq3q4 : q3 < q4)
    (hq4end : q4 < cycleEnd)
    (hpointPeriod : chart.point cycleEnd = chart.point p)
    (hpq1Points : chart.point p ≠ chart.point q1)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (hpq3Points : chart.point p ≠ chart.point q3)
    (hpq4Points : chart.point p ≠ chart.point q4)
    (hq3q4Points : chart.point q3 ≠ chart.point q4)
    (heqFirst : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2))
    (heqLast : dist (chart.point p) (chart.point q3) =
      dist (chart.point p) (chart.point q4)) :
    chart.chordArg q1 q2 - chart.chordArg p q1 =
        Real.pi / 2 +
          (∡ (chart.point q1) (chart.point p)
            (chart.point q2)).toReal / 2 ∧
      chart.chordArg q4 cycleEnd - chart.chordArg q3 q4 =
        Real.pi / 2 +
          (∡ (chart.point q3) (chart.point p)
            (chart.point q4)).toReal / 2 := by
  have hsignFirst := chart.apex_sign_pos hpq1 hq1q2
  have hfirst := chart_first_isosceles_chord_identity chart hpq1 hq1q2
    hpq1Points hq1q2Points heqFirst hsignFirst
  have hendq3Points : chart.point cycleEnd ≠ chart.point q3 := by
    simpa [hpointPeriod] using hpq3Points
  have hendq4Points : chart.point cycleEnd ≠ chart.point q4 := by
    simpa [hpointPeriod] using hpq4Points
  have heqLastEnd : dist (chart.point cycleEnd) (chart.point q3) =
      dist (chart.point cycleEnd) (chart.point q4) := by
    simpa [hpointPeriod] using heqLast
  have hpq3 : p < q3 := hpq1.trans (hq1q2.trans hq2q3)
  have hsignLast := chart.apex_sign_pos hpq3 hq3q4
  have hsignLastEnd :
      (∡ (chart.point q3) (chart.point cycleEnd)
        (chart.point q4)).sign = 1 := by
    simpa [hpointPeriod] using hsignLast
  have hlast := chart_last_isosceles_chord_identity chart hq3q4 hq4end
    hendq3Points hendq4Points hq3q4Points heqLastEnd hsignLastEnd
  exact ⟨hfirst, by simpa [hpointPeriod] using hlast⟩

/-- Lemma 30, equal-radius geometric core.  Four ordered targets provide two
middle targets, each separated from the center by more than a quarter-turn on
both complementary boundary arcs. -/
theorem two_sided_quarter_turn_separation_of_equal_radius
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ}
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < cycleEnd)
    (hpointPeriod : chart.point cycleEnd = chart.point p)
    (hpq1Points : chart.point p ≠ chart.point q1)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (hpq3Points : chart.point p ≠ chart.point q3)
    (hpq4Points : chart.point p ≠ chart.point q4)
    (hq3q4Points : chart.point q3 ≠ chart.point q4)
    (heqFirst : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2))
    (heqLast : dist (chart.point p) (chart.point q3) =
      dist (chart.point p) (chart.point q4)) :
    Real.pi / 2 < arcCurvature chart p q2 ∧
      Real.pi / 2 < arcCurvature chart p q3 ∧
      Real.pi / 2 < arcCurvature chart q2 cycleEnd ∧
      Real.pi / 2 < arcCurvature chart q3 cycleEnd := by
  rcases shell_endpoint_isosceles_chord_identities chart hpq1 hq1q2
      hq2q3 hq3q4 hq4end hpointPeriod hpq1Points hq1q2Points
      hpq3Points hpq4Points hq3q4Points heqFirst heqLast with
    ⟨hfirst, hlast⟩
  have hsignFirst := chart.apex_sign_pos hpq1 hq1q2
  have hpq3 : p < q3 := hpq1.trans (hq1q2.trans hq2q3)
  have hsignLast := chart.apex_sign_pos hpq3 hq3q4
  have haRange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsignFirst
  have hcRange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsignLast
  exact two_sided_quarter_turn_separation chart hpq1 hq1q2 hq2q3
    hq3q4 hq4end haRange.1 hcRange.1 hfirst hlast

/-- Lemma 37 from actual equal-radius endpoint pairs.  The output sum is over
`Finset.Icc q2 q3`, so both middle-arc endpoint turns are included. -/
theorem closed_middle_arc_add_center_turn_lt_pi_of_equal_radius
    (chart : CounterclockwiseAngleChart)
    {p q1 q2 q3 q4 cycleEnd : ℕ}
    (_hp : 0 < p)
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < cycleEnd)
    (hpointPeriod : chart.point cycleEnd = chart.point p)
    (hedgePeriod : chart.edgeArg (cycleEnd - 1) =
      chart.edgeArg (p - 1) + 2 * Real.pi)
    (hpq1Points : chart.point p ≠ chart.point q1)
    (hq1q2Points : chart.point q1 ≠ chart.point q2)
    (hpq3Points : chart.point p ≠ chart.point q3)
    (hpq4Points : chart.point p ≠ chart.point q4)
    (hq3q4Points : chart.point q3 ≠ chart.point q4)
    (heqFirst : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2))
    (heqLast : dist (chart.point p) (chart.point q3) =
      dist (chart.point p) (chart.point q4)) :
    exteriorTurn chart p +
        ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k ≤
      Real.pi -
        ((∡ (chart.point q1) (chart.point p)
            (chart.point q2)).toReal +
          (∡ (chart.point q3) (chart.point p)
            (chart.point q4)).toReal) / 2 ∧
    exteriorTurn chart p +
        ∑ k ∈ Finset.Icc q2 q3, exteriorTurn chart k <
      Real.pi := by
  rcases shell_endpoint_isosceles_chord_identities chart hpq1 hq1q2
      hq2q3 hq3q4 hq4end hpointPeriod hpq1Points hq1q2Points
      hpq3Points hpq4Points hq3q4Points heqFirst heqLast with
    ⟨hfirst, hlast⟩
  have hsignFirst := chart.apex_sign_pos hpq1 hq1q2
  have hpq3 : p < q3 := hpq1.trans (hq1q2.trans hq2q3)
  have hsignLast := chart.apex_sign_pos hpq3 hq3q4
  have haRange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsignFirst
  have hcRange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsignLast
  exact closed_middle_arc_add_center_turn_lt_pi chart _hp hpq1 hq1q2
    hq2q3 hq3q4 hq4end haRange.1 hcRange.1 hfirst hlast hedgePeriod

/- ## Open-fundamental-window repair

The original global chart above remains available for backward compatibility.
Its unrestricted ordered-triple field is too strong for a caller that also
identifies a later lifted endpoint with the initial point.  The finite chart
below scopes strict orientation and injectivity to one open fundamental
window.  It excludes only the degenerate full-window chord; all proper chord
and edge lifts remain tied to the actual Euclidean points through `arcAngle`.
-/

/-- A proper chord in one lifted fundamental window.  The full chord from the
start to its repeated endpoint is deliberately excluded. -/
def IsProperFundamentalWindowChord
    (windowStart windowEnd i j : ℕ) : Prop :=
  windowStart ≤ i ∧ i < j ∧ j ≤ windowEnd ∧
    ¬ (i = windowStart ∧ j = windowEnd)

/-- A finite lifted angle chart over one open polygon cycle.

The endpoint repeats the start, while strict orientation and injectivity see
only the distinct vertices in `[windowStart, windowEnd)`. -/
structure OpenFundamentalWindowAngleChart where
  windowStart : ℕ
  windowEnd : ℕ
  windowStart_lt_windowEnd : windowStart < windowEnd
  point : ℕ → ℝ²
  edgeArg : ℕ → ℝ
  chordArg : ℕ → ℕ → ℝ
  point_period : point windowEnd = point windowStart
  point_injective_before_end :
    ∀ {i j}, windowStart ≤ i → i < windowEnd →
      windowStart ≤ j → j < windowEnd → point i = point j → i = j
  edgeArg_lifts : ∀ {i}, windowStart ≤ i → i < windowEnd →
    ((edgeArg i : ℝ) : Real.Angle) = arcAngle (point i) (point (i + 1))
  chordArg_lifts :
    ∀ {i j}, IsProperFundamentalWindowChord windowStart windowEnd i j →
      ((chordArg i j : ℝ) : Real.Angle) = arcAngle (point i) (point j)
  edgeArg_strictMono :
    ∀ {i j}, windowStart ≤ i → i < j → j < windowEnd →
      edgeArg i < edgeArg j
  orderedTriple_sign_neg :
    ∀ {i j k}, windowStart ≤ i → i < j → j < k → k < windowEnd →
      (∡ (point i) (point j) (point k)).sign = -1
  chordArg_bounds :
    ∀ {i j}, IsProperFundamentalWindowChord windowStart windowEnd i j →
      edgeArg i ≤ chordArg i j ∧ chordArg i j ≤ edgeArg (j - 1)
  chordTurn_le_pi :
    ∀ {i j k}, windowStart ≤ i → i < j → j < k → k ≤ windowEnd →
      chordArg j k - chordArg i j ≤ Real.pi

/-- Exterior-curvature spread inside one open fundamental window. -/
def openWindowArcCurvature
    (chart : OpenFundamentalWindowAngleChart) (i j : ℕ) : ℝ :=
  chart.edgeArg (j - 1) - chart.edgeArg i

/-- The open-window orientation gives the positive apex orientation at the
first point of an increasing triple. -/
theorem OpenFundamentalWindowAngleChart.apex_sign_pos
    (chart : OpenFundamentalWindowAngleChart) {p q1 q2 : ℕ}
    (hstart : chart.windowStart ≤ p) (hpq1 : p < q1)
    (hq1q2 : q1 < q2) (hq2end : q2 < chart.windowEnd) :
    (∡ (chart.point q1) (chart.point p) (chart.point q2)).sign = 1 := by
  have hordered := chart.orderedTriple_sign_neg hstart hpq1 hq1q2 hq2end
  have hrotate :
      (∡ (chart.point q2) (chart.point p) (chart.point q1)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign,
      EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (chart.point q2) (chart.point p) (chart.point q1)
  rw [hrotate] at hswap
  simpa using hswap.symm

private theorem isProperFundamentalWindowChord_of_chain
    (chart : OpenFundamentalWindowAngleChart) {i j : ℕ}
    (hstart : chart.windowStart ≤ i) (hij : i < j)
    (hjend : j ≤ chart.windowEnd)
    (hnotFull : i ≠ chart.windowStart ∨ j ≠ chart.windowEnd) :
    IsProperFundamentalWindowChord chart.windowStart chart.windowEnd i j := by
  refine ⟨hstart, hij, hjend, ?_⟩
  rintro ⟨rfl, rfl⟩
  exact hnotFull.elim (fun h ↦ h rfl) (fun h ↦ h rfl)

/-- First endpoint isosceles identity on an open fundamental window. -/
theorem openWindow_first_isosceles_chord_identity
    (chart : OpenFundamentalWindowAngleChart) {p q1 q2 : ℕ}
    (hstart : chart.windowStart ≤ p) (hpq1 : p < q1)
    (hq1q2 : q1 < q2) (hq2end : q2 < chart.windowEnd)
    (heq : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2)) :
    chart.chordArg q1 q2 - chart.chordArg p q1 =
      Real.pi / 2 +
        (∡ (chart.point q1) (chart.point p)
          (chart.point q2)).toReal / 2 := by
  have hpEnd : p < chart.windowEnd := hpq1.trans (hq1q2.trans hq2end)
  have hq1End : q1 < chart.windowEnd := hq1q2.trans hq2end
  have hpq1Points : chart.point p ≠ chart.point q1 := by
    intro h
    exact (Nat.ne_of_lt hpq1) (chart.point_injective_before_end hstart hpEnd
      (hstart.trans hpq1.le) hq1End h)
  have hq1q2Points : chart.point q1 ≠ chart.point q2 := by
    intro h
    exact (Nat.ne_of_lt hq1q2) (chart.point_injective_before_end
      (hstart.trans hpq1.le) hq1End
      (hstart.trans (hpq1.trans hq1q2).le) hq2end h)
  have hpq1Proper := isProperFundamentalWindowChord_of_chain chart
    hstart hpq1 hq1End.le (Or.inr (Nat.ne_of_lt hq1End))
  have hq1q2Proper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans hpq1.le) hq1q2 hq2end.le
    (Or.inr (Nat.ne_of_lt hq2end))
  let x := chart.chordArg q1 q2 - chart.chordArg p q1
  let a := (∡ (chart.point q1) (chart.point p) (chart.point q2)).toReal
  rcases chart.chordArg_bounds hpq1Proper with
    ⟨_hpq1Lower, hpq1Upper⟩
  rcases chart.chordArg_bounds hq1q2Proper with
    ⟨hq1q2Lower, _hq1q2Upper⟩
  have hedge : chart.edgeArg (q1 - 1) < chart.edgeArg q1 := by
    apply chart.edgeArg_strictMono
    · omega
    · omega
    · exact hq1End
  have hxpos : 0 < x := by
    dsimp [x]
    linarith
  have hxpi : x ≤ Real.pi :=
    chart.chordTurn_le_pi hstart hpq1 hq1q2 hq2end.le
  have hsign := chart.apex_sign_pos hstart hpq1 hq1q2 hq2end
  have haRange : a ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [a]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  have hdoubleRaw :=
    two_zsmul_first_chord_turn_eq_pi_add_apex_oangle
      hpq1Points hq1q2Points heq
  have hdouble :
      (2 : ℤ) •
          (((chart.chordArg q1 q2 : ℝ) : Real.Angle) -
            ((chart.chordArg p q1 : ℝ) : Real.Angle)) =
        (Real.pi : Real.Angle) +
          ∡ (chart.point q1) (chart.point p) (chart.point q2) := by
    rw [chart.chordArg_lifts hq1q2Proper,
      chart.chordArg_lifts hpq1Proper]
    exact hdoubleRaw
  have hdouble' :
      (2 : ℤ) • ((x : ℝ) : Real.Angle) =
        (Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle) := by
    simpa [x, a] using hdouble
  exact real_turn_eq_pi_div_two_add_half_of_two_zsmul
    hxpos hxpi haRange.1 haRange.2 hdouble'

/-- Last endpoint isosceles identity.  The repeated endpoint is substituted
only after the orientation fact has been obtained inside the open window. -/
theorem openWindow_last_isosceles_chord_identity
    (chart : OpenFundamentalWindowAngleChart) {p q3 q4 : ℕ}
    (hstart : chart.windowStart ≤ p) (hpq3 : p < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < chart.windowEnd)
    (hpointPeriod : chart.point chart.windowEnd = chart.point p)
    (heq : dist (chart.point p) (chart.point q3) =
      dist (chart.point p) (chart.point q4)) :
    chart.chordArg q4 chart.windowEnd - chart.chordArg q3 q4 =
      Real.pi / 2 +
        (∡ (chart.point q3) (chart.point p)
          (chart.point q4)).toReal / 2 := by
  have hpEnd : p < chart.windowEnd := hpq3.trans (hq3q4.trans hq4end)
  have hq3End : q3 < chart.windowEnd := hq3q4.trans hq4end
  have hpq3Points : chart.point p ≠ chart.point q3 := by
    intro h
    exact (Nat.ne_of_lt hpq3) (chart.point_injective_before_end hstart hpEnd
      (hstart.trans hpq3.le) hq3End h)
  have hpq4Points : chart.point p ≠ chart.point q4 := by
    intro h
    exact (Nat.ne_of_lt (hpq3.trans hq3q4))
      (chart.point_injective_before_end hstart hpEnd
        (hstart.trans (hpq3.trans hq3q4).le) hq4end h)
  have hq3q4Points : chart.point q3 ≠ chart.point q4 := by
    intro h
    exact (Nat.ne_of_lt hq3q4) (chart.point_injective_before_end
      (hstart.trans hpq3.le) hq3End
      (hstart.trans (hpq3.trans hq3q4).le) hq4end h)
  have hq3q4Proper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans hpq3.le) hq3q4 hq4end.le
    (Or.inr (Nat.ne_of_lt hq4end))
  have hq4EndProper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans (hpq3.trans hq3q4).le) hq4end le_rfl
    (Or.inl (Nat.ne_of_gt (lt_of_le_of_lt hstart
      (hpq3.trans hq3q4))))
  let x := chart.chordArg q4 chart.windowEnd - chart.chordArg q3 q4
  let a := (∡ (chart.point q3) (chart.point p) (chart.point q4)).toReal
  rcases chart.chordArg_bounds hq3q4Proper with
    ⟨_hq3q4Lower, hq3q4Upper⟩
  rcases chart.chordArg_bounds hq4EndProper with
    ⟨hq4EndLower, _hq4EndUpper⟩
  have hedge : chart.edgeArg (q4 - 1) < chart.edgeArg q4 := by
    apply chart.edgeArg_strictMono
    · omega
    · omega
    · exact hq4end
  have hxpos : 0 < x := by
    dsimp [x]
    linarith
  have hxpi : x ≤ Real.pi :=
    chart.chordTurn_le_pi (hstart.trans hpq3.le) hq3q4 hq4end le_rfl
  have hsign := chart.apex_sign_pos hstart hpq3 hq3q4 hq4end
  have haRange : a ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [a]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  have hendq3Points : chart.point chart.windowEnd ≠ chart.point q3 := by
    simpa [hpointPeriod] using hpq3Points
  have hendq4Points : chart.point chart.windowEnd ≠ chart.point q4 := by
    simpa [hpointPeriod] using hpq4Points
  have heqEnd : dist (chart.point chart.windowEnd) (chart.point q3) =
      dist (chart.point chart.windowEnd) (chart.point q4) := by
    simpa [hpointPeriod] using heq
  have hdoubleRaw :=
    two_zsmul_last_chord_turn_eq_pi_add_apex_oangle
      hendq3Points hendq4Points hq3q4Points heqEnd
  have hdouble :
      (2 : ℤ) •
          (((chart.chordArg q4 chart.windowEnd : ℝ) : Real.Angle) -
            ((chart.chordArg q3 q4 : ℝ) : Real.Angle)) =
        (Real.pi : Real.Angle) +
          ∡ (chart.point q3) (chart.point chart.windowEnd)
            (chart.point q4) := by
    rw [chart.chordArg_lifts hq4EndProper,
      chart.chordArg_lifts hq3q4Proper]
    exact hdoubleRaw
  have hdouble' :
      (2 : ℤ) • ((x : ℝ) : Real.Angle) =
        (Real.pi : Real.Angle) + ((a : ℝ) : Real.Angle) := by
    simpa [x, a, hpointPeriod] using hdouble
  exact real_turn_eq_pi_div_two_add_half_of_two_zsmul
    hxpos hxpi haRange.1 haRange.2 hdouble'

/-- Nonvacuous repaired form of the shell-curvature quarter-turn theorem.
All strict orientation hypotheses live before the repeated endpoint. -/
theorem openWindow_two_sided_quarter_turn_separation_of_equal_radius
    (chart : OpenFundamentalWindowAngleChart)
    {p q1 q2 q3 q4 : ℕ}
    (hstart : chart.windowStart ≤ p)
    (hpq1 : p < q1) (hq1q2 : q1 < q2) (hq2q3 : q2 < q3)
    (hq3q4 : q3 < q4) (hq4end : q4 < chart.windowEnd)
    (hpointPeriod : chart.point chart.windowEnd = chart.point p)
    (heqFirst : dist (chart.point p) (chart.point q1) =
      dist (chart.point p) (chart.point q2))
    (heqLast : dist (chart.point p) (chart.point q3) =
      dist (chart.point p) (chart.point q4)) :
    Real.pi / 2 < openWindowArcCurvature chart p q2 ∧
      Real.pi / 2 < openWindowArcCurvature chart p q3 ∧
      Real.pi / 2 < openWindowArcCurvature chart q2 chart.windowEnd ∧
      Real.pi / 2 < openWindowArcCurvature chart q3 chart.windowEnd := by
  have hq2End : q2 < chart.windowEnd :=
    hq2q3.trans (hq3q4.trans hq4end)
  have hq3End : q3 < chart.windowEnd := hq3q4.trans hq4end
  have hpq1Proper := isProperFundamentalWindowChord_of_chain chart
    hstart hpq1 (hq1q2.trans hq2End).le
    (Or.inr (Nat.ne_of_lt (hq1q2.trans hq2End)))
  have hq1q2Proper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans hpq1.le) hq1q2 hq2End.le
    (Or.inr (Nat.ne_of_lt hq2End))
  have hq3q4Proper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans (hpq1.trans (hq1q2.trans hq2q3)).le)
    hq3q4 hq4end.le (Or.inr (Nat.ne_of_lt hq4end))
  have hq4EndProper := isProperFundamentalWindowChord_of_chain chart
    (hstart.trans (hpq1.trans
      (hq1q2.trans (hq2q3.trans hq3q4))).le)
    hq4end le_rfl
    (Or.inl (Nat.ne_of_gt (lt_of_le_of_lt hstart
      (hpq1.trans (hq1q2.trans (hq2q3.trans hq3q4))))))
  have hfirst := openWindow_first_isosceles_chord_identity chart
    hstart hpq1 hq1q2 hq2End heqFirst
  have hpq3 : p < q3 := hpq1.trans (hq1q2.trans hq2q3)
  have hlast := openWindow_last_isosceles_chord_identity chart
    hstart hpq3 hq3q4 hq4end hpointPeriod heqLast
  rcases chart.chordArg_bounds hpq1Proper with
    ⟨hpq1Lower, _hpq1Upper⟩
  rcases chart.chordArg_bounds hq1q2Proper with
    ⟨_hq1q2Lower, hq1q2Upper⟩
  rcases chart.chordArg_bounds hq3q4Proper with
    ⟨hq3q4Lower, _hq3q4Upper⟩
  rcases chart.chordArg_bounds hq4EndProper with
    ⟨_hq4EndLower, hq4EndUpper⟩
  have hfirstBound :
      Real.pi / 2 +
          (∡ (chart.point q1) (chart.point p)
            (chart.point q2)).toReal / 2 ≤
        openWindowArcCurvature chart p q2 := by
    simp only [openWindowArcCurvature]
    linarith
  have hlastBound :
      Real.pi / 2 +
          (∡ (chart.point q3) (chart.point p)
            (chart.point q4)).toReal / 2 ≤
        openWindowArcCurvature chart q3 chart.windowEnd := by
    simp only [openWindowArcCurvature]
    linarith
  have hedgeQ2Q3 :
      chart.edgeArg (q2 - 1) ≤ chart.edgeArg (q3 - 1) := by
    by_cases h : q2 = q3
    · simp [h]
    · exact (chart.edgeArg_strictMono (by omega) (by omega) (by omega)).le
  have hfirstExtended :
      Real.pi / 2 +
          (∡ (chart.point q1) (chart.point p)
            (chart.point q2)).toReal / 2 ≤
        openWindowArcCurvature chart p q3 := by
    simp only [openWindowArcCurvature] at hfirstBound ⊢
    linarith
  have hedgeQ2Q3Start : chart.edgeArg q2 ≤ chart.edgeArg q3 :=
    (chart.edgeArg_strictMono (by omega) hq2q3 hq3End).le
  have hlastExtended :
      Real.pi / 2 +
          (∡ (chart.point q3) (chart.point p)
            (chart.point q4)).toReal / 2 ≤
        openWindowArcCurvature chart q2 chart.windowEnd := by
    simp only [openWindowArcCurvature] at hlastBound ⊢
    linarith
  have hfirstSign := chart.apex_sign_pos hstart hpq1 hq1q2 hq2End
  have hlastSign := chart.apex_sign_pos hstart hpq3 hq3q4 hq4end
  have hfirstPos :=
    (Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hfirstSign).1
  have hlastPos :=
    (Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hlastSign).1
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

end ShellCurvature
end Problem97
