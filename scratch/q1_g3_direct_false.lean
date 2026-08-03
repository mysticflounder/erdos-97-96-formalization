import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace Q1G3DirectFalse
open Problem97.CrossedArmSevenPointEuclideanObstruction

def u8 (br bs bu bv bw : ℂ) : ℂ :=
  e7Polynomial bs bu bv + (1 - bu) * q1Polynomial bs bu bw
def u24 (br bs bu bv bw : ℂ) : ℂ :=
  -br * e8Polynomial bs bv bw + bw * e9Polynomial br bs bv
def u32 (br bs bu bv bw : ℂ) : ℂ :=
  -(br * bv - br) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * e9Polynomial br bs bv
def u34 (br bs bu bv bw : ℂ) : ℂ :=
  -(bs - 2 * bu + bv - bw) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * q1Polynomial bs bu bw

set_option maxHeartbeats 12000000 in
set_option maxRecDepth 100000 in
theorem mask27
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (h8 : u8 br bs bu bv bw = 0)
    (h24 : u24 br bs bu bv bw = 0)
    (h32 : u32 br bs bu bv bw = 0)
    (h34 : u34 br bs bu bv bw = 0) :
    (bu - bs) * (br - bv) * bv * bw = 0 := by
  simp only [u8, u24, u32, u34, e2Polynomial, e5Polynomial,
    e7Polynomial, e8Polynomial, e9Polynomial, q1Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxHeartbeats 12000000 in
set_option maxRecDepth 100000 in
theorem false_of_q1_system
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) : False := by
  have h8 : u8 br bs bu bv bw = 0 := by
    dsimp [u8]
    linear_combination p7 + (1 - bu) * hq
  have h24 : u24 br bs bu bv bw = 0 := by
    dsimp [u24]
    linear_combination -br * p8 + bw * p9
  have h32 : u32 br bs bu bv bw = 0 := by
    dsimp [u32]
    linear_combination -(br * bv - br) * p8
      + (bv * bw - bw ^ 2 + bw - 1) * p9
  have h34 : u34 br bs bu bv bw = 0 := by
    dsimp [u34]
    linear_combination -(bs - 2 * bu + bv - bw) * p8
      + (bv * bw - bw ^ 2 + bw - 1) * hq
  have hG3 := mask27 hq p2 p5 h8 h24 h32 h34
  by_cases hbrv : br = bv
  · exact false_of_q1_br_eq_bv hq p7 p8 p9 hbrv hbr hbs hbw hbv1
  · have hbv0 : bv ≠ 0 := by
      intro hv
      subst bv
      ring_nf at p9
      exact (mul_ne_zero hbr (pow_ne_zero 2 hbs)) p9
    have hbu0 : bu - bs = 0 := by
      by_contra hne
      have hleft : (bu - bs) * (br - bv) * bv ≠ 0 := by
        exact mul_ne_zero (mul_ne_zero hne (sub_ne_zero.mpr hbrv)) hbv0
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
    have hbsbv1 : (-bs) * (bv - 1) ≠ 0 :=
      mul_ne_zero (neg_ne_zero.mpr hbs) hbv1
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
    exact (pow_ne_zero 2 (sub_ne_zero.mpr hbrv)) hp9'

end Q1G3DirectFalse
