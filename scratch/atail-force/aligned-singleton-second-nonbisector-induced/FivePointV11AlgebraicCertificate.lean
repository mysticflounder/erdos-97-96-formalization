import Erdos9796Proof.P97.ATail.FivePointEuclideanObstruction

namespace Problem97.FivePointV11AlgebraicCertificate

open scoped EuclideanGeometry

theorem algebraic_core
    (U X Y R V W O : ℝ)
    (hU : 0 < U)
    (hY : Y < 0)
    (hV : V < 0)
    (hT : 2 * W * X - U * Y < 0)
    (hO : O < 0)
    (hcircleC : 2 * R * X + 2 * V * Y = X ^ 2 + Y ^ 2)
    (hcircleE : 4 * R * U + 8 * V * W = U ^ 2 + 4 * W ^ 2)
    (hOcoord :
      2 * U * O =
        2 * R * W - 2 * R * Y - V * U + 2 * V * X + U * Y - 2 * W * X) :
    False := by
  let T : ℝ := 2 * W * X - U * Y
  let S : ℝ := U * X + 2 * W * Y
  let Q : ℝ := 4 * (W - Y) ^ 2 + (2 * X - U) ^ 2
  have hsecond :
      4 * T * V =
        4 * W ^ 2 * X - 2 * U * X ^ 2 + U ^ 2 * X - 2 * U * Y ^ 2 := by
    dsimp [T]
    linear_combination X * hcircleE - 2 * U * hcircleC
  have hmain : 8 * U * T * O = -S * Q := by
    dsimp [T, S, Q]
    linear_combination
      4 * (2 * W * X - U * Y) * hOcoord -
      2 * Y * (W - Y) * hcircleE +
      8 * W * (W - Y) * hcircleC -
      (U - 2 * X) * hsecond
  have hQ : 0 < Q := by
    dsimp [Q]
    have hs₁ := sq_nonneg (W - Y)
    have hs₂ := sq_nonneg (2 * X - U)
    have hne : W - Y ≠ 0 ∨ 2 * X - U ≠ 0 := by
      by_contra h
      push_neg at h
      rcases h with ⟨hWY, hXU⟩
      nlinarith
    rcases hne with hWY | hXU
    · nlinarith [sq_pos_of_ne_zero hWY]
    · nlinarith [sq_pos_of_ne_zero hXU]
  have hS : S < 0 := by
    have hleft : 0 < 8 * U * T * O := by
      have hUT : U * T < 0 := mul_neg_of_pos_of_neg hU (by simpa [T] using hT)
      have : 0 < (U * T) * O := mul_pos_of_neg_of_neg hUT hO
      nlinarith
    have hright : 0 < -S * Q := by
      rw [← hmain]
      exact hleft
    rcases mul_pos_iff.mp hright with h | h
    · linarith
    · exact False.elim ((not_lt_of_ge (le_of_lt hQ)) h.2)
  have hWX : W * X < 0 := by
    have hUY : U * Y < 0 := mul_neg_of_pos_of_neg hU hY
    nlinarith
  have hX : X < 0 := by
    rcases mul_neg_iff.mp hWX with h | h
    · exact h.2
    · have hUX : 0 < U * X := mul_pos hU h.2
      have hWY : 0 < W * Y := mul_pos_of_neg_of_neg h.1 hY
      dsimp [S] at hS
      nlinarith
  have hright_neg :
      4 * W ^ 2 * X - 2 * U * X ^ 2 + U ^ 2 * X - 2 * U * Y ^ 2 < 0 := by
    have hW2X : W ^ 2 * X ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (sq_nonneg W) (le_of_lt hX)
    have hUX2 : 0 ≤ U * X ^ 2 := mul_nonneg (le_of_lt hU) (sq_nonneg X)
    have hU2X : U ^ 2 * X < 0 := mul_neg_of_pos_of_neg (sq_pos_of_pos hU) hX
    have hUY2 : 0 < U * Y ^ 2 := mul_pos hU (sq_pos_of_neg hY)
    linarith
  have hleft_pos : 0 < 4 * T * V := by
    have : 0 < T * V := mul_pos_of_neg_of_neg (by simpa [T] using hT) hV
    nlinarith
  linarith

set_option maxHeartbeats 800000 in
theorem false_of_three_rows_of_four_orientations
    {a b c d e : ℝ²}
    (habc : signedArea2 a b c < 0)
    (habd : signedArea2 a b d < 0)
    (hcde : signedArea2 c d e < 0)
    (heac : signedArea2 e a c < 0)
    (hda : dist d a = dist d c)
    (hde : dist d c = dist d e)
    (hea : dist e a = dist e b) :
    False := by
  have hda_sq := congrArg (fun r : ℝ => r ^ 2) hda
  have hde_sq := congrArg (fun r : ℝ => r ^ 2) hde
  have hea_sq := congrArg (fun r : ℝ => r ^ 2) hea
  change dist d a ^ 2 = dist d c ^ 2 at hda_sq
  change dist d c ^ 2 = dist d e ^ 2 at hde_sq
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
  let R : ℝ := u₀ * d₀ + u₁ * d₁
  let V : ℝ := u₀ * d₁ - u₁ * d₀
  let Z : ℝ := u₀ * e₀ + u₁ * e₁
  let W : ℝ := u₀ * e₁ - u₁ * e₀
  let O : ℝ := signedArea2 c d e
  have hY : Y < 0 := by
    dsimp [Y, u₀, u₁, c₀, c₁]
    simp only [signedArea2] at habc
    nlinarith
  have hV : V < 0 := by
    dsimp [V, u₀, u₁, d₀, d₁]
    simp only [signedArea2] at habd
    nlinarith
  have hO : O < 0 := by simpa [O] using hcde
  have hU : 0 < U := by
    have hu_ne : u₀ ≠ 0 ∨ u₁ ≠ 0 := by
      by_contra h
      push_neg at h
      rcases h with ⟨hu₀, hu₁⟩
      have : Y = 0 := by simp [Y, hu₀, hu₁]
      linarith
    rcases hu_ne with hu₀ | hu₁
    · nlinarith [sq_pos_of_ne_zero hu₀, sq_nonneg u₁]
    · nlinarith [sq_nonneg u₀, sq_pos_of_ne_zero hu₁]
  have hZ : 2 * Z = U := by
    dsimp [Z, U, u₀, u₁, e₀, e₁]
    nlinarith [hea_sq]
  have hda_raw : 2 * (d₀ * c₀ + d₁ * c₁) = c₀ ^ 2 + c₁ ^ 2 := by
    dsimp [d₀, d₁, c₀, c₁]
    nlinarith [hda_sq]
  have hde_raw : 2 * (d₀ * e₀ + d₁ * e₁) = e₀ ^ 2 + e₁ ^ 2 := by
    dsimp [d₀, d₁, e₀, e₁, c₀, c₁]
    nlinarith [hda_sq, hde_sq]
  have hlagC : U * (c₀ ^ 2 + c₁ ^ 2) = X ^ 2 + Y ^ 2 := by
    simp [U, X, Y]
    ring
  have hdotC :
      U * (d₀ * c₀ + d₁ * c₁) = R * X + V * Y := by
    simp [U, X, Y, R, V]
    ring
  have hcircleC : 2 * R * X + 2 * V * Y = X ^ 2 + Y ^ 2 := by
    linear_combination -2 * hdotC + U * hda_raw + hlagC
  have hlagE : U * (e₀ ^ 2 + e₁ ^ 2) = Z ^ 2 + W ^ 2 := by
    simp [U, Z, W]
    ring
  have hdotE :
      U * (d₀ * e₀ + d₁ * e₁) = R * Z + V * W := by
    simp [U, R, V, Z, W]
    ring
  have hcircleEZ : 2 * R * Z + 2 * V * W = Z ^ 2 + W ^ 2 := by
    linear_combination -2 * hdotE + U * hde_raw + hlagE
  have hcircleE : 4 * R * U + 8 * V * W = U ^ 2 + 4 * W ^ 2 := by
    linear_combination 4 * hcircleEZ + (2 * Z + U - 4 * R) * hZ
  have hOraw :
      U * O = (R - X) * (W - Y) - (V - Y) * (Z - X) := by
    simp [U, X, Y, R, V, Z, W, O, u₀, u₁, c₀, c₁, d₀, d₁, e₀, e₁,
      signedArea2]
    ring
  have hOcoord :
      2 * U * O =
        2 * R * W - 2 * R * Y - V * U + 2 * V * X + U * Y - 2 * W * X := by
    linear_combination 2 * hOraw + (Y - V) * hZ
  have harea :
      U * signedArea2 e a c = W * X - Z * Y := by
    simp [U, X, Y, Z, W, u₀, u₁, c₀, c₁, e₀, e₁, signedArea2]
    ring
  have hT_eq :
      2 * W * X - U * Y = 2 * U * signedArea2 e a c := by
    linear_combination -2 * harea + Y * hZ
  have hT : 2 * W * X - U * Y < 0 := by
    rw [hT_eq]
    exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) hU) heac
  exact algebraic_core U X Y R V W O hU hY hV hT hO hcircleC hcircleE hOcoord

#print axioms algebraic_core
#print axioms false_of_three_rows_of_four_orientations

end Problem97.FivePointV11AlgebraicCertificate
