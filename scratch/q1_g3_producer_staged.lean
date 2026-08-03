import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

namespace Q1G3ProducerStaged
open Problem97.CrossedArmSevenPointEuclideanObstruction

private def u8 (br bs bu bv bw : ℂ) : ℂ :=
  e7Polynomial bs bu bv + (1 - bu) * q1Polynomial bs bu bw

private def u24 (br bs bu bv bw : ℂ) : ℂ :=
  -br * e8Polynomial bs bv bw + bw * e9Polynomial br bs bv

private def u32 (br bs bu bv bw : ℂ) : ℂ :=
  -(br * bv - br) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * e9Polynomial br bs bv

private def u34 (br bs bu bv bw : ℂ) : ℂ :=
  -(bs - 2 * bu + bv - bw) * e8Polynomial bs bv bw
    + (bv * bw - bw ^ 2 + bw - 1) * q1Polynomial bs bu bw

private theorem u8_of_q1_p7
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0) :
    u8 br bs bu bv bw = 0 := by
  simp only [u8, e7Polynomial, q1Polynomial] at *
  linear_combination (1) * p7 + (-bu + 1) * hq

private theorem u24_of_p8_p9
    {br bs bu bv bw : ℂ}
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u24 br bs bu bv bw = 0 := by
  simp only [u24, e8Polynomial, e9Polynomial] at *
  linear_combination (-br) * p8 + bw * p9

private theorem u32_of_p8_p9
    {br bs bu bv bw : ℂ}
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u32 br bs bu bv bw = 0 := by
  simp only [u32, e8Polynomial, e9Polynomial] at *
  linear_combination (-(br * bv - br)) * p8
    + (bv * bw - bw ^ 2 + bw - 1) * p9

private theorem u34_of_q1_p8
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p8 : e8Polynomial bs bv bw = 0) :
    u34 br bs bu bv bw = 0 := by
  simp only [u34, e8Polynomial, q1Polynomial] at *
  linear_combination (-(bs - 2 * bu + bv - bw)) * p8
    + (bv * bw - bw ^ 2 + bw - 1) * hq

set_option maxHeartbeats 12000000 in
set_option maxRecDepth 100000 in
theorem q1EqZeroG3Staged
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    (bu - bs) * (br - bv) * bv * bw = 0 := by
  have h8 := u8_of_q1_p7 (br := br) (bs := bs) (bu := bu) (bv := bv)
    (bw := bw) hq p7
  have h24 := u24_of_p8_p9 (br := br) (bs := bs) (bu := bu) (bv := bv)
    (bw := bw) p8 p9
  have h32 := u32_of_p8_p9 (br := br) (bs := bs) (bu := bu) (bv := bv)
    (bw := bw) p8 p9
  have h34 := u34_of_q1_p8 (br := br) (bs := bs) (bu := bu) (bv := bv)
    (bw := bw) hq p8
  simp only [u8, u24, u32, u34, e2Polynomial, e5Polynomial,
    e7Polynomial, e8Polynomial, e9Polynomial, q1Polynomial] at h8 h24 h32 h34 p2 p5
  clear p7 p8 p9
  grobner (ringSteps := 100000)

end Q1G3ProducerStaged
