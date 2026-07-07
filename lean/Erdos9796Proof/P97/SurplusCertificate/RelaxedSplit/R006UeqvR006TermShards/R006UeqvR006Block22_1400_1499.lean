/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1400-1499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1400_1499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1400 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1400 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1400 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1400_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1400
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1401 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1401 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1401 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1401_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1401
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1402 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1402 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1402 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1402_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1402
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1403 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1403 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1403 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1403_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1403
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1404 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1404 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1404 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1404_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1404
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1405 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1405 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1405 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1405_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1405
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1406 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1406 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1406 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1406_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1406
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1407 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1407 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1407 : Poly :=
[
  term ((-768 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((384 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1407_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1407
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1408 : Poly :=
[
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (12, 2)]
]

/-- Partial product 1408 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1408 : Poly :=
[
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((2592 : Rat) / 5) [(3, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1408_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1408
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1409 : Poly :=
[
  term ((-1296 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1409 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1409 : Poly :=
[
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((1296 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1409_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1409
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1410 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1410 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1410 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1410_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1410
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1411 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1411 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1411 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1411_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1411
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1412 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1412 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1412 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1412_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1412
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1413 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1413 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1413 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1413_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1413
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1414 : Poly :=
[
  term ((-19104 : Rat) / 35) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 1414 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1414 : Poly :=
[
  term ((-38208 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((19104 : Rat) / 35) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1414_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1414
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1415 : Poly :=
[
  term ((-1008 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1415 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1415 : Poly :=
[
  term ((-2016 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((1008 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1415_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1415
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1416 : Poly :=
[
  term ((336 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1416 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1416 : Poly :=
[
  term ((672 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-336 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1416_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1416
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1417 : Poly :=
[
  term ((912 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 1417 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1417 : Poly :=
[
  term ((1824 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1417_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1417
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1418 : Poly :=
[
  term ((-1026 : Rat) / 5) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1418 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1418 : Poly :=
[
  term ((-2052 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((1026 : Rat) / 5) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1418_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1418
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1419 : Poly :=
[
  term ((342 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1419 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1419 : Poly :=
[
  term ((684 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-342 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1419_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1419
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1420 : Poly :=
[
  term ((684 : Rat) / 5) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1420 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1420 : Poly :=
[
  term ((1368 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-684 : Rat) / 5) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1420_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1420
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1421 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1)]
]

/-- Partial product 1421 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1421 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1421_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1421
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1422 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1422 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1422 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1422_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1422
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1423 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1423 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1423 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1423_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1423
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1424 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1424 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1424 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1424_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1424
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1425 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 1425 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1425 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1425_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1425
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1426 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 1426 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1426 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1426_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1426
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1427 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1427 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1427 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1427_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1427
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1428 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1428 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1428 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1428_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1428
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1429 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1429 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1429 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1429_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1429
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1430 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1430 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1430 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (13, 2)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1430_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1430
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1431 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1431 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1431 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1431_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1431
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1432 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1432 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1432 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1432_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1432
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1433 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1433 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1433 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1433_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1433
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1434 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1434 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1434 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1434_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1434
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1435 : Poly :=
[
  term (-108 : Rat) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 1435 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1435 : Poly :=
[
  term (108 : Rat) [(3, 1), (10, 1), (13, 1)],
  term (-216 : Rat) [(3, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1435_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1435
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1436 : Poly :=
[
  term ((-264 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1436 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1436 : Poly :=
[
  term ((264 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-528 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1436_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1436
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1437 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1437 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1437 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1437_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1437
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1438 : Poly :=
[
  term ((168 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1438 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1438 : Poly :=
[
  term ((-168 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((336 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1438_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1438
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1439 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1439 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1439 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1439_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1439
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1440 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (10, 1), (13, 3)]
]

/-- Partial product 1440 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1440 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 1), (10, 1), (13, 3)],
  term ((-144 : Rat) / 35) [(3, 1), (10, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1440_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1440
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1441 : Poly :=
[
  term ((408 : Rat) / 5) [(3, 1), (11, 1)]
]

/-- Partial product 1441 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1441 : Poly :=
[
  term ((816 : Rat) / 5) [(3, 1), (10, 1), (11, 1)],
  term ((-408 : Rat) / 5) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1441_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1441
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1442 : Poly :=
[
  term ((-324 : Rat) / 5) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 1442 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1442 : Poly :=
[
  term ((-648 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1)],
  term ((324 : Rat) / 5) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1442_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1442
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1443 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1443 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1443 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1443_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1443
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1444 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1444 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1444 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1444_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1444
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1445 : Poly :=
[
  term ((-168 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1445 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1445 : Poly :=
[
  term ((-336 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((168 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1445_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1445
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1446 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1446 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1446 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1446_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1446
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1447 : Poly :=
[
  term (24 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1447 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1447 : Poly :=
[
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1447_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1447
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1448 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 1448 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1448 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((864 : Rat) / 5) [(3, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1448_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1448
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1449 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1449 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1449 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((432 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1449_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1449
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1450 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1450 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1450 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1450_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1450
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1451 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1451 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1451 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1451_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1451
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1452 : Poly :=
[
  term ((36 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1452 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1452 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1452_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1452
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1453 : Poly :=
[
  term ((108 : Rat) / 35) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 1453 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1453 : Poly :=
[
  term ((216 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (13, 2)],
  term ((-108 : Rat) / 35) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1453_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1453
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1454 : Poly :=
[
  term ((372 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 1454 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1454 : Poly :=
[
  term ((744 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-372 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1454_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1454
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1455 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1455 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1455 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1455_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1455
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1456 : Poly :=
[
  term ((-164 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1456 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1456 : Poly :=
[
  term ((-328 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((164 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1456_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1456
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1457 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1457 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1457 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1457_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1457
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1458 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1458 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1458 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1458_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1458
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1459 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

/-- Partial product 1459 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1459 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1459_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1459
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1460 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1460 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1460 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1460_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1460
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1461 : Poly :=
[
  term ((498 : Rat) / 5) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1461 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1461 : Poly :=
[
  term ((996 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-498 : Rat) / 5) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1461_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1461
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1462 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1462 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1462 : Poly :=
[
  term ((324 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1462_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1462
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1463 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1463 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1463 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1463_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1463
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1464 : Poly :=
[
  term ((-146 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1464 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1464 : Poly :=
[
  term ((-292 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((146 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1464_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1464
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1465 : Poly :=
[
  term ((-36 : Rat) / 35) [(3, 1), (12, 2), (13, 1)]
]

/-- Partial product 1465 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1465 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((36 : Rat) / 35) [(3, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1465_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1465
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1466 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1466 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1466 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1466_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1466
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1467 : Poly :=
[
  term ((-204 : Rat) / 5) [(3, 1), (13, 1)]
]

/-- Partial product 1467 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1467 : Poly :=
[
  term ((-408 : Rat) / 5) [(3, 1), (10, 1), (13, 1)],
  term ((204 : Rat) / 5) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1467_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1467
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1468 : Poly :=
[
  term ((-186 : Rat) / 5) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 1468 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1468 : Poly :=
[
  term ((-372 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((186 : Rat) / 5) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1468_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1468
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1469 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1469 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1469 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1469_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1469
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1470 : Poly :=
[
  term ((82 : Rat) / 5) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1470 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1470 : Poly :=
[
  term ((164 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82 : Rat) / 5) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1470_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1470
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1471 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1471 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1471 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1471_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1471
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1472 : Poly :=
[
  term ((-36 : Rat) / 35) [(3, 1), (13, 3)]
]

/-- Partial product 1472 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1472 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (10, 1), (13, 3)],
  term ((36 : Rat) / 35) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1472_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1472
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1473 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 1473 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1473 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((576 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1473_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1473
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1474 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1474 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1474 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1474_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1474
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1475 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1475 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1475 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1475_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1475
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1476 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1476 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1476 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1476_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1476
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1477 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 1477 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1477 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1477_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1477
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1478 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1478 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1478 : Poly :=
[
  term ((-1152 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1478_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1478
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1479 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1479 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1479 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1479_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1479
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1480 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1480 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1480 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1480_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1480
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1481 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1481 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1481 : Poly :=
[
  term ((384 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1481_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1481
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1482 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1482 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1482 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1482_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1482
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1483 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1483 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1483 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1483_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1483
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1484 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1484 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1484 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1484_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1484
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1485 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1)]
]

/-- Partial product 1485 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1485 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1485_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1485
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1486 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 1486 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1486 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1486_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1486
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1487 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1487 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1487 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1487_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1487
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1488 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1488 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1488 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1488_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1488
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1489 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1489 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1489 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1489_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1489
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1490 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1490 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1490 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1490_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1490
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1491 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1491 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1491 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1491_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1491
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1492 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1492 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1492 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1492_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1492
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1493 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1493 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1493 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1493_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1493
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1494 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1494 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1494 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1494_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1494
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1495 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1495 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1495 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1495_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1495
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1496 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1496 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1496 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1496_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1496
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1497 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1497 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1497 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1497_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1497
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1498 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2)]
]

/-- Partial product 1498 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1498 : Poly :=
[
  term ((-1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1498_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1498
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1499 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1499 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1499 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1499_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1499
        rs_R006_ueqv_R006_generator_22_1400_1499 =
      rs_R006_ueqv_R006_partial_22_1499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1400_1499 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1400,
  rs_R006_ueqv_R006_partial_22_1401,
  rs_R006_ueqv_R006_partial_22_1402,
  rs_R006_ueqv_R006_partial_22_1403,
  rs_R006_ueqv_R006_partial_22_1404,
  rs_R006_ueqv_R006_partial_22_1405,
  rs_R006_ueqv_R006_partial_22_1406,
  rs_R006_ueqv_R006_partial_22_1407,
  rs_R006_ueqv_R006_partial_22_1408,
  rs_R006_ueqv_R006_partial_22_1409,
  rs_R006_ueqv_R006_partial_22_1410,
  rs_R006_ueqv_R006_partial_22_1411,
  rs_R006_ueqv_R006_partial_22_1412,
  rs_R006_ueqv_R006_partial_22_1413,
  rs_R006_ueqv_R006_partial_22_1414,
  rs_R006_ueqv_R006_partial_22_1415,
  rs_R006_ueqv_R006_partial_22_1416,
  rs_R006_ueqv_R006_partial_22_1417,
  rs_R006_ueqv_R006_partial_22_1418,
  rs_R006_ueqv_R006_partial_22_1419,
  rs_R006_ueqv_R006_partial_22_1420,
  rs_R006_ueqv_R006_partial_22_1421,
  rs_R006_ueqv_R006_partial_22_1422,
  rs_R006_ueqv_R006_partial_22_1423,
  rs_R006_ueqv_R006_partial_22_1424,
  rs_R006_ueqv_R006_partial_22_1425,
  rs_R006_ueqv_R006_partial_22_1426,
  rs_R006_ueqv_R006_partial_22_1427,
  rs_R006_ueqv_R006_partial_22_1428,
  rs_R006_ueqv_R006_partial_22_1429,
  rs_R006_ueqv_R006_partial_22_1430,
  rs_R006_ueqv_R006_partial_22_1431,
  rs_R006_ueqv_R006_partial_22_1432,
  rs_R006_ueqv_R006_partial_22_1433,
  rs_R006_ueqv_R006_partial_22_1434,
  rs_R006_ueqv_R006_partial_22_1435,
  rs_R006_ueqv_R006_partial_22_1436,
  rs_R006_ueqv_R006_partial_22_1437,
  rs_R006_ueqv_R006_partial_22_1438,
  rs_R006_ueqv_R006_partial_22_1439,
  rs_R006_ueqv_R006_partial_22_1440,
  rs_R006_ueqv_R006_partial_22_1441,
  rs_R006_ueqv_R006_partial_22_1442,
  rs_R006_ueqv_R006_partial_22_1443,
  rs_R006_ueqv_R006_partial_22_1444,
  rs_R006_ueqv_R006_partial_22_1445,
  rs_R006_ueqv_R006_partial_22_1446,
  rs_R006_ueqv_R006_partial_22_1447,
  rs_R006_ueqv_R006_partial_22_1448,
  rs_R006_ueqv_R006_partial_22_1449,
  rs_R006_ueqv_R006_partial_22_1450,
  rs_R006_ueqv_R006_partial_22_1451,
  rs_R006_ueqv_R006_partial_22_1452,
  rs_R006_ueqv_R006_partial_22_1453,
  rs_R006_ueqv_R006_partial_22_1454,
  rs_R006_ueqv_R006_partial_22_1455,
  rs_R006_ueqv_R006_partial_22_1456,
  rs_R006_ueqv_R006_partial_22_1457,
  rs_R006_ueqv_R006_partial_22_1458,
  rs_R006_ueqv_R006_partial_22_1459,
  rs_R006_ueqv_R006_partial_22_1460,
  rs_R006_ueqv_R006_partial_22_1461,
  rs_R006_ueqv_R006_partial_22_1462,
  rs_R006_ueqv_R006_partial_22_1463,
  rs_R006_ueqv_R006_partial_22_1464,
  rs_R006_ueqv_R006_partial_22_1465,
  rs_R006_ueqv_R006_partial_22_1466,
  rs_R006_ueqv_R006_partial_22_1467,
  rs_R006_ueqv_R006_partial_22_1468,
  rs_R006_ueqv_R006_partial_22_1469,
  rs_R006_ueqv_R006_partial_22_1470,
  rs_R006_ueqv_R006_partial_22_1471,
  rs_R006_ueqv_R006_partial_22_1472,
  rs_R006_ueqv_R006_partial_22_1473,
  rs_R006_ueqv_R006_partial_22_1474,
  rs_R006_ueqv_R006_partial_22_1475,
  rs_R006_ueqv_R006_partial_22_1476,
  rs_R006_ueqv_R006_partial_22_1477,
  rs_R006_ueqv_R006_partial_22_1478,
  rs_R006_ueqv_R006_partial_22_1479,
  rs_R006_ueqv_R006_partial_22_1480,
  rs_R006_ueqv_R006_partial_22_1481,
  rs_R006_ueqv_R006_partial_22_1482,
  rs_R006_ueqv_R006_partial_22_1483,
  rs_R006_ueqv_R006_partial_22_1484,
  rs_R006_ueqv_R006_partial_22_1485,
  rs_R006_ueqv_R006_partial_22_1486,
  rs_R006_ueqv_R006_partial_22_1487,
  rs_R006_ueqv_R006_partial_22_1488,
  rs_R006_ueqv_R006_partial_22_1489,
  rs_R006_ueqv_R006_partial_22_1490,
  rs_R006_ueqv_R006_partial_22_1491,
  rs_R006_ueqv_R006_partial_22_1492,
  rs_R006_ueqv_R006_partial_22_1493,
  rs_R006_ueqv_R006_partial_22_1494,
  rs_R006_ueqv_R006_partial_22_1495,
  rs_R006_ueqv_R006_partial_22_1496,
  rs_R006_ueqv_R006_partial_22_1497,
  rs_R006_ueqv_R006_partial_22_1498,
  rs_R006_ueqv_R006_partial_22_1499
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1400_1499 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38208 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((-2016 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((672 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1824 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2052 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((684 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1368 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 2)],
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(3, 1), (9, 1), (12, 2)],
  term ((1296 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19104 : Rat) / 35) [(3, 1), (9, 1), (13, 2)],
  term ((1008 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-336 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((1026 : Rat) / 5) [(3, 1), (9, 1), (14, 1)],
  term ((-342 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-684 : Rat) / 5) [(3, 1), (9, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(3, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (9, 2), (13, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((816 : Rat) / 5) [(3, 1), (10, 1), (11, 1)],
  term ((-648 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1)],
  term ((48 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-336 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((-864 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (13, 2)],
  term ((744 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-328 : Rat) / 5) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(3, 1), (10, 1), (13, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (11, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term (-216 : Rat) [(3, 1), (10, 2), (13, 1)],
  term ((-528 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((336 : Rat) / 5) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (10, 2), (13, 3)],
  term ((-408 : Rat) / 5) [(3, 1), (11, 1)],
  term ((324 : Rat) / 5) [(3, 1), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((168 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((864 : Rat) / 5) [(3, 1), (11, 1), (12, 2)],
  term ((432 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 35) [(3, 1), (11, 1), (13, 2)],
  term ((-372 : Rat) / 5) [(3, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((164 : Rat) / 5) [(3, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (12, 1), (13, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-498 : Rat) / 5) [(3, 1), (12, 1), (13, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((146 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 35) [(3, 1), (12, 2), (13, 1)],
  term ((12 : Rat) / 5) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((204 : Rat) / 5) [(3, 1), (13, 1)],
  term ((186 : Rat) / 5) [(3, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-82 : Rat) / 5) [(3, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 35) [(3, 1), (13, 3)],
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((576 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1152 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((192 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((864 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((576 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((432 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2)],
  term ((1152 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (14, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1400 through 1499. -/
theorem rs_R006_ueqv_R006_block_22_1400_1499_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1400_1499
      rs_R006_ueqv_R006_block_22_1400_1499 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
