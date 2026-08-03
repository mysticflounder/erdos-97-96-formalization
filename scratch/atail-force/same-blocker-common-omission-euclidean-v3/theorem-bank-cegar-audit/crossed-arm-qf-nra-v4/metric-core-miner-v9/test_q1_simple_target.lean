import Mathlib

set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
theorem test_q1_simple_target
    {br bs bu bv bw : ℂ}
    (q1 : bs ^ 3 - 2 * bs ^ 2 * bu + bs * bu ^ 2 - bs ^ 2 * bw +
      bs * bu * bw - bu ^ 2 * bw + bs * bw ^ 2 = 0)
    (e2 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br * bs ^ 3 * bu +
      br * bs ^ 2 * bu ^ 2 - br ^ 2 * bs ^ 2 * bv + br ^ 2 * bs * bu * bv +
      br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
      br * bu ^ 2 * bv * bw + br * bs * bv ^ 2 * bw - br * bu * bv ^ 2 * bw +
      br * bs * bu * bw ^ 2 - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
      bu * bv ^ 2 * bw ^ 2 = 0)
    (e5 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv - br * bs ^ 3 + br ^ 2 * bs * bu +
      br * bs ^ 2 * bu - br * bs * bu ^ 2 + br * bs ^ 2 * bv -
      br ^ 2 * bu * bv - br * bs * bu * bv + br * bu ^ 2 * bv +
      bs * bu * bv ^ 2 - bu ^ 2 * bv ^ 2 - bs * bv ^ 2 + bu * bv ^ 2 = 0)
    (e7 : bs ^ 3 * bu - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv +
      bs * bu ^ 2 * bv - bs ^ 3 + bs ^ 2 * bu + bs ^ 2 * bv +
      bs * bu * bv - bu ^ 2 * bv - bs * bv ^ 2 - bs * bu + bu * bv = 0)
    (e8 : -bs ^ 2 * bv * bw + bs * bv ^ 2 * bw + bs ^ 2 * bw ^ 2 -
      bs * bv * bw ^ 2 - bs ^ 2 * bw + bs * bv * bw - bv ^ 2 * bw +
      bs ^ 2 - bs * bv + bv * bw = 0)
    (e9 : br * bs ^ 2 * bv - br * bs * bv ^ 2 - br * bs ^ 2 + br ^ 2 * bv +
      br * bs * bv - br * bv ^ 2 + bv ^ 3 - br * bv = 0) :
    br * bs ^ 2 * bw ^ 2 * (bv - 1) ^ 2 = 0 := by
  grobner
