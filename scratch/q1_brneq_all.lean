import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer
namespace ScratchQ1BrneqAll
open Problem97.CrossedArmSevenPointEuclideanObstruction
set_option maxRecDepth 100000 in
set_option maxHeartbeats 10000000 in
theorem branch
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbrv : br ≠ bv) : False := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial,
    e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)
end ScratchQ1BrneqAll
