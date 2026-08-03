import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace Q1E5Arity4Check
open Problem97.CrossedArmSevenPointEuclideanObstruction

-- Production e5Polynomial has arity four (br, bs, bu, bv); this is a
-- source-only producer check against the public definition.
theorem e5_zero_of_linear
    {br bs bu bv : ℂ}
    (p5 : e5Polynomial br bs bu bv = 0) :
    br * e5Polynomial br bs bu bv + (bs - bu) * e5Polynomial br bs bu bv = 0 := by
  simp [p5]

theorem u24_zero_of_p8_p9
    {br bs bv bw : ℂ}
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    -br * e8Polynomial bs bv bw + bw * e9Polynomial br bs bv = 0 := by
  linear_combination (-br) * p8 + bw * p9

end Q1E5Arity4Check
