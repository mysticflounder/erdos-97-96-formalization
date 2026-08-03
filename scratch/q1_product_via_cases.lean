import Erdos9796Proof.P97.ATail.Q1BrvBranch

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
  have hbr : br ≠ 0 := by
    intro h
    subst br
    simp at hT
  have hbs : bs ≠ 0 := by
    intro h
    subst bs
    simp at hT
  have hbw : bw ≠ 0 := by
    intro h
    subst bw
    simp at hT
  have hbv1 : bv - 1 ≠ 0 := by
    intro h
    simp [h] at hT
  by_cases hbrv : br = bv
  · exact q1_brv_small hq p7 p8 p9 hbrv hbr hbs hbw hbv1
  · exact q1_brneq_small hq p7 p8 p9 hbr hbs hbw hbv1 hbrv

end ScratchQ1Product
