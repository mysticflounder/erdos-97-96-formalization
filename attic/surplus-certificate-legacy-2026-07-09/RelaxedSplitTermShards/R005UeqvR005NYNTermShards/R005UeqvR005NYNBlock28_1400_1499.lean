/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 28:1400-1499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_28_1400_1499 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 1400 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1400 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1400 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1400 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1400_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1400
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1401 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1401 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1401 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1401_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1401
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1402 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1402 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1402 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1402_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1402
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1403 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1403 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1403 : Poly :=
[
  term ((8921600 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1403_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1403
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1404 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1404 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1404 : Poly :=
[
  term ((113392576 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1404_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1404
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1405 : Poly :=
[
  term ((21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1405 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1405 : Poly :=
[
  term ((-42916352 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((21458176 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1405_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1405
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1406 : Poly :=
[
  term ((-11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1406 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1406 : Poly :=
[
  term ((22014176 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1406_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1406
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1407 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1407 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1407 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1407_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1407
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1408 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1408 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1408 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1408_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1408
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1409 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1409 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1409 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1409_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1409
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1409 := by
  native_decide

/-- Coefficient term 1410 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1410 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1410 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1410 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1410 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1410_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1410
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1410 := by
  native_decide

/-- Coefficient term 1411 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1411 : Poly :=
[
  term ((-4718720 : Rat) / 158397) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1411 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1411 : Poly :=
[
  term ((9437440 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1411 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1411_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1411
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1411 := by
  native_decide

/-- Coefficient term 1412 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1412 : Poly :=
[
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1412 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1412 : Poly :=
[
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((21980048 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1412 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1412_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1412
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1412 := by
  native_decide

/-- Coefficient term 1413 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1413 : Poly :=
[
  term ((3427840 : Rat) / 158397) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1413 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1413 : Poly :=
[
  term ((-6855680 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((3427840 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-6855680 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((3427840 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1413 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1413_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1413
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1413 := by
  native_decide

/-- Coefficient term 1414 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1414 : Poly :=
[
  term ((-51350368 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1414 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1414 : Poly :=
[
  term ((102700736 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51350368 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((102700736 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51350368 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1414 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1414_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1414
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1414 := by
  native_decide

/-- Coefficient term 1415 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1415 : Poly :=
[
  term ((2958914 : Rat) / 158397) [(7, 1), (13, 1)]
]

/-- Partial product 1415 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1415 : Poly :=
[
  term ((-5917828 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((2958914 : Rat) / 158397) [(0, 2), (7, 1), (13, 1)],
  term ((-5917828 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2958914 : Rat) / 158397) [(1, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1415 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1415_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1415
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1415 := by
  native_decide

/-- Coefficient term 1416 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1416 : Poly :=
[
  term ((-7053440 : Rat) / 158397) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1416 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1416 : Poly :=
[
  term ((14106880 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7053440 : Rat) / 158397) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((14106880 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-7053440 : Rat) / 158397) [(1, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1416 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1416_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1416
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1416 := by
  native_decide

/-- Coefficient term 1417 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1417 : Poly :=
[
  term ((24271568 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1417 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1417 : Poly :=
[
  term ((-48543136 : Rat) / 385571) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24271568 : Rat) / 385571) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48543136 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((24271568 : Rat) / 385571) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1417 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1417_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1417
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1417 := by
  native_decide

/-- Coefficient term 1418 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1418 : Poly :=
[
  term ((678880 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1418 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1418 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((678880 : Rat) / 52799) [(1, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1418 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1418_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1418
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1418 := by
  native_decide

/-- Coefficient term 1419 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1419 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1419 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1419 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1419 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1419_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1419
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1419 := by
  native_decide

/-- Coefficient term 1420 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1420 : Poly :=
[
  term ((-3427840 : Rat) / 158397) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1420 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1420 : Poly :=
[
  term ((6855680 : Rat) / 158397) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-3427840 : Rat) / 158397) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((6855680 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-3427840 : Rat) / 158397) [(1, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1420 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1420_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1420
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1420 := by
  native_decide

/-- Coefficient term 1421 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1421 : Poly :=
[
  term ((51350368 : Rat) / 385571) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1421 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1421 : Poly :=
[
  term ((-102700736 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((51350368 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102700736 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((51350368 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1421 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1421_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1421
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1421 := by
  native_decide

/-- Coefficient term 1422 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1422 : Poly :=
[
  term ((1018320 : Rat) / 52799) [(7, 1), (15, 1)]
]

/-- Partial product 1422 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1422 : Poly :=
[
  term ((-2036640 : Rat) / 52799) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((1018320 : Rat) / 52799) [(0, 2), (7, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(1, 1), (7, 1), (15, 2)],
  term ((1018320 : Rat) / 52799) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1422 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1422_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1422
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1422 := by
  native_decide

/-- Coefficient term 1423 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1423 : Poly :=
[
  term ((-27498906 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1423 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1423 : Poly :=
[
  term ((54997812 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27498906 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-27498906 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1423 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1423_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1423
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1423 := by
  native_decide

/-- Coefficient term 1424 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1424 : Poly :=
[
  term ((2036640 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1424 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1424 : Poly :=
[
  term ((-4073280 : Rat) / 52799) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((-4073280 : Rat) / 52799) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((2036640 : Rat) / 52799) [(1, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1424 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1424_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1424
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1424 := by
  native_decide

/-- Coefficient term 1425 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1425 : Poly :=
[
  term ((-54997812 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1425 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1425 : Poly :=
[
  term ((109995624 : Rat) / 385571) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((109995624 : Rat) / 385571) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1425 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1425_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1425
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1425 := by
  native_decide

/-- Coefficient term 1426 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1426 : Poly :=
[
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1426 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1426 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1426 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1426_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1426
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1426 := by
  native_decide

/-- Coefficient term 1427 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1427 : Poly :=
[
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1427 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1427 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1427 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1427_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1427
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1427 := by
  native_decide

/-- Coefficient term 1428 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1428 : Poly :=
[
  term ((-1473600 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1428 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1428 : Poly :=
[
  term ((2947200 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1473600 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((2947200 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-1473600 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1428 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1428_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1428
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1428 := by
  native_decide

/-- Coefficient term 1429 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1429 : Poly :=
[
  term ((-53471736 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1429 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1429 : Poly :=
[
  term ((106943472 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53471736 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((106943472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-53471736 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1429 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1429_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1429
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1429 := by
  native_decide

/-- Coefficient term 1430 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1430 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1430 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1430 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1430 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1430_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1430
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1430 := by
  native_decide

/-- Coefficient term 1431 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1431 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1431 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1431 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1431 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1431_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1431
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1431 := by
  native_decide

/-- Coefficient term 1432 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1432 : Poly :=
[
  term ((4536704 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1432 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1432 : Poly :=
[
  term ((-9073408 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((4536704 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-9073408 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((4536704 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1432 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1432_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1432
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1432 := by
  native_decide

/-- Coefficient term 1433 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1433 : Poly :=
[
  term ((-52897232 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1433 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1433 : Poly :=
[
  term ((105794464 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52897232 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((105794464 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52897232 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1433 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1433_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1433
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1433 := by
  native_decide

/-- Coefficient term 1434 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1434 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1434 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1434 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1434 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1434_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1434
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1434 := by
  native_decide

/-- Coefficient term 1435 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1435 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1435 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1435 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1435 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1435_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1435
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1435 := by
  native_decide

/-- Coefficient term 1436 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1436 : Poly :=
[
  term ((-1280448 : Rat) / 52799) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1436 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1436 : Poly :=
[
  term ((2560896 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1280448 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2560896 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1280448 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1436 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1436_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1436
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1436 := by
  native_decide

/-- Coefficient term 1437 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1437 : Poly :=
[
  term ((71484984 : Rat) / 385571) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1437 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1437 : Poly :=
[
  term ((-142969968 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((71484984 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142969968 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((71484984 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1437 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1437_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1437
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1437 := by
  native_decide

/-- Coefficient term 1438 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1438 : Poly :=
[
  term ((1003040 : Rat) / 52799) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1438 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1438 : Poly :=
[
  term ((-2006080 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1003040 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-2006080 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((1003040 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1438 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1438_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1438
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1438 := by
  native_decide

/-- Coefficient term 1439 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1439 : Poly :=
[
  term ((28352892 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1439 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1439 : Poly :=
[
  term ((-56705784 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28352892 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56705784 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((28352892 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1439 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1439_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1439
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1439 := by
  native_decide

/-- Coefficient term 1440 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1440 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1440 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1440 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1440 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1440_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1440
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1440 := by
  native_decide

/-- Coefficient term 1441 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1441 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1441 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1441 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1441 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1441_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1441
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1441 := by
  native_decide

/-- Coefficient term 1442 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1442 : Poly :=
[
  term ((-1034240 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1442 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1442 : Poly :=
[
  term ((2068480 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1034240 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2068480 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1034240 : Rat) / 52799) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1442 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1442_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1442
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1442 := by
  native_decide

/-- Coefficient term 1443 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1443 : Poly :=
[
  term ((27054960 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1443 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1443 : Poly :=
[
  term ((-54109920 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((27054960 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54109920 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((27054960 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1443 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1443_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1443
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1443 := by
  native_decide

/-- Coefficient term 1444 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1444 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1444 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1444 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1444 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1444_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1444
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1444 := by
  native_decide

/-- Coefficient term 1445 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1445 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1445 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1445 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1445 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1445_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1445
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1445 := by
  native_decide

/-- Coefficient term 1446 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1446 : Poly :=
[
  term ((2232320 : Rat) / 158397) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1446 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1446 : Poly :=
[
  term ((-4464640 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2232320 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-4464640 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((2232320 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1446 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1446_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1446
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1446 := by
  native_decide

/-- Coefficient term 1447 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1447 : Poly :=
[
  term ((-14195840 : Rat) / 385571) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1447 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1447 : Poly :=
[
  term ((28391680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14195840 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((28391680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-14195840 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1447 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1447_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1447
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1447 := by
  native_decide

/-- Coefficient term 1448 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1448 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1448 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1448 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1448 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1448_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1448
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1448 := by
  native_decide

/-- Coefficient term 1449 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1449 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1449 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1449 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1449 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1449_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1449
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1449 := by
  native_decide

/-- Coefficient term 1450 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1450 : Poly :=
[
  term ((4567040 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1450 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1450 : Poly :=
[
  term ((-9134080 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4567040 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9134080 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((4567040 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1450 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1450_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1450
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1450 := by
  native_decide

/-- Coefficient term 1451 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1451 : Poly :=
[
  term ((-1281248 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1451 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1451 : Poly :=
[
  term ((2562496 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1281248 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2562496 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1281248 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1451 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1451_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1451
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1451 := by
  native_decide

/-- Coefficient term 1452 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1452 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1452 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1452 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1452 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1452_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1452
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1452 := by
  native_decide

/-- Coefficient term 1453 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1453 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1453 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1453 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1453 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1453_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1453
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1453 := by
  native_decide

/-- Coefficient term 1454 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1454 : Poly :=
[
  term ((-399360 : Rat) / 52799) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1454 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1454 : Poly :=
[
  term ((798720 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-399360 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((798720 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-399360 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1454 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1454_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1454
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1454 := by
  native_decide

/-- Coefficient term 1455 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1455 : Poly :=
[
  term ((-10028592 : Rat) / 385571) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1455 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1455 : Poly :=
[
  term ((20057184 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10028592 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20057184 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10028592 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1455 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1455_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1455
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1455 := by
  native_decide

/-- Coefficient term 1456 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1456 : Poly :=
[
  term ((2053120 : Rat) / 52799) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1456 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1456 : Poly :=
[
  term ((-4106240 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((2053120 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4106240 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((2053120 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1456 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1456_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1456
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1456 := by
  native_decide

/-- Coefficient term 1457 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1457 : Poly :=
[
  term ((-10047000 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1457 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1457 : Poly :=
[
  term ((20094000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10047000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((20094000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10047000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1457 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1457_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1457
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1457 := by
  native_decide

/-- Coefficient term 1458 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1458 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1458 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1458 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1458 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1458_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1458
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1458 := by
  native_decide

/-- Coefficient term 1459 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1459 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1459 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1459 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1459 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1459_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1459
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1459 := by
  native_decide

/-- Coefficient term 1460 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1460 : Poly :=
[
  term ((3727360 : Rat) / 158397) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1460 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1460 : Poly :=
[
  term ((-7454720 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3727360 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-7454720 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((3727360 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1460 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1460_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1460
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1460 := by
  native_decide

/-- Coefficient term 1461 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1461 : Poly :=
[
  term ((7546112 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1461 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1461 : Poly :=
[
  term ((-15092224 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7546112 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15092224 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((7546112 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1461 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1461_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1461
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1461 := by
  native_decide

/-- Coefficient term 1462 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1462 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1462 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1462 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1462 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1462_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1462
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1462 := by
  native_decide

/-- Coefficient term 1463 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1463 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1463 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1463 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1463 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1463_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1463
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1463 := by
  native_decide

/-- Coefficient term 1464 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1464 : Poly :=
[
  term ((-1576960 : Rat) / 52799) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1464 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1464 : Poly :=
[
  term ((3153920 : Rat) / 52799) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-1576960 : Rat) / 52799) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((3153920 : Rat) / 52799) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1576960 : Rat) / 52799) [(1, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1464 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1464_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1464
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1464 := by
  native_decide

/-- Coefficient term 1465 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1465 : Poly :=
[
  term ((-2559552 : Rat) / 385571) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1465 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1465 : Poly :=
[
  term ((5119104 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2559552 : Rat) / 385571) [(0, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((5119104 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2559552 : Rat) / 385571) [(1, 2), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1465 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1465_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1465
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1465 := by
  native_decide

/-- Coefficient term 1466 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1466 : Poly :=
[
  term ((-4894720 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 1466 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1466 : Poly :=
[
  term ((9789440 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4894720 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((9789440 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((-4894720 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1466 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1466_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1466
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1466 := by
  native_decide

/-- Coefficient term 1467 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1467 : Poly :=
[
  term ((12607288 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1467 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1467 : Poly :=
[
  term ((-25214576 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((12607288 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-25214576 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((12607288 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1467 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1467_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1467
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1467 := by
  native_decide

/-- Coefficient term 1468 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1468 : Poly :=
[
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1468 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1468 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2230400 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1468 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1468_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1468
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1468 := by
  native_decide

/-- Coefficient term 1469 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1469 : Poly :=
[
  term ((-28348144 : Rat) / 385571) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1469 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1469 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1469 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1469_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1469
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1469 := by
  native_decide

/-- Coefficient term 1470 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1470 : Poly :=
[
  term ((2877696 : Rat) / 52799) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1470 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1470 : Poly :=
[
  term ((-5755392 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2877696 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-5755392 : Rat) / 52799) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((2877696 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1470 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1470_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1470
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1470 := by
  native_decide

/-- Coefficient term 1471 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1471 : Poly :=
[
  term ((36894888 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1471 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1471 : Poly :=
[
  term ((-73789776 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((36894888 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-73789776 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((36894888 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1471 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1471_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1471
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1471 := by
  native_decide

/-- Coefficient term 1472 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1472 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 1472 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1472 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1472 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1472_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1472
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1472 := by
  native_decide

/-- Coefficient term 1473 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1473 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1473 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1473 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1473 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1473_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1473
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1473 := by
  native_decide

/-- Coefficient term 1474 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1474 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1474 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1474 : Poly :=
[
  term ((8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1474 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1474_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1474
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1474 := by
  native_decide

/-- Coefficient term 1475 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1475 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1475 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1475 : Poly :=
[
  term ((113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1475 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1475_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1475
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1475 := by
  native_decide

/-- Coefficient term 1476 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1476 : Poly :=
[
  term ((-6309248 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1476 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1476 : Poly :=
[
  term ((12618496 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6309248 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((12618496 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-6309248 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1476 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1476_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1476
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1476 := by
  native_decide

/-- Coefficient term 1477 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1477 : Poly :=
[
  term ((-7187872 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1477 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1477 : Poly :=
[
  term ((14375744 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7187872 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((14375744 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7187872 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1477 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1477_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1477
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1477 := by
  native_decide

/-- Coefficient term 1478 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1478 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1478 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1478 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1478 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1478_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1478
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1478 := by
  native_decide

/-- Coefficient term 1479 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1479 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1479 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1479 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1479 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1479_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1479
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1479 := by
  native_decide

/-- Coefficient term 1480 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1480 : Poly :=
[
  term ((17046080 : Rat) / 158397) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1480 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1480 : Poly :=
[
  term ((-34092160 : Rat) / 158397) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((17046080 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-34092160 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((17046080 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1480 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1480_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1480
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1480 := by
  native_decide

/-- Coefficient term 1481 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1481 : Poly :=
[
  term ((-23170760 : Rat) / 385571) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1481 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1481 : Poly :=
[
  term ((46341520 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23170760 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((46341520 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23170760 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1481 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1481_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1481
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1481 := by
  native_decide

/-- Coefficient term 1482 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1482 : Poly :=
[
  term ((-878976 : Rat) / 52799) [(9, 1), (15, 1)]
]

/-- Partial product 1482 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1482 : Poly :=
[
  term ((1757952 : Rat) / 52799) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-878976 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((1757952 : Rat) / 52799) [(1, 1), (9, 1), (15, 2)],
  term ((-878976 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1482 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1482_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1482
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1482 := by
  native_decide

/-- Coefficient term 1483 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1483 : Poly :=
[
  term ((-15544152 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1483 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1483 : Poly :=
[
  term ((31088304 : Rat) / 385571) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15544152 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((31088304 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-15544152 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1483 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1483_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1483
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1483 := by
  native_decide

/-- Coefficient term 1484 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1484 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(9, 2), (10, 1), (15, 2)]
]

/-- Partial product 1484 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1484 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (14, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (9, 2), (10, 1), (15, 2)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (15, 3)],
  term ((-1064960 : Rat) / 158397) [(1, 2), (9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1484 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1484_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1484
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1484 := by
  native_decide

/-- Coefficient term 1485 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1485 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1485 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1485 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1485 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1485_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1485
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1485 := by
  native_decide

/-- Coefficient term 1486 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1486 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1486 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1486 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(0, 1), (9, 2), (11, 1), (14, 2), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1486 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1486_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1486
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1486 := by
  native_decide

/-- Coefficient term 1487 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1487 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1487 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1487 : Poly :=
[
  term ((-4312064 : Rat) / 385571) [(0, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1487 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1487_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1487
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1487 := by
  native_decide

/-- Coefficient term 1488 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1488 : Poly :=
[
  term ((532480 : Rat) / 158397) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1488 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1488 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((532480 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1488 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1488_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1488
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1488 := by
  native_decide

/-- Coefficient term 1489 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1489 : Poly :=
[
  term ((1078016 : Rat) / 385571) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1489 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1489 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1078016 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1489 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1489_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1489
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1489 := by
  native_decide

/-- Coefficient term 1490 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1490 : Poly :=
[
  term (4 : Rat) [(10, 1)]
]

/-- Partial product 1490 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1490 : Poly :=
[
  term (-8 : Rat) [(0, 1), (10, 1), (14, 1)],
  term (4 : Rat) [(0, 2), (10, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (15, 1)],
  term (4 : Rat) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1490 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1490_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1490
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1490 := by
  native_decide

/-- Coefficient term 1491 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1491 : Poly :=
[
  term ((-4403200 : Rat) / 158397) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1491 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1491 : Poly :=
[
  term ((8806400 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4403200 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8806400 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4403200 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1491 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1491_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1491
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1491 := by
  native_decide

/-- Coefficient term 1492 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1492 : Poly :=
[
  term ((20328160 : Rat) / 385571) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1492 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1492 : Poly :=
[
  term ((-40656320 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((20328160 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40656320 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((20328160 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1492 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1492_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1492
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1492 := by
  native_decide

/-- Coefficient term 1493 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1493 : Poly :=
[
  term ((2713600 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1493 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1493 : Poly :=
[
  term ((-5427200 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2713600 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5427200 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((2713600 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1493 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1493_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1493
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1493 := by
  native_decide

/-- Coefficient term 1494 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1494 : Poly :=
[
  term ((-26673040 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1494 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1494 : Poly :=
[
  term ((53346080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26673040 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((53346080 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-26673040 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1494 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1494_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1494
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1494 := by
  native_decide

/-- Coefficient term 1495 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1495 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1495 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1495 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((2007040 : Rat) / 158397) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((2007040 : Rat) / 158397) [(1, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1495 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1495_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1495
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1495 := by
  native_decide

/-- Coefficient term 1496 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1496 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1496 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1496 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1496 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1496_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1496
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1496 := by
  native_decide

/-- Coefficient term 1497 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1497 : Poly :=
[
  term ((-1599728 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 1497 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1497 : Poly :=
[
  term ((3199456 : Rat) / 158397) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1599728 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((3199456 : Rat) / 158397) [(1, 1), (10, 1), (15, 3)],
  term ((-1599728 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1497 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1497_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1497
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1497 := by
  native_decide

/-- Coefficient term 1498 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1498 : Poly :=
[
  term ((7738232 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1498 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1498 : Poly :=
[
  term ((-15476464 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7738232 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-15476464 : Rat) / 385571) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((7738232 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1498 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1498_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1498
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1498 := by
  native_decide

/-- Coefficient term 1499 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1499 : Poly :=
[
  term ((-778240 : Rat) / 158397) [(10, 2), (15, 2)]
]

/-- Partial product 1499 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1499 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 158397) [(0, 2), (10, 2), (15, 2)],
  term ((1556480 : Rat) / 158397) [(1, 1), (10, 2), (15, 3)],
  term ((-778240 : Rat) / 158397) [(1, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1499 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1499_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1499
        rs_R005_ueqv_R005NYN_generator_28_1400_1499 =
      rs_R005_ueqv_R005NYN_partial_28_1499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_28_1400_1499 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_28_1400,
  rs_R005_ueqv_R005NYN_partial_28_1401,
  rs_R005_ueqv_R005NYN_partial_28_1402,
  rs_R005_ueqv_R005NYN_partial_28_1403,
  rs_R005_ueqv_R005NYN_partial_28_1404,
  rs_R005_ueqv_R005NYN_partial_28_1405,
  rs_R005_ueqv_R005NYN_partial_28_1406,
  rs_R005_ueqv_R005NYN_partial_28_1407,
  rs_R005_ueqv_R005NYN_partial_28_1408,
  rs_R005_ueqv_R005NYN_partial_28_1409,
  rs_R005_ueqv_R005NYN_partial_28_1410,
  rs_R005_ueqv_R005NYN_partial_28_1411,
  rs_R005_ueqv_R005NYN_partial_28_1412,
  rs_R005_ueqv_R005NYN_partial_28_1413,
  rs_R005_ueqv_R005NYN_partial_28_1414,
  rs_R005_ueqv_R005NYN_partial_28_1415,
  rs_R005_ueqv_R005NYN_partial_28_1416,
  rs_R005_ueqv_R005NYN_partial_28_1417,
  rs_R005_ueqv_R005NYN_partial_28_1418,
  rs_R005_ueqv_R005NYN_partial_28_1419,
  rs_R005_ueqv_R005NYN_partial_28_1420,
  rs_R005_ueqv_R005NYN_partial_28_1421,
  rs_R005_ueqv_R005NYN_partial_28_1422,
  rs_R005_ueqv_R005NYN_partial_28_1423,
  rs_R005_ueqv_R005NYN_partial_28_1424,
  rs_R005_ueqv_R005NYN_partial_28_1425,
  rs_R005_ueqv_R005NYN_partial_28_1426,
  rs_R005_ueqv_R005NYN_partial_28_1427,
  rs_R005_ueqv_R005NYN_partial_28_1428,
  rs_R005_ueqv_R005NYN_partial_28_1429,
  rs_R005_ueqv_R005NYN_partial_28_1430,
  rs_R005_ueqv_R005NYN_partial_28_1431,
  rs_R005_ueqv_R005NYN_partial_28_1432,
  rs_R005_ueqv_R005NYN_partial_28_1433,
  rs_R005_ueqv_R005NYN_partial_28_1434,
  rs_R005_ueqv_R005NYN_partial_28_1435,
  rs_R005_ueqv_R005NYN_partial_28_1436,
  rs_R005_ueqv_R005NYN_partial_28_1437,
  rs_R005_ueqv_R005NYN_partial_28_1438,
  rs_R005_ueqv_R005NYN_partial_28_1439,
  rs_R005_ueqv_R005NYN_partial_28_1440,
  rs_R005_ueqv_R005NYN_partial_28_1441,
  rs_R005_ueqv_R005NYN_partial_28_1442,
  rs_R005_ueqv_R005NYN_partial_28_1443,
  rs_R005_ueqv_R005NYN_partial_28_1444,
  rs_R005_ueqv_R005NYN_partial_28_1445,
  rs_R005_ueqv_R005NYN_partial_28_1446,
  rs_R005_ueqv_R005NYN_partial_28_1447,
  rs_R005_ueqv_R005NYN_partial_28_1448,
  rs_R005_ueqv_R005NYN_partial_28_1449,
  rs_R005_ueqv_R005NYN_partial_28_1450,
  rs_R005_ueqv_R005NYN_partial_28_1451,
  rs_R005_ueqv_R005NYN_partial_28_1452,
  rs_R005_ueqv_R005NYN_partial_28_1453,
  rs_R005_ueqv_R005NYN_partial_28_1454,
  rs_R005_ueqv_R005NYN_partial_28_1455,
  rs_R005_ueqv_R005NYN_partial_28_1456,
  rs_R005_ueqv_R005NYN_partial_28_1457,
  rs_R005_ueqv_R005NYN_partial_28_1458,
  rs_R005_ueqv_R005NYN_partial_28_1459,
  rs_R005_ueqv_R005NYN_partial_28_1460,
  rs_R005_ueqv_R005NYN_partial_28_1461,
  rs_R005_ueqv_R005NYN_partial_28_1462,
  rs_R005_ueqv_R005NYN_partial_28_1463,
  rs_R005_ueqv_R005NYN_partial_28_1464,
  rs_R005_ueqv_R005NYN_partial_28_1465,
  rs_R005_ueqv_R005NYN_partial_28_1466,
  rs_R005_ueqv_R005NYN_partial_28_1467,
  rs_R005_ueqv_R005NYN_partial_28_1468,
  rs_R005_ueqv_R005NYN_partial_28_1469,
  rs_R005_ueqv_R005NYN_partial_28_1470,
  rs_R005_ueqv_R005NYN_partial_28_1471,
  rs_R005_ueqv_R005NYN_partial_28_1472,
  rs_R005_ueqv_R005NYN_partial_28_1473,
  rs_R005_ueqv_R005NYN_partial_28_1474,
  rs_R005_ueqv_R005NYN_partial_28_1475,
  rs_R005_ueqv_R005NYN_partial_28_1476,
  rs_R005_ueqv_R005NYN_partial_28_1477,
  rs_R005_ueqv_R005NYN_partial_28_1478,
  rs_R005_ueqv_R005NYN_partial_28_1479,
  rs_R005_ueqv_R005NYN_partial_28_1480,
  rs_R005_ueqv_R005NYN_partial_28_1481,
  rs_R005_ueqv_R005NYN_partial_28_1482,
  rs_R005_ueqv_R005NYN_partial_28_1483,
  rs_R005_ueqv_R005NYN_partial_28_1484,
  rs_R005_ueqv_R005NYN_partial_28_1485,
  rs_R005_ueqv_R005NYN_partial_28_1486,
  rs_R005_ueqv_R005NYN_partial_28_1487,
  rs_R005_ueqv_R005NYN_partial_28_1488,
  rs_R005_ueqv_R005NYN_partial_28_1489,
  rs_R005_ueqv_R005NYN_partial_28_1490,
  rs_R005_ueqv_R005NYN_partial_28_1491,
  rs_R005_ueqv_R005NYN_partial_28_1492,
  rs_R005_ueqv_R005NYN_partial_28_1493,
  rs_R005_ueqv_R005NYN_partial_28_1494,
  rs_R005_ueqv_R005NYN_partial_28_1495,
  rs_R005_ueqv_R005NYN_partial_28_1496,
  rs_R005_ueqv_R005NYN_partial_28_1497,
  rs_R005_ueqv_R005NYN_partial_28_1498,
  rs_R005_ueqv_R005NYN_partial_28_1499
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_28_1400_1499 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8921600 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6855680 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((102700736 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((14106880 : Rat) / 158397) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-48543136 : Rat) / 385571) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6855680 : Rat) / 158397) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-102700736 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((109995624 : Rat) / 385571) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2947200 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((106943472 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9073408 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((105794464 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2006080 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-56705784 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2560896 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-142969968 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2068480 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-54109920 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((28391680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9134080 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2562496 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4106240 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((20094000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((20057184 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7454720 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-15092224 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((9789440 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-25214576 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3153920 : Rat) / 52799) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((5119104 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5755392 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73789776 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((12618496 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((14375744 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1757952 : Rat) / 52799) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((31088304 : Rat) / 385571) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34092160 : Rat) / 158397) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((46341520 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (14, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5427200 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((53346080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8806400 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-40656320 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (14, 1)],
  term ((3199456 : Rat) / 158397) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-15476464 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3427840 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-51350368 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(0, 2), (7, 1), (13, 1)],
  term ((-7053440 : Rat) / 158397) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((24271568 : Rat) / 385571) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3427840 : Rat) / 158397) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((51350368 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1018320 : Rat) / 52799) [(0, 2), (7, 1), (15, 1)],
  term ((-27498906 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1473600 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-53471736 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4536704 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-52897232 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1280448 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((71484984 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1003040 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((28352892 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1034240 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((27054960 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2232320 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-14195840 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4567040 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1281248 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-399360 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10028592 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2053120 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-10047000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3727360 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((7546112 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1576960 : Rat) / 52799) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((-2559552 : Rat) / 385571) [(0, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4894720 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((12607288 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2877696 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((36894888 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6309248 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7187872 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((17046080 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-23170760 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-878976 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((-15544152 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (9, 2), (10, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (10, 1)],
  term ((-4403200 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20328160 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2713600 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-26673040 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1599728 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((7738232 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(0, 2), (10, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((113392576 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((22014176 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6855680 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((102700736 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((14106880 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-48543136 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((6855680 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-102700736 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(1, 1), (7, 1), (15, 2)],
  term ((54997812 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4073280 : Rat) / 52799) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((109995624 : Rat) / 385571) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2947200 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((106943472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9073408 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((105794464 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((2560896 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-142969968 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2006080 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-56705784 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2068480 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-54109920 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((28391680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9134080 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((2562496 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((798720 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((20057184 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4106240 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((20094000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7454720 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-15092224 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((3153920 : Rat) / 52799) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((5119104 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((9789440 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((-25214576 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((56696288 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5755392 : Rat) / 52799) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-73789776 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12618496 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((14375744 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-34092160 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((46341520 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1757952 : Rat) / 52799) [(1, 1), (9, 1), (15, 2)],
  term ((31088304 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (15, 3)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((8806400 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-40656320 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5427200 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((53346080 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (15, 1)],
  term ((3199456 : Rat) / 158397) [(1, 1), (10, 1), (15, 3)],
  term ((-15476464 : Rat) / 385571) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 158397) [(1, 1), (10, 2), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3427840 : Rat) / 158397) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-51350368 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(1, 2), (7, 1), (13, 1)],
  term ((-7053440 : Rat) / 158397) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((24271568 : Rat) / 385571) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3427840 : Rat) / 158397) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((51350368 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1018320 : Rat) / 52799) [(1, 2), (7, 1), (15, 1)],
  term ((-27498906 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1473600 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-53471736 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4536704 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-52897232 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1280448 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((71484984 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1003040 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((28352892 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1034240 : Rat) / 52799) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((27054960 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2232320 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-14195840 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4567040 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1281248 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-399360 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10028592 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2053120 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-10047000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3727360 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((7546112 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1576960 : Rat) / 52799) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((-2559552 : Rat) / 385571) [(1, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4894720 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((12607288 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2877696 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((36894888 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6309248 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7187872 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((17046080 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-23170760 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-878976 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((-15544152 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 2), (9, 2), (10, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(1, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1)],
  term ((-4403200 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20328160 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2713600 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-26673040 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1599728 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((7738232 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(1, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1400 through 1499. -/
theorem rs_R005_ueqv_R005NYN_block_28_1400_1499_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_28_1400_1499
      rs_R005_ueqv_R005NYN_block_28_1400_1499 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
