import Mathlib

/-!
# Adapter from the generic double-reflection residual to the lambda packet

This scratch theorem is independent of the large certificate replay.  It
packages the exact twelve low-degree equations consumed by
`generic_double_reflection_lambda_incompatible`.
-/

namespace Problem97.ATailBankCleanGenericAdapterScratch

structure LambdaPacket
    (L Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ) : Prop where
  hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0
  hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - 2 * Kx + 1 = 0
  hFKZ : 2 * Fx * Zx + 2 * Fy * Zy - 2 * Fx * Kx - 2 * Fy * Ky -
    Zx ^ 2 - Zy ^ 2 + 2 * Kx = 0
  hGXK : 4 * Kx * Ky * Xy - 2 * Kx - 4 * Ky ^ 2 * Xx +
    4 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0
  hXZ : Xx ^ 2 + Xy ^ 2 - 2 * Xx * Zx - 2 * Xy * Zy +
    Zx ^ 2 + Zy ^ 2 - 2 * Kx = 0
  hXF : -Fx ^ 2 - Fy ^ 2 + 2 * Fx * Xx + 2 * Fy * Xy -
    Xx ^ 2 - Xy ^ 2 + 2 * Kx = 0
  hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0
  hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0
  hZAG : -4 * Kx * Ky * Zy + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
    4 * Ky * Zy - 2 * Zx + 1 = 0
  hL : L * (-2 * Kx * Zx + 2 * Kx - 2 * Ky * Zy + Zx ^ 2 + Zy ^ 2) -
    (2 * Kx * Ky - 2 * Kx * Ky * Zx + Kx * Zy -
      2 * Ky ^ 2 * Zy + Ky * Zx) = 0
  hReflectX : Yx - 2 * Ky ^ 2 - 2 * L * (Zy - Ky) = 0
  hReflectY : Yy - 2 * Ky * (1 - Kx) + 2 * L * (Zx - Kx) = 0

/-- The coordinator's denominator-free generic residual produces exactly the
twelve low-degree rows consumed by the lambda certificate. -/
theorem exists_lambdaPacket_of_generic_double_reflection
    {Fx Fy Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hGx : Gx = 2 * Ky ^ 2)
    (hGy : Gy = 2 * Ky * (1 - Kx))
    (hKZne : ¬ (Kx = Zx ∧ Ky = Zy))
    (hReflectX : ((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yx - Gx) =
      2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
        (Zy - Ky))
    (hReflectY : ((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yy - Gy) =
      -2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
        (Zx - Kx))
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXK : 2 * Gx * Kx - 2 * Gx * Xx + 2 * Gy * Ky -
      2 * Gy * Xy - Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) :
    ∃ L, LambdaPacket L Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy := by
  let D : ℝ := (Zx - Kx) ^ 2 + (Zy - Ky) ^ 2
  let q : ℝ := -(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)
  let L : ℝ := q / D
  have hDne : D ≠ 0 := by
    intro hD
    have hx : Zx - Kx = 0 := by
      dsimp [D] at hD
      nlinarith only [hD, sq_nonneg (Zx - Kx), sq_nonneg (Zy - Ky)]
    have hy : Zy - Ky = 0 := by
      dsimp [D] at hD
      nlinarith only [hD, sq_nonneg (Zx - Kx), sq_nonneg (Zy - Ky)]
    apply hKZne
    constructor
    · linarith only [hx]
    · linarith only [hy]
  have hLD : L * D = q := by
    simpa [L] using div_mul_cancel₀ q hDne
  have hLD0 : L * D - q = 0 := sub_eq_zero.mpr hLD
  have hReflectX' : D * (Yx - Gx) = 2 * q * (Zy - Ky) := by
    simpa [D, q] using hReflectX
  have hReflectY' : D * (Yy - Gy) = -2 * q * (Zx - Kx) := by
    simpa [D, q] using hReflectY
  have hReflectX0 : D * (Yx - Gx) - 2 * q * (Zy - Ky) = 0 :=
    sub_eq_zero.mpr hReflectX'
  have hReflectY0 : D * (Yy - Gy) + 2 * q * (Zx - Kx) = 0 := by
    linear_combination hReflectY'
  have hReflectXActual : Yx - Gx - 2 * L * (Zy - Ky) = 0 := by
    have hscaled : D * (Yx - Gx - 2 * L * (Zy - Ky)) = 0 := by
      linear_combination hReflectX0 - 2 * (Zy - Ky) * hLD0
    exact (mul_eq_zero.mp hscaled).resolve_left hDne
  have hReflectYActual : Yy - Gy + 2 * L * (Zx - Kx) = 0 := by
    have hscaled : D * (Yy - Gy + 2 * L * (Zx - Kx)) = 0 := by
      linear_combination hReflectY0 + 2 * (Zx - Kx) * hLD0
    exact (mul_eq_zero.mp hscaled).resolve_left hDne
  have hFAKred :
      2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - 2 * Kx + 1 = 0 := by
    linear_combination hFAK - hAOK
  have hFKZred :
      2 * Fx * Zx + 2 * Fy * Zy - 2 * Fx * Kx - 2 * Fy * Ky -
        Zx ^ 2 - Zy ^ 2 + 2 * Kx = 0 := by
    linear_combination hFAZ - hFAKred
  have hGXKsub := hGXK
  rw [hGx, hGy] at hGXKsub
  have hGXKred :
      4 * Kx * Ky * Xy - 2 * Kx - 4 * Ky ^ 2 * Xx +
        4 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0 := by
    linear_combination hGXKsub - hAOK
  have hXZGsub := hXZG
  rw [hGx, hGy] at hXZGsub
  have hXZGred :
      -4 * Kx * Ky * Xy + 4 * Ky ^ 2 * Xx - 4 * Ky ^ 2 +
        4 * Ky * Xy - 2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0 := by
    linear_combination hXZGsub - 4 * Ky ^ 2 * hAOK
  have hXZred :
      Xx ^ 2 + Xy ^ 2 - 2 * Xx * Zx - 2 * Xy * Zy +
        Zx ^ 2 + Zy ^ 2 - 2 * Kx = 0 := by
    linear_combination hGXKred + hXZGred
  have hXFred :
      -Fx ^ 2 - Fy ^ 2 + 2 * Fx * Xx + 2 * Fy * Xy -
        Xx ^ 2 - Xy ^ 2 + 2 * Kx = 0 := by
    linear_combination hXZF - hXZred
  have hZAGsub := hZAG
  rw [hGx, hGy] at hZAGsub
  have hZAGred :
      -4 * Kx * Ky * Zy + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
        4 * Ky * Zy - 2 * Zx + 1 = 0 := by
    linear_combination hZAGsub - 4 * Ky ^ 2 * hAOK
  have hLDsub := hLD0
  dsimp [D, q] at hLDsub
  rw [hGx, hGy] at hLDsub
  have hLred :
      L * (-2 * Kx * Zx + 2 * Kx - 2 * Ky * Zy + Zx ^ 2 + Zy ^ 2) -
        (2 * Kx * Ky - 2 * Kx * Ky * Zx + Kx * Zy -
          2 * Ky ^ 2 * Zy + Ky * Zx) = 0 := by
    linear_combination hLDsub - (2 * Ky - L) * hAOK
  have hReflectXred : Yx - 2 * Ky ^ 2 - 2 * L * (Zy - Ky) = 0 := by
    rw [hGx] at hReflectXActual
    exact hReflectXActual
  have hReflectYred :
      Yy - 2 * Ky * (1 - Kx) + 2 * L * (Zx - Kx) = 0 := by
    rw [hGy] at hReflectYActual
    exact hReflectYActual
  exact ⟨L, {
    hAOK := hAOK
    hFAK := hFAKred
    hFKZ := hFKZred
    hGXK := hGXKred
    hXZ := hXZred
    hXF := hXFred
    hYOX := hYOX
    hYOZ := hYOZ
    hZAG := hZAGred
    hL := hLred
    hReflectX := hReflectXred
    hReflectY := hReflectYred
  }⟩

#print axioms exists_lambdaPacket_of_generic_double_reflection

end Problem97.ATailBankCleanGenericAdapterScratch
