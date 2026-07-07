/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 18:100-143

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(6, 1)],
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0100 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1)]
]

/-- Partial product 100 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0100 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (7, 1), (11, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (10, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0100
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0101 : Poly :=
[
  term ((-29111795873371 : Rat) / 107447083772) [(6, 1)]
]

/-- Partial product 101 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0101 : Poly :=
[
  term ((-29111795873371 : Rat) / 107447083772) [(6, 1)],
  term ((-29111795873371 : Rat) / 53723541886) [(6, 1), (7, 1), (11, 1)],
  term ((29111795873371 : Rat) / 107447083772) [(6, 1), (10, 2)],
  term ((29111795873371 : Rat) / 107447083772) [(6, 1), (11, 2)],
  term ((29111795873371 : Rat) / 53723541886) [(6, 2)],
  term ((-29111795873371 : Rat) / 53723541886) [(6, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0101
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0102 : Poly :=
[
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 102 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0102 : Poly :=
[
  term ((691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 3)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (11, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0102
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0103 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 103 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0103 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 3)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0103
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0104 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 104 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0104 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(6, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(6, 1), (11, 3), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0104
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0105 : Poly :=
[
  term ((85 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0105 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0105
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0106 : Poly :=
[
  term ((-20283918945798503 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 106 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0106 : Poly :=
[
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(6, 1), (11, 3), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0106
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0107 : Poly :=
[
  term ((-16 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0107 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0107
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0108 : Poly :=
[
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (11, 2)]
]

/-- Partial product 108 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0108 : Poly :=
[
  term ((1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (11, 3)],
  term ((-948134543867143 : Rat) / 932487191307) [(6, 1), (10, 2), (11, 2)],
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (11, 2)],
  term ((-948134543867143 : Rat) / 932487191307) [(6, 1), (11, 4)],
  term ((1896269087734286 : Rat) / 932487191307) [(6, 2), (10, 1), (11, 2)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0108
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0109 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1)]
]

/-- Partial product 109 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0109 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (11, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0109
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0110 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 110 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0110 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 3)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0110
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0111 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 111 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0111 : Poly :=
[
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (14, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0111
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0112 : Poly :=
[
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 112 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0112 : Poly :=
[
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0112
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0113 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 113 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0113 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 3), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0113
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0114 : Poly :=
[
  term ((85 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0114 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0114
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0115 : Poly :=
[
  term ((-20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 115 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0115 : Poly :=
[
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 3), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0115
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0116 : Poly :=
[
  term ((-16 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0116 : Poly :=
[
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0116
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0117 : Poly :=
[
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (11, 1)]
]

/-- Partial product 117 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0117 : Poly :=
[
  term ((1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (11, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 2), (11, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (11, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (11, 3)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0117
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0118 : Poly :=
[
  term ((7027677219610319 : Rat) / 39164462034894) [(7, 1), (13, 1)]
]

/-- Partial product 118 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0118 : Poly :=
[
  term ((7027677219610319 : Rat) / 19582231017447) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-7027677219610319 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1)],
  term ((-7027677219610319 : Rat) / 39164462034894) [(7, 1), (10, 2), (13, 1)],
  term ((-7027677219610319 : Rat) / 39164462034894) [(7, 1), (11, 2), (13, 1)],
  term ((7027677219610319 : Rat) / 39164462034894) [(7, 1), (13, 1)],
  term ((7027677219610319 : Rat) / 19582231017447) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0118
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0119 : Poly :=
[
  term ((85 : Rat) / 63) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0119 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(7, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0119
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0120 : Poly :=
[
  term ((-6770572345530509 : Rat) / 6527410339149) [(7, 1), (15, 1)]
]

/-- Partial product 120 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0120 : Poly :=
[
  term ((-13541144691061018 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((13541144691061018 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 1)],
  term ((6770572345530509 : Rat) / 6527410339149) [(7, 1), (10, 2), (15, 1)],
  term ((6770572345530509 : Rat) / 6527410339149) [(7, 1), (11, 2), (15, 1)],
  term ((-6770572345530509 : Rat) / 6527410339149) [(7, 1), (15, 1)],
  term ((-13541144691061018 : Rat) / 6527410339149) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0120
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0121 : Poly :=
[
  term ((-16 : Rat) / 9) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0121 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0121
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0122 : Poly :=
[
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2)]
]

/-- Partial product 122 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0122 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (11, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0122
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0123 : Poly :=
[
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1)]
]

/-- Partial product 123 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0123 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 2)],
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1), (11, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 3)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0123
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0124 : Poly :=
[
  term ((44388 : Rat) / 79) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 124 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0124 : Poly :=
[
  term ((88776 : Rat) / 79) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((88776 : Rat) / 79) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((-44388 : Rat) / 79) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((44388 : Rat) / 79) [(9, 1), (11, 1), (14, 1)],
  term ((-44388 : Rat) / 79) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0124
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0125 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(9, 1), (13, 1)]
]

/-- Partial product 125 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0125 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (13, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (10, 2), (13, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (11, 2), (13, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0125
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0126 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 126 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0126 : Poly :=
[
  term ((941242657 : Rat) / 41635398) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((941242657 : Rat) / 41635398) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 83270796) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 83270796) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((941242657 : Rat) / 83270796) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0126
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0127 : Poly :=
[
  term ((725 : Rat) / 42) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 127 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0127 : Poly :=
[
  term ((725 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 42) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0127
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0128 : Poly :=
[
  term ((-282061132319075 : Rat) / 2901071261844) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 128 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0128 : Poly :=
[
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0128
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0129 : Poly :=
[
  term ((-314 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0129 : Poly :=
[
  term ((-628 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0129
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0130 : Poly :=
[
  term ((-41271832927 : Rat) / 80296839) [(9, 1), (15, 1)]
]

/-- Partial product 130 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0130 : Poly :=
[
  term ((-82543665854 : Rat) / 80296839) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((82543665854 : Rat) / 80296839) [(6, 1), (9, 1), (15, 1)],
  term ((-82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((41271832927 : Rat) / 80296839) [(9, 1), (10, 2), (15, 1)],
  term ((41271832927 : Rat) / 80296839) [(9, 1), (11, 2), (15, 1)],
  term ((-41271832927 : Rat) / 80296839) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0130
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0131 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (14, 1)]
]

/-- Partial product 131 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0131 : Poly :=
[
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (14, 1)],
  term ((-2172201733 : Rat) / 83270796) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 2), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (11, 2), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0131
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0132 : Poly :=
[
  term ((-1005180329591 : Rat) / 29602767978) [(10, 1), (14, 1)]
]

/-- Partial product 132 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0132 : Poly :=
[
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(6, 1), (10, 2), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(10, 1), (11, 2), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0132
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0133 : Poly :=
[
  term ((-3445707804341129 : Rat) / 13054820678298) [(11, 1), (13, 1)]
]

/-- Partial product 133 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0133 : Poly :=
[
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 1), (13, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(7, 1), (11, 2), (13, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(10, 2), (11, 1), (13, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(11, 1), (13, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0133
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0134 : Poly :=
[
  term ((-1774654659347555 : Rat) / 2901071261844) [(11, 1), (15, 1)]
]

/-- Partial product 134 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0134 : Poly :=
[
  term ((-1774654659347555 : Rat) / 1450535630922) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((1774654659347555 : Rat) / 1450535630922) [(6, 1), (11, 1), (15, 1)],
  term ((-1774654659347555 : Rat) / 1450535630922) [(7, 1), (11, 2), (15, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(10, 2), (11, 1), (15, 1)],
  term ((-1774654659347555 : Rat) / 2901071261844) [(11, 1), (15, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0134
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0135 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 135 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0135 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0135
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0136 : Poly :=
[
  term ((41272138845249325 : Rat) / 52219282713192) [(13, 1), (15, 1)]
]

/-- Partial product 136 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0136 : Poly :=
[
  term ((41272138845249325 : Rat) / 26109641356596) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 26109641356596) [(6, 1), (13, 1), (15, 1)],
  term ((41272138845249325 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 52219282713192) [(10, 2), (13, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 52219282713192) [(11, 2), (13, 1), (15, 1)],
  term ((41272138845249325 : Rat) / 52219282713192) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0136
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0137 : Poly :=
[
  term ((-2648 : Rat) / 63) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0137 : Poly :=
[
  term ((-5296 : Rat) / 63) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5296 : Rat) / 63) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5296 : Rat) / 63) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2648 : Rat) / 63) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2648 : Rat) / 63) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2648 : Rat) / 63) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0137
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0138 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(13, 2)]
]

/-- Partial product 138 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0138 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (10, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (11, 1), (13, 2)],
  term ((280381883026811 : Rat) / 799274735406) [(10, 2), (13, 2)],
  term ((280381883026811 : Rat) / 799274735406) [(11, 2), (13, 2)],
  term ((-280381883026811 : Rat) / 799274735406) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0138
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0139 : Poly :=
[
  term ((-85 : Rat) / 63) [(13, 2), (16, 1)]
]

/-- Partial product 139 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0139 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((85 : Rat) / 63) [(10, 2), (13, 2), (16, 1)],
  term ((85 : Rat) / 63) [(11, 2), (13, 2), (16, 1)],
  term ((-85 : Rat) / 63) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0139
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0140 : Poly :=
[
  term ((439931708961365 : Rat) / 1243316255076) [(14, 1)]
]

/-- Partial product 140 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0140 : Poly :=
[
  term ((439931708961365 : Rat) / 621658127538) [(6, 1), (10, 1), (14, 1)],
  term ((-439931708961365 : Rat) / 621658127538) [(6, 1), (14, 1)],
  term ((439931708961365 : Rat) / 621658127538) [(7, 1), (11, 1), (14, 1)],
  term ((-439931708961365 : Rat) / 1243316255076) [(10, 2), (14, 1)],
  term ((-439931708961365 : Rat) / 1243316255076) [(11, 2), (14, 1)],
  term ((439931708961365 : Rat) / 1243316255076) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0140
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0141 : Poly :=
[
  term ((-655143079659727 : Rat) / 11604285047376) [(14, 2)]
]

/-- Partial product 141 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0141 : Poly :=
[
  term ((-655143079659727 : Rat) / 5802142523688) [(6, 1), (10, 1), (14, 2)],
  term ((655143079659727 : Rat) / 5802142523688) [(6, 1), (14, 2)],
  term ((-655143079659727 : Rat) / 5802142523688) [(7, 1), (11, 1), (14, 2)],
  term ((655143079659727 : Rat) / 11604285047376) [(10, 2), (14, 2)],
  term ((655143079659727 : Rat) / 11604285047376) [(11, 2), (14, 2)],
  term ((-655143079659727 : Rat) / 11604285047376) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0141
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0142 : Poly :=
[
  term ((-70597997569817 : Rat) / 552585002256) [(15, 2)]
]

/-- Partial product 142 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0142 : Poly :=
[
  term ((-70597997569817 : Rat) / 276292501128) [(6, 1), (10, 1), (15, 2)],
  term ((70597997569817 : Rat) / 276292501128) [(6, 1), (15, 2)],
  term ((-70597997569817 : Rat) / 276292501128) [(7, 1), (11, 1), (15, 2)],
  term ((70597997569817 : Rat) / 552585002256) [(10, 2), (15, 2)],
  term ((70597997569817 : Rat) / 552585002256) [(11, 2), (15, 2)],
  term ((-70597997569817 : Rat) / 552585002256) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0142
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009YNNNN_coefficient_18_0143 : Poly :=
[
  term ((772 : Rat) / 21) [(15, 2), (16, 1)]
]

/-- Partial product 143 for generator 18. -/
def rs_R009_ueqv_R009YNNNN_partial_18_0143 : Poly :=
[
  term ((1544 : Rat) / 21) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1544 : Rat) / 21) [(6, 1), (15, 2), (16, 1)],
  term ((1544 : Rat) / 21) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-772 : Rat) / 21) [(10, 2), (15, 2), (16, 1)],
  term ((-772 : Rat) / 21) [(11, 2), (15, 2), (16, 1)],
  term ((772 : Rat) / 21) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 18. -/
theorem rs_R009_ueqv_R009YNNNN_partial_18_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_18_0143
        rs_R009_ueqv_R009YNNNN_generator_18_0100_0143 =
      rs_R009_ueqv_R009YNNNN_partial_18_0143 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_18_0100_0143 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_18_0100,
  rs_R009_ueqv_R009YNNNN_partial_18_0101,
  rs_R009_ueqv_R009YNNNN_partial_18_0102,
  rs_R009_ueqv_R009YNNNN_partial_18_0103,
  rs_R009_ueqv_R009YNNNN_partial_18_0104,
  rs_R009_ueqv_R009YNNNN_partial_18_0105,
  rs_R009_ueqv_R009YNNNN_partial_18_0106,
  rs_R009_ueqv_R009YNNNN_partial_18_0107,
  rs_R009_ueqv_R009YNNNN_partial_18_0108,
  rs_R009_ueqv_R009YNNNN_partial_18_0109,
  rs_R009_ueqv_R009YNNNN_partial_18_0110,
  rs_R009_ueqv_R009YNNNN_partial_18_0111,
  rs_R009_ueqv_R009YNNNN_partial_18_0112,
  rs_R009_ueqv_R009YNNNN_partial_18_0113,
  rs_R009_ueqv_R009YNNNN_partial_18_0114,
  rs_R009_ueqv_R009YNNNN_partial_18_0115,
  rs_R009_ueqv_R009YNNNN_partial_18_0116,
  rs_R009_ueqv_R009YNNNN_partial_18_0117,
  rs_R009_ueqv_R009YNNNN_partial_18_0118,
  rs_R009_ueqv_R009YNNNN_partial_18_0119,
  rs_R009_ueqv_R009YNNNN_partial_18_0120,
  rs_R009_ueqv_R009YNNNN_partial_18_0121,
  rs_R009_ueqv_R009YNNNN_partial_18_0122,
  rs_R009_ueqv_R009YNNNN_partial_18_0123,
  rs_R009_ueqv_R009YNNNN_partial_18_0124,
  rs_R009_ueqv_R009YNNNN_partial_18_0125,
  rs_R009_ueqv_R009YNNNN_partial_18_0126,
  rs_R009_ueqv_R009YNNNN_partial_18_0127,
  rs_R009_ueqv_R009YNNNN_partial_18_0128,
  rs_R009_ueqv_R009YNNNN_partial_18_0129,
  rs_R009_ueqv_R009YNNNN_partial_18_0130,
  rs_R009_ueqv_R009YNNNN_partial_18_0131,
  rs_R009_ueqv_R009YNNNN_partial_18_0132,
  rs_R009_ueqv_R009YNNNN_partial_18_0133,
  rs_R009_ueqv_R009YNNNN_partial_18_0134,
  rs_R009_ueqv_R009YNNNN_partial_18_0135,
  rs_R009_ueqv_R009YNNNN_partial_18_0136,
  rs_R009_ueqv_R009YNNNN_partial_18_0137,
  rs_R009_ueqv_R009YNNNN_partial_18_0138,
  rs_R009_ueqv_R009YNNNN_partial_18_0139,
  rs_R009_ueqv_R009YNNNN_partial_18_0140,
  rs_R009_ueqv_R009YNNNN_partial_18_0141,
  rs_R009_ueqv_R009YNNNN_partial_18_0142,
  rs_R009_ueqv_R009YNNNN_partial_18_0143
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_18_0100_0143 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (7, 1), (11, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (10, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (11, 2)],
  term ((-29111795873371 : Rat) / 107447083772) [(6, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-755374492924837 : Rat) / 1450535630922) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((640508611073633 : Rat) / 266424911802) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-19229544169918585 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((640508611073633 : Rat) / 266424911802) [(6, 1), (7, 1), (11, 3)],
  term ((-7027677219610319 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((13541144691061018 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (11, 2)],
  term ((88776 : Rat) / 79) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((941242657 : Rat) / 41635398) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82543665854 : Rat) / 80296839) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 1)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 3)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (13, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((82543665854 : Rat) / 80296839) [(6, 1), (9, 1), (15, 1)],
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (14, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1774654659347555 : Rat) / 1450535630922) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((41272138845249325 : Rat) / 26109641356596) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5296 : Rat) / 63) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (10, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((482149282804187 : Rat) / 621658127538) [(6, 1), (10, 1), (14, 1)],
  term ((-655143079659727 : Rat) / 5802142523688) [(6, 1), (10, 1), (14, 2)],
  term ((-70597997569817 : Rat) / 276292501128) [(6, 1), (10, 1), (15, 2)],
  term ((1544 : Rat) / 21) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((29111795873371 : Rat) / 107447083772) [(6, 1), (10, 2)],
  term ((-280381883026811 : Rat) / 799274735406) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((16 : Rat) / 9) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(6, 1), (10, 2), (11, 2)],
  term ((-1005180329591 : Rat) / 14801383989) [(6, 1), (10, 2), (14, 1)],
  term ((34412959094360513 : Rat) / 39164462034894) [(6, 1), (11, 1), (13, 1)],
  term ((85 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((11659864922457487 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((33621933625509157 : Rat) / 26109641356596) [(6, 1), (11, 2)],
  term ((-280381883026811 : Rat) / 799274735406) [(6, 1), (11, 3), (13, 1)],
  term ((-85 : Rat) / 63) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(6, 1), (11, 3), (15, 1)],
  term ((16 : Rat) / 9) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(6, 1), (11, 4)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 26109641356596) [(6, 1), (13, 1), (15, 1)],
  term ((5296 : Rat) / 63) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)],
  term ((-439931708961365 : Rat) / 621658127538) [(6, 1), (14, 1)],
  term ((655143079659727 : Rat) / 5802142523688) [(6, 1), (14, 2)],
  term ((70597997569817 : Rat) / 276292501128) [(6, 1), (15, 2)],
  term ((-1544 : Rat) / 21) [(6, 1), (15, 2), (16, 1)],
  term ((29111795873371 : Rat) / 53723541886) [(6, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 2), (7, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 2), (9, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 53723541886) [(6, 2), (10, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(6, 2), (10, 1), (11, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 2), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 2), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 2), (11, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 3)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((941242657 : Rat) / 41635398) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (11, 2)],
  term ((89025290491967 : Rat) / 80585312829) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (14, 1)],
  term ((-2172201733 : Rat) / 83270796) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (13, 1)],
  term ((85 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 2), (11, 1)],
  term ((-7027677219610319 : Rat) / 39164462034894) [(7, 1), (10, 2), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((6770572345530509 : Rat) / 6527410339149) [(7, 1), (10, 2), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 3), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 26109641356596) [(7, 1), (10, 3), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (11, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((41272138845249325 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5296 : Rat) / 63) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (11, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((439931708961365 : Rat) / 621658127538) [(7, 1), (11, 1), (14, 1)],
  term ((-655143079659727 : Rat) / 5802142523688) [(7, 1), (11, 1), (14, 2)],
  term ((-70597997569817 : Rat) / 276292501128) [(7, 1), (11, 1), (15, 2)],
  term ((1544 : Rat) / 21) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27701924045657093 : Rat) / 39164462034894) [(7, 1), (11, 2), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2430747243066977 : Rat) / 13054820678298) [(7, 1), (11, 2), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (11, 3)],
  term ((7027677219610319 : Rat) / 39164462034894) [(7, 1), (13, 1)],
  term ((85 : Rat) / 63) [(7, 1), (13, 1), (16, 1)],
  term ((-6770572345530509 : Rat) / 6527410339149) [(7, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 2), (9, 1), (11, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((640508611073633 : Rat) / 266424911802) [(7, 2), (10, 1), (11, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 3)],
  term ((7027677219610319 : Rat) / 19582231017447) [(7, 2), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-13541144691061018 : Rat) / 6527410339149) [(7, 2), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((640508611073633 : Rat) / 266424911802) [(7, 2), (11, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 3), (10, 1), (11, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 3), (11, 1)],
  term ((-44388 : Rat) / 79) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (10, 2), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((41271832927 : Rat) / 80296839) [(9, 1), (10, 2), (15, 1)],
  term ((44388 : Rat) / 79) [(9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (11, 2), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((41271832927 : Rat) / 80296839) [(9, 1), (11, 2), (15, 1)],
  term ((-44388 : Rat) / 79) [(9, 1), (11, 3), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(9, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(9, 1), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41271832927 : Rat) / 80296839) [(9, 1), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 2), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (11, 2), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(10, 1), (11, 2), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(10, 1), (14, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(10, 2), (11, 1), (13, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(10, 2), (11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 52219282713192) [(10, 2), (13, 1), (15, 1)],
  term ((2648 : Rat) / 63) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(10, 2), (13, 2)],
  term ((85 : Rat) / 63) [(10, 2), (13, 2), (16, 1)],
  term ((-439931708961365 : Rat) / 1243316255076) [(10, 2), (14, 1)],
  term ((655143079659727 : Rat) / 11604285047376) [(10, 2), (14, 2)],
  term ((70597997569817 : Rat) / 552585002256) [(10, 2), (15, 2)],
  term ((-772 : Rat) / 21) [(10, 2), (15, 2), (16, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(10, 3), (14, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(11, 1), (13, 1)],
  term ((-1774654659347555 : Rat) / 2901071261844) [(11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-41272138845249325 : Rat) / 52219282713192) [(11, 2), (13, 1), (15, 1)],
  term ((2648 : Rat) / 63) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(11, 2), (13, 2)],
  term ((85 : Rat) / 63) [(11, 2), (13, 2), (16, 1)],
  term ((-439931708961365 : Rat) / 1243316255076) [(11, 2), (14, 1)],
  term ((655143079659727 : Rat) / 11604285047376) [(11, 2), (14, 2)],
  term ((70597997569817 : Rat) / 552585002256) [(11, 2), (15, 2)],
  term ((-772 : Rat) / 21) [(11, 2), (15, 2), (16, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(11, 3), (13, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(11, 3), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 1)],
  term ((41272138845249325 : Rat) / 52219282713192) [(13, 1), (15, 1)],
  term ((-2648 : Rat) / 63) [(13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(13, 2)],
  term ((-85 : Rat) / 63) [(13, 2), (16, 1)],
  term ((439931708961365 : Rat) / 1243316255076) [(14, 1)],
  term ((-655143079659727 : Rat) / 11604285047376) [(14, 2)],
  term ((-70597997569817 : Rat) / 552585002256) [(15, 2)],
  term ((772 : Rat) / 21) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 100 through 143. -/
theorem rs_R009_ueqv_R009YNNNN_block_18_0100_0143_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_18_0100_0143
      rs_R009_ueqv_R009YNNNN_block_18_0100_0143 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
