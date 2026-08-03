import Erdos9796Proof.P97.Census554.EqualityCore

namespace ScratchQ1G7StagedExact

private def q1Polynomial (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
    bs * bw ^ 2 - bu ^ 2 * bw

private def e2Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
    br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
    br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
    br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
    bu * bv ^ 2 * bw ^ 2

private def e5Polynomial (br bs bu bv : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
    br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
    br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
    bu ^ 2 * bv ^ 2 + bu * bv ^ 2

private def e7Polynomial (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
    bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
    bu ^ 2 * bv + bu * bv

private def e8Polynomial (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

private def e9Polynomial (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

private def u8Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  bs^2*bu^2-bs*bu^3-bs^2*bu*bv+bs*bu^2*bv+bs^2*bu*bw-bs*bu^2*bw+bu^3*bw-bs*bu*bw^2-bs^2*bu+bs*bu^2+bs^2*bv+bs*bu*bv-bu^2*bv-bs*bv^2-bs^2*bw+bs*bu*bw-bu^2*bw+bs*bw^2-bs*bu+bu*bv

private def u24Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  br*bs^2*bw^2-br*bs*bv*bw^2-2*br*bs^2*bw+br^2*bv*bw+2*br*bs*bv*bw-2*br*bv^2*bw+bv^3*bw+br*bs^2-br*bs*bv

private def u30Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  bs*bu*bv^2*bw-bs*bv^3*bw-2*bs*bu*bv*bw^2+bu^2*bv*bw^2+bs*bv^2*bw^2+2*bs*bu*bv*bw-2*bu^2*bv*bw+bs*bu*bw^2-bu*bv*bw^2-2*bs*bu*bv+bu^2*bv+bs*bv^2-bs*bu*bw-bs*bv*bw+2*bu*bv*bw+bs*bu-bu*bv

private def u32Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  br^2*bv^2*bw-2*br*bv^3*bw+bv^4*bw-br^2*bv*bw^2+br*bv^2*bw^2-bv^3*bw^2+br^2*bv*bw+bv^3*bw+br*bv*bw^2-br^2*bv+br*bv^2-bv^3-2*br*bv*bw+br*bv

private def u34Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  bs*bu^2*bv*bw-2*bs*bu*bv^2*bw+bs*bv^3*bw-bs*bu^2*bw^2+3*bs*bu*bv*bw^2-bu^2*bv*bw^2-2*bs*bv^2*bw^2-bs*bu*bw^3+bu^2*bw^3+2*bs*bv*bw^3-bs*bw^4+bs*bu^2*bw-2*bs*bu*bv*bw+2*bu*bv^2*bw-bv^3*bw+bs*bu*bw^2-bu^2*bw^2-bs*bv*bw^2+bv^2*bw^2+bs*bw^3-bs*bu^2+2*bs*bu*bv-bs*bv^2-bs*bu*bw+bu^2*bw+2*bs*bv*bw-2*bu*bv*bw+bv^2*bw-bs*bw^2-bv*bw^2

private def u37Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  bs*bu^3*bw-bu^3*bv*bw-bs^2*bu*bw^2+bs*bu*bv*bw^2+2*bs^2*bu*bv-3*bs*bu^2*bv+bu^3*bv-bs^2*bv^2+bs*bu*bv^2-bs*bu^2*bw-2*bs*bu*bv*bw+2*bu^2*bv*bw+bs*bv^2*bw+bs^2*bw^2-bs*bv*bw^2-bs^2*bu+bs*bu^2+bs*bu*bv-bu^2*bv+bs*bu*bw-bu*bv*bw

private theorem u8OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u8Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u8Polynomial] at *
  linear_combination
      (1) * p7 +
      (-bu+1) * hq


private theorem u24OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u24Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u24Polynomial] at *
  linear_combination
      (-(br)) * p8 +
      (bw) * p9


private theorem u30OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u30Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u30Polynomial] at *
  linear_combination
      (bv*bw-bw^2+bw-1) * p7 +
      (-(bs*bu-bu^2-bs+bu)) * p8


private theorem u32OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u32Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u32Polynomial] at *
  linear_combination
      (-(br*bv-br)) * p8 +
      (bv*bw-bw^2+bw-1) * p9


private theorem u34OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u34Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u34Polynomial] at *
  linear_combination
      (-(bs-2*bu+bv-bw)) * p8 +
      (bv*bw-bw^2+bw-1) * hq


private theorem u37OfH
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    u37Polynomial br bs bu bv bw = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial, e9Polynomial, u37Polynomial] at *
  linear_combination
      (bs-bu-bw) * p7 +
      (-bs*bu+bu*bv+bs-bv) * hq

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 100000 in
theorem g3ViaSixU
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    (bu-bs) * (br-bv) * bv * bw = 0 := by
  have h8 := u8OfH hq p2 p5 p7 p8 p9
  have h24 := u24OfH hq p2 p5 p7 p8 p9
  have h30 := u30OfH hq p2 p5 p7 p8 p9
  have h32 := u32OfH hq p2 p5 p7 p8 p9
  have h34 := u34OfH hq p2 p5 p7 p8 p9
  have h37 := u37OfH hq p2 p5 p7 p8 p9
  clear p7 p8 p9
  simp only [u8Polynomial, u24Polynomial, u30Polynomial, u32Polynomial, u34Polynomial,
    u37Polynomial, e2Polynomial, e5Polynomial] at h8 h24 h30 h32 h34 h37 p2 p5
  grobner (ringSteps := 100000)

end ScratchQ1G7StagedExact
