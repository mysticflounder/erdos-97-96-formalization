import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace ScratchQ1Power

set_option maxHeartbeats 4000000 in
theorem power
    {br bs bu bv bw : ℂ}
    (hq : Problem97.CrossedArmSevenPointEuclideanObstruction.q1Polynomial bs bu bw = 0)
    (p2 : Problem97.CrossedArmSevenPointEuclideanObstruction.e2Polynomial br bs bu bv bw = 0)
    (p5 : Problem97.CrossedArmSevenPointEuclideanObstruction.e5Polynomial br bs bu bv = 0)
    (p7 : Problem97.CrossedArmSevenPointEuclideanObstruction.e7Polynomial bs bu bv = 0)
    (p8 : Problem97.CrossedArmSevenPointEuclideanObstruction.e8Polynomial bs bv bw = 0)
    (p9 : Problem97.CrossedArmSevenPointEuclideanObstruction.e9Polynomial br bs bv = 0) :
    bv ^ 2 * bw ^ 3 * (bv - 1) ^ 2 = 0 := by
  simp only [Problem97.CrossedArmSevenPointEuclideanObstruction.q1Polynomial,
    Problem97.CrossedArmSevenPointEuclideanObstruction.e2Polynomial,
    Problem97.CrossedArmSevenPointEuclideanObstruction.e5Polynomial,
    Problem97.CrossedArmSevenPointEuclideanObstruction.e7Polynomial,
    Problem97.CrossedArmSevenPointEuclideanObstruction.e8Polynomial,
    Problem97.CrossedArmSevenPointEuclideanObstruction.e9Polynomial] at *
  grobner (ringSteps := 100000)

end ScratchQ1Power
