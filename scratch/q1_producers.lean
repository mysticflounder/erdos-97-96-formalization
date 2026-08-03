import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace ScratchQ1Producers
open Problem97.CrossedArmSevenPointEuclideanObstruction

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 100000 in
theorem colon1
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bw * bv * (br - bv) * (bs - bu) = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial,
    e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 100000 in
theorem colon4
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bw ^ 2 * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial,
    e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)

end ScratchQ1Producers
