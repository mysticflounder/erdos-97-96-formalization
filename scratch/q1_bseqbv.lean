import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer
namespace ScratchQ1BsEqBv
open Problem97.CrossedArmSevenPointEuclideanObstruction
set_option maxHeartbeats 4000000 in
set_option maxRecDepth 100000 in
theorem contradiction
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbrv : br ≠ bv) (hbsbv : bs = bv) : False := by
  subst bs
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)
end ScratchQ1BsEqBv
