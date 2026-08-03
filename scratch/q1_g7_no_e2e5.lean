import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace Problem97.Q1G7NoE2E5Scratch
open Problem97.CrossedArmSevenPointEuclideanObstruction

set_option maxHeartbeats 3000000 in
theorem q1EqZeroG7
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)

end Problem97.Q1G7NoE2E5Scratch
