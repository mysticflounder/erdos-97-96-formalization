import Erdos9796Proof.P97.Census554.EqualityCore

namespace Problem97

private def q1 (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
    bs * bw ^ 2 - bu ^ 2 * bw

private def e2 (br bs bu bv bw : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
    br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
    br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
    br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
    bu * bv ^ 2 * bw ^ 2

private def e5 (br bs bu bv : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
    br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
    br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
    bu ^ 2 * bv ^ 2 + bu * bv ^ 2

private def e7 (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
    bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
    bu ^ 2 * bv + bu * bv

private def e8 (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

private def e9 (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

set_option maxHeartbeats 4000000 in
theorem target_from_H
    {br bs bu bv bw : ℂ}
    (h2 : e2 br bs bu bv bw = 0)
    (h5 : e5 br bs bu bv = 0)
    (h7 : e7 bs bu bv = 0)
    (h8 : e8 bs bv bw = 0)
    (h9 : e9 br bs bv = 0)
    (hq : q1 bs bu bw = 0) :
    bv ^ 2 * bw ^ 3 * (bv - 1) ^ 2 = 0 := by
  simp only [q1, e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

end Problem97
