import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Five-point Euclidean row obstruction

This module kernel-checks the nonlinear five-point cut emitted by the induced
metric CEGAR checker.  For five points in cyclic order `a < b < c < d < e`,
the two row patterns

```text
b : {a,e}
c : {a,b,d}
```

are impossible in the Euclidean plane.

This obstruction is not a consequence of the abstract strict Kalmanson
inequalities: its proof uses the two-dimensional dot/cross-product identity.
The low-level theorem states exactly the four orientation inequalities and
three metric equalities validated by the computational cut.  The public
boundary adapter derives those orientations from `IsCcwConvexPolygon`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FivePointEuclideanObstruction

open Census554.EqualityCore

private theorem row_identity
    (U X Y H wx wu xnorm : ℝ)
    (hlag : U * xnorm = X ^ 2 + Y ^ 2)
    (hcx : 2 * wx = xnorm)
    (hdot : U * wx = wu * X + H * Y)
    (hcu : 2 * wu = U) :
    X ^ 2 + Y ^ 2 = U * X + 2 * H * Y := by
  linear_combination -hlag - U * hcx + 2 * hdot + X * hcu

private theorem orientation_formula
    (U X Y H O wu : ℝ)
    (hraw : U * O = wu * Y - H * X + U * H - U * Y)
    (hcu : 2 * wu = U) :
    2 * U * O = 2 * H * (U - X) - U * Y := by
  linear_combination 2 * hraw + Y * hcu

private theorem key_identity
    (U X Y H O : ℝ)
    (hrow : X ^ 2 + Y ^ 2 = U * X + 2 * H * Y)
    (hO : 2 * U * O = 2 * H * (U - X) - U * Y) :
    2 * U * Y * O = -X * ((X - U) ^ 2 + Y ^ 2) := by
  linear_combination Y * hO - (U - X) * hrow

private theorem second_key_identity
    (U X Y H M N O : ℝ)
    (hcircleC : 2 * M * X + 2 * N * Y = X ^ 2 + Y ^ 2)
    (hcircleE : 4 * M * U + 8 * N * H = U ^ 2 + 4 * H ^ 2)
    (harea :
      2 * U * O =
        2 * (M - X) * (H - Y) - (N - Y) * (U - 2 * X)) :
    8 * U * (2 * H * X - U * Y) * O +
        (2 * H * Y + U * X) *
          ((2 * X - U) ^ 2 + 4 * (H - Y) ^ 2) =
      0 := by
  linear_combination
    4 * (2 * H * X - U * Y) * harea +
    2 * (4 * H ^ 2 - 4 * H * Y + U ^ 2 - 2 * U * X) * hcircleC +
    (-2 * H * Y - U * X + 2 * X ^ 2 + 2 * Y ^ 2) * hcircleE

private theorem second_algebraic_core
    (U X Y H M N O : ℝ)
    (hU : 0 < U)
    (hY : Y < 0)
    (hH : H < 0)
    (hK : 2 * H * X - U * Y < 0)
    (hO : O < 0)
    (hcircleC : 2 * M * X + 2 * N * Y = X ^ 2 + Y ^ 2)
    (hcircleE : 4 * M * U + 8 * N * H = U ^ 2 + 4 * H ^ 2)
    (harea :
      2 * U * O =
        2 * (M - X) * (H - Y) - (N - Y) * (U - 2 * X)) :
    False := by
  let K : ℝ := 2 * H * X - U * Y
  let P : ℝ := 2 * H * Y + U * X
  let R : ℝ := (2 * X - U) ^ 2 + 4 * (H - Y) ^ 2
  have hX : 0 < X := by
    by_contra h
    have hX_nonpos : X ≤ 0 := le_of_not_gt h
    have hHX_nonneg : 0 ≤ H * X :=
      mul_nonneg_of_nonpos_of_nonpos (le_of_lt hH) hX_nonpos
    have hUY_neg : U * Y < 0 := mul_neg_of_pos_of_neg hU hY
    nlinarith only [hK, hHX_nonneg, hUY_neg]
  have hP : 0 < P := by
    have hHY : 0 < H * Y := mul_pos_of_neg_of_neg hH hY
    have hUX : 0 < U * X := mul_pos hU hX
    dsimp [P]
    nlinarith only [hHY, hUX]
  have hR : 0 < R := by
    have hs₁ : 0 ≤ (2 * X - U) ^ 2 := sq_nonneg _
    have hs₂ : 0 ≤ (H - Y) ^ 2 := sq_nonneg _
    by_contra h
    have hR_nonpos : R ≤ 0 := le_of_not_gt h
    have h₁ : 2 * X = U := by
      dsimp [R] at hR_nonpos
      nlinarith only [hR_nonpos, hs₁, hs₂]
    have h₂ : H = Y := by
      dsimp [R] at hR_nonpos
      nlinarith only [hR_nonpos, hs₁, hs₂]
    have hK_zero : 2 * H * X - U * Y = 0 := by
      rw [h₂]
      linear_combination Y * h₁
    linarith only [hK, hK_zero]
  have hkey : 8 * U * K * O + P * R = 0 := by
    exact second_key_identity U X Y H M N O hcircleC hcircleE harea
  have hUK : U * K < 0 := mul_neg_of_pos_of_neg hU (by simpa [K] using hK)
  have hUKO : 0 < U * K * O := mul_pos_of_neg_of_neg hUK hO
  have hfirst : 0 < 8 * U * K * O := by
    have h8 : (0 : ℝ) < 8 := by norm_num
    simpa only [mul_assoc] using mul_pos h8 hUKO
  have hsecond : 0 < P * R := mul_pos hP hR
  nlinarith only [hkey, hfirst, hsecond]

set_option maxHeartbeats 800000 in
/-- The second direct Euclidean five-point obstruction emitted by the exact
terminal-row computation.

For cyclically ordered `a,b,c,d,e`, it is impossible for `d` to be
equidistant from `a,c,e` while `e` is equidistant from `a,b`.  Only the four
displayed orientation inequalities are used. -/
theorem false_of_second_three_rows_of_four_orientations
    {a b c d e : ℝ²}
    (habc : signedArea2 a b c < 0)
    (hcde : signedArea2 c d e < 0)
    (habe : signedArea2 a b e < 0)
    (hace : signedArea2 a c e < 0)
    (hda : dist d a = dist d c)
    (hdc : dist d c = dist d e)
    (hea : dist e a = dist e b) :
    False := by
  have hde : dist d a = dist d e := hda.trans hdc
  have hda_sq := congrArg (fun r : ℝ => r ^ 2) hda
  have hde_sq := congrArg (fun r : ℝ => r ^ 2) hde
  have hea_sq := congrArg (fun r : ℝ => r ^ 2) hea
  change dist d a ^ 2 = dist d c ^ 2 at hda_sq
  change dist d a ^ 2 = dist d e ^ 2 at hde_sq
  change dist e a ^ 2 = dist e b ^ 2 at hea_sq
  rw [dist_sq_coord, dist_sq_coord] at hda_sq hde_sq hea_sq
  let u₀ : ℝ := b 0 - a 0
  let u₁ : ℝ := b 1 - a 1
  let c₀ : ℝ := c 0 - a 0
  let c₁ : ℝ := c 1 - a 1
  let d₀ : ℝ := d 0 - a 0
  let d₁ : ℝ := d 1 - a 1
  let e₀ : ℝ := e 0 - a 0
  let e₁ : ℝ := e 1 - a 1
  let U : ℝ := u₀ ^ 2 + u₁ ^ 2
  let X : ℝ := u₀ * c₀ + u₁ * c₁
  let Y : ℝ := u₀ * c₁ - u₁ * c₀
  let H : ℝ := u₀ * e₁ - u₁ * e₀
  let Z : ℝ := u₀ * e₀ + u₁ * e₁
  let M : ℝ := u₀ * d₀ + u₁ * d₁
  let N : ℝ := u₀ * d₁ - u₁ * d₀
  let O : ℝ := signedArea2 c d e
  let K : ℝ := 2 * H * X - U * Y
  have hY : Y < 0 := by
    dsimp [Y, u₀, u₁, c₀, c₁]
    simp only [signedArea2] at habc
    nlinarith
  have hH : H < 0 := by
    dsimp [H, u₀, u₁, e₀, e₁]
    simp only [signedArea2] at habe
    nlinarith
  have hO : O < 0 := by
    simpa [O] using hcde
  have hU_pos : 0 < U := by
    have hu_ne : u₀ ≠ 0 ∨ u₁ ≠ 0 := by
      by_contra h
      push_neg at h
      rcases h with ⟨hu₀, hu₁⟩
      have : Y = 0 := by simp [Y, hu₀, hu₁]
      linarith
    rcases hu_ne with hu₀ | hu₁
    · exact add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero hu₀) (sq_nonneg u₁)
    · exact add_pos_of_nonneg_of_pos (sq_nonneg u₀) (sq_pos_of_ne_zero hu₁)
  have hZ : 2 * Z = U := by
    dsimp [Z, U, u₀, u₁, e₀, e₁]
    nlinarith [hea_sq]
  have hcross_ce :
      U * signedArea2 a c e = X * H - Y * Z := by
    simp [U, X, Y, H, Z, u₀, u₁, c₀, c₁, e₀, e₁, signedArea2]
    ring
  have hK_eq : K = 2 * U * signedArea2 a c e := by
    dsimp [K]
    linear_combination -2 * hcross_ce + Y * hZ
  have hK : K < 0 := by
    rw [hK_eq]
    exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) hU_pos) hace
  have hdc_dot :
      2 * (d₀ * c₀ + d₁ * c₁) = c₀ ^ 2 + c₁ ^ 2 := by
    dsimp [d₀, d₁, c₀, c₁]
    nlinarith only [hda_sq]
  have hde_dot :
      2 * (d₀ * e₀ + d₁ * e₁) = e₀ ^ 2 + e₁ ^ 2 := by
    dsimp [d₀, d₁, e₀, e₁]
    nlinarith only [hde_sq]
  have hlag_c :
      U * (c₀ ^ 2 + c₁ ^ 2) = X ^ 2 + Y ^ 2 := by
    simp [U, X, Y]
    ring
  have hlag_e :
      U * (e₀ ^ 2 + e₁ ^ 2) = Z ^ 2 + H ^ 2 := by
    simp [U, Z, H]
    ring
  have hdot_c :
      U * (d₀ * c₀ + d₁ * c₁) = M * X + N * Y := by
    simp [U, M, N, X, Y]
    ring
  have hdot_e :
      U * (d₀ * e₀ + d₁ * e₁) = M * Z + N * H := by
    simp [U, M, N, Z, H]
    ring
  have hcircleC : 2 * M * X + 2 * N * Y = X ^ 2 + Y ^ 2 := by
    linear_combination -2 * hdot_c + U * hdc_dot + hlag_c
  have hcircleE_base : 2 * M * Z + 2 * N * H = Z ^ 2 + H ^ 2 := by
    linear_combination -2 * hdot_e + U * hde_dot + hlag_e
  have hcircleE : 4 * M * U + 8 * N * H = U ^ 2 + 4 * H ^ 2 := by
    linear_combination
      4 * hcircleE_base + (2 * Z + U - 4 * M) * hZ
  have hO_raw :
      U * O = (M - X) * (H - Y) - (N - Y) * (Z - X) := by
    simp [U, M, N, X, Y, H, Z, O, u₀, u₁, c₀, c₁, d₀, d₁, e₀, e₁,
      signedArea2]
    ring
  have harea :
      2 * U * O =
        2 * (M - X) * (H - Y) - (N - Y) * (U - 2 * X) := by
    linear_combination 2 * hO_raw - (N - Y) * hZ
  exact second_algebraic_core U X Y H M N O hU_pos hY hH
    (by simpa [K] using hK) hO hcircleC hcircleE harea

/-- Positive-orientation form of
`false_of_second_three_rows_of_four_orientations`.

Reflection across the x-axis preserves the three metric equalities and
negates all four signed areas. -/
theorem false_of_second_three_rows_of_four_orientations_pos
    {a b c d e : ℝ²}
    (habc : 0 < signedArea2 a b c)
    (hcde : 0 < signedArea2 c d e)
    (habe : 0 < signedArea2 a b e)
    (hace : 0 < signedArea2 a c e)
    (hda : dist d a = dist d c)
    (hdc : dist d c = dist d e)
    (hea : dist e a = dist e b) :
    False := by
  open Census554.EqualityCore in
    apply false_of_second_three_rows_of_four_orientations
      (a := reflectXAxis a) (b := reflectXAxis b)
      (c := reflectXAxis c) (d := reflectXAxis d)
      (e := reflectXAxis e)
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · simpa only [dist_reflectXAxis] using hda
  · simpa only [dist_reflectXAxis] using hdc
  · simpa only [dist_reflectXAxis] using hea

/-- Boundary-order form of the second five-point Euclidean obstruction. -/
theorem false_of_five_ccw_second_three_row_equalities
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) (hide : id < ie)
    (hda :
      dist (boundary id) (boundary ia) =
        dist (boundary id) (boundary ic))
    (hdc :
      dist (boundary id) (boundary ic) =
        dist (boundary id) (boundary ie))
    (hea :
      dist (boundary ie) (boundary ia) =
        dist (boundary ie) (boundary ib)) :
    False := by
  have habc : signedArea2 (boundary ia) (boundary ib) (boundary ic) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab hibc
  have hcde : signedArea2 (boundary ic) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hicd hide
  have habe : signedArea2 (boundary ia) (boundary ib) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans (hicd.trans hide))
  have hace : signedArea2 (boundary ia) (boundary ic) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans hibc) (hicd.trans hide)
  exact false_of_second_three_rows_of_four_orientations
    habc hcde habe hace hda hdc hea

/-- Selected-row consumer for the second computationally discovered
five-point cut. -/
theorem false_of_five_ccw_second_two_selected_rows
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) (hide : id < ie)
    (DRow : SelectedFourClass carrier (boundary id))
    (ERow : SelectedFourClass carrier (boundary ie))
    (ha_mem_DRow : boundary ia ∈ DRow.support)
    (hc_mem_DRow : boundary ic ∈ DRow.support)
    (he_mem_DRow : boundary ie ∈ DRow.support)
    (ha_mem_ERow : boundary ia ∈ ERow.support)
    (hb_mem_ERow : boundary ib ∈ ERow.support) :
    False := by
  apply false_of_five_ccw_second_three_row_equalities
    hboundary_injective hboundary_ccw hiab hibc hicd hide
  · exact
      (DRow.support_eq_radius _ ha_mem_DRow).trans
        (DRow.support_eq_radius _ hc_mem_DRow).symm
  · exact
      (DRow.support_eq_radius _ hc_mem_DRow).trans
        (DRow.support_eq_radius _ he_mem_DRow).symm
  · exact
      (ERow.support_eq_radius _ ha_mem_ERow).trans
        (ERow.support_eq_radius _ hb_mem_ERow).symm

/-- Reversed-row selected consumer for the second five-point cut.

For `a < b < c < d < e`, this rules out a selected row at `b` containing
`a,c,e` together with a selected row at `a` containing `d,e`.  Reversing the
five points produces the metric pattern of
`false_of_second_three_rows_of_four_orientations_pos`. -/
theorem false_of_five_ccw_reversed_second_two_selected_rows
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) (hide : id < ie)
    (BRow : SelectedFourClass carrier (boundary ib))
    (ARow : SelectedFourClass carrier (boundary ia))
    (ha_mem_BRow : boundary ia ∈ BRow.support)
    (hc_mem_BRow : boundary ic ∈ BRow.support)
    (he_mem_BRow : boundary ie ∈ BRow.support)
    (hd_mem_ARow : boundary id ∈ ARow.support)
    (he_mem_ARow : boundary ie ∈ ARow.support) :
    False := by
  have reverse_area (x y z : ℝ²) :
      signedArea2 z y x = -signedArea2 x y z := by
    simp only [signedArea2]
    ring
  apply false_of_second_three_rows_of_four_orientations_pos
    (a := boundary ie) (b := boundary id) (c := boundary ic)
    (d := boundary ib) (e := boundary ia)
  · rw [reverse_area]
    linarith only [
      hneg_of_ccw hboundary_injective hboundary_ccw hicd hide]
  · rw [reverse_area]
    linarith only [
      hneg_of_ccw hboundary_injective hboundary_ccw hiab hibc]
  · rw [reverse_area]
    linarith only [
      hneg_of_ccw hboundary_injective hboundary_ccw
        (hiab.trans (hibc.trans hicd)) hide]
  · rw [reverse_area]
    linarith only [
      hneg_of_ccw hboundary_injective hboundary_ccw
        (hiab.trans hibc) (hicd.trans hide)]
  · exact
      (BRow.support_eq_radius _ he_mem_BRow).trans
        (BRow.support_eq_radius _ hc_mem_BRow).symm
  · exact
      (BRow.support_eq_radius _ hc_mem_BRow).trans
        (BRow.support_eq_radius _ ha_mem_BRow).symm
  · exact
      (ARow.support_eq_radius _ he_mem_ARow).trans
        (ARow.support_eq_radius _ hd_mem_ARow).symm

set_option maxHeartbeats 800000 in
-- The coordinate polynomial normalization is larger than Lean's default
-- heartbeat budget, but remains a deterministic kernel-checked proof.
/-- A direct Euclidean five-point obstruction.

The four signed-area hypotheses say that `a,b,c,d,e` occur in this cyclic
order (in the descending-sign convention used by the project).  The two
displayed equidistant rows, centered at `b` and `c`, are incompatible with
that order.

This is genuinely Euclidean: the corresponding abstract metric satisfies all
strict triangle and strict Kalmanson inequalities. -/
theorem false_of_three_rows_of_four_orientations
    {a b c d e : ℝ²}
    (habd : signedArea2 a b d < 0)
    (hbcd : signedArea2 b c d < 0)
    (habe : signedArea2 a b e < 0)
    (hdea : signedArea2 d e a < 0)
    (hb : dist b a = dist b e)
    (hca : dist c a = dist c b)
    (hcd : dist c a = dist c d) :
    False := by
  have hb_sq := congrArg (fun r : ℝ => r ^ 2) hb
  have hca_sq := congrArg (fun r : ℝ => r ^ 2) hca
  have hcd_sq := congrArg (fun r : ℝ => r ^ 2) hcd
  change dist b a ^ 2 = dist b e ^ 2 at hb_sq
  change dist c a ^ 2 = dist c b ^ 2 at hca_sq
  change dist c a ^ 2 = dist c d ^ 2 at hcd_sq
  rw [dist_sq_coord, dist_sq_coord] at hb_sq hca_sq hcd_sq
  let u₀ : ℝ := b 0 - a 0
  let u₁ : ℝ := b 1 - a 1
  let w₀ : ℝ := c 0 - a 0
  let w₁ : ℝ := c 1 - a 1
  let x₀ : ℝ := d 0 - a 0
  let x₁ : ℝ := d 1 - a 1
  let e₀ : ℝ := e 0 - a 0
  let e₁ : ℝ := e 1 - a 1
  let U : ℝ := u₀ ^ 2 + u₁ ^ 2
  let X : ℝ := u₀ * x₀ + u₁ * x₁
  let Y : ℝ := u₀ * x₁ - u₁ * x₀
  let H : ℝ := u₀ * w₁ - u₁ * w₀
  let O : ℝ := signedArea2 b c d
  let Z : ℝ := u₀ * e₀ + u₁ * e₁
  let W : ℝ := u₀ * e₁ - u₁ * e₀
  let Q : ℝ := (X - U) ^ 2 + Y ^ 2
  have hY : Y < 0 := by
    dsimp [Y, u₀, u₁, x₀, x₁]
    simp only [signedArea2] at habd
    nlinarith
  have hO : O < 0 := by
    simpa [O] using hbcd
  have hW : W < 0 := by
    dsimp [W, u₀, u₁, e₀, e₁]
    simp only [signedArea2] at habe
    nlinarith
  have hU_pos : 0 < U := by
    have hu_ne : u₀ ≠ 0 ∨ u₁ ≠ 0 := by
      by_contra h
      push_neg at h
      rcases h with ⟨hu₀, hu₁⟩
      have : Y = 0 := by simp [Y, hu₀, hu₁]
      linarith
    rcases hu_ne with hu₀ | hu₁
    · have := sq_pos_of_ne_zero hu₀
      nlinarith [sq_nonneg u₁]
    · have := sq_pos_of_ne_zero hu₁
      nlinarith [sq_nonneg u₀]
  have hcu : 2 * (w₀ * u₀ + w₁ * u₁) = U := by
    dsimp [u₀, u₁, w₀, w₁, U]
    nlinarith [hca_sq]
  have hcx : 2 * (w₀ * x₀ + w₁ * x₁) = x₀ ^ 2 + x₁ ^ 2 := by
    dsimp [w₀, w₁, x₀, x₁]
    nlinarith [hcd_sq]
  have hbe : 2 * Z = e₀ ^ 2 + e₁ ^ 2 := by
    dsimp [u₀, u₁, e₀, e₁, Z]
    nlinarith [hb_sq]
  have hlag_x :
      U * (x₀ ^ 2 + x₁ ^ 2) = X ^ 2 + Y ^ 2 := by
    simp [U, X, Y]
    ring
  have hdot_cross :
      U * (w₀ * x₀ + w₁ * x₁) =
        (w₀ * u₀ + w₁ * u₁) * X + H * Y := by
    simp [U, X, Y, H]
    ring
  have hrow_x : X ^ 2 + Y ^ 2 = U * X + 2 * H * Y := by
    exact row_identity U X Y H
      (w₀ * x₀ + w₁ * x₁) (w₀ * u₀ + w₁ * u₁)
      (x₀ ^ 2 + x₁ ^ 2) hlag_x hcx hdot_cross hcu
  have hO_raw :
      U * O =
        (w₀ * u₀ + w₁ * u₁) * Y - H * X + U * H - U * Y := by
    simp [U, X, Y, H, O, u₀, u₁, w₀, w₁, x₀, x₁, signedArea2]
    ring
  have hO_formula : 2 * U * O = 2 * H * (U - X) - U * Y := by
    exact orientation_formula U X Y H O
      (w₀ * u₀ + w₁ * u₁) hO_raw hcu
  have hkey : 2 * U * Y * O = -X * Q := by
    simpa only [Q] using key_identity U X Y H O hrow_x hO_formula
  have hQ_pos : 0 < Q := by
    dsimp [Q]
    exact add_pos_of_nonneg_of_pos (sq_nonneg (X - U)) (sq_pos_of_neg hY)
  have hX : X < 0 := by
    have hleft : 0 < 2 * U * Y * O := by
      have h2U : 0 < 2 * U := mul_pos (by norm_num) hU_pos
      have hYO : 0 < Y * O := mul_pos_of_neg_of_neg hY hO
      simpa only [mul_assoc] using mul_pos h2U hYO
    have hright : 0 < -X * Q := by
      rw [← hkey]
      exact hleft
    have hnegX : 0 < -X := by
      rcases mul_pos_iff.mp hright with h | h
      · exact h.1
      · exact False.elim ((not_lt_of_ge (le_of_lt hQ_pos)) h.2)
    linarith
  have he_norm_pos : 0 < e₀ ^ 2 + e₁ ^ 2 := by
    have he_ne : e₀ ≠ 0 ∨ e₁ ≠ 0 := by
      by_contra h
      push_neg at h
      rcases h with ⟨he₀, he₁⟩
      have : W = 0 := by simp [W, he₀, he₁]
      linarith
    rcases he_ne with he₀ | he₁
    · exact add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero he₀) (sq_nonneg e₁)
    · exact add_pos_of_nonneg_of_pos (sq_nonneg e₀) (sq_pos_of_ne_zero he₁)
  have hZ : 0 < Z := by
    nlinarith only [hbe, he_norm_pos]
  have hcross :
      U * signedArea2 d e a = X * W - Y * Z := by
    simp [U, X, Y, Z, W, u₀, u₁, x₀, x₁, e₀, e₁, signedArea2]
    ring
  have : 0 < signedArea2 d e a := by
    have hrhs : 0 < X * W - Y * Z := by
      linarith [mul_pos_of_neg_of_neg hX hW, mul_neg_of_neg_of_pos hY hZ]
    have hprod : 0 < U * signedArea2 d e a := by
      rw [hcross]
      exact hrhs
    rcases mul_pos_iff.mp hprod with h | h
    · exact h.2
    · exact False.elim ((not_lt_of_ge (le_of_lt hU_pos)) h.1)
  linarith

/-- Boundary-order form of the direct five-point Euclidean obstruction.

No convexity-set or boundary-image hypothesis is needed after an injective CCW
enumeration has been supplied. -/
theorem false_of_five_ccw_three_row_equalities
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) (hide : id < ie)
    (hb :
      dist (boundary ib) (boundary ia) =
        dist (boundary ib) (boundary ie))
    (hca :
      dist (boundary ic) (boundary ia) =
        dist (boundary ic) (boundary ib))
    (hcd :
      dist (boundary ic) (boundary ia) =
        dist (boundary ic) (boundary id)) :
    False := by
  have habd :
      signedArea2 (boundary ia) (boundary ib) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans hicd)
  have hbcd :
      signedArea2 (boundary ib) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hibc hicd
  have habe :
      signedArea2 (boundary ia) (boundary ib) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans (hicd.trans hide))
  have hade :
      signedArea2 (boundary ia) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans hicd)) hide
  have hdea :
      signedArea2 (boundary id) (boundary ie) (boundary ia) < 0 := by
    have hcyclic :
        signedArea2 (boundary id) (boundary ie) (boundary ia) =
          signedArea2 (boundary ia) (boundary id) (boundary ie) := by
      simp only [signedArea2]
      ring
    rw [hcyclic]
    exact hade
  exact false_of_three_rows_of_four_orientations
    habd hbcd habe hdea hb hca hcd

/-- Selected-row consumer for the computationally discovered five-point cut.

For increasing boundary points `a < b < c < d < e`, a selected row centered
at `b` cannot contain `a,e` while a selected row centered at `c` contains
`a,b,d`. -/
theorem false_of_five_ccw_two_selected_rows
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) (hide : id < ie)
    (BRow : SelectedFourClass carrier (boundary ib))
    (CRow : SelectedFourClass carrier (boundary ic))
    (ha_mem_BRow : boundary ia ∈ BRow.support)
    (he_mem_BRow : boundary ie ∈ BRow.support)
    (ha_mem_CRow : boundary ia ∈ CRow.support)
    (hb_mem_CRow : boundary ib ∈ CRow.support)
    (hd_mem_CRow : boundary id ∈ CRow.support) :
    False := by
  apply false_of_five_ccw_three_row_equalities
    hboundary_injective hboundary_ccw hiab hibc hicd hide
  · exact
      (BRow.support_eq_radius _ ha_mem_BRow).trans
        (BRow.support_eq_radius _ he_mem_BRow).symm
  · exact
      (CRow.support_eq_radius _ ha_mem_CRow).trans
        (CRow.support_eq_radius _ hb_mem_CRow).symm
  · exact
      (CRow.support_eq_radius _ ha_mem_CRow).trans
        (CRow.support_eq_radius _ hd_mem_CRow).symm

#print axioms false_of_three_rows_of_four_orientations
#print axioms false_of_five_ccw_three_row_equalities
#print axioms false_of_five_ccw_two_selected_rows
#print axioms false_of_second_three_rows_of_four_orientations
#print axioms false_of_second_three_rows_of_four_orientations_pos
#print axioms false_of_five_ccw_second_three_row_equalities
#print axioms false_of_five_ccw_second_two_selected_rows
#print axioms false_of_five_ccw_reversed_second_two_selected_rows

end FivePointEuclideanObstruction
end Problem97
