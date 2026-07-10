/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 4:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_04_1300_1399 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 1300 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1300 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1300 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1300 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1300_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1300
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1301 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1301 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1301 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1301_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1301
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1302 : Poly :=
[
  term ((-5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1302 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1302 : Poly :=
[
  term ((11386880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5693440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5693440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-11386880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1302_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1302
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1303 : Poly :=
[
  term ((37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1303 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1303 : Poly :=
[
  term ((-75201920 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((37600960 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((37600960 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((75201920 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1303_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1303
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1304 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1304 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1304 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1304_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1304
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1305 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1305 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1305 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1305_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1305
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1306 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1306 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1306 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1306_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1306
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1307 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1307 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1307 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1307_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1307
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1308 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1308 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1308 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1308_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1308
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1309 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1309 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1309 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1309_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1309
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1310 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1310 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1310 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1310_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1310
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1311 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1311 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1311 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1311_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1311
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1312 : Poly :=
[
  term ((25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1312 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1312 : Poly :=
[
  term ((-51837952 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((25918976 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((25918976 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((51837952 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1312_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1312
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1313 : Poly :=
[
  term ((45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1313 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1313 : Poly :=
[
  term ((-91378400 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((45689200 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((45689200 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((91378400 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1313_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1313
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1314 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1314 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1314 : Poly :=
[
  term ((8921600 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1314_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1314
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1315 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1315 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1315 : Poly :=
[
  term ((113392576 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1315_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1315
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1316 : Poly :=
[
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1316 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1316 : Poly :=
[
  term ((42916352 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((21458176 : Rat) / 158397) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1316_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1316
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1317 : Poly :=
[
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1317 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1317 : Poly :=
[
  term ((-22014176 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1317_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1317
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1318 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1318 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1318 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1318_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1318
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1319 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1319 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1319 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1319_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1319
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1320 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1320 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1320 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(2, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1320_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1320
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1321 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1321 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1321 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(2, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1321_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1321
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1322 : Poly :=
[
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 1)]
]

/-- Partial product 1322 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1322 : Poly :=
[
  term ((-5917828 : Rat) / 158397) [(2, 1), (6, 1), (12, 1)],
  term ((2958914 : Rat) / 158397) [(2, 2), (6, 1), (12, 1)],
  term ((2958914 : Rat) / 158397) [(3, 2), (6, 1), (12, 1)],
  term ((-2958914 : Rat) / 158397) [(6, 1), (12, 1), (13, 2)],
  term ((5917828 : Rat) / 158397) [(6, 1), (12, 2)],
  term ((-2958914 : Rat) / 158397) [(6, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1322_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1322
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1323 : Poly :=
[
  term ((678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1323 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1323 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((1357760 : Rat) / 52799) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1323_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1323
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1324 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1324 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1324 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1324_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1324
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1325 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 1325 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1325 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (6, 1), (12, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(3, 2), (6, 1), (12, 1), (15, 2)],
  term ((6348800 : Rat) / 158397) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-12697600 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)],
  term ((6348800 : Rat) / 158397) [(6, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1325_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1325
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1326 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1326 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1326 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((44475520 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1326_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1326
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1327 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)]
]

/-- Partial product 1327 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1327 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(2, 1), (6, 1), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(2, 2), (6, 1), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(3, 2), (6, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 2), (13, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(6, 1), (12, 3), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1327_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1327
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1328 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1328 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1328 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(2, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1328_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1328
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1329 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1329 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1329 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1329_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1329
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1330 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1330 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1330 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1330_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1330
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1331 : Poly :=
[
  term ((778240 : Rat) / 52799) [(6, 1), (15, 2)]
]

/-- Partial product 1331 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1331 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(2, 1), (6, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(2, 2), (6, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(3, 2), (6, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(6, 1), (12, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(6, 1), (12, 2), (15, 2)],
  term ((-778240 : Rat) / 52799) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1331_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1331
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1332 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1332 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1332 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1332_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1332
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1333 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1333 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1333 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1333_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1333
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1334 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1334 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1334 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1334_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1334
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1335 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1335 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1335 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((20725760 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1335_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1335
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1336 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1336 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1336 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1336_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1336
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1337 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1337 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1337 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1337_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1337
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1338 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1338 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1338 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1338_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1338
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1339 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1339 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1339 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1339_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1339
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1340 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1340 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1340 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1340_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1340
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1341 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1341 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1341 : Poly :=
[
  term ((8921600 : Rat) / 158397) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1341_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1341
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1342 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1342 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1342 : Poly :=
[
  term ((113392576 : Rat) / 385571) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1342_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1342
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1343 : Poly :=
[
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1343 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1343 : Poly :=
[
  term ((-42916352 : Rat) / 158397) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((42916352 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1343_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1343
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1344 : Poly :=
[
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1344 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1344 : Poly :=
[
  term ((22014176 : Rat) / 385571) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1344_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1344
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1345 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1345 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1345 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1345_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1345
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1346 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1346 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1346 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1346_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1346
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1347 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1347 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1347 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 3), (15, 2)],
  term ((8028160 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1347_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1347
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1348 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1348 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1348 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1348_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1348
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1349 : Poly :=
[
  term ((-4718720 : Rat) / 158397) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1349 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1349 : Poly :=
[
  term ((9437440 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1349_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1349
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1350 : Poly :=
[
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1350 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1350 : Poly :=
[
  term ((-43960096 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1350_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1350
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1351 : Poly :=
[
  term ((5464480 : Rat) / 158397) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1351 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1351 : Poly :=
[
  term ((-10928960 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((5464480 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((5464480 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-5464480 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((10928960 : Rat) / 158397) [(7, 1), (12, 2), (15, 1)],
  term ((-5464480 : Rat) / 158397) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1351_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1351
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1352 : Poly :=
[
  term ((-69682972 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1352 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1352 : Poly :=
[
  term ((139365944 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69682972 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69682972 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((69682972 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-139365944 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((69682972 : Rat) / 385571) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1352_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1352
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1353 : Poly :=
[
  term ((2958914 : Rat) / 158397) [(7, 1), (13, 1)]
]

/-- Partial product 1353 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1353 : Poly :=
[
  term ((-5917828 : Rat) / 158397) [(2, 1), (7, 1), (13, 1)],
  term ((2958914 : Rat) / 158397) [(2, 2), (7, 1), (13, 1)],
  term ((2958914 : Rat) / 158397) [(3, 2), (7, 1), (13, 1)],
  term ((5917828 : Rat) / 158397) [(7, 1), (12, 1), (13, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 1), (12, 2), (13, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1353_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1353
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1354 : Poly :=
[
  term ((-7053440 : Rat) / 158397) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1354 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1354 : Poly :=
[
  term ((14106880 : Rat) / 158397) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-7053440 : Rat) / 158397) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-7053440 : Rat) / 158397) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-14106880 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((7053440 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((7053440 : Rat) / 158397) [(7, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1354_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1354
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1355 : Poly :=
[
  term ((24271568 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1355 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1355 : Poly :=
[
  term ((-48543136 : Rat) / 385571) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((24271568 : Rat) / 385571) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((24271568 : Rat) / 385571) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((48543136 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24271568 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-24271568 : Rat) / 385571) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1355_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1355
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1356 : Poly :=
[
  term ((678880 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1356 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1356 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((1357760 : Rat) / 52799) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1356_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1356
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1357 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1357 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1357 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1357_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1357
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1358 : Poly :=
[
  term ((662160 : Rat) / 52799) [(7, 1), (15, 1)]
]

/-- Partial product 1358 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1358 : Poly :=
[
  term ((-1324320 : Rat) / 52799) [(2, 1), (7, 1), (15, 1)],
  term ((662160 : Rat) / 52799) [(2, 2), (7, 1), (15, 1)],
  term ((662160 : Rat) / 52799) [(3, 2), (7, 1), (15, 1)],
  term ((1324320 : Rat) / 52799) [(7, 1), (12, 1), (15, 1)],
  term ((-662160 : Rat) / 52799) [(7, 1), (12, 2), (15, 1)],
  term ((-662160 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1358_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1358
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1359 : Poly :=
[
  term ((12861438 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1359 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1359 : Poly :=
[
  term ((-25722876 : Rat) / 385571) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((12861438 : Rat) / 385571) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((12861438 : Rat) / 385571) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((25722876 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12861438 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12861438 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1359_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1359
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1360 : Poly :=
[
  term ((2036640 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1360 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1360 : Poly :=
[
  term ((-4073280 : Rat) / 52799) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((4073280 : Rat) / 52799) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(7, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1360_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1360
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1361 : Poly :=
[
  term ((-54997812 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1361 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1361 : Poly :=
[
  term ((109995624 : Rat) / 385571) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-109995624 : Rat) / 385571) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1361_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1361
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1362 : Poly :=
[
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1362 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1362 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1362_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1362
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1363 : Poly :=
[
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1363 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1363 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1363_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1363
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1364 : Poly :=
[
  term ((-1639360 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1364 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1364 : Poly :=
[
  term ((3278720 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1639360 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1639360 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3278720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1639360 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1639360 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1364_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1364
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1365 : Poly :=
[
  term ((20879272 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1365 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1365 : Poly :=
[
  term ((-41758544 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((20879272 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((20879272 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41758544 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20879272 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20879272 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1365_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1365
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1366 : Poly :=
[
  term ((1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1366 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1366 : Poly :=
[
  term ((-3951616 : Rat) / 52799) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1975808 : Rat) / 52799) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1975808 : Rat) / 52799) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((3951616 : Rat) / 52799) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1366_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1366
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1367 : Poly :=
[
  term ((-15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1367 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1367 : Poly :=
[
  term ((31443456 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15721728 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15721728 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-31443456 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1367_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1367
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1368 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1368 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1368 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(8, 1), (9, 1), (12, 3), (15, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1368_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1368
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1369 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1369 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1369 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1369_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1369
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1370 : Poly :=
[
  term ((-695360 : Rat) / 158397) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1370 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1370 : Poly :=
[
  term ((1390720 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-695360 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-695360 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((695360 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((695360 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1370_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1370
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1371 : Poly :=
[
  term ((-18587752 : Rat) / 385571) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1371 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1371 : Poly :=
[
  term ((37175504 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18587752 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18587752 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18587752 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((18587752 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1371_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1371
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1372 : Poly :=
[
  term ((-1863200 : Rat) / 158397) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1372 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1372 : Poly :=
[
  term ((3726400 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1863200 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1863200 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-3726400 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1863200 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((1863200 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1372_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1372
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1373 : Poly :=
[
  term ((-10607524 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1373 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1373 : Poly :=
[
  term ((21215048 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10607524 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10607524 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21215048 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10607524 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((10607524 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1373_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1373
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1374 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1374 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1374 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1374_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1374
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1375 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1375 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1375 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1375_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1375
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1376 : Poly :=
[
  term ((7260160 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1376 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1376 : Poly :=
[
  term ((-14520320 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((7260160 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((7260160 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((14520320 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7260160 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7260160 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1376_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1376
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1377 : Poly :=
[
  term ((-15129040 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1377 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1377 : Poly :=
[
  term ((30258080 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15129040 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15129040 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30258080 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15129040 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((15129040 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1377_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1377
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1378 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1378 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1378 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1378_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1378
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1379 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1379 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1379 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1379_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1379
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1380 : Poly :=
[
  term ((-593920 : Rat) / 52799) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1380 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1380 : Poly :=
[
  term ((1187840 : Rat) / 52799) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-593920 : Rat) / 52799) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((-593920 : Rat) / 52799) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1187840 : Rat) / 52799) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((593920 : Rat) / 52799) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((593920 : Rat) / 52799) [(8, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1380_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1380
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1381 : Poly :=
[
  term ((5750400 : Rat) / 385571) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1381 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1381 : Poly :=
[
  term ((-11500800 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((5750400 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((5750400 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((11500800 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5750400 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5750400 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1381_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1381
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1382 : Poly :=
[
  term ((9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1382 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1382 : Poly :=
[
  term ((-19496960 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((9748480 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((9748480 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((19496960 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1382_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1382
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1383 : Poly :=
[
  term ((-22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1383 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1383 : Poly :=
[
  term ((44746496 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22373248 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22373248 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44746496 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1383_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1383
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1384 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1384 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1384 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1384_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1384
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1385 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1385 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1385 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1385_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1385
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1386 : Poly :=
[
  term ((-604160 : Rat) / 52799) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1386 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1386 : Poly :=
[
  term ((1208320 : Rat) / 52799) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-604160 : Rat) / 52799) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-604160 : Rat) / 52799) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1208320 : Rat) / 52799) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((604160 : Rat) / 52799) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((604160 : Rat) / 52799) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1386_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1386
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1387 : Poly :=
[
  term ((9782160 : Rat) / 385571) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1387 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1387 : Poly :=
[
  term ((-19564320 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9782160 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9782160 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19564320 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9782160 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9782160 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1387_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1387
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1388 : Poly :=
[
  term ((424960 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1388 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1388 : Poly :=
[
  term ((-849920 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((424960 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((424960 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((849920 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-424960 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-424960 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1388_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1388
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1389 : Poly :=
[
  term ((-7619992 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1389 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1389 : Poly :=
[
  term ((15239984 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7619992 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7619992 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15239984 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7619992 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7619992 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1389_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1389
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1390 : Poly :=
[
  term ((573440 : Rat) / 52799) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1390 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1390 : Poly :=
[
  term ((-1146880 : Rat) / 52799) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((573440 : Rat) / 52799) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((573440 : Rat) / 52799) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((-573440 : Rat) / 52799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((1146880 : Rat) / 52799) [(8, 1), (12, 2), (15, 2)],
  term ((-573440 : Rat) / 52799) [(8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1390_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1390
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1391 : Poly :=
[
  term ((17519232 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1391 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1391 : Poly :=
[
  term ((-35038464 : Rat) / 385571) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((17519232 : Rat) / 385571) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((17519232 : Rat) / 385571) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17519232 : Rat) / 385571) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((35038464 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-17519232 : Rat) / 385571) [(8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1391_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1391
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1392 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1392 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1392 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(2, 1), (8, 1), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(2, 2), (8, 1), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(3, 2), (8, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 2), (13, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(8, 1), (12, 3), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1392_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1392
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1393 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1393 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1393 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(2, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(8, 1), (12, 3), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1393_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1393
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1394 : Poly :=
[
  term ((1003520 : Rat) / 158397) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1394 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1394 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((1003520 : Rat) / 158397) [(2, 2), (8, 1), (14, 1), (15, 2)],
  term ((1003520 : Rat) / 158397) [(3, 2), (8, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1003520 : Rat) / 158397) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1003520 : Rat) / 158397) [(8, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1394_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1394
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1395 : Poly :=
[
  term ((-4986560 : Rat) / 385571) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1395 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1395 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4986560 : Rat) / 385571) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4986560 : Rat) / 385571) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1395_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1395
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1396 : Poly :=
[
  term ((450560 : Rat) / 52799) [(8, 1), (15, 2)]
]

/-- Partial product 1396 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1396 : Poly :=
[
  term ((-901120 : Rat) / 52799) [(2, 1), (8, 1), (15, 2)],
  term ((450560 : Rat) / 52799) [(2, 2), (8, 1), (15, 2)],
  term ((450560 : Rat) / 52799) [(3, 2), (8, 1), (15, 2)],
  term ((901120 : Rat) / 52799) [(8, 1), (12, 1), (15, 2)],
  term ((-450560 : Rat) / 52799) [(8, 1), (12, 2), (15, 2)],
  term ((-450560 : Rat) / 52799) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1396_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1396
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1397 : Poly :=
[
  term ((1274376 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1397 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1397 : Poly :=
[
  term ((-2548752 : Rat) / 385571) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((1274376 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((1274376 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((2548752 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1274376 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1274376 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1397_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1397
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1398 : Poly :=
[
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1398 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1398 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1398_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1398
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1399 : Poly :=
[
  term ((-28348144 : Rat) / 385571) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1399 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1399 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1399_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1399
        rs_R005_ueqv_R005NYN_generator_04_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_04_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_04_1300_1399 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_04_1300,
  rs_R005_ueqv_R005NYN_partial_04_1301,
  rs_R005_ueqv_R005NYN_partial_04_1302,
  rs_R005_ueqv_R005NYN_partial_04_1303,
  rs_R005_ueqv_R005NYN_partial_04_1304,
  rs_R005_ueqv_R005NYN_partial_04_1305,
  rs_R005_ueqv_R005NYN_partial_04_1306,
  rs_R005_ueqv_R005NYN_partial_04_1307,
  rs_R005_ueqv_R005NYN_partial_04_1308,
  rs_R005_ueqv_R005NYN_partial_04_1309,
  rs_R005_ueqv_R005NYN_partial_04_1310,
  rs_R005_ueqv_R005NYN_partial_04_1311,
  rs_R005_ueqv_R005NYN_partial_04_1312,
  rs_R005_ueqv_R005NYN_partial_04_1313,
  rs_R005_ueqv_R005NYN_partial_04_1314,
  rs_R005_ueqv_R005NYN_partial_04_1315,
  rs_R005_ueqv_R005NYN_partial_04_1316,
  rs_R005_ueqv_R005NYN_partial_04_1317,
  rs_R005_ueqv_R005NYN_partial_04_1318,
  rs_R005_ueqv_R005NYN_partial_04_1319,
  rs_R005_ueqv_R005NYN_partial_04_1320,
  rs_R005_ueqv_R005NYN_partial_04_1321,
  rs_R005_ueqv_R005NYN_partial_04_1322,
  rs_R005_ueqv_R005NYN_partial_04_1323,
  rs_R005_ueqv_R005NYN_partial_04_1324,
  rs_R005_ueqv_R005NYN_partial_04_1325,
  rs_R005_ueqv_R005NYN_partial_04_1326,
  rs_R005_ueqv_R005NYN_partial_04_1327,
  rs_R005_ueqv_R005NYN_partial_04_1328,
  rs_R005_ueqv_R005NYN_partial_04_1329,
  rs_R005_ueqv_R005NYN_partial_04_1330,
  rs_R005_ueqv_R005NYN_partial_04_1331,
  rs_R005_ueqv_R005NYN_partial_04_1332,
  rs_R005_ueqv_R005NYN_partial_04_1333,
  rs_R005_ueqv_R005NYN_partial_04_1334,
  rs_R005_ueqv_R005NYN_partial_04_1335,
  rs_R005_ueqv_R005NYN_partial_04_1336,
  rs_R005_ueqv_R005NYN_partial_04_1337,
  rs_R005_ueqv_R005NYN_partial_04_1338,
  rs_R005_ueqv_R005NYN_partial_04_1339,
  rs_R005_ueqv_R005NYN_partial_04_1340,
  rs_R005_ueqv_R005NYN_partial_04_1341,
  rs_R005_ueqv_R005NYN_partial_04_1342,
  rs_R005_ueqv_R005NYN_partial_04_1343,
  rs_R005_ueqv_R005NYN_partial_04_1344,
  rs_R005_ueqv_R005NYN_partial_04_1345,
  rs_R005_ueqv_R005NYN_partial_04_1346,
  rs_R005_ueqv_R005NYN_partial_04_1347,
  rs_R005_ueqv_R005NYN_partial_04_1348,
  rs_R005_ueqv_R005NYN_partial_04_1349,
  rs_R005_ueqv_R005NYN_partial_04_1350,
  rs_R005_ueqv_R005NYN_partial_04_1351,
  rs_R005_ueqv_R005NYN_partial_04_1352,
  rs_R005_ueqv_R005NYN_partial_04_1353,
  rs_R005_ueqv_R005NYN_partial_04_1354,
  rs_R005_ueqv_R005NYN_partial_04_1355,
  rs_R005_ueqv_R005NYN_partial_04_1356,
  rs_R005_ueqv_R005NYN_partial_04_1357,
  rs_R005_ueqv_R005NYN_partial_04_1358,
  rs_R005_ueqv_R005NYN_partial_04_1359,
  rs_R005_ueqv_R005NYN_partial_04_1360,
  rs_R005_ueqv_R005NYN_partial_04_1361,
  rs_R005_ueqv_R005NYN_partial_04_1362,
  rs_R005_ueqv_R005NYN_partial_04_1363,
  rs_R005_ueqv_R005NYN_partial_04_1364,
  rs_R005_ueqv_R005NYN_partial_04_1365,
  rs_R005_ueqv_R005NYN_partial_04_1366,
  rs_R005_ueqv_R005NYN_partial_04_1367,
  rs_R005_ueqv_R005NYN_partial_04_1368,
  rs_R005_ueqv_R005NYN_partial_04_1369,
  rs_R005_ueqv_R005NYN_partial_04_1370,
  rs_R005_ueqv_R005NYN_partial_04_1371,
  rs_R005_ueqv_R005NYN_partial_04_1372,
  rs_R005_ueqv_R005NYN_partial_04_1373,
  rs_R005_ueqv_R005NYN_partial_04_1374,
  rs_R005_ueqv_R005NYN_partial_04_1375,
  rs_R005_ueqv_R005NYN_partial_04_1376,
  rs_R005_ueqv_R005NYN_partial_04_1377,
  rs_R005_ueqv_R005NYN_partial_04_1378,
  rs_R005_ueqv_R005NYN_partial_04_1379,
  rs_R005_ueqv_R005NYN_partial_04_1380,
  rs_R005_ueqv_R005NYN_partial_04_1381,
  rs_R005_ueqv_R005NYN_partial_04_1382,
  rs_R005_ueqv_R005NYN_partial_04_1383,
  rs_R005_ueqv_R005NYN_partial_04_1384,
  rs_R005_ueqv_R005NYN_partial_04_1385,
  rs_R005_ueqv_R005NYN_partial_04_1386,
  rs_R005_ueqv_R005NYN_partial_04_1387,
  rs_R005_ueqv_R005NYN_partial_04_1388,
  rs_R005_ueqv_R005NYN_partial_04_1389,
  rs_R005_ueqv_R005NYN_partial_04_1390,
  rs_R005_ueqv_R005NYN_partial_04_1391,
  rs_R005_ueqv_R005NYN_partial_04_1392,
  rs_R005_ueqv_R005NYN_partial_04_1393,
  rs_R005_ueqv_R005NYN_partial_04_1394,
  rs_R005_ueqv_R005NYN_partial_04_1395,
  rs_R005_ueqv_R005NYN_partial_04_1396,
  rs_R005_ueqv_R005NYN_partial_04_1397,
  rs_R005_ueqv_R005NYN_partial_04_1398,
  rs_R005_ueqv_R005NYN_partial_04_1399
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_04_1300_1399 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((11386880 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75201920 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((84368000 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(2, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(2, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-51837952 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-91378400 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((113392576 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((42916352 : Rat) / 158397) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(2, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(2, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(2, 1), (6, 1), (12, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-44475520 : Rat) / 385571) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(2, 1), (6, 1), (12, 2), (15, 2)],
  term ((39892480 : Rat) / 385571) [(2, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 1), (6, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8921600 : Rat) / 158397) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10928960 : Rat) / 158397) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((139365944 : Rat) / 385571) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(2, 1), (7, 1), (13, 1)],
  term ((14106880 : Rat) / 158397) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-48543136 : Rat) / 385571) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1324320 : Rat) / 52799) [(2, 1), (7, 1), (15, 1)],
  term ((-25722876 : Rat) / 385571) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((109995624 : Rat) / 385571) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3278720 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-41758544 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3951616 : Rat) / 52799) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((31443456 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((148702016 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3726400 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((21215048 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14520320 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((30258080 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1187840 : Rat) / 52799) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-11500800 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((44746496 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1208320 : Rat) / 52799) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19564320 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-849920 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((15239984 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1146880 : Rat) / 52799) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-35038464 : Rat) / 385571) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(2, 1), (8, 1), (12, 2), (15, 2)],
  term ((39892480 : Rat) / 385571) [(2, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-901120 : Rat) / 52799) [(2, 1), (8, 1), (15, 2)],
  term ((-2548752 : Rat) / 385571) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5693440 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((37600960 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((25918976 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((45689200 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(2, 2), (6, 1), (12, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (6, 1), (12, 1), (15, 2)],
  term ((22237760 : Rat) / 385571) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (6, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(2, 2), (6, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5464480 : Rat) / 158397) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-69682972 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(2, 2), (7, 1), (13, 1)],
  term ((-7053440 : Rat) / 158397) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((24271568 : Rat) / 385571) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((662160 : Rat) / 52799) [(2, 2), (7, 1), (15, 1)],
  term ((12861438 : Rat) / 385571) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1639360 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((20879272 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1975808 : Rat) / 52799) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-15721728 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-695360 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-18587752 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1863200 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-10607524 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7260160 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-15129040 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-593920 : Rat) / 52799) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((5750400 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((9748480 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22373248 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-604160 : Rat) / 52799) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9782160 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((424960 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-7619992 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((573440 : Rat) / 52799) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((17519232 : Rat) / 385571) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1003520 : Rat) / 158397) [(2, 2), (8, 1), (14, 1), (15, 2)],
  term ((-4986560 : Rat) / 385571) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((450560 : Rat) / 52799) [(2, 2), (8, 1), (15, 2)],
  term ((1274376 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5693440 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((37600960 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(3, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((25918976 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((45689200 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(3, 2), (6, 1), (12, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 2), (6, 1), (12, 1), (15, 2)],
  term ((22237760 : Rat) / 385571) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (6, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(3, 2), (6, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5464480 : Rat) / 158397) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-69682972 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(3, 2), (7, 1), (13, 1)],
  term ((-7053440 : Rat) / 158397) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((24271568 : Rat) / 385571) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((662160 : Rat) / 52799) [(3, 2), (7, 1), (15, 1)],
  term ((12861438 : Rat) / 385571) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1639360 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((20879272 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1975808 : Rat) / 52799) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-15721728 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-695360 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-18587752 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1863200 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-10607524 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7260160 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-15129040 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-593920 : Rat) / 52799) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((5750400 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((9748480 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22373248 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-604160 : Rat) / 52799) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9782160 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((424960 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-7619992 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((573440 : Rat) / 52799) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((17519232 : Rat) / 385571) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1003520 : Rat) / 158397) [(3, 2), (8, 1), (14, 1), (15, 2)],
  term ((-4986560 : Rat) / 385571) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((450560 : Rat) / 52799) [(3, 2), (8, 1), (15, 2)],
  term ((1274376 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6717440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((70618880 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8806400 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-121968960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 52799) [(6, 1), (8, 1), (12, 3), (15, 2)],
  term ((59838720 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 4), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 4), (15, 2), (16, 1)],
  term ((-25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((73296128 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((80371312 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34840576 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((-159081776 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 4), (15, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 52799) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((126552000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 4), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(6, 1), (12, 1), (13, 2)],
  term ((6348800 : Rat) / 158397) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(6, 1), (12, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((5917828 : Rat) / 158397) [(6, 1), (12, 2)],
  term ((2036640 : Rat) / 52799) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 2), (13, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-15032320 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)],
  term ((46767040 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(6, 1), (12, 3)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 3), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((4792320 : Rat) / 52799) [(6, 1), (12, 3), (15, 2)],
  term ((-62130240 : Rat) / 385571) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 4), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 4), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(6, 1), (13, 2), (15, 2)],
  term ((2291520 : Rat) / 385571) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(6, 1), (13, 3), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((16056320 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-79784960 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((42916352 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10126592 : Rat) / 52799) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-102385488 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 3), (15, 1)],
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((5917828 : Rat) / 158397) [(7, 1), (12, 1), (13, 1)],
  term ((-14106880 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((48543136 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-37600 : Rat) / 4281) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((33017764 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 3), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1324320 : Rat) / 52799) [(7, 1), (12, 1), (15, 1)],
  term ((25722876 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 1), (12, 2), (13, 1)],
  term ((5027200 : Rat) / 52799) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-64164048 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((43960096 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((8942480 : Rat) / 158397) [(7, 1), (12, 2), (15, 1)],
  term ((-152227382 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 3), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 3), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5464480 : Rat) / 158397) [(7, 1), (12, 3), (15, 1)],
  term ((69682972 : Rat) / 385571) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-662160 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)],
  term ((-12861438 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 1), (13, 3)],
  term ((7053440 : Rat) / 158397) [(7, 1), (13, 3), (15, 2)],
  term ((-24271568 : Rat) / 385571) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (13, 4), (15, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((4073280 : Rat) / 52799) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-109995624 : Rat) / 385571) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(7, 2), (13, 3), (15, 1)],
  term ((54997812 : Rat) / 385571) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3278720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((41758544 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1639360 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-20879272 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1639360 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-20879272 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3726400 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-21215048 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((695360 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((18587752 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((13718048 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-20835932 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11490304 : Rat) / 158397) [(8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-132980288 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 4), (15, 1)],
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((695360 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((18587752 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1863200 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((10607524 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((14520320 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-30258080 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7260160 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((15129040 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7260160 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((15129040 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1187840 : Rat) / 52799) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((11500800 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((593920 : Rat) / 52799) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-5750400 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((593920 : Rat) / 52799) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-5750400 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1208320 : Rat) / 52799) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19564320 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((849920 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15239984 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((604160 : Rat) / 52799) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9782160 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((19072000 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-37126504 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10158080 : Rat) / 52799) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((106741248 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 4), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((604160 : Rat) / 52799) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-9782160 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-424960 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((7619992 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-573440 : Rat) / 52799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-17519232 : Rat) / 385571) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((901120 : Rat) / 52799) [(8, 1), (12, 1), (15, 2)],
  term ((2548752 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 2), (13, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1003520 : Rat) / 158397) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((696320 : Rat) / 52799) [(8, 1), (12, 2), (15, 2)],
  term ((33764088 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((6307840 : Rat) / 158397) [(8, 1), (12, 3), (15, 2)],
  term ((-57411712 : Rat) / 385571) [(8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 4), (15, 2)],
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 4), (15, 2), (16, 1)],
  term ((-1003520 : Rat) / 158397) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-450560 : Rat) / 52799) [(8, 1), (13, 2), (15, 2)],
  term ((-1274376 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 1300 through 1399. -/
theorem rs_R005_ueqv_R005NYN_block_04_1300_1399_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_04_1300_1399
      rs_R005_ueqv_R005NYN_block_04_1300_1399 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
