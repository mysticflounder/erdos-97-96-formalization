/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 4:1200-1299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_04_1200_1299 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 1200 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1200 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1200 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1200 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1200_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1200
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1201 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1201 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1201 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1201_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1201
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1202 : Poly :=
[
  term ((47246080 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1202 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1202 : Poly :=
[
  term ((-94492160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((47246080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((47246080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-47246080 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((94492160 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1)],
  term ((-47246080 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1202_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1202
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1203 : Poly :=
[
  term ((-242100544 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1203 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1203 : Poly :=
[
  term ((484201088 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-242100544 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-242100544 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((242100544 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-484201088 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((242100544 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1203_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1203
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1204 : Poly :=
[
  term ((1179680 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1204 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1204 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1204_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1204
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1205 : Poly :=
[
  term ((-16485036 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1205 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1205 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1205_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1205
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1206 : Poly :=
[
  term ((-1769520 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 1206 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1206 : Poly :=
[
  term ((3539040 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1769520 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1769520 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-3539040 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((1769520 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((1769520 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1206_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1206
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1207 : Poly :=
[
  term ((24727554 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1207 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1207 : Poly :=
[
  term ((-49455108 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((24727554 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((24727554 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((49455108 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24727554 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24727554 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1207_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1207
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1208 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1208 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1208 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1208_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1208
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1209 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1209 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1209 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1209_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1209
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1210 : Poly :=
[
  term ((-1179680 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 1210 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1210 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((1179680 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1210_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1210
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1211 : Poly :=
[
  term ((16485036 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1211 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1211 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1211_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1211
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1212 : Poly :=
[
  term ((29305600 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 1212 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1212 : Poly :=
[
  term ((-58611200 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((29305600 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((29305600 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-29305600 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((58611200 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-29305600 : Rat) / 158397) [(5, 1), (6, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1212_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1212
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1213 : Poly :=
[
  term ((-229293952 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1213 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1213 : Poly :=
[
  term ((458587904 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-229293952 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-229293952 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((229293952 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-458587904 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((229293952 : Rat) / 385571) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1213_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1213
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1214 : Poly :=
[
  term ((-47246080 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 1214 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1214 : Poly :=
[
  term ((94492160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-47246080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-47246080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((47246080 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1)],
  term ((-94492160 : Rat) / 158397) [(5, 1), (6, 1), (12, 3), (15, 1)],
  term ((47246080 : Rat) / 158397) [(5, 1), (6, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1214_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1214
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1215 : Poly :=
[
  term ((242100544 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1215 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1215 : Poly :=
[
  term ((-484201088 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((242100544 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((242100544 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-242100544 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((484201088 : Rat) / 385571) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((-242100544 : Rat) / 385571) [(5, 1), (6, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1215_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1215
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1216 : Poly :=
[
  term ((-322720 : Rat) / 158397) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1216 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1216 : Poly :=
[
  term ((645440 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-645440 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((322720 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((322720 : Rat) / 158397) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1216_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1216
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1217 : Poly :=
[
  term ((-7342580 : Rat) / 385571) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1217 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1217 : Poly :=
[
  term ((14685160 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14685160 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1217_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1217
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1218 : Poly :=
[
  term ((14240080 : Rat) / 158397) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1218 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1218 : Poly :=
[
  term ((-28480160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((14240080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((14240080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((28480160 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-14240080 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-14240080 : Rat) / 158397) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1218_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1218
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1219 : Poly :=
[
  term ((7154 : Rat) / 385571) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1219 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1219 : Poly :=
[
  term ((-14308 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((7154 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((7154 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14308 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7154 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7154 : Rat) / 385571) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1219_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1219
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1220 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1220 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1220 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((9437440 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1220_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1220
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1221 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1221 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1221 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1221_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1221
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1222 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1222 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1222 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1222_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1222
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1223 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1223 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1223 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1223_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1223
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1224 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 1), (15, 1)]
]

/-- Partial product 1224 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1224 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1224_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1224
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1225 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1225 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1225 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1225_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1225
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1226 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 2), (15, 1)]
]

/-- Partial product 1226 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1226 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 2), (13, 2), (15, 1)],
  term ((9437440 : Rat) / 52799) [(5, 1), (6, 2), (12, 3), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1226_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1226
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1227 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1227 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1227 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(5, 1), (6, 2), (12, 3), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1227_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1227
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1228 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1228 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1228 : Poly :=
[
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (15, 1)],
  term ((66179840 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1228_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1228
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1229 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1229 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1229 : Poly :=
[
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1229_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1229
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1230 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1230 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1230 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1230_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1230
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1231 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1231 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1231 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1231_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1231
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1232 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 1232 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1232 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(5, 1), (7, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1232_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1232
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1233 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1233 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1233 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1233_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1233
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1234 : Poly :=
[
  term ((-37600 : Rat) / 4281) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 1234 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1234 : Poly :=
[
  term ((75200 : Rat) / 4281) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-37600 : Rat) / 4281) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-37600 : Rat) / 4281) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-75200 : Rat) / 4281) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((37600 : Rat) / 4281) [(5, 1), (7, 1), (12, 2), (15, 2)],
  term ((37600 : Rat) / 4281) [(5, 1), (7, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1234_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1234
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1235 : Poly :=
[
  term ((33017764 : Rat) / 385571) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1235 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1235 : Poly :=
[
  term ((-66035528 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((33017764 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((33017764 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((66035528 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33017764 : Rat) / 385571) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-33017764 : Rat) / 385571) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1235_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1235
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1236 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1236 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1236 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-5562880 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1236_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1236
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1237 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1237 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1237 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1237_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1237
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1238 : Poly :=
[
  term ((16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1238 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1238 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((16544960 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((16544960 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1238_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1238
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1239 : Poly :=
[
  term ((-88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1239 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1239 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1239_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1239
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1240 : Poly :=
[
  term ((8272480 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 1240 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1240 : Poly :=
[
  term ((-16544960 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((8272480 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((8272480 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8272480 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-8272480 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1240_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1240
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1241 : Poly :=
[
  term ((-44040100 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1241 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1241 : Poly :=
[
  term ((88080200 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-44040100 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-44040100 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((44040100 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((44040100 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1241_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1241
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1242 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1242 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1242 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-20725760 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1242_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1242
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1243 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1243 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1243 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((84368000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1243_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1243
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1244 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 1244 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1244 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1244_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1244
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1245 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1245 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1245 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1245_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1245
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1246 : Poly :=
[
  term ((26471936 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1246 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1246 : Poly :=
[
  term ((-52943872 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((26471936 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((26471936 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-26471936 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((52943872 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-26471936 : Rat) / 158397) [(5, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1246_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1246
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1247 : Poly :=
[
  term ((-140928320 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1247 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1247 : Poly :=
[
  term ((281856640 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140928320 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140928320 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((140928320 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-281856640 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((140928320 : Rat) / 385571) [(5, 1), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1247_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1247
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1248 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1248 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1248 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((8028160 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1248_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1248
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1249 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1249 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1249 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1249_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1249
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1250 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1250 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1250 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 1), (8, 1), (12, 3), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1250_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1250
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1251 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1251 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1251 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(5, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1251_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1251
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1252 : Poly :=
[
  term ((-17548448 : Rat) / 158397) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1252 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1252 : Poly :=
[
  term ((35096896 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-17548448 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-17548448 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-35096896 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((17548448 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((17548448 : Rat) / 158397) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1252_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1252
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1253 : Poly :=
[
  term ((68788220 : Rat) / 385571) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1253 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1253 : Poly :=
[
  term ((-137576440 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((68788220 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((68788220 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((137576440 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68788220 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-68788220 : Rat) / 385571) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1253_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1253
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1254 : Poly :=
[
  term ((15421424 : Rat) / 158397) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 1254 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1254 : Poly :=
[
  term ((-30842848 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((15421424 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((15421424 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((30842848 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-15421424 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-15421424 : Rat) / 158397) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1254_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1254
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1255 : Poly :=
[
  term ((-35009690 : Rat) / 385571) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1255 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1255 : Poly :=
[
  term ((70019380 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35009690 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35009690 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-70019380 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((35009690 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((35009690 : Rat) / 385571) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1255_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1255
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1256 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1256 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1256 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((4460800 : Rat) / 158397) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((4460800 : Rat) / 158397) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((8921600 : Rat) / 158397) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1256_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1256
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1257 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1257 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1257 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((113392576 : Rat) / 385571) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1257_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1257
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1258 : Poly :=
[
  term ((-27657728 : Rat) / 158397) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 1258 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1258 : Poly :=
[
  term ((55315456 : Rat) / 158397) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-27657728 : Rat) / 158397) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((-27657728 : Rat) / 158397) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((-55315456 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((27657728 : Rat) / 158397) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((27657728 : Rat) / 158397) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1258_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1258
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1259 : Poly :=
[
  term ((22844240 : Rat) / 385571) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1259 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1259 : Poly :=
[
  term ((-45688480 : Rat) / 385571) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((22844240 : Rat) / 385571) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((22844240 : Rat) / 385571) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((45688480 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22844240 : Rat) / 385571) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-22844240 : Rat) / 385571) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1259_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1259
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1260 : Poly :=
[
  term ((3977984 : Rat) / 52799) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 1260 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1260 : Poly :=
[
  term ((-7955968 : Rat) / 52799) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((3977984 : Rat) / 52799) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((3977984 : Rat) / 52799) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((7955968 : Rat) / 52799) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-3977984 : Rat) / 52799) [(5, 1), (9, 2), (12, 2), (15, 1)],
  term ((-3977984 : Rat) / 52799) [(5, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1260_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1260
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1261 : Poly :=
[
  term ((-14264160 : Rat) / 385571) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1261 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1261 : Poly :=
[
  term ((28528320 : Rat) / 385571) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14264160 : Rat) / 385571) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14264160 : Rat) / 385571) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-28528320 : Rat) / 385571) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((14264160 : Rat) / 385571) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((14264160 : Rat) / 385571) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1261_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1261
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1262 : Poly :=
[
  term ((-14210240 : Rat) / 158397) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1262 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1262 : Poly :=
[
  term ((28420480 : Rat) / 158397) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-14210240 : Rat) / 158397) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-14210240 : Rat) / 158397) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28420480 : Rat) / 158397) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((14210240 : Rat) / 158397) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((14210240 : Rat) / 158397) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1262_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1262
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1263 : Poly :=
[
  term ((85788680 : Rat) / 385571) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1263 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1263 : Poly :=
[
  term ((-171577360 : Rat) / 385571) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((85788680 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((85788680 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((171577360 : Rat) / 385571) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85788680 : Rat) / 385571) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-85788680 : Rat) / 385571) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1263_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1263
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1264 : Poly :=
[
  term ((-3157120 : Rat) / 158397) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 1264 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1264 : Poly :=
[
  term ((6314240 : Rat) / 158397) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((-3157120 : Rat) / 158397) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-3157120 : Rat) / 158397) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-6314240 : Rat) / 158397) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((3157120 : Rat) / 158397) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((3157120 : Rat) / 158397) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1264_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1264
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1265 : Poly :=
[
  term ((-20769224 : Rat) / 385571) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1265 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1265 : Poly :=
[
  term ((41538448 : Rat) / 385571) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20769224 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20769224 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41538448 : Rat) / 385571) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((20769224 : Rat) / 385571) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((20769224 : Rat) / 385571) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1265_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1265
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1266 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1266 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1266 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((20725760 : Rat) / 158397) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1266_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1266
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1267 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1267 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1267 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1267_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1267
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1268 : Poly :=
[
  term ((-60664096 : Rat) / 158397) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1268 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1268 : Poly :=
[
  term ((121328192 : Rat) / 158397) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-60664096 : Rat) / 158397) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-60664096 : Rat) / 158397) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((60664096 : Rat) / 158397) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-121328192 : Rat) / 158397) [(5, 1), (12, 2), (15, 1)],
  term ((60664096 : Rat) / 158397) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1268_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1268
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1269 : Poly :=
[
  term ((260307724 : Rat) / 385571) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1269 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1269 : Poly :=
[
  term ((-520615448 : Rat) / 385571) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((260307724 : Rat) / 385571) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((260307724 : Rat) / 385571) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-260307724 : Rat) / 385571) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((520615448 : Rat) / 385571) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-260307724 : Rat) / 385571) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1269_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1269
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1270 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 1270 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1270 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(2, 1), (5, 1), (12, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (5, 1), (12, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (5, 1), (12, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 1), (13, 2), (15, 3)],
  term ((-8028160 : Rat) / 158397) [(5, 1), (12, 2), (15, 3)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1270_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1270
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1271 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1271 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1271 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((39892480 : Rat) / 385571) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1271_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1271
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1272 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 1272 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1272 : Poly :=
[
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 1), (12, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((66179840 : Rat) / 158397) [(5, 1), (12, 3), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1272_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1272
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1273 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1273 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1273 : Poly :=
[
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1273_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1273
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1274 : Poly :=
[
  term ((4227020 : Rat) / 158397) [(5, 1), (13, 1)]
]

/-- Partial product 1274 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1274 : Poly :=
[
  term ((-8454040 : Rat) / 158397) [(2, 1), (5, 1), (13, 1)],
  term ((4227020 : Rat) / 158397) [(2, 2), (5, 1), (13, 1)],
  term ((4227020 : Rat) / 158397) [(3, 2), (5, 1), (13, 1)],
  term ((8454040 : Rat) / 158397) [(5, 1), (12, 1), (13, 1)],
  term ((-4227020 : Rat) / 158397) [(5, 1), (12, 2), (13, 1)],
  term ((-4227020 : Rat) / 158397) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1274_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1274
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1275 : Poly :=
[
  term ((9494816 : Rat) / 158397) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1275 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1275 : Poly :=
[
  term ((-18989632 : Rat) / 158397) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((9494816 : Rat) / 158397) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((9494816 : Rat) / 158397) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((18989632 : Rat) / 158397) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9494816 : Rat) / 158397) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9494816 : Rat) / 158397) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1275_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1275
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1276 : Poly :=
[
  term ((-49470686 : Rat) / 385571) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1276 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1276 : Poly :=
[
  term ((98941372 : Rat) / 385571) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49470686 : Rat) / 385571) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49470686 : Rat) / 385571) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98941372 : Rat) / 385571) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((49470686 : Rat) / 385571) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((49470686 : Rat) / 385571) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1276_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1276
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1277 : Poly :=
[
  term ((1528318 : Rat) / 158397) [(5, 1), (15, 1)]
]

/-- Partial product 1277 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1277 : Poly :=
[
  term ((-3056636 : Rat) / 158397) [(2, 1), (5, 1), (15, 1)],
  term ((1528318 : Rat) / 158397) [(2, 2), (5, 1), (15, 1)],
  term ((1528318 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)],
  term ((3056636 : Rat) / 158397) [(5, 1), (12, 1), (15, 1)],
  term ((-1528318 : Rat) / 158397) [(5, 1), (12, 2), (15, 1)],
  term ((-1528318 : Rat) / 158397) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1277_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1277
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1278 : Poly :=
[
  term ((3865786 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1278 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1278 : Poly :=
[
  term ((-7731572 : Rat) / 385571) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((3865786 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((3865786 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((7731572 : Rat) / 385571) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3865786 : Rat) / 385571) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3865786 : Rat) / 385571) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1278_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1278
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1279 : Poly :=
[
  term ((-3399680 : Rat) / 158397) [(5, 1), (15, 3)]
]

/-- Partial product 1279 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1279 : Poly :=
[
  term ((6799360 : Rat) / 158397) [(2, 1), (5, 1), (15, 3)],
  term ((-3399680 : Rat) / 158397) [(2, 2), (5, 1), (15, 3)],
  term ((-3399680 : Rat) / 158397) [(3, 2), (5, 1), (15, 3)],
  term ((-6799360 : Rat) / 158397) [(5, 1), (12, 1), (15, 3)],
  term ((3399680 : Rat) / 158397) [(5, 1), (12, 2), (15, 3)],
  term ((3399680 : Rat) / 158397) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1279_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1279
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1280 : Poly :=
[
  term ((135488 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 1280 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1280 : Poly :=
[
  term ((-270976 : Rat) / 385571) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((135488 : Rat) / 385571) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((135488 : Rat) / 385571) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((270976 : Rat) / 385571) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-135488 : Rat) / 385571) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-135488 : Rat) / 385571) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1280_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1280
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1281 : Poly :=
[
  term ((2113510 : Rat) / 158397) [(5, 2)]
]

/-- Partial product 1281 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1281 : Poly :=
[
  term ((-4227020 : Rat) / 158397) [(2, 1), (5, 2)],
  term ((2113510 : Rat) / 158397) [(2, 2), (5, 2)],
  term ((2113510 : Rat) / 158397) [(3, 2), (5, 2)],
  term ((4227020 : Rat) / 158397) [(5, 2), (12, 1)],
  term ((-2113510 : Rat) / 158397) [(5, 2), (12, 2)],
  term ((-2113510 : Rat) / 158397) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1281_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1281
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1282 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1282 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1282 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((9437440 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1282_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1282
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1283 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1283 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1283 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1283_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1283
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1284 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (15, 2)]
]

/-- Partial product 1284 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1284 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-9437440 : Rat) / 52799) [(5, 2), (6, 1), (12, 2), (15, 2)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1284_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1284
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1285 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1285 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1285 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((131880288 : Rat) / 385571) [(5, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1285_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1285
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1286 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1286 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1286 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-66179840 : Rat) / 158397) [(5, 2), (8, 1), (12, 2), (15, 2)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1286_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1286
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1287 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1287 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1287 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((352320800 : Rat) / 385571) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1287_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1287
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1288 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(5, 2), (12, 1), (15, 2)]
]

/-- Partial product 1288 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1288 : Poly :=
[
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 2), (12, 1), (15, 2)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 2), (12, 1), (15, 2)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 2), (12, 1), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 1), (13, 2), (15, 2)],
  term ((66179840 : Rat) / 158397) [(5, 2), (12, 2), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1288_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1288
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1289 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1289 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1289 : Poly :=
[
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1289_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1289
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1290 : Poly :=
[
  term ((-845404 : Rat) / 158397) [(5, 2), (14, 1)]
]

/-- Partial product 1290 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1290 : Poly :=
[
  term ((1690808 : Rat) / 158397) [(2, 1), (5, 2), (14, 1)],
  term ((-845404 : Rat) / 158397) [(2, 2), (5, 2), (14, 1)],
  term ((-845404 : Rat) / 158397) [(3, 2), (5, 2), (14, 1)],
  term ((-1690808 : Rat) / 158397) [(5, 2), (12, 1), (14, 1)],
  term ((845404 : Rat) / 158397) [(5, 2), (12, 2), (14, 1)],
  term ((845404 : Rat) / 158397) [(5, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1290_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1290
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1291 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(5, 2), (15, 2)]
]

/-- Partial product 1291 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1291 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(2, 1), (5, 2), (15, 2)],
  term ((5980160 : Rat) / 52799) [(2, 2), (5, 2), (15, 2)],
  term ((5980160 : Rat) / 52799) [(3, 2), (5, 2), (15, 2)],
  term ((11960320 : Rat) / 52799) [(5, 2), (12, 1), (15, 2)],
  term ((-5980160 : Rat) / 52799) [(5, 2), (12, 2), (15, 2)],
  term ((-5980160 : Rat) / 52799) [(5, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1291_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1291
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1292 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 1292 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1292 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1292_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1292
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1293 : Poly :=
[
  term ((-2958914 : Rat) / 158397) [(6, 1)]
]

/-- Partial product 1293 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1293 : Poly :=
[
  term ((5917828 : Rat) / 158397) [(2, 1), (6, 1)],
  term ((-2958914 : Rat) / 158397) [(2, 2), (6, 1)],
  term ((-2958914 : Rat) / 158397) [(3, 2), (6, 1)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 2)],
  term ((2958914 : Rat) / 158397) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1293_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1293
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1294 : Poly :=
[
  term ((2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1294 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1294 : Poly :=
[
  term ((-4073280 : Rat) / 52799) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((4073280 : Rat) / 52799) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1294_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1294
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1295 : Poly :=
[
  term ((-54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1295 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1295 : Poly :=
[
  term ((109995624 : Rat) / 385571) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109995624 : Rat) / 385571) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1295_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1295
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1296 : Poly :=
[
  term ((-2036640 : Rat) / 52799) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 1296 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1296 : Poly :=
[
  term ((4073280 : Rat) / 52799) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4073280 : Rat) / 52799) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((2036640 : Rat) / 52799) [(6, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1296_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1296
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1297 : Poly :=
[
  term ((54997812 : Rat) / 385571) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1297 : Poly :=
[
  term ((-109995624 : Rat) / 385571) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((109995624 : Rat) / 385571) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1297_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1297
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1298 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1298 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1298 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1298_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1298
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1299 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1299 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1299 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1299_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1299
        rs_R005_ueqv_R005NYN_generator_04_1200_1299 =
      rs_R005_ueqv_R005NYN_partial_04_1299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_04_1200_1299 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_04_1200,
  rs_R005_ueqv_R005NYN_partial_04_1201,
  rs_R005_ueqv_R005NYN_partial_04_1202,
  rs_R005_ueqv_R005NYN_partial_04_1203,
  rs_R005_ueqv_R005NYN_partial_04_1204,
  rs_R005_ueqv_R005NYN_partial_04_1205,
  rs_R005_ueqv_R005NYN_partial_04_1206,
  rs_R005_ueqv_R005NYN_partial_04_1207,
  rs_R005_ueqv_R005NYN_partial_04_1208,
  rs_R005_ueqv_R005NYN_partial_04_1209,
  rs_R005_ueqv_R005NYN_partial_04_1210,
  rs_R005_ueqv_R005NYN_partial_04_1211,
  rs_R005_ueqv_R005NYN_partial_04_1212,
  rs_R005_ueqv_R005NYN_partial_04_1213,
  rs_R005_ueqv_R005NYN_partial_04_1214,
  rs_R005_ueqv_R005NYN_partial_04_1215,
  rs_R005_ueqv_R005NYN_partial_04_1216,
  rs_R005_ueqv_R005NYN_partial_04_1217,
  rs_R005_ueqv_R005NYN_partial_04_1218,
  rs_R005_ueqv_R005NYN_partial_04_1219,
  rs_R005_ueqv_R005NYN_partial_04_1220,
  rs_R005_ueqv_R005NYN_partial_04_1221,
  rs_R005_ueqv_R005NYN_partial_04_1222,
  rs_R005_ueqv_R005NYN_partial_04_1223,
  rs_R005_ueqv_R005NYN_partial_04_1224,
  rs_R005_ueqv_R005NYN_partial_04_1225,
  rs_R005_ueqv_R005NYN_partial_04_1226,
  rs_R005_ueqv_R005NYN_partial_04_1227,
  rs_R005_ueqv_R005NYN_partial_04_1228,
  rs_R005_ueqv_R005NYN_partial_04_1229,
  rs_R005_ueqv_R005NYN_partial_04_1230,
  rs_R005_ueqv_R005NYN_partial_04_1231,
  rs_R005_ueqv_R005NYN_partial_04_1232,
  rs_R005_ueqv_R005NYN_partial_04_1233,
  rs_R005_ueqv_R005NYN_partial_04_1234,
  rs_R005_ueqv_R005NYN_partial_04_1235,
  rs_R005_ueqv_R005NYN_partial_04_1236,
  rs_R005_ueqv_R005NYN_partial_04_1237,
  rs_R005_ueqv_R005NYN_partial_04_1238,
  rs_R005_ueqv_R005NYN_partial_04_1239,
  rs_R005_ueqv_R005NYN_partial_04_1240,
  rs_R005_ueqv_R005NYN_partial_04_1241,
  rs_R005_ueqv_R005NYN_partial_04_1242,
  rs_R005_ueqv_R005NYN_partial_04_1243,
  rs_R005_ueqv_R005NYN_partial_04_1244,
  rs_R005_ueqv_R005NYN_partial_04_1245,
  rs_R005_ueqv_R005NYN_partial_04_1246,
  rs_R005_ueqv_R005NYN_partial_04_1247,
  rs_R005_ueqv_R005NYN_partial_04_1248,
  rs_R005_ueqv_R005NYN_partial_04_1249,
  rs_R005_ueqv_R005NYN_partial_04_1250,
  rs_R005_ueqv_R005NYN_partial_04_1251,
  rs_R005_ueqv_R005NYN_partial_04_1252,
  rs_R005_ueqv_R005NYN_partial_04_1253,
  rs_R005_ueqv_R005NYN_partial_04_1254,
  rs_R005_ueqv_R005NYN_partial_04_1255,
  rs_R005_ueqv_R005NYN_partial_04_1256,
  rs_R005_ueqv_R005NYN_partial_04_1257,
  rs_R005_ueqv_R005NYN_partial_04_1258,
  rs_R005_ueqv_R005NYN_partial_04_1259,
  rs_R005_ueqv_R005NYN_partial_04_1260,
  rs_R005_ueqv_R005NYN_partial_04_1261,
  rs_R005_ueqv_R005NYN_partial_04_1262,
  rs_R005_ueqv_R005NYN_partial_04_1263,
  rs_R005_ueqv_R005NYN_partial_04_1264,
  rs_R005_ueqv_R005NYN_partial_04_1265,
  rs_R005_ueqv_R005NYN_partial_04_1266,
  rs_R005_ueqv_R005NYN_partial_04_1267,
  rs_R005_ueqv_R005NYN_partial_04_1268,
  rs_R005_ueqv_R005NYN_partial_04_1269,
  rs_R005_ueqv_R005NYN_partial_04_1270,
  rs_R005_ueqv_R005NYN_partial_04_1271,
  rs_R005_ueqv_R005NYN_partial_04_1272,
  rs_R005_ueqv_R005NYN_partial_04_1273,
  rs_R005_ueqv_R005NYN_partial_04_1274,
  rs_R005_ueqv_R005NYN_partial_04_1275,
  rs_R005_ueqv_R005NYN_partial_04_1276,
  rs_R005_ueqv_R005NYN_partial_04_1277,
  rs_R005_ueqv_R005NYN_partial_04_1278,
  rs_R005_ueqv_R005NYN_partial_04_1279,
  rs_R005_ueqv_R005NYN_partial_04_1280,
  rs_R005_ueqv_R005NYN_partial_04_1281,
  rs_R005_ueqv_R005NYN_partial_04_1282,
  rs_R005_ueqv_R005NYN_partial_04_1283,
  rs_R005_ueqv_R005NYN_partial_04_1284,
  rs_R005_ueqv_R005NYN_partial_04_1285,
  rs_R005_ueqv_R005NYN_partial_04_1286,
  rs_R005_ueqv_R005NYN_partial_04_1287,
  rs_R005_ueqv_R005NYN_partial_04_1288,
  rs_R005_ueqv_R005NYN_partial_04_1289,
  rs_R005_ueqv_R005NYN_partial_04_1290,
  rs_R005_ueqv_R005NYN_partial_04_1291,
  rs_R005_ueqv_R005NYN_partial_04_1292,
  rs_R005_ueqv_R005NYN_partial_04_1293,
  rs_R005_ueqv_R005NYN_partial_04_1294,
  rs_R005_ueqv_R005NYN_partial_04_1295,
  rs_R005_ueqv_R005NYN_partial_04_1296,
  rs_R005_ueqv_R005NYN_partial_04_1297,
  rs_R005_ueqv_R005NYN_partial_04_1298,
  rs_R005_ueqv_R005NYN_partial_04_1299
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_04_1200_1299 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-94492160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((484201088 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3539040 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-49455108 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-58611200 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((458587904 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((94492160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-484201088 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28480160 : Rat) / 158397) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-14308 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((75200 : Rat) / 4281) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-66035528 : Rat) / 385571) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((5562880 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((148702016 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-52943872 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((281856640 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((35096896 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-137576440 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30842848 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((70019380 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-113392576 : Rat) / 385571) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((55315456 : Rat) / 158397) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-45688480 : Rat) / 385571) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7955968 : Rat) / 52799) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((28528320 : Rat) / 385571) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((28420480 : Rat) / 158397) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-171577360 : Rat) / 385571) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6314240 : Rat) / 158397) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((41538448 : Rat) / 385571) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((121328192 : Rat) / 158397) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-520615448 : Rat) / 385571) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(2, 1), (5, 1), (12, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8454040 : Rat) / 158397) [(2, 1), (5, 1), (13, 1)],
  term ((-18989632 : Rat) / 158397) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((98941372 : Rat) / 385571) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3056636 : Rat) / 158397) [(2, 1), (5, 1), (15, 1)],
  term ((-7731572 : Rat) / 385571) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((6799360 : Rat) / 158397) [(2, 1), (5, 1), (15, 3)],
  term ((-270976 : Rat) / 385571) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-4227020 : Rat) / 158397) [(2, 1), (5, 2)],
  term ((-9437440 : Rat) / 52799) [(2, 1), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(2, 1), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(2, 1), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(2, 1), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((66179840 : Rat) / 158397) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-352320800 : Rat) / 385571) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(2, 1), (5, 2), (12, 1), (15, 2)],
  term ((352320800 : Rat) / 385571) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((1690808 : Rat) / 158397) [(2, 1), (5, 2), (14, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 1), (5, 2), (15, 2)],
  term ((25613184 : Rat) / 385571) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((5917828 : Rat) / 158397) [(2, 1), (6, 1)],
  term ((-4073280 : Rat) / 52799) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((109995624 : Rat) / 385571) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4073280 : Rat) / 52799) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-109995624 : Rat) / 385571) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((47246080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-242100544 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1769520 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((24727554 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(2, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((29305600 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-229293952 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47246080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((242100544 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((14240080 : Rat) / 158397) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((7154 : Rat) / 385571) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37600 : Rat) / 4281) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((33017764 : Rat) / 385571) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((16544960 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8272480 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-44040100 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((26471936 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-140928320 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17548448 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((68788220 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((15421424 : Rat) / 158397) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-35009690 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((56696288 : Rat) / 385571) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27657728 : Rat) / 158397) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((22844240 : Rat) / 385571) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((3977984 : Rat) / 52799) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((-14264160 : Rat) / 385571) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14210240 : Rat) / 158397) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((85788680 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3157120 : Rat) / 158397) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-20769224 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-60664096 : Rat) / 158397) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((260307724 : Rat) / 385571) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (5, 1), (12, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(2, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 1), (12, 2), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((4227020 : Rat) / 158397) [(2, 2), (5, 1), (13, 1)],
  term ((9494816 : Rat) / 158397) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-49470686 : Rat) / 385571) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1528318 : Rat) / 158397) [(2, 2), (5, 1), (15, 1)],
  term ((3865786 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3399680 : Rat) / 158397) [(2, 2), (5, 1), (15, 3)],
  term ((135488 : Rat) / 385571) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((2113510 : Rat) / 158397) [(2, 2), (5, 2)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 2), (12, 1), (15, 2)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-845404 : Rat) / 158397) [(2, 2), (5, 2), (14, 1)],
  term ((5980160 : Rat) / 52799) [(2, 2), (5, 2), (15, 2)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(2, 2), (6, 1)],
  term ((2036640 : Rat) / 52799) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((47246080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-242100544 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1769520 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((24727554 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((29305600 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-229293952 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47246080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((242100544 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((14240080 : Rat) / 158397) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((7154 : Rat) / 385571) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37600 : Rat) / 4281) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((33017764 : Rat) / 385571) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((16544960 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8272480 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-44040100 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((26471936 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-140928320 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17548448 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((68788220 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((15421424 : Rat) / 158397) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-35009690 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((56696288 : Rat) / 385571) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27657728 : Rat) / 158397) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((22844240 : Rat) / 385571) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((3977984 : Rat) / 52799) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-14264160 : Rat) / 385571) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14210240 : Rat) / 158397) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((85788680 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3157120 : Rat) / 158397) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-20769224 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-60664096 : Rat) / 158397) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((260307724 : Rat) / 385571) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (5, 1), (12, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((4227020 : Rat) / 158397) [(3, 2), (5, 1), (13, 1)],
  term ((9494816 : Rat) / 158397) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-49470686 : Rat) / 385571) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1528318 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)],
  term ((3865786 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3399680 : Rat) / 158397) [(3, 2), (5, 1), (15, 3)],
  term ((135488 : Rat) / 385571) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((2113510 : Rat) / 158397) [(3, 2), (5, 2)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (12, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 2), (12, 1), (15, 2)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-845404 : Rat) / 158397) [(3, 2), (5, 2), (14, 1)],
  term ((5980160 : Rat) / 52799) [(3, 2), (5, 2), (15, 2)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(3, 2), (6, 1)],
  term ((2036640 : Rat) / 52799) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3539040 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((49455108 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47246080 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((242100544 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-60871280 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((327593246 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((42527360 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1)],
  term ((-660361488 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-47246080 : Rat) / 158397) [(5, 1), (6, 1), (8, 1), (12, 4), (15, 1)],
  term ((242100544 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 4), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1769520 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-24727554 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29305600 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((229293952 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-645440 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14685160 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28480160 : Rat) / 158397) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((14308 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((47246080 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1)],
  term ((-242100544 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((7342580 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((44371120 : Rat) / 158397) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-458595058 : Rat) / 385571) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41265920 : Rat) / 52799) [(5, 1), (6, 1), (12, 3), (15, 1)],
  term ((713495040 : Rat) / 385571) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((47246080 : Rat) / 158397) [(5, 1), (6, 1), (12, 4), (15, 1)],
  term ((-242100544 : Rat) / 385571) [(5, 1), (6, 1), (12, 4), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((7342580 : Rat) / 385571) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14240080 : Rat) / 158397) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-7154 : Rat) / 385571) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14156160 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1)],
  term ((197820432 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (8, 1), (12, 4), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (8, 1), (12, 4), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 2), (13, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((14156160 : Rat) / 52799) [(5, 1), (6, 2), (12, 3), (15, 1)],
  term ((-197820432 : Rat) / 385571) [(5, 1), (6, 2), (12, 3), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 2), (12, 4), (15, 1)],
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 2), (12, 4), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (15, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((66179840 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (7, 1), (8, 1), (12, 3), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (7, 1), (8, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-75200 : Rat) / 4281) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((66035528 : Rat) / 385571) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48239360 : Rat) / 158397) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((339514208 : Rat) / 385571) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((37600 : Rat) / 4281) [(5, 1), (7, 1), (12, 2), (15, 2)],
  term ((-33017764 : Rat) / 385571) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((37600 : Rat) / 4281) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((-33017764 : Rat) / 385571) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((5980160 : Rat) / 52799) [(5, 1), (7, 1), (13, 3), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 3), (15, 2)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 3), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8272480 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((44040100 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8272480 : Rat) / 158397) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((44040100 : Rat) / 385571) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16056320 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((79784960 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 3), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 3), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-26471936 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((140928320 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-35096896 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((137576440 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30842848 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-70019380 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((17548448 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-68788220 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37522448 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-246846950 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(5, 1), (8, 1), (12, 2), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-92651776 : Rat) / 158397) [(5, 1), (8, 1), (12, 3), (15, 1)],
  term ((493249120 : Rat) / 385571) [(5, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 3), (15, 3)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 3), (15, 3), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 4), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 4), (15, 1), (16, 1)],
  term ((17548448 : Rat) / 158397) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-68788220 : Rat) / 385571) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15421424 : Rat) / 158397) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((35009690 : Rat) / 385571) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-55315456 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((45688480 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((36579328 : Rat) / 158397) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((90548336 : Rat) / 385571) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 3), (15, 2)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 3), (15, 2), (16, 1)],
  term ((27657728 : Rat) / 158397) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-22844240 : Rat) / 385571) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((7955968 : Rat) / 52799) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-28528320 : Rat) / 385571) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3977984 : Rat) / 52799) [(5, 1), (9, 2), (12, 2), (15, 1)],
  term ((14264160 : Rat) / 385571) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-3977984 : Rat) / 52799) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((14264160 : Rat) / 385571) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-28420480 : Rat) / 158397) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((171577360 : Rat) / 385571) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6314240 : Rat) / 158397) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-41538448 : Rat) / 385571) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14210240 : Rat) / 158397) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-85788680 : Rat) / 385571) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3157120 : Rat) / 158397) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((20769224 : Rat) / 385571) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((14210240 : Rat) / 158397) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-85788680 : Rat) / 385571) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3157120 : Rat) / 158397) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((20769224 : Rat) / 385571) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 3), (15, 2)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 3), (15, 2), (16, 1)],
  term ((8454040 : Rat) / 158397) [(5, 1), (12, 1), (13, 1)],
  term ((60664096 : Rat) / 158397) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-260307724 : Rat) / 385571) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 1), (13, 2), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((18989632 : Rat) / 158397) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-98941372 : Rat) / 385571) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3056636 : Rat) / 158397) [(5, 1), (12, 1), (15, 1)],
  term ((7731572 : Rat) / 385571) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6799360 : Rat) / 158397) [(5, 1), (12, 1), (15, 3)],
  term ((270976 : Rat) / 385571) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4227020 : Rat) / 158397) [(5, 1), (12, 2), (13, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-9494816 : Rat) / 158397) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((49470686 : Rat) / 385571) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40952170 : Rat) / 52799) [(5, 1), (12, 2), (15, 1)],
  term ((516749662 : Rat) / 385571) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4628480 : Rat) / 158397) [(5, 1), (12, 2), (15, 3)],
  term ((39756992 : Rat) / 385571) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((42281312 : Rat) / 52799) [(5, 1), (12, 3), (15, 1)],
  term ((-612628524 : Rat) / 385571) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 3), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 3), (15, 3), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 1), (12, 4), (15, 1)],
  term ((176160400 : Rat) / 385571) [(5, 1), (12, 4), (15, 1), (16, 1)],
  term ((-9494816 : Rat) / 158397) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((49470686 : Rat) / 385571) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1528318 : Rat) / 158397) [(5, 1), (13, 2), (15, 1)],
  term ((-3865786 : Rat) / 385571) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3399680 : Rat) / 158397) [(5, 1), (13, 2), (15, 3)],
  term ((-135488 : Rat) / 385571) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4227020 : Rat) / 158397) [(5, 1), (13, 3)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 3), (15, 2)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 2), (6, 1), (12, 2), (15, 2)],
  term ((131880288 : Rat) / 385571) [(5, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 3), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 3), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 2), (8, 1), (12, 2), (15, 2)],
  term ((352320800 : Rat) / 385571) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 3), (15, 2)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((4227020 : Rat) / 158397) [(5, 2), (12, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 1), (13, 2), (15, 2)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1690808 : Rat) / 158397) [(5, 2), (12, 1), (14, 1)],
  term ((11960320 : Rat) / 52799) [(5, 2), (12, 1), (15, 2)],
  term ((-25613184 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2113510 : Rat) / 158397) [(5, 2), (12, 2)],
  term ((845404 : Rat) / 158397) [(5, 2), (12, 2), (14, 1)],
  term ((48239360 : Rat) / 158397) [(5, 2), (12, 2), (15, 2)],
  term ((-339514208 : Rat) / 385571) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 3), (15, 2)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 3), (15, 2), (16, 1)],
  term ((-2113510 : Rat) / 158397) [(5, 2), (13, 2)],
  term ((845404 : Rat) / 158397) [(5, 2), (13, 2), (14, 1)],
  term ((-5980160 : Rat) / 52799) [(5, 2), (13, 2), (15, 2)],
  term ((12806592 : Rat) / 385571) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((109995624 : Rat) / 385571) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((6109920 : Rat) / 52799) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-164993436 : Rat) / 385571) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(6, 1), (7, 1), (12, 3), (15, 1)],
  term ((54997812 : Rat) / 385571) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 2)],
  term ((2958914 : Rat) / 158397) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 1200 through 1299. -/
theorem rs_R005_ueqv_R005NYN_block_04_1200_1299_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_04_1200_1299
      rs_R005_ueqv_R005NYN_block_04_1200_1299 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
