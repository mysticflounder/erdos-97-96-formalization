/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 12:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0100 : Poly :=
[
  term ((-589 : Rat) / 252) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0100 : Poly :=
[
  term ((-589 : Rat) / 126) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((589 : Rat) / 252) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-589 : Rat) / 252) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((589 : Rat) / 252) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-589 : Rat) / 126) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((589 : Rat) / 126) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0100
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0101 : Poly :=
[
  term ((2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2)]
]

/-- Partial product 101 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0101 : Poly :=
[
  term ((2661412996751609 : Rat) / 330501789324) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2)],
  term ((-2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2), (14, 2)],
  term ((-2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2), (15, 2)],
  term ((-2661412996751609 : Rat) / 330501789324) [(2, 2), (11, 2)],
  term ((2661412996751609 : Rat) / 330501789324) [(2, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0101
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0102 : Poly :=
[
  term ((3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0102 : Poly :=
[
  term ((3917988683762341 : Rat) / 1598549470812) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 1)],
  term ((-3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 3)],
  term ((3917988683762341 : Rat) / 1598549470812) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3917988683762341 : Rat) / 1598549470812) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0102
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0103 : Poly :=
[
  term ((-8185 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0103 : Poly :=
[
  term ((-8185 : Rat) / 126) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8185 : Rat) / 252) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8185 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((8185 : Rat) / 252) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8185 : Rat) / 126) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8185 : Rat) / 126) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0103
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0104 : Poly :=
[
  term ((897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0104 : Poly :=
[
  term ((897257897096525 : Rat) / 13054820678298) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 1)],
  term ((-897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 1), (15, 2)],
  term ((-897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 3)],
  term ((-897257897096525 : Rat) / 13054820678298) [(2, 2), (14, 1)],
  term ((897257897096525 : Rat) / 13054820678298) [(2, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0104
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0105 : Poly :=
[
  term ((-22786380941854277 : Rat) / 13054820678298) [(2, 1), (15, 2)]
]

/-- Partial product 105 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0105 : Poly :=
[
  term ((-22786380941854277 : Rat) / 6527410339149) [(2, 1), (3, 1), (15, 3)],
  term ((22786380941854277 : Rat) / 13054820678298) [(2, 1), (14, 2), (15, 2)],
  term ((-22786380941854277 : Rat) / 13054820678298) [(2, 1), (15, 2)],
  term ((22786380941854277 : Rat) / 13054820678298) [(2, 1), (15, 4)],
  term ((-22786380941854277 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((22786380941854277 : Rat) / 6527410339149) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0105
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0106 : Poly :=
[
  term ((1621 : Rat) / 63) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0106 : Poly :=
[
  term ((3242 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1621 : Rat) / 63) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((1621 : Rat) / 63) [(2, 1), (15, 2), (16, 1)],
  term ((-1621 : Rat) / 63) [(2, 1), (15, 4), (16, 1)],
  term ((3242 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3242 : Rat) / 63) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0106
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0107 : Poly :=
[
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0107 : Poly :=
[
  term ((-68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((68176191761805829 : Rat) / 19582231017447) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0107
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0108 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 108 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0108 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0108
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0109 : Poly :=
[
  term ((-3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0109 : Poly :=
[
  term ((3705500319602759 : Rat) / 1864974382614) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-3705500319602759 : Rat) / 1864974382614) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1)],
  term ((3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-3705500319602759 : Rat) / 1864974382614) [(3, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0109
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0110 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0110 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0110
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0111 : Poly :=
[
  term ((85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0111 : Poly :=
[
  term ((170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0111
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0112 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0112 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0112
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0113 : Poly :=
[
  term ((7250016913533151 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0113 : Poly :=
[
  term ((7250016913533151 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-7250016913533151 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-7250016913533151 : Rat) / 26109641356596) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((7250016913533151 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)],
  term ((-7250016913533151 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 3)],
  term ((7250016913533151 : Rat) / 13054820678298) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0113
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0114 : Poly :=
[
  term ((-16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0114 : Poly :=
[
  term ((-32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0114
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0115 : Poly :=
[
  term ((-7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1)]
]

/-- Partial product 115 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0115 : Poly :=
[
  term ((14850217784373310 : Rat) / 2797461573921) [(2, 1), (3, 1), (7, 1)],
  term ((-14850217784373310 : Rat) / 2797461573921) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1)],
  term ((7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1), (14, 2)],
  term ((7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1), (15, 2)],
  term ((-14850217784373310 : Rat) / 2797461573921) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0115
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0116 : Poly :=
[
  term ((20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 116 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0116 : Poly :=
[
  term ((-20506829912648953 : Rat) / 11189846295684) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((20506829912648953 : Rat) / 11189846295684) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1)],
  term ((-20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((-20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((20506829912648953 : Rat) / 11189846295684) [(3, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0116
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0117 : Poly :=
[
  term ((-5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 117 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0117 : Poly :=
[
  term ((5636963000954311 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)],
  term ((5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 3)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0117
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0118 : Poly :=
[
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (9, 1)]
]

/-- Partial product 118 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0118 : Poly :=
[
  term ((1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (9, 1)],
  term ((-1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (9, 1)],
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1), (14, 2)],
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1), (15, 2)],
  term ((-1928667517360 : Rat) / 562077873) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0118
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0119 : Poly :=
[
  term ((174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 119 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0119 : Poly :=
[
  term ((-174138896329411 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((174138896329411 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1)],
  term ((-174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((174138896329411 : Rat) / 53959475808) [(3, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0119
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0120 : Poly :=
[
  term ((6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 120 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0120 : Poly :=
[
  term ((-13807515727570 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((13807515727570 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1)],
  term ((-6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 3)],
  term ((13807515727570 : Rat) / 5058700857) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0120
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0121 : Poly :=
[
  term ((48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 121 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0121 : Poly :=
[
  term ((97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 4)],
  term ((97280 : Rat) / 343) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0121
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0122 : Poly :=
[
  term ((-240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 122 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0122 : Poly :=
[
  term ((240134386974757117 : Rat) / 78328924069788) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-240134386974757117 : Rat) / 78328924069788) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1)],
  term ((240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-240134386974757117 : Rat) / 78328924069788) [(3, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0122
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0123 : Poly :=
[
  term ((-7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 123 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0123 : Poly :=
[
  term ((7083467755020073 : Rat) / 2131399294416) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-7083467755020073 : Rat) / 2131399294416) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1)],
  term ((7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7083467755020073 : Rat) / 2131399294416) [(3, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0123
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0124 : Poly :=
[
  term ((12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0124 : Poly :=
[
  term ((12445 : Rat) / 168) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12445 : Rat) / 168) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((12445 : Rat) / 168) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0124
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0125 : Poly :=
[
  term ((181176122455641613 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 125 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0125 : Poly :=
[
  term ((181176122455641613 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-181176122455641613 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-181176122455641613 : Rat) / 78328924069788) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((181176122455641613 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 1)],
  term ((-181176122455641613 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 3)],
  term ((181176122455641613 : Rat) / 39164462034894) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0125
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0126 : Poly :=
[
  term ((-2413 : Rat) / 84) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0126 : Poly :=
[
  term ((-2413 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2413 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2413 : Rat) / 84) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2413 : Rat) / 84) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2413 : Rat) / 84) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-2413 : Rat) / 42) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0126
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0127 : Poly :=
[
  term ((105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1)]
]

/-- Partial product 127 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0127 : Poly :=
[
  term ((-105965674040266171 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1)],
  term ((105965674040266171 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((-105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 2)],
  term ((-105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1), (15, 2)],
  term ((105965674040266171 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0127
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0128 : Poly :=
[
  term ((-164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 128 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0128 : Poly :=
[
  term ((164378049209344079 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-164378049209344079 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1)],
  term ((164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 3)],
  term ((-164378049209344079 : Rat) / 78328924069788) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0128
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0129 : Poly :=
[
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)]
]

/-- Partial product 129 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0129 : Poly :=
[
  term ((-158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (13, 1)],
  term ((158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)],
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1), (14, 2)],
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1), (15, 2)],
  term ((158201744963936 : Rat) / 44404151967) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0129
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0130 : Poly :=
[
  term ((-79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 130 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0130 : Poly :=
[
  term ((79545702321122267 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-79545702321122267 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)],
  term ((79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 3)],
  term ((-79545702321122267 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0130
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0131 : Poly :=
[
  term ((-340 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0131 : Poly :=
[
  term ((680 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((340 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-680 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0131
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0132 : Poly :=
[
  term ((-688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 132 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0132 : Poly :=
[
  term ((-1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 4)],
  term ((-1377280 : Rat) / 3087) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0132
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0133 : Poly :=
[
  term ((-300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0133 : Poly :=
[
  term ((-600 : Rat) / 7) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((600 : Rat) / 7) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0133
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0134 : Poly :=
[
  term ((30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0134 : Poly :=
[
  term ((-30507117247043375 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((30507117247043375 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 1)],
  term ((-30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 3)],
  term ((-30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 3), (15, 1)],
  term ((30507117247043375 : Rat) / 19582231017447) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0134
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0135 : Poly :=
[
  term ((64 : Rat) / 9) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0135 : Poly :=
[
  term ((-128 : Rat) / 9) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0135
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0136 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 136 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0136 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (14, 2), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (14, 4), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0136
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0137 : Poly :=
[
  term ((-470046679354834153 : Rat) / 156657848139576) [(3, 1), (15, 1)]
]

/-- Partial product 137 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0137 : Poly :=
[
  term ((-470046679354834153 : Rat) / 78328924069788) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((470046679354834153 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)],
  term ((470046679354834153 : Rat) / 156657848139576) [(3, 1), (14, 2), (15, 1)],
  term ((-470046679354834153 : Rat) / 156657848139576) [(3, 1), (15, 1)],
  term ((470046679354834153 : Rat) / 156657848139576) [(3, 1), (15, 3)],
  term ((-470046679354834153 : Rat) / 78328924069788) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0137
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0138 : Poly :=
[
  term ((236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0138 : Poly :=
[
  term ((472 : Rat) / 7) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-472 : Rat) / 7) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (15, 3), (16, 1)],
  term ((472 : Rat) / 7) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0138
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0139 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 139 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0139 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(2, 1), (3, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (14, 2), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (15, 5)],
  term ((-747520 : Rat) / 3087) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0139
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0140 : Poly :=
[
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2)]
]

/-- Partial product 140 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0140 : Poly :=
[
  term ((-4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2)],
  term ((4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2), (14, 1)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (14, 2)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (15, 2)],
  term ((4342565158683470 : Rat) / 2175803446383) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0140
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0141 : Poly :=
[
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)]
]

/-- Partial product 141 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0141 : Poly :=
[
  term ((6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)],
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1), (14, 2)],
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1), (15, 2)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0141
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0142 : Poly :=
[
  term ((-1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1)]
]

/-- Partial product 142 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0142 : Poly :=
[
  term ((1146535131447565 : Rat) / 2901071261844) [(2, 1), (3, 2), (10, 1)],
  term ((-1146535131447565 : Rat) / 2901071261844) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1)],
  term ((1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1), (14, 2)],
  term ((1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1), (15, 2)],
  term ((-1146535131447565 : Rat) / 2901071261844) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0142
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0143 : Poly :=
[
  term ((-60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 1)]
]

/-- Partial product 143 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0143 : Poly :=
[
  term ((60172824405945655 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 2)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 1)],
  term ((60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 1), (15, 2)],
  term ((60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 3)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0143
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0144 : Poly :=
[
  term ((-315330978199316 : Rat) / 2175803446383) [(6, 1)]
]

/-- Partial product 144 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0144 : Poly :=
[
  term ((630661956398632 : Rat) / 2175803446383) [(2, 1), (6, 1)],
  term ((-630661956398632 : Rat) / 2175803446383) [(2, 1), (6, 1), (14, 1)],
  term ((-630661956398632 : Rat) / 2175803446383) [(3, 1), (6, 1), (15, 1)],
  term ((-315330978199316 : Rat) / 2175803446383) [(6, 1)],
  term ((315330978199316 : Rat) / 2175803446383) [(6, 1), (14, 2)],
  term ((315330978199316 : Rat) / 2175803446383) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0144
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0145 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 145 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0145 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0145
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0146 : Poly :=
[
  term ((19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 146 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0146 : Poly :=
[
  term ((-19473600831050851 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((19473600831050851 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((19473600831050851 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1)],
  term ((-19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0146
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0147 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 147 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0147 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0147
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0148 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0148 : Poly :=
[
  term ((340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0148
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0149 : Poly :=
[
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 149 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0149 : Poly :=
[
  term ((-20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0149
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0150 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0150 : Poly :=
[
  term ((-64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0150
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0151 : Poly :=
[
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)]
]

/-- Partial product 151 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0151 : Poly :=
[
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2), (14, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (14, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0151
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0152 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)]
]

/-- Partial product 152 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0152 : Poly :=
[
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1), (14, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0152
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0153 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 153 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0153 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0153
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0154 : Poly :=
[
  term ((-1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 154 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0154 : Poly :=
[
  term ((-1846300738284845 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1846300738284845 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1846300738284845 : Rat) / 1450535630922) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (15, 1)],
  term ((1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0154
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0155 : Poly :=
[
  term ((2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2)]
]

/-- Partial product 155 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0155 : Poly :=
[
  term ((-2346691639880863 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 2)],
  term ((2346691639880863 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((2346691639880863 : Rat) / 1450535630922) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2)],
  term ((-2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2), (14, 2)],
  term ((-2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0155
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0156 : Poly :=
[
  term ((46720 : Rat) / 3087) [(6, 1), (14, 1)]
]

/-- Partial product 156 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0156 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(2, 1), (6, 1), (14, 1)],
  term ((93440 : Rat) / 3087) [(2, 1), (6, 1), (14, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((46720 : Rat) / 3087) [(6, 1), (14, 1)],
  term ((-46720 : Rat) / 3087) [(6, 1), (14, 1), (15, 2)],
  term ((-46720 : Rat) / 3087) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0156
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0157 : Poly :=
[
  term ((-49030393049888 : Rat) / 241755938487) [(6, 1), (15, 2)]
]

/-- Partial product 157 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0157 : Poly :=
[
  term ((-98060786099776 : Rat) / 241755938487) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((98060786099776 : Rat) / 241755938487) [(2, 1), (6, 1), (15, 2)],
  term ((-98060786099776 : Rat) / 241755938487) [(3, 1), (6, 1), (15, 3)],
  term ((49030393049888 : Rat) / 241755938487) [(6, 1), (14, 2), (15, 2)],
  term ((-49030393049888 : Rat) / 241755938487) [(6, 1), (15, 2)],
  term ((49030393049888 : Rat) / 241755938487) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0157
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0158 : Poly :=
[
  term ((51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1)]
]

/-- Partial product 158 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0158 : Poly :=
[
  term ((-51436732036100989 : Rat) / 39164462034894) [(2, 1), (7, 1), (9, 1)],
  term ((51436732036100989 : Rat) / 39164462034894) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((51436732036100989 : Rat) / 39164462034894) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1)],
  term ((-51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1), (14, 2)],
  term ((-51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0158
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0159 : Poly :=
[
  term ((-2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 159 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0159 : Poly :=
[
  term ((2139618707005 : Rat) / 5781372408) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-2139618707005 : Rat) / 5781372408) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2139618707005 : Rat) / 5781372408) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1)],
  term ((2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0159
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0160 : Poly :=
[
  term ((-202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 160 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0160 : Poly :=
[
  term ((404607595632014 : Rat) / 241755938487) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-404607595632014 : Rat) / 241755938487) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-404607595632014 : Rat) / 241755938487) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1)],
  term ((202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0160
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0161 : Poly :=
[
  term ((553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 161 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0161 : Poly :=
[
  term ((-553406087440609 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((553406087440609 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((553406087440609 : Rat) / 1598549470812) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)],
  term ((-553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0161
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0162 : Poly :=
[
  term ((-1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 162 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0162 : Poly :=
[
  term ((-1315 : Rat) / 18) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1315 : Rat) / 18) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1315 : Rat) / 18) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0162
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0163 : Poly :=
[
  term ((169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 163 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0163 : Poly :=
[
  term ((169323490635953 : Rat) / 177616607868) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-169323490635953 : Rat) / 177616607868) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((169323490635953 : Rat) / 177616607868) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (15, 1)],
  term ((-169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0163
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0164 : Poly :=
[
  term ((1957 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0164 : Poly :=
[
  term ((3914 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3914 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3914 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1957 : Rat) / 63) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1957 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1957 : Rat) / 63) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0164
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0165 : Poly :=
[
  term ((-485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1)]
]

/-- Partial product 165 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0165 : Poly :=
[
  term ((485087679244781 : Rat) / 621658127538) [(2, 1), (7, 1), (11, 1)],
  term ((-485087679244781 : Rat) / 621658127538) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-485087679244781 : Rat) / 621658127538) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1)],
  term ((485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1), (14, 2)],
  term ((485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0165
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0166 : Poly :=
[
  term ((-35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 166 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0166 : Poly :=
[
  term ((35226805206561719 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-35226805206561719 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-35226805206561719 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)],
  term ((35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0166
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0167 : Poly :=
[
  term ((-54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1)]
]

/-- Partial product 167 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0167 : Poly :=
[
  term ((54582524526032369 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1)],
  term ((-54582524526032369 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-54582524526032369 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1)],
  term ((54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 2)],
  term ((54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0167
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0168 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 168 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0168 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((4349915183394751 : Rat) / 6527410339149) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0168
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0169 : Poly :=
[
  term ((-170 : Rat) / 63) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 169 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0169 : Poly :=
[
  term ((-340 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((170 : Rat) / 63) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0169
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0170 : Poly :=
[
  term ((5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 170 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0170 : Poly :=
[
  term ((-11531641327674458 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 3)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0170
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0171 : Poly :=
[
  term ((52722473006366879 : Rat) / 26109641356596) [(7, 1), (15, 1)]
]

/-- Partial product 171 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0171 : Poly :=
[
  term ((52722473006366879 : Rat) / 13054820678298) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-52722473006366879 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)],
  term ((52722473006366879 : Rat) / 13054820678298) [(3, 1), (7, 1), (15, 2)],
  term ((-52722473006366879 : Rat) / 26109641356596) [(7, 1), (14, 2), (15, 1)],
  term ((52722473006366879 : Rat) / 26109641356596) [(7, 1), (15, 1)],
  term ((-52722473006366879 : Rat) / 26109641356596) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0171
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0172 : Poly :=
[
  term ((32 : Rat) / 9) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0172 : Poly :=
[
  term ((64 : Rat) / 9) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0172
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0173 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(7, 2)]
]

/-- Partial product 173 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0173 : Poly :=
[
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 2)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 2), (14, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(3, 1), (7, 2), (15, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (14, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0173
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0174 : Poly :=
[
  term ((-11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1)]
]

/-- Partial product 174 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0174 : Poly :=
[
  term ((11024177437310755 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 1)],
  term ((-11024177437310755 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((-11024177437310755 : Rat) / 13054820678298) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((-11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1)],
  term ((11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1), (14, 2)],
  term ((11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0174
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0175 : Poly :=
[
  term ((40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 175 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0175 : Poly :=
[
  term ((-40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0175
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0176 : Poly :=
[
  term ((24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 176 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0176 : Poly :=
[
  term ((24322142804401 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-24322142804401 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((24322142804401 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (15, 1)],
  term ((-24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0176
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0177 : Poly :=
[
  term ((823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1)]
]

/-- Partial product 177 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0177 : Poly :=
[
  term ((-823468735227793 : Rat) / 1598549470812) [(2, 1), (9, 1), (11, 1)],
  term ((823468735227793 : Rat) / 1598549470812) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((823468735227793 : Rat) / 1598549470812) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1)],
  term ((-823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1), (14, 2)],
  term ((-823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0177
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0178 : Poly :=
[
  term ((-50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 178 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0178 : Poly :=
[
  term ((50727427070749 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-50727427070749 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-50727427070749 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 1)],
  term ((50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0178
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0179 : Poly :=
[
  term ((-7819657675 : Rat) / 666166368) [(9, 1), (13, 1)]
]

/-- Partial product 179 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0179 : Poly :=
[
  term ((7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-7819657675 : Rat) / 333083184) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-7819657675 : Rat) / 666166368) [(9, 1), (13, 1)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1), (14, 2)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0179
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0180 : Poly :=
[
  term ((-53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 180 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0180 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-53777198303881 : Rat) / 40469606856) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0180
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0181 : Poly :=
[
  term ((-725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0181 : Poly :=
[
  term ((-725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0181
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0182 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 182 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0182 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 3)],
  term ((-6788130415625 : Rat) / 10117401714) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0182
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0183 : Poly :=
[
  term ((786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 1)]
]

/-- Partial product 183 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0183 : Poly :=
[
  term ((786611939080851491 : Rat) / 313315696279152) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(2, 1), (9, 1), (15, 1)],
  term ((786611939080851491 : Rat) / 313315696279152) [(3, 1), (9, 1), (15, 2)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(9, 1), (14, 2), (15, 1)],
  term ((786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 1)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0183
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0184 : Poly :=
[
  term ((443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0184 : Poly :=
[
  term ((443 : Rat) / 21) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 21) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 21) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-443 : Rat) / 42) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 42) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0184
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0185 : Poly :=
[
  term ((-385847904595639 : Rat) / 23208570094752) [(9, 2)]
]

/-- Partial product 185 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0185 : Poly :=
[
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2), (14, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(3, 1), (9, 2), (15, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(9, 2)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2), (14, 2)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0185
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0186 : Poly :=
[
  term ((330120288887131 : Rat) / 532849823604) [(10, 1)]
]

/-- Partial product 186 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0186 : Poly :=
[
  term ((-330120288887131 : Rat) / 266424911802) [(2, 1), (10, 1)],
  term ((330120288887131 : Rat) / 266424911802) [(2, 1), (10, 1), (14, 1)],
  term ((330120288887131 : Rat) / 266424911802) [(3, 1), (10, 1), (15, 1)],
  term ((330120288887131 : Rat) / 532849823604) [(10, 1)],
  term ((-330120288887131 : Rat) / 532849823604) [(10, 1), (14, 2)],
  term ((-330120288887131 : Rat) / 532849823604) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0186
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0187 : Poly :=
[
  term ((-1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 187 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0187 : Poly :=
[
  term ((1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0187
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0188 : Poly :=
[
  term ((-3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 188 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0188 : Poly :=
[
  term ((-3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3635 : Rat) / 126) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0188
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0189 : Poly :=
[
  term ((155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 189 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0189 : Poly :=
[
  term ((155956339364364379 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-155956339364364379 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((155956339364364379 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 1)],
  term ((-155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0189
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0190 : Poly :=
[
  term ((839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0190 : Poly :=
[
  term ((1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1678 : Rat) / 63) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0190
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0191 : Poly :=
[
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)]
]

/-- Partial product 191 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0191 : Poly :=
[
  term ((55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (14, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0191
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0192 : Poly :=
[
  term ((-891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 192 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0192 : Poly :=
[
  term ((-891750086462131 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((891750086462131 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-891750086462131 : Rat) / 6394197883248) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)],
  term ((891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0192
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0193 : Poly :=
[
  term ((4825 : Rat) / 144) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0193 : Poly :=
[
  term ((4825 : Rat) / 72) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4825 : Rat) / 72) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4825 : Rat) / 72) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4825 : Rat) / 144) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4825 : Rat) / 144) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4825 : Rat) / 144) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0193
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0194 : Poly :=
[
  term ((-17027674425965641 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

/-- Partial product 194 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0194 : Poly :=
[
  term ((-17027674425965641 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((17027674425965641 : Rat) / 26109641356596) [(2, 1), (10, 1), (15, 2)],
  term ((-17027674425965641 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 3)],
  term ((17027674425965641 : Rat) / 52219282713192) [(10, 1), (14, 2), (15, 2)],
  term ((-17027674425965641 : Rat) / 52219282713192) [(10, 1), (15, 2)],
  term ((17027674425965641 : Rat) / 52219282713192) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0194
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0195 : Poly :=
[
  term ((-1033 : Rat) / 36) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 195 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0195 : Poly :=
[
  term ((-1033 : Rat) / 18) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1033 : Rat) / 18) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1033 : Rat) / 18) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1033 : Rat) / 36) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1033 : Rat) / 36) [(10, 1), (15, 2), (16, 1)],
  term ((1033 : Rat) / 36) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0195
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0196 : Poly :=
[
  term ((-871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1)]
]

/-- Partial product 196 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0196 : Poly :=
[
  term ((871007938562821 : Rat) / 799274735406) [(2, 1), (11, 1), (13, 1)],
  term ((-871007938562821 : Rat) / 799274735406) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-871007938562821 : Rat) / 799274735406) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1)],
  term ((871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1), (14, 2)],
  term ((871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0196
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0197 : Poly :=
[
  term ((141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 197 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0197 : Poly :=
[
  term ((-141588376804913959 : Rat) / 313315696279152) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((141588376804913959 : Rat) / 313315696279152) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((141588376804913959 : Rat) / 313315696279152) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)],
  term ((-141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0197
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0198 : Poly :=
[
  term ((-10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 198 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0198 : Poly :=
[
  term ((10435 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10435 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10435 : Rat) / 504) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0198
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0199 : Poly :=
[
  term ((295 : Rat) / 18) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0199 : Poly :=
[
  term ((295 : Rat) / 9) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-295 : Rat) / 9) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 9) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-295 : Rat) / 18) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-295 : Rat) / 18) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((295 : Rat) / 18) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0199
        rs_R009_ueqv_R009YNNNN_generator_12_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_12_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_12_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_12_0100,
  rs_R009_ueqv_R009YNNNN_partial_12_0101,
  rs_R009_ueqv_R009YNNNN_partial_12_0102,
  rs_R009_ueqv_R009YNNNN_partial_12_0103,
  rs_R009_ueqv_R009YNNNN_partial_12_0104,
  rs_R009_ueqv_R009YNNNN_partial_12_0105,
  rs_R009_ueqv_R009YNNNN_partial_12_0106,
  rs_R009_ueqv_R009YNNNN_partial_12_0107,
  rs_R009_ueqv_R009YNNNN_partial_12_0108,
  rs_R009_ueqv_R009YNNNN_partial_12_0109,
  rs_R009_ueqv_R009YNNNN_partial_12_0110,
  rs_R009_ueqv_R009YNNNN_partial_12_0111,
  rs_R009_ueqv_R009YNNNN_partial_12_0112,
  rs_R009_ueqv_R009YNNNN_partial_12_0113,
  rs_R009_ueqv_R009YNNNN_partial_12_0114,
  rs_R009_ueqv_R009YNNNN_partial_12_0115,
  rs_R009_ueqv_R009YNNNN_partial_12_0116,
  rs_R009_ueqv_R009YNNNN_partial_12_0117,
  rs_R009_ueqv_R009YNNNN_partial_12_0118,
  rs_R009_ueqv_R009YNNNN_partial_12_0119,
  rs_R009_ueqv_R009YNNNN_partial_12_0120,
  rs_R009_ueqv_R009YNNNN_partial_12_0121,
  rs_R009_ueqv_R009YNNNN_partial_12_0122,
  rs_R009_ueqv_R009YNNNN_partial_12_0123,
  rs_R009_ueqv_R009YNNNN_partial_12_0124,
  rs_R009_ueqv_R009YNNNN_partial_12_0125,
  rs_R009_ueqv_R009YNNNN_partial_12_0126,
  rs_R009_ueqv_R009YNNNN_partial_12_0127,
  rs_R009_ueqv_R009YNNNN_partial_12_0128,
  rs_R009_ueqv_R009YNNNN_partial_12_0129,
  rs_R009_ueqv_R009YNNNN_partial_12_0130,
  rs_R009_ueqv_R009YNNNN_partial_12_0131,
  rs_R009_ueqv_R009YNNNN_partial_12_0132,
  rs_R009_ueqv_R009YNNNN_partial_12_0133,
  rs_R009_ueqv_R009YNNNN_partial_12_0134,
  rs_R009_ueqv_R009YNNNN_partial_12_0135,
  rs_R009_ueqv_R009YNNNN_partial_12_0136,
  rs_R009_ueqv_R009YNNNN_partial_12_0137,
  rs_R009_ueqv_R009YNNNN_partial_12_0138,
  rs_R009_ueqv_R009YNNNN_partial_12_0139,
  rs_R009_ueqv_R009YNNNN_partial_12_0140,
  rs_R009_ueqv_R009YNNNN_partial_12_0141,
  rs_R009_ueqv_R009YNNNN_partial_12_0142,
  rs_R009_ueqv_R009YNNNN_partial_12_0143,
  rs_R009_ueqv_R009YNNNN_partial_12_0144,
  rs_R009_ueqv_R009YNNNN_partial_12_0145,
  rs_R009_ueqv_R009YNNNN_partial_12_0146,
  rs_R009_ueqv_R009YNNNN_partial_12_0147,
  rs_R009_ueqv_R009YNNNN_partial_12_0148,
  rs_R009_ueqv_R009YNNNN_partial_12_0149,
  rs_R009_ueqv_R009YNNNN_partial_12_0150,
  rs_R009_ueqv_R009YNNNN_partial_12_0151,
  rs_R009_ueqv_R009YNNNN_partial_12_0152,
  rs_R009_ueqv_R009YNNNN_partial_12_0153,
  rs_R009_ueqv_R009YNNNN_partial_12_0154,
  rs_R009_ueqv_R009YNNNN_partial_12_0155,
  rs_R009_ueqv_R009YNNNN_partial_12_0156,
  rs_R009_ueqv_R009YNNNN_partial_12_0157,
  rs_R009_ueqv_R009YNNNN_partial_12_0158,
  rs_R009_ueqv_R009YNNNN_partial_12_0159,
  rs_R009_ueqv_R009YNNNN_partial_12_0160,
  rs_R009_ueqv_R009YNNNN_partial_12_0161,
  rs_R009_ueqv_R009YNNNN_partial_12_0162,
  rs_R009_ueqv_R009YNNNN_partial_12_0163,
  rs_R009_ueqv_R009YNNNN_partial_12_0164,
  rs_R009_ueqv_R009YNNNN_partial_12_0165,
  rs_R009_ueqv_R009YNNNN_partial_12_0166,
  rs_R009_ueqv_R009YNNNN_partial_12_0167,
  rs_R009_ueqv_R009YNNNN_partial_12_0168,
  rs_R009_ueqv_R009YNNNN_partial_12_0169,
  rs_R009_ueqv_R009YNNNN_partial_12_0170,
  rs_R009_ueqv_R009YNNNN_partial_12_0171,
  rs_R009_ueqv_R009YNNNN_partial_12_0172,
  rs_R009_ueqv_R009YNNNN_partial_12_0173,
  rs_R009_ueqv_R009YNNNN_partial_12_0174,
  rs_R009_ueqv_R009YNNNN_partial_12_0175,
  rs_R009_ueqv_R009YNNNN_partial_12_0176,
  rs_R009_ueqv_R009YNNNN_partial_12_0177,
  rs_R009_ueqv_R009YNNNN_partial_12_0178,
  rs_R009_ueqv_R009YNNNN_partial_12_0179,
  rs_R009_ueqv_R009YNNNN_partial_12_0180,
  rs_R009_ueqv_R009YNNNN_partial_12_0181,
  rs_R009_ueqv_R009YNNNN_partial_12_0182,
  rs_R009_ueqv_R009YNNNN_partial_12_0183,
  rs_R009_ueqv_R009YNNNN_partial_12_0184,
  rs_R009_ueqv_R009YNNNN_partial_12_0185,
  rs_R009_ueqv_R009YNNNN_partial_12_0186,
  rs_R009_ueqv_R009YNNNN_partial_12_0187,
  rs_R009_ueqv_R009YNNNN_partial_12_0188,
  rs_R009_ueqv_R009YNNNN_partial_12_0189,
  rs_R009_ueqv_R009YNNNN_partial_12_0190,
  rs_R009_ueqv_R009YNNNN_partial_12_0191,
  rs_R009_ueqv_R009YNNNN_partial_12_0192,
  rs_R009_ueqv_R009YNNNN_partial_12_0193,
  rs_R009_ueqv_R009YNNNN_partial_12_0194,
  rs_R009_ueqv_R009YNNNN_partial_12_0195,
  rs_R009_ueqv_R009YNNNN_partial_12_0196,
  rs_R009_ueqv_R009YNNNN_partial_12_0197,
  rs_R009_ueqv_R009YNNNN_partial_12_0198,
  rs_R009_ueqv_R009YNNNN_partial_12_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_12_0100_0199 : Poly :=
[
  term ((-68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((3705500319602759 : Rat) / 1864974382614) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-3705500319602759 : Rat) / 1864974382614) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((5760718724642803 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-7250016913533151 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((14850217784373310 : Rat) / 2797461573921) [(2, 1), (3, 1), (7, 1)],
  term ((-20506829912648953 : Rat) / 11189846295684) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((20506829912648953 : Rat) / 11189846295684) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-190992159978363407 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (9, 1)],
  term ((-174138896329411 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((174138896329411 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-31165523383810 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((13807515727570 : Rat) / 5058700857) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((240134386974757117 : Rat) / 78328924069788) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-240134386974757117 : Rat) / 78328924069788) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((7083467755020073 : Rat) / 2131399294416) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-7083467755020073 : Rat) / 2131399294416) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((12445 : Rat) / 168) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12445 : Rat) / 168) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((181176122455641613 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2413 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181176122455641613 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((2413 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-105965674040266171 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1)],
  term ((45057287208268375 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-164378049209344079 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-589 : Rat) / 126) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2661412996751609 : Rat) / 330501789324) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (13, 1)],
  term ((219079641379313819 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4720 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-79545702321122267 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-680 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((661598467394803 : Rat) / 228364210116) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-8185 : Rat) / 126) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((600 : Rat) / 7) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-195563866986809501 : Rat) / 26109641356596) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3352 : Rat) / 63) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((4677294932911271 : Rat) / 2797461573921) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((128 : Rat) / 9) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((470046679354834153 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)],
  term ((-472 : Rat) / 7) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-21205762290503237 : Rat) / 6527410339149) [(2, 1), (3, 1), (15, 3)],
  term ((3242 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2)],
  term ((6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((1146535131447565 : Rat) / 2901071261844) [(2, 1), (3, 2), (10, 1)],
  term ((-1146535131447565 : Rat) / 2901071261844) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((138338997262248115 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 2)],
  term ((630661956398632 : Rat) / 2175803446383) [(2, 1), (6, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-19473600831050851 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((19473600831050851 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((64 : Rat) / 9) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 1), (7, 2), (14, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1680823161741473 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1846300738284845 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2346691639880863 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 2)],
  term ((2346691639880863 : Rat) / 1450535630922) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((-696521066871592 : Rat) / 2175803446383) [(2, 1), (6, 1), (14, 1)],
  term ((-98060786099776 : Rat) / 241755938487) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(2, 1), (6, 1), (14, 2)],
  term ((98060786099776 : Rat) / 241755938487) [(2, 1), (6, 1), (15, 2)],
  term ((-51436732036100989 : Rat) / 39164462034894) [(2, 1), (7, 1), (9, 1)],
  term ((2139618707005 : Rat) / 5781372408) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-2139618707005 : Rat) / 5781372408) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((51436732036100989 : Rat) / 39164462034894) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((404607595632014 : Rat) / 241755938487) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-404607595632014 : Rat) / 241755938487) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-553406087440609 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((553406087440609 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1315 : Rat) / 18) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1315 : Rat) / 18) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((169323490635953 : Rat) / 177616607868) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((3914 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-169323490635953 : Rat) / 177616607868) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-3914 : Rat) / 63) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((485087679244781 : Rat) / 621658127538) [(2, 1), (7, 1), (11, 1)],
  term ((14853122678280917 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-35226805206561719 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((54582524526032369 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1)],
  term ((-80682015626400875 : Rat) / 39164462034894) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((340 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((29659190351017963 : Rat) / 13054820678298) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11531641327674458 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-52722473006366879 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 2)],
  term ((11024177437310755 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 1)],
  term ((-11024177437310755 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 2), (14, 1)],
  term ((-40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((24322142804401 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-24322142804401 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-823468735227793 : Rat) / 1598549470812) [(2, 1), (9, 1), (11, 1)],
  term ((1177246291156835 : Rat) / 1420932862944) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-50727427070749 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1)],
  term ((15093459970391 : Rat) / 11562744816) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((40686921517633499 : Rat) / 34812855142128) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((443 : Rat) / 21) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-786611939080851491 : Rat) / 313315696279152) [(2, 1), (9, 1), (15, 1)],
  term ((-443 : Rat) / 21) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2), (14, 1)],
  term ((-330120288887131 : Rat) / 266424911802) [(2, 1), (10, 1)],
  term ((1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((155956339364364379 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155956339364364379 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((-891750086462131 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4825 : Rat) / 72) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((891750086462131 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4825 : Rat) / 72) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((330120288887131 : Rat) / 266424911802) [(2, 1), (10, 1), (14, 1)],
  term ((-17027674425965641 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1033 : Rat) / 18) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((17027674425965641 : Rat) / 26109641356596) [(2, 1), (10, 1), (15, 2)],
  term ((1033 : Rat) / 18) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((871007938562821 : Rat) / 799274735406) [(2, 1), (11, 1), (13, 1)],
  term ((-161007829573846597 : Rat) / 104438565426384) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((2995 : Rat) / 56) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((141588376804913959 : Rat) / 313315696279152) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-10435 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-295 : Rat) / 9) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((589 : Rat) / 252) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-589 : Rat) / 252) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((589 : Rat) / 252) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2)],
  term ((-2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2), (14, 2)],
  term ((-2661412996751609 : Rat) / 661003578648) [(2, 1), (11, 2), (15, 2)],
  term ((-3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((8185 : Rat) / 252) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 1)],
  term ((-8185 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3917988683762341 : Rat) / 3197098941624) [(2, 1), (13, 1), (15, 3)],
  term ((8185 : Rat) / 252) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 1)],
  term ((-897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 1), (15, 2)],
  term ((22786380941854277 : Rat) / 13054820678298) [(2, 1), (14, 2), (15, 2)],
  term ((-1621 : Rat) / 63) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-897257897096525 : Rat) / 26109641356596) [(2, 1), (14, 3)],
  term ((-22786380941854277 : Rat) / 13054820678298) [(2, 1), (15, 2)],
  term ((1621 : Rat) / 63) [(2, 1), (15, 2), (16, 1)],
  term ((22786380941854277 : Rat) / 13054820678298) [(2, 1), (15, 4)],
  term ((-1621 : Rat) / 63) [(2, 1), (15, 4), (16, 1)],
  term ((-589 : Rat) / 126) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((589 : Rat) / 126) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2661412996751609 : Rat) / 330501789324) [(2, 2), (11, 2)],
  term ((2661412996751609 : Rat) / 330501789324) [(2, 2), (11, 2), (14, 1)],
  term ((3917988683762341 : Rat) / 1598549470812) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8185 : Rat) / 126) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3917988683762341 : Rat) / 1598549470812) [(2, 2), (13, 1), (15, 1)],
  term ((8185 : Rat) / 126) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-897257897096525 : Rat) / 13054820678298) [(2, 2), (14, 1)],
  term ((-22786380941854277 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((3242 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((897257897096525 : Rat) / 13054820678298) [(2, 2), (14, 2)],
  term ((22786380941854277 : Rat) / 6527410339149) [(2, 2), (15, 2)],
  term ((-3242 : Rat) / 63) [(2, 2), (15, 2), (16, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((19473600831050851 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-3875096029318303 : Rat) / 799274735406) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((3705500319602759 : Rat) / 3729948765228) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-7294911051907897 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((2346691639880863 : Rat) / 1450535630922) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((21107476986721 : Rat) / 241755938487) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((-7250016913533151 : Rat) / 26109641356596) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 3), (15, 1)],
  term ((-317926563250433 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17840581812308959 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 3)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1)],
  term ((-2139618707005 : Rat) / 5781372408) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((51436732036100989 : Rat) / 39164462034894) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1)],
  term ((-404607595632014 : Rat) / 241755938487) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((553406087440609 : Rat) / 1598549470812) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1315 : Rat) / 18) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20506829912648953 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((827929907481125 : Rat) / 22379692591368) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((3914 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-35226805206561719 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-485087679244781 : Rat) / 621658127538) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-54582524526032369 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)],
  term ((821643306534161 : Rat) / 414438751692) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((7425108892186655 : Rat) / 2797461573921) [(3, 1), (7, 1), (14, 2)],
  term ((5636963000954311 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 3)],
  term ((262118943509713807 : Rat) / 39164462034894) [(3, 1), (7, 1), (15, 2)],
  term ((64 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-11024177437310755 : Rat) / 13054820678298) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(3, 1), (7, 2), (15, 1)],
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (9, 1)],
  term ((174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-174138896329411 : Rat) / 107918951616) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-473772403379431 : Rat) / 323756854848) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-50727427070749 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((823468735227793 : Rat) / 1598549470812) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7819657675 : Rat) / 333083184) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-725 : Rat) / 28) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1), (14, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-6903757863785 : Rat) / 5058700857) [(3, 1), (9, 1), (14, 3)],
  term ((1368585260899460771 : Rat) / 313315696279152) [(3, 1), (9, 1), (15, 2)],
  term ((443 : Rat) / 21) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 4)],
  term ((-385847904595639 : Rat) / 11604285047376) [(3, 1), (9, 2), (15, 1)],
  term ((-240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3635 : Rat) / 126) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240134386974757117 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((1175872423160943391 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((1678 : Rat) / 63) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1)],
  term ((7083467755020073 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((19466903092135957 : Rat) / 12788395766496) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((30215 : Rat) / 1008) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12445 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-181176122455641613 : Rat) / 78328924069788) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((2413 : Rat) / 84) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((278231487388458127 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 1)],
  term ((-2413 : Rat) / 84) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-58064786433384634 : Rat) / 19582231017447) [(3, 1), (10, 1), (15, 3)],
  term ((-7223 : Rat) / 252) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((141588376804913959 : Rat) / 313315696279152) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10435 : Rat) / 504) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-871007938562821 : Rat) / 799274735406) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((295 : Rat) / 9) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1)],
  term ((164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 2)],
  term ((164378049209344079 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 3)],
  term ((-105965674040266171 : Rat) / 156657848139576) [(3, 1), (11, 1), (15, 2)],
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)],
  term ((-79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)],
  term ((79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((340 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1), (14, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((79545702321122267 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 3)],
  term ((340 : Rat) / 63) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-89006436204208 : Rat) / 44404151967) [(3, 1), (13, 1), (15, 2)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 4)],
  term ((-300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)],
  term ((30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 1), (15, 3)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((461110890221492065 : Rat) / 156657848139576) [(3, 1), (14, 2), (15, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((43060513811041 : Rat) / 241755938487) [(3, 1), (14, 2), (15, 3)],
  term ((-30507117247043375 : Rat) / 39164462034894) [(3, 1), (14, 3), (15, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (14, 4), (15, 1)],
  term ((-470046679354834153 : Rat) / 156657848139576) [(3, 1), (15, 1)],
  term ((236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)],
  term ((451079255538621673 : Rat) / 156657848139576) [(3, 1), (15, 3)],
  term ((-236 : Rat) / 7) [(3, 1), (15, 3), (16, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (15, 5)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-3705500319602759 : Rat) / 1864974382614) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (14, 1), (15, 2)],
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1), (14, 2)],
  term ((49798012362607331 : Rat) / 78328924069788) [(3, 2), (6, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((20506829912648953 : Rat) / 11189846295684) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((-5636963000954311 : Rat) / 13054820678298) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-14850217784373310 : Rat) / 2797461573921) [(3, 2), (7, 1), (15, 1)],
  term ((174138896329411 : Rat) / 53959475808) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((13807515727570 : Rat) / 5058700857) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1928667517360 : Rat) / 562077873) [(3, 2), (9, 1), (15, 1)],
  term ((97280 : Rat) / 343) [(3, 2), (9, 1), (15, 3)],
  term ((-1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1)],
  term ((-240134386974757117 : Rat) / 78328924069788) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-7083467755020073 : Rat) / 2131399294416) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((12445 : Rat) / 168) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1146535131447565 : Rat) / 5802142523688) [(3, 2), (10, 1), (14, 2)],
  term ((755660938371650707 : Rat) / 156657848139576) [(3, 2), (10, 1), (15, 2)],
  term ((-2413 : Rat) / 42) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-164378049209344079 : Rat) / 78328924069788) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((105965674040266171 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)],
  term ((-79545702321122267 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((158201744963936 : Rat) / 44404151967) [(3, 2), (13, 1), (15, 1)],
  term ((-600 : Rat) / 7) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1377280 : Rat) / 3087) [(3, 2), (13, 1), (15, 3)],
  term ((-60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 1)],
  term ((60733764464706385 : Rat) / 26109641356596) [(3, 2), (14, 1), (15, 2)],
  term ((128 : Rat) / 9) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (14, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (14, 2), (15, 2)],
  term ((60172824405945655 : Rat) / 78328924069788) [(3, 2), (14, 3)],
  term ((-548212852211136613 : Rat) / 78328924069788) [(3, 2), (15, 2)],
  term ((472 : Rat) / 7) [(3, 2), (15, 2), (16, 1)],
  term ((-747520 : Rat) / 3087) [(3, 2), (15, 4)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(3, 3), (6, 1), (15, 1)],
  term ((-1146535131447565 : Rat) / 2901071261844) [(3, 3), (10, 1), (15, 1)],
  term ((-60172824405945655 : Rat) / 39164462034894) [(3, 3), (14, 1), (15, 1)],
  term ((4342565158683470 : Rat) / 2175803446383) [(3, 3), (15, 1)],
  term ((-315330978199316 : Rat) / 2175803446383) [(6, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1)],
  term ((-19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-19473600831050851 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 3)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (14, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (15, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1), (14, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)],
  term ((-1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (15, 1)],
  term ((1846300738284845 : Rat) / 2901071261844) [(6, 1), (11, 1), (15, 3)],
  term ((2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2)],
  term ((-2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2), (14, 2)],
  term ((-2346691639880863 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)],
  term ((46720 : Rat) / 3087) [(6, 1), (14, 1)],
  term ((-46720 : Rat) / 3087) [(6, 1), (14, 1), (15, 2)],
  term ((315330978199316 : Rat) / 2175803446383) [(6, 1), (14, 2)],
  term ((49030393049888 : Rat) / 241755938487) [(6, 1), (14, 2), (15, 2)],
  term ((-46720 : Rat) / 3087) [(6, 1), (14, 3)],
  term ((-125942559249676 : Rat) / 2175803446383) [(6, 1), (15, 2)],
  term ((49030393049888 : Rat) / 241755938487) [(6, 1), (15, 4)],
  term ((51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1)],
  term ((-2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1)],
  term ((2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((2139618707005 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term ((-51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1), (14, 2)],
  term ((-51436732036100989 : Rat) / 78328924069788) [(7, 1), (9, 1), (15, 2)],
  term ((-202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1)],
  term ((202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((202303797816007 : Rat) / 241755938487) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)],
  term ((-553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-553406087440609 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1315 : Rat) / 36) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1957 : Rat) / 63) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (15, 1)],
  term ((1957 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-169323490635953 : Rat) / 355233215736) [(7, 1), (10, 1), (15, 3)],
  term ((-1957 : Rat) / 63) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1)],
  term ((-35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)],
  term ((35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1), (14, 2)],
  term ((35226805206561719 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 3)],
  term ((485087679244781 : Rat) / 1243316255076) [(7, 1), (11, 1), (15, 2)],
  term ((-54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 2)],
  term ((170 : Rat) / 63) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 3)],
  term ((54582524526032369 : Rat) / 78328924069788) [(7, 1), (13, 1), (15, 2)],
  term ((170 : Rat) / 63) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (13, 1), (16, 1)],
  term ((5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 3)],
  term ((-52722473006366879 : Rat) / 26109641356596) [(7, 1), (14, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5765820663837229 : Rat) / 6527410339149) [(7, 1), (14, 3), (15, 1)],
  term ((52722473006366879 : Rat) / 26109641356596) [(7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(7, 1), (15, 1), (16, 1)],
  term ((-52722473006366879 : Rat) / 26109641356596) [(7, 1), (15, 3)],
  term ((-32 : Rat) / 9) [(7, 1), (15, 3), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(7, 2)],
  term ((-11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1)],
  term ((11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1), (14, 2)],
  term ((11024177437310755 : Rat) / 26109641356596) [(7, 2), (10, 1), (15, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (14, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (15, 2)],
  term ((40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (15, 1)],
  term ((-24322142804401 : Rat) / 323756854848) [(9, 1), (10, 1), (15, 3)],
  term ((823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1)],
  term ((-50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 1)],
  term ((50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1), (14, 2)],
  term ((50727427070749 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 3)],
  term ((-823468735227793 : Rat) / 3197098941624) [(9, 1), (11, 1), (15, 2)],
  term ((-7819657675 : Rat) / 666166368) [(9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 3)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1), (15, 2)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(9, 1), (14, 1), (15, 3)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(9, 1), (14, 2), (15, 1)],
  term ((-443 : Rat) / 42) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(9, 1), (14, 3), (15, 1)],
  term ((786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 1)],
  term ((443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)],
  term ((-786611939080851491 : Rat) / 626631392558304) [(9, 1), (15, 3)],
  term ((-443 : Rat) / 42) [(9, 1), (15, 3), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(9, 2)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2), (14, 2)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2), (15, 2)],
  term ((330120288887131 : Rat) / 532849823604) [(10, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 1)],
  term ((839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-155956339364364379 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 3)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (14, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (15, 2)],
  term ((891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4825 : Rat) / 144) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)],
  term ((4825 : Rat) / 144) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((891750086462131 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 3)],
  term ((-4825 : Rat) / 144) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-330120288887131 : Rat) / 532849823604) [(10, 1), (14, 2)],
  term ((17027674425965641 : Rat) / 52219282713192) [(10, 1), (14, 2), (15, 2)],
  term ((1033 : Rat) / 36) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-16459820912301493 : Rat) / 17406427571064) [(10, 1), (15, 2)],
  term ((-1033 : Rat) / 36) [(10, 1), (15, 2), (16, 1)],
  term ((17027674425965641 : Rat) / 52219282713192) [(10, 1), (15, 4)],
  term ((1033 : Rat) / 36) [(10, 1), (15, 4), (16, 1)],
  term ((-871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1)],
  term ((141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)],
  term ((-141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1), (14, 2)],
  term ((-295 : Rat) / 18) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-141588376804913959 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 3)],
  term ((10435 : Rat) / 1008) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((871007938562821 : Rat) / 1598549470812) [(11, 1), (13, 1), (15, 2)],
  term ((-295 : Rat) / 18) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((295 : Rat) / 18) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_12_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_12_0100_0199
      rs_R009_ueqv_R009YNNNN_block_12_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
