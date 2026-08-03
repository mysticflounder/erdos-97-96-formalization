import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer
namespace ScratchQ1StagedFromG7
open Problem97.CrossedArmSevenPointEuclideanObstruction

set_option maxHeartbeats 3000000 in
set_option maxRecDepth 100000 in
theorem from_g7
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hG7 : bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbrv : br ≠ bv) : False := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  have hbv0 : bv ≠ 0 := by
    intro hv
    subst bv
    ring_nf at p9
    apply (mul_ne_zero hbr (pow_ne_zero 2 hbs))
    linear_combination -p9
  have hK : br ^ 2 - br * bv + bv ^ 2 - br = 0 :=
    (mul_eq_zero.mp hG7).resolve_left (mul_ne_zero hbs hbv0)
  have hprod : br * bs * (bv - 1) * (bs - bv) = 0 := by
    linear_combination p9 - bv * hK
  have hbsbv : bs = bv := by
    have hlast : bs - bv = 0 :=
      (mul_eq_zero.mp hprod).resolve_left
        (mul_ne_zero (mul_ne_zero hbr hbs) hbv1)
    exact sub_eq_zero.mp hlast
  subst bs
  grobner (ringSteps := 100000)

end ScratchQ1StagedFromG7
