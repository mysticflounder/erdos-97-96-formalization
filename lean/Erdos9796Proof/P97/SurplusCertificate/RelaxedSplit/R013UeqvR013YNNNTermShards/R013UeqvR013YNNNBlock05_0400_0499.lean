/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 5:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_05_0400_0499 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0400 : Poly :=
[
  term ((-8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 400 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0400 : Poly :=
[
  term ((8855581533897986765 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8855581533897986765 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0400_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0400
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0401 : Poly :=
[
  term ((24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0401 : Poly :=
[
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2), (14, 1)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2), (14, 1)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0401_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0401
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0402 : Poly :=
[
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 402 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0402 : Poly :=
[
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (14, 1), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 2), (14, 1), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 2), (14, 1), (15, 2)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 4)],
  term ((1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0402_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0402
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0403 : Poly :=
[
  term ((2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 403 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0403 : Poly :=
[
  term ((-2460780757635360425 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (15, 2)],
  term ((2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (15, 2)],
  term ((2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (15, 2)],
  term ((2460780757635360425 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((-2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0403_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0403
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0404 : Poly :=
[
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 404 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0404 : Poly :=
[
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 3), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 3), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 3)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0404_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0404
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0405 : Poly :=
[
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 405 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0405 : Poly :=
[
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 3), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 3), (15, 1)],
  term ((10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0405_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0405
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0406 : Poly :=
[
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 406 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0406 : Poly :=
[
  term ((4547240672 : Rat) / 8578069) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0406_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0406
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0407 : Poly :=
[
  term (168 : Rat) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 407 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0407 : Poly :=
[
  term (-336 : Rat) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term (168 : Rat) [(4, 1), (6, 2), (12, 1), (15, 2)],
  term (168 : Rat) [(4, 1), (7, 2), (12, 1), (15, 2)],
  term (336 : Rat) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term (-168 : Rat) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (-168 : Rat) [(4, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0407_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0407
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0408 : Poly :=
[
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 408 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0408 : Poly :=
[
  term ((5370983548 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5370983548 : Rat) / 8578069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0408_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0408
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0409 : Poly :=
[
  term ((-3821820302 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 409 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0409 : Poly :=
[
  term ((7643640604 : Rat) / 25734207) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3821820302 : Rat) / 25734207) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-3821820302 : Rat) / 25734207) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-7643640604 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3821820302 : Rat) / 25734207) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3821820302 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0409_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0409
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0410 : Poly :=
[
  term ((5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 410 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0410 : Poly :=
[
  term ((-10427432920 : Rat) / 25734207) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (6, 2), (14, 1), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (7, 2), (14, 1), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 4)],
  term ((10427432920 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(4, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0410_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0410
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0411 : Poly :=
[
  term ((-7127960650 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 411 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0411 : Poly :=
[
  term ((14255921300 : Rat) / 25734207) [(4, 1), (6, 1), (15, 2)],
  term ((-7127960650 : Rat) / 25734207) [(4, 1), (6, 2), (15, 2)],
  term ((-7127960650 : Rat) / 25734207) [(4, 1), (7, 2), (15, 2)],
  term ((-14255921300 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)],
  term ((7127960650 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((7127960650 : Rat) / 25734207) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0411_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0411
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0412 : Poly :=
[
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 412 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0412 : Poly :=
[
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0412_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0412
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0413 : Poly :=
[
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)]
]

/-- Partial product 413 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0413 : Poly :=
[
  term ((3074827200 : Rat) / 150171761) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (6, 2), (11, 1), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0413_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0413
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0414 : Poly :=
[
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 414 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0414 : Poly :=
[
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0414_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0414
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0415 : Poly :=
[
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)]
]

/-- Partial product 415 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0415 : Poly :=
[
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (6, 1), (11, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (6, 2), (11, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (7, 2), (11, 2), (15, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 1), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 2), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0415_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0415
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0416 : Poly :=
[
  term ((462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)]
]

/-- Partial product 416 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0416 : Poly :=
[
  term ((-925633376 : Rat) / 8578069) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (6, 2), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0416_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0416
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0417 : Poly :=
[
  term ((-231408344 : Rat) / 8578069) [(4, 2), (15, 2)]
]

/-- Partial product 417 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0417 : Poly :=
[
  term ((462816688 : Rat) / 8578069) [(4, 2), (6, 1), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (6, 2), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (7, 2), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (14, 1), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(4, 2), (14, 2), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(4, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0417_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0417
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0418 : Poly :=
[
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 418 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0418 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0418_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0418
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0419 : Poly :=
[
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 2)]
]

/-- Partial product 419 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0419 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (6, 1), (7, 1), (11, 2), (15, 2)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (6, 2), (7, 1), (11, 2), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 4)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0419_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0419
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0420 : Poly :=
[
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 420 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0420 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (6, 2), (7, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 4)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0420_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0420
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0421 : Poly :=
[
  term ((24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 421 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0421 : Poly :=
[
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (6, 2), (10, 1), (11, 1)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (7, 2), (10, 1), (11, 1)],
  term ((48092330400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0421_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0421
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0422 : Poly :=
[
  term ((24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 422 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0422 : Poly :=
[
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0422_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0422
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0423 : Poly :=
[
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 423 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0423 : Poly :=
[
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (6, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (7, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0423_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0423
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0424 : Poly :=
[
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 424 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0424 : Poly :=
[
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0424_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0424
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0425 : Poly :=
[
  term ((-724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 425 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0425 : Poly :=
[
  term ((1449418188 : Rat) / 8578069) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0425_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0425
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0426 : Poly :=
[
  term ((624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 426 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0426 : Poly :=
[
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0426_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0426
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0427 : Poly :=
[
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)]
]

/-- Partial product 427 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0427 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(5, 1), (6, 1), (10, 2), (11, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (6, 2), (10, 2), (11, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0427_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0427
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0428 : Poly :=
[
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 428 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0428 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 2), (11, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (6, 2), (10, 2), (11, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (7, 2), (10, 2), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0428_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0428
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0429 : Poly :=
[
  term ((-411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 429 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0429 : Poly :=
[
  term ((822900664 : Rat) / 8578069) [(5, 1), (6, 1), (10, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (6, 2), (10, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0429_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0429
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0430 : Poly :=
[
  term ((-43827872500 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 430 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0430 : Poly :=
[
  term ((87655745000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)],
  term ((-43827872500 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)],
  term ((-43827872500 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)],
  term ((-87655745000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)],
  term ((43827872500 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((43827872500 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0430_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0430
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0431 : Poly :=
[
  term ((-35276175400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 431 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0431 : Poly :=
[
  term ((70552350800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-35276175400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-35276175400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-70552350800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((35276175400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((35276175400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0431_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0431
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0432 : Poly :=
[
  term ((10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 432 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0432 : Poly :=
[
  term ((-20319188400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1)],
  term ((-10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((20319188400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0432_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0432
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0433 : Poly :=
[
  term ((32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)]
]

/-- Partial product 433 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0433 : Poly :=
[
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 2)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 2)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 2)],
  term ((65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((-32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0433_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0433
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0434 : Poly :=
[
  term ((61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 434 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0434 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0434_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0434
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0435 : Poly :=
[
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 435 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0435 : Poly :=
[
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (13, 2)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (13, 2)],
  term ((4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0435_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0435
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0436 : Poly :=
[
  term ((-36192755000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 436 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0436 : Poly :=
[
  term ((72385510000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-36192755000 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (14, 1)],
  term ((-36192755000 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((36192755000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-72385510000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((36192755000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0436_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0436
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0437 : Poly :=
[
  term ((55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 437 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0437 : Poly :=
[
  term ((-111995631600 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (14, 2)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (14, 2)],
  term ((-55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((111995631600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 3)],
  term ((-55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0437_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0437
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0438 : Poly :=
[
  term ((66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 438 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0438 : Poly :=
[
  term ((-133295987600 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((133295987600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((-66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0438_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0438
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0439 : Poly :=
[
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 439 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0439 : Poly :=
[
  term ((-978778841020771455 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((978778841020771455 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0439_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0439
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0440 : Poly :=
[
  term ((-3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 440 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0440 : Poly :=
[
  term ((3398519015026943585 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((-3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-3398519015026943585 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0440_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0440
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0441 : Poly :=
[
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 441 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0441 : Poly :=
[
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0441_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0441
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0442 : Poly :=
[
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 442 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0442 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (13, 1), (15, 2)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (13, 1), (15, 2)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (13, 1), (15, 2)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0442_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0442
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0443 : Poly :=
[
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 443 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0443 : Poly :=
[
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (13, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (13, 2), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0443_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0443
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0444 : Poly :=
[
  term ((-3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 444 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0444 : Poly :=
[
  term ((3486822612683558875 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((-3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-3486822612683558875 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0444_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0444
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0445 : Poly :=
[
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 445 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0445 : Poly :=
[
  term ((-5394849062811843795 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (14, 2), (15, 1)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (14, 2), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((5394849062811843795 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 3), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0445_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0445
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0446 : Poly :=
[
  term ((-8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 446 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0446 : Poly :=
[
  term ((8444784979690653625 : Rat) / 2576367455419018) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-8444784979690653625 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0446_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0446
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0447 : Poly :=
[
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 3)]
]

/-- Partial product 447 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0447 : Poly :=
[
  term ((-6420890917860042245 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (15, 3)],
  term ((6420890917860042245 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0447_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0447
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0448 : Poly :=
[
  term ((3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 448 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0448 : Poly :=
[
  term ((-6133527356 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((6133527356 : Rat) / 8578069) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0448_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0448
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0449 : Poly :=
[
  term ((3990309562 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 449 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0449 : Poly :=
[
  term ((-7980619124 : Rat) / 25734207) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((3990309562 : Rat) / 25734207) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((3990309562 : Rat) / 25734207) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((7980619124 : Rat) / 25734207) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3990309562 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3990309562 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0449_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0449
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0450 : Poly :=
[
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 450 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0450 : Poly :=
[
  term ((12110884984 : Rat) / 25734207) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (7, 2), (12, 2), (15, 1)],
  term ((-12110884984 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0450_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0450
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0451 : Poly :=
[
  term ((1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 451 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0451 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0451_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0451
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0452 : Poly :=
[
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 452 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0452 : Poly :=
[
  term ((25752607000 : Rat) / 25734207) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0452_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0452
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0453 : Poly :=
[
  term ((1914244190 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 453 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0453 : Poly :=
[
  term ((-3828488380 : Rat) / 25734207) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((1914244190 : Rat) / 25734207) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((1914244190 : Rat) / 25734207) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-1914244190 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((3828488380 : Rat) / 25734207) [(5, 1), (14, 2), (15, 1)],
  term ((-1914244190 : Rat) / 25734207) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0453_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0453
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0454 : Poly :=
[
  term ((1203406902 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 454 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0454 : Poly :=
[
  term ((-2406813804 : Rat) / 8578069) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (6, 2), (14, 2), (15, 1)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (7, 2), (14, 2), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(5, 1), (14, 2), (15, 3)],
  term ((2406813804 : Rat) / 8578069) [(5, 1), (14, 3), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(5, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0454_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0454
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0455 : Poly :=
[
  term ((1638338005 : Rat) / 25734207) [(5, 1), (15, 1)]
]

/-- Partial product 455 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0455 : Poly :=
[
  term ((-3276676010 : Rat) / 25734207) [(5, 1), (6, 1), (15, 1)],
  term ((1638338005 : Rat) / 25734207) [(5, 1), (6, 2), (15, 1)],
  term ((1638338005 : Rat) / 25734207) [(5, 1), (7, 2), (15, 1)],
  term ((3276676010 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)],
  term ((-1638338005 : Rat) / 25734207) [(5, 1), (14, 2), (15, 1)],
  term ((-1638338005 : Rat) / 25734207) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0455_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0455
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0456 : Poly :=
[
  term ((8823937166 : Rat) / 25734207) [(5, 1), (15, 3)]
]

/-- Partial product 456 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0456 : Poly :=
[
  term ((-17647874332 : Rat) / 25734207) [(5, 1), (6, 1), (15, 3)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (6, 2), (15, 3)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (7, 2), (15, 3)],
  term ((17647874332 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((-8823937166 : Rat) / 25734207) [(5, 1), (14, 2), (15, 3)],
  term ((-8823937166 : Rat) / 25734207) [(5, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0456_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0456
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0457 : Poly :=
[
  term (-144 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 457 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0457 : Poly :=
[
  term (288 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term (-144 : Rat) [(6, 2), (7, 1), (9, 1), (10, 1)],
  term (-288 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (144 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (144 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (-144 : Rat) [(7, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0457_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0457
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0458 : Poly :=
[
  term (192 : Rat) [(7, 1), (9, 1), (10, 2)]
]

/-- Partial product 458 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0458 : Poly :=
[
  term (-384 : Rat) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term (192 : Rat) [(6, 2), (7, 1), (9, 1), (10, 2)],
  term (384 : Rat) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term (-192 : Rat) [(7, 1), (9, 1), (10, 2), (14, 2)],
  term (-192 : Rat) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term (192 : Rat) [(7, 3), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0458_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0458
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0459 : Poly :=
[
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 459 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0459 : Poly :=
[
  term (192 : Rat) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term (-192 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term (-96 : Rat) [(7, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0459_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0459
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0460 : Poly :=
[
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 460 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0460 : Poly :=
[
  term (192 : Rat) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term (-192 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 3)],
  term (-96 : Rat) [(7, 3), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0460_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0460
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0461 : Poly :=
[
  term (-144 : Rat) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 461 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0461 : Poly :=
[
  term (288 : Rat) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term (-144 : Rat) [(6, 2), (7, 1), (10, 1), (15, 1)],
  term (-288 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (144 : Rat) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term (144 : Rat) [(7, 1), (10, 1), (15, 3)],
  term (-144 : Rat) [(7, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0461_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0461
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0462 : Poly :=
[
  term (96 : Rat) [(7, 1), (10, 2), (15, 1)]
]

/-- Partial product 462 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0462 : Poly :=
[
  term (-192 : Rat) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (10, 2), (15, 1)],
  term (192 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 2), (15, 3)],
  term (96 : Rat) [(7, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0462_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0462
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0463 : Poly :=
[
  term ((-54100502708 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 463 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0463 : Poly :=
[
  term ((108201005416 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)],
  term ((-54100502708 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1)],
  term ((-108201005416 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)],
  term ((54100502708 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((54100502708 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)],
  term ((-54100502708 : Rat) / 150171761) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0463_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0463
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0464 : Poly :=
[
  term ((120320876600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 464 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0464 : Poly :=
[
  term ((-240641753200 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((120320876600 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (12, 1)],
  term ((240641753200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-120320876600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-120320876600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((120320876600 : Rat) / 150171761) [(7, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0464_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0464
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0465 : Poly :=
[
  term (144 : Rat) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 465 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0465 : Poly :=
[
  term (-288 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term (144 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term (-144 : Rat) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term (288 : Rat) [(7, 1), (11, 1), (14, 2)],
  term (-144 : Rat) [(7, 1), (11, 1), (14, 3)],
  term (144 : Rat) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0465_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0465
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0466 : Poly :=
[
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 466 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0466 : Poly :=
[
  term ((-129825739000 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((64912869500 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (14, 2)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 4)],
  term ((64912869500 : Rat) / 150171761) [(7, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0466_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0466
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0467 : Poly :=
[
  term ((64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 467 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0467 : Poly :=
[
  term ((-129825739000 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((64912869500 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (15, 2)],
  term ((129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 4)],
  term ((64912869500 : Rat) / 150171761) [(7, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0467_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0467
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0468 : Poly :=
[
  term ((11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 468 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0468 : Poly :=
[
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((11591755126317078715 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(7, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0468_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0468
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0469 : Poly :=
[
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 469 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0469 : Poly :=
[
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 3), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 4), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0469_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0469
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0470 : Poly :=
[
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 470 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0470 : Poly :=
[
  term ((12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0470_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0470
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0471 : Poly :=
[
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)]
]

/-- Partial product 471 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0471 : Poly :=
[
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 5)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0471_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0471
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0472 : Poly :=
[
  term ((-23013686462 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 472 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0472 : Poly :=
[
  term ((46027372924 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-23013686462 : Rat) / 25734207) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-46027372924 : Rat) / 25734207) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((23013686462 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((23013686462 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)],
  term ((-23013686462 : Rat) / 25734207) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0472_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0472
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0473 : Poly :=
[
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 473 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0473 : Poly :=
[
  term ((16494695950 : Rat) / 25734207) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(6, 2), (7, 1), (14, 2), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((-16494695950 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (14, 4), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(7, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0473_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0473
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0474 : Poly :=
[
  term ((10717831847 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 474 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0474 : Poly :=
[
  term ((-21435663694 : Rat) / 25734207) [(6, 1), (7, 1), (15, 1)],
  term ((10717831847 : Rat) / 25734207) [(6, 2), (7, 1), (15, 1)],
  term ((21435663694 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)],
  term ((-10717831847 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term ((-10717831847 : Rat) / 25734207) [(7, 1), (15, 3)],
  term ((10717831847 : Rat) / 25734207) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0474_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0474
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0475 : Poly :=
[
  term ((-8247347975 : Rat) / 25734207) [(7, 1), (15, 3)]
]

/-- Partial product 475 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0475 : Poly :=
[
  term ((16494695950 : Rat) / 25734207) [(6, 1), (7, 1), (15, 3)],
  term ((-8247347975 : Rat) / 25734207) [(6, 2), (7, 1), (15, 3)],
  term ((-16494695950 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (15, 5)],
  term ((-8247347975 : Rat) / 25734207) [(7, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0475_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0475
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0476 : Poly :=
[
  term ((-9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 476 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0476 : Poly :=
[
  term ((18082082180 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-9041041090 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-9041041090 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-18082082180 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0476_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0476
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0477 : Poly :=
[
  term ((164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 477 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0477 : Poly :=
[
  term ((-328921600 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((164460800 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((164460800 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((328921600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0477_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0477
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0478 : Poly :=
[
  term ((7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 478 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0478 : Poly :=
[
  term ((-15844210708469920 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0478_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0478
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0479 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 479 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0479 : Poly :=
[
  term ((3484068180475701389 : Rat) / 5152734910838036) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0479_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0479
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0480 : Poly :=
[
  term ((2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 480 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0480 : Poly :=
[
  term ((-4064151872 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0480_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0480
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0481 : Poly :=
[
  term ((-1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 481 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0481 : Poly :=
[
  term ((2772959104 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2772959104 : Rat) / 25734207) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0481_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0481
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0482 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 482 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0482 : Poly :=
[
  term ((162800819760 : Rat) / 150171761) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-81400409880 : Rat) / 150171761) [(6, 2), (9, 1), (10, 2), (11, 1)],
  term ((-81400409880 : Rat) / 150171761) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((-162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0482_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0482
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0483 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)]
]

/-- Partial product 483 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0483 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 2)],
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0483_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0483
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0484 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 484 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0484 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0484_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0484
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0485 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 485 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0485 : Poly :=
[
  term ((7842143817216848487 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(6, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(7, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0485_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0485
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0486 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 486 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0486 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(6, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(6, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(7, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0486_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0486
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0487 : Poly :=
[
  term ((-26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 487 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0487 : Poly :=
[
  term ((26095795363 : Rat) / 8578069) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(6, 2), (9, 1), (10, 2), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0487_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0487
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0488 : Poly :=
[
  term ((-6773020800 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 488 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0488 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)],
  term ((-6773020800 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)],
  term ((-6773020800 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (14, 1)],
  term ((6773020800 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((6773020800 : Rat) / 150171761) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0488_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0488
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0489 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 489 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0489 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((13546041600 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((13546041600 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((27092083200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0489_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0489
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0490 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 490 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0490 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(7, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0490_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0490
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0491 : Poly :=
[
  term ((-326257590526281960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 491 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0491 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0491_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0491
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0492 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 492 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0492 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0492_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0492
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0493 : Poly :=
[
  term ((430389648 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 493 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0493 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(6, 1), (9, 1), (15, 1)],
  term ((430389648 : Rat) / 8578069) [(6, 2), (9, 1), (15, 1)],
  term ((430389648 : Rat) / 8578069) [(7, 2), (9, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (14, 1), (15, 1)],
  term ((-430389648 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term ((-430389648 : Rat) / 8578069) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0493_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0493
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0494 : Poly :=
[
  term ((-15440524200 : Rat) / 150171761) [(10, 1)]
]

/-- Partial product 494 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0494 : Poly :=
[
  term ((30881048400 : Rat) / 150171761) [(6, 1), (10, 1)],
  term ((-15440524200 : Rat) / 150171761) [(6, 2), (10, 1)],
  term ((-15440524200 : Rat) / 150171761) [(7, 2), (10, 1)],
  term ((-30881048400 : Rat) / 150171761) [(10, 1), (14, 1)],
  term ((15440524200 : Rat) / 150171761) [(10, 1), (14, 2)],
  term ((15440524200 : Rat) / 150171761) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0494_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0494
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0495 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 495 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0495 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(6, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(7, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0495_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0495
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0496 : Poly :=
[
  term ((-645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 496 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0496 : Poly :=
[
  term ((1291179491689133184 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0496_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0496
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0497 : Poly :=
[
  term ((2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 497 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0497 : Poly :=
[
  term ((-4275980800 : Rat) / 150171761) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2137990400 : Rat) / 150171761) [(6, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2137990400 : Rat) / 150171761) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0497_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0497
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0498 : Poly :=
[
  term ((-12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 498 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0498 : Poly :=
[
  term ((12795926937 : Rat) / 17156138) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12795926937 : Rat) / 34312276) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12795926937 : Rat) / 34312276) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-12795926937 : Rat) / 17156138) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0498_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0498
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0499 : Poly :=
[
  term ((4543893155803181193 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 499 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0499 : Poly :=
[
  term ((-4543893155803181193 : Rat) / 2576367455419018) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((4543893155803181193 : Rat) / 5152734910838036) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((4543893155803181193 : Rat) / 5152734910838036) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((4543893155803181193 : Rat) / 2576367455419018) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4543893155803181193 : Rat) / 5152734910838036) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4543893155803181193 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0499_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0499
        rs_R013_ueqv_R013YNNN_generator_05_0400_0499 =
      rs_R013_ueqv_R013YNNN_partial_05_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_05_0400_0499 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_05_0400,
  rs_R013_ueqv_R013YNNN_partial_05_0401,
  rs_R013_ueqv_R013YNNN_partial_05_0402,
  rs_R013_ueqv_R013YNNN_partial_05_0403,
  rs_R013_ueqv_R013YNNN_partial_05_0404,
  rs_R013_ueqv_R013YNNN_partial_05_0405,
  rs_R013_ueqv_R013YNNN_partial_05_0406,
  rs_R013_ueqv_R013YNNN_partial_05_0407,
  rs_R013_ueqv_R013YNNN_partial_05_0408,
  rs_R013_ueqv_R013YNNN_partial_05_0409,
  rs_R013_ueqv_R013YNNN_partial_05_0410,
  rs_R013_ueqv_R013YNNN_partial_05_0411,
  rs_R013_ueqv_R013YNNN_partial_05_0412,
  rs_R013_ueqv_R013YNNN_partial_05_0413,
  rs_R013_ueqv_R013YNNN_partial_05_0414,
  rs_R013_ueqv_R013YNNN_partial_05_0415,
  rs_R013_ueqv_R013YNNN_partial_05_0416,
  rs_R013_ueqv_R013YNNN_partial_05_0417,
  rs_R013_ueqv_R013YNNN_partial_05_0418,
  rs_R013_ueqv_R013YNNN_partial_05_0419,
  rs_R013_ueqv_R013YNNN_partial_05_0420,
  rs_R013_ueqv_R013YNNN_partial_05_0421,
  rs_R013_ueqv_R013YNNN_partial_05_0422,
  rs_R013_ueqv_R013YNNN_partial_05_0423,
  rs_R013_ueqv_R013YNNN_partial_05_0424,
  rs_R013_ueqv_R013YNNN_partial_05_0425,
  rs_R013_ueqv_R013YNNN_partial_05_0426,
  rs_R013_ueqv_R013YNNN_partial_05_0427,
  rs_R013_ueqv_R013YNNN_partial_05_0428,
  rs_R013_ueqv_R013YNNN_partial_05_0429,
  rs_R013_ueqv_R013YNNN_partial_05_0430,
  rs_R013_ueqv_R013YNNN_partial_05_0431,
  rs_R013_ueqv_R013YNNN_partial_05_0432,
  rs_R013_ueqv_R013YNNN_partial_05_0433,
  rs_R013_ueqv_R013YNNN_partial_05_0434,
  rs_R013_ueqv_R013YNNN_partial_05_0435,
  rs_R013_ueqv_R013YNNN_partial_05_0436,
  rs_R013_ueqv_R013YNNN_partial_05_0437,
  rs_R013_ueqv_R013YNNN_partial_05_0438,
  rs_R013_ueqv_R013YNNN_partial_05_0439,
  rs_R013_ueqv_R013YNNN_partial_05_0440,
  rs_R013_ueqv_R013YNNN_partial_05_0441,
  rs_R013_ueqv_R013YNNN_partial_05_0442,
  rs_R013_ueqv_R013YNNN_partial_05_0443,
  rs_R013_ueqv_R013YNNN_partial_05_0444,
  rs_R013_ueqv_R013YNNN_partial_05_0445,
  rs_R013_ueqv_R013YNNN_partial_05_0446,
  rs_R013_ueqv_R013YNNN_partial_05_0447,
  rs_R013_ueqv_R013YNNN_partial_05_0448,
  rs_R013_ueqv_R013YNNN_partial_05_0449,
  rs_R013_ueqv_R013YNNN_partial_05_0450,
  rs_R013_ueqv_R013YNNN_partial_05_0451,
  rs_R013_ueqv_R013YNNN_partial_05_0452,
  rs_R013_ueqv_R013YNNN_partial_05_0453,
  rs_R013_ueqv_R013YNNN_partial_05_0454,
  rs_R013_ueqv_R013YNNN_partial_05_0455,
  rs_R013_ueqv_R013YNNN_partial_05_0456,
  rs_R013_ueqv_R013YNNN_partial_05_0457,
  rs_R013_ueqv_R013YNNN_partial_05_0458,
  rs_R013_ueqv_R013YNNN_partial_05_0459,
  rs_R013_ueqv_R013YNNN_partial_05_0460,
  rs_R013_ueqv_R013YNNN_partial_05_0461,
  rs_R013_ueqv_R013YNNN_partial_05_0462,
  rs_R013_ueqv_R013YNNN_partial_05_0463,
  rs_R013_ueqv_R013YNNN_partial_05_0464,
  rs_R013_ueqv_R013YNNN_partial_05_0465,
  rs_R013_ueqv_R013YNNN_partial_05_0466,
  rs_R013_ueqv_R013YNNN_partial_05_0467,
  rs_R013_ueqv_R013YNNN_partial_05_0468,
  rs_R013_ueqv_R013YNNN_partial_05_0469,
  rs_R013_ueqv_R013YNNN_partial_05_0470,
  rs_R013_ueqv_R013YNNN_partial_05_0471,
  rs_R013_ueqv_R013YNNN_partial_05_0472,
  rs_R013_ueqv_R013YNNN_partial_05_0473,
  rs_R013_ueqv_R013YNNN_partial_05_0474,
  rs_R013_ueqv_R013YNNN_partial_05_0475,
  rs_R013_ueqv_R013YNNN_partial_05_0476,
  rs_R013_ueqv_R013YNNN_partial_05_0477,
  rs_R013_ueqv_R013YNNN_partial_05_0478,
  rs_R013_ueqv_R013YNNN_partial_05_0479,
  rs_R013_ueqv_R013YNNN_partial_05_0480,
  rs_R013_ueqv_R013YNNN_partial_05_0481,
  rs_R013_ueqv_R013YNNN_partial_05_0482,
  rs_R013_ueqv_R013YNNN_partial_05_0483,
  rs_R013_ueqv_R013YNNN_partial_05_0484,
  rs_R013_ueqv_R013YNNN_partial_05_0485,
  rs_R013_ueqv_R013YNNN_partial_05_0486,
  rs_R013_ueqv_R013YNNN_partial_05_0487,
  rs_R013_ueqv_R013YNNN_partial_05_0488,
  rs_R013_ueqv_R013YNNN_partial_05_0489,
  rs_R013_ueqv_R013YNNN_partial_05_0490,
  rs_R013_ueqv_R013YNNN_partial_05_0491,
  rs_R013_ueqv_R013YNNN_partial_05_0492,
  rs_R013_ueqv_R013YNNN_partial_05_0493,
  rs_R013_ueqv_R013YNNN_partial_05_0494,
  rs_R013_ueqv_R013YNNN_partial_05_0495,
  rs_R013_ueqv_R013YNNN_partial_05_0496,
  rs_R013_ueqv_R013YNNN_partial_05_0497,
  rs_R013_ueqv_R013YNNN_partial_05_0498,
  rs_R013_ueqv_R013YNNN_partial_05_0499
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_05_0400_0499 : Poly :=
[
  term ((8855581533897986765 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2), (14, 1)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (14, 1), (15, 2)],
  term ((-2460780757635360425 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (14, 1), (15, 1)],
  term ((-10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (15, 1)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-336 : Rat) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((5370983548 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((7643640604 : Rat) / 25734207) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-10427432920 : Rat) / 25734207) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((14255921300 : Rat) / 25734207) [(4, 1), (6, 1), (15, 2)],
  term ((-8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2), (14, 1)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 2), (14, 1), (15, 2)],
  term ((2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 3), (14, 1), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 3), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term (168 : Rat) [(4, 1), (6, 2), (12, 1), (15, 2)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3821820302 : Rat) / 25734207) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (6, 2), (14, 1), (15, 2)],
  term ((-7127960650 : Rat) / 25734207) [(4, 1), (6, 2), (15, 2)],
  term ((-8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2), (14, 1)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 2), (14, 1), (15, 2)],
  term ((2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 3), (14, 1), (15, 1)],
  term ((10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 3), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term (168 : Rat) [(4, 1), (7, 2), (12, 1), (15, 2)],
  term ((-2685491774 : Rat) / 8578069) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3821820302 : Rat) / 25734207) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((5213716460 : Rat) / 25734207) [(4, 1), (7, 2), (14, 1), (15, 2)],
  term ((-7127960650 : Rat) / 25734207) [(4, 1), (7, 2), (15, 2)],
  term ((-8855581533897986765 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((8855581533897986765 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((132172947359146225 : Rat) / 75775513394677) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 4)],
  term ((49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-408697047538963525 : Rat) / 2576367455419018) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((-24928763400 : Rat) / 150171761) [(4, 1), (11, 2), (14, 3)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 3), (15, 2)],
  term ((-2460780757635360425 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 4)],
  term ((10773320285727507195 : Rat) / 1288183727709509) [(4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 3)],
  term ((-5970028802149742625 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 3), (15, 1)],
  term ((-10773320285727507195 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 3)],
  term ((-4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term (336 : Rat) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term (-168 : Rat) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term (-168 : Rat) [(4, 1), (12, 1), (15, 4)],
  term ((-7643640604 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-12291130342 : Rat) / 25734207) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((2685491774 : Rat) / 8578069) [(4, 1), (13, 1), (14, 3), (15, 1)],
  term ((3821820302 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)],
  term ((-14255921300 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(4, 1), (14, 1), (15, 4)],
  term ((17555393570 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((-5213716460 : Rat) / 25734207) [(4, 1), (14, 3), (15, 2)],
  term ((7127960650 : Rat) / 25734207) [(4, 1), (15, 4)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (6, 1), (11, 2), (15, 2)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (6, 1), (15, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (6, 2), (11, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (6, 2), (11, 2), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (6, 2), (13, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (6, 2), (15, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (7, 2), (11, 2), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (7, 2), (15, 2)],
  term ((6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 3)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 1), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 2), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 4)],
  term ((925633376 : Rat) / 8578069) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (13, 1), (15, 3)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (14, 1), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(4, 2), (14, 2), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(4, 2), (15, 4)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (6, 1), (7, 1), (11, 2), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-49857526800 : Rat) / 150171761) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (6, 1), (10, 2), (11, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (6, 1), (10, 2), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (6, 1), (10, 2), (15, 1)],
  term ((87655745000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)],
  term ((70552350800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-20319188400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-65819864800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 2)],
  term ((-122059828800 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((72385510000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-111995631600 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((-133295987600 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-978778841020771455 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((3398519015026943585 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (13, 1), (15, 2)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1)],
  term ((3486822612683558875 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5394849062811843795 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1)],
  term ((8444784979690653625 : Rat) / 2576367455419018) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-6420890917860042245 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 3)],
  term ((-6133527356 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7980619124 : Rat) / 25734207) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((12110884984 : Rat) / 25734207) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((25752607000 : Rat) / 25734207) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-3828488380 : Rat) / 25734207) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-2406813804 : Rat) / 8578069) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-3276676010 : Rat) / 25734207) [(5, 1), (6, 1), (15, 1)],
  term ((-17647874332 : Rat) / 25734207) [(5, 1), (6, 1), (15, 3)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (6, 2), (7, 1), (11, 2), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (6, 2), (7, 1), (15, 2)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (6, 2), (10, 1), (11, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (6, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (6, 2), (10, 2), (11, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (6, 2), (10, 2), (11, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (6, 2), (10, 2), (15, 1)],
  term ((-43827872500 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)],
  term ((-35276175400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 2)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (13, 2)],
  term ((-36192755000 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (14, 1)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (14, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (13, 1), (15, 2)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (13, 2), (15, 1)],
  term ((-3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (14, 2), (15, 1)],
  term ((-8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (6, 2), (11, 2), (15, 3)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((3990309562 : Rat) / 25734207) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((1914244190 : Rat) / 25734207) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (6, 2), (14, 2), (15, 1)],
  term ((1638338005 : Rat) / 25734207) [(5, 1), (6, 2), (15, 1)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (6, 2), (15, 3)],
  term ((-19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 4)],
  term ((-3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 4)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (7, 2), (10, 1), (11, 1)],
  term ((24928763400 : Rat) / 150171761) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (7, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-724709094 : Rat) / 8578069) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (7, 2), (10, 2), (11, 2), (15, 1)],
  term ((-411450332 : Rat) / 8578069) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((-43827872500 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)],
  term ((-35276175400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((10159594200 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1)],
  term ((32909932400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 2)],
  term ((61029914400 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (13, 2)],
  term ((-36192755000 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((55997815800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (14, 2)],
  term ((66647993800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((978778841020771455 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (13, 1), (15, 2)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (13, 2), (15, 1)],
  term ((-3486822612683558875 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (14, 2), (15, 1)],
  term ((-8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (7, 2), (11, 2), (15, 3)],
  term ((3066763678 : Rat) / 8578069) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((3990309562 : Rat) / 25734207) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-6055442492 : Rat) / 25734207) [(5, 1), (7, 2), (12, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((1914244190 : Rat) / 25734207) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((1203406902 : Rat) / 8578069) [(5, 1), (7, 2), (14, 2), (15, 1)],
  term ((1638338005 : Rat) / 25734207) [(5, 1), (7, 2), (15, 1)],
  term ((8823937166 : Rat) / 25734207) [(5, 1), (7, 2), (15, 3)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 3), (11, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 3), (11, 2), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 3), (15, 2)],
  term ((48092330400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((25811361600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-24928763400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 3)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((1243337779771560420 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 3), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((1248808296 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-2073822336 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((724709094 : Rat) / 8578069) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 3)],
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((411450332 : Rat) / 8578069) [(5, 1), (10, 2), (15, 3)],
  term ((-70552350800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((55595363800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-10159594200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((35276175400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((65819864800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((-32909932400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((4735900000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-87655745000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)],
  term ((169488742600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-28557637500 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((-122645809600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((148188386600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 3)],
  term ((-55997815800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 4)],
  term ((43827872500 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)],
  term ((-66647993800 : Rat) / 150171761) [(5, 1), (11, 1), (15, 4)],
  term ((-3398519015026943585 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((5356076697068486495 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-978778841020771455 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((3398519015026943585 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((3170554340895223510 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-1585277170447611755 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 3)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 4)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 3)],
  term ((-8444784979690653625 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((16328604448403643365 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-5502505471043581875 : Rat) / 5152734910838036) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-5907869990335943020 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 3)],
  term ((14276520738307246465 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 3), (15, 1)],
  term ((-5394849062811843795 : Rat) / 2576367455419018) [(5, 1), (11, 2), (14, 4), (15, 1)],
  term ((8444784979690653625 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 3)],
  term ((-6420890917860042245 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 5)],
  term ((7980619124 : Rat) / 25734207) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((14410272506 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3066763678 : Rat) / 8578069) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-3990309562 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)],
  term ((-12110884984 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((6055442492 : Rat) / 25734207) [(5, 1), (12, 2), (15, 3)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1822387496 : Rat) / 8578069) [(5, 1), (13, 1), (15, 4)],
  term ((-25752607000 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(5, 1), (13, 2), (15, 3)],
  term ((3276676010 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)],
  term ((15733630142 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((730050125 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((-12434157872 : Rat) / 25734207) [(5, 1), (14, 2), (15, 3)],
  term ((5306197222 : Rat) / 25734207) [(5, 1), (14, 3), (15, 1)],
  term ((-1203406902 : Rat) / 8578069) [(5, 1), (14, 4), (15, 1)],
  term ((-1638338005 : Rat) / 25734207) [(5, 1), (15, 3)],
  term ((-8823937166 : Rat) / 25734207) [(5, 1), (15, 5)],
  term (288 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term (-384 : Rat) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term (192 : Rat) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term (192 : Rat) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (288 : Rat) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term (-192 : Rat) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((108201005416 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)],
  term ((-240641753200 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term (-288 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-129825739000 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-129825739000 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-11591755126317078715 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 3)],
  term ((46027372924 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-21435663694 : Rat) / 25734207) [(6, 1), (7, 1), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(6, 1), (7, 1), (15, 3)],
  term ((18082082180 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(6, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((26095795363 : Rat) / 8578069) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(6, 1), (9, 1), (15, 1)],
  term ((30881048400 : Rat) / 150171761) [(6, 1), (10, 1)],
  term ((16256607488 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1291179491689133184 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4275980800 : Rat) / 150171761) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((12795926937 : Rat) / 17156138) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4543893155803181193 : Rat) / 2576367455419018) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term (-144 : Rat) [(6, 2), (7, 1), (9, 1), (10, 1)],
  term (192 : Rat) [(6, 2), (7, 1), (9, 1), (10, 2)],
  term (-96 : Rat) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (-144 : Rat) [(6, 2), (7, 1), (10, 1), (15, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (10, 2), (15, 1)],
  term ((-54100502708 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1)],
  term ((120320876600 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (12, 1)],
  term (144 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((64912869500 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (14, 2)],
  term ((64912869500 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (15, 2)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 3)],
  term ((-23013686462 : Rat) / 25734207) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(6, 2), (7, 1), (14, 2), (15, 1)],
  term ((10717831847 : Rat) / 25734207) [(6, 2), (7, 1), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(6, 2), (7, 1), (15, 3)],
  term ((-9041041090 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((164460800 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(6, 2), (9, 1), (10, 2), (11, 1)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(6, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(6, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(6, 2), (9, 1), (10, 2), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((430389648 : Rat) / 8578069) [(6, 2), (9, 1), (15, 1)],
  term ((-15440524200 : Rat) / 150171761) [(6, 2), (10, 1)],
  term ((-8128303744 : Rat) / 8578069) [(6, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2137990400 : Rat) / 150171761) [(6, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-12795926937 : Rat) / 34312276) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4543893155803181193 : Rat) / 5152734910838036) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term (-288 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (144 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (144 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (384 : Rat) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term (-192 : Rat) [(7, 1), (9, 1), (10, 2), (14, 2)],
  term (-192 : Rat) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term (-192 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term (-96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (14, 3)],
  term (96 : Rat) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term (-288 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (144 : Rat) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term (144 : Rat) [(7, 1), (10, 1), (15, 3)],
  term (192 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term (-96 : Rat) [(7, 1), (10, 2), (15, 3)],
  term ((240641753200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-120320876600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-120320876600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-108201005416 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)],
  term ((108201005416 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((97349969876 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((-129825739000 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((108201005416 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (14, 4)],
  term ((54100502708 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)],
  term ((-64912869500 : Rat) / 150171761) [(7, 1), (11, 1), (15, 4)],
  term ((11591755126317078715 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-11591755126317078715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 2), (15, 3)],
  term ((12507456877862815475 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 3), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 4), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 5)],
  term ((-46027372924 : Rat) / 25734207) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((23013686462 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((23013686462 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)],
  term ((21435663694 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)],
  term ((-16494695950 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((-10717831847 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term ((16494695950 : Rat) / 25734207) [(7, 1), (14, 2), (15, 3)],
  term ((-16494695950 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (14, 4), (15, 1)],
  term ((-10717831847 : Rat) / 25734207) [(7, 1), (15, 3)],
  term ((8247347975 : Rat) / 25734207) [(7, 1), (15, 5)],
  term ((-9041041090 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((164460800 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(7, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(7, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(7, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((430389648 : Rat) / 8578069) [(7, 2), (9, 1), (15, 1)],
  term ((-15440524200 : Rat) / 150171761) [(7, 2), (10, 1)],
  term ((-8128303744 : Rat) / 8578069) [(7, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2137990400 : Rat) / 150171761) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-12795926937 : Rat) / 34312276) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4543893155803181193 : Rat) / 5152734910838036) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term (-144 : Rat) [(7, 3), (9, 1), (10, 1)],
  term (192 : Rat) [(7, 3), (9, 1), (10, 2)],
  term (-96 : Rat) [(7, 3), (10, 1), (11, 1)],
  term (-96 : Rat) [(7, 3), (10, 1), (11, 1), (14, 1)],
  term (-144 : Rat) [(7, 3), (10, 1), (15, 1)],
  term (96 : Rat) [(7, 3), (10, 2), (15, 1)],
  term ((-54100502708 : Rat) / 150171761) [(7, 3), (11, 1)],
  term ((120320876600 : Rat) / 150171761) [(7, 3), (11, 1), (12, 1)],
  term (144 : Rat) [(7, 3), (11, 1), (14, 1)],
  term ((64912869500 : Rat) / 150171761) [(7, 3), (11, 1), (14, 2)],
  term ((64912869500 : Rat) / 150171761) [(7, 3), (11, 1), (15, 2)],
  term ((11591755126317078715 : Rat) / 2576367455419018) [(7, 3), (11, 2), (12, 1), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (14, 2), (15, 1)],
  term ((-12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 1)],
  term ((12507456877862815475 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 3)],
  term ((-23013686462 : Rat) / 25734207) [(7, 3), (12, 1), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(7, 3), (14, 2), (15, 1)],
  term ((10717831847 : Rat) / 25734207) [(7, 3), (15, 1)],
  term ((-8247347975 : Rat) / 25734207) [(7, 3), (15, 3)],
  term ((328921600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-18082082180 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 3)],
  term ((4064151872 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-2772959104 : Rat) / 25734207) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 3)],
  term ((3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 2)],
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 3)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 3)],
  term ((16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((-26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 3)],
  term ((27092083200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (14, 1)],
  term ((6773020800 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((6773020800 : Rat) / 150171761) [(9, 1), (11, 1), (15, 2)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)],
  term ((860779296 : Rat) / 8578069) [(9, 1), (14, 1), (15, 1)],
  term ((-430389648 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term ((-430389648 : Rat) / 8578069) [(9, 1), (15, 3)],
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1795693628514179776 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 3), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((4543893155803181193 : Rat) / 2576367455419018) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-8387066919316433307 : Rat) / 5152734910838036) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-4543893155803181193 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 3)],
  term ((-30881048400 : Rat) / 150171761) [(10, 1), (14, 1)],
  term ((15440524200 : Rat) / 150171761) [(10, 1), (14, 2)],
  term ((15440524200 : Rat) / 150171761) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 499. -/
theorem rs_R013_ueqv_R013YNNN_block_05_0400_0499_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_05_0400_0499
      rs_R013_ueqv_R013YNNN_block_05_0400_0499 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
