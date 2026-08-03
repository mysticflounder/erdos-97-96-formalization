import Erdos9796Proof.P97.Census554.EqualityCore

namespace Problem97

namespace Q1PublicHelper

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

set_option maxHeartbeats 1000000 in
theorem false_of_q1_br_eq_bv
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

end Q1PublicHelper

namespace Q1PrivateBridge

private def q1Polynomial (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 +
    bs * bu * bw + bs * bw ^ 2 - bu ^ 2 * bw

private def e7Polynomial (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv +
    bs ^ 2 * bu + bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv -
    bs * bu - bs * bv ^ 2 - bu ^ 2 * bv + bu * bv

private def e8Polynomial (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

private def e9Polynomial (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

theorem bridge
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbrv : br = bv) (hbr : br ≠ 0) (hbs : bs ≠ 0)
    (hbw : bw ≠ 0) (hbv1 : bv - 1 ≠ 0) : False := by
  simpa only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] using
    Q1PublicHelper.false_of_q1_br_eq_bv hq p7 p8 p9 hbrv hbr hbs hbw hbv1

end Q1PrivateBridge
end Problem97
