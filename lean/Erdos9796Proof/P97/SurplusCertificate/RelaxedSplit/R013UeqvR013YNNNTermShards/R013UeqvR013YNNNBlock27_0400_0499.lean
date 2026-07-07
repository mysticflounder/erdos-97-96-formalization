/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 27:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_27_0400_0499 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0400 : Poly :=
[
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 400 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0400 : Poly :=
[
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0400_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0400
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0401 : Poly :=
[
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 401 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0401 : Poly :=
[
  term ((-2497616592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2497616592 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0401_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0401
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0402 : Poly :=
[
  term ((-61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 402 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0402 : Poly :=
[
  term ((123276744000 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-61638372000 : Rat) / 150171761) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((123276744000 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((-61638372000 : Rat) / 150171761) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0402_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0402
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0403 : Poly :=
[
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 403 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0403 : Poly :=
[
  term ((5938262210174415300 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0403_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0403
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0404 : Poly :=
[
  term ((-388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 404 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0404 : Poly :=
[
  term ((776058000 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((388029000 : Rat) / 8578069) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0404_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0404
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0405 : Poly :=
[
  term ((365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 405 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0405 : Poly :=
[
  term ((-731786168278549096 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-731786168278549096 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0405_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0405
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0406 : Poly :=
[
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2)]
]

/-- Partial product 406 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0406 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2), (12, 1)],
  term ((-73350826800 : Rat) / 150171761) [(0, 2), (4, 1), (10, 1), (11, 2)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1)],
  term ((-73350826800 : Rat) / 150171761) [(1, 2), (4, 1), (10, 1), (11, 2)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0406_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0406
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0407 : Poly :=
[
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 407 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0407 : Poly :=
[
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0407_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0407
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0408 : Poly :=
[
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 408 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0408 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (13, 1), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0408_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0408
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0409 : Poly :=
[
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 409 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0409 : Poly :=
[
  term ((2898836376 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((2898836376 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(1, 2), (4, 1), (10, 1), (15, 2)],
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 2), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0409_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0409
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0410 : Poly :=
[
  term ((1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 410 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0410 : Poly :=
[
  term ((-3593174400 : Rat) / 8833633) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((1796587200 : Rat) / 8833633) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3593174400 : Rat) / 8833633) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 2)],
  term ((1796587200 : Rat) / 8833633) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0410_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0410
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0411 : Poly :=
[
  term ((-61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 411 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0411 : Poly :=
[
  term ((123524193600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((123524193600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-123524193600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((-123524193600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0411_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0411
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0412 : Poly :=
[
  term ((5546335800 : Rat) / 8833633) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 412 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0412 : Poly :=
[
  term ((-11092671600 : Rat) / 8833633) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((5546335800 : Rat) / 8833633) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-11092671600 : Rat) / 8833633) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((5546335800 : Rat) / 8833633) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((11092671600 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5546335800 : Rat) / 8833633) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5546335800 : Rat) / 8833633) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((11092671600 : Rat) / 8833633) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0412_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0412
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0413 : Poly :=
[
  term ((10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 413 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0413 : Poly :=
[
  term ((-21783553200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((10891776600 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-21783553200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 2), (14, 1)],
  term ((10891776600 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((21783553200 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 3)],
  term ((21783553200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0413_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0413
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0414 : Poly :=
[
  term ((17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 414 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0414 : Poly :=
[
  term ((-34945758224825068 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-34945758224825068 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((34945758224825068 : Rat) / 1288183727709509) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((34945758224825068 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0414_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0414
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0415 : Poly :=
[
  term ((-591115979047913462 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 415 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0415 : Poly :=
[
  term ((1182231958095826924 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-591115979047913462 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((1182231958095826924 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-591115979047913462 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((-1182231958095826924 : Rat) / 1288183727709509) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1182231958095826924 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((591115979047913462 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((591115979047913462 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0415_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0415
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0416 : Poly :=
[
  term ((-111825631800 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 416 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0416 : Poly :=
[
  term ((223651263600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((-111825631800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((223651263600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((-111825631800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0416_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0416
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0417 : Poly :=
[
  term ((86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 417 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0417 : Poly :=
[
  term ((-173083836105260280 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(0, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(1, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0417_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0417
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0418 : Poly :=
[
  term ((-346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 418 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0418 : Poly :=
[
  term ((693650505780 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((693650505780 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-693650505780 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 4)],
  term ((-693650505780 : Rat) / 150171761) [(4, 1), (11, 2), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0418_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0418
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0419 : Poly :=
[
  term ((1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 419 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0419 : Poly :=
[
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0419_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0419
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0420 : Poly :=
[
  term ((534335921235516795 : Rat) / 151551026789354) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 420 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0420 : Poly :=
[
  term ((-534335921235516795 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((534335921235516795 : Rat) / 151551026789354) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-534335921235516795 : Rat) / 75775513394677) [(1, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((534335921235516795 : Rat) / 151551026789354) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((534335921235516795 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-534335921235516795 : Rat) / 151551026789354) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-534335921235516795 : Rat) / 151551026789354) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((534335921235516795 : Rat) / 75775513394677) [(4, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0420_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0420
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0421 : Poly :=
[
  term ((-24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)]
]

/-- Partial product 421 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0421 : Poly :=
[
  term ((49857526800 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2), (14, 1)],
  term ((49857526800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2), (14, 1)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 2)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0421_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0421
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0422 : Poly :=
[
  term ((-513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 422 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0422 : Poly :=
[
  term ((1026041855048198450 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((1026041855048198450 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 4)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0422_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0422
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0423 : Poly :=
[
  term ((-4309468239400398280 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 423 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0423 : Poly :=
[
  term ((8618936478800796560 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4309468239400398280 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((8618936478800796560 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4309468239400398280 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (15, 2)],
  term ((-8618936478800796560 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8618936478800796560 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((4309468239400398280 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((4309468239400398280 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0423_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0423
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0424 : Poly :=
[
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 424 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0424 : Poly :=
[
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 3)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0424_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0424
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0425 : Poly :=
[
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 425 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0425 : Poly :=
[
  term ((10773320285727507195 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((10773320285727507195 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0425_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0425
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0426 : Poly :=
[
  term ((2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 426 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0426 : Poly :=
[
  term ((-4547240672 : Rat) / 8578069) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4547240672 : Rat) / 8578069) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 2), (15, 2)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0426_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0426
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0427 : Poly :=
[
  term (-168 : Rat) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 427 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0427 : Poly :=
[
  term (336 : Rat) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term (-168 : Rat) [(0, 2), (4, 1), (12, 1), (15, 2)],
  term (336 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term (-168 : Rat) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term (-336 : Rat) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term (168 : Rat) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (168 : Rat) [(4, 1), (12, 1), (15, 4)],
  term (-336 : Rat) [(4, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0427_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0427
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0428 : Poly :=
[
  term ((2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 428 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0428 : Poly :=
[
  term ((-5370983548 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5370983548 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (14, 1), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(1, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((5370983548 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 3), (15, 1)],
  term ((5370983548 : Rat) / 8578069) [(4, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0428_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0428
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0429 : Poly :=
[
  term ((-3018161066 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 429 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0429 : Poly :=
[
  term ((6036322132 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3018161066 : Rat) / 8578069) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((6036322132 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-3018161066 : Rat) / 8578069) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-6036322132 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3018161066 : Rat) / 8578069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3018161066 : Rat) / 8578069) [(4, 1), (13, 1), (15, 3)],
  term ((-6036322132 : Rat) / 8578069) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0429_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0429
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0430 : Poly :=
[
  term ((-5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 430 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0430 : Poly :=
[
  term ((10427432920 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((10427432920 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((-10427432920 : Rat) / 25734207) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-10427432920 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 4)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0430_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0430
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0431 : Poly :=
[
  term ((9097956352 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 431 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0431 : Poly :=
[
  term ((-18195912704 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((9097956352 : Rat) / 25734207) [(0, 2), (4, 1), (15, 2)],
  term ((-18195912704 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((9097956352 : Rat) / 25734207) [(1, 2), (4, 1), (15, 2)],
  term ((18195912704 : Rat) / 25734207) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((18195912704 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)],
  term ((-9097956352 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((-9097956352 : Rat) / 25734207) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0431_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0431
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0432 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 432 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0432 : Poly :=
[
  term ((6149654400 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3074827200 : Rat) / 150171761) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((6149654400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((-3074827200 : Rat) / 150171761) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0432_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0432
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0433 : Poly :=
[
  term ((1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)]
]

/-- Partial product 433 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0433 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(0, 2), (4, 2), (11, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(1, 2), (4, 2), (11, 1), (15, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0433_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0433
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0434 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 434 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0434 : Poly :=
[
  term ((296229922564736280 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 2), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (13, 2), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(1, 2), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0434_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0434
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0435 : Poly :=
[
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)]
]

/-- Partial product 435 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0435 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (12, 1), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(0, 2), (4, 2), (11, 2), (15, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (13, 1), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(1, 2), (4, 2), (11, 2), (15, 2)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0435_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0435
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0436 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)]
]

/-- Partial product 436 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0436 : Poly :=
[
  term ((925633376 : Rat) / 8578069) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(0, 2), (4, 2), (13, 1), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(1, 1), (4, 2), (13, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(1, 2), (4, 2), (13, 1), (15, 1)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 3)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0436_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0436
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0437 : Poly :=
[
  term ((231408344 : Rat) / 8578069) [(4, 2), (15, 2)]
]

/-- Partial product 437 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0437 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(0, 2), (4, 2), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(1, 2), (4, 2), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 3)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (14, 2), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0437_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0437
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0438 : Poly :=
[
  term ((9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 438 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0438 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0438_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0438
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0439 : Poly :=
[
  term ((457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 2)]
]

/-- Partial product 439 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0439 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(0, 2), (5, 1), (7, 1), (11, 2), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(1, 2), (5, 1), (7, 1), (11, 2), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0439_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0439
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0440 : Poly :=
[
  term ((1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 440 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0440 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(0, 2), (5, 1), (7, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(1, 2), (5, 1), (7, 1), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0440_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0440
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0441 : Poly :=
[
  term ((-170747818800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 441 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0441 : Poly :=
[
  term ((341495637600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-170747818800 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((341495637600 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-170747818800 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-341495637600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-341495637600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((170747818800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((170747818800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0441_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0441
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0442 : Poly :=
[
  term ((-24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 442 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0442 : Poly :=
[
  term ((49857526800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((49857526800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0442_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0442
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0443 : Poly :=
[
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 443 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0443 : Poly :=
[
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(0, 2), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(1, 2), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0443_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0443
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0444 : Poly :=
[
  term ((-8224952143850818935 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 444 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0444 : Poly :=
[
  term ((16449904287701637870 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8224952143850818935 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((16449904287701637870 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8224952143850818935 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-16449904287701637870 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-16449904287701637870 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((8224952143850818935 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((8224952143850818935 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0444_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0444
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0445 : Poly :=
[
  term ((724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 445 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0445 : Poly :=
[
  term ((-1449418188 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1449418188 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0445_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0445
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0446 : Poly :=
[
  term ((-1447304812 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 446 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0446 : Poly :=
[
  term ((2894609624 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1447304812 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((2894609624 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1447304812 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2894609624 : Rat) / 8578069) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2894609624 : Rat) / 8578069) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((1447304812 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((1447304812 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0446_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0446
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0447 : Poly :=
[
  term ((73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)]
]

/-- Partial product 447 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0447 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1), (12, 1)],
  term ((73350826800 : Rat) / 150171761) [(0, 2), (5, 1), (10, 2), (11, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((73350826800 : Rat) / 150171761) [(1, 2), (5, 1), (10, 2), (11, 1)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0447_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0447
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0448 : Poly :=
[
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 448 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0448 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0448_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0448
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0449 : Poly :=
[
  term ((411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 449 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0449 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (12, 1), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(0, 2), (5, 1), (10, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0449_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0449
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0450 : Poly :=
[
  term ((238910106000 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 450 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0450 : Poly :=
[
  term ((-477820212000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((238910106000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((-477820212000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((238910106000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((477820212000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((477820212000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-238910106000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((-238910106000 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0450_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0450
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0451 : Poly :=
[
  term ((-87541141000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 451 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0451 : Poly :=
[
  term ((175082282000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-87541141000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((175082282000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-87541141000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-175082282000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((87541141000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((87541141000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-175082282000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0451_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0451
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0452 : Poly :=
[
  term ((-10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 452 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0452 : Poly :=
[
  term ((20319188400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-10159594200 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((20319188400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10159594200 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-20319188400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((-20319188400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0452_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0452
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0453 : Poly :=
[
  term ((-32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)]
]

/-- Partial product 453 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0453 : Poly :=
[
  term ((65819864800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 3)],
  term ((-32909932400 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 2)],
  term ((65819864800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1)],
  term ((-32909932400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 2)],
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0453_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0453
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0454 : Poly :=
[
  term ((-61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 454 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0454 : Poly :=
[
  term ((122059828800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0454_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0454
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0455 : Poly :=
[
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 455 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0455 : Poly :=
[
  term ((4735900000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2367950000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((4735900000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((-2367950000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0455_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0455
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0456 : Poly :=
[
  term ((148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 456 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0456 : Poly :=
[
  term ((-296376773200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((148188386600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-296376773200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((148188386600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((296376773200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((296376773200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0456_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0456
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0457 : Poly :=
[
  term ((-55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 457 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0457 : Poly :=
[
  term ((111995631600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-55997815800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 2)],
  term ((111995631600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-55997815800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 2)],
  term ((-111995631600 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((-111995631600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0457_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0457
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0458 : Poly :=
[
  term ((-66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 458 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0458 : Poly :=
[
  term ((133295987600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-66647993800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((133295987600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-66647993800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-133295987600 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-133295987600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0458_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0458
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0459 : Poly :=
[
  term ((-978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 459 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0459 : Poly :=
[
  term ((978778841020771455 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((978778841020771455 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-978778841020771455 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-978778841020771455 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0459_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0459
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0460 : Poly :=
[
  term ((-8433743990445596525 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 460 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0460 : Poly :=
[
  term ((8433743990445596525 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-8433743990445596525 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((8433743990445596525 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8433743990445596525 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8433743990445596525 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((8433743990445596525 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((8433743990445596525 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-8433743990445596525 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0460_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0460
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0461 : Poly :=
[
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 461 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0461 : Poly :=
[
  term ((3170554340895223510 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 3), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((3170554340895223510 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 3)],
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0461_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0461
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0462 : Poly :=
[
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 462 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0462 : Poly :=
[
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 2), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 4)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0462_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0462
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0463 : Poly :=
[
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 463 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0463 : Poly :=
[
  term ((228129127105798750 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 3), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 3)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0463_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0463
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0464 : Poly :=
[
  term ((14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 464 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0464 : Poly :=
[
  term ((-14276520738307246465 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((14276520738307246465 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-14276520738307246465 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((14276520738307246465 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((14276520738307246465 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((14276520738307246465 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0464_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0464
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0465 : Poly :=
[
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 465 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0465 : Poly :=
[
  term ((5394849062811843795 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((5394849062811843795 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-5394849062811843795 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-5394849062811843795 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0465_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0465
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0466 : Poly :=
[
  term ((11508341379364820325 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 466 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0466 : Poly :=
[
  term ((-23016682758729640650 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((11508341379364820325 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-23016682758729640650 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((11508341379364820325 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((23016682758729640650 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((23016682758729640650 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-11508341379364820325 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-11508341379364820325 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0466_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0466
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0467 : Poly :=
[
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 3)]
]

/-- Partial product 467 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0467 : Poly :=
[
  term ((6420890917860042245 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 3)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (15, 3)],
  term ((-6420890917860042245 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-6420890917860042245 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 4)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0467_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0467
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0468 : Poly :=
[
  term ((-3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 468 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0468 : Poly :=
[
  term ((6133527356 : Rat) / 8578069) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((6133527356 : Rat) / 8578069) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6133527356 : Rat) / 8578069) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-6133527356 : Rat) / 8578069) [(5, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0468_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0468
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0469 : Poly :=
[
  term ((1627750450 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 469 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0469 : Poly :=
[
  term ((-3255500900 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((1627750450 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3255500900 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((1627750450 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((3255500900 : Rat) / 25734207) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1627750450 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1627750450 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)],
  term ((3255500900 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0469_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0469
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0470 : Poly :=
[
  term ((6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 470 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0470 : Poly :=
[
  term ((-12110884984 : Rat) / 25734207) [(0, 1), (5, 1), (12, 3), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(0, 2), (5, 1), (12, 2), (15, 1)],
  term ((-12110884984 : Rat) / 25734207) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(1, 2), (5, 1), (12, 2), (15, 1)],
  term ((12110884984 : Rat) / 25734207) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 3)],
  term ((12110884984 : Rat) / 25734207) [(5, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0470_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0470
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0471 : Poly :=
[
  term ((-1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 471 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0471 : Poly :=
[
  term ((3644774992 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((3644774992 : Rat) / 8578069) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-3644774992 : Rat) / 8578069) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (15, 4)],
  term ((-3644774992 : Rat) / 8578069) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0471_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0471
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0472 : Poly :=
[
  term ((12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 472 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0472 : Poly :=
[
  term ((-25752607000 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (15, 3)],
  term ((25752607000 : Rat) / 25734207) [(5, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0472_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0472
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0473 : Poly :=
[
  term ((5306197222 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 473 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0473 : Poly :=
[
  term ((-10612394444 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((5306197222 : Rat) / 25734207) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-10612394444 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((5306197222 : Rat) / 25734207) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((10612394444 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((10612394444 : Rat) / 25734207) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5306197222 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((-5306197222 : Rat) / 25734207) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0473_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0473
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0474 : Poly :=
[
  term ((-1203406902 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 474 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0474 : Poly :=
[
  term ((2406813804 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(0, 2), (5, 1), (14, 2), (15, 1)],
  term ((2406813804 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((-2406813804 : Rat) / 8578069) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-2406813804 : Rat) / 8578069) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (14, 2), (15, 3)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0474_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0474
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0475 : Poly :=
[
  term ((15633804500 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 475 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0475 : Poly :=
[
  term ((-31267609000 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((15633804500 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term ((-31267609000 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((15633804500 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term ((31267609000 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((31267609000 : Rat) / 8578069) [(5, 1), (13, 1), (15, 2)],
  term ((-15633804500 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((-15633804500 : Rat) / 8578069) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0475_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0475
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0476 : Poly :=
[
  term ((-8823937166 : Rat) / 25734207) [(5, 1), (15, 3)]
]

/-- Partial product 476 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0476 : Poly :=
[
  term ((17647874332 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((-8823937166 : Rat) / 25734207) [(0, 2), (5, 1), (15, 3)],
  term ((17647874332 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-8823937166 : Rat) / 25734207) [(1, 2), (5, 1), (15, 3)],
  term ((-17647874332 : Rat) / 25734207) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-17647874332 : Rat) / 25734207) [(5, 1), (13, 1), (15, 4)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (14, 2), (15, 3)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0476_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0476
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0477 : Poly :=
[
  term (-160 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 477 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0477 : Poly :=
[
  term (320 : Rat) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term (-160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (320 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-160 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (-320 : Rat) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term (-320 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term (160 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (160 : Rat) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0477_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0477
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0478 : Poly :=
[
  term (336 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 478 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0478 : Poly :=
[
  term (-672 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term (336 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (-672 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term (336 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (672 : Rat) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term (672 : Rat) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (-336 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (-336 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0478_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0478
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0479 : Poly :=
[
  term (-192 : Rat) [(7, 1), (9, 1), (10, 2)]
]

/-- Partial product 479 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0479 : Poly :=
[
  term (384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 2)],
  term (384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 2)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 2), (14, 2)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0479_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0479
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0480 : Poly :=
[
  term (96 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 480 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0480 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0480_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0480
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0481 : Poly :=
[
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 481 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0481 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0481_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0481
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0482 : Poly :=
[
  term ((-2618371985 : Rat) / 8578069) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 482 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0482 : Poly :=
[
  term ((5236743970 : Rat) / 8578069) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2618371985 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((5236743970 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2618371985 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-5236743970 : Rat) / 8578069) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5236743970 : Rat) / 8578069) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((2618371985 : Rat) / 8578069) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((2618371985 : Rat) / 8578069) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0482_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0482
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0483 : Poly :=
[
  term (-96 : Rat) [(7, 1), (10, 2), (15, 1)]
]

/-- Partial product 483 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0483 : Poly :=
[
  term (192 : Rat) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (10, 2), (15, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (10, 2), (15, 1)],
  term (-192 : Rat) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term (-192 : Rat) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term (96 : Rat) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term (96 : Rat) [(7, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0483_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0483
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0484 : Poly :=
[
  term ((848940756 : Rat) / 6529207) [(7, 1), (11, 1)]
]

/-- Partial product 484 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0484 : Poly :=
[
  term ((-1697881512 : Rat) / 6529207) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((848940756 : Rat) / 6529207) [(0, 2), (7, 1), (11, 1)],
  term ((-1697881512 : Rat) / 6529207) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((848940756 : Rat) / 6529207) [(1, 2), (7, 1), (11, 1)],
  term ((1697881512 : Rat) / 6529207) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((1697881512 : Rat) / 6529207) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-848940756 : Rat) / 6529207) [(7, 1), (11, 1), (14, 2)],
  term ((-848940756 : Rat) / 6529207) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0484_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0484
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0485 : Poly :=
[
  term ((-120978719800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 485 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0485 : Poly :=
[
  term ((241957439600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-120978719800 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((241957439600 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-120978719800 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-241957439600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((120978719800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((120978719800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-241957439600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0485_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0485
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0486 : Poly :=
[
  term ((98696143016 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 486 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0486 : Poly :=
[
  term ((-197392286032 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((98696143016 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-197392286032 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((98696143016 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((197392286032 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((197392286032 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-98696143016 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-98696143016 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0486_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0486
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0487 : Poly :=
[
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 487 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0487 : Poly :=
[
  term ((129825739000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-64912869500 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((129825739000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-64912869500 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0487_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0487
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0488 : Poly :=
[
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 488 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0488 : Poly :=
[
  term ((129825739000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-64912869500 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((129825739000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-64912869500 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0488_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0488
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0489 : Poly :=
[
  term ((-11655131969150958395 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 489 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0489 : Poly :=
[
  term ((11655131969150958395 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-11655131969150958395 : Rat) / 2576367455419018) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((11655131969150958395 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11655131969150958395 : Rat) / 2576367455419018) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11655131969150958395 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((11655131969150958395 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((11655131969150958395 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-11655131969150958395 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0489_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0489
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0490 : Poly :=
[
  term ((11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 490 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0490 : Poly :=
[
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(0, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(1, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((11591755126317078715 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0490_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0490
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0491 : Poly :=
[
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 491 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0491 : Poly :=
[
  term ((12507456877862815475 : Rat) / 2576367455419018) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0491_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0491
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0492 : Poly :=
[
  term ((254154250529139543 : Rat) / 224031952645132) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 492 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0492 : Poly :=
[
  term ((-254154250529139543 : Rat) / 112015976322566) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((254154250529139543 : Rat) / 224031952645132) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-254154250529139543 : Rat) / 112015976322566) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((254154250529139543 : Rat) / 224031952645132) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((254154250529139543 : Rat) / 112015976322566) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((254154250529139543 : Rat) / 112015976322566) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-254154250529139543 : Rat) / 224031952645132) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-254154250529139543 : Rat) / 224031952645132) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0492_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0492
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0493 : Poly :=
[
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)]
]

/-- Partial product 493 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0493 : Poly :=
[
  term ((12507456877862815475 : Rat) / 2576367455419018) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 3)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 1), (15, 4)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0493_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0493
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0494 : Poly :=
[
  term ((14885382718 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 494 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0494 : Poly :=
[
  term ((-29770765436 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((14885382718 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-29770765436 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((14885382718 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((29770765436 : Rat) / 25734207) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14885382718 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-14885382718 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)],
  term ((29770765436 : Rat) / 25734207) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0494_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0494
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0495 : Poly :=
[
  term ((-18072718718 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 495 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0495 : Poly :=
[
  term ((36145437436 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-18072718718 : Rat) / 25734207) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((36145437436 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18072718718 : Rat) / 25734207) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-36145437436 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-36145437436 : Rat) / 25734207) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((18072718718 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((18072718718 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0495_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0495
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0496 : Poly :=
[
  term ((8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 496 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0496 : Poly :=
[
  term ((-16494695950 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-16494695950 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0496_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0496
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0497 : Poly :=
[
  term ((40207135 : Rat) / 145391) [(7, 1), (15, 1)]
]

/-- Partial product 497 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0497 : Poly :=
[
  term ((-80414270 : Rat) / 145391) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((40207135 : Rat) / 145391) [(0, 2), (7, 1), (15, 1)],
  term ((-80414270 : Rat) / 145391) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((40207135 : Rat) / 145391) [(1, 2), (7, 1), (15, 1)],
  term ((80414270 : Rat) / 145391) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((80414270 : Rat) / 145391) [(7, 1), (13, 1), (15, 2)],
  term ((-40207135 : Rat) / 145391) [(7, 1), (14, 2), (15, 1)],
  term ((-40207135 : Rat) / 145391) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0497_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0497
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0498 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0498 : Poly :=
[
  term (-4 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0498_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0498
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0499 : Poly :=
[
  term ((8247347975 : Rat) / 25734207) [(7, 1), (15, 3)]
]

/-- Partial product 499 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0499 : Poly :=
[
  term ((-16494695950 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((8247347975 : Rat) / 25734207) [(0, 2), (7, 1), (15, 3)],
  term ((-16494695950 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((8247347975 : Rat) / 25734207) [(1, 2), (7, 1), (15, 3)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (13, 1), (15, 4)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0499_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0499
        rs_R013_ueqv_R013YNNN_generator_27_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_27_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_27_0400_0499 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_27_0400,
  rs_R013_ueqv_R013YNNN_partial_27_0401,
  rs_R013_ueqv_R013YNNN_partial_27_0402,
  rs_R013_ueqv_R013YNNN_partial_27_0403,
  rs_R013_ueqv_R013YNNN_partial_27_0404,
  rs_R013_ueqv_R013YNNN_partial_27_0405,
  rs_R013_ueqv_R013YNNN_partial_27_0406,
  rs_R013_ueqv_R013YNNN_partial_27_0407,
  rs_R013_ueqv_R013YNNN_partial_27_0408,
  rs_R013_ueqv_R013YNNN_partial_27_0409,
  rs_R013_ueqv_R013YNNN_partial_27_0410,
  rs_R013_ueqv_R013YNNN_partial_27_0411,
  rs_R013_ueqv_R013YNNN_partial_27_0412,
  rs_R013_ueqv_R013YNNN_partial_27_0413,
  rs_R013_ueqv_R013YNNN_partial_27_0414,
  rs_R013_ueqv_R013YNNN_partial_27_0415,
  rs_R013_ueqv_R013YNNN_partial_27_0416,
  rs_R013_ueqv_R013YNNN_partial_27_0417,
  rs_R013_ueqv_R013YNNN_partial_27_0418,
  rs_R013_ueqv_R013YNNN_partial_27_0419,
  rs_R013_ueqv_R013YNNN_partial_27_0420,
  rs_R013_ueqv_R013YNNN_partial_27_0421,
  rs_R013_ueqv_R013YNNN_partial_27_0422,
  rs_R013_ueqv_R013YNNN_partial_27_0423,
  rs_R013_ueqv_R013YNNN_partial_27_0424,
  rs_R013_ueqv_R013YNNN_partial_27_0425,
  rs_R013_ueqv_R013YNNN_partial_27_0426,
  rs_R013_ueqv_R013YNNN_partial_27_0427,
  rs_R013_ueqv_R013YNNN_partial_27_0428,
  rs_R013_ueqv_R013YNNN_partial_27_0429,
  rs_R013_ueqv_R013YNNN_partial_27_0430,
  rs_R013_ueqv_R013YNNN_partial_27_0431,
  rs_R013_ueqv_R013YNNN_partial_27_0432,
  rs_R013_ueqv_R013YNNN_partial_27_0433,
  rs_R013_ueqv_R013YNNN_partial_27_0434,
  rs_R013_ueqv_R013YNNN_partial_27_0435,
  rs_R013_ueqv_R013YNNN_partial_27_0436,
  rs_R013_ueqv_R013YNNN_partial_27_0437,
  rs_R013_ueqv_R013YNNN_partial_27_0438,
  rs_R013_ueqv_R013YNNN_partial_27_0439,
  rs_R013_ueqv_R013YNNN_partial_27_0440,
  rs_R013_ueqv_R013YNNN_partial_27_0441,
  rs_R013_ueqv_R013YNNN_partial_27_0442,
  rs_R013_ueqv_R013YNNN_partial_27_0443,
  rs_R013_ueqv_R013YNNN_partial_27_0444,
  rs_R013_ueqv_R013YNNN_partial_27_0445,
  rs_R013_ueqv_R013YNNN_partial_27_0446,
  rs_R013_ueqv_R013YNNN_partial_27_0447,
  rs_R013_ueqv_R013YNNN_partial_27_0448,
  rs_R013_ueqv_R013YNNN_partial_27_0449,
  rs_R013_ueqv_R013YNNN_partial_27_0450,
  rs_R013_ueqv_R013YNNN_partial_27_0451,
  rs_R013_ueqv_R013YNNN_partial_27_0452,
  rs_R013_ueqv_R013YNNN_partial_27_0453,
  rs_R013_ueqv_R013YNNN_partial_27_0454,
  rs_R013_ueqv_R013YNNN_partial_27_0455,
  rs_R013_ueqv_R013YNNN_partial_27_0456,
  rs_R013_ueqv_R013YNNN_partial_27_0457,
  rs_R013_ueqv_R013YNNN_partial_27_0458,
  rs_R013_ueqv_R013YNNN_partial_27_0459,
  rs_R013_ueqv_R013YNNN_partial_27_0460,
  rs_R013_ueqv_R013YNNN_partial_27_0461,
  rs_R013_ueqv_R013YNNN_partial_27_0462,
  rs_R013_ueqv_R013YNNN_partial_27_0463,
  rs_R013_ueqv_R013YNNN_partial_27_0464,
  rs_R013_ueqv_R013YNNN_partial_27_0465,
  rs_R013_ueqv_R013YNNN_partial_27_0466,
  rs_R013_ueqv_R013YNNN_partial_27_0467,
  rs_R013_ueqv_R013YNNN_partial_27_0468,
  rs_R013_ueqv_R013YNNN_partial_27_0469,
  rs_R013_ueqv_R013YNNN_partial_27_0470,
  rs_R013_ueqv_R013YNNN_partial_27_0471,
  rs_R013_ueqv_R013YNNN_partial_27_0472,
  rs_R013_ueqv_R013YNNN_partial_27_0473,
  rs_R013_ueqv_R013YNNN_partial_27_0474,
  rs_R013_ueqv_R013YNNN_partial_27_0475,
  rs_R013_ueqv_R013YNNN_partial_27_0476,
  rs_R013_ueqv_R013YNNN_partial_27_0477,
  rs_R013_ueqv_R013YNNN_partial_27_0478,
  rs_R013_ueqv_R013YNNN_partial_27_0479,
  rs_R013_ueqv_R013YNNN_partial_27_0480,
  rs_R013_ueqv_R013YNNN_partial_27_0481,
  rs_R013_ueqv_R013YNNN_partial_27_0482,
  rs_R013_ueqv_R013YNNN_partial_27_0483,
  rs_R013_ueqv_R013YNNN_partial_27_0484,
  rs_R013_ueqv_R013YNNN_partial_27_0485,
  rs_R013_ueqv_R013YNNN_partial_27_0486,
  rs_R013_ueqv_R013YNNN_partial_27_0487,
  rs_R013_ueqv_R013YNNN_partial_27_0488,
  rs_R013_ueqv_R013YNNN_partial_27_0489,
  rs_R013_ueqv_R013YNNN_partial_27_0490,
  rs_R013_ueqv_R013YNNN_partial_27_0491,
  rs_R013_ueqv_R013YNNN_partial_27_0492,
  rs_R013_ueqv_R013YNNN_partial_27_0493,
  rs_R013_ueqv_R013YNNN_partial_27_0494,
  rs_R013_ueqv_R013YNNN_partial_27_0495,
  rs_R013_ueqv_R013YNNN_partial_27_0496,
  rs_R013_ueqv_R013YNNN_partial_27_0497,
  rs_R013_ueqv_R013YNNN_partial_27_0498,
  rs_R013_ueqv_R013YNNN_partial_27_0499
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_27_0400_0499 : Poly :=
[
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2497616592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((123276744000 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-731786168278549096 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2), (12, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-11092671600 : Rat) / 8833633) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21783553200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-34945758224825068 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1182231958095826924 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3593174400 : Rat) / 8833633) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((123524193600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((223651263600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-534335921235516795 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((49857526800 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1), (14, 1)],
  term ((1026041855048198450 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((8618936478800796560 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((693650505780 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((10773320285727507195 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-5370983548 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6036322132 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10427432920 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18195912704 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((-4547240672 : Rat) / 8578069) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term (336 : Rat) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term ((6149654400 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3074827200 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (12, 1), (15, 2)],
  term ((925633376 : Rat) / 8578069) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((341495637600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((49857526800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((16449904287701637870 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1449418188 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2894609624 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1), (12, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-477820212000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-296376773200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((111995631600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((133295987600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((175082282000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((20319188400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((65819864800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 3)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-14276520738307246465 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((5394849062811843795 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-23016682758729640650 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((6420890917860042245 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 3)],
  term ((978778841020771455 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((8433743990445596525 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((3170554340895223510 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 3), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-25752607000 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10612394444 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((2406813804 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-31267609000 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((17647874332 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((6133527356 : Rat) / 8578069) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3255500900 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-12110884984 : Rat) / 25734207) [(0, 1), (5, 1), (12, 3), (15, 1)],
  term (-672 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term (320 : Rat) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((5236743970 : Rat) / 8578069) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1697881512 : Rat) / 6529207) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-197392286032 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((129825739000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((129825739000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((241957439600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-254154250529139543 : Rat) / 112015976322566) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 3)],
  term ((11655131969150958395 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((36145437436 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16494695950 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-80414270 : Rat) / 145391) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16494695950 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((-29770765436 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-61638372000 : Rat) / 150171761) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(0, 2), (4, 1), (10, 1), (11, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1449418188 : Rat) / 8578069) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((1796587200 : Rat) / 8833633) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-61762096800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((5546335800 : Rat) / 8833633) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((10891776600 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-591115979047913462 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((-111825631800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((86541918052630140 : Rat) / 75775513394677) [(0, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-346825252890 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((534335921235516795 : Rat) / 151551026789354) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-24928763400 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2), (14, 1)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-4309468239400398280 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term (-168 : Rat) [(0, 2), (4, 1), (12, 1), (15, 2)],
  term ((2685491774 : Rat) / 8578069) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3018161066 : Rat) / 8578069) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((-5213716460 : Rat) / 25734207) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((9097956352 : Rat) / 25734207) [(0, 2), (4, 1), (15, 2)],
  term ((-3074827200 : Rat) / 150171761) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((1537413600 : Rat) / 150171761) [(0, 2), (4, 2), (11, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 2), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(0, 2), (4, 2), (11, 2), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(0, 2), (4, 2), (13, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(0, 2), (4, 2), (15, 2)],
  term ((9504862400 : Rat) / 150171761) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(0, 2), (5, 1), (7, 1), (11, 2), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(0, 2), (5, 1), (7, 1), (15, 2)],
  term ((-170747818800 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-24928763400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(0, 2), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-8224952143850818935 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1447304812 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(0, 2), (5, 1), (10, 2), (11, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(0, 2), (5, 1), (10, 2), (15, 1)],
  term ((238910106000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((-87541141000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-10159594200 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32909932400 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2367950000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((148188386600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-55997815800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 2)],
  term ((-66647993800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-8433743990445596525 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((14276520738307246465 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((11508341379364820325 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(0, 2), (5, 1), (11, 2), (15, 3)],
  term ((-3066763678 : Rat) / 8578069) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((1627750450 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(0, 2), (5, 1), (12, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((12876303500 : Rat) / 25734207) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((5306197222 : Rat) / 25734207) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(0, 2), (5, 1), (14, 2), (15, 1)],
  term ((15633804500 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term ((-8823937166 : Rat) / 25734207) [(0, 2), (5, 1), (15, 3)],
  term (-160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (336 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 2)],
  term (96 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2618371985 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (10, 2), (15, 1)],
  term ((848940756 : Rat) / 6529207) [(0, 2), (7, 1), (11, 1)],
  term ((-120978719800 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((98696143016 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-64912869500 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((-64912869500 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((-11655131969150958395 : Rat) / 2576367455419018) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(0, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((254154250529139543 : Rat) / 224031952645132) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 3)],
  term ((14885382718 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-18072718718 : Rat) / 25734207) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((40207135 : Rat) / 145391) [(0, 2), (7, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((8247347975 : Rat) / 25734207) [(0, 2), (7, 1), (15, 3)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2497616592 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((123276744000 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-731786168278549096 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((123524193600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3593174400 : Rat) / 8833633) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 2)],
  term ((-34945758224825068 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1182231958095826924 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11092671600 : Rat) / 8833633) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((-21783553200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 2), (14, 1)],
  term ((693650505780 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((223651263600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((49857526800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1)],
  term ((1026041855048198450 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((8618936478800796560 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-534335921235516795 : Rat) / 75775513394677) [(1, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((10773320285727507195 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term (336 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4547240672 : Rat) / 8578069) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1)],
  term ((10427432920 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-18195912704 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-5370983548 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (14, 1), (15, 1)],
  term ((6036322132 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((6149654400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (13, 1), (15, 2)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (13, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((925633376 : Rat) / 8578069) [(1, 1), (4, 2), (13, 2), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((341495637600 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((49857526800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((16449904287701637870 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1449418188 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((2894609624 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)],
  term ((175082282000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((20319188400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((65819864800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1)],
  term ((-477820212000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-296376773200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((111995631600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((133295987600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((122059828800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((978778841020771455 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((8433743990445596525 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3170554340895223510 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-14276520738307246465 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((5394849062811843795 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-23016682758729640650 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((6420890917860042245 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 3)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 2), (15, 2)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 3), (15, 1)],
  term ((6133527356 : Rat) / 8578069) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3255500900 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12110884984 : Rat) / 25734207) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10612394444 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((2406813804 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-31267609000 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((17647874332 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((3644774992 : Rat) / 8578069) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-25752607000 : Rat) / 25734207) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term (-672 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term (320 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((5236743970 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((241957439600 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1697881512 : Rat) / 6529207) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-197392286032 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((129825739000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((129825739000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((11655131969150958395 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-254154250529139543 : Rat) / 112015976322566) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((-29770765436 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((36145437436 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16494695950 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-80414270 : Rat) / 145391) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16494695950 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-61638372000 : Rat) / 150171761) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(1, 2), (4, 1), (10, 1), (11, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1449418188 : Rat) / 8578069) [(1, 2), (4, 1), (10, 1), (15, 2)],
  term ((1796587200 : Rat) / 8833633) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-61762096800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((5546335800 : Rat) / 8833633) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((10891776600 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-591115979047913462 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((-111825631800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((86541918052630140 : Rat) / 75775513394677) [(1, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-346825252890 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((534335921235516795 : Rat) / 151551026789354) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-24928763400 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2), (14, 1)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-4309468239400398280 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term (-168 : Rat) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term ((2685491774 : Rat) / 8578069) [(1, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3018161066 : Rat) / 8578069) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-5213716460 : Rat) / 25734207) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((9097956352 : Rat) / 25734207) [(1, 2), (4, 1), (15, 2)],
  term ((-3074827200 : Rat) / 150171761) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((1537413600 : Rat) / 150171761) [(1, 2), (4, 2), (11, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(1, 2), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(1, 2), (4, 2), (11, 2), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(1, 2), (4, 2), (13, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(1, 2), (4, 2), (15, 2)],
  term ((9504862400 : Rat) / 150171761) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(1, 2), (5, 1), (7, 1), (11, 2), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(1, 2), (5, 1), (7, 1), (15, 2)],
  term ((-170747818800 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-24928763400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(1, 2), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-8224952143850818935 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1447304812 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(1, 2), (5, 1), (10, 2), (11, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term ((238910106000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((-87541141000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-10159594200 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32909932400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 2)],
  term ((-61029914400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2367950000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((148188386600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-55997815800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 2)],
  term ((-66647993800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-8433743990445596525 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((14276520738307246465 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((11508341379364820325 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(1, 2), (5, 1), (11, 2), (15, 3)],
  term ((-3066763678 : Rat) / 8578069) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((1627750450 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(1, 2), (5, 1), (12, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((12876303500 : Rat) / 25734207) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((5306197222 : Rat) / 25734207) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((15633804500 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term ((-8823937166 : Rat) / 25734207) [(1, 2), (5, 1), (15, 3)],
  term (-160 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (336 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 2)],
  term (96 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2618371985 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (10, 2), (15, 1)],
  term ((848940756 : Rat) / 6529207) [(1, 2), (7, 1), (11, 1)],
  term ((-120978719800 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((98696143016 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-64912869500 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((-64912869500 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-11655131969150958395 : Rat) / 2576367455419018) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(1, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((254154250529139543 : Rat) / 224031952645132) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 3)],
  term ((14885382718 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-18072718718 : Rat) / 25734207) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((40207135 : Rat) / 145391) [(1, 2), (7, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((8247347975 : Rat) / 25734207) [(1, 2), (7, 1), (15, 3)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 3)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 3)],
  term ((-123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 3)],
  term ((-776058000 : Rat) / 8578069) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((388029000 : Rat) / 8578069) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 3)],
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 3)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 2), (15, 2)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 4)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (13, 1), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 3)],
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 2), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 4)],
  term ((11092671600 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8758429200 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-154066176000 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1182231958095826924 : Rat) / 1288183727709509) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((33220310950582604 : Rat) / 75775513394677) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-123524193600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-58484652982560332 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5546335800 : Rat) / 8833633) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 3)],
  term ((-1991038428318520324 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((21783553200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((11092671600 : Rat) / 8833633) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((591115979047913462 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term ((591115979047913462 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)],
  term ((534335921235516795 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-421895058640161165 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7421394507360451200 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-8618936478800796560 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 2)],
  term ((114649946775568880 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 4)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-693650505780 : Rat) / 150171761) [(4, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3101401258350948115 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-534335921235516795 : Rat) / 151551026789354) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-26321583618605378635 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((534335921235516795 : Rat) / 75775513394677) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 4)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((4309468239400398280 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 3)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 3), (15, 2)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (15, 2)],
  term ((4309468239400398280 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 4)],
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 3)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 3), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 3)],
  term ((-6036322132 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3097363212 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5155851520 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 2), (15, 2)],
  term ((18195912704 : Rat) / 25734207) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6104086144 : Rat) / 25734207) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (168 : Rat) [(4, 1), (12, 1), (15, 4)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term (-336 : Rat) [(4, 1), (12, 2), (14, 1), (15, 2)],
  term ((-18483908242 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((3018161066 : Rat) / 8578069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 3), (15, 1)],
  term ((27250395902 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)],
  term ((5370983548 : Rat) / 8578069) [(4, 1), (13, 2), (14, 1), (15, 2)],
  term ((-6036322132 : Rat) / 8578069) [(4, 1), (13, 2), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 4)],
  term ((-9097956352 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (14, 3), (15, 2)],
  term ((-9097956352 : Rat) / 25734207) [(4, 1), (15, 4)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 3)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 4)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(4, 2), (13, 1), (15, 3)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (13, 2), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (14, 2), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (15, 4)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 4)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 4)],
  term ((-341495637600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-341495637600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((170747818800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 3)],
  term ((170747818800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-16449904287701637870 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-16449904287701637870 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((8224952143850818935 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 3), (15, 1)],
  term ((8224952143850818935 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((-2894609624 : Rat) / 8578069) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2894609624 : Rat) / 8578069) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((1447304812 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term ((1447304812 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 3)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 3)],
  term ((-142379017200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-175082282000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((477820212000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-123136393400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((383917914200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4427653800 : Rat) / 6529207) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((87541141000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-175082282000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((740632000 : Rat) / 8833633) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3), (14, 1)],
  term ((296376773200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-50965717200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((477820212000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-72266073200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((-119691878800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 3), (15, 1)],
  term ((-148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-238910106000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((122645809600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((-148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 3)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 4)],
  term ((-238910106000 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 4)],
  term ((-6858422034252730515 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8433743990445596525 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((23016682758729640650 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-11863002994699313035 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((36986785467060089455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-426561708026213745 : Rat) / 112015976322566) [(5, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((8433743990445596525 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((-8433743990445596525 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((35676372319225900 : Rat) / 75775513394677) [(5, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 3)],
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (14, 1), (15, 1)],
  term ((14276520738307246465 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-2455027466195864265 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((23016682758729640650 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3481069321244062715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 4)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-5765578629679059685 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 3)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 3), (15, 2)],
  term ((-14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-11508341379364820325 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((5907869990335943020 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((-14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 3), (15, 1)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 4), (15, 1)],
  term ((-11508341379364820325 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 5)],
  term ((-9778302348 : Rat) / 8578069) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3255500900 : Rat) / 25734207) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((25752607000 : Rat) / 25734207) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((31267609000 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8447583298 : Rat) / 25734207) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((8984643994 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((659949874 : Rat) / 8578069) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-1627750450 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)],
  term ((12110884984 : Rat) / 25734207) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((3255500900 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-24456024560 : Rat) / 25734207) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 3)],
  term ((12110884984 : Rat) / 25734207) [(5, 1), (12, 3), (14, 1), (15, 1)],
  term ((10612394444 : Rat) / 25734207) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-584426308 : Rat) / 8578069) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((31267609000 : Rat) / 8578069) [(5, 1), (13, 1), (15, 2)],
  term ((-12180711844 : Rat) / 25734207) [(5, 1), (13, 1), (15, 4)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-23810628476 : Rat) / 25734207) [(5, 1), (13, 2), (15, 3)],
  term ((25752607000 : Rat) / 25734207) [(5, 1), (13, 3), (15, 2)],
  term ((-5306197222 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((-15633804500 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((12434157872 : Rat) / 25734207) [(5, 1), (14, 2), (15, 3)],
  term ((-5306197222 : Rat) / 25734207) [(5, 1), (14, 3), (15, 1)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (14, 4), (15, 1)],
  term ((-15633804500 : Rat) / 8578069) [(5, 1), (15, 3)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (15, 5)],
  term (672 : Rat) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term (672 : Rat) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (-336 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (-336 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 2), (14, 2)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term (-320 : Rat) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term (-320 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term (160 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (160 : Rat) [(7, 1), (9, 1), (15, 2)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 3)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-5236743970 : Rat) / 8578069) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5236743970 : Rat) / 8578069) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((2618371985 : Rat) / 8578069) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((2618371985 : Rat) / 8578069) [(7, 1), (10, 1), (15, 3)],
  term (-192 : Rat) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term (-192 : Rat) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term (96 : Rat) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term (96 : Rat) [(7, 1), (10, 2), (15, 3)],
  term ((-241957439600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1697881512 : Rat) / 6529207) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((318371005832 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((120978719800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-241957439600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((197392286032 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1697881512 : Rat) / 6529207) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-98696143016 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-848940756 : Rat) / 6529207) [(7, 1), (11, 1), (14, 2)],
  term ((129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-98696143016 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 4)],
  term ((-848940756 : Rat) / 6529207) [(7, 1), (11, 1), (15, 2)],
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 4)],
  term ((-11655131969150958395 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((254154250529139543 : Rat) / 112015976322566) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((34838642221785115825 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((11655131969150958395 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-11655131969150958395 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((254154250529139543 : Rat) / 112015976322566) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 1), (15, 4)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-254154250529139543 : Rat) / 224031952645132) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 3), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 4), (15, 1)],
  term ((-254154250529139543 : Rat) / 224031952645132) [(7, 1), (11, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 5)],
  term ((29770765436 : Rat) / 25734207) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((80414270 : Rat) / 145391) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-51030820154 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-14885382718 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)],
  term ((29770765436 : Rat) / 25734207) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-36145437436 : Rat) / 25734207) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((80414270 : Rat) / 145391) [(7, 1), (13, 1), (15, 2)],
  term (4 : Rat) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (13, 1), (15, 4)],
  term ((18072718718 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((-40207135 : Rat) / 145391) [(7, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16494695950 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((18072718718 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (14, 4), (15, 1)],
  term ((-40207135 : Rat) / 145391) [(7, 1), (15, 3)],
  term (-2 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 499. -/
theorem rs_R013_ueqv_R013YNNN_block_27_0400_0499_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_27_0400_0499
      rs_R013_ueqv_R013YNNN_block_27_0400_0499 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
