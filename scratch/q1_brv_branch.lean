import Erdos9796Proof.P97.Census554.EqualityCore

namespace Problem97.CrossedArmSevenPointEuclideanObstruction

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
def e2Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
    br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
    br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
    br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
    bu * bv ^ 2 * bw ^ 2
def e5Polynomial (br bs bu bv : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
    br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
    br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
    bu ^ 2 * bv ^ 2 + bu * bv ^ 2

set_option maxHeartbeats 2000000 in
theorem q1_brv_branch
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbrv : br = bv) (hbr : br ≠ 0) (hbs : bs ≠ 0)
    (hbw : bw ≠ 0) (hbv1 : bv - 1 ≠ 0) : False := by
  subst br
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial,
    e8Polynomial, e9Polynomial] at *
  grobner

set_option maxHeartbeats 1000000 in
theorem q1_brv_small
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbrv : br = bv) (hbr : br ≠ 0) (hbs : bs ≠ 0)
    (hbw : bw ≠ 0) (hbv1 : bv - 1 ≠ 0) : False := by
  subst br
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  grobner

set_option maxHeartbeats 1000000 in
/-
theorem q1_brneq_with_f
    {br bs bu bv bw zr zs zu zv : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbrv : br ≠ bv)
    (f3 : -bs * zs + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f9 : (br - bv) * zr + (1 - br) * zv + (bv - 1) = 0) : False := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  grobner
-/

set_option maxHeartbeats 12000000 in
set_option maxRecDepth 100000 in
theorem q1_brneq_small
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbrv : br ≠ bv) : False := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 1000000)

end Problem97.CrossedArmSevenPointEuclideanObstruction

namespace ScratchQ1Product
open Problem97.CrossedArmSevenPointEuclideanObstruction
set_option maxHeartbeats 2000000 in
theorem target
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (_p2 : e2Polynomial br bs bu bv bw = 0)
    (_p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    br * bs ^ 2 * bw ^ 2 * (bv - 1) ^ 2 = 0 := by
  by_contra hT
  have hbr : br ≠ 0 := by intro h; subst br; simp at hT
  have hbs : bs ≠ 0 := by intro h; subst bs; simp at hT
  have hbw : bw ≠ 0 := by intro h; subst bw; simp at hT
  have hbv1 : bv - 1 ≠ 0 := by intro h; simp [h] at hT
  by_cases hbrv : br = bv
  · exact q1_brv_small hq p7 p8 p9 hbrv hbr hbs hbw hbv1
  · exact q1_brneq_small hq p7 p8 p9 hbr hbs hbw hbv1 hbrv
end ScratchQ1Product
