import Erdos9796Proof.P97.Census554.EqualityCore

namespace Problem97

namespace Q1G3TailScratch

def q1Polynomial (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 +
    bs * bu * bw + bs * bw ^ 2 - bu ^ 2 * bw

def e7Polynomial (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv +
    bs ^ 2 * bu + bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv -
    bs * bu - bs * bv ^ 2 - bu ^ 2 * bv + bu * bv

def e8Polynomial (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

def e9Polynomial (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

theorem tail
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ bv) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv : bv - 1 ≠ 0) (hbv0 : bv ≠ 0)
    (hG3 : (bu - bs) * (br - bv) * bv * bw = 0) : False := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at hq p7 p8 p9
  have hprefix : (br - bv) * bv * bw ≠ 0 := by
    exact mul_ne_zero (mul_ne_zero (sub_ne_zero.mpr hbr) hbv0) hbw
  have hbu0 : bu - bs = 0 := by
    by_contra hne
    have hleft : (bu - bs) * (br - bv) * bv ≠ 0 := by
      exact mul_ne_zero (mul_ne_zero hne (sub_ne_zero.mpr hbr)) hbv0
    exact hbw ((mul_eq_zero.mp hG3).resolve_left hleft)
  have hbu : bu = bs := sub_eq_zero.mp hbu0
  subst bu
  have hq' : bs * bw * (bw - bs) = 0 := by
    linear_combination hq
  have hbsbw : bs * bw ≠ 0 := mul_ne_zero hbs hbw
  have hbwbs0 : bw - bs = 0 :=
    (mul_eq_zero.mp hq').resolve_left hbsbw
  have hbwbs : bw = bs := sub_eq_zero.mp hbwbs0
  subst bw
  have hp7' : -bs * (bv - 1) * (bv - bs) = 0 := by
    linear_combination p7
  have hbsbv1 : (-bs) * (bv - 1) ≠ 0 := by
    exact mul_ne_zero (neg_ne_zero.mpr hbs) hbv
  have hbvbs0 : bv - bs = 0 :=
    (mul_eq_zero.mp hp7').resolve_left hbsbv1
  have hbvbs : bv = bs := sub_eq_zero.mp hbvbs0
  subst bv
  have hp8' : bs ^ 2 * (bs - 1) = 0 := by
    linear_combination p8
  have hbs1sub : bs - 1 = 0 :=
    (mul_eq_zero.mp hp8').resolve_left (pow_ne_zero 2 hbs)
  have hbs1 : bs = 1 := sub_eq_zero.mp hbs1sub
  subst bs
  have hp9' : (br - 1) ^ 2 = 0 := by
    linear_combination p9
  exact (pow_ne_zero 2 (sub_ne_zero.mpr hbr)) hp9'

theorem force_br_eq_bv
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv : bv - 1 ≠ 0) (hbv0 : bv ≠ 0)
    (hG3 : (bu - bs) * (br - bv) * bv * bw = 0) : br = bv := by
  by_contra hbr
  exact tail hq p7 p8 p9 hbr hbs hbw hbv hbv0 hG3

end Q1G3TailScratch
end Problem97
