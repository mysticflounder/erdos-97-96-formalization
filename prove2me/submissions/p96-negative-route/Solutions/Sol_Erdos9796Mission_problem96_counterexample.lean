import Definitions.Def_Erdos9796Mission
import Theorems.Thm_Erdos9796Mission_problem96_superlinear_family

theorem solution : ¬ Erdos9796Mission.Problem96 := by
  intro h96
  rw [Erdos9796Mission.Problem96, Asymptotics.isBigO_iff] at h96
  obtain ⟨c, hc⟩ := h96
  let C := max c 0
  have hC : 0 ≤ C := le_max_right c 0
  rw [Filter.eventually_atTop] at hc
  obtain ⟨N, hN⟩ := hc
  obtain ⟨n, hn, hsuper⟩ :=
    Erdos9796Mission.problem96_superlinear_family C hC N
  have hbound := hN n hn
  rw [Real.norm_of_nonneg (Nat.cast_nonneg _),
      Real.norm_of_nonneg (Nat.cast_nonneg _)] at hbound
  have hcC : c ≤ C := le_max_left c 0
  have hscale : c * (n : ℝ) ≤ C * (n : ℝ) :=
    mul_le_mul_of_nonneg_right hcC (Nat.cast_nonneg n)
  exact (not_lt_of_ge (hbound.trans hscale)) hsuper
