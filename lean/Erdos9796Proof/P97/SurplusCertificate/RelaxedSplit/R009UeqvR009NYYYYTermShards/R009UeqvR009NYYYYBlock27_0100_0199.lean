/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 27:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(12, 1)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0100 : Poly :=
[
  term ((-43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 100 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0100 : Poly :=
[
  term ((-43027457307 : Rat) / 33189485) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((43027457307 : Rat) / 33189485) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((-43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (15, 2)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (15, 4)],
  term ((-43027457307 : Rat) / 33189485) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0100
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0101 : Poly :=
[
  term ((3983932 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0101 : Poly :=
[
  term ((7967864 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7967864 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3983932 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((7967864 : Rat) / 32699) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0101
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0102 : Poly :=
[
  term ((100677317197 : Rat) / 531031760) [(5, 1), (15, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0102 : Poly :=
[
  term ((100677317197 : Rat) / 265515880) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-100677317197 : Rat) / 265515880) [(5, 1), (12, 1), (15, 1)],
  term ((100677317197 : Rat) / 265515880) [(5, 1), (13, 1), (15, 2)],
  term ((-100677317197 : Rat) / 531031760) [(5, 1), (14, 2), (15, 1)],
  term ((100677317197 : Rat) / 531031760) [(5, 1), (15, 1)],
  term ((-100677317197 : Rat) / 531031760) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0102
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0103 : Poly :=
[
  term ((-2268225 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0103 : Poly :=
[
  term ((-2268225 : Rat) / 32699) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2268225 : Rat) / 32699) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2268225 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((2268225 : Rat) / 65398) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2268225 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)],
  term ((2268225 : Rat) / 65398) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0103
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0104 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 104 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0104 : Poly :=
[
  term ((-69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0104
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0105 : Poly :=
[
  term ((6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0105 : Poly :=
[
  term ((13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0105
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0106 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 106 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0106 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0106
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0107 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0107 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0107
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0108 : Poly :=
[
  term ((-25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0108 : Poly :=
[
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0108
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0109 : Poly :=
[
  term ((4956120 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0109 : Poly :=
[
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4956120 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0109
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0110 : Poly :=
[
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 110 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0110 : Poly :=
[
  term ((103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 4)],
  term ((103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0110
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0111 : Poly :=
[
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0111 : Poly :=
[
  term ((-19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-19824480 : Rat) / 32699) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0111
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0112 : Poly :=
[
  term ((7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0112 : Poly :=
[
  term ((14284987258 : Rat) / 6637897) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14284987258 : Rat) / 6637897) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((14284987258 : Rat) / 6637897) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (15, 1)],
  term ((-7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0112
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0113 : Poly :=
[
  term ((-6830550 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0113 : Poly :=
[
  term ((-13661100 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13661100 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13661100 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6830550 : Rat) / 32699) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6830550 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6830550 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0113
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0114 : Poly :=
[
  term ((-25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)]
]

/-- Partial product 114 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0114 : Poly :=
[
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 4)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (14, 2), (15, 3)],
  term ((-25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0114
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0115 : Poly :=
[
  term ((4956120 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 115 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0115 : Poly :=
[
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((4956120 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0115
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0116 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 116 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0116 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (15, 3)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0116
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0117 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0117 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0117
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0118 : Poly :=
[
  term ((-1328836024 : Rat) / 4741355) [(6, 1), (15, 2)]
]

/-- Partial product 118 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0118 : Poly :=
[
  term ((-2657672048 : Rat) / 4741355) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((2657672048 : Rat) / 4741355) [(6, 1), (12, 1), (15, 2)],
  term ((-2657672048 : Rat) / 4741355) [(6, 1), (13, 1), (15, 3)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (14, 2), (15, 2)],
  term ((-1328836024 : Rat) / 4741355) [(6, 1), (15, 2)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0118
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0119 : Poly :=
[
  term ((1779120 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0119 : Poly :=
[
  term ((3558240 : Rat) / 32699) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3558240 : Rat) / 32699) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((3558240 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1779120 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0119
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0120 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 120 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0120 : Poly :=
[
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (15, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0120
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0121 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0121 : Poly :=
[
  term ((4066560 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4066560 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4066560 : Rat) / 32699) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0121
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0122 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 122 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0122 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 4)],
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0122_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0122
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0123 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0123 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((3049920 : Rat) / 32699) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0123_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0123
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0124 : Poly :=
[
  term ((498313509 : Rat) / 4741355) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 124 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0124 : Poly :=
[
  term ((996627018 : Rat) / 4741355) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-996627018 : Rat) / 4741355) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((996627018 : Rat) / 4741355) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-498313509 : Rat) / 4741355) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((498313509 : Rat) / 4741355) [(7, 1), (10, 1), (15, 1)],
  term ((-498313509 : Rat) / 4741355) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0124_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0124
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0125 : Poly :=
[
  term ((-667170 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0125 : Poly :=
[
  term ((-1334340 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1334340 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1334340 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((667170 : Rat) / 32699) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-667170 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((667170 : Rat) / 32699) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0125_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0125
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0126 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (15, 3)]
]

/-- Partial product 126 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0126 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 4)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (14, 2), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (15, 3)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0126_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0126
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0127 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 127 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0127 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-762480 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0127_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0127
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0128 : Poly :=
[
  term ((-1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 128 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0128 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (15, 2)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0128_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0128
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0129 : Poly :=
[
  term ((1270800 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0129 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2541600 : Rat) / 32699) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((1270800 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0129_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0129
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0130 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 130 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0130 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (12, 1), (15, 3)],
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((15946032288 : Rat) / 33189485) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0130_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0130
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0131 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0131 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((3049920 : Rat) / 32699) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0131_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0131
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0132 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 132 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0132 : Poly :=
[
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (13, 1), (15, 4)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0132_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0132
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0133 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0133 : Poly :=
[
  term ((4066560 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4066560 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((4066560 : Rat) / 32699) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0133_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0133
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0134 : Poly :=
[
  term ((14617196264 : Rat) / 33189485) [(7, 1), (15, 1)]
]

/-- Partial product 134 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0134 : Poly :=
[
  term ((29234392528 : Rat) / 33189485) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29234392528 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)],
  term ((29234392528 : Rat) / 33189485) [(7, 1), (13, 1), (15, 2)],
  term ((-14617196264 : Rat) / 33189485) [(7, 1), (14, 2), (15, 1)],
  term ((14617196264 : Rat) / 33189485) [(7, 1), (15, 1)],
  term ((-14617196264 : Rat) / 33189485) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0134_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0134
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0135 : Poly :=
[
  term ((-2795760 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0135 : Poly :=
[
  term ((-5591520 : Rat) / 32699) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5591520 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5591520 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2795760 : Rat) / 32699) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2795760 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)],
  term ((2795760 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0135_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0135
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0136 : Poly :=
[
  term ((10630688192 : Rat) / 33189485) [(7, 1), (15, 3)]
]

/-- Partial product 136 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0136 : Poly :=
[
  term ((21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (15, 3)],
  term ((21261376384 : Rat) / 33189485) [(7, 1), (13, 1), (15, 4)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (14, 2), (15, 3)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (15, 3)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0136_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0136
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0137 : Poly :=
[
  term ((-2033280 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 137 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0137 : Poly :=
[
  term ((-4066560 : Rat) / 32699) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4066560 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4066560 : Rat) / 32699) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0137_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0137
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0138 : Poly :=
[
  term ((-2033 : Rat) / 320) [(8, 1)]
]

/-- Partial product 138 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0138 : Poly :=
[
  term ((-2033 : Rat) / 320) [(8, 1)],
  term ((2033 : Rat) / 160) [(8, 1), (12, 1)],
  term ((-2033 : Rat) / 160) [(8, 1), (12, 1), (14, 1)],
  term ((-2033 : Rat) / 160) [(8, 1), (13, 1), (15, 1)],
  term ((2033 : Rat) / 320) [(8, 1), (14, 2)],
  term ((2033 : Rat) / 320) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0138_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0138
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0139 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 139 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0139 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0139_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0139
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0140 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0140 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0140_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0140
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0141 : Poly :=
[
  term ((135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 141 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0141 : Poly :=
[
  term ((270513088 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-270513088 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((270513088 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0141_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0141
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0142 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0142 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0142_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0142
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0143 : Poly :=
[
  term ((5 : Rat) / 2) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 143 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0143 : Poly :=
[
  term (-5 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term (5 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(8, 1), (9, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-5 : Rat) / 2) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term (5 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0143_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0143
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0144 : Poly :=
[
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 144 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0144 : Poly :=
[
  term ((160 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-160 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 4)],
  term ((160 : Rat) / 29) [(8, 1), (9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0144_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0144
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0145 : Poly :=
[
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 145 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0145 : Poly :=
[
  term ((426 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-426 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((426 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-213 : Rat) / 29) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (15, 1)],
  term ((-213 : Rat) / 29) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0145_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0145
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0146 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0146 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0146_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0146
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0147 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0147 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((3049920 : Rat) / 32699) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0147_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0147
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0148 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 148 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0148 : Poly :=
[
  term ((-11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 2)],
  term ((5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0148_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0148
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0149 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0149 : Poly :=
[
  term ((2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2287440 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0149_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0149
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0150 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 150 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0150 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 4)],
  term ((-11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0150_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0150
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0151 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0151 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((11040000 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0151_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0151
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0152 : Poly :=
[
  term ((60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 152 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0152 : Poly :=
[
  term ((121453785048 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-121453785048 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((121453785048 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)],
  term ((-60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0152_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0152
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0153 : Poly :=
[
  term ((-11622164 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0153 : Poly :=
[
  term ((-23244328 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23244328 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23244328 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11622164 : Rat) / 32699) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11622164 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((11622164 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0153_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0153
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0154 : Poly :=
[
  term ((7751348 : Rat) / 6637897) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 154 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0154 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((15502696 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 4)],
  term ((-7751348 : Rat) / 6637897) [(8, 1), (11, 1), (14, 2), (15, 3)],
  term ((7751348 : Rat) / 6637897) [(8, 1), (11, 1), (15, 3)],
  term ((-7751348 : Rat) / 6637897) [(8, 1), (11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0154_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0154
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0155 : Poly :=
[
  term ((-7360 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 155 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0155 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-14720 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((7360 : Rat) / 32699) [(8, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-7360 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((7360 : Rat) / 32699) [(8, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0155_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0155
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0156 : Poly :=
[
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 156 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0156 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 3)],
  term ((27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0156_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0156
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0157 : Poly :=
[
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0157 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(8, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0157_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0157
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0158 : Poly :=
[
  term ((-4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 158 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0158 : Poly :=
[
  term ((-8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (13, 1), (15, 3)],
  term ((4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (14, 2), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0158_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0158
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0159 : Poly :=
[
  term ((3886080 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0159 : Poly :=
[
  term ((7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((7772160 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(8, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(8, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0159_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0159
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0160 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)]
]

/-- Partial product 160 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0160 : Poly :=
[
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 3), (14, 2), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0160_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0160
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0161 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0161 : Poly :=
[
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0161_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0161
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0162 : Poly :=
[
  term ((-61 : Rat) / 80) [(8, 1), (12, 1)]
]

/-- Partial product 162 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0162 : Poly :=
[
  term ((-61 : Rat) / 80) [(8, 1), (12, 1)],
  term ((-61 : Rat) / 40) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((61 : Rat) / 80) [(8, 1), (12, 1), (14, 2)],
  term ((61 : Rat) / 80) [(8, 1), (12, 1), (15, 2)],
  term ((61 : Rat) / 40) [(8, 1), (12, 2)],
  term ((-61 : Rat) / 40) [(8, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0162_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0162
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0163 : Poly :=
[
  term ((144424777527 : Rat) / 53103176) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 163 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0163 : Poly :=
[
  term ((144424777527 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-144424777527 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-144424777527 : Rat) / 53103176) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((144424777527 : Rat) / 53103176) [(8, 1), (13, 1), (15, 1)],
  term ((-144424777527 : Rat) / 53103176) [(8, 1), (13, 1), (15, 3)],
  term ((144424777527 : Rat) / 26551588) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0163_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0163
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0164 : Poly :=
[
  term ((-17241566 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0164 : Poly :=
[
  term ((-34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17241566 : Rat) / 32699) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((17241566 : Rat) / 32699) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34483132 : Rat) / 32699) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0164_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0164
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0165 : Poly :=
[
  term ((-813184131611 : Rat) / 531031760) [(8, 1), (15, 2)]
]

/-- Partial product 165 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0165 : Poly :=
[
  term ((-813184131611 : Rat) / 265515880) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((813184131611 : Rat) / 265515880) [(8, 1), (12, 1), (15, 2)],
  term ((-813184131611 : Rat) / 265515880) [(8, 1), (13, 1), (15, 3)],
  term ((813184131611 : Rat) / 531031760) [(8, 1), (14, 2), (15, 2)],
  term ((-813184131611 : Rat) / 531031760) [(8, 1), (15, 2)],
  term ((813184131611 : Rat) / 531031760) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0165_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0165
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0166 : Poly :=
[
  term ((9736537 : Rat) / 32699) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0166 : Poly :=
[
  term ((19473074 : Rat) / 32699) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19473074 : Rat) / 32699) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19473074 : Rat) / 32699) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9736537 : Rat) / 32699) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((9736537 : Rat) / 32699) [(8, 1), (15, 2), (16, 1)],
  term ((-9736537 : Rat) / 32699) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0166_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0166
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0167 : Poly :=
[
  term ((89 : Rat) / 20) [(8, 2)]
]

/-- Partial product 167 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0167 : Poly :=
[
  term ((89 : Rat) / 20) [(8, 2)],
  term ((-89 : Rat) / 10) [(8, 2), (12, 1)],
  term ((89 : Rat) / 10) [(8, 2), (12, 1), (14, 1)],
  term ((89 : Rat) / 10) [(8, 2), (13, 1), (15, 1)],
  term ((-89 : Rat) / 20) [(8, 2), (14, 2)],
  term ((-89 : Rat) / 20) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0167_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0167
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0168 : Poly :=
[
  term ((2 : Rat) / 29) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 168 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0168 : Poly :=
[
  term ((4 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((2 : Rat) / 29) [(9, 1), (10, 1), (15, 1)],
  term ((-2 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0168_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0168
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0169 : Poly :=
[
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 169 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0169 : Poly :=
[
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 4)],
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (15, 3)],
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0169_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0169
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0170 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 170 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0170 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0170_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0170
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0171 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0171 : Poly :=
[
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0171_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0171
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0172 : Poly :=
[
  term ((83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 172 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0172 : Poly :=
[
  term ((166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((-166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0172_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0172
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0173 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 173 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0173 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0173_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0173
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0174 : Poly :=
[
  term ((-100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 174 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0174 : Poly :=
[
  term ((-201535048 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((201535048 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-201535048 : Rat) / 19913691) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0174_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0174
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0175 : Poly :=
[
  term ((95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0175 : Poly :=
[
  term ((191360 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191360 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((191360 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0175_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0175
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0176 : Poly :=
[
  term ((573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 176 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0176 : Poly :=
[
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 5)],
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0176_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0176
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0177 : Poly :=
[
  term ((-108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 177 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0177 : Poly :=
[
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((217856 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0177_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0177
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0178 : Poly :=
[
  term ((-19213190 : Rat) / 2844813) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 178 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0178 : Poly :=
[
  term ((-38426380 : Rat) / 2844813) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((38426380 : Rat) / 2844813) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-38426380 : Rat) / 2844813) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((19213190 : Rat) / 2844813) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-19213190 : Rat) / 2844813) [(9, 1), (11, 1), (15, 2)],
  term ((19213190 : Rat) / 2844813) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0178_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0178
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0179 : Poly :=
[
  term ((25760 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0179 : Poly :=
[
  term ((51520 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51520 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((51520 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25760 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((25760 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-25760 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0179_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0179
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0180 : Poly :=
[
  term ((542375944 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 180 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0180 : Poly :=
[
  term ((1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4)],
  term ((-1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 5)],
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((542375944 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)],
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0180_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0180
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0181 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 181 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0181 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0181_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0181
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0182 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 182 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0182 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0182_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0182
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0183 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0183 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0183_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0183
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0184 : Poly :=
[
  term ((5 : Rat) / 4) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 184 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0184 : Poly :=
[
  term ((5 : Rat) / 4) [(9, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(9, 1), (12, 2), (13, 1)],
  term ((5 : Rat) / 2) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0184_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0184
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0185 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 185 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0185 : Poly :=
[
  term ((-40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 2), (15, 3)],
  term ((80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0185_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0185
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0186 : Poly :=
[
  term ((583 : Rat) / 116) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 186 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0186 : Poly :=
[
  term ((583 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-583 : Rat) / 116) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((583 : Rat) / 116) [(9, 1), (12, 1), (15, 1)],
  term ((-583 : Rat) / 116) [(9, 1), (12, 1), (15, 3)],
  term ((583 : Rat) / 58) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-583 : Rat) / 58) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0186_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0186
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0187 : Poly :=
[
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 187 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0187 : Poly :=
[
  term ((56 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 3)],
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (15, 3)],
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (15, 5)],
  term ((56 : Rat) / 29) [(9, 1), (12, 2), (14, 1), (15, 3)],
  term ((-56 : Rat) / 29) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0187_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0187
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0188 : Poly :=
[
  term ((-65 : Rat) / 24) [(9, 1), (13, 1)]
]

/-- Partial product 188 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0188 : Poly :=
[
  term ((65 : Rat) / 12) [(9, 1), (12, 1), (13, 1)],
  term ((-65 : Rat) / 12) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-65 : Rat) / 24) [(9, 1), (13, 1)],
  term ((65 : Rat) / 24) [(9, 1), (13, 1), (14, 2)],
  term ((65 : Rat) / 24) [(9, 1), (13, 1), (15, 2)],
  term ((-65 : Rat) / 12) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0188_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0188
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0189 : Poly :=
[
  term ((-573 : Rat) / 116) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 189 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0189 : Poly :=
[
  term ((-573 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((573 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((573 : Rat) / 116) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-573 : Rat) / 116) [(9, 1), (13, 1), (15, 2)],
  term ((573 : Rat) / 116) [(9, 1), (13, 1), (15, 4)],
  term ((-573 : Rat) / 58) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0189_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0189
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0190 : Poly :=
[
  term ((440 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 190 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0190 : Poly :=
[
  term ((880 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((-880 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((-440 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((440 : Rat) / 87) [(9, 1), (13, 1), (15, 4)],
  term ((-440 : Rat) / 87) [(9, 1), (13, 1), (15, 6)],
  term ((880 : Rat) / 87) [(9, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0190_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0190
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0191 : Poly :=
[
  term ((-12101 : Rat) / 1392) [(9, 1), (15, 1)]
]

/-- Partial product 191 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0191 : Poly :=
[
  term ((-12101 : Rat) / 696) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12101 : Rat) / 696) [(9, 1), (12, 1), (15, 1)],
  term ((-12101 : Rat) / 696) [(9, 1), (13, 1), (15, 2)],
  term ((12101 : Rat) / 1392) [(9, 1), (14, 2), (15, 1)],
  term ((-12101 : Rat) / 1392) [(9, 1), (15, 1)],
  term ((12101 : Rat) / 1392) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0191_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0191
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0192 : Poly :=
[
  term ((1037 : Rat) / 348) [(9, 1), (15, 3)]
]

/-- Partial product 192 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0192 : Poly :=
[
  term ((1037 : Rat) / 174) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1037 : Rat) / 174) [(9, 1), (12, 1), (15, 3)],
  term ((1037 : Rat) / 174) [(9, 1), (13, 1), (15, 4)],
  term ((-1037 : Rat) / 348) [(9, 1), (14, 2), (15, 3)],
  term ((1037 : Rat) / 348) [(9, 1), (15, 3)],
  term ((-1037 : Rat) / 348) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0192_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0192
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0193 : Poly :=
[
  term ((108518872 : Rat) / 4741355) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 193 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0193 : Poly :=
[
  term ((217037744 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-217037744 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((217037744 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-108518872 : Rat) / 4741355) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((108518872 : Rat) / 4741355) [(10, 1), (11, 1), (15, 1)],
  term ((-108518872 : Rat) / 4741355) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0193_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0193
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0194 : Poly :=
[
  term ((-144256 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0194 : Poly :=
[
  term ((-288512 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((288512 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288512 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((144256 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-144256 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((144256 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0194_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0194
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0195 : Poly :=
[
  term ((2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 195 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0195 : Poly :=
[
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 4)],
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0195_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0195
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0196 : Poly :=
[
  term ((-476928 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 196 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0196 : Poly :=
[
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-476928 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0196_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0196
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0197 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 197 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0197 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0197_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0197
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0198 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 198 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0198 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0198_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0198
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0199 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 199 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0199 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0199_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0199
        rs_R009_ueqv_R009NYYYY_generator_27_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_27_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_27_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_27_0100,
  rs_R009_ueqv_R009NYYYY_partial_27_0101,
  rs_R009_ueqv_R009NYYYY_partial_27_0102,
  rs_R009_ueqv_R009NYYYY_partial_27_0103,
  rs_R009_ueqv_R009NYYYY_partial_27_0104,
  rs_R009_ueqv_R009NYYYY_partial_27_0105,
  rs_R009_ueqv_R009NYYYY_partial_27_0106,
  rs_R009_ueqv_R009NYYYY_partial_27_0107,
  rs_R009_ueqv_R009NYYYY_partial_27_0108,
  rs_R009_ueqv_R009NYYYY_partial_27_0109,
  rs_R009_ueqv_R009NYYYY_partial_27_0110,
  rs_R009_ueqv_R009NYYYY_partial_27_0111,
  rs_R009_ueqv_R009NYYYY_partial_27_0112,
  rs_R009_ueqv_R009NYYYY_partial_27_0113,
  rs_R009_ueqv_R009NYYYY_partial_27_0114,
  rs_R009_ueqv_R009NYYYY_partial_27_0115,
  rs_R009_ueqv_R009NYYYY_partial_27_0116,
  rs_R009_ueqv_R009NYYYY_partial_27_0117,
  rs_R009_ueqv_R009NYYYY_partial_27_0118,
  rs_R009_ueqv_R009NYYYY_partial_27_0119,
  rs_R009_ueqv_R009NYYYY_partial_27_0120,
  rs_R009_ueqv_R009NYYYY_partial_27_0121,
  rs_R009_ueqv_R009NYYYY_partial_27_0122,
  rs_R009_ueqv_R009NYYYY_partial_27_0123,
  rs_R009_ueqv_R009NYYYY_partial_27_0124,
  rs_R009_ueqv_R009NYYYY_partial_27_0125,
  rs_R009_ueqv_R009NYYYY_partial_27_0126,
  rs_R009_ueqv_R009NYYYY_partial_27_0127,
  rs_R009_ueqv_R009NYYYY_partial_27_0128,
  rs_R009_ueqv_R009NYYYY_partial_27_0129,
  rs_R009_ueqv_R009NYYYY_partial_27_0130,
  rs_R009_ueqv_R009NYYYY_partial_27_0131,
  rs_R009_ueqv_R009NYYYY_partial_27_0132,
  rs_R009_ueqv_R009NYYYY_partial_27_0133,
  rs_R009_ueqv_R009NYYYY_partial_27_0134,
  rs_R009_ueqv_R009NYYYY_partial_27_0135,
  rs_R009_ueqv_R009NYYYY_partial_27_0136,
  rs_R009_ueqv_R009NYYYY_partial_27_0137,
  rs_R009_ueqv_R009NYYYY_partial_27_0138,
  rs_R009_ueqv_R009NYYYY_partial_27_0139,
  rs_R009_ueqv_R009NYYYY_partial_27_0140,
  rs_R009_ueqv_R009NYYYY_partial_27_0141,
  rs_R009_ueqv_R009NYYYY_partial_27_0142,
  rs_R009_ueqv_R009NYYYY_partial_27_0143,
  rs_R009_ueqv_R009NYYYY_partial_27_0144,
  rs_R009_ueqv_R009NYYYY_partial_27_0145,
  rs_R009_ueqv_R009NYYYY_partial_27_0146,
  rs_R009_ueqv_R009NYYYY_partial_27_0147,
  rs_R009_ueqv_R009NYYYY_partial_27_0148,
  rs_R009_ueqv_R009NYYYY_partial_27_0149,
  rs_R009_ueqv_R009NYYYY_partial_27_0150,
  rs_R009_ueqv_R009NYYYY_partial_27_0151,
  rs_R009_ueqv_R009NYYYY_partial_27_0152,
  rs_R009_ueqv_R009NYYYY_partial_27_0153,
  rs_R009_ueqv_R009NYYYY_partial_27_0154,
  rs_R009_ueqv_R009NYYYY_partial_27_0155,
  rs_R009_ueqv_R009NYYYY_partial_27_0156,
  rs_R009_ueqv_R009NYYYY_partial_27_0157,
  rs_R009_ueqv_R009NYYYY_partial_27_0158,
  rs_R009_ueqv_R009NYYYY_partial_27_0159,
  rs_R009_ueqv_R009NYYYY_partial_27_0160,
  rs_R009_ueqv_R009NYYYY_partial_27_0161,
  rs_R009_ueqv_R009NYYYY_partial_27_0162,
  rs_R009_ueqv_R009NYYYY_partial_27_0163,
  rs_R009_ueqv_R009NYYYY_partial_27_0164,
  rs_R009_ueqv_R009NYYYY_partial_27_0165,
  rs_R009_ueqv_R009NYYYY_partial_27_0166,
  rs_R009_ueqv_R009NYYYY_partial_27_0167,
  rs_R009_ueqv_R009NYYYY_partial_27_0168,
  rs_R009_ueqv_R009NYYYY_partial_27_0169,
  rs_R009_ueqv_R009NYYYY_partial_27_0170,
  rs_R009_ueqv_R009NYYYY_partial_27_0171,
  rs_R009_ueqv_R009NYYYY_partial_27_0172,
  rs_R009_ueqv_R009NYYYY_partial_27_0173,
  rs_R009_ueqv_R009NYYYY_partial_27_0174,
  rs_R009_ueqv_R009NYYYY_partial_27_0175,
  rs_R009_ueqv_R009NYYYY_partial_27_0176,
  rs_R009_ueqv_R009NYYYY_partial_27_0177,
  rs_R009_ueqv_R009NYYYY_partial_27_0178,
  rs_R009_ueqv_R009NYYYY_partial_27_0179,
  rs_R009_ueqv_R009NYYYY_partial_27_0180,
  rs_R009_ueqv_R009NYYYY_partial_27_0181,
  rs_R009_ueqv_R009NYYYY_partial_27_0182,
  rs_R009_ueqv_R009NYYYY_partial_27_0183,
  rs_R009_ueqv_R009NYYYY_partial_27_0184,
  rs_R009_ueqv_R009NYYYY_partial_27_0185,
  rs_R009_ueqv_R009NYYYY_partial_27_0186,
  rs_R009_ueqv_R009NYYYY_partial_27_0187,
  rs_R009_ueqv_R009NYYYY_partial_27_0188,
  rs_R009_ueqv_R009NYYYY_partial_27_0189,
  rs_R009_ueqv_R009NYYYY_partial_27_0190,
  rs_R009_ueqv_R009NYYYY_partial_27_0191,
  rs_R009_ueqv_R009NYYYY_partial_27_0192,
  rs_R009_ueqv_R009NYYYY_partial_27_0193,
  rs_R009_ueqv_R009NYYYY_partial_27_0194,
  rs_R009_ueqv_R009NYYYY_partial_27_0195,
  rs_R009_ueqv_R009NYYYY_partial_27_0196,
  rs_R009_ueqv_R009NYYYY_partial_27_0197,
  rs_R009_ueqv_R009NYYYY_partial_27_0198,
  rs_R009_ueqv_R009NYYYY_partial_27_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_27_0100_0199 : Poly :=
[
  term ((-43027457307 : Rat) / 33189485) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((7967864 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((43027457307 : Rat) / 33189485) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7967864 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((100677317197 : Rat) / 265515880) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2268225 : Rat) / 32699) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100677317197 : Rat) / 265515880) [(5, 1), (12, 1), (15, 1)],
  term ((2268225 : Rat) / 32699) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-71432512031 : Rat) / 265515880) [(5, 1), (13, 1), (15, 2)],
  term ((1715707 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (13, 1), (15, 4)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-43027457307 : Rat) / 33189485) [(5, 1), (13, 2), (15, 3)],
  term ((7967864 : Rat) / 32699) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-100677317197 : Rat) / 531031760) [(5, 1), (14, 2), (15, 1)],
  term ((2268225 : Rat) / 65398) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((100677317197 : Rat) / 531031760) [(5, 1), (15, 1)],
  term ((-2268225 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)],
  term ((-100677317197 : Rat) / 531031760) [(5, 1), (15, 3)],
  term ((2268225 : Rat) / 65398) [(5, 1), (15, 3), (16, 1)],
  term ((-69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69099473248 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((13216320 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-155473814808 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((29736720 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14284987258 : Rat) / 6637897) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13661100 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-97337238758 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((18617220 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((77736907404 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-14868360 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((17607077318 : Rat) / 4741355) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-23573340 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 4)],
  term ((19824480 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (13, 2), (15, 3)],
  term ((-19824480 : Rat) / 32699) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((6830550 : Rat) / 32699) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (14, 2), (15, 3)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((7142493629 : Rat) / 6637897) [(6, 1), (11, 1), (15, 1)],
  term ((-6830550 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8803538659 : Rat) / 4741355) [(6, 1), (11, 1), (15, 3)],
  term ((11786670 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((25912302468 : Rat) / 33189485) [(6, 1), (11, 1), (15, 5)],
  term ((-4956120 : Rat) / 32699) [(6, 1), (11, 1), (15, 5), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 4741355) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((3558240 : Rat) / 32699) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 4741355) [(6, 1), (12, 1), (15, 2)],
  term ((-3558240 : Rat) / 32699) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((2541600 : Rat) / 32699) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(6, 1), (13, 1), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31892064576 : Rat) / 33189485) [(6, 1), (13, 1), (15, 3)],
  term ((6099840 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (14, 2), (15, 2)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 4741355) [(6, 1), (15, 2)],
  term ((1779120 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (15, 4)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((4066560 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4066560 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((4066560 : Rat) / 32699) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (15, 3)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3049920 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((996627018 : Rat) / 4741355) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1334340 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-996627018 : Rat) / 4741355) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((1334340 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-996627018 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((190620 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 4)],
  term ((-2287440 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (10, 1), (13, 2), (15, 3)],
  term ((3049920 : Rat) / 32699) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-498313509 : Rat) / 4741355) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((667170 : Rat) / 32699) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (14, 2), (15, 3)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((498313509 : Rat) / 4741355) [(7, 1), (10, 1), (15, 1)],
  term ((-667170 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1494940527 : Rat) / 33189485) [(7, 1), (10, 1), (15, 3)],
  term ((285930 : Rat) / 32699) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (15, 5)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (15, 5), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2541600 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((2541600 : Rat) / 32699) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (15, 2)],
  term ((1270800 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (15, 4)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4066560 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1016640 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((29234392528 : Rat) / 33189485) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5591520 : Rat) / 32699) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21261376384 : Rat) / 33189485) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-4066560 : Rat) / 32699) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 4741355) [(7, 1), (12, 1), (15, 1)],
  term ((7116480 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (12, 1), (15, 3)],
  term ((2541600 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((3049920 : Rat) / 32699) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(7, 1), (12, 2), (15, 1)],
  term ((-3049920 : Rat) / 32699) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 4741355) [(7, 1), (13, 1), (15, 2)],
  term ((-3558240 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((31892064576 : Rat) / 33189485) [(7, 1), (13, 1), (15, 4)],
  term ((-6099840 : Rat) / 32699) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-21261376384 : Rat) / 33189485) [(7, 1), (13, 2), (15, 3)],
  term ((4066560 : Rat) / 32699) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(7, 1), (14, 2), (15, 1)],
  term ((2795760 : Rat) / 32699) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (14, 2), (15, 3)],
  term ((2033280 : Rat) / 32699) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((14617196264 : Rat) / 33189485) [(7, 1), (15, 1)],
  term ((-2795760 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(7, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (15, 5)],
  term ((2033280 : Rat) / 32699) [(7, 1), (15, 5), (16, 1)],
  term ((-2033 : Rat) / 320) [(8, 1)],
  term ((62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((270513088 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-270513088 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29440 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115486128 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(8, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-58880 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-135256544 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (15, 4)],
  term ((11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term (-5 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term (5 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((160 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-160 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((426 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-426 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((5 : Rat) / 2) [(8, 1), (9, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((867 : Rat) / 58) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 4)],
  term (5 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(8, 1), (9, 1), (13, 2), (15, 3)],
  term ((-213 : Rat) / 29) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (15, 1)],
  term ((-213 : Rat) / 29) [(8, 1), (9, 1), (15, 3)],
  term ((-15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-1143720 : Rat) / 32699) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 2)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 4)],
  term ((-1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((121453785048 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23244328 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-121453785048 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((23244328 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((13198032864 : Rat) / 4741355) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-17724328 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5829013696 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 4)],
  term ((-5534720 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((11622164 : Rat) / 32699) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7751348 : Rat) / 6637897) [(8, 1), (11, 1), (14, 2), (15, 3)],
  term ((7360 : Rat) / 32699) [(8, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((60726892524 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)],
  term ((-11622164 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60688135784 : Rat) / 33189485) [(8, 1), (11, 1), (15, 3)],
  term ((11614804 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7751348 : Rat) / 6637897) [(8, 1), (11, 1), (15, 5)],
  term ((7360 : Rat) / 32699) [(8, 1), (11, 1), (15, 5), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7813358784 : Rat) / 4741355) [(8, 1), (11, 2), (13, 1), (15, 3)],
  term ((10386432 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (14, 2), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(8, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (15, 2)],
  term ((3886080 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (15, 4)],
  term ((-3886080 : Rat) / 32699) [(8, 1), (11, 2), (15, 4), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 3), (14, 2), (15, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 3), (14, 2), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 3)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 3), (16, 1)],
  term ((1911 : Rat) / 160) [(8, 1), (12, 1)],
  term ((144424777527 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1444652686987 : Rat) / 265515880) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2033 : Rat) / 160) [(8, 1), (12, 1), (14, 1)],
  term ((-813184131611 : Rat) / 265515880) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19473074 : Rat) / 32699) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((61 : Rat) / 80) [(8, 1), (12, 1), (14, 2)],
  term ((1626773174939 : Rat) / 531031760) [(8, 1), (12, 1), (15, 2)],
  term ((-19473074 : Rat) / 32699) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((61 : Rat) / 40) [(8, 1), (12, 2)],
  term ((-61 : Rat) / 40) [(8, 1), (12, 2), (14, 1)],
  term ((-144424777527 : Rat) / 53103176) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((17241566 : Rat) / 32699) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2875000705939 : Rat) / 1062063520) [(8, 1), (13, 1), (15, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-767654009623 : Rat) / 132757940) [(8, 1), (13, 1), (15, 3)],
  term ((36714640 : Rat) / 32699) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((144424777527 : Rat) / 26551588) [(8, 1), (13, 2), (15, 2)],
  term ((-34483132 : Rat) / 32699) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2033 : Rat) / 320) [(8, 1), (14, 2)],
  term ((813184131611 : Rat) / 531031760) [(8, 1), (14, 2), (15, 2)],
  term ((-9736537 : Rat) / 32699) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3239241681843 : Rat) / 2124127040) [(8, 1), (15, 2)],
  term ((9736537 : Rat) / 32699) [(8, 1), (15, 2), (16, 1)],
  term ((813184131611 : Rat) / 531031760) [(8, 1), (15, 4)],
  term ((-9736537 : Rat) / 32699) [(8, 1), (15, 4), (16, 1)],
  term ((89 : Rat) / 20) [(8, 2)],
  term ((-89 : Rat) / 10) [(8, 2), (12, 1)],
  term ((89 : Rat) / 10) [(8, 2), (12, 1), (14, 1)],
  term ((89 : Rat) / 10) [(8, 2), (13, 1), (15, 1)],
  term ((-89 : Rat) / 20) [(8, 2), (14, 2)],
  term ((-89 : Rat) / 20) [(8, 2), (15, 2)],
  term ((4 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-4 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((4 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 4)],
  term ((-2 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((2 : Rat) / 29) [(9, 1), (10, 1), (15, 1)],
  term ((-10 : Rat) / 29) [(9, 1), (10, 1), (15, 3)],
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (15, 5)],
  term ((-201535048 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((191360 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-235520 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-880954136 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((209024 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-38426380 : Rat) / 2844813) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((51520 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1594316204 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-60352 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1334144792 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((26496 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-100767524 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((95680 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89161976 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-50048 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((26902744 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (15, 5)],
  term ((2944 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-201535048 : Rat) / 19913691) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((191360 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 4)],
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((19213190 : Rat) / 2844813) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-25760 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-19213190 : Rat) / 2844813) [(9, 1), (11, 1), (15, 2)],
  term ((25760 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1214837594 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)],
  term ((-34592 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)],
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 2), (15, 3)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((20 : Rat) / 3) [(9, 1), (12, 1), (13, 1)],
  term ((-65 : Rat) / 12) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-573 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((880 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((2327 : Rat) / 116) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-832 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 2), (15, 3)],
  term ((-12101 : Rat) / 696) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1037 : Rat) / 174) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-583 : Rat) / 116) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 3)],
  term ((15599 : Rat) / 696) [(9, 1), (12, 1), (15, 1)],
  term ((-3487 : Rat) / 348) [(9, 1), (12, 1), (15, 3)],
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (15, 5)],
  term ((-5 : Rat) / 2) [(9, 1), (12, 2), (13, 1)],
  term ((5 : Rat) / 2) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((583 : Rat) / 58) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((56 : Rat) / 29) [(9, 1), (12, 2), (14, 1), (15, 3)],
  term ((-583 : Rat) / 58) [(9, 1), (12, 2), (15, 1)],
  term ((-56 : Rat) / 29) [(9, 1), (12, 2), (15, 3)],
  term ((-65 : Rat) / 24) [(9, 1), (13, 1)],
  term ((65 : Rat) / 24) [(9, 1), (13, 1), (14, 2)],
  term ((573 : Rat) / 116) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-440 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((-6827 : Rat) / 348) [(9, 1), (13, 1), (15, 2)],
  term ((1851 : Rat) / 116) [(9, 1), (13, 1), (15, 4)],
  term ((-440 : Rat) / 87) [(9, 1), (13, 1), (15, 6)],
  term ((-65 : Rat) / 12) [(9, 1), (13, 2), (15, 1)],
  term ((-573 : Rat) / 58) [(9, 1), (13, 2), (15, 3)],
  term ((880 : Rat) / 87) [(9, 1), (13, 2), (15, 5)],
  term ((12101 : Rat) / 1392) [(9, 1), (14, 2), (15, 1)],
  term ((-1037 : Rat) / 348) [(9, 1), (14, 2), (15, 3)],
  term ((-12101 : Rat) / 1392) [(9, 1), (15, 1)],
  term ((16249 : Rat) / 1392) [(9, 1), (15, 3)],
  term ((-1037 : Rat) / 348) [(9, 1), (15, 5)],
  term ((217037744 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-288512 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-217037744 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((288512 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((217037744 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-288512 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 4)],
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-108518872 : Rat) / 4741355) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((144256 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((108518872 : Rat) / 4741355) [(10, 1), (11, 1), (15, 1)],
  term ((-144256 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1751804648 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((-332672 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)],
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 4)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 4), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYYYY_block_27_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_27_0100_0199
      rs_R009_ueqv_R009NYYYY_block_27_0100_0199 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
