/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 28:400-481

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0400 : Poly :=
[
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 400 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0400 : Poly :=
[
  term ((997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0400
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0401 : Poly :=
[
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1)]
]

/-- Partial product 401 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0401 : Poly :=
[
  term ((8129680847544803 : Rat) / 17406427571064) [(0, 1), (9, 2), (14, 2)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 17406427571064) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1)],
  term ((-8129680847544803 : Rat) / 17406427571064) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0401
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0402 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 402 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0402 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 3)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0402
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0403 : Poly :=
[
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 403 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0403 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (15, 3)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (14, 1), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0403_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0403
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0404 : Poly :=
[
  term ((23112508959082217 : Rat) / 52219282713192) [(10, 1)]
]

/-- Partial product 404 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0404 : Poly :=
[
  term ((-23112508959082217 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1)],
  term ((23112508959082217 : Rat) / 52219282713192) [(0, 2), (10, 1)],
  term ((-23112508959082217 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)],
  term ((23112508959082217 : Rat) / 52219282713192) [(1, 2), (10, 1)],
  term ((-23112508959082217 : Rat) / 52219282713192) [(10, 1)],
  term ((23112508959082217 : Rat) / 26109641356596) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0404_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0404
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0405 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 405 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0405 : Poly :=
[
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0405_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0405
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0406 : Poly :=
[
  term ((16548508723813 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 406 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0406 : Poly :=
[
  term ((-16548508723813 : Rat) / 59205535956) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((16548508723813 : Rat) / 118411071912) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-16548508723813 : Rat) / 59205535956) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((16548508723813 : Rat) / 118411071912) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-16548508723813 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1)],
  term ((16548508723813 : Rat) / 59205535956) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0406_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0406
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0407 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 407 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0407 : Poly :=
[
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0407_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0407
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0408 : Poly :=
[
  term ((165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 408 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0408 : Poly :=
[
  term ((-165 : Rat) / 14) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((165 : Rat) / 28) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 14) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((165 : Rat) / 28) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((165 : Rat) / 14) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0408_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0408
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0409 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 409 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0409 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0409_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0409
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0410 : Poly :=
[
  term ((374600327072621 : Rat) / 2486632510152) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 410 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0410 : Poly :=
[
  term ((-374600327072621 : Rat) / 1243316255076) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((374600327072621 : Rat) / 2486632510152) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-374600327072621 : Rat) / 1243316255076) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((374600327072621 : Rat) / 2486632510152) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((374600327072621 : Rat) / 1243316255076) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-374600327072621 : Rat) / 2486632510152) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0410_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0410
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0411 : Poly :=
[
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0411 : Poly :=
[
  term ((74 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-37 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-74 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0411_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0411
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0412 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 412 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0412 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0412_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0412
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0413 : Poly :=
[
  term ((40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 413 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0413 : Poly :=
[
  term ((-80 : Rat) / 21) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((-80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1)],
  term ((80 : Rat) / 21) [(10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0413_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0413
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0414 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 414 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0414 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0414_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0414
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0415 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0415 : Poly :=
[
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0415_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0415
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0416 : Poly :=
[
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 416 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0416 : Poly :=
[
  term ((245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((-122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0416_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0416
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0417 : Poly :=
[
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 417 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0417 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0417_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0417
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0418 : Poly :=
[
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 418 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0418 : Poly :=
[
  term ((-27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0418_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0418
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0419 : Poly :=
[
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0419 : Poly :=
[
  term ((209 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0419_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0419
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0420 : Poly :=
[
  term ((3345960567365771 : Rat) / 4262798588832) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 420 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0420 : Poly :=
[
  term ((-3345960567365771 : Rat) / 2131399294416) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3345960567365771 : Rat) / 4262798588832) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3345960567365771 : Rat) / 2131399294416) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((3345960567365771 : Rat) / 4262798588832) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((3345960567365771 : Rat) / 2131399294416) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3345960567365771 : Rat) / 4262798588832) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0420_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0420
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0421 : Poly :=
[
  term ((37 : Rat) / 16) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0421 : Poly :=
[
  term ((-37 : Rat) / 8) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 16) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 8) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((37 : Rat) / 16) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 8) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 16) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0421_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0421
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0422 : Poly :=
[
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 422 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0422 : Poly :=
[
  term ((6090608323475 : Rat) / 532849823604) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0422_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0422
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0423 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 423 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0423 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0423_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0423
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0424 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 424 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0424 : Poly :=
[
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0424_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0424
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0425 : Poly :=
[
  term ((5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 425 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0425 : Poly :=
[
  term ((-5 : Rat) / 6) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 12) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0425_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0425
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0426 : Poly :=
[
  term ((40243415163974875 : Rat) / 69625710284256) [(10, 1), (14, 1)]
]

/-- Partial product 426 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0426 : Poly :=
[
  term ((-40243415163974875 : Rat) / 34812855142128) [(0, 1), (10, 1), (14, 2)],
  term ((40243415163974875 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((-40243415163974875 : Rat) / 34812855142128) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((40243415163974875 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)],
  term ((-40243415163974875 : Rat) / 69625710284256) [(10, 1), (14, 1)],
  term ((40243415163974875 : Rat) / 34812855142128) [(10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0426_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0426
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0427 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 427 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0427 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0427_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0427
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0428 : Poly :=
[
  term ((65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0428 : Poly :=
[
  term ((-130 : Rat) / 7) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(10, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0428_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0428
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0429 : Poly :=
[
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 429 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0429 : Poly :=
[
  term ((7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (14, 3)],
  term ((-7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0429_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0429
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0430 : Poly :=
[
  term ((-54395296296323315 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

/-- Partial product 430 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0430 : Poly :=
[
  term ((54395296296323315 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-54395296296323315 : Rat) / 52219282713192) [(0, 2), (10, 1), (15, 2)],
  term ((54395296296323315 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 3)],
  term ((-54395296296323315 : Rat) / 52219282713192) [(1, 2), (10, 1), (15, 2)],
  term ((-54395296296323315 : Rat) / 26109641356596) [(10, 1), (14, 1), (15, 2)],
  term ((54395296296323315 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0430_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0430
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0431 : Poly :=
[
  term ((-317 : Rat) / 84) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 431 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0431 : Poly :=
[
  term ((317 : Rat) / 42) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-317 : Rat) / 84) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((317 : Rat) / 42) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-317 : Rat) / 84) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-317 : Rat) / 42) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((317 : Rat) / 84) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0431_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0431
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0432 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 432 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0432 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0432_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0432
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0433 : Poly :=
[
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 433 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0433 : Poly :=
[
  term ((38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0433_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0433
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0434 : Poly :=
[
  term ((449184815257946815 : Rat) / 626631392558304) [(11, 1), (13, 1)]
]

/-- Partial product 434 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0434 : Poly :=
[
  term ((-449184815257946815 : Rat) / 313315696279152) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((449184815257946815 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1)],
  term ((-449184815257946815 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((449184815257946815 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1)],
  term ((-449184815257946815 : Rat) / 626631392558304) [(11, 1), (13, 1)],
  term ((449184815257946815 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0434_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0434
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0435 : Poly :=
[
  term ((108597121582627661 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 435 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0435 : Poly :=
[
  term ((-108597121582627661 : Rat) / 313315696279152) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((108597121582627661 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-108597121582627661 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((108597121582627661 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-108597121582627661 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)],
  term ((108597121582627661 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0435_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0435
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0436 : Poly :=
[
  term ((-21425 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 436 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0436 : Poly :=
[
  term ((21425 : Rat) / 504) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21425 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21425 : Rat) / 504) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21425 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21425 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21425 : Rat) / 504) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0436_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0436
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0437 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 437 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0437 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0437_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0437
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0438 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 438 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0438 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0438_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0438
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0439 : Poly :=
[
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 439 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0439 : Poly :=
[
  term ((-305 : Rat) / 14) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0439_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0439
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0440 : Poly :=
[
  term ((1115 : Rat) / 144) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 440 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0440 : Poly :=
[
  term ((-1115 : Rat) / 72) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1115 : Rat) / 144) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1115 : Rat) / 72) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1115 : Rat) / 144) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1115 : Rat) / 72) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1115 : Rat) / 144) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0440_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0440
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0441 : Poly :=
[
  term ((9281834770682030 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 441 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0441 : Poly :=
[
  term ((-18563669541364060 : Rat) / 6527410339149) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((9281834770682030 : Rat) / 6527410339149) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-18563669541364060 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((9281834770682030 : Rat) / 6527410339149) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9281834770682030 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)],
  term ((18563669541364060 : Rat) / 6527410339149) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0441_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0441
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0442 : Poly :=
[
  term ((4733 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0442 : Poly :=
[
  term ((-4733 : Rat) / 126) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4733 : Rat) / 252) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4733 : Rat) / 126) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4733 : Rat) / 252) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4733 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4733 : Rat) / 126) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0442_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0442
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0443 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 443 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0443 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0443_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0443
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0444 : Poly :=
[
  term ((515507385315874009 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

/-- Partial product 444 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0444 : Poly :=
[
  term ((-515507385315874009 : Rat) / 104438565426384) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((515507385315874009 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((-515507385315874009 : Rat) / 104438565426384) [(1, 1), (11, 1), (15, 2)],
  term ((515507385315874009 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((515507385315874009 : Rat) / 104438565426384) [(11, 1), (14, 1), (15, 1)],
  term ((-515507385315874009 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0444_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0444
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0445 : Poly :=
[
  term ((-281 : Rat) / 36) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0445 : Poly :=
[
  term ((281 : Rat) / 18) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-281 : Rat) / 36) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((281 : Rat) / 18) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-281 : Rat) / 36) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-281 : Rat) / 18) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((281 : Rat) / 36) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0445_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0445
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0446 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 446 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0446 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (15, 4)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0446_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0446
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0447 : Poly :=
[
  term ((-65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 447 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0447 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0447_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0447
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0448 : Poly :=
[
  term ((-13214377901035967 : Rat) / 52219282713192) [(11, 2)]
]

/-- Partial product 448 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0448 : Poly :=
[
  term ((13214377901035967 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 1)],
  term ((-13214377901035967 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((13214377901035967 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((-13214377901035967 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((13214377901035967 : Rat) / 52219282713192) [(11, 2)],
  term ((-13214377901035967 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0448_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0448
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0449 : Poly :=
[
  term ((-118218305640064951 : Rat) / 52219282713192) [(11, 2), (14, 1)]
]

/-- Partial product 449 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0449 : Poly :=
[
  term ((118218305640064951 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 2)],
  term ((-118218305640064951 : Rat) / 52219282713192) [(0, 2), (11, 2), (14, 1)],
  term ((118218305640064951 : Rat) / 26109641356596) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-118218305640064951 : Rat) / 52219282713192) [(1, 2), (11, 2), (14, 1)],
  term ((118218305640064951 : Rat) / 52219282713192) [(11, 2), (14, 1)],
  term ((-118218305640064951 : Rat) / 26109641356596) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0449_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0449
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0450 : Poly :=
[
  term ((119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 450 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0450 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(1, 1), (11, 2), (15, 3)],
  term ((119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(11, 2), (14, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0450_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0450
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0451 : Poly :=
[
  term ((2444668745291 : Rat) / 266424911802) [(12, 1)]
]

/-- Partial product 451 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0451 : Poly :=
[
  term ((-2444668745291 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (15, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0451_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0451
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0452 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 452 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0452 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0452_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0452
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0453 : Poly :=
[
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0453 : Poly :=
[
  term ((-345 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 28) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0453_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0453
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0454 : Poly :=
[
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 454 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0454 : Poly :=
[
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0454_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0454
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0455 : Poly :=
[
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0455 : Poly :=
[
  term ((-45 : Rat) / 56) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0455_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0455
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0456 : Poly :=
[
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 456 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0456 : Poly :=
[
  term ((5983066912384 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 2)],
  term ((-2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0456_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0456
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0457 : Poly :=
[
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 457 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0457 : Poly :=
[
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0457_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0457
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0458 : Poly :=
[
  term ((-73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 458 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0458 : Poly :=
[
  term ((73 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 7) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0458_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0458
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0459 : Poly :=
[
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 459 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0459 : Poly :=
[
  term ((-2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (15, 3)],
  term ((2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 4351606892766) [(12, 1), (14, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0459_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0459
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0460 : Poly :=
[
  term ((-155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 460 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0460 : Poly :=
[
  term ((155 : Rat) / 42) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 42) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 42) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0460_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0460
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0461 : Poly :=
[
  term ((-4522094596400677 : Rat) / 6527410339149) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 461 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0461 : Poly :=
[
  term ((9044189192801354 : Rat) / 6527410339149) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4522094596400677 : Rat) / 6527410339149) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((9044189192801354 : Rat) / 6527410339149) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4522094596400677 : Rat) / 6527410339149) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((4522094596400677 : Rat) / 6527410339149) [(13, 1), (14, 1), (15, 1)],
  term ((-9044189192801354 : Rat) / 6527410339149) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0461_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0461
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0462 : Poly :=
[
  term ((1633 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0462 : Poly :=
[
  term ((-1633 : Rat) / 126) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1633 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1633 : Rat) / 126) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1633 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1633 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1633 : Rat) / 126) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0462_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0462
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0463 : Poly :=
[
  term ((162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 463 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0463 : Poly :=
[
  term ((-162334705359487 : Rat) / 483511876974) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 483511876974) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((162334705359487 : Rat) / 967023753948) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0463_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0463
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0464 : Poly :=
[
  term ((73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0464 : Poly :=
[
  term ((-73 : Rat) / 7) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 7) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0464_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0464
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0465 : Poly :=
[
  term ((734005072430414635 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

/-- Partial product 465 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0465 : Poly :=
[
  term ((-734005072430414635 : Rat) / 313315696279152) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((734005072430414635 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((-734005072430414635 : Rat) / 313315696279152) [(1, 1), (13, 1), (15, 2)],
  term ((734005072430414635 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((734005072430414635 : Rat) / 313315696279152) [(13, 1), (14, 1), (15, 1)],
  term ((-734005072430414635 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0465_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0465
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0466 : Poly :=
[
  term ((389 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0466 : Poly :=
[
  term ((-389 : Rat) / 168) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-389 : Rat) / 168) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((389 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((389 : Rat) / 168) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0466_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0466
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0467 : Poly :=
[
  term ((-4803988168861391 : Rat) / 12788395766496) [(13, 2)]
]

/-- Partial product 467 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0467 : Poly :=
[
  term ((4803988168861391 : Rat) / 6394197883248) [(0, 1), (13, 2), (14, 1)],
  term ((-4803988168861391 : Rat) / 12788395766496) [(0, 2), (13, 2)],
  term ((4803988168861391 : Rat) / 6394197883248) [(1, 1), (13, 2), (15, 1)],
  term ((-4803988168861391 : Rat) / 12788395766496) [(1, 2), (13, 2)],
  term ((4803988168861391 : Rat) / 12788395766496) [(13, 2)],
  term ((-4803988168861391 : Rat) / 6394197883248) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0467_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0467
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0468 : Poly :=
[
  term ((10067479039185853 : Rat) / 12788395766496) [(13, 2), (14, 1)]
]

/-- Partial product 468 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0468 : Poly :=
[
  term ((-10067479039185853 : Rat) / 6394197883248) [(0, 1), (13, 2), (14, 2)],
  term ((10067479039185853 : Rat) / 12788395766496) [(0, 2), (13, 2), (14, 1)],
  term ((-10067479039185853 : Rat) / 6394197883248) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((10067479039185853 : Rat) / 12788395766496) [(1, 2), (13, 2), (14, 1)],
  term ((-10067479039185853 : Rat) / 12788395766496) [(13, 2), (14, 1)],
  term ((10067479039185853 : Rat) / 6394197883248) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0468_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0468
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0469 : Poly :=
[
  term ((-6385 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 469 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0469 : Poly :=
[
  term ((6385 : Rat) / 504) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-6385 : Rat) / 1008) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((6385 : Rat) / 504) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6385 : Rat) / 1008) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((6385 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)],
  term ((-6385 : Rat) / 504) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0469_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0469
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0470 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 470 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0470 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (13, 2), (14, 3)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0470_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0470
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0471 : Poly :=
[
  term ((-345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 471 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0471 : Poly :=
[
  term ((345 : Rat) / 28) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 28) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 28) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0471_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0471
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0472 : Poly :=
[
  term ((10355 : Rat) / 1008) [(13, 2), (16, 1)]
]

/-- Partial product 472 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0472 : Poly :=
[
  term ((-10355 : Rat) / 504) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((10355 : Rat) / 1008) [(0, 2), (13, 2), (16, 1)],
  term ((-10355 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((10355 : Rat) / 1008) [(1, 2), (13, 2), (16, 1)],
  term ((10355 : Rat) / 504) [(13, 2), (14, 1), (16, 1)],
  term ((-10355 : Rat) / 1008) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0472_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0472
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0473 : Poly :=
[
  term ((16814933658018277 : Rat) / 69625710284256) [(14, 1)]
]

/-- Partial product 473 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0473 : Poly :=
[
  term ((-16814933658018277 : Rat) / 34812855142128) [(0, 1), (14, 2)],
  term ((16814933658018277 : Rat) / 69625710284256) [(0, 2), (14, 1)],
  term ((-16814933658018277 : Rat) / 34812855142128) [(1, 1), (14, 1), (15, 1)],
  term ((16814933658018277 : Rat) / 69625710284256) [(1, 2), (14, 1)],
  term ((-16814933658018277 : Rat) / 69625710284256) [(14, 1)],
  term ((16814933658018277 : Rat) / 34812855142128) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0473_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0473
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0474 : Poly :=
[
  term ((9954757113931841 : Rat) / 208877130852768) [(14, 1), (15, 2)]
]

/-- Partial product 474 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0474 : Poly :=
[
  term ((-9954757113931841 : Rat) / 104438565426384) [(0, 1), (14, 2), (15, 2)],
  term ((9954757113931841 : Rat) / 208877130852768) [(0, 2), (14, 1), (15, 2)],
  term ((-9954757113931841 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 3)],
  term ((9954757113931841 : Rat) / 208877130852768) [(1, 2), (14, 1), (15, 2)],
  term ((-9954757113931841 : Rat) / 208877130852768) [(14, 1), (15, 2)],
  term ((9954757113931841 : Rat) / 104438565426384) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0474_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0474
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0475 : Poly :=
[
  term ((-4 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0475 : Poly :=
[
  term ((8 : Rat) / 7) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0475_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0475
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0476 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 476 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0476 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0476_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0476
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0477 : Poly :=
[
  term ((-64176249966468293 : Rat) / 139251420568512) [(14, 2)]
]

/-- Partial product 477 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0477 : Poly :=
[
  term ((64176249966468293 : Rat) / 69625710284256) [(0, 1), (14, 3)],
  term ((-64176249966468293 : Rat) / 139251420568512) [(0, 2), (14, 2)],
  term ((64176249966468293 : Rat) / 69625710284256) [(1, 1), (14, 2), (15, 1)],
  term ((-64176249966468293 : Rat) / 139251420568512) [(1, 2), (14, 2)],
  term ((64176249966468293 : Rat) / 139251420568512) [(14, 2)],
  term ((-64176249966468293 : Rat) / 69625710284256) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0477_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0477
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0478 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 478 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0478 : Poly :=
[
  term ((-32 : Rat) / 21) [(0, 1), (14, 3), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)],
  term ((32 : Rat) / 21) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0478_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0478
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0479 : Poly :=
[
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 479 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0479 : Poly :=
[
  term ((-8979241671985367 : Rat) / 14919795060912) [(0, 1), (14, 4)],
  term ((8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(1, 1), (14, 3), (15, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 3)],
  term ((8979241671985367 : Rat) / 14919795060912) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0479_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0479
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0480 : Poly :=
[
  term ((-825362042598976999 : Rat) / 417754261705536) [(15, 2)]
]

/-- Partial product 480 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0480 : Poly :=
[
  term ((825362042598976999 : Rat) / 208877130852768) [(0, 1), (14, 1), (15, 2)],
  term ((-825362042598976999 : Rat) / 417754261705536) [(0, 2), (15, 2)],
  term ((825362042598976999 : Rat) / 208877130852768) [(1, 1), (15, 3)],
  term ((-825362042598976999 : Rat) / 417754261705536) [(1, 2), (15, 2)],
  term ((-825362042598976999 : Rat) / 208877130852768) [(14, 1), (15, 2)],
  term ((825362042598976999 : Rat) / 417754261705536) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0480_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0480
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0481 : Poly :=
[
  term ((-1175 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 481 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0481 : Poly :=
[
  term ((1175 : Rat) / 126) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1175 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((1175 : Rat) / 126) [(1, 1), (15, 3), (16, 1)],
  term ((-1175 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((-1175 : Rat) / 126) [(14, 1), (15, 2), (16, 1)],
  term ((1175 : Rat) / 252) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0481_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0481
        rs_R009_ueqv_R009YNNNN_generator_28_0400_0481 =
      rs_R009_ueqv_R009YNNNN_partial_28_0481 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_28_0400_0481 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_28_0400,
  rs_R009_ueqv_R009YNNNN_partial_28_0401,
  rs_R009_ueqv_R009YNNNN_partial_28_0402,
  rs_R009_ueqv_R009YNNNN_partial_28_0403,
  rs_R009_ueqv_R009YNNNN_partial_28_0404,
  rs_R009_ueqv_R009YNNNN_partial_28_0405,
  rs_R009_ueqv_R009YNNNN_partial_28_0406,
  rs_R009_ueqv_R009YNNNN_partial_28_0407,
  rs_R009_ueqv_R009YNNNN_partial_28_0408,
  rs_R009_ueqv_R009YNNNN_partial_28_0409,
  rs_R009_ueqv_R009YNNNN_partial_28_0410,
  rs_R009_ueqv_R009YNNNN_partial_28_0411,
  rs_R009_ueqv_R009YNNNN_partial_28_0412,
  rs_R009_ueqv_R009YNNNN_partial_28_0413,
  rs_R009_ueqv_R009YNNNN_partial_28_0414,
  rs_R009_ueqv_R009YNNNN_partial_28_0415,
  rs_R009_ueqv_R009YNNNN_partial_28_0416,
  rs_R009_ueqv_R009YNNNN_partial_28_0417,
  rs_R009_ueqv_R009YNNNN_partial_28_0418,
  rs_R009_ueqv_R009YNNNN_partial_28_0419,
  rs_R009_ueqv_R009YNNNN_partial_28_0420,
  rs_R009_ueqv_R009YNNNN_partial_28_0421,
  rs_R009_ueqv_R009YNNNN_partial_28_0422,
  rs_R009_ueqv_R009YNNNN_partial_28_0423,
  rs_R009_ueqv_R009YNNNN_partial_28_0424,
  rs_R009_ueqv_R009YNNNN_partial_28_0425,
  rs_R009_ueqv_R009YNNNN_partial_28_0426,
  rs_R009_ueqv_R009YNNNN_partial_28_0427,
  rs_R009_ueqv_R009YNNNN_partial_28_0428,
  rs_R009_ueqv_R009YNNNN_partial_28_0429,
  rs_R009_ueqv_R009YNNNN_partial_28_0430,
  rs_R009_ueqv_R009YNNNN_partial_28_0431,
  rs_R009_ueqv_R009YNNNN_partial_28_0432,
  rs_R009_ueqv_R009YNNNN_partial_28_0433,
  rs_R009_ueqv_R009YNNNN_partial_28_0434,
  rs_R009_ueqv_R009YNNNN_partial_28_0435,
  rs_R009_ueqv_R009YNNNN_partial_28_0436,
  rs_R009_ueqv_R009YNNNN_partial_28_0437,
  rs_R009_ueqv_R009YNNNN_partial_28_0438,
  rs_R009_ueqv_R009YNNNN_partial_28_0439,
  rs_R009_ueqv_R009YNNNN_partial_28_0440,
  rs_R009_ueqv_R009YNNNN_partial_28_0441,
  rs_R009_ueqv_R009YNNNN_partial_28_0442,
  rs_R009_ueqv_R009YNNNN_partial_28_0443,
  rs_R009_ueqv_R009YNNNN_partial_28_0444,
  rs_R009_ueqv_R009YNNNN_partial_28_0445,
  rs_R009_ueqv_R009YNNNN_partial_28_0446,
  rs_R009_ueqv_R009YNNNN_partial_28_0447,
  rs_R009_ueqv_R009YNNNN_partial_28_0448,
  rs_R009_ueqv_R009YNNNN_partial_28_0449,
  rs_R009_ueqv_R009YNNNN_partial_28_0450,
  rs_R009_ueqv_R009YNNNN_partial_28_0451,
  rs_R009_ueqv_R009YNNNN_partial_28_0452,
  rs_R009_ueqv_R009YNNNN_partial_28_0453,
  rs_R009_ueqv_R009YNNNN_partial_28_0454,
  rs_R009_ueqv_R009YNNNN_partial_28_0455,
  rs_R009_ueqv_R009YNNNN_partial_28_0456,
  rs_R009_ueqv_R009YNNNN_partial_28_0457,
  rs_R009_ueqv_R009YNNNN_partial_28_0458,
  rs_R009_ueqv_R009YNNNN_partial_28_0459,
  rs_R009_ueqv_R009YNNNN_partial_28_0460,
  rs_R009_ueqv_R009YNNNN_partial_28_0461,
  rs_R009_ueqv_R009YNNNN_partial_28_0462,
  rs_R009_ueqv_R009YNNNN_partial_28_0463,
  rs_R009_ueqv_R009YNNNN_partial_28_0464,
  rs_R009_ueqv_R009YNNNN_partial_28_0465,
  rs_R009_ueqv_R009YNNNN_partial_28_0466,
  rs_R009_ueqv_R009YNNNN_partial_28_0467,
  rs_R009_ueqv_R009YNNNN_partial_28_0468,
  rs_R009_ueqv_R009YNNNN_partial_28_0469,
  rs_R009_ueqv_R009YNNNN_partial_28_0470,
  rs_R009_ueqv_R009YNNNN_partial_28_0471,
  rs_R009_ueqv_R009YNNNN_partial_28_0472,
  rs_R009_ueqv_R009YNNNN_partial_28_0473,
  rs_R009_ueqv_R009YNNNN_partial_28_0474,
  rs_R009_ueqv_R009YNNNN_partial_28_0475,
  rs_R009_ueqv_R009YNNNN_partial_28_0476,
  rs_R009_ueqv_R009YNNNN_partial_28_0477,
  rs_R009_ueqv_R009YNNNN_partial_28_0478,
  rs_R009_ueqv_R009YNNNN_partial_28_0479,
  rs_R009_ueqv_R009YNNNN_partial_28_0480,
  rs_R009_ueqv_R009YNNNN_partial_28_0481
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_28_0400_0481 : Poly :=
[
  term ((997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((8129680847544803 : Rat) / 17406427571064) [(0, 1), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 3)],
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16548508723813 : Rat) / 59205535956) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-165 : Rat) / 14) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-374600327072621 : Rat) / 1243316255076) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((74 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 21) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3345960567365771 : Rat) / 2131399294416) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37 : Rat) / 8) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((209 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-5 : Rat) / 6) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-23112508959082217 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1)],
  term ((54395296296323315 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((317 : Rat) / 42) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40243415163974875 : Rat) / 34812855142128) [(0, 1), (10, 1), (14, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-130 : Rat) / 7) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (14, 3)],
  term ((38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-449184815257946815 : Rat) / 313315696279152) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1115 : Rat) / 72) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-108597121582627661 : Rat) / 313315696279152) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((21425 : Rat) / 504) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((-515507385315874009 : Rat) / 104438565426384) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((281 : Rat) / 18) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((130 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18563669541364060 : Rat) / 6527410339149) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4733 : Rat) / 126) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((13214377901035967 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((118218305640064951 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 2)],
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-45 : Rat) / 56) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-345 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((155 : Rat) / 42) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((73 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-734005072430414635 : Rat) / 313315696279152) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-389 : Rat) / 168) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9044189192801354 : Rat) / 6527410339149) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1633 : Rat) / 126) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-162334705359487 : Rat) / 483511876974) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-73 : Rat) / 7) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((4803988168861391 : Rat) / 6394197883248) [(0, 1), (13, 2), (14, 1)],
  term ((-10355 : Rat) / 504) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10067479039185853 : Rat) / 6394197883248) [(0, 1), (13, 2), (14, 2)],
  term ((6385 : Rat) / 504) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (13, 2), (14, 3)],
  term ((345 : Rat) / 28) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((825362042598976999 : Rat) / 208877130852768) [(0, 1), (14, 1), (15, 2)],
  term ((1175 : Rat) / 126) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16814933658018277 : Rat) / 34812855142128) [(0, 1), (14, 2)],
  term ((-9954757113931841 : Rat) / 104438565426384) [(0, 1), (14, 2), (15, 2)],
  term ((8 : Rat) / 7) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(0, 1), (14, 2), (16, 1)],
  term ((64176249966468293 : Rat) / 69625710284256) [(0, 1), (14, 3)],
  term ((-32 : Rat) / 21) [(0, 1), (14, 3), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(0, 1), (14, 4)],
  term ((-997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((23112508959082217 : Rat) / 52219282713192) [(0, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16548508723813 : Rat) / 118411071912) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 28) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((374600327072621 : Rat) / 2486632510152) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-37 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3345960567365771 : Rat) / 4262798588832) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((37 : Rat) / 16) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((40243415163974875 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((-54395296296323315 : Rat) / 52219282713192) [(0, 2), (10, 1), (15, 2)],
  term ((-317 : Rat) / 84) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((449184815257946815 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1)],
  term ((108597121582627661 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-21425 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1115 : Rat) / 144) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((9281834770682030 : Rat) / 6527410339149) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((4733 : Rat) / 252) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((515507385315874009 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((-281 : Rat) / 36) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-13214377901035967 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((-118218305640064951 : Rat) / 52219282713192) [(0, 2), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4522094596400677 : Rat) / 6527410339149) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((1633 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((734005072430414635 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((389 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4803988168861391 : Rat) / 12788395766496) [(0, 2), (13, 2)],
  term ((10067479039185853 : Rat) / 12788395766496) [(0, 2), (13, 2), (14, 1)],
  term ((-6385 : Rat) / 1008) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((10355 : Rat) / 1008) [(0, 2), (13, 2), (16, 1)],
  term ((16814933658018277 : Rat) / 69625710284256) [(0, 2), (14, 1)],
  term ((9954757113931841 : Rat) / 208877130852768) [(0, 2), (14, 1), (15, 2)],
  term ((-4 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-64176249966468293 : Rat) / 139251420568512) [(0, 2), (14, 2)],
  term ((16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((-825362042598976999 : Rat) / 417754261705536) [(0, 2), (15, 2)],
  term ((-1175 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((8129680847544803 : Rat) / 17406427571064) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (15, 3)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16548508723813 : Rat) / 59205535956) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-165 : Rat) / 14) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-374600327072621 : Rat) / 1243316255076) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((74 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((209 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3345960567365771 : Rat) / 2131399294416) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-37 : Rat) / 8) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 6) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40243415163974875 : Rat) / 34812855142128) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-23112508959082217 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)],
  term ((54395296296323315 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 3)],
  term ((317 : Rat) / 42) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-108597121582627661 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((21425 : Rat) / 504) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-449184815257946815 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1115 : Rat) / 72) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-305 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18563669541364060 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4733 : Rat) / 126) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-515507385315874009 : Rat) / 104438565426384) [(1, 1), (11, 1), (15, 2)],
  term ((281 : Rat) / 18) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (15, 4)],
  term ((130 : Rat) / 7) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((118218305640064951 : Rat) / 26109641356596) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((13214377901035967 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (11, 2), (15, 3)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-345 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-45 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((73 : Rat) / 7) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (15, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (15, 3)],
  term ((155 : Rat) / 42) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((9044189192801354 : Rat) / 6527410339149) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1633 : Rat) / 126) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-162334705359487 : Rat) / 483511876974) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-73 : Rat) / 7) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-734005072430414635 : Rat) / 313315696279152) [(1, 1), (13, 1), (15, 2)],
  term ((-389 : Rat) / 168) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10067479039185853 : Rat) / 6394197883248) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((6385 : Rat) / 504) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((345 : Rat) / 28) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((4803988168861391 : Rat) / 6394197883248) [(1, 1), (13, 2), (15, 1)],
  term ((-10355 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16814933658018277 : Rat) / 34812855142128) [(1, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 21) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9954757113931841 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 3)],
  term ((8 : Rat) / 7) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((64176249966468293 : Rat) / 69625710284256) [(1, 1), (14, 2), (15, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(1, 1), (14, 3), (15, 1)],
  term ((825362042598976999 : Rat) / 208877130852768) [(1, 1), (15, 3)],
  term ((1175 : Rat) / 126) [(1, 1), (15, 3), (16, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((23112508959082217 : Rat) / 52219282713192) [(1, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16548508723813 : Rat) / 118411071912) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 28) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((374600327072621 : Rat) / 2486632510152) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-37 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3345960567365771 : Rat) / 4262798588832) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((37 : Rat) / 16) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((40243415163974875 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((-54395296296323315 : Rat) / 52219282713192) [(1, 2), (10, 1), (15, 2)],
  term ((-317 : Rat) / 84) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((449184815257946815 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1)],
  term ((108597121582627661 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-21425 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1115 : Rat) / 144) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((9281834770682030 : Rat) / 6527410339149) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((4733 : Rat) / 252) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((515507385315874009 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((-281 : Rat) / 36) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-13214377901035967 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((-118218305640064951 : Rat) / 52219282713192) [(1, 2), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4522094596400677 : Rat) / 6527410339149) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1633 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((734005072430414635 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((389 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4803988168861391 : Rat) / 12788395766496) [(1, 2), (13, 2)],
  term ((10067479039185853 : Rat) / 12788395766496) [(1, 2), (13, 2), (14, 1)],
  term ((-6385 : Rat) / 1008) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((10355 : Rat) / 1008) [(1, 2), (13, 2), (16, 1)],
  term ((16814933658018277 : Rat) / 69625710284256) [(1, 2), (14, 1)],
  term ((9954757113931841 : Rat) / 208877130852768) [(1, 2), (14, 1), (15, 2)],
  term ((-4 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((-64176249966468293 : Rat) / 139251420568512) [(1, 2), (14, 2)],
  term ((16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((-825362042598976999 : Rat) / 417754261705536) [(1, 2), (15, 2)],
  term ((-1175 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (14, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (14, 1), (15, 2)],
  term ((-34965623926536125 : Rat) / 69625710284256) [(9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (14, 3)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)],
  term ((-23112508959082217 : Rat) / 52219282713192) [(10, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16548508723813 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1)],
  term ((24565345129573 : Rat) / 59205535956) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 14) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((643966030306157 : Rat) / 1243316255076) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-74 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-374600327072621 : Rat) / 2486632510152) [(10, 1), (11, 1), (15, 1)],
  term ((37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(10, 1), (12, 1), (14, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3180553900752365 : Rat) / 2131399294416) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((677 : Rat) / 56) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3345960567365771 : Rat) / 4262798588832) [(10, 1), (13, 1), (15, 1)],
  term ((-37 : Rat) / 16) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 2)],
  term ((-3254745666 : Rat) / 548199407) [(10, 1), (13, 2), (14, 1)],
  term ((100 : Rat) / 21) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (13, 2), (14, 2)],
  term ((-55 : Rat) / 7) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)],
  term ((64169826180733111 : Rat) / 208877130852768) [(10, 1), (14, 1)],
  term ((-51425684927134529 : Rat) / 26109641356596) [(10, 1), (14, 1), (15, 2)],
  term ((-101 : Rat) / 6) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((43648453447390453 : Rat) / 34812855142128) [(10, 1), (14, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (14, 2), (15, 2)],
  term ((130 : Rat) / 7) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (14, 3)],
  term ((54395296296323315 : Rat) / 52219282713192) [(10, 1), (15, 2)],
  term ((317 : Rat) / 84) [(10, 1), (15, 2), (16, 1)],
  term ((-52450596748132 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)],
  term ((-449184815257946815 : Rat) / 626631392558304) [(11, 1), (13, 1)],
  term ((263257502977755323 : Rat) / 208877130852768) [(11, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((305 : Rat) / 14) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4115 : Rat) / 112) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((142537200190053197 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 2)],
  term ((-21425 : Rat) / 504) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (13, 1), (14, 3)],
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1115 : Rat) / 144) [(11, 1), (13, 1), (16, 1)],
  term ((366998028984961529 : Rat) / 104438565426384) [(11, 1), (14, 1), (15, 1)],
  term ((-963 : Rat) / 28) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (14, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((17819020446918886 : Rat) / 6527410339149) [(11, 1), (14, 2), (15, 1)],
  term ((4733 : Rat) / 126) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(11, 1), (14, 3), (15, 1)],
  term ((-515507385315874009 : Rat) / 208877130852768) [(11, 1), (15, 1)],
  term ((281 : Rat) / 36) [(11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)],
  term ((13214377901035967 : Rat) / 52219282713192) [(11, 2)],
  term ((10198838870888113 : Rat) / 5802142523688) [(11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(11, 2), (14, 1), (15, 2)],
  term ((-118218305640064951 : Rat) / 26109641356596) [(11, 2), (14, 2)],
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1)],
  term ((-103211137313135 : Rat) / 532849823604) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-75 : Rat) / 14) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((345 : Rat) / 28) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5436202201483 : Rat) / 133212455901) [(12, 1), (14, 1)],
  term ((4967761621597573 : Rat) / 8703213785532) [(12, 1), (14, 1), (15, 2)],
  term ((32 : Rat) / 21) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 1), (14, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 1), (14, 2), (15, 2)],
  term ((-73 : Rat) / 7) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)],
  term ((951065613057647131 : Rat) / 313315696279152) [(13, 1), (14, 1), (15, 1)],
  term ((-2099 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40559793815911565 : Rat) / 26109641356596) [(13, 1), (14, 2), (15, 1)],
  term ((488 : Rat) / 63) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(13, 1), (14, 3), (15, 1)],
  term ((73 : Rat) / 7) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-734005072430414635 : Rat) / 626631392558304) [(13, 1), (15, 1)],
  term ((-389 : Rat) / 336) [(13, 1), (15, 1), (16, 1)],
  term ((4803988168861391 : Rat) / 12788395766496) [(13, 2)],
  term ((-19675455376908635 : Rat) / 12788395766496) [(13, 2), (14, 1)],
  term ((27095 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)],
  term ((633654860216866 : Rat) / 399637367703) [(13, 2), (14, 2)],
  term ((-410 : Rat) / 63) [(13, 2), (14, 2), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(13, 2), (14, 3)],
  term ((-345 : Rat) / 28) [(13, 2), (14, 3), (16, 1)],
  term ((-10355 : Rat) / 1008) [(13, 2), (16, 1)],
  term ((-16814933658018277 : Rat) / 69625710284256) [(14, 1)],
  term ((-11601622218234845 : Rat) / 2901071261844) [(14, 1), (15, 2)],
  term ((-1103 : Rat) / 126) [(14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(14, 1), (16, 1)],
  term ((43811994866180467 : Rat) / 46417140189504) [(14, 2)],
  term ((9954757113931841 : Rat) / 104438565426384) [(14, 2), (15, 2)],
  term ((-8 : Rat) / 7) [(14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(14, 2), (16, 1)],
  term ((-15961465100206403 : Rat) / 13054820678298) [(14, 3)],
  term ((32 : Rat) / 21) [(14, 3), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(14, 4)],
  term ((825362042598976999 : Rat) / 417754261705536) [(15, 2)],
  term ((1175 : Rat) / 252) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 400 through 481. -/
theorem rs_R009_ueqv_R009YNNNN_block_28_0400_0481_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_28_0400_0481
      rs_R009_ueqv_R009YNNNN_block_28_0400_0481 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
