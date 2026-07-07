/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 29:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0100 : Poly :=
[
  term ((-163637251427997559 : Rat) / 52219282713192) [(2, 1), (11, 2)]
]

/-- Partial product 100 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0100 : Poly :=
[
  term ((163637251427997559 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-163637251427997559 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 2)],
  term ((163637251427997559 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-163637251427997559 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 2)],
  term ((-163637251427997559 : Rat) / 26109641356596) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((163637251427997559 : Rat) / 52219282713192) [(2, 1), (3, 2), (11, 2)],
  term ((-163637251427997559 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((163637251427997559 : Rat) / 52219282713192) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0100
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0101 : Poly :=
[
  term ((-3757375036771861 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0101 : Poly :=
[
  term ((3757375036771861 : Rat) / 1598549470812) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3757375036771861 : Rat) / 3197098941624) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((3757375036771861 : Rat) / 1598549470812) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-3757375036771861 : Rat) / 3197098941624) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-3757375036771861 : Rat) / 1598549470812) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((3757375036771861 : Rat) / 3197098941624) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-3757375036771861 : Rat) / 1598549470812) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((3757375036771861 : Rat) / 3197098941624) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0101
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0102 : Poly :=
[
  term ((7465 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0102 : Poly :=
[
  term ((-7465 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7465 : Rat) / 252) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7465 : Rat) / 126) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((7465 : Rat) / 252) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((7465 : Rat) / 126) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7465 : Rat) / 252) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((7465 : Rat) / 126) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7465 : Rat) / 252) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0102
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0103 : Poly :=
[
  term ((-764637496555085 : Rat) / 26109641356596) [(2, 1), (14, 1)]
]

/-- Partial product 103 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0103 : Poly :=
[
  term ((764637496555085 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 2)],
  term ((-764637496555085 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((764637496555085 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-764637496555085 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((-764637496555085 : Rat) / 13054820678298) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((764637496555085 : Rat) / 26109641356596) [(2, 1), (3, 2), (14, 1)],
  term ((-764637496555085 : Rat) / 13054820678298) [(2, 2), (14, 2)],
  term ((764637496555085 : Rat) / 26109641356596) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0103
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0104 : Poly :=
[
  term ((22237246544662757 : Rat) / 13054820678298) [(2, 1), (15, 2)]
]

/-- Partial product 104 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0104 : Poly :=
[
  term ((-22237246544662757 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((22237246544662757 : Rat) / 13054820678298) [(0, 2), (2, 1), (15, 2)],
  term ((-22237246544662757 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 3)],
  term ((22237246544662757 : Rat) / 13054820678298) [(1, 2), (2, 1), (15, 2)],
  term ((22237246544662757 : Rat) / 6527410339149) [(2, 1), (3, 1), (15, 3)],
  term ((-22237246544662757 : Rat) / 13054820678298) [(2, 1), (3, 2), (15, 2)],
  term ((22237246544662757 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((-22237246544662757 : Rat) / 13054820678298) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0104
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0105 : Poly :=
[
  term ((-211 : Rat) / 9) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0105 : Poly :=
[
  term ((422 : Rat) / 9) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-211 : Rat) / 9) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((422 : Rat) / 9) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-211 : Rat) / 9) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-422 : Rat) / 9) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((211 : Rat) / 9) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-422 : Rat) / 9) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((211 : Rat) / 9) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0105
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0106 : Poly :=
[
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 106 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0106 : Poly :=
[
  term ((68176191761805829 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-68176191761805829 : Rat) / 19582231017447) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0106
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0107 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 107 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0107 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(3, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0107
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0108 : Poly :=
[
  term ((68198443155553157 : Rat) / 39164462034894) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 108 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0108 : Poly :=
[
  term ((-68198443155553157 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((68198443155553157 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-68198443155553157 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((68198443155553157 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((68198443155553157 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-68198443155553157 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((68198443155553157 : Rat) / 19582231017447) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-68198443155553157 : Rat) / 39164462034894) [(3, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0108
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0109 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 109 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0109 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0109
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0110 : Poly :=
[
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 110 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0110 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 63) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0110
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0111 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 111 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0111 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0111
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0112 : Poly :=
[
  term ((-5392685014514719 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 112 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0112 : Poly :=
[
  term ((5392685014514719 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(3, 2), (6, 1), (15, 2)],
  term ((5392685014514719 : Rat) / 26109641356596) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0112
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0113 : Poly :=
[
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0113 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 9) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0113
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0114 : Poly :=
[
  term ((52484541134402921 : Rat) / 78328924069788) [(3, 1), (7, 1)]
]

/-- Partial product 114 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0114 : Poly :=
[
  term ((-52484541134402921 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((52484541134402921 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1)],
  term ((-52484541134402921 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((52484541134402921 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1)],
  term ((52484541134402921 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-52484541134402921 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1)],
  term ((52484541134402921 : Rat) / 39164462034894) [(3, 2), (7, 1), (15, 1)],
  term ((-52484541134402921 : Rat) / 78328924069788) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0114
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0115 : Poly :=
[
  term ((-179097377537666107 : Rat) / 156657848139576) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 115 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0115 : Poly :=
[
  term ((179097377537666107 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-179097377537666107 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((179097377537666107 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-179097377537666107 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-179097377537666107 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((179097377537666107 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-179097377537666107 : Rat) / 78328924069788) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((179097377537666107 : Rat) / 156657848139576) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0115
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0116 : Poly :=
[
  term ((5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 116 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0116 : Poly :=
[
  term ((-5636963000954311 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((5636963000954311 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((5636963000954311 : Rat) / 26109641356596) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((5636963000954311 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((5636963000954311 : Rat) / 13054820678298) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0116
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0117 : Poly :=
[
  term ((27927884896855 : Rat) / 20234803428) [(3, 1), (9, 1)]
]

/-- Partial product 117 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0117 : Poly :=
[
  term ((-27927884896855 : Rat) / 10117401714) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((27927884896855 : Rat) / 20234803428) [(0, 2), (3, 1), (9, 1)],
  term ((-27927884896855 : Rat) / 10117401714) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((27927884896855 : Rat) / 20234803428) [(1, 2), (3, 1), (9, 1)],
  term ((27927884896855 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-27927884896855 : Rat) / 20234803428) [(2, 2), (3, 1), (9, 1)],
  term ((27927884896855 : Rat) / 10117401714) [(3, 2), (9, 1), (15, 1)],
  term ((-27927884896855 : Rat) / 20234803428) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0117
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0118 : Poly :=
[
  term ((-251773386266831 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 118 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0118 : Poly :=
[
  term ((251773386266831 : Rat) / 80939213712) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-251773386266831 : Rat) / 161878427424) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((251773386266831 : Rat) / 80939213712) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-251773386266831 : Rat) / 161878427424) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-251773386266831 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((251773386266831 : Rat) / 161878427424) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((-251773386266831 : Rat) / 80939213712) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((251773386266831 : Rat) / 161878427424) [(3, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0118
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0119 : Poly :=
[
  term ((-7197005097740 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 119 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0119 : Poly :=
[
  term ((14394010195480 : Rat) / 5058700857) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-7197005097740 : Rat) / 5058700857) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((14394010195480 : Rat) / 5058700857) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-7197005097740 : Rat) / 5058700857) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-14394010195480 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((7197005097740 : Rat) / 5058700857) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-14394010195480 : Rat) / 5058700857) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((7197005097740 : Rat) / 5058700857) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0119
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0120 : Poly :=
[
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 120 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0120 : Poly :=
[
  term ((97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 2), (9, 1), (15, 3)],
  term ((48640 : Rat) / 343) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0120
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0121 : Poly :=
[
  term ((32070569874741991 : Rat) / 52219282713192) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 121 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0121 : Poly :=
[
  term ((-32070569874741991 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((32070569874741991 : Rat) / 52219282713192) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-32070569874741991 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((32070569874741991 : Rat) / 52219282713192) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((32070569874741991 : Rat) / 26109641356596) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-32070569874741991 : Rat) / 52219282713192) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((32070569874741991 : Rat) / 26109641356596) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-32070569874741991 : Rat) / 52219282713192) [(3, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0121
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0122 : Poly :=
[
  term ((1453453219233419 : Rat) / 913456840464) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 122 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0122 : Poly :=
[
  term ((-1453453219233419 : Rat) / 456728420232) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((1453453219233419 : Rat) / 913456840464) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-1453453219233419 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((1453453219233419 : Rat) / 913456840464) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((1453453219233419 : Rat) / 456728420232) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1453453219233419 : Rat) / 913456840464) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((1453453219233419 : Rat) / 456728420232) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1453453219233419 : Rat) / 913456840464) [(3, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0122
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0123 : Poly :=
[
  term ((-24785 : Rat) / 504) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0123 : Poly :=
[
  term ((24785 : Rat) / 252) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24785 : Rat) / 504) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((24785 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24785 : Rat) / 504) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-24785 : Rat) / 252) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((24785 : Rat) / 504) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-24785 : Rat) / 252) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24785 : Rat) / 504) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0123
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0124 : Poly :=
[
  term ((-983603856893543 : Rat) / 456728420232) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 124 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0124 : Poly :=
[
  term ((983603856893543 : Rat) / 228364210116) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-983603856893543 : Rat) / 456728420232) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((983603856893543 : Rat) / 228364210116) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-983603856893543 : Rat) / 456728420232) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-983603856893543 : Rat) / 228364210116) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((983603856893543 : Rat) / 456728420232) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-983603856893543 : Rat) / 228364210116) [(3, 2), (10, 1), (15, 2)],
  term ((983603856893543 : Rat) / 456728420232) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0124
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0125 : Poly :=
[
  term ((4961 : Rat) / 126) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0125 : Poly :=
[
  term ((-4961 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4961 : Rat) / 126) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4961 : Rat) / 63) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((4961 : Rat) / 126) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4961 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4961 : Rat) / 126) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4961 : Rat) / 63) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4961 : Rat) / 126) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0125
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0126 : Poly :=
[
  term ((-85480681190419327 : Rat) / 156657848139576) [(3, 1), (11, 1)]
]

/-- Partial product 126 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0126 : Poly :=
[
  term ((85480681190419327 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-85480681190419327 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((85480681190419327 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-85480681190419327 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((-85480681190419327 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((85480681190419327 : Rat) / 156657848139576) [(2, 2), (3, 1), (11, 1)],
  term ((-85480681190419327 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)],
  term ((85480681190419327 : Rat) / 156657848139576) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0126
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0127 : Poly :=
[
  term ((36120382054880111 : Rat) / 17406427571064) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 127 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0127 : Poly :=
[
  term ((-36120382054880111 : Rat) / 8703213785532) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((36120382054880111 : Rat) / 17406427571064) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-36120382054880111 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((36120382054880111 : Rat) / 17406427571064) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((36120382054880111 : Rat) / 8703213785532) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-36120382054880111 : Rat) / 17406427571064) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((36120382054880111 : Rat) / 8703213785532) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-36120382054880111 : Rat) / 17406427571064) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0127
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0128 : Poly :=
[
  term ((-1143433821648613 : Rat) / 799274735406) [(3, 1), (13, 1)]
]

/-- Partial product 128 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0128 : Poly :=
[
  term ((1143433821648613 : Rat) / 399637367703) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1143433821648613 : Rat) / 799274735406) [(0, 2), (3, 1), (13, 1)],
  term ((1143433821648613 : Rat) / 399637367703) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-1143433821648613 : Rat) / 799274735406) [(1, 2), (3, 1), (13, 1)],
  term ((-1143433821648613 : Rat) / 399637367703) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((1143433821648613 : Rat) / 799274735406) [(2, 2), (3, 1), (13, 1)],
  term ((-1143433821648613 : Rat) / 399637367703) [(3, 2), (13, 1), (15, 1)],
  term ((1143433821648613 : Rat) / 799274735406) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0128
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0129 : Poly :=
[
  term ((83480736672389027 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 129 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0129 : Poly :=
[
  term ((-83480736672389027 : Rat) / 39164462034894) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((83480736672389027 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-83480736672389027 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((83480736672389027 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((83480736672389027 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-83480736672389027 : Rat) / 78328924069788) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((83480736672389027 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-83480736672389027 : Rat) / 78328924069788) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0129
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0130 : Poly :=
[
  term ((160 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 130 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0130 : Poly :=
[
  term ((-320 : Rat) / 63) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((160 : Rat) / 63) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-320 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 63) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((320 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-160 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((320 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 63) [(3, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0130
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0131 : Poly :=
[
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 131 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0131 : Poly :=
[
  term ((-1377280 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((688640 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1377280 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((688640 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((1377280 : Rat) / 3087) [(3, 2), (13, 1), (15, 3)],
  term ((-688640 : Rat) / 3087) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0131
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0132 : Poly :=
[
  term ((2785 : Rat) / 63) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0132 : Poly :=
[
  term ((-5570 : Rat) / 63) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-5570 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((5570 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((5570 : Rat) / 63) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0132
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0133 : Poly :=
[
  term ((-32154520438617935 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 133 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0133 : Poly :=
[
  term ((32154520438617935 : Rat) / 19582231017447) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-32154520438617935 : Rat) / 39164462034894) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((32154520438617935 : Rat) / 19582231017447) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-32154520438617935 : Rat) / 39164462034894) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-32154520438617935 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((32154520438617935 : Rat) / 39164462034894) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-32154520438617935 : Rat) / 19582231017447) [(3, 2), (14, 1), (15, 2)],
  term ((32154520438617935 : Rat) / 39164462034894) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0133
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0134 : Poly :=
[
  term ((-304 : Rat) / 63) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0134 : Poly :=
[
  term ((608 : Rat) / 63) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-304 : Rat) / 63) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-304 : Rat) / 63) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((304 : Rat) / 63) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((304 : Rat) / 63) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0134
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0135 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 135 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0135 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (14, 3), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0135
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0136 : Poly :=
[
  term ((323530211759069173 : Rat) / 156657848139576) [(3, 1), (15, 1)]
]

/-- Partial product 136 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0136 : Poly :=
[
  term ((-323530211759069173 : Rat) / 78328924069788) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((323530211759069173 : Rat) / 156657848139576) [(0, 2), (3, 1), (15, 1)],
  term ((-323530211759069173 : Rat) / 78328924069788) [(1, 1), (3, 1), (15, 2)],
  term ((323530211759069173 : Rat) / 156657848139576) [(1, 2), (3, 1), (15, 1)],
  term ((323530211759069173 : Rat) / 78328924069788) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-323530211759069173 : Rat) / 156657848139576) [(2, 2), (3, 1), (15, 1)],
  term ((323530211759069173 : Rat) / 78328924069788) [(3, 2), (15, 2)],
  term ((-323530211759069173 : Rat) / 156657848139576) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0136
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0137 : Poly :=
[
  term ((-2236 : Rat) / 63) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0137 : Poly :=
[
  term ((4472 : Rat) / 63) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 63) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((4472 : Rat) / 63) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2236 : Rat) / 63) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-4472 : Rat) / 63) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2236 : Rat) / 63) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-4472 : Rat) / 63) [(3, 2), (15, 2), (16, 1)],
  term ((2236 : Rat) / 63) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0137
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0138 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 138 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0138 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (14, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (15, 4)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(2, 2), (3, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(3, 2), (15, 4)],
  term ((-373760 : Rat) / 3087) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0138
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0139 : Poly :=
[
  term ((-19757480070692395 : Rat) / 39164462034894) [(3, 2)]
]

/-- Partial product 139 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0139 : Poly :=
[
  term ((19757480070692395 : Rat) / 19582231017447) [(0, 1), (3, 2), (14, 1)],
  term ((-19757480070692395 : Rat) / 39164462034894) [(0, 2), (3, 2)],
  term ((19757480070692395 : Rat) / 19582231017447) [(1, 1), (3, 2), (15, 1)],
  term ((-19757480070692395 : Rat) / 39164462034894) [(1, 2), (3, 2)],
  term ((-19757480070692395 : Rat) / 19582231017447) [(2, 1), (3, 2), (14, 1)],
  term ((19757480070692395 : Rat) / 39164462034894) [(2, 2), (3, 2)],
  term ((-19757480070692395 : Rat) / 19582231017447) [(3, 3), (15, 1)],
  term ((19757480070692395 : Rat) / 39164462034894) [(3, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0139
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0140 : Poly :=
[
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)]
]

/-- Partial product 140 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0140 : Poly :=
[
  term ((-6297910881408425 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((6297910881408425 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((6297910881408425 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(2, 2), (3, 2), (6, 1)],
  term ((6297910881408425 : Rat) / 39164462034894) [(3, 3), (6, 1), (15, 1)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0140
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0141 : Poly :=
[
  term ((1002136091944765 : Rat) / 1983010735944) [(3, 2), (10, 1)]
]

/-- Partial product 141 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0141 : Poly :=
[
  term ((-1002136091944765 : Rat) / 991505367972) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((1002136091944765 : Rat) / 1983010735944) [(0, 2), (3, 2), (10, 1)],
  term ((-1002136091944765 : Rat) / 991505367972) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((1002136091944765 : Rat) / 1983010735944) [(1, 2), (3, 2), (10, 1)],
  term ((1002136091944765 : Rat) / 991505367972) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1002136091944765 : Rat) / 1983010735944) [(2, 2), (3, 2), (10, 1)],
  term ((1002136091944765 : Rat) / 991505367972) [(3, 3), (10, 1), (15, 1)],
  term ((-1002136091944765 : Rat) / 1983010735944) [(3, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0141
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0142 : Poly :=
[
  term ((60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 1)]
]

/-- Partial product 142 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0142 : Poly :=
[
  term ((-60172824405945655 : Rat) / 39164462034894) [(0, 1), (3, 2), (14, 2)],
  term ((60172824405945655 : Rat) / 78328924069788) [(0, 2), (3, 2), (14, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((60172824405945655 : Rat) / 78328924069788) [(1, 2), (3, 2), (14, 1)],
  term ((60172824405945655 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 2)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(2, 2), (3, 2), (14, 1)],
  term ((60172824405945655 : Rat) / 39164462034894) [(3, 3), (14, 1), (15, 1)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0142
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0143 : Poly :=
[
  term ((1514136876960749 : Rat) / 8703213785532) [(6, 1)]
]

/-- Partial product 143 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0143 : Poly :=
[
  term ((-1514136876960749 : Rat) / 4351606892766) [(0, 1), (6, 1), (14, 1)],
  term ((1514136876960749 : Rat) / 8703213785532) [(0, 2), (6, 1)],
  term ((-1514136876960749 : Rat) / 4351606892766) [(1, 1), (6, 1), (15, 1)],
  term ((1514136876960749 : Rat) / 8703213785532) [(1, 2), (6, 1)],
  term ((1514136876960749 : Rat) / 4351606892766) [(2, 1), (6, 1), (14, 1)],
  term ((-1514136876960749 : Rat) / 8703213785532) [(2, 2), (6, 1)],
  term ((1514136876960749 : Rat) / 4351606892766) [(3, 1), (6, 1), (15, 1)],
  term ((-1514136876960749 : Rat) / 8703213785532) [(3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0143
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0144 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 144 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0144 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0144
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0145 : Poly :=
[
  term ((-8799860248337722 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 145 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0145 : Poly :=
[
  term ((17599720496675444 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-8799860248337722 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((17599720496675444 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-8799860248337722 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-17599720496675444 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((8799860248337722 : Rat) / 6527410339149) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((-17599720496675444 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((8799860248337722 : Rat) / 6527410339149) [(3, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0145
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0146 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 146 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0146 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0146
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0147 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0147 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0147
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0148 : Poly :=
[
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 148 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0148 : Poly :=
[
  term ((-20283918945798503 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((20283918945798503 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0148
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0149 : Poly :=
[
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0149 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0149
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0150 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)]
]

/-- Partial product 150 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0150 : Poly :=
[
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (14, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(0, 2), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(1, 2), (6, 1), (7, 2)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2), (14, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 2)],
  term ((1382044204093718 : Rat) / 932487191307) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0150
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0151 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 151 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0151 : Poly :=
[
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0151
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0152 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)]
]

/-- Partial product 152 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0152 : Poly :=
[
  term ((1994038900525423 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(0, 2), (6, 1), (10, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(1, 2), (6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(2, 2), (6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(3, 2), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0152
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0153 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 153 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0153 : Poly :=
[
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(3, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0153
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0154 : Poly :=
[
  term ((340 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0154 : Poly :=
[
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((680 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((680 : Rat) / 63) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0154
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0155 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 155 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0155 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0155
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0156 : Poly :=
[
  term ((-7445616965641892 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 156 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0156 : Poly :=
[
  term ((14891233931283784 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7445616965641892 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((14891233931283784 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-7445616965641892 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-14891233931283784 : Rat) / 6527410339149) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((7445616965641892 : Rat) / 6527410339149) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-14891233931283784 : Rat) / 6527410339149) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((7445616965641892 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0156
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0157 : Poly :=
[
  term ((-64 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0157 : Poly :=
[
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0157
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0158 : Poly :=
[
  term ((1855984775624458 : Rat) / 6527410339149) [(6, 1), (11, 2)]
]

/-- Partial product 158 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0158 : Poly :=
[
  term ((-3711969551248916 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((1855984775624458 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((-3711969551248916 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((1855984775624458 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((3711969551248916 : Rat) / 6527410339149) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((-1855984775624458 : Rat) / 6527410339149) [(2, 2), (6, 1), (11, 2)],
  term ((3711969551248916 : Rat) / 6527410339149) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1855984775624458 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0158
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0159 : Poly :=
[
  term ((3821670574112 : Rat) / 26861770943) [(6, 1), (15, 2)]
]

/-- Partial product 159 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0159 : Poly :=
[
  term ((-7643341148224 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((3821670574112 : Rat) / 26861770943) [(0, 2), (6, 1), (15, 2)],
  term ((-7643341148224 : Rat) / 26861770943) [(1, 1), (6, 1), (15, 3)],
  term ((3821670574112 : Rat) / 26861770943) [(1, 2), (6, 1), (15, 2)],
  term ((7643341148224 : Rat) / 26861770943) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3821670574112 : Rat) / 26861770943) [(2, 2), (6, 1), (15, 2)],
  term ((7643341148224 : Rat) / 26861770943) [(3, 1), (6, 1), (15, 3)],
  term ((-3821670574112 : Rat) / 26861770943) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0159
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0160 : Poly :=
[
  term ((6848456620138034 : Rat) / 19582231017447) [(7, 1), (9, 1)]
]

/-- Partial product 160 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0160 : Poly :=
[
  term ((-13696913240276068 : Rat) / 19582231017447) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((6848456620138034 : Rat) / 19582231017447) [(0, 2), (7, 1), (9, 1)],
  term ((-13696913240276068 : Rat) / 19582231017447) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((6848456620138034 : Rat) / 19582231017447) [(1, 2), (7, 1), (9, 1)],
  term ((13696913240276068 : Rat) / 19582231017447) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6848456620138034 : Rat) / 19582231017447) [(2, 2), (7, 1), (9, 1)],
  term ((13696913240276068 : Rat) / 19582231017447) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6848456620138034 : Rat) / 19582231017447) [(3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0160
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0161 : Poly :=
[
  term ((28553591780285 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 161 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0161 : Poly :=
[
  term ((-28553591780285 : Rat) / 20234803428) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((28553591780285 : Rat) / 40469606856) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-28553591780285 : Rat) / 20234803428) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((28553591780285 : Rat) / 40469606856) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((28553591780285 : Rat) / 20234803428) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-28553591780285 : Rat) / 40469606856) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((28553591780285 : Rat) / 20234803428) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-28553591780285 : Rat) / 40469606856) [(3, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0161
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0162 : Poly :=
[
  term ((21024049785311879 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 162 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0162 : Poly :=
[
  term ((-21024049785311879 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((21024049785311879 : Rat) / 13054820678298) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-21024049785311879 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((21024049785311879 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((21024049785311879 : Rat) / 6527410339149) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-21024049785311879 : Rat) / 13054820678298) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((21024049785311879 : Rat) / 6527410339149) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-21024049785311879 : Rat) / 13054820678298) [(3, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0162
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0163 : Poly :=
[
  term ((-1114169853494231 : Rat) / 1598549470812) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 163 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0163 : Poly :=
[
  term ((1114169853494231 : Rat) / 799274735406) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1114169853494231 : Rat) / 1598549470812) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((1114169853494231 : Rat) / 799274735406) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1114169853494231 : Rat) / 1598549470812) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-1114169853494231 : Rat) / 799274735406) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((1114169853494231 : Rat) / 1598549470812) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-1114169853494231 : Rat) / 799274735406) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1114169853494231 : Rat) / 1598549470812) [(3, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0163
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0164 : Poly :=
[
  term ((9035 : Rat) / 126) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 164 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0164 : Poly :=
[
  term ((-9035 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9035 : Rat) / 126) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9035 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9035 : Rat) / 126) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9035 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9035 : Rat) / 126) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9035 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9035 : Rat) / 126) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0164
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0165 : Poly :=
[
  term ((-2973539398952219 : Rat) / 17406427571064) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 165 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0165 : Poly :=
[
  term ((2973539398952219 : Rat) / 8703213785532) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2973539398952219 : Rat) / 17406427571064) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((2973539398952219 : Rat) / 8703213785532) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-2973539398952219 : Rat) / 17406427571064) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-2973539398952219 : Rat) / 8703213785532) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((2973539398952219 : Rat) / 17406427571064) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((-2973539398952219 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((2973539398952219 : Rat) / 17406427571064) [(3, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0165
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0166 : Poly :=
[
  term ((-3802 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0166 : Poly :=
[
  term ((7604 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3802 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((7604 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3802 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7604 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3802 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7604 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((3802 : Rat) / 63) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0166
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0167 : Poly :=
[
  term ((-23647668758736391 : Rat) / 17406427571064) [(7, 1), (11, 1)]
]

/-- Partial product 167 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0167 : Poly :=
[
  term ((23647668758736391 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-23647668758736391 : Rat) / 17406427571064) [(0, 2), (7, 1), (11, 1)],
  term ((23647668758736391 : Rat) / 8703213785532) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-23647668758736391 : Rat) / 17406427571064) [(1, 2), (7, 1), (11, 1)],
  term ((-23647668758736391 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((23647668758736391 : Rat) / 17406427571064) [(2, 2), (7, 1), (11, 1)],
  term ((-23647668758736391 : Rat) / 8703213785532) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((23647668758736391 : Rat) / 17406427571064) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0167
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0168 : Poly :=
[
  term ((7660998914045 : Rat) / 644682502632) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 168 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0168 : Poly :=
[
  term ((-7660998914045 : Rat) / 322341251316) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((7660998914045 : Rat) / 644682502632) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-7660998914045 : Rat) / 322341251316) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 644682502632) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((7660998914045 : Rat) / 322341251316) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-7660998914045 : Rat) / 644682502632) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((7660998914045 : Rat) / 322341251316) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7660998914045 : Rat) / 644682502632) [(3, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0168
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0169 : Poly :=
[
  term ((-27849749083850065 : Rat) / 78328924069788) [(7, 1), (13, 1)]
]

/-- Partial product 169 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0169 : Poly :=
[
  term ((27849749083850065 : Rat) / 39164462034894) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-27849749083850065 : Rat) / 78328924069788) [(0, 2), (7, 1), (13, 1)],
  term ((27849749083850065 : Rat) / 39164462034894) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-27849749083850065 : Rat) / 78328924069788) [(1, 2), (7, 1), (13, 1)],
  term ((-27849749083850065 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((27849749083850065 : Rat) / 78328924069788) [(2, 2), (7, 1), (13, 1)],
  term ((-27849749083850065 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((27849749083850065 : Rat) / 78328924069788) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0169
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0170 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 170 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0170 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(3, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0170
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0171 : Poly :=
[
  term ((-85 : Rat) / 63) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 171 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0171 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 63) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0171
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0172 : Poly :=
[
  term ((-5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 172 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0172 : Poly :=
[
  term ((11531641327674458 : Rat) / 6527410339149) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-11531641327674458 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((5765820663837229 : Rat) / 6527410339149) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-11531641327674458 : Rat) / 6527410339149) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((5765820663837229 : Rat) / 6527410339149) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0172
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0173 : Poly :=
[
  term ((13733149961268991 : Rat) / 26109641356596) [(7, 1), (15, 1)]
]

/-- Partial product 173 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0173 : Poly :=
[
  term ((-13733149961268991 : Rat) / 13054820678298) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((13733149961268991 : Rat) / 26109641356596) [(0, 2), (7, 1), (15, 1)],
  term ((-13733149961268991 : Rat) / 13054820678298) [(1, 1), (7, 1), (15, 2)],
  term ((13733149961268991 : Rat) / 26109641356596) [(1, 2), (7, 1), (15, 1)],
  term ((13733149961268991 : Rat) / 13054820678298) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-13733149961268991 : Rat) / 26109641356596) [(2, 2), (7, 1), (15, 1)],
  term ((13733149961268991 : Rat) / 13054820678298) [(3, 1), (7, 1), (15, 2)],
  term ((-13733149961268991 : Rat) / 26109641356596) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0173
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0174 : Poly :=
[
  term ((16 : Rat) / 9) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0174 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 9) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 9) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0174
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0175 : Poly :=
[
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2)]
]

/-- Partial product 175 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0175 : Poly :=
[
  term ((-691022102046859 : Rat) / 932487191307) [(0, 1), (7, 2), (14, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(1, 1), (7, 2), (15, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 1), (7, 2), (14, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 2), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(3, 1), (7, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(3, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0175
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0176 : Poly :=
[
  term ((8787165754409615 : Rat) / 13054820678298) [(7, 2), (10, 1)]
]

/-- Partial product 176 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0176 : Poly :=
[
  term ((-8787165754409615 : Rat) / 6527410339149) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term ((8787165754409615 : Rat) / 13054820678298) [(0, 2), (7, 2), (10, 1)],
  term ((-8787165754409615 : Rat) / 6527410339149) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((8787165754409615 : Rat) / 13054820678298) [(1, 2), (7, 2), (10, 1)],
  term ((8787165754409615 : Rat) / 6527410339149) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((-8787165754409615 : Rat) / 13054820678298) [(2, 2), (7, 2), (10, 1)],
  term ((8787165754409615 : Rat) / 6527410339149) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((-8787165754409615 : Rat) / 13054820678298) [(3, 2), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0176
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0177 : Poly :=
[
  term ((10861008665 : Rat) / 749437164) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 177 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0177 : Poly :=
[
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-10861008665 : Rat) / 374718582) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((10861008665 : Rat) / 749437164) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((10861008665 : Rat) / 374718582) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-10861008665 : Rat) / 749437164) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((10861008665 : Rat) / 374718582) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-10861008665 : Rat) / 749437164) [(3, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0177
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0178 : Poly :=
[
  term ((8525891802025 : Rat) / 40469606856) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 178 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0178 : Poly :=
[
  term ((-8525891802025 : Rat) / 20234803428) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((8525891802025 : Rat) / 40469606856) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-8525891802025 : Rat) / 20234803428) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((8525891802025 : Rat) / 40469606856) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((8525891802025 : Rat) / 20234803428) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8525891802025 : Rat) / 40469606856) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((8525891802025 : Rat) / 20234803428) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-8525891802025 : Rat) / 40469606856) [(3, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0178
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0179 : Poly :=
[
  term ((1022114293920193 : Rat) / 913456840464) [(9, 1), (11, 1)]
]

/-- Partial product 179 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0179 : Poly :=
[
  term ((-1022114293920193 : Rat) / 456728420232) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((1022114293920193 : Rat) / 913456840464) [(0, 2), (9, 1), (11, 1)],
  term ((-1022114293920193 : Rat) / 456728420232) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1022114293920193 : Rat) / 913456840464) [(1, 2), (9, 1), (11, 1)],
  term ((1022114293920193 : Rat) / 456728420232) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1022114293920193 : Rat) / 913456840464) [(2, 2), (9, 1), (11, 1)],
  term ((1022114293920193 : Rat) / 456728420232) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1022114293920193 : Rat) / 913456840464) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0179
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0180 : Poly :=
[
  term ((-251975401028 : Rat) / 562077873) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 180 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0180 : Poly :=
[
  term ((503950802056 : Rat) / 562077873) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-251975401028 : Rat) / 562077873) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((503950802056 : Rat) / 562077873) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-251975401028 : Rat) / 562077873) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-503950802056 : Rat) / 562077873) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((251975401028 : Rat) / 562077873) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-503950802056 : Rat) / 562077873) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((251975401028 : Rat) / 562077873) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0180
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0181 : Poly :=
[
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1)]
]

/-- Partial product 181 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0181 : Poly :=
[
  term ((-7819657675 : Rat) / 333083184) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((7819657675 : Rat) / 666166368) [(0, 2), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 333083184) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((7819657675 : Rat) / 666166368) [(1, 2), (9, 1), (13, 1)],
  term ((7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-7819657675 : Rat) / 666166368) [(2, 2), (9, 1), (13, 1)],
  term ((7819657675 : Rat) / 333083184) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-7819657675 : Rat) / 666166368) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0181
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0182 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 182 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0182 : Poly :=
[
  term ((-53777198303881 : Rat) / 40469606856) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-53777198303881 : Rat) / 80939213712) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0182
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0183 : Poly :=
[
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 183 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0183 : Poly :=
[
  term ((-725 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((725 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 28) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0183
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0184 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 184 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0184 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0184
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0185 : Poly :=
[
  term ((-786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 1)]
]

/-- Partial product 185 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0185 : Poly :=
[
  term ((786611939080851491 : Rat) / 313315696279152) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(0, 2), (9, 1), (15, 1)],
  term ((786611939080851491 : Rat) / 313315696279152) [(1, 1), (9, 1), (15, 2)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(1, 2), (9, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((786611939080851491 : Rat) / 626631392558304) [(2, 2), (9, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(3, 1), (9, 1), (15, 2)],
  term ((786611939080851491 : Rat) / 626631392558304) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0185
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0186 : Poly :=
[
  term ((-443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0186 : Poly :=
[
  term ((443 : Rat) / 21) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 42) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 21) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-443 : Rat) / 42) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 21) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 42) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 21) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((443 : Rat) / 42) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0186
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0187 : Poly :=
[
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2)]
]

/-- Partial product 187 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0187 : Poly :=
[
  term ((-385847904595639 : Rat) / 11604285047376) [(0, 1), (9, 2), (14, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(0, 2), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(1, 1), (9, 2), (15, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(1, 2), (9, 2)],
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2), (14, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(2, 2), (9, 2)],
  term ((385847904595639 : Rat) / 11604285047376) [(3, 1), (9, 2), (15, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0187
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0188 : Poly :=
[
  term ((-22318926948373961 : Rat) / 52219282713192) [(10, 1)]
]

/-- Partial product 188 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0188 : Poly :=
[
  term ((22318926948373961 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1)],
  term ((-22318926948373961 : Rat) / 52219282713192) [(0, 2), (10, 1)],
  term ((22318926948373961 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)],
  term ((-22318926948373961 : Rat) / 52219282713192) [(1, 2), (10, 1)],
  term ((-22318926948373961 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1)],
  term ((22318926948373961 : Rat) / 52219282713192) [(2, 2), (10, 1)],
  term ((-22318926948373961 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 1)],
  term ((22318926948373961 : Rat) / 52219282713192) [(3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0188
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0189 : Poly :=
[
  term ((-4706213285 : Rat) / 374718582) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 189 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0189 : Poly :=
[
  term ((4706213285 : Rat) / 187359291) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((4706213285 : Rat) / 187359291) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4706213285 : Rat) / 374718582) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 374718582) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4706213285 : Rat) / 374718582) [(3, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0189
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0190 : Poly :=
[
  term ((5 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 190 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0190 : Poly :=
[
  term ((-10 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0190
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0191 : Poly :=
[
  term ((-73652516242775921 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 191 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0191 : Poly :=
[
  term ((73652516242775921 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-73652516242775921 : Rat) / 52219282713192) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((73652516242775921 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-73652516242775921 : Rat) / 52219282713192) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-73652516242775921 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((73652516242775921 : Rat) / 52219282713192) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-73652516242775921 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((73652516242775921 : Rat) / 52219282713192) [(3, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0191
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0192 : Poly :=
[
  term ((-4 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0192 : Poly :=
[
  term ((8 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0192
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0193 : Poly :=
[
  term ((-363440853829339 : Rat) / 1598549470812) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 193 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0193 : Poly :=
[
  term ((363440853829339 : Rat) / 799274735406) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-363440853829339 : Rat) / 1598549470812) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((363440853829339 : Rat) / 799274735406) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-363440853829339 : Rat) / 1598549470812) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-363440853829339 : Rat) / 799274735406) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((363440853829339 : Rat) / 1598549470812) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-363440853829339 : Rat) / 799274735406) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((363440853829339 : Rat) / 1598549470812) [(3, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0193
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0194 : Poly :=
[
  term ((-3305 : Rat) / 126) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0194 : Poly :=
[
  term ((3305 : Rat) / 63) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3305 : Rat) / 126) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3305 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3305 : Rat) / 126) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3305 : Rat) / 63) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3305 : Rat) / 126) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3305 : Rat) / 63) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3305 : Rat) / 126) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0194
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0195 : Poly :=
[
  term ((5022513854579299 : Rat) / 8703213785532) [(10, 1), (15, 2)]
]

/-- Partial product 195 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0195 : Poly :=
[
  term ((-5022513854579299 : Rat) / 4351606892766) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((5022513854579299 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)],
  term ((-5022513854579299 : Rat) / 4351606892766) [(1, 1), (10, 1), (15, 3)],
  term ((5022513854579299 : Rat) / 8703213785532) [(1, 2), (10, 1), (15, 2)],
  term ((5022513854579299 : Rat) / 4351606892766) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-5022513854579299 : Rat) / 8703213785532) [(2, 2), (10, 1), (15, 2)],
  term ((5022513854579299 : Rat) / 4351606892766) [(3, 1), (10, 1), (15, 3)],
  term ((-5022513854579299 : Rat) / 8703213785532) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0195
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0196 : Poly :=
[
  term ((1450 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 196 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0196 : Poly :=
[
  term ((-2900 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1450 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2900 : Rat) / 63) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((1450 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((2900 : Rat) / 63) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1450 : Rat) / 63) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((2900 : Rat) / 63) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1450 : Rat) / 63) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0196
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0197 : Poly :=
[
  term ((-2833148790090667 : Rat) / 3197098941624) [(11, 1), (13, 1)]
]

/-- Partial product 197 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0197 : Poly :=
[
  term ((2833148790090667 : Rat) / 1598549470812) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2833148790090667 : Rat) / 3197098941624) [(0, 2), (11, 1), (13, 1)],
  term ((2833148790090667 : Rat) / 1598549470812) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2833148790090667 : Rat) / 3197098941624) [(1, 2), (11, 1), (13, 1)],
  term ((-2833148790090667 : Rat) / 1598549470812) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((2833148790090667 : Rat) / 3197098941624) [(2, 2), (11, 1), (13, 1)],
  term ((-2833148790090667 : Rat) / 1598549470812) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2833148790090667 : Rat) / 3197098941624) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0197
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0198 : Poly :=
[
  term ((2713821482549767 : Rat) / 6527410339149) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 198 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0198 : Poly :=
[
  term ((-5427642965099534 : Rat) / 6527410339149) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((2713821482549767 : Rat) / 6527410339149) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-5427642965099534 : Rat) / 6527410339149) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2713821482549767 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((5427642965099534 : Rat) / 6527410339149) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2713821482549767 : Rat) / 6527410339149) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((5427642965099534 : Rat) / 6527410339149) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2713821482549767 : Rat) / 6527410339149) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0198
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0199 : Poly :=
[
  term ((100 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 199 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0199 : Poly :=
[
  term ((-200 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((100 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-200 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((100 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0199
        rs_R009_ueqv_R009YNNNN_generator_29_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_29_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_29_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_29_0100,
  rs_R009_ueqv_R009YNNNN_partial_29_0101,
  rs_R009_ueqv_R009YNNNN_partial_29_0102,
  rs_R009_ueqv_R009YNNNN_partial_29_0103,
  rs_R009_ueqv_R009YNNNN_partial_29_0104,
  rs_R009_ueqv_R009YNNNN_partial_29_0105,
  rs_R009_ueqv_R009YNNNN_partial_29_0106,
  rs_R009_ueqv_R009YNNNN_partial_29_0107,
  rs_R009_ueqv_R009YNNNN_partial_29_0108,
  rs_R009_ueqv_R009YNNNN_partial_29_0109,
  rs_R009_ueqv_R009YNNNN_partial_29_0110,
  rs_R009_ueqv_R009YNNNN_partial_29_0111,
  rs_R009_ueqv_R009YNNNN_partial_29_0112,
  rs_R009_ueqv_R009YNNNN_partial_29_0113,
  rs_R009_ueqv_R009YNNNN_partial_29_0114,
  rs_R009_ueqv_R009YNNNN_partial_29_0115,
  rs_R009_ueqv_R009YNNNN_partial_29_0116,
  rs_R009_ueqv_R009YNNNN_partial_29_0117,
  rs_R009_ueqv_R009YNNNN_partial_29_0118,
  rs_R009_ueqv_R009YNNNN_partial_29_0119,
  rs_R009_ueqv_R009YNNNN_partial_29_0120,
  rs_R009_ueqv_R009YNNNN_partial_29_0121,
  rs_R009_ueqv_R009YNNNN_partial_29_0122,
  rs_R009_ueqv_R009YNNNN_partial_29_0123,
  rs_R009_ueqv_R009YNNNN_partial_29_0124,
  rs_R009_ueqv_R009YNNNN_partial_29_0125,
  rs_R009_ueqv_R009YNNNN_partial_29_0126,
  rs_R009_ueqv_R009YNNNN_partial_29_0127,
  rs_R009_ueqv_R009YNNNN_partial_29_0128,
  rs_R009_ueqv_R009YNNNN_partial_29_0129,
  rs_R009_ueqv_R009YNNNN_partial_29_0130,
  rs_R009_ueqv_R009YNNNN_partial_29_0131,
  rs_R009_ueqv_R009YNNNN_partial_29_0132,
  rs_R009_ueqv_R009YNNNN_partial_29_0133,
  rs_R009_ueqv_R009YNNNN_partial_29_0134,
  rs_R009_ueqv_R009YNNNN_partial_29_0135,
  rs_R009_ueqv_R009YNNNN_partial_29_0136,
  rs_R009_ueqv_R009YNNNN_partial_29_0137,
  rs_R009_ueqv_R009YNNNN_partial_29_0138,
  rs_R009_ueqv_R009YNNNN_partial_29_0139,
  rs_R009_ueqv_R009YNNNN_partial_29_0140,
  rs_R009_ueqv_R009YNNNN_partial_29_0141,
  rs_R009_ueqv_R009YNNNN_partial_29_0142,
  rs_R009_ueqv_R009YNNNN_partial_29_0143,
  rs_R009_ueqv_R009YNNNN_partial_29_0144,
  rs_R009_ueqv_R009YNNNN_partial_29_0145,
  rs_R009_ueqv_R009YNNNN_partial_29_0146,
  rs_R009_ueqv_R009YNNNN_partial_29_0147,
  rs_R009_ueqv_R009YNNNN_partial_29_0148,
  rs_R009_ueqv_R009YNNNN_partial_29_0149,
  rs_R009_ueqv_R009YNNNN_partial_29_0150,
  rs_R009_ueqv_R009YNNNN_partial_29_0151,
  rs_R009_ueqv_R009YNNNN_partial_29_0152,
  rs_R009_ueqv_R009YNNNN_partial_29_0153,
  rs_R009_ueqv_R009YNNNN_partial_29_0154,
  rs_R009_ueqv_R009YNNNN_partial_29_0155,
  rs_R009_ueqv_R009YNNNN_partial_29_0156,
  rs_R009_ueqv_R009YNNNN_partial_29_0157,
  rs_R009_ueqv_R009YNNNN_partial_29_0158,
  rs_R009_ueqv_R009YNNNN_partial_29_0159,
  rs_R009_ueqv_R009YNNNN_partial_29_0160,
  rs_R009_ueqv_R009YNNNN_partial_29_0161,
  rs_R009_ueqv_R009YNNNN_partial_29_0162,
  rs_R009_ueqv_R009YNNNN_partial_29_0163,
  rs_R009_ueqv_R009YNNNN_partial_29_0164,
  rs_R009_ueqv_R009YNNNN_partial_29_0165,
  rs_R009_ueqv_R009YNNNN_partial_29_0166,
  rs_R009_ueqv_R009YNNNN_partial_29_0167,
  rs_R009_ueqv_R009YNNNN_partial_29_0168,
  rs_R009_ueqv_R009YNNNN_partial_29_0169,
  rs_R009_ueqv_R009YNNNN_partial_29_0170,
  rs_R009_ueqv_R009YNNNN_partial_29_0171,
  rs_R009_ueqv_R009YNNNN_partial_29_0172,
  rs_R009_ueqv_R009YNNNN_partial_29_0173,
  rs_R009_ueqv_R009YNNNN_partial_29_0174,
  rs_R009_ueqv_R009YNNNN_partial_29_0175,
  rs_R009_ueqv_R009YNNNN_partial_29_0176,
  rs_R009_ueqv_R009YNNNN_partial_29_0177,
  rs_R009_ueqv_R009YNNNN_partial_29_0178,
  rs_R009_ueqv_R009YNNNN_partial_29_0179,
  rs_R009_ueqv_R009YNNNN_partial_29_0180,
  rs_R009_ueqv_R009YNNNN_partial_29_0181,
  rs_R009_ueqv_R009YNNNN_partial_29_0182,
  rs_R009_ueqv_R009YNNNN_partial_29_0183,
  rs_R009_ueqv_R009YNNNN_partial_29_0184,
  rs_R009_ueqv_R009YNNNN_partial_29_0185,
  rs_R009_ueqv_R009YNNNN_partial_29_0186,
  rs_R009_ueqv_R009YNNNN_partial_29_0187,
  rs_R009_ueqv_R009YNNNN_partial_29_0188,
  rs_R009_ueqv_R009YNNNN_partial_29_0189,
  rs_R009_ueqv_R009YNNNN_partial_29_0190,
  rs_R009_ueqv_R009YNNNN_partial_29_0191,
  rs_R009_ueqv_R009YNNNN_partial_29_0192,
  rs_R009_ueqv_R009YNNNN_partial_29_0193,
  rs_R009_ueqv_R009YNNNN_partial_29_0194,
  rs_R009_ueqv_R009YNNNN_partial_29_0195,
  rs_R009_ueqv_R009YNNNN_partial_29_0196,
  rs_R009_ueqv_R009YNNNN_partial_29_0197,
  rs_R009_ueqv_R009YNNNN_partial_29_0198,
  rs_R009_ueqv_R009YNNNN_partial_29_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_29_0100_0199 : Poly :=
[
  term ((163637251427997559 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((3757375036771861 : Rat) / 1598549470812) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7465 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22237246544662757 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((422 : Rat) / 9) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((764637496555085 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 2)],
  term ((68176191761805829 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-68198443155553157 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((179097377537666107 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-52484541134402921 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((251773386266831 : Rat) / 80939213712) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-27927884896855 : Rat) / 10117401714) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((14394010195480 : Rat) / 5058700857) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-32070569874741991 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1453453219233419 : Rat) / 456728420232) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((24785 : Rat) / 252) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((983603856893543 : Rat) / 228364210116) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4961 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((85480681190419327 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-36120382054880111 : Rat) / 8703213785532) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((1143433821648613 : Rat) / 399637367703) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1377280 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5570 : Rat) / 63) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83480736672389027 : Rat) / 39164462034894) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-320 : Rat) / 63) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-323530211759069173 : Rat) / 78328924069788) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((4472 : Rat) / 63) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (14, 1), (15, 3)],
  term ((32154520438617935 : Rat) / 19582231017447) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((608 : Rat) / 63) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (14, 3), (15, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((-1002136091944765 : Rat) / 991505367972) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((19757480070692395 : Rat) / 19582231017447) [(0, 1), (3, 2), (14, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(0, 1), (3, 2), (14, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((17599720496675444 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14891233931283784 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3711969551248916 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-1514136876960749 : Rat) / 4351606892766) [(0, 1), (6, 1), (14, 1)],
  term ((-7643341148224 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-28553591780285 : Rat) / 20234803428) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-13696913240276068 : Rat) / 19582231017447) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-21024049785311879 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((1114169853494231 : Rat) / 799274735406) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9035 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2973539398952219 : Rat) / 8703213785532) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((7604 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((23647668758736391 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-7660998914045 : Rat) / 322341251316) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((27849749083850065 : Rat) / 39164462034894) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-13733149961268991 : Rat) / 13054820678298) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-8787165754409615 : Rat) / 6527410339149) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(0, 1), (7, 2), (14, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-8525891802025 : Rat) / 20234803428) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1022114293920193 : Rat) / 456728420232) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((503950802056 : Rat) / 562077873) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-7819657675 : Rat) / 333083184) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((786611939080851491 : Rat) / 313315696279152) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((443 : Rat) / 21) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(0, 1), (9, 2), (14, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((73652516242775921 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((363440853829339 : Rat) / 799274735406) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3305 : Rat) / 63) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22318926948373961 : Rat) / 26109641356596) [(0, 1), (10, 1), (14, 1)],
  term ((-5022513854579299 : Rat) / 4351606892766) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2900 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2833148790090667 : Rat) / 1598549470812) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5427642965099534 : Rat) / 6527410339149) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-200 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-163637251427997559 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 2)],
  term ((-3757375036771861 : Rat) / 3197098941624) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((7465 : Rat) / 252) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-764637496555085 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((22237246544662757 : Rat) / 13054820678298) [(0, 2), (2, 1), (15, 2)],
  term ((-211 : Rat) / 9) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((68198443155553157 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((52484541134402921 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1)],
  term ((-179097377537666107 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((5636963000954311 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((27927884896855 : Rat) / 20234803428) [(0, 2), (3, 1), (9, 1)],
  term ((-251773386266831 : Rat) / 161878427424) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-7197005097740 : Rat) / 5058700857) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((32070569874741991 : Rat) / 52219282713192) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((1453453219233419 : Rat) / 913456840464) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-24785 : Rat) / 504) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-983603856893543 : Rat) / 456728420232) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((4961 : Rat) / 126) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-85480681190419327 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((36120382054880111 : Rat) / 17406427571064) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-1143433821648613 : Rat) / 799274735406) [(0, 2), (3, 1), (13, 1)],
  term ((83480736672389027 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((160 : Rat) / 63) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((688640 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((2785 : Rat) / 63) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-32154520438617935 : Rat) / 39164462034894) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-304 : Rat) / 63) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((323530211759069173 : Rat) / 156657848139576) [(0, 2), (3, 1), (15, 1)],
  term ((-2236 : Rat) / 63) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((-19757480070692395 : Rat) / 39164462034894) [(0, 2), (3, 2)],
  term ((6297910881408425 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((1002136091944765 : Rat) / 1983010735944) [(0, 2), (3, 2), (10, 1)],
  term ((60172824405945655 : Rat) / 78328924069788) [(0, 2), (3, 2), (14, 1)],
  term ((1514136876960749 : Rat) / 8703213785532) [(0, 2), (6, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-8799860248337722 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(0, 2), (6, 1), (7, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(0, 2), (6, 1), (10, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7445616965641892 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1855984775624458 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((3821670574112 : Rat) / 26861770943) [(0, 2), (6, 1), (15, 2)],
  term ((6848456620138034 : Rat) / 19582231017447) [(0, 2), (7, 1), (9, 1)],
  term ((28553591780285 : Rat) / 40469606856) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((21024049785311879 : Rat) / 13054820678298) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-1114169853494231 : Rat) / 1598549470812) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((9035 : Rat) / 126) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2973539398952219 : Rat) / 17406427571064) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-3802 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23647668758736391 : Rat) / 17406427571064) [(0, 2), (7, 1), (11, 1)],
  term ((7660998914045 : Rat) / 644682502632) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-27849749083850065 : Rat) / 78328924069788) [(0, 2), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((13733149961268991 : Rat) / 26109641356596) [(0, 2), (7, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (7, 2)],
  term ((8787165754409615 : Rat) / 13054820678298) [(0, 2), (7, 2), (10, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((8525891802025 : Rat) / 40469606856) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((1022114293920193 : Rat) / 913456840464) [(0, 2), (9, 1), (11, 1)],
  term ((-251975401028 : Rat) / 562077873) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((7819657675 : Rat) / 666166368) [(0, 2), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(0, 2), (9, 1), (15, 1)],
  term ((-443 : Rat) / 42) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(0, 2), (9, 2)],
  term ((-22318926948373961 : Rat) / 52219282713192) [(0, 2), (10, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((5 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-73652516242775921 : Rat) / 52219282713192) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363440853829339 : Rat) / 1598549470812) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3305 : Rat) / 126) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5022513854579299 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)],
  term ((1450 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2833148790090667 : Rat) / 3197098941624) [(0, 2), (11, 1), (13, 1)],
  term ((2713821482549767 : Rat) / 6527410339149) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((100 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((163637251427997559 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((3757375036771861 : Rat) / 1598549470812) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-7465 : Rat) / 126) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((764637496555085 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-22237246544662757 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 3)],
  term ((422 : Rat) / 9) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-68198443155553157 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((5392685014514719 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((179097377537666107 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-52484541134402921 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((251773386266831 : Rat) / 80939213712) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((14394010195480 : Rat) / 5058700857) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-27927884896855 : Rat) / 10117401714) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-32070569874741991 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1453453219233419 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((24785 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((983603856893543 : Rat) / 228364210116) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-4961 : Rat) / 63) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-36120382054880111 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((85480681190419327 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-83480736672389027 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-320 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143433821648613 : Rat) / 399637367703) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-5570 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1377280 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((32154520438617935 : Rat) / 19582231017447) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((608 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-323530211759069173 : Rat) / 78328924069788) [(1, 1), (3, 1), (15, 2)],
  term ((4472 : Rat) / 63) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (15, 4)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-1002136091944765 : Rat) / 991505367972) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((19757480070692395 : Rat) / 19582231017447) [(1, 1), (3, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((17599720496675444 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((14891233931283784 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((128 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3711969551248916 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1514136876960749 : Rat) / 4351606892766) [(1, 1), (6, 1), (15, 1)],
  term ((-7643341148224 : Rat) / 26861770943) [(1, 1), (6, 1), (15, 3)],
  term ((-28553591780285 : Rat) / 20234803428) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-13696913240276068 : Rat) / 19582231017447) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-21024049785311879 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((1114169853494231 : Rat) / 799274735406) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9035 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2973539398952219 : Rat) / 8703213785532) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((7604 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7660998914045 : Rat) / 322341251316) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((23647668758736391 : Rat) / 8703213785532) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((27849749083850065 : Rat) / 39164462034894) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-13733149961268991 : Rat) / 13054820678298) [(1, 1), (7, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8787165754409615 : Rat) / 6527410339149) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(1, 1), (7, 2), (15, 1)],
  term ((-10861008665 : Rat) / 374718582) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8525891802025 : Rat) / 20234803428) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((503950802056 : Rat) / 562077873) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1022114293920193 : Rat) / 456728420232) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7819657675 : Rat) / 333083184) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-725 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((786611939080851491 : Rat) / 313315696279152) [(1, 1), (9, 1), (15, 2)],
  term ((443 : Rat) / 21) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(1, 1), (9, 2), (15, 1)],
  term ((4706213285 : Rat) / 187359291) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((73652516242775921 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((8 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363440853829339 : Rat) / 799274735406) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((3305 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((22318926948373961 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)],
  term ((-5022513854579299 : Rat) / 4351606892766) [(1, 1), (10, 1), (15, 3)],
  term ((-2900 : Rat) / 63) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5427642965099534 : Rat) / 6527410339149) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-200 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2833148790090667 : Rat) / 1598549470812) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-163637251427997559 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 2)],
  term ((-3757375036771861 : Rat) / 3197098941624) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((7465 : Rat) / 252) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-764637496555085 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((22237246544662757 : Rat) / 13054820678298) [(1, 2), (2, 1), (15, 2)],
  term ((-211 : Rat) / 9) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((68198443155553157 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((52484541134402921 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1)],
  term ((-179097377537666107 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((5636963000954311 : Rat) / 26109641356596) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((27927884896855 : Rat) / 20234803428) [(1, 2), (3, 1), (9, 1)],
  term ((-251773386266831 : Rat) / 161878427424) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-7197005097740 : Rat) / 5058700857) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((32070569874741991 : Rat) / 52219282713192) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((1453453219233419 : Rat) / 913456840464) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-24785 : Rat) / 504) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-983603856893543 : Rat) / 456728420232) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((4961 : Rat) / 126) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-85480681190419327 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((36120382054880111 : Rat) / 17406427571064) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-1143433821648613 : Rat) / 799274735406) [(1, 2), (3, 1), (13, 1)],
  term ((83480736672389027 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((160 : Rat) / 63) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((688640 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((2785 : Rat) / 63) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-32154520438617935 : Rat) / 39164462034894) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-304 : Rat) / 63) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((323530211759069173 : Rat) / 156657848139576) [(1, 2), (3, 1), (15, 1)],
  term ((-2236 : Rat) / 63) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((-19757480070692395 : Rat) / 39164462034894) [(1, 2), (3, 2)],
  term ((6297910881408425 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((1002136091944765 : Rat) / 1983010735944) [(1, 2), (3, 2), (10, 1)],
  term ((60172824405945655 : Rat) / 78328924069788) [(1, 2), (3, 2), (14, 1)],
  term ((1514136876960749 : Rat) / 8703213785532) [(1, 2), (6, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-8799860248337722 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(1, 2), (6, 1), (7, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(1, 2), (6, 1), (10, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7445616965641892 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1855984775624458 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((3821670574112 : Rat) / 26861770943) [(1, 2), (6, 1), (15, 2)],
  term ((6848456620138034 : Rat) / 19582231017447) [(1, 2), (7, 1), (9, 1)],
  term ((28553591780285 : Rat) / 40469606856) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((21024049785311879 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-1114169853494231 : Rat) / 1598549470812) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((9035 : Rat) / 126) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2973539398952219 : Rat) / 17406427571064) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-3802 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23647668758736391 : Rat) / 17406427571064) [(1, 2), (7, 1), (11, 1)],
  term ((7660998914045 : Rat) / 644682502632) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-27849749083850065 : Rat) / 78328924069788) [(1, 2), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((13733149961268991 : Rat) / 26109641356596) [(1, 2), (7, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (7, 2)],
  term ((8787165754409615 : Rat) / 13054820678298) [(1, 2), (7, 2), (10, 1)],
  term ((10861008665 : Rat) / 749437164) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((8525891802025 : Rat) / 40469606856) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((1022114293920193 : Rat) / 913456840464) [(1, 2), (9, 1), (11, 1)],
  term ((-251975401028 : Rat) / 562077873) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((7819657675 : Rat) / 666166368) [(1, 2), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(1, 2), (9, 1), (15, 1)],
  term ((-443 : Rat) / 42) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(1, 2), (9, 2)],
  term ((-22318926948373961 : Rat) / 52219282713192) [(1, 2), (10, 1)],
  term ((-4706213285 : Rat) / 374718582) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((5 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-73652516242775921 : Rat) / 52219282713192) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363440853829339 : Rat) / 1598549470812) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3305 : Rat) / 126) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5022513854579299 : Rat) / 8703213785532) [(1, 2), (10, 1), (15, 2)],
  term ((1450 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2833148790090667 : Rat) / 3197098941624) [(1, 2), (11, 1), (13, 1)],
  term ((2713821482549767 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((100 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((68198443155553157 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-179097377537666107 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((52484541134402921 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((5636963000954311 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-251773386266831 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((27927884896855 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-14394010195480 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((32070569874741991 : Rat) / 26109641356596) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((1453453219233419 : Rat) / 456728420232) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-24785 : Rat) / 252) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-983603856893543 : Rat) / 228364210116) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((4961 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85480681190419327 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((36120382054880111 : Rat) / 8703213785532) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-163637251427997559 : Rat) / 26109641356596) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-1143433821648613 : Rat) / 399637367703) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((5570 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((83480736672389027 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((320 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3757375036771861 : Rat) / 1598549470812) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((7465 : Rat) / 126) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((318942386779738663 : Rat) / 78328924069788) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-4472 : Rat) / 63) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((747520 : Rat) / 3087) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-32154520438617935 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-608 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((22237246544662757 : Rat) / 6527410339149) [(2, 1), (3, 1), (15, 3)],
  term ((-422 : Rat) / 9) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((1002136091944765 : Rat) / 991505367972) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((163637251427997559 : Rat) / 52219282713192) [(2, 1), (3, 2), (11, 2)],
  term ((3757375036771861 : Rat) / 3197098941624) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-7465 : Rat) / 252) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76736007793104325 : Rat) / 78328924069788) [(2, 1), (3, 2), (14, 1)],
  term ((60172824405945655 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 2)],
  term ((-22237246544662757 : Rat) / 13054820678298) [(2, 1), (3, 2), (15, 2)],
  term ((211 : Rat) / 9) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-17599720496675444 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((680 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14891233931283784 : Rat) / 6527410339149) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((3711969551248916 : Rat) / 6527410339149) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((1514136876960749 : Rat) / 4351606892766) [(2, 1), (6, 1), (14, 1)],
  term ((7643341148224 : Rat) / 26861770943) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((28553591780285 : Rat) / 20234803428) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((13696913240276068 : Rat) / 19582231017447) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((21024049785311879 : Rat) / 6527410339149) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1114169853494231 : Rat) / 799274735406) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((9035 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2973539398952219 : Rat) / 8703213785532) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7604 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23647668758736391 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((7660998914045 : Rat) / 322341251316) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-27849749083850065 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((13733149961268991 : Rat) / 13054820678298) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11531641327674458 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((8787165754409615 : Rat) / 6527410339149) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 1), (7, 2), (14, 1)],
  term ((10861008665 : Rat) / 374718582) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((8525891802025 : Rat) / 20234803428) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1022114293920193 : Rat) / 456728420232) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-503950802056 : Rat) / 562077873) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-443 : Rat) / 21) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2), (14, 1)],
  term ((-4706213285 : Rat) / 187359291) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-73652516242775921 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363440853829339 : Rat) / 799274735406) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3305 : Rat) / 63) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22318926948373961 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1)],
  term ((5022513854579299 : Rat) / 4351606892766) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((2900 : Rat) / 63) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2833148790090667 : Rat) / 1598549470812) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((5427642965099534 : Rat) / 6527410339149) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((200 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-68198443155553157 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-52484541134402921 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1)],
  term ((179097377537666107 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-27927884896855 : Rat) / 20234803428) [(2, 2), (3, 1), (9, 1)],
  term ((251773386266831 : Rat) / 161878427424) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((7197005097740 : Rat) / 5058700857) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-32070569874741991 : Rat) / 52219282713192) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1453453219233419 : Rat) / 913456840464) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((24785 : Rat) / 504) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((983603856893543 : Rat) / 456728420232) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-4961 : Rat) / 126) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((85480681190419327 : Rat) / 156657848139576) [(2, 2), (3, 1), (11, 1)],
  term ((-36120382054880111 : Rat) / 17406427571064) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((1143433821648613 : Rat) / 799274735406) [(2, 2), (3, 1), (13, 1)],
  term ((-83480736672389027 : Rat) / 78328924069788) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-160 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-688640 : Rat) / 3087) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((-2785 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((32154520438617935 : Rat) / 39164462034894) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((304 : Rat) / 63) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((-323530211759069173 : Rat) / 156657848139576) [(2, 2), (3, 1), (15, 1)],
  term ((2236 : Rat) / 63) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(2, 2), (3, 1), (15, 3)],
  term ((19757480070692395 : Rat) / 39164462034894) [(2, 2), (3, 2)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(2, 2), (3, 2), (6, 1)],
  term ((-1002136091944765 : Rat) / 1983010735944) [(2, 2), (3, 2), (10, 1)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(2, 2), (3, 2), (14, 1)],
  term ((-1514136876960749 : Rat) / 8703213785532) [(2, 2), (6, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((8799860248337722 : Rat) / 6527410339149) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((170 : Rat) / 63) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(2, 2), (6, 1), (10, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((7445616965641892 : Rat) / 6527410339149) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((64 : Rat) / 9) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1855984775624458 : Rat) / 6527410339149) [(2, 2), (6, 1), (11, 2)],
  term ((-3821670574112 : Rat) / 26861770943) [(2, 2), (6, 1), (15, 2)],
  term ((-6848456620138034 : Rat) / 19582231017447) [(2, 2), (7, 1), (9, 1)],
  term ((-28553591780285 : Rat) / 40469606856) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((-21024049785311879 : Rat) / 13054820678298) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((1114169853494231 : Rat) / 1598549470812) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-9035 : Rat) / 126) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2973539398952219 : Rat) / 17406427571064) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((3802 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((23647668758736391 : Rat) / 17406427571064) [(2, 2), (7, 1), (11, 1)],
  term ((-7660998914045 : Rat) / 644682502632) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((27849749083850065 : Rat) / 78328924069788) [(2, 2), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((5765820663837229 : Rat) / 6527410339149) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-13733149961268991 : Rat) / 26109641356596) [(2, 2), (7, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 2), (7, 2)],
  term ((-8787165754409615 : Rat) / 13054820678298) [(2, 2), (7, 2), (10, 1)],
  term ((-10861008665 : Rat) / 749437164) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-8525891802025 : Rat) / 40469606856) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1022114293920193 : Rat) / 913456840464) [(2, 2), (9, 1), (11, 1)],
  term ((251975401028 : Rat) / 562077873) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-7819657675 : Rat) / 666166368) [(2, 2), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((786611939080851491 : Rat) / 626631392558304) [(2, 2), (9, 1), (15, 1)],
  term ((443 : Rat) / 42) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(2, 2), (9, 2)],
  term ((22318926948373961 : Rat) / 52219282713192) [(2, 2), (10, 1)],
  term ((4706213285 : Rat) / 374718582) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((73652516242775921 : Rat) / 52219282713192) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((363440853829339 : Rat) / 1598549470812) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((3305 : Rat) / 126) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5022513854579299 : Rat) / 8703213785532) [(2, 2), (10, 1), (15, 2)],
  term ((-1450 : Rat) / 63) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((2833148790090667 : Rat) / 3197098941624) [(2, 2), (11, 1), (13, 1)],
  term ((-2713821482549767 : Rat) / 6527410339149) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-100 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-163637251427997559 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((-3757375036771861 : Rat) / 1598549470812) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((7465 : Rat) / 126) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22237246544662757 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((-422 : Rat) / 9) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-764637496555085 : Rat) / 13054820678298) [(2, 2), (14, 2)],
  term ((163637251427997559 : Rat) / 52219282713192) [(2, 3), (11, 2)],
  term ((3757375036771861 : Rat) / 3197098941624) [(2, 3), (13, 1), (15, 1)],
  term ((-7465 : Rat) / 252) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((764637496555085 : Rat) / 26109641356596) [(2, 3), (14, 1)],
  term ((-22237246544662757 : Rat) / 13054820678298) [(2, 3), (15, 2)],
  term ((211 : Rat) / 9) [(2, 3), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-17599720496675444 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((64 : Rat) / 9) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((680 : Rat) / 63) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-14891233931283784 : Rat) / 6527410339149) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-128 : Rat) / 9) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((3711969551248916 : Rat) / 6527410339149) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((1514136876960749 : Rat) / 4351606892766) [(3, 1), (6, 1), (15, 1)],
  term ((7643341148224 : Rat) / 26861770943) [(3, 1), (6, 1), (15, 3)],
  term ((28553591780285 : Rat) / 20234803428) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((13696913240276068 : Rat) / 19582231017447) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((21024049785311879 : Rat) / 6527410339149) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1114169853494231 : Rat) / 799274735406) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((9035 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2973539398952219 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-7604 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((7660998914045 : Rat) / 322341251316) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-23647668758736391 : Rat) / 8703213785532) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27849749083850065 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11531641327674458 : Rat) / 6527410339149) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((13733149961268991 : Rat) / 13054820678298) [(3, 1), (7, 1), (15, 2)],
  term ((32 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((8787165754409615 : Rat) / 6527410339149) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(3, 1), (7, 2), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8525891802025 : Rat) / 20234803428) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-503950802056 : Rat) / 562077873) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((1022114293920193 : Rat) / 456728420232) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((7819657675 : Rat) / 333083184) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((725 : Rat) / 28) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(3, 1), (9, 1), (15, 2)],
  term ((-443 : Rat) / 21) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(3, 1), (9, 2), (15, 1)],
  term ((-4706213285 : Rat) / 187359291) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((10 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73652516242775921 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363440853829339 : Rat) / 799274735406) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3305 : Rat) / 63) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22318926948373961 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 1)],
  term ((5022513854579299 : Rat) / 4351606892766) [(3, 1), (10, 1), (15, 3)],
  term ((2900 : Rat) / 63) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((5427642965099534 : Rat) / 6527410339149) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((200 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2833148790090667 : Rat) / 1598549470812) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1514136876960749 : Rat) / 8703213785532) [(3, 2), (6, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((8799860248337722 : Rat) / 6527410339149) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-197204140361007167 : Rat) / 39164462034894) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(3, 2), (6, 1), (10, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((90535294052478833 : Rat) / 19582231017447) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((64 : Rat) / 9) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1855984775624458 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (14, 1), (15, 2)],
  term ((-7250016913533151 : Rat) / 13054820678298) [(3, 2), (6, 1), (15, 2)],
  term ((32 : Rat) / 9) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6848456620138034 : Rat) / 19582231017447) [(3, 2), (7, 1), (9, 1)],
  term ((-28553591780285 : Rat) / 40469606856) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-21024049785311879 : Rat) / 13054820678298) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((1114169853494231 : Rat) / 1598549470812) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-9035 : Rat) / 126) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-331432900484762243 : Rat) / 156657848139576) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((3802 : Rat) / 63) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((23647668758736391 : Rat) / 17406427571064) [(3, 2), (7, 1), (11, 1)],
  term ((-7660998914045 : Rat) / 644682502632) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((27849749083850065 : Rat) / 78328924069788) [(3, 2), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((5722868109542923 : Rat) / 4351606892766) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((9109947483571267 : Rat) / 11189846295684) [(3, 2), (7, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(3, 2), (7, 2)],
  term ((-8787165754409615 : Rat) / 13054820678298) [(3, 2), (7, 2), (10, 1)],
  term ((-10861008665 : Rat) / 749437164) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-268825169870881 : Rat) / 80939213712) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1022114293920193 : Rat) / 913456840464) [(3, 2), (9, 1), (11, 1)],
  term ((251975401028 : Rat) / 562077873) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-7819657675 : Rat) / 666166368) [(3, 2), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-7333296658445 : Rat) / 3372467238) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((279594824228051419 : Rat) / 69625710284256) [(3, 2), (9, 1), (15, 1)],
  term ((443 : Rat) / 42) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-97280 : Rat) / 343) [(3, 2), (9, 1), (15, 3)],
  term ((-385847904595639 : Rat) / 23208570094752) [(3, 2), (9, 2)],
  term ((22318926948373961 : Rat) / 52219282713192) [(3, 2), (10, 1)],
  term ((4706213285 : Rat) / 374718582) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((137793655992259903 : Rat) / 52219282713192) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10901054242292611 : Rat) / 3197098941624) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-18175 : Rat) / 252) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95644686901424735 : Rat) / 19582231017447) [(3, 2), (10, 1), (15, 2)],
  term ((3511 : Rat) / 63) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((2833148790090667 : Rat) / 3197098941624) [(3, 2), (11, 1), (13, 1)],
  term ((-2713821482549767 : Rat) / 6527410339149) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-100 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36120382054880111 : Rat) / 8703213785532) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-85480681190419327 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)],
  term ((83480736672389027 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1143433821648613 : Rat) / 399637367703) [(3, 2), (13, 1), (15, 1)],
  term ((5570 : Rat) / 63) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1377280 : Rat) / 3087) [(3, 2), (13, 1), (15, 3)],
  term ((-32154520438617935 : Rat) / 19582231017447) [(3, 2), (14, 1), (15, 2)],
  term ((-608 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (14, 2), (15, 2)],
  term ((323530211759069173 : Rat) / 78328924069788) [(3, 2), (15, 2)],
  term ((-4472 : Rat) / 63) [(3, 2), (15, 2), (16, 1)],
  term ((747520 : Rat) / 3087) [(3, 2), (15, 4)],
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 3), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(3, 3), (6, 1), (9, 1)],
  term ((-68198443155553157 : Rat) / 39164462034894) [(3, 3), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(3, 3), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 3), (6, 1), (14, 1), (15, 1)],
  term ((28773876806361007 : Rat) / 78328924069788) [(3, 3), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-52484541134402921 : Rat) / 78328924069788) [(3, 3), (7, 1)],
  term ((179097377537666107 : Rat) / 156657848139576) [(3, 3), (7, 1), (10, 1)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)],
  term ((-27927884896855 : Rat) / 20234803428) [(3, 3), (9, 1)],
  term ((251773386266831 : Rat) / 161878427424) [(3, 3), (9, 1), (10, 1)],
  term ((7197005097740 : Rat) / 5058700857) [(3, 3), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(3, 3), (9, 1), (15, 2)],
  term ((-32070569874741991 : Rat) / 52219282713192) [(3, 3), (10, 1), (11, 1)],
  term ((-1453453219233419 : Rat) / 913456840464) [(3, 3), (10, 1), (13, 1)],
  term ((24785 : Rat) / 504) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((495713625441758119 : Rat) / 156657848139576) [(3, 3), (10, 1), (15, 1)],
  term ((-4961 : Rat) / 126) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((85480681190419327 : Rat) / 156657848139576) [(3, 3), (11, 1)],
  term ((-36120382054880111 : Rat) / 17406427571064) [(3, 3), (11, 1), (14, 1)],
  term ((1143433821648613 : Rat) / 799274735406) [(3, 3), (13, 1)],
  term ((-83480736672389027 : Rat) / 78328924069788) [(3, 3), (13, 1), (14, 1)],
  term ((-160 : Rat) / 63) [(3, 3), (13, 1), (14, 1), (16, 1)],
  term ((-688640 : Rat) / 3087) [(3, 3), (13, 1), (15, 2)],
  term ((-2785 : Rat) / 63) [(3, 3), (13, 1), (16, 1)],
  term ((15387890807427265 : Rat) / 6527410339149) [(3, 3), (14, 1), (15, 1)],
  term ((304 : Rat) / 63) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (14, 2), (15, 1)],
  term ((-160530017441536111 : Rat) / 52219282713192) [(3, 3), (15, 1)],
  term ((2236 : Rat) / 63) [(3, 3), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 3), (15, 3)],
  term ((19757480070692395 : Rat) / 39164462034894) [(3, 4)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 4), (6, 1)],
  term ((-1002136091944765 : Rat) / 1983010735944) [(3, 4), (10, 1)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_29_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_29_0100_0199
      rs_R009_ueqv_R009YNNNN_block_29_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
