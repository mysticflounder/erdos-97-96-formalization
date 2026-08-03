import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace Q1G3SubsetTest
open Problem97.CrossedArmSevenPointEuclideanObstruction

def u8 (br bs bu bv bw : ℂ) : ℂ :=
  e7Polynomial bs bu bv + (1 - bu) * q1Polynomial bs bu bw
def u24 (br bs bu bv bw : ℂ) : ℂ :=
  -br * e8Polynomial bs bv bw + bw * e9Polynomial br bs bv
def u30 (br bs bu bv bw : ℂ) : ℂ :=
  (bv * bw - bw ^ 2 + bw - 1) * e7Polynomial bs bu bv
    - (bs * bu - bu ^ 2 - bs + bu) * e8Polynomial bs bv bw
def u32 (br bs bu bv bw : ℂ) : ℂ :=
  -(br * bv - br) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * e9Polynomial br bs bv
def u34 (br bs bu bv bw : ℂ) : ℂ :=
  -(bs - 2 * bu + bv - bw) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * q1Polynomial bs bu bw
def u37 (br bs bu bv bw : ℂ) : ℂ :=
  (bs - bu) * e7Polynomial bs bu bv
    + (-bs * bu + bu * bv + bs - bv) * q1Polynomial bs bu bw

set_option maxHeartbeats 12000000 in
set_option maxRecDepth 100000 in
theorem mask27
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (h8 : u8 br bs bu bv bw = 0)
    (h24 : u24 br bs bu bv bw = 0)
    (h32 : u32 br bs bu bv bw = 0)
    (h34 : u34 br bs bu bv bw = 0) :
    (bu - bs) * (br - bv) * bv * bw = 0 := by
  simp only [u8, u24, u32, u34, e2Polynomial, e5Polynomial,
    e7Polynomial, e8Polynomial, e9Polynomial, q1Polynomial] at *
  grobner (ringSteps := 100000)

end Q1G3SubsetTest
