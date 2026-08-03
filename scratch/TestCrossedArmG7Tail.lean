import Erdos9796Proof.P97.Census554.EqualityCore

example {br bs bv zs zv : ℂ}
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbv : bv - 1 ≠ 0) (hbv0 : bv ≠ 0)
    (q9 : br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
      br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3 = 0)
    (g7 : br ^ 2 * bs * bv - br * bs * bv ^ 2 + bs * bv ^ 3 - br * bs * bv = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0) : False := by
  have hK : br ^ 2 - br * bv + bv ^ 2 - br = 0 := by
    have hfactor : bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
      linear_combination g7
    exact (mul_eq_zero.mp hfactor).resolve_left (mul_ne_zero hbs hbv0)
  have hprod : br * bs * (bv - 1) * (bs - bv) = 0 := by
    linear_combination q9 - bv * hK
  have hbsbv : bs = bv := by
    have hlast : bs - bv = 0 :=
      (mul_eq_zero.mp hprod).resolve_left
        (mul_ne_zero (mul_ne_zero hbr hbs) hbv)
    exact sub_eq_zero.mp hlast
  rw [hbsbv] at f6
  norm_num at f6
