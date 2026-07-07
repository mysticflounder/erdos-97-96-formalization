/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 30:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_30_1300_1399 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 1300 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1300 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1300 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1300 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1300_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1300
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1301 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1301 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1301 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1301_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1301
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1302 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1302 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1302 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1302_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1302
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1303 : Poly :=
[
  term ((5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1303 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1303 : Poly :=
[
  term ((-11386880 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5693440 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11386880 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((5693440 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((11386880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((11386880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1303_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1303
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1304 : Poly :=
[
  term ((-37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1304 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1304 : Poly :=
[
  term ((75201920 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37600960 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((75201920 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-37600960 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75201920 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75201920 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1304_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1304
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1305 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1305 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1305 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1305_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1305
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1306 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1306 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1306 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1306_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1306
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1307 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1307 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1307 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1307_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1307
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1308 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1308 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1308 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1308_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1308
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1309 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1309 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1309 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1309_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1309
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1310 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1310 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1310 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1310_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1310
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1311 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1311 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1311 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((4014080 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1311_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1311
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1312 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1312 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1312 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1312_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1312
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1313 : Poly :=
[
  term ((-25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1313 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1313 : Poly :=
[
  term ((51837952 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25918976 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((51837952 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-25918976 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-51837952 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-51837952 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1313_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1313
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1314 : Poly :=
[
  term ((-45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1314 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1314 : Poly :=
[
  term ((91378400 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45689200 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((91378400 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-45689200 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-91378400 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-91378400 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1314_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1314
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1315 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1315 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1315 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (12, 2), (15, 2)],
  term ((4460800 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1315_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1315
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1316 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1316 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1316 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1316_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1316
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1317 : Poly :=
[
  term ((21458176 : Rat) / 158397) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1317 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1317 : Poly :=
[
  term ((-42916352 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((21458176 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1317_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1317
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1318 : Poly :=
[
  term ((-11007088 : Rat) / 385571) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1318 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1318 : Poly :=
[
  term ((22014176 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1318_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1318
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1319 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1319 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1319 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1319_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1319
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1320 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1320 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1320 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1320_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1320
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1321 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1321 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1321 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (6, 1), (11, 1), (12, 2), (15, 2)],
  term ((10362880 : Rat) / 158397) [(1, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1321_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1321
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1322 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1322 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1322 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1322_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1322
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1323 : Poly :=
[
  term ((-2958914 : Rat) / 158397) [(6, 1), (12, 1)]
]

/-- Partial product 1323 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1323 : Poly :=
[
  term ((5917828 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((-2958914 : Rat) / 158397) [(0, 2), (6, 1), (12, 1)],
  term ((5917828 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2958914 : Rat) / 158397) [(1, 2), (6, 1), (12, 1)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 1), (13, 2)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 2), (14, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1323_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1323
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1324 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1324 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1324 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-678880 : Rat) / 52799) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(6, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1324_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1324
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1325 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1325 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1325 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1325_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1325
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1326 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 1326 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1326 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((6348800 : Rat) / 158397) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-12697600 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((6348800 : Rat) / 158397) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((12697600 : Rat) / 158397) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((12697600 : Rat) / 158397) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(6, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1326_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1326
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1327 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1327 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1327 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((44475520 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1327_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1327
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1328 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)]
]

/-- Partial product 1328 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1328 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (6, 1), (12, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (6, 1), (12, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (12, 2), (13, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(6, 1), (12, 2), (13, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (12, 3), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1328_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1328
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1329 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1329 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1329 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1329_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1329
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1330 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(6, 1), (15, 2)]
]

/-- Partial product 1330 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1330 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (6, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (6, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(1, 2), (6, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(6, 1), (12, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (13, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1330_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1330
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1331 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1331 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1331 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1331_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1331
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1332 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1332 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1332 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1332_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1332
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1333 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1333 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1333 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1333_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1333
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1334 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1334 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1334 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1334_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1334
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1335 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1335 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1335 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1335_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1335
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1336 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1336 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1336 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1336_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1336
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1337 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1337 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1337 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1337_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1337
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1338 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1338 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1338 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1338_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1338
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1339 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1339 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1339 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1339_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1339
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1340 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1340 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1340 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((4460800 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1340_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1340
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1341 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1341 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1341 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1341_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1341
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1342 : Poly :=
[
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1342 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1342 : Poly :=
[
  term ((42916352 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((42916352 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-21458176 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1342_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1342
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1343 : Poly :=
[
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1343 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1343 : Poly :=
[
  term ((-22014176 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11007088 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1343_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1343
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1344 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1344 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1344 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1344_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1344
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1345 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1345 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1345 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1345_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1345
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1346 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1346 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1346 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (15, 3)],
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 3), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1346_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1346
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1347 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1347 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1347 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1347_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1347
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1348 : Poly :=
[
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1348 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1348 : Poly :=
[
  term ((-9437440 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(7, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1348_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1348
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1349 : Poly :=
[
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1349 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1349 : Poly :=
[
  term ((43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1349_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1349
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1350 : Poly :=
[
  term ((-3427840 : Rat) / 158397) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1350 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1350 : Poly :=
[
  term ((6855680 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3427840 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((6855680 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-3427840 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-6855680 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3427840 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6855680 : Rat) / 158397) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((3427840 : Rat) / 158397) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1350_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1350
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1351 : Poly :=
[
  term ((51350368 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1351 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1351 : Poly :=
[
  term ((-102700736 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51350368 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-102700736 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((51350368 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((102700736 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-51350368 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((102700736 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-51350368 : Rat) / 385571) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1351_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1351
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1352 : Poly :=
[
  term ((-2958914 : Rat) / 158397) [(7, 1), (13, 1)]
]

/-- Partial product 1352 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1352 : Poly :=
[
  term ((5917828 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2958914 : Rat) / 158397) [(0, 2), (7, 1), (13, 1)],
  term ((5917828 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2958914 : Rat) / 158397) [(1, 2), (7, 1), (13, 1)],
  term ((-5917828 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2958914 : Rat) / 158397) [(7, 1), (12, 2), (13, 1)],
  term ((-5917828 : Rat) / 158397) [(7, 1), (13, 2), (15, 1)],
  term ((2958914 : Rat) / 158397) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1352_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1352
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1353 : Poly :=
[
  term ((7053440 : Rat) / 158397) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1353 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1353 : Poly :=
[
  term ((-14106880 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((7053440 : Rat) / 158397) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-14106880 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((7053440 : Rat) / 158397) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((14106880 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7053440 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((14106880 : Rat) / 158397) [(7, 1), (13, 2), (15, 3)],
  term ((-7053440 : Rat) / 158397) [(7, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1353_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1353
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1354 : Poly :=
[
  term ((-24271568 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1354 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1354 : Poly :=
[
  term ((48543136 : Rat) / 385571) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24271568 : Rat) / 385571) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((48543136 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24271568 : Rat) / 385571) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48543136 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24271568 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-48543136 : Rat) / 385571) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((24271568 : Rat) / 385571) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1354_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1354
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1355 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1355 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1355 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-678880 : Rat) / 52799) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(7, 1), (13, 3), (15, 2)],
  term ((678880 : Rat) / 52799) [(7, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1355_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1355
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1356 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1356 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1356 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1356_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1356
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1357 : Poly :=
[
  term ((-4718720 : Rat) / 158397) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1357 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1357 : Poly :=
[
  term ((9437440 : Rat) / 158397) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 158397) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 158397) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1357_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1357
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1358 : Poly :=
[
  term ((21980048 : Rat) / 385571) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1358 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1358 : Poly :=
[
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((21980048 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1358_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1358
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1359 : Poly :=
[
  term ((339440 : Rat) / 52799) [(7, 1), (15, 1)]
]

/-- Partial product 1359 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1359 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((339440 : Rat) / 52799) [(0, 2), (7, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(1, 1), (7, 1), (15, 2)],
  term ((339440 : Rat) / 52799) [(1, 2), (7, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-339440 : Rat) / 52799) [(7, 1), (12, 2), (15, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (13, 1), (15, 2)],
  term ((-339440 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1359_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1359
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1360 : Poly :=
[
  term ((-9166302 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1360 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1360 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166302 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((9166302 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1360_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1360
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1361 : Poly :=
[
  term ((-2036640 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1361 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1361 : Poly :=
[
  term ((4073280 : Rat) / 52799) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((4073280 : Rat) / 52799) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((-2036640 : Rat) / 52799) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((-4073280 : Rat) / 52799) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((-4073280 : Rat) / 52799) [(7, 2), (13, 2), (15, 2)],
  term ((2036640 : Rat) / 52799) [(7, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1361_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1361
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1362 : Poly :=
[
  term ((54997812 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1362 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1362 : Poly :=
[
  term ((-109995624 : Rat) / 385571) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-109995624 : Rat) / 385571) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((54997812 : Rat) / 385571) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((109995624 : Rat) / 385571) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((109995624 : Rat) / 385571) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1362_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1362
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1363 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1363 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1363 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1363_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1363
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1364 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1364 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1364 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1364_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1364
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1365 : Poly :=
[
  term ((1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1365 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1365 : Poly :=
[
  term ((-2947200 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1473600 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2947200 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((1473600 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((2947200 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((2947200 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1365_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1365
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1366 : Poly :=
[
  term ((53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1366 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1366 : Poly :=
[
  term ((-106943472 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((53471736 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106943472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((53471736 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((106943472 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((106943472 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1366_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1366
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1367 : Poly :=
[
  term ((-1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1367 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1367 : Poly :=
[
  term ((3951616 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1975808 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3951616 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1975808 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3951616 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3951616 : Rat) / 52799) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1367_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1367
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1368 : Poly :=
[
  term ((15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1368 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1368 : Poly :=
[
  term ((-31443456 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15721728 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31443456 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((15721728 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((31443456 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((31443456 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1368_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1368
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1369 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1369 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1369 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((5562880 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((5562880 : Rat) / 158397) [(8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1369_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1369
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1370 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1370 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1370 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1370_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1370
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1371 : Poly :=
[
  term ((695360 : Rat) / 158397) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1371 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1371 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((695360 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((695360 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-695360 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-695360 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1371_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1371
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1372 : Poly :=
[
  term ((18587752 : Rat) / 385571) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1372 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1372 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18587752 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((18587752 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18587752 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18587752 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1372_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1372
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1373 : Poly :=
[
  term ((-371168 : Rat) / 158397) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1373 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1373 : Poly :=
[
  term ((742336 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-371168 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((742336 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-371168 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-742336 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((371168 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-742336 : Rat) / 158397) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((371168 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1373_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1373
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1374 : Poly :=
[
  term ((-71233228 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1374 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1374 : Poly :=
[
  term ((142466456 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71233228 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((142466456 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-71233228 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-142466456 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((71233228 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-142466456 : Rat) / 385571) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((71233228 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1374_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1374
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1375 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1375 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1375 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1375_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1375
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1376 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1376 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1376 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1376_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1376
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1377 : Poly :=
[
  term ((1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1377 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1377 : Poly :=
[
  term ((-2068480 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1034240 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2068480 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((1034240 : Rat) / 52799) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2068480 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((2068480 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1377_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1377
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1378 : Poly :=
[
  term ((-27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1378 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1378 : Poly :=
[
  term ((54109920 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27054960 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((54109920 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27054960 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54109920 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-54109920 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1378_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1378
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1379 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1379 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1379 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1379_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1379
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1380 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1380 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1380 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1380_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1380
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1381 : Poly :=
[
  term ((-2232320 : Rat) / 158397) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1381 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1381 : Poly :=
[
  term ((4464640 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2232320 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((4464640 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-2232320 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-4464640 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2232320 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-4464640 : Rat) / 158397) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((2232320 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1381_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1381
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1382 : Poly :=
[
  term ((14195840 : Rat) / 385571) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1382 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1382 : Poly :=
[
  term ((-28391680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((14195840 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-28391680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((14195840 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((28391680 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14195840 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((28391680 : Rat) / 385571) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14195840 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1382_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1382
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1383 : Poly :=
[
  term ((-9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1383 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1383 : Poly :=
[
  term ((19496960 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9748480 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-19496960 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1383_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1383
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1384 : Poly :=
[
  term ((22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1384 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1384 : Poly :=
[
  term ((-44746496 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22373248 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44746496 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((22373248 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((44746496 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((44746496 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1384_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1384
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1385 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1385 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1385 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1385_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1385
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1386 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1386 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1386 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1386_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1386
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1387 : Poly :=
[
  term ((604160 : Rat) / 52799) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1387 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1387 : Poly :=
[
  term ((-1208320 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((604160 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1208320 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((604160 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1208320 : Rat) / 52799) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-604160 : Rat) / 52799) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((1208320 : Rat) / 52799) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-604160 : Rat) / 52799) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1387_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1387
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1388 : Poly :=
[
  term ((-9782160 : Rat) / 385571) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1388 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1388 : Poly :=
[
  term ((19564320 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9782160 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19564320 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9782160 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19564320 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9782160 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19564320 : Rat) / 385571) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9782160 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1388_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1388
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1389 : Poly :=
[
  term ((-1141760 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1389 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1389 : Poly :=
[
  term ((2283520 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1141760 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((2283520 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1141760 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2283520 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1141760 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2283520 : Rat) / 158397) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1141760 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1389_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1389
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1390 : Poly :=
[
  term ((30732536 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1390 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1390 : Poly :=
[
  term ((-61465072 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((30732536 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61465072 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((30732536 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((61465072 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30732536 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((61465072 : Rat) / 385571) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30732536 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1390_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1390
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1391 : Poly :=
[
  term ((-573440 : Rat) / 52799) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1391 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1391 : Poly :=
[
  term ((1146880 : Rat) / 52799) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-573440 : Rat) / 52799) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((1146880 : Rat) / 52799) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-573440 : Rat) / 52799) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-1146880 : Rat) / 52799) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((573440 : Rat) / 52799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-1146880 : Rat) / 52799) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((573440 : Rat) / 52799) [(8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1391_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1391
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1392 : Poly :=
[
  term ((-17519232 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1392 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1392 : Poly :=
[
  term ((35038464 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17519232 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((35038464 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17519232 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35038464 : Rat) / 385571) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((17519232 : Rat) / 385571) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-35038464 : Rat) / 385571) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((17519232 : Rat) / 385571) [(8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1392_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1392
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1393 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1393 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1393 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(8, 1), (12, 2), (13, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 2), (13, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(8, 1), (12, 3), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1393_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1393
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1394 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1394 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1394 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1394_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1394
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1395 : Poly :=
[
  term ((-1003520 : Rat) / 158397) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1395 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1395 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-1003520 : Rat) / 158397) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1003520 : Rat) / 158397) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((1003520 : Rat) / 158397) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((1003520 : Rat) / 158397) [(8, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1395_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1395
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1396 : Poly :=
[
  term ((4986560 : Rat) / 385571) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1396 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1396 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((4986560 : Rat) / 385571) [(0, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((4986560 : Rat) / 385571) [(1, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1396_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1396
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1397 : Poly :=
[
  term ((3276800 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 1397 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1397 : Poly :=
[
  term ((-6553600 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((3276800 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-6553600 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((3276800 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((6553600 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3276800 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)],
  term ((6553600 : Rat) / 158397) [(8, 1), (13, 1), (15, 3)],
  term ((-3276800 : Rat) / 158397) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1397_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1397
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1398 : Poly :=
[
  term ((-10619144 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1398 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1398 : Poly :=
[
  term ((21238288 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10619144 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((21238288 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-10619144 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-21238288 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10619144 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-21238288 : Rat) / 385571) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((10619144 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1398_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1398
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_1399 : Poly :=
[
  term ((2230400 : Rat) / 158397) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1399 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_1399 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_1399_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_1399
        rs_R005_ueqv_R005NYN_generator_30_1300_1399 =
      rs_R005_ueqv_R005NYN_partial_30_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_30_1300_1399 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_30_1300,
  rs_R005_ueqv_R005NYN_partial_30_1301,
  rs_R005_ueqv_R005NYN_partial_30_1302,
  rs_R005_ueqv_R005NYN_partial_30_1303,
  rs_R005_ueqv_R005NYN_partial_30_1304,
  rs_R005_ueqv_R005NYN_partial_30_1305,
  rs_R005_ueqv_R005NYN_partial_30_1306,
  rs_R005_ueqv_R005NYN_partial_30_1307,
  rs_R005_ueqv_R005NYN_partial_30_1308,
  rs_R005_ueqv_R005NYN_partial_30_1309,
  rs_R005_ueqv_R005NYN_partial_30_1310,
  rs_R005_ueqv_R005NYN_partial_30_1311,
  rs_R005_ueqv_R005NYN_partial_30_1312,
  rs_R005_ueqv_R005NYN_partial_30_1313,
  rs_R005_ueqv_R005NYN_partial_30_1314,
  rs_R005_ueqv_R005NYN_partial_30_1315,
  rs_R005_ueqv_R005NYN_partial_30_1316,
  rs_R005_ueqv_R005NYN_partial_30_1317,
  rs_R005_ueqv_R005NYN_partial_30_1318,
  rs_R005_ueqv_R005NYN_partial_30_1319,
  rs_R005_ueqv_R005NYN_partial_30_1320,
  rs_R005_ueqv_R005NYN_partial_30_1321,
  rs_R005_ueqv_R005NYN_partial_30_1322,
  rs_R005_ueqv_R005NYN_partial_30_1323,
  rs_R005_ueqv_R005NYN_partial_30_1324,
  rs_R005_ueqv_R005NYN_partial_30_1325,
  rs_R005_ueqv_R005NYN_partial_30_1326,
  rs_R005_ueqv_R005NYN_partial_30_1327,
  rs_R005_ueqv_R005NYN_partial_30_1328,
  rs_R005_ueqv_R005NYN_partial_30_1329,
  rs_R005_ueqv_R005NYN_partial_30_1330,
  rs_R005_ueqv_R005NYN_partial_30_1331,
  rs_R005_ueqv_R005NYN_partial_30_1332,
  rs_R005_ueqv_R005NYN_partial_30_1333,
  rs_R005_ueqv_R005NYN_partial_30_1334,
  rs_R005_ueqv_R005NYN_partial_30_1335,
  rs_R005_ueqv_R005NYN_partial_30_1336,
  rs_R005_ueqv_R005NYN_partial_30_1337,
  rs_R005_ueqv_R005NYN_partial_30_1338,
  rs_R005_ueqv_R005NYN_partial_30_1339,
  rs_R005_ueqv_R005NYN_partial_30_1340,
  rs_R005_ueqv_R005NYN_partial_30_1341,
  rs_R005_ueqv_R005NYN_partial_30_1342,
  rs_R005_ueqv_R005NYN_partial_30_1343,
  rs_R005_ueqv_R005NYN_partial_30_1344,
  rs_R005_ueqv_R005NYN_partial_30_1345,
  rs_R005_ueqv_R005NYN_partial_30_1346,
  rs_R005_ueqv_R005NYN_partial_30_1347,
  rs_R005_ueqv_R005NYN_partial_30_1348,
  rs_R005_ueqv_R005NYN_partial_30_1349,
  rs_R005_ueqv_R005NYN_partial_30_1350,
  rs_R005_ueqv_R005NYN_partial_30_1351,
  rs_R005_ueqv_R005NYN_partial_30_1352,
  rs_R005_ueqv_R005NYN_partial_30_1353,
  rs_R005_ueqv_R005NYN_partial_30_1354,
  rs_R005_ueqv_R005NYN_partial_30_1355,
  rs_R005_ueqv_R005NYN_partial_30_1356,
  rs_R005_ueqv_R005NYN_partial_30_1357,
  rs_R005_ueqv_R005NYN_partial_30_1358,
  rs_R005_ueqv_R005NYN_partial_30_1359,
  rs_R005_ueqv_R005NYN_partial_30_1360,
  rs_R005_ueqv_R005NYN_partial_30_1361,
  rs_R005_ueqv_R005NYN_partial_30_1362,
  rs_R005_ueqv_R005NYN_partial_30_1363,
  rs_R005_ueqv_R005NYN_partial_30_1364,
  rs_R005_ueqv_R005NYN_partial_30_1365,
  rs_R005_ueqv_R005NYN_partial_30_1366,
  rs_R005_ueqv_R005NYN_partial_30_1367,
  rs_R005_ueqv_R005NYN_partial_30_1368,
  rs_R005_ueqv_R005NYN_partial_30_1369,
  rs_R005_ueqv_R005NYN_partial_30_1370,
  rs_R005_ueqv_R005NYN_partial_30_1371,
  rs_R005_ueqv_R005NYN_partial_30_1372,
  rs_R005_ueqv_R005NYN_partial_30_1373,
  rs_R005_ueqv_R005NYN_partial_30_1374,
  rs_R005_ueqv_R005NYN_partial_30_1375,
  rs_R005_ueqv_R005NYN_partial_30_1376,
  rs_R005_ueqv_R005NYN_partial_30_1377,
  rs_R005_ueqv_R005NYN_partial_30_1378,
  rs_R005_ueqv_R005NYN_partial_30_1379,
  rs_R005_ueqv_R005NYN_partial_30_1380,
  rs_R005_ueqv_R005NYN_partial_30_1381,
  rs_R005_ueqv_R005NYN_partial_30_1382,
  rs_R005_ueqv_R005NYN_partial_30_1383,
  rs_R005_ueqv_R005NYN_partial_30_1384,
  rs_R005_ueqv_R005NYN_partial_30_1385,
  rs_R005_ueqv_R005NYN_partial_30_1386,
  rs_R005_ueqv_R005NYN_partial_30_1387,
  rs_R005_ueqv_R005NYN_partial_30_1388,
  rs_R005_ueqv_R005NYN_partial_30_1389,
  rs_R005_ueqv_R005NYN_partial_30_1390,
  rs_R005_ueqv_R005NYN_partial_30_1391,
  rs_R005_ueqv_R005NYN_partial_30_1392,
  rs_R005_ueqv_R005NYN_partial_30_1393,
  rs_R005_ueqv_R005NYN_partial_30_1394,
  rs_R005_ueqv_R005NYN_partial_30_1395,
  rs_R005_ueqv_R005NYN_partial_30_1396,
  rs_R005_ueqv_R005NYN_partial_30_1397,
  rs_R005_ueqv_R005NYN_partial_30_1398,
  rs_R005_ueqv_R005NYN_partial_30_1399
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_30_1300_1399 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11386880 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((75201920 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((51837952 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((91378400 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5917828 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((-12697600 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((44475520 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((5562880 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42916352 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6855680 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-102700736 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5917828 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-14106880 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((48543136 : Rat) / 385571) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((4073280 : Rat) / 52799) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-109995624 : Rat) / 385571) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2947200 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-106943472 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3951616 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-31443456 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((742336 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((142466456 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2068480 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((54109920 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4464640 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-28391680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((19496960 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-44746496 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2283520 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-61465072 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1208320 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((19564320 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1146880 : Rat) / 52799) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((35038464 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6553600 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((21238288 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5693440 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37600960 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25918976 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-45689200 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(0, 2), (6, 1), (12, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (6, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (6, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3427840 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((51350368 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(0, 2), (7, 1), (13, 1)],
  term ((7053440 : Rat) / 158397) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-24271568 : Rat) / 385571) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(0, 2), (7, 1), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1473600 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((53471736 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1975808 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((15721728 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((695360 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((18587752 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371168 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71233228 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1034240 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27054960 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2232320 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((14195840 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9748480 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((22373248 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((604160 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9782160 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1141760 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((30732536 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-573440 : Rat) / 52799) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-17519232 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1003520 : Rat) / 158397) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(0, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3276800 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-10619144 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((148702016 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11386880 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((75201920 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((39892480 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((51837952 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((91378400 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (12, 2), (15, 2)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((22014176 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (6, 1), (11, 1), (12, 2), (15, 2)],
  term ((84368000 : Rat) / 385571) [(1, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5917828 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((44475520 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (6, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((148702016 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((42916352 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-22014176 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((43960096 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6855680 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-102700736 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((5917828 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-14106880 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((48543136 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 1), (7, 1), (15, 2)],
  term ((18332604 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((4073280 : Rat) / 52799) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((-109995624 : Rat) / 385571) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2947200 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-106943472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((3951616 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-31443456 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-37175504 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((742336 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((142466456 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2068480 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((54109920 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((4464640 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-28391680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((19496960 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-44746496 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1208320 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((19564320 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2283520 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-61465072 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1146880 : Rat) / 52799) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((35038464 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-9973120 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6553600 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((21238288 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((74351008 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5693440 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37600960 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25918976 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-45689200 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(1, 2), (6, 1), (12, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (6, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (6, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3427840 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((51350368 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(1, 2), (7, 1), (13, 1)],
  term ((7053440 : Rat) / 158397) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((-24271568 : Rat) / 385571) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(1, 2), (7, 1), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1473600 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((53471736 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1975808 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((15721728 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((695360 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((18587752 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371168 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71233228 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1034240 : Rat) / 52799) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27054960 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2232320 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((14195840 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9748480 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((22373248 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((604160 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9782160 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1141760 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((30732536 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-573440 : Rat) / 52799) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-17519232 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1003520 : Rat) / 158397) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(1, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3276800 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-10619144 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1)],
  term ((74351008 : Rat) / 385571) [(6, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((11386880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-75201920 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((11386880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-75201920 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5693440 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((37600960 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 3), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 4), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 4), (15, 2), (16, 1)],
  term ((-51837952 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-91378400 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-51837952 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-91378400 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((25918976 : Rat) / 158397) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((45689200 : Rat) / 385571) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 4), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 4), (15, 1)],
  term ((42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((12697600 : Rat) / 158397) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-44475520 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 1), (13, 2)],
  term ((-10422080 : Rat) / 158397) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((58902968 : Rat) / 385571) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (12, 2), (13, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(6, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (12, 2), (13, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(6, 1), (12, 2), (14, 1)],
  term ((12697600 : Rat) / 158397) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-44475520 : Rat) / 385571) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(6, 1), (12, 2), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((2958914 : Rat) / 158397) [(6, 1), (12, 3)],
  term ((678880 : Rat) / 52799) [(6, 1), (12, 3), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (12, 3), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(6, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(6, 1), (12, 3), (15, 2)],
  term ((22237760 : Rat) / 385571) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (12, 4), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (12, 4), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (13, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((778240 : Rat) / 52799) [(6, 1), (13, 2), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((84368000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((22014176 : Rat) / 385571) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 3), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((23544320 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-92503232 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6855680 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((102700736 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8792000 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((58645256 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3427840 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-51350368 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (12, 1), (13, 2), (15, 3)],
  term ((39892480 : Rat) / 385571) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 3), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((43960096 : Rat) / 385571) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(7, 1), (12, 2), (13, 1)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7053440 : Rat) / 158397) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((24271568 : Rat) / 385571) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-712320 : Rat) / 52799) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((80720688 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 158397) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-339440 : Rat) / 52799) [(7, 1), (12, 2), (15, 1)],
  term ((9166302 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 3), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(7, 1), (12, 3), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((3427840 : Rat) / 158397) [(7, 1), (12, 3), (15, 1)],
  term ((-51350368 : Rat) / 385571) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((43960096 : Rat) / 385571) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (13, 1), (15, 2)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6936148 : Rat) / 158397) [(7, 1), (13, 2), (15, 1)],
  term ((9166302 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((14106880 : Rat) / 158397) [(7, 1), (13, 2), (15, 3)],
  term ((-48543136 : Rat) / 385571) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((2958914 : Rat) / 158397) [(7, 1), (13, 3)],
  term ((-11126720 : Rat) / 158397) [(7, 1), (13, 3), (15, 2)],
  term ((60936776 : Rat) / 385571) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(7, 1), (13, 4), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((109995624 : Rat) / 385571) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(7, 2), (13, 2), (15, 2)],
  term ((109995624 : Rat) / 385571) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2036640 : Rat) / 52799) [(7, 2), (13, 3), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((2947200 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((106943472 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2947200 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((106943472 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3951616 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((31443456 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-742336 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-142466456 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((148702016 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-12550208 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((12855704 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((371168 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((71233228 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((1975808 : Rat) / 52799) [(8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-15721728 : Rat) / 385571) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 4), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-742336 : Rat) / 158397) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-142466456 : Rat) / 385571) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-695360 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-18587752 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((371168 : Rat) / 158397) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((71233228 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2068480 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-54109920 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2068480 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-54109920 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((28391680 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(8, 1), (10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2232320 : Rat) / 158397) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-14195840 : Rat) / 385571) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((28391680 : Rat) / 385571) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2232320 : Rat) / 158397) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-14195840 : Rat) / 385571) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((44746496 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2283520 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((61465072 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1208320 : Rat) / 52799) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-19564320 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-21309440 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((54528656 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1141760 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-30732536 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((9748480 : Rat) / 158397) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-22373248 : Rat) / 385571) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 4), (15, 1)],
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((1208320 : Rat) / 52799) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-19564320 : Rat) / 385571) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2283520 : Rat) / 158397) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((61465072 : Rat) / 385571) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-604160 : Rat) / 52799) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((9782160 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1141760 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-30732536 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1146880 : Rat) / 52799) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-35038464 : Rat) / 385571) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((573440 : Rat) / 52799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((17519232 : Rat) / 385571) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((6553600 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-21238288 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((9973120 : Rat) / 385571) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(8, 1), (12, 2), (13, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 2), (13, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2437120 : Rat) / 158397) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-40025024 : Rat) / 385571) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3276800 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)],
  term ((10619144 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(8, 1), (12, 3), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((573440 : Rat) / 52799) [(8, 1), (12, 3), (15, 2)],
  term ((17519232 : Rat) / 385571) [(8, 1), (12, 3), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 4), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 4), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((9973120 : Rat) / 385571) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((6553600 : Rat) / 158397) [(8, 1), (13, 1), (15, 3)],
  term ((-21238288 : Rat) / 385571) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1003520 : Rat) / 158397) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-4986560 : Rat) / 385571) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3276800 : Rat) / 158397) [(8, 1), (13, 2), (15, 2)],
  term ((10619144 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 1300 through 1399. -/
theorem rs_R005_ueqv_R005NYN_block_30_1300_1399_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_30_1300_1399
      rs_R005_ueqv_R005NYN_block_30_1300_1399 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
