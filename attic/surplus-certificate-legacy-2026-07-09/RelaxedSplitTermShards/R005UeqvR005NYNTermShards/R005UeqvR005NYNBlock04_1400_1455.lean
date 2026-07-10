/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 4:1400-1455

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_04_1400_1455 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 1400 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1400 : Poly :=
[
  term ((1076096 : Rat) / 52799) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1400 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1400 : Poly :=
[
  term ((-2152192 : Rat) / 52799) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((1076096 : Rat) / 52799) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((1076096 : Rat) / 52799) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((2152192 : Rat) / 52799) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1076096 : Rat) / 52799) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1076096 : Rat) / 52799) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1400_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1400
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1401 : Poly :=
[
  term ((19665624 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1401 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1401 : Poly :=
[
  term ((-39331248 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19665624 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19665624 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39331248 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19665624 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-19665624 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1401_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1401
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1402 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 1402 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1402 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (9, 1), (10, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (9, 1), (10, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1402_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1402
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1403 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1403 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1403 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1403_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1403
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1404 : Poly :=
[
  term ((-8539648 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1404 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1404 : Poly :=
[
  term ((17079296 : Rat) / 158397) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-8539648 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-8539648 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((8539648 : Rat) / 158397) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-17079296 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)],
  term ((8539648 : Rat) / 158397) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1404_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1404
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1405 : Poly :=
[
  term ((-35536016 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1405 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1405 : Poly :=
[
  term ((71072032 : Rat) / 385571) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35536016 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35536016 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((35536016 : Rat) / 385571) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-71072032 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((35536016 : Rat) / 385571) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1405_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1405
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1406 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1406 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1406 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((8921600 : Rat) / 158397) [(9, 1), (12, 3), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1406_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1406
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1407 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1407 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1407 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1407_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1407
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1408 : Poly :=
[
  term ((1115200 : Rat) / 158397) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1408 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1408 : Poly :=
[
  term ((-2230400 : Rat) / 158397) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((1115200 : Rat) / 158397) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((1115200 : Rat) / 158397) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1115200 : Rat) / 158397) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1115200 : Rat) / 158397) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1408_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1408
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1409 : Poly :=
[
  term ((14174072 : Rat) / 385571) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1409 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1409 : Poly :=
[
  term ((-28348144 : Rat) / 385571) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14174072 : Rat) / 385571) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14174072 : Rat) / 385571) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14174072 : Rat) / 385571) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14174072 : Rat) / 385571) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1409_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1409
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1410 : Poly :=
[
  term ((6335648 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 1410 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1410 : Poly :=
[
  term ((-12671296 : Rat) / 158397) [(2, 1), (9, 1), (15, 1)],
  term ((6335648 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((6335648 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)],
  term ((12671296 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)],
  term ((-6335648 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)],
  term ((-6335648 : Rat) / 158397) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1410_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1410
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1411 : Poly :=
[
  term ((-11364236 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1411 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1411 : Poly :=
[
  term ((22728472 : Rat) / 385571) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11364236 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-11364236 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-22728472 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11364236 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((11364236 : Rat) / 385571) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1411_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1411
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1412 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(9, 2), (10, 1), (15, 2)]
]

/-- Partial product 1412 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1412 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(2, 1), (9, 2), (10, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(2, 2), (9, 2), (10, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(3, 2), (9, 2), (10, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 1), (12, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1412_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1412
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1413 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1413 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1413 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(2, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(2, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(3, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1413_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1413
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1414 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1414 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1414 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1414_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1414
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1415 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1415 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1415 : Poly :=
[
  term ((-4312064 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1415_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1415
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1416 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1416 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1416 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((532480 : Rat) / 52799) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((532480 : Rat) / 52799) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1416_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1416
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1417 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1417 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1417 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1417_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1417
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1418 : Poly :=
[
  term (4 : Rat) [(10, 1)]
]

/-- Partial product 1418 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1418 : Poly :=
[
  term (-8 : Rat) [(2, 1), (10, 1)],
  term (4 : Rat) [(2, 2), (10, 1)],
  term (4 : Rat) [(3, 2), (10, 1)],
  term (8 : Rat) [(10, 1), (12, 1)],
  term (-4 : Rat) [(10, 1), (12, 2)],
  term (-4 : Rat) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1418_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1418
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1419 : Poly :=
[
  term ((-4403200 : Rat) / 158397) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1419 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1419 : Poly :=
[
  term ((8806400 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4403200 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4403200 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8806400 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4403200 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((4403200 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1419_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1419
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1420 : Poly :=
[
  term ((20328160 : Rat) / 385571) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1420 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1420 : Poly :=
[
  term ((-40656320 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20328160 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20328160 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((40656320 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20328160 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20328160 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1420_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1420
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1421 : Poly :=
[
  term ((-2467840 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1421 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1421 : Poly :=
[
  term ((4935680 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2467840 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-2467840 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4935680 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2467840 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((2467840 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1421_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1421
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1422 : Poly :=
[
  term ((-5581040 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1422 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1422 : Poly :=
[
  term ((11162080 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5581040 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5581040 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11162080 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5581040 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5581040 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1422_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1422
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1423 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1423 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1423 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(2, 2), (10, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(3, 2), (10, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1423_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1423
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1424 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1424 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1424 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1424_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1424
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1425 : Poly :=
[
  term ((1963792 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 1425 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1425 : Poly :=
[
  term ((-3927584 : Rat) / 158397) [(2, 1), (10, 1), (15, 2)],
  term ((1963792 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((1963792 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)],
  term ((3927584 : Rat) / 158397) [(10, 1), (12, 1), (15, 2)],
  term ((-1963792 : Rat) / 158397) [(10, 1), (12, 2), (15, 2)],
  term ((-1963792 : Rat) / 158397) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1425_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1425
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1426 : Poly :=
[
  term ((-3762568 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1426 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1426 : Poly :=
[
  term ((7525136 : Rat) / 385571) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3762568 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3762568 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7525136 : Rat) / 385571) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3762568 : Rat) / 385571) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((3762568 : Rat) / 385571) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1426_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1426
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1427 : Poly :=
[
  term ((-778240 : Rat) / 158397) [(10, 2), (15, 2)]
]

/-- Partial product 1427 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1427 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(2, 1), (10, 2), (15, 2)],
  term ((-778240 : Rat) / 158397) [(2, 2), (10, 2), (15, 2)],
  term ((-778240 : Rat) / 158397) [(3, 2), (10, 2), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(10, 2), (12, 1), (15, 2)],
  term ((778240 : Rat) / 158397) [(10, 2), (12, 2), (15, 2)],
  term ((778240 : Rat) / 158397) [(10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1427_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1427
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1428 : Poly :=
[
  term ((763840 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 1428 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1428 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(2, 2), (10, 2), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(10, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1428_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1428
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1429 : Poly :=
[
  term ((-6103040 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1429 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1429 : Poly :=
[
  term ((12206080 : Rat) / 158397) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6103040 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6103040 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((6103040 : Rat) / 158397) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-12206080 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((6103040 : Rat) / 158397) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1429_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1429
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1430 : Poly :=
[
  term ((50808128 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1430 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1430 : Poly :=
[
  term ((-101616256 : Rat) / 385571) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50808128 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50808128 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50808128 : Rat) / 385571) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101616256 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50808128 : Rat) / 385571) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1430_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1430
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1431 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1431 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1431 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(11, 1), (12, 3), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1431_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1431
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1432 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1432 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1432 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1432_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1432
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1433 : Poly :=
[
  term ((4292848 : Rat) / 158397) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1433 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1433 : Poly :=
[
  term ((-8585696 : Rat) / 158397) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((4292848 : Rat) / 158397) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((4292848 : Rat) / 158397) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((8585696 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4292848 : Rat) / 158397) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4292848 : Rat) / 158397) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1433_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1433
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1434 : Poly :=
[
  term ((-6379912 : Rat) / 385571) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1434 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1434 : Poly :=
[
  term ((12759824 : Rat) / 385571) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6379912 : Rat) / 385571) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6379912 : Rat) / 385571) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12759824 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6379912 : Rat) / 385571) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6379912 : Rat) / 385571) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1434_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1434
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1435 : Poly :=
[
  term ((-5345032 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 1435 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1435 : Poly :=
[
  term ((10690064 : Rat) / 158397) [(2, 1), (11, 1), (15, 1)],
  term ((-5345032 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-5345032 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((-10690064 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)],
  term ((5345032 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((5345032 : Rat) / 158397) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1435_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1435
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1436 : Poly :=
[
  term ((-16153616 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1436 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1436 : Poly :=
[
  term ((32307232 : Rat) / 385571) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16153616 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16153616 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32307232 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16153616 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16153616 : Rat) / 385571) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1436_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1436
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1437 : Poly :=
[
  term ((-12258358 : Rat) / 158397) [(12, 1)]
]

/-- Partial product 1437 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1437 : Poly :=
[
  term ((24516716 : Rat) / 158397) [(2, 1), (12, 1)],
  term ((-12258358 : Rat) / 158397) [(2, 2), (12, 1)],
  term ((-12258358 : Rat) / 158397) [(3, 2), (12, 1)],
  term ((12258358 : Rat) / 158397) [(12, 1), (13, 2)],
  term ((-24516716 : Rat) / 158397) [(12, 2)],
  term ((12258358 : Rat) / 158397) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1437_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1437
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1438 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1438 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1438 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(12, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1438_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1438
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1439 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1439 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1439 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1439_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1439
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1440 : Poly :=
[
  term ((3381616 : Rat) / 158397) [(12, 1), (14, 1)]
]

/-- Partial product 1440 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1440 : Poly :=
[
  term ((-6763232 : Rat) / 158397) [(2, 1), (12, 1), (14, 1)],
  term ((3381616 : Rat) / 158397) [(2, 2), (12, 1), (14, 1)],
  term ((3381616 : Rat) / 158397) [(3, 2), (12, 1), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(12, 1), (13, 2), (14, 1)],
  term ((6763232 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1440_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1440
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1441 : Poly :=
[
  term ((-40960 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 1441 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1441 : Poly :=
[
  term ((81920 : Rat) / 158397) [(2, 1), (12, 1), (15, 2)],
  term ((-40960 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((-40960 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)],
  term ((40960 : Rat) / 158397) [(12, 1), (13, 2), (15, 2)],
  term ((-81920 : Rat) / 158397) [(12, 2), (15, 2)],
  term ((40960 : Rat) / 158397) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1441_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1441
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1442 : Poly :=
[
  term ((-35173952 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1442 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1442 : Poly :=
[
  term ((70347904 : Rat) / 385571) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35173952 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-35173952 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((35173952 : Rat) / 385571) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-70347904 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((35173952 : Rat) / 385571) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1442_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1442
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1443 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(12, 2), (15, 2)]
]

/-- Partial product 1443 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1443 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(2, 1), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (12, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(12, 2), (13, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(12, 3), (15, 2)],
  term ((4014080 : Rat) / 158397) [(12, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1443_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1443
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1444 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1444 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1444 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(12, 3), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1444_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1444
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1445 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1445 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1445 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1445_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1445
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1446 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1446 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1446 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1446_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1446
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1447 : Poly :=
[
  term ((5418256 : Rat) / 158397) [(13, 1), (15, 1)]
]

/-- Partial product 1447 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1447 : Poly :=
[
  term ((-10836512 : Rat) / 158397) [(2, 1), (13, 1), (15, 1)],
  term ((5418256 : Rat) / 158397) [(2, 2), (13, 1), (15, 1)],
  term ((5418256 : Rat) / 158397) [(3, 2), (13, 1), (15, 1)],
  term ((10836512 : Rat) / 158397) [(12, 1), (13, 1), (15, 1)],
  term ((-5418256 : Rat) / 158397) [(12, 2), (13, 1), (15, 1)],
  term ((-5418256 : Rat) / 158397) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1447_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1447
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1448 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1448 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1448 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1448_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1448
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1449 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(13, 2), (15, 2)]
]

/-- Partial product 1449 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1449 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(2, 1), (13, 2), (15, 2)],
  term ((-678880 : Rat) / 52799) [(2, 2), (13, 2), (15, 2)],
  term ((-678880 : Rat) / 52799) [(3, 2), (13, 2), (15, 2)],
  term ((-1357760 : Rat) / 52799) [(12, 1), (13, 2), (15, 2)],
  term ((678880 : Rat) / 52799) [(12, 2), (13, 2), (15, 2)],
  term ((678880 : Rat) / 52799) [(13, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1449_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1449
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1450 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1450 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1450 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((36665208 : Rat) / 385571) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1450_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1450
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1451 : Poly :=
[
  term ((-5811920 : Rat) / 158397) [(14, 1)]
]

/-- Partial product 1451 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1451 : Poly :=
[
  term ((11623840 : Rat) / 158397) [(2, 1), (14, 1)],
  term ((-5811920 : Rat) / 158397) [(2, 2), (14, 1)],
  term ((-5811920 : Rat) / 158397) [(3, 2), (14, 1)],
  term ((-11623840 : Rat) / 158397) [(12, 1), (14, 1)],
  term ((5811920 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((5811920 : Rat) / 158397) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1451_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1451
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1452 : Poly :=
[
  term ((-1003520 : Rat) / 158397) [(14, 1), (15, 2)]
]

/-- Partial product 1452 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1452 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(2, 1), (14, 1), (15, 2)],
  term ((-1003520 : Rat) / 158397) [(2, 2), (14, 1), (15, 2)],
  term ((-1003520 : Rat) / 158397) [(3, 2), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)],
  term ((1003520 : Rat) / 158397) [(12, 2), (14, 1), (15, 2)],
  term ((1003520 : Rat) / 158397) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1452_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1452
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1453 : Poly :=
[
  term ((4986560 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1453 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1453 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((4986560 : Rat) / 385571) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((4986560 : Rat) / 385571) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4986560 : Rat) / 385571) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1453_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1453
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1454 : Poly :=
[
  term ((4621936 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 1454 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1454 : Poly :=
[
  term ((-9243872 : Rat) / 158397) [(2, 1), (15, 2)],
  term ((4621936 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((4621936 : Rat) / 158397) [(3, 2), (15, 2)],
  term ((9243872 : Rat) / 158397) [(12, 1), (15, 2)],
  term ((-4621936 : Rat) / 158397) [(12, 2), (15, 2)],
  term ((-4621936 : Rat) / 158397) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1454_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1454
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005NYN_coefficient_04_1455 : Poly :=
[
  term ((10779116 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 1455 for generator 4. -/
def rs_R005_ueqv_R005NYN_partial_04_1455 : Poly :=
[
  term ((-21558232 : Rat) / 385571) [(2, 1), (15, 2), (16, 1)],
  term ((10779116 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((10779116 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((21558232 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)],
  term ((-10779116 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((-10779116 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 4. -/
theorem rs_R005_ueqv_R005NYN_partial_04_1455_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_04_1455
        rs_R005_ueqv_R005NYN_generator_04_1400_1455 =
      rs_R005_ueqv_R005NYN_partial_04_1455 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_04_1400_1455 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_04_1400,
  rs_R005_ueqv_R005NYN_partial_04_1401,
  rs_R005_ueqv_R005NYN_partial_04_1402,
  rs_R005_ueqv_R005NYN_partial_04_1403,
  rs_R005_ueqv_R005NYN_partial_04_1404,
  rs_R005_ueqv_R005NYN_partial_04_1405,
  rs_R005_ueqv_R005NYN_partial_04_1406,
  rs_R005_ueqv_R005NYN_partial_04_1407,
  rs_R005_ueqv_R005NYN_partial_04_1408,
  rs_R005_ueqv_R005NYN_partial_04_1409,
  rs_R005_ueqv_R005NYN_partial_04_1410,
  rs_R005_ueqv_R005NYN_partial_04_1411,
  rs_R005_ueqv_R005NYN_partial_04_1412,
  rs_R005_ueqv_R005NYN_partial_04_1413,
  rs_R005_ueqv_R005NYN_partial_04_1414,
  rs_R005_ueqv_R005NYN_partial_04_1415,
  rs_R005_ueqv_R005NYN_partial_04_1416,
  rs_R005_ueqv_R005NYN_partial_04_1417,
  rs_R005_ueqv_R005NYN_partial_04_1418,
  rs_R005_ueqv_R005NYN_partial_04_1419,
  rs_R005_ueqv_R005NYN_partial_04_1420,
  rs_R005_ueqv_R005NYN_partial_04_1421,
  rs_R005_ueqv_R005NYN_partial_04_1422,
  rs_R005_ueqv_R005NYN_partial_04_1423,
  rs_R005_ueqv_R005NYN_partial_04_1424,
  rs_R005_ueqv_R005NYN_partial_04_1425,
  rs_R005_ueqv_R005NYN_partial_04_1426,
  rs_R005_ueqv_R005NYN_partial_04_1427,
  rs_R005_ueqv_R005NYN_partial_04_1428,
  rs_R005_ueqv_R005NYN_partial_04_1429,
  rs_R005_ueqv_R005NYN_partial_04_1430,
  rs_R005_ueqv_R005NYN_partial_04_1431,
  rs_R005_ueqv_R005NYN_partial_04_1432,
  rs_R005_ueqv_R005NYN_partial_04_1433,
  rs_R005_ueqv_R005NYN_partial_04_1434,
  rs_R005_ueqv_R005NYN_partial_04_1435,
  rs_R005_ueqv_R005NYN_partial_04_1436,
  rs_R005_ueqv_R005NYN_partial_04_1437,
  rs_R005_ueqv_R005NYN_partial_04_1438,
  rs_R005_ueqv_R005NYN_partial_04_1439,
  rs_R005_ueqv_R005NYN_partial_04_1440,
  rs_R005_ueqv_R005NYN_partial_04_1441,
  rs_R005_ueqv_R005NYN_partial_04_1442,
  rs_R005_ueqv_R005NYN_partial_04_1443,
  rs_R005_ueqv_R005NYN_partial_04_1444,
  rs_R005_ueqv_R005NYN_partial_04_1445,
  rs_R005_ueqv_R005NYN_partial_04_1446,
  rs_R005_ueqv_R005NYN_partial_04_1447,
  rs_R005_ueqv_R005NYN_partial_04_1448,
  rs_R005_ueqv_R005NYN_partial_04_1449,
  rs_R005_ueqv_R005NYN_partial_04_1450,
  rs_R005_ueqv_R005NYN_partial_04_1451,
  rs_R005_ueqv_R005NYN_partial_04_1452,
  rs_R005_ueqv_R005NYN_partial_04_1453,
  rs_R005_ueqv_R005NYN_partial_04_1454,
  rs_R005_ueqv_R005NYN_partial_04_1455
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_04_1400_1455 : Poly :=
[
  term ((-2152192 : Rat) / 52799) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-39331248 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((17079296 : Rat) / 158397) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((71072032 : Rat) / 385571) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12671296 : Rat) / 158397) [(2, 1), (9, 1), (15, 1)],
  term ((22728472 : Rat) / 385571) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(2, 1), (9, 2), (10, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(2, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (10, 1)],
  term ((8806400 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-40656320 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4935680 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((11162080 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3927584 : Rat) / 158397) [(2, 1), (10, 1), (15, 2)],
  term ((7525136 : Rat) / 385571) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(2, 1), (10, 2), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((12206080 : Rat) / 158397) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-101616256 : Rat) / 385571) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((84368000 : Rat) / 385571) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8585696 : Rat) / 158397) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((12759824 : Rat) / 385571) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10690064 : Rat) / 158397) [(2, 1), (11, 1), (15, 1)],
  term ((32307232 : Rat) / 385571) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((24516716 : Rat) / 158397) [(2, 1), (12, 1)],
  term ((1357760 : Rat) / 52799) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6763232 : Rat) / 158397) [(2, 1), (12, 1), (14, 1)],
  term ((81920 : Rat) / 158397) [(2, 1), (12, 1), (15, 2)],
  term ((70347904 : Rat) / 385571) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(2, 1), (12, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10836512 : Rat) / 158397) [(2, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(2, 1), (13, 2), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((11623840 : Rat) / 158397) [(2, 1), (14, 1)],
  term ((2007040 : Rat) / 158397) [(2, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9243872 : Rat) / 158397) [(2, 1), (15, 2)],
  term ((-21558232 : Rat) / 385571) [(2, 1), (15, 2), (16, 1)],
  term ((1076096 : Rat) / 52799) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((19665624 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (9, 1), (10, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8539648 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-35536016 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1115200 : Rat) / 158397) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((14174072 : Rat) / 385571) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6335648 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((-11364236 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(2, 2), (9, 2), (10, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(2, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (10, 1)],
  term ((-4403200 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20328160 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2467840 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5581040 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(2, 2), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1963792 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((-3762568 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(2, 2), (10, 2), (15, 2)],
  term ((763840 : Rat) / 385571) [(2, 2), (10, 2), (15, 2), (16, 1)],
  term ((-6103040 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((50808128 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4292848 : Rat) / 158397) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6379912 : Rat) / 385571) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5345032 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-16153616 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12258358 : Rat) / 158397) [(2, 2), (12, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3381616 : Rat) / 158397) [(2, 2), (12, 1), (14, 1)],
  term ((-40960 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((-35173952 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5418256 : Rat) / 158397) [(2, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (13, 2), (15, 2)],
  term ((18332604 : Rat) / 385571) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5811920 : Rat) / 158397) [(2, 2), (14, 1)],
  term ((-1003520 : Rat) / 158397) [(2, 2), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((4621936 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((10779116 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((1076096 : Rat) / 52799) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((19665624 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (9, 1), (10, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8539648 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-35536016 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1115200 : Rat) / 158397) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((14174072 : Rat) / 385571) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6335648 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)],
  term ((-11364236 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(3, 2), (9, 2), (10, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(3, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (10, 1)],
  term ((-4403200 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20328160 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2467840 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5581040 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(3, 2), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1963792 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)],
  term ((-3762568 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(3, 2), (10, 2), (15, 2)],
  term ((763840 : Rat) / 385571) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term ((-6103040 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((50808128 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4292848 : Rat) / 158397) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6379912 : Rat) / 385571) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5345032 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((-16153616 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12258358 : Rat) / 158397) [(3, 2), (12, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3381616 : Rat) / 158397) [(3, 2), (12, 1), (14, 1)],
  term ((-40960 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)],
  term ((-35173952 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5418256 : Rat) / 158397) [(3, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (13, 2), (15, 2)],
  term ((18332604 : Rat) / 385571) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5811920 : Rat) / 158397) [(3, 2), (14, 1)],
  term ((-1003520 : Rat) / 158397) [(3, 2), (14, 1), (15, 2)],
  term ((4986560 : Rat) / 385571) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((4621936 : Rat) / 158397) [(3, 2), (15, 2)],
  term ((10779116 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((2152192 : Rat) / 52799) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((39331248 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1076096 : Rat) / 52799) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-19665624 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1076096 : Rat) / 52799) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-19665624 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((8539648 : Rat) / 158397) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((35536016 : Rat) / 385571) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12671296 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)],
  term ((-22728472 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1115200 : Rat) / 158397) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-14174072 : Rat) / 385571) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23414944 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)],
  term ((-59707796 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5820416 : Rat) / 52799) [(9, 1), (12, 3), (15, 1)],
  term ((148928592 : Rat) / 385571) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 4), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 4), (15, 1), (16, 1)],
  term ((-1115200 : Rat) / 158397) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-14174072 : Rat) / 385571) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6335648 : Rat) / 158397) [(9, 1), (13, 2), (15, 1)],
  term ((11364236 : Rat) / 385571) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 1), (12, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 1), (13, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4312064 : Rat) / 385571) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((3234048 : Rat) / 385571) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((3234048 : Rat) / 385571) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8806400 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((40656320 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4935680 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11162080 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4403200 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-20328160 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2467840 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((5581040 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4403200 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-20328160 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2467840 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((5581040 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 1)],
  term ((4014080 : Rat) / 158397) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3927584 : Rat) / 158397) [(10, 1), (12, 1), (15, 2)],
  term ((-7525136 : Rat) / 385571) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 2)],
  term ((-2007040 : Rat) / 158397) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1963792 : Rat) / 158397) [(10, 1), (12, 2), (15, 2)],
  term ((3762568 : Rat) / 385571) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (13, 2)],
  term ((-2007040 : Rat) / 158397) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1963792 : Rat) / 158397) [(10, 1), (13, 2), (15, 2)],
  term ((3762568 : Rat) / 385571) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(10, 2), (12, 1), (15, 2)],
  term ((1527680 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(10, 2), (12, 2), (15, 2)],
  term ((-763840 : Rat) / 385571) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(10, 2), (13, 2), (15, 2)],
  term ((-763840 : Rat) / 385571) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((6103040 : Rat) / 158397) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-50808128 : Rat) / 385571) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8585696 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12759824 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10690064 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)],
  term ((-32307232 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4292848 : Rat) / 158397) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((6379912 : Rat) / 385571) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2287016 : Rat) / 52799) [(11, 1), (12, 2), (15, 1)],
  term ((117769872 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((26828800 : Rat) / 158397) [(11, 1), (12, 3), (15, 1)],
  term ((-135176128 : Rat) / 385571) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 4), (15, 1)],
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-4292848 : Rat) / 158397) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((6379912 : Rat) / 385571) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5345032 : Rat) / 158397) [(11, 1), (13, 2), (15, 1)],
  term ((16153616 : Rat) / 385571) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10836512 : Rat) / 158397) [(12, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12258358 : Rat) / 158397) [(12, 1), (13, 2)],
  term ((-3381616 : Rat) / 158397) [(12, 1), (13, 2), (14, 1)],
  term ((-4032320 : Rat) / 158397) [(12, 1), (13, 2), (15, 2)],
  term ((71839160 : Rat) / 385571) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11623840 : Rat) / 158397) [(12, 1), (14, 1)],
  term ((-2007040 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9243872 : Rat) / 158397) [(12, 1), (15, 2)],
  term ((21558232 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)],
  term ((-24516716 : Rat) / 158397) [(12, 2)],
  term ((-2036640 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5418256 : Rat) / 158397) [(12, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((6050720 : Rat) / 158397) [(12, 2), (13, 2), (15, 2)],
  term ((-38278844 : Rat) / 385571) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((12575152 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((1003520 : Rat) / 158397) [(12, 2), (14, 1), (15, 2)],
  term ((-4986560 : Rat) / 385571) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1567952 : Rat) / 52799) [(12, 2), (15, 2)],
  term ((-81127020 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((12258358 : Rat) / 158397) [(12, 3)],
  term ((678880 : Rat) / 52799) [(12, 3), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(12, 3), (14, 1)],
  term ((-2662400 : Rat) / 52799) [(12, 3), (15, 2)],
  term ((75066432 : Rat) / 385571) [(12, 3), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(12, 4), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(12, 4), (15, 2), (16, 1)],
  term ((5811920 : Rat) / 158397) [(13, 2), (14, 1)],
  term ((1003520 : Rat) / 158397) [(13, 2), (14, 1), (15, 2)],
  term ((-4986560 : Rat) / 385571) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4621936 : Rat) / 158397) [(13, 2), (15, 2)],
  term ((-10779116 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(13, 3), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5418256 : Rat) / 158397) [(13, 3), (15, 1)],
  term ((18332604 : Rat) / 385571) [(13, 3), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(13, 4), (15, 2)],
  term ((-18332604 : Rat) / 385571) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 1400 through 1455. -/
theorem rs_R005_ueqv_R005NYN_block_04_1400_1455_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_04_1400_1455
      rs_R005_ueqv_R005NYN_block_04_1400_1455 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
