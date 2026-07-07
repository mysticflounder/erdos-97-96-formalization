/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 5:500-570

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_05_0500_0570 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0500 : Poly :=
[
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 500 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0500 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2)],
  term ((40700204940 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2)],
  term ((40700204940 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2)],
  term ((81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((-40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((-40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0500_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0500
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0501 : Poly :=
[
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 501 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0501 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((-986764800 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (12, 1)],
  term ((-986764800 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0501_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0501
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0502 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 502 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0502 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0502_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0502
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0503 : Poly :=
[
  term ((-198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 503 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0503 : Poly :=
[
  term ((396105267711748000 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-396105267711748000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0503_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0503
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0504 : Poly :=
[
  term ((102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 504 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0504 : Poly :=
[
  term ((-205974739210108960 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0504_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0504
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0505 : Poly :=
[
  term ((-125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 505 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0505 : Poly :=
[
  term ((251357853120 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (14, 1)],
  term ((-125678926560 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (14, 1)],
  term ((-125678926560 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (14, 1)],
  term ((125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0505_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0505
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0506 : Poly :=
[
  term ((40433111919274763231 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 506 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0506 : Poly :=
[
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(6, 2), (10, 1), (11, 2), (15, 2)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(7, 2), (10, 1), (11, 2), (15, 2)],
  term ((40433111919274763231 : Rat) / 5152734910838036) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0506_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0506
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0507 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 507 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0507 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0507_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0507
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0508 : Poly :=
[
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 508 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0508 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0508_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0508
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0509 : Poly :=
[
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 509 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0509 : Poly :=
[
  term ((12107951524198816044 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 3)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0509_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0509
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0510 : Poly :=
[
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 510 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0510 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(6, 1), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(6, 2), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(7, 2), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0510_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0510
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0511 : Poly :=
[
  term ((-50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 511 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0511 : Poly :=
[
  term ((101603796800 : Rat) / 25734207) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-50801898400 : Rat) / 25734207) [(6, 2), (10, 1), (12, 1), (15, 2)],
  term ((-50801898400 : Rat) / 25734207) [(7, 2), (10, 1), (12, 1), (15, 2)],
  term ((-101603796800 : Rat) / 25734207) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0511_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0511
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0512 : Poly :=
[
  term ((26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 512 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0512 : Poly :=
[
  term ((-52833974336 : Rat) / 25734207) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((26416987168 : Rat) / 25734207) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((26416987168 : Rat) / 25734207) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0512_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0512
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0513 : Poly :=
[
  term (-40 : Rat) [(10, 1), (14, 1)]
]

/-- Partial product 513 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0513 : Poly :=
[
  term (80 : Rat) [(6, 1), (10, 1), (14, 1)],
  term (-40 : Rat) [(6, 2), (10, 1), (14, 1)],
  term (-40 : Rat) [(7, 2), (10, 1), (14, 1)],
  term (40 : Rat) [(10, 1), (14, 1), (15, 2)],
  term (-80 : Rat) [(10, 1), (14, 2)],
  term (40 : Rat) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0513_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0513
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0514 : Poly :=
[
  term ((23567130002 : Rat) / 25734207) [(10, 1), (15, 2)]
]

/-- Partial product 514 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0514 : Poly :=
[
  term ((-47134260004 : Rat) / 25734207) [(6, 1), (10, 1), (15, 2)],
  term ((23567130002 : Rat) / 25734207) [(6, 2), (10, 1), (15, 2)],
  term ((23567130002 : Rat) / 25734207) [(7, 2), (10, 1), (15, 2)],
  term ((47134260004 : Rat) / 25734207) [(10, 1), (14, 1), (15, 2)],
  term ((-23567130002 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term ((-23567130002 : Rat) / 25734207) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0514_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0514
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0515 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 515 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0515 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0515_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0515
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0516 : Poly :=
[
  term ((199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 516 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0516 : Poly :=
[
  term ((-398059506720 : Rat) / 150171761) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(6, 2), (10, 2), (11, 1), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0516_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0516
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0517 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 517 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0517 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0517_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0517
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0518 : Poly :=
[
  term ((9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 2)]
]

/-- Partial product 518 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0518 : Poly :=
[
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(6, 1), (10, 2), (11, 2), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(6, 2), (10, 2), (11, 2), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(7, 2), (10, 2), (11, 2), (15, 2)],
  term ((19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 2), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0518_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0518
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0519 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)]
]

/-- Partial product 519 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0519 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(6, 1), (10, 2), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(6, 2), (10, 2), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(7, 2), (10, 2), (12, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (14, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0519_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0519
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0520 : Poly :=
[
  term ((14441728265 : Rat) / 34312276) [(10, 2), (15, 2)]
]

/-- Partial product 520 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0520 : Poly :=
[
  term ((-14441728265 : Rat) / 17156138) [(6, 1), (10, 2), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(6, 2), (10, 2), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(7, 2), (10, 2), (15, 2)],
  term ((14441728265 : Rat) / 17156138) [(10, 2), (14, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(10, 2), (14, 2), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0520_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0520
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0521 : Poly :=
[
  term ((-443058711000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 521 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0521 : Poly :=
[
  term ((886117422000 : Rat) / 150171761) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-443058711000 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-443058711000 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-886117422000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((443058711000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((443058711000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0521_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0521
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0522 : Poly :=
[
  term ((14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 522 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0522 : Poly :=
[
  term ((-28174032400 : Rat) / 150171761) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14087016200 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14087016200 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((28174032400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0522_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0522
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0523 : Poly :=
[
  term ((714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 523 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0523 : Poly :=
[
  term ((-1428241757105039568 : Rat) / 1288183727709509) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((1428241757105039568 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0523_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0523
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0524 : Poly :=
[
  term ((6728850975799153120 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 524 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0524 : Poly :=
[
  term ((-13457701951598306240 : Rat) / 3864551183128527) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((6728850975799153120 : Rat) / 3864551183128527) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((6728850975799153120 : Rat) / 3864551183128527) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((13457701951598306240 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6728850975799153120 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6728850975799153120 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0524_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0524
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0525 : Poly :=
[
  term ((-74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 525 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0525 : Poly :=
[
  term ((148241342000 : Rat) / 150171761) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(6, 2), (11, 1), (12, 2), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(7, 2), (11, 1), (12, 2), (15, 1)],
  term ((-148241342000 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0525_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0525
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0526 : Poly :=
[
  term ((275887505000 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 526 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0526 : Poly :=
[
  term ((-551775010000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1)],
  term ((275887505000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1)],
  term ((275887505000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1)],
  term ((551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)],
  term ((-275887505000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-275887505000 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0526_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0526
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0527 : Poly :=
[
  term ((34595628000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 527 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0527 : Poly :=
[
  term ((-69191256000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((34595628000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((34595628000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-34595628000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((69191256000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-34595628000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0527_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0527
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0528 : Poly :=
[
  term ((-258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 528 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0528 : Poly :=
[
  term ((517179382000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-258589691000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (14, 2)],
  term ((-258589691000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (14, 2)],
  term ((258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-517179382000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 3)],
  term ((258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0528_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0528
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0529 : Poly :=
[
  term ((-317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 529 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0529 : Poly :=
[
  term ((635276079200 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-317638039600 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((-317638039600 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-635276079200 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0529_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0529
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0530 : Poly :=
[
  term ((-60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 530 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0530 : Poly :=
[
  term ((120067309600 : Rat) / 150171761) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-60033654800 : Rat) / 150171761) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((-60033654800 : Rat) / 150171761) [(7, 2), (11, 1), (13, 2), (15, 1)],
  term ((-120067309600 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0530_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0530
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0531 : Poly :=
[
  term ((-23567130002 : Rat) / 25734207) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 531 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0531 : Poly :=
[
  term ((47134260004 : Rat) / 25734207) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-23567130002 : Rat) / 25734207) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-23567130002 : Rat) / 25734207) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((23567130002 : Rat) / 25734207) [(11, 1), (14, 1), (15, 3)],
  term ((-47134260004 : Rat) / 25734207) [(11, 1), (14, 2), (15, 1)],
  term ((23567130002 : Rat) / 25734207) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0531_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0531
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0532 : Poly :=
[
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 532 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0532 : Poly :=
[
  term ((493325681400 : Rat) / 150171761) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((-493325681400 : Rat) / 150171761) [(11, 1), (14, 3), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0532_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0532
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0533 : Poly :=
[
  term ((-207931773073177513 : Rat) / 227326540184031) [(11, 1), (15, 1)]
]

/-- Partial product 533 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0533 : Poly :=
[
  term ((415863546146355026 : Rat) / 227326540184031) [(6, 1), (11, 1), (15, 1)],
  term ((-207931773073177513 : Rat) / 227326540184031) [(6, 2), (11, 1), (15, 1)],
  term ((-207931773073177513 : Rat) / 227326540184031) [(7, 2), (11, 1), (15, 1)],
  term ((-415863546146355026 : Rat) / 227326540184031) [(11, 1), (14, 1), (15, 1)],
  term ((207931773073177513 : Rat) / 227326540184031) [(11, 1), (14, 2), (15, 1)],
  term ((207931773073177513 : Rat) / 227326540184031) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0533_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0533
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0534 : Poly :=
[
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (15, 3)]
]

/-- Partial product 534 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0534 : Poly :=
[
  term ((493325681400 : Rat) / 150171761) [(6, 1), (11, 1), (15, 3)],
  term ((-246662840700 : Rat) / 150171761) [(6, 2), (11, 1), (15, 3)],
  term ((-246662840700 : Rat) / 150171761) [(7, 2), (11, 1), (15, 3)],
  term ((-493325681400 : Rat) / 150171761) [(11, 1), (14, 1), (15, 3)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0534_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0534
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0535 : Poly :=
[
  term ((-64207940555 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 535 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0535 : Poly :=
[
  term ((128415881110 : Rat) / 150171761) [(6, 1), (11, 2)],
  term ((-64207940555 : Rat) / 150171761) [(6, 2), (11, 2)],
  term ((-64207940555 : Rat) / 150171761) [(7, 2), (11, 2)],
  term ((-128415881110 : Rat) / 150171761) [(11, 2), (14, 1)],
  term ((64207940555 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((64207940555 : Rat) / 150171761) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0535_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0535
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0536 : Poly :=
[
  term ((25549060000 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 536 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0536 : Poly :=
[
  term ((-51098120000 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)],
  term ((25549060000 : Rat) / 150171761) [(6, 2), (11, 2), (12, 1)],
  term ((25549060000 : Rat) / 150171761) [(7, 2), (11, 2), (12, 1)],
  term ((51098120000 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)],
  term ((-25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((-25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0536_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0536
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0537 : Poly :=
[
  term ((1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 537 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0537 : Poly :=
[
  term ((-1357148043341813005 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1357148043341813005 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0537_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0537
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0538 : Poly :=
[
  term ((-42684430413247895775 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 538 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0538 : Poly :=
[
  term ((42684430413247895775 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-42684430413247895775 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-42684430413247895775 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-42684430413247895775 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((42684430413247895775 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((42684430413247895775 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0538_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0538
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0539 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 539 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0539 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (11, 2), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (11, 2), (12, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((-1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0539_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0539
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0540 : Poly :=
[
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 540 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0540 : Poly :=
[
  term ((5688738454425521515 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((-5688738454425521515 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0540_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0540
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0541 : Poly :=
[
  term ((7771841452124843657 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 541 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0541 : Poly :=
[
  term ((-7771841452124843657 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((7771841452124843657 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (15, 2)],
  term ((7771841452124843657 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (15, 2)],
  term ((7771841452124843657 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7771841452124843657 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-7771841452124843657 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0541_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0541
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0542 : Poly :=
[
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 2)]
]

/-- Partial product 542 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0542 : Poly :=
[
  term ((7140811239986524775 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (14, 2), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0542_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0542
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0543 : Poly :=
[
  term ((1666477420831717350 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 543 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0543 : Poly :=
[
  term ((-3332954841663434700 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1666477420831717350 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1666477420831717350 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1666477420831717350 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((3332954841663434700 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1666477420831717350 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0543_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0543
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0544 : Poly :=
[
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 544 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0544 : Poly :=
[
  term ((24912620826617210275 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-24912620826617210275 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 3), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0544_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0544
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0545 : Poly :=
[
  term ((26579098247448927625 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 545 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0545 : Poly :=
[
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((26579098247448927625 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((26579098247448927625 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-26579098247448927625 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-26579098247448927625 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0545_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0545
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0546 : Poly :=
[
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 546 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0546 : Poly :=
[
  term ((30601359281042731790 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (15, 3)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 1), (15, 3)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 1), (15, 3)],
  term ((-30601359281042731790 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0546_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0546
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0547 : Poly :=
[
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 547 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0547 : Poly :=
[
  term ((5783663196644711770 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 2), (15, 2)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 2), (15, 2)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 2), (15, 2)],
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0547_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0547
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0548 : Poly :=
[
  term ((-104922581110 : Rat) / 150171761) [(11, 2), (14, 1)]
]

/-- Partial product 548 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0548 : Poly :=
[
  term ((209845162220 : Rat) / 150171761) [(6, 1), (11, 2), (14, 1)],
  term ((-104922581110 : Rat) / 150171761) [(6, 2), (11, 2), (14, 1)],
  term ((-104922581110 : Rat) / 150171761) [(7, 2), (11, 2), (14, 1)],
  term ((104922581110 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)],
  term ((-209845162220 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((104922581110 : Rat) / 150171761) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0548_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0548
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0549 : Poly :=
[
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 2)]
]

/-- Partial product 549 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0549 : Poly :=
[
  term ((47527167835746269235 : Rat) / 2576367455419018) [(6, 1), (11, 2), (14, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(6, 2), (11, 2), (14, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(7, 2), (11, 2), (14, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 3), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0549_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0549
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0550 : Poly :=
[
  term ((-578329503238716547 : Rat) / 303102053578708) [(11, 2), (15, 2)]
]

/-- Partial product 550 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0550 : Poly :=
[
  term ((578329503238716547 : Rat) / 151551026789354) [(6, 1), (11, 2), (15, 2)],
  term ((-578329503238716547 : Rat) / 303102053578708) [(6, 2), (11, 2), (15, 2)],
  term ((-578329503238716547 : Rat) / 303102053578708) [(7, 2), (11, 2), (15, 2)],
  term ((-578329503238716547 : Rat) / 151551026789354) [(11, 2), (14, 1), (15, 2)],
  term ((578329503238716547 : Rat) / 303102053578708) [(11, 2), (14, 2), (15, 2)],
  term ((578329503238716547 : Rat) / 303102053578708) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0550_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0550
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0551 : Poly :=
[
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 4)]
]

/-- Partial product 551 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0551 : Poly :=
[
  term ((47527167835746269235 : Rat) / 2576367455419018) [(6, 1), (11, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(6, 2), (11, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(7, 2), (11, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 4)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 4)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0551_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0551
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0552 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 552 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0552 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0552_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0552
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0553 : Poly :=
[
  term ((1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 553 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0553 : Poly :=
[
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (15, 1)],
  term ((2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0553_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0553
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0554 : Poly :=
[
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 1)]
]

/-- Partial product 554 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0554 : Poly :=
[
  term ((40433111919274763231 : Rat) / 5152734910838036) [(6, 1), (11, 3), (14, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(6, 2), (11, 3), (14, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(7, 2), (11, 3), (14, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 3)],
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(11, 3), (14, 2), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0554_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0554
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0555 : Poly :=
[
  term ((-39419187456338506031 : Rat) / 20610939643352144) [(11, 3), (15, 1)]
]

/-- Partial product 555 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0555 : Poly :=
[
  term ((39419187456338506031 : Rat) / 10305469821676072) [(6, 1), (11, 3), (15, 1)],
  term ((-39419187456338506031 : Rat) / 20610939643352144) [(6, 2), (11, 3), (15, 1)],
  term ((-39419187456338506031 : Rat) / 20610939643352144) [(7, 2), (11, 3), (15, 1)],
  term ((-39419187456338506031 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 1)],
  term ((39419187456338506031 : Rat) / 20610939643352144) [(11, 3), (14, 2), (15, 1)],
  term ((39419187456338506031 : Rat) / 20610939643352144) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0555_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0555
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0556 : Poly :=
[
  term ((3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 2)]
]

/-- Partial product 556 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0556 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(6, 1), (11, 4), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(6, 2), (11, 4), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(7, 2), (11, 4), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (14, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (14, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0556_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0556
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0557 : Poly :=
[
  term ((9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 557 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0557 : Poly :=
[
  term ((-19697164508 : Rat) / 25734207) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9848582254 : Rat) / 25734207) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9848582254 : Rat) / 25734207) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((19697164508 : Rat) / 25734207) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0557_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0557
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0558 : Poly :=
[
  term ((-109248314110 : Rat) / 8578069) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 558 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0558 : Poly :=
[
  term ((218496628220 : Rat) / 8578069) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-109248314110 : Rat) / 8578069) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-109248314110 : Rat) / 8578069) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-218496628220 : Rat) / 8578069) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((109248314110 : Rat) / 8578069) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((109248314110 : Rat) / 8578069) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0558_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0558
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0559 : Poly :=
[
  term ((-43408697362 : Rat) / 25734207) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 559 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0559 : Poly :=
[
  term ((86817394724 : Rat) / 25734207) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-43408697362 : Rat) / 25734207) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((-43408697362 : Rat) / 25734207) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(12, 1), (14, 1), (15, 4)],
  term ((-86817394724 : Rat) / 25734207) [(12, 1), (14, 2), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0559_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0559
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0560 : Poly :=
[
  term ((-69735388319 : Rat) / 51468414) [(12, 1), (15, 2)]
]

/-- Partial product 560 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0560 : Poly :=
[
  term ((69735388319 : Rat) / 25734207) [(6, 1), (12, 1), (15, 2)],
  term ((-69735388319 : Rat) / 51468414) [(6, 2), (12, 1), (15, 2)],
  term ((-69735388319 : Rat) / 51468414) [(7, 2), (12, 1), (15, 2)],
  term ((-69735388319 : Rat) / 25734207) [(12, 1), (14, 1), (15, 2)],
  term ((69735388319 : Rat) / 51468414) [(12, 1), (14, 2), (15, 2)],
  term ((69735388319 : Rat) / 51468414) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0560_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0560
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0561 : Poly :=
[
  term ((22279096150 : Rat) / 25734207) [(12, 2), (15, 2)]
]

/-- Partial product 561 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0561 : Poly :=
[
  term ((-44558192300 : Rat) / 25734207) [(6, 1), (12, 2), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(6, 2), (12, 2), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(7, 2), (12, 2), (15, 2)],
  term ((44558192300 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(12, 2), (14, 2), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0561_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0561
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0562 : Poly :=
[
  term ((6477687480 : Rat) / 8578069) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 562 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0562 : Poly :=
[
  term ((-12955374960 : Rat) / 8578069) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((6477687480 : Rat) / 8578069) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((6477687480 : Rat) / 8578069) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6477687480 : Rat) / 8578069) [(13, 1), (14, 1), (15, 3)],
  term ((12955374960 : Rat) / 8578069) [(13, 1), (14, 2), (15, 1)],
  term ((-6477687480 : Rat) / 8578069) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0562_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0562
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0563 : Poly :=
[
  term ((-152732923090 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 563 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0563 : Poly :=
[
  term ((305465846180 : Rat) / 25734207) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(13, 1), (14, 2), (15, 3)],
  term ((-305465846180 : Rat) / 25734207) [(13, 1), (14, 3), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0563_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0563
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0564 : Poly :=
[
  term ((162449454310 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 564 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0564 : Poly :=
[
  term ((-324898908620 : Rat) / 25734207) [(6, 1), (13, 1), (15, 1)],
  term ((162449454310 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((162449454310 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)],
  term ((324898908620 : Rat) / 25734207) [(13, 1), (14, 1), (15, 1)],
  term ((-162449454310 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-162449454310 : Rat) / 25734207) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0564_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0564
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0565 : Poly :=
[
  term ((-196141620452 : Rat) / 25734207) [(13, 1), (15, 3)]
]

/-- Partial product 565 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0565 : Poly :=
[
  term ((392283240904 : Rat) / 25734207) [(6, 1), (13, 1), (15, 3)],
  term ((-196141620452 : Rat) / 25734207) [(6, 2), (13, 1), (15, 3)],
  term ((-196141620452 : Rat) / 25734207) [(7, 2), (13, 1), (15, 3)],
  term ((-392283240904 : Rat) / 25734207) [(13, 1), (14, 1), (15, 3)],
  term ((196141620452 : Rat) / 25734207) [(13, 1), (14, 2), (15, 3)],
  term ((196141620452 : Rat) / 25734207) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0565_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0565
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0566 : Poly :=
[
  term ((32127678404 : Rat) / 25734207) [(13, 2), (15, 2)]
]

/-- Partial product 566 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0566 : Poly :=
[
  term ((-64255356808 : Rat) / 25734207) [(6, 1), (13, 2), (15, 2)],
  term ((32127678404 : Rat) / 25734207) [(6, 2), (13, 2), (15, 2)],
  term ((32127678404 : Rat) / 25734207) [(7, 2), (13, 2), (15, 2)],
  term ((64255356808 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(13, 2), (14, 2), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0566_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0566
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0567 : Poly :=
[
  term (-2 : Rat) [(14, 1)]
]

/-- Partial product 567 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0567 : Poly :=
[
  term (4 : Rat) [(6, 1), (14, 1)],
  term (-2 : Rat) [(6, 2), (14, 1)],
  term (-2 : Rat) [(7, 2), (14, 1)],
  term (2 : Rat) [(14, 1), (15, 2)],
  term (-4 : Rat) [(14, 2)],
  term (2 : Rat) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0567_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0567
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0568 : Poly :=
[
  term ((-10122507163 : Rat) / 8578069) [(14, 2), (15, 2)]
]

/-- Partial product 568 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0568 : Poly :=
[
  term ((20245014326 : Rat) / 8578069) [(6, 1), (14, 2), (15, 2)],
  term ((-10122507163 : Rat) / 8578069) [(6, 2), (14, 2), (15, 2)],
  term ((-10122507163 : Rat) / 8578069) [(7, 2), (14, 2), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(14, 2), (15, 4)],
  term ((-20245014326 : Rat) / 8578069) [(14, 3), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0568_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0568
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0569 : Poly :=
[
  term ((13765565453 : Rat) / 34312276) [(15, 2)]
]

/-- Partial product 569 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0569 : Poly :=
[
  term ((-13765565453 : Rat) / 17156138) [(6, 1), (15, 2)],
  term ((13765565453 : Rat) / 34312276) [(6, 2), (15, 2)],
  term ((13765565453 : Rat) / 34312276) [(7, 2), (15, 2)],
  term ((13765565453 : Rat) / 17156138) [(14, 1), (15, 2)],
  term ((-13765565453 : Rat) / 34312276) [(14, 2), (15, 2)],
  term ((-13765565453 : Rat) / 34312276) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0569_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0569
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0570 : Poly :=
[
  term ((-10122507163 : Rat) / 8578069) [(15, 4)]
]

/-- Partial product 570 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0570 : Poly :=
[
  term ((20245014326 : Rat) / 8578069) [(6, 1), (15, 4)],
  term ((-10122507163 : Rat) / 8578069) [(6, 2), (15, 4)],
  term ((-10122507163 : Rat) / 8578069) [(7, 2), (15, 4)],
  term ((-20245014326 : Rat) / 8578069) [(14, 1), (15, 4)],
  term ((10122507163 : Rat) / 8578069) [(14, 2), (15, 4)],
  term ((10122507163 : Rat) / 8578069) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0570_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0570
        rs_R013_ueqv_R013YNNN_generator_05_0500_0570 =
      rs_R013_ueqv_R013YNNN_partial_05_0570 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_05_0500_0570 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_05_0500,
  rs_R013_ueqv_R013YNNN_partial_05_0501,
  rs_R013_ueqv_R013YNNN_partial_05_0502,
  rs_R013_ueqv_R013YNNN_partial_05_0503,
  rs_R013_ueqv_R013YNNN_partial_05_0504,
  rs_R013_ueqv_R013YNNN_partial_05_0505,
  rs_R013_ueqv_R013YNNN_partial_05_0506,
  rs_R013_ueqv_R013YNNN_partial_05_0507,
  rs_R013_ueqv_R013YNNN_partial_05_0508,
  rs_R013_ueqv_R013YNNN_partial_05_0509,
  rs_R013_ueqv_R013YNNN_partial_05_0510,
  rs_R013_ueqv_R013YNNN_partial_05_0511,
  rs_R013_ueqv_R013YNNN_partial_05_0512,
  rs_R013_ueqv_R013YNNN_partial_05_0513,
  rs_R013_ueqv_R013YNNN_partial_05_0514,
  rs_R013_ueqv_R013YNNN_partial_05_0515,
  rs_R013_ueqv_R013YNNN_partial_05_0516,
  rs_R013_ueqv_R013YNNN_partial_05_0517,
  rs_R013_ueqv_R013YNNN_partial_05_0518,
  rs_R013_ueqv_R013YNNN_partial_05_0519,
  rs_R013_ueqv_R013YNNN_partial_05_0520,
  rs_R013_ueqv_R013YNNN_partial_05_0521,
  rs_R013_ueqv_R013YNNN_partial_05_0522,
  rs_R013_ueqv_R013YNNN_partial_05_0523,
  rs_R013_ueqv_R013YNNN_partial_05_0524,
  rs_R013_ueqv_R013YNNN_partial_05_0525,
  rs_R013_ueqv_R013YNNN_partial_05_0526,
  rs_R013_ueqv_R013YNNN_partial_05_0527,
  rs_R013_ueqv_R013YNNN_partial_05_0528,
  rs_R013_ueqv_R013YNNN_partial_05_0529,
  rs_R013_ueqv_R013YNNN_partial_05_0530,
  rs_R013_ueqv_R013YNNN_partial_05_0531,
  rs_R013_ueqv_R013YNNN_partial_05_0532,
  rs_R013_ueqv_R013YNNN_partial_05_0533,
  rs_R013_ueqv_R013YNNN_partial_05_0534,
  rs_R013_ueqv_R013YNNN_partial_05_0535,
  rs_R013_ueqv_R013YNNN_partial_05_0536,
  rs_R013_ueqv_R013YNNN_partial_05_0537,
  rs_R013_ueqv_R013YNNN_partial_05_0538,
  rs_R013_ueqv_R013YNNN_partial_05_0539,
  rs_R013_ueqv_R013YNNN_partial_05_0540,
  rs_R013_ueqv_R013YNNN_partial_05_0541,
  rs_R013_ueqv_R013YNNN_partial_05_0542,
  rs_R013_ueqv_R013YNNN_partial_05_0543,
  rs_R013_ueqv_R013YNNN_partial_05_0544,
  rs_R013_ueqv_R013YNNN_partial_05_0545,
  rs_R013_ueqv_R013YNNN_partial_05_0546,
  rs_R013_ueqv_R013YNNN_partial_05_0547,
  rs_R013_ueqv_R013YNNN_partial_05_0548,
  rs_R013_ueqv_R013YNNN_partial_05_0549,
  rs_R013_ueqv_R013YNNN_partial_05_0550,
  rs_R013_ueqv_R013YNNN_partial_05_0551,
  rs_R013_ueqv_R013YNNN_partial_05_0552,
  rs_R013_ueqv_R013YNNN_partial_05_0553,
  rs_R013_ueqv_R013YNNN_partial_05_0554,
  rs_R013_ueqv_R013YNNN_partial_05_0555,
  rs_R013_ueqv_R013YNNN_partial_05_0556,
  rs_R013_ueqv_R013YNNN_partial_05_0557,
  rs_R013_ueqv_R013YNNN_partial_05_0558,
  rs_R013_ueqv_R013YNNN_partial_05_0559,
  rs_R013_ueqv_R013YNNN_partial_05_0560,
  rs_R013_ueqv_R013YNNN_partial_05_0561,
  rs_R013_ueqv_R013YNNN_partial_05_0562,
  rs_R013_ueqv_R013YNNN_partial_05_0563,
  rs_R013_ueqv_R013YNNN_partial_05_0564,
  rs_R013_ueqv_R013YNNN_partial_05_0565,
  rs_R013_ueqv_R013YNNN_partial_05_0566,
  rs_R013_ueqv_R013YNNN_partial_05_0567,
  rs_R013_ueqv_R013YNNN_partial_05_0568,
  rs_R013_ueqv_R013YNNN_partial_05_0569,
  rs_R013_ueqv_R013YNNN_partial_05_0570
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_05_0500_0570 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2)],
  term ((1973529600 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((396105267711748000 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((251357853120 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (14, 1)],
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(6, 1), (10, 1), (11, 3), (15, 1)],
  term ((101603796800 : Rat) / 25734207) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-52833974336 : Rat) / 25734207) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(6, 1), (10, 1), (14, 1)],
  term ((-47134260004 : Rat) / 25734207) [(6, 1), (10, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-398059506720 : Rat) / 150171761) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(6, 1), (10, 2), (11, 2), (15, 2)],
  term ((-16256607488 : Rat) / 8578069) [(6, 1), (10, 2), (12, 1), (15, 2)],
  term ((-14441728265 : Rat) / 17156138) [(6, 1), (10, 2), (15, 2)],
  term ((886117422000 : Rat) / 150171761) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-28174032400 : Rat) / 150171761) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1428241757105039568 : Rat) / 1288183727709509) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13457701951598306240 : Rat) / 3864551183128527) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((148241342000 : Rat) / 150171761) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-551775010000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1)],
  term ((-69191256000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((517179382000 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((635276079200 : Rat) / 150171761) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((120067309600 : Rat) / 150171761) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((47134260004 : Rat) / 25734207) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((493325681400 : Rat) / 150171761) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((415863546146355026 : Rat) / 227326540184031) [(6, 1), (11, 1), (15, 1)],
  term ((493325681400 : Rat) / 150171761) [(6, 1), (11, 1), (15, 3)],
  term ((128415881110 : Rat) / 150171761) [(6, 1), (11, 2)],
  term ((-51098120000 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)],
  term ((-1357148043341813005 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((42684430413247895775 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((5688738454425521515 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7771841452124843657 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 2), (15, 2)],
  term ((-3332954841663434700 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((24912620826617210275 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((30601359281042731790 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 1), (15, 3)],
  term ((5783663196644711770 : Rat) / 1288183727709509) [(6, 1), (11, 2), (13, 2), (15, 2)],
  term ((209845162220 : Rat) / 150171761) [(6, 1), (11, 2), (14, 1)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(6, 1), (11, 2), (14, 2), (15, 2)],
  term ((578329503238716547 : Rat) / 151551026789354) [(6, 1), (11, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(6, 1), (11, 2), (15, 4)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 5152734910838036) [(6, 1), (11, 3), (14, 1), (15, 1)],
  term ((39419187456338506031 : Rat) / 10305469821676072) [(6, 1), (11, 3), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(6, 1), (11, 4), (15, 2)],
  term ((-19697164508 : Rat) / 25734207) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((218496628220 : Rat) / 8578069) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((86817394724 : Rat) / 25734207) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((69735388319 : Rat) / 25734207) [(6, 1), (12, 1), (15, 2)],
  term ((-44558192300 : Rat) / 25734207) [(6, 1), (12, 2), (15, 2)],
  term ((-12955374960 : Rat) / 8578069) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((305465846180 : Rat) / 25734207) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-324898908620 : Rat) / 25734207) [(6, 1), (13, 1), (15, 1)],
  term ((392283240904 : Rat) / 25734207) [(6, 1), (13, 1), (15, 3)],
  term ((-64255356808 : Rat) / 25734207) [(6, 1), (13, 2), (15, 2)],
  term (4 : Rat) [(6, 1), (14, 1)],
  term ((20245014326 : Rat) / 8578069) [(6, 1), (14, 2), (15, 2)],
  term ((-13765565453 : Rat) / 17156138) [(6, 1), (15, 2)],
  term ((20245014326 : Rat) / 8578069) [(6, 1), (15, 4)],
  term ((40700204940 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2)],
  term ((-986764800 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-125678926560 : Rat) / 150171761) [(6, 2), (10, 1), (11, 2), (14, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(6, 2), (10, 1), (11, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(6, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(6, 2), (10, 1), (11, 3), (15, 1)],
  term ((-50801898400 : Rat) / 25734207) [(6, 2), (10, 1), (12, 1), (15, 2)],
  term ((26416987168 : Rat) / 25734207) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(6, 2), (10, 1), (14, 1)],
  term ((23567130002 : Rat) / 25734207) [(6, 2), (10, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(6, 2), (10, 2), (11, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(6, 2), (10, 2), (11, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(6, 2), (10, 2), (12, 1), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(6, 2), (10, 2), (15, 2)],
  term ((-443058711000 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((14087016200 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6728850975799153120 : Rat) / 3864551183128527) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(6, 2), (11, 1), (12, 2), (15, 1)],
  term ((275887505000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1)],
  term ((34595628000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-258589691000 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (14, 2)],
  term ((-317638039600 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((-60033654800 : Rat) / 150171761) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((-23567130002 : Rat) / 25734207) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-207931773073177513 : Rat) / 227326540184031) [(6, 2), (11, 1), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(6, 2), (11, 1), (15, 3)],
  term ((-64207940555 : Rat) / 150171761) [(6, 2), (11, 2)],
  term ((25549060000 : Rat) / 150171761) [(6, 2), (11, 2), (12, 1)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-42684430413247895775 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(6, 2), (11, 2), (12, 1), (14, 1)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((7771841452124843657 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(6, 2), (11, 2), (12, 2), (15, 2)],
  term ((1666477420831717350 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((26579098247448927625 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 1), (15, 3)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(6, 2), (11, 2), (13, 2), (15, 2)],
  term ((-104922581110 : Rat) / 150171761) [(6, 2), (11, 2), (14, 1)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(6, 2), (11, 2), (14, 2), (15, 2)],
  term ((-578329503238716547 : Rat) / 303102053578708) [(6, 2), (11, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(6, 2), (11, 2), (15, 4)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(6, 2), (11, 3), (14, 1), (15, 1)],
  term ((-39419187456338506031 : Rat) / 20610939643352144) [(6, 2), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(6, 2), (11, 4), (15, 2)],
  term ((9848582254 : Rat) / 25734207) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-109248314110 : Rat) / 8578069) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-43408697362 : Rat) / 25734207) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((-69735388319 : Rat) / 51468414) [(6, 2), (12, 1), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(6, 2), (12, 2), (15, 2)],
  term ((6477687480 : Rat) / 8578069) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((162449454310 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((-196141620452 : Rat) / 25734207) [(6, 2), (13, 1), (15, 3)],
  term ((32127678404 : Rat) / 25734207) [(6, 2), (13, 2), (15, 2)],
  term (-2 : Rat) [(6, 2), (14, 1)],
  term ((-10122507163 : Rat) / 8578069) [(6, 2), (14, 2), (15, 2)],
  term ((13765565453 : Rat) / 34312276) [(6, 2), (15, 2)],
  term ((-10122507163 : Rat) / 8578069) [(6, 2), (15, 4)],
  term ((40700204940 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2)],
  term ((-986764800 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-125678926560 : Rat) / 150171761) [(7, 2), (10, 1), (11, 2), (14, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(7, 2), (10, 1), (11, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(7, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(7, 2), (10, 1), (11, 3), (15, 1)],
  term ((-50801898400 : Rat) / 25734207) [(7, 2), (10, 1), (12, 1), (15, 2)],
  term ((26416987168 : Rat) / 25734207) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(7, 2), (10, 1), (14, 1)],
  term ((23567130002 : Rat) / 25734207) [(7, 2), (10, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(7, 2), (10, 2), (11, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(7, 2), (10, 2), (12, 1), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(7, 2), (10, 2), (15, 2)],
  term ((-443058711000 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((14087016200 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6728850975799153120 : Rat) / 3864551183128527) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(7, 2), (11, 1), (12, 2), (15, 1)],
  term ((275887505000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1)],
  term ((34595628000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-258589691000 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (14, 2)],
  term ((-317638039600 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-60033654800 : Rat) / 150171761) [(7, 2), (11, 1), (13, 2), (15, 1)],
  term ((-23567130002 : Rat) / 25734207) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((-207931773073177513 : Rat) / 227326540184031) [(7, 2), (11, 1), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(7, 2), (11, 1), (15, 3)],
  term ((-64207940555 : Rat) / 150171761) [(7, 2), (11, 2)],
  term ((25549060000 : Rat) / 150171761) [(7, 2), (11, 2), (12, 1)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-42684430413247895775 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(7, 2), (11, 2), (12, 1), (14, 1)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((7771841452124843657 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(7, 2), (11, 2), (12, 2), (15, 2)],
  term ((1666477420831717350 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((26579098247448927625 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 1), (15, 3)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(7, 2), (11, 2), (13, 2), (15, 2)],
  term ((-104922581110 : Rat) / 150171761) [(7, 2), (11, 2), (14, 1)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(7, 2), (11, 2), (14, 2), (15, 2)],
  term ((-578329503238716547 : Rat) / 303102053578708) [(7, 2), (11, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(7, 2), (11, 2), (15, 4)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(7, 2), (11, 3), (14, 1), (15, 1)],
  term ((-39419187456338506031 : Rat) / 20610939643352144) [(7, 2), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(7, 2), (11, 4), (15, 2)],
  term ((9848582254 : Rat) / 25734207) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-109248314110 : Rat) / 8578069) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-43408697362 : Rat) / 25734207) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-69735388319 : Rat) / 51468414) [(7, 2), (12, 1), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(7, 2), (12, 2), (15, 2)],
  term ((6477687480 : Rat) / 8578069) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((162449454310 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)],
  term ((-196141620452 : Rat) / 25734207) [(7, 2), (13, 1), (15, 3)],
  term ((32127678404 : Rat) / 25734207) [(7, 2), (13, 2), (15, 2)],
  term (-2 : Rat) [(7, 2), (14, 1)],
  term ((-10122507163 : Rat) / 8578069) [(7, 2), (14, 2), (15, 2)],
  term ((13765565453 : Rat) / 34312276) [(7, 2), (15, 2)],
  term ((-10122507163 : Rat) / 8578069) [(7, 2), (15, 4)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-379176194629405600 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2960294400 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 3)],
  term ((986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 4)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((44745441934785213791 : Rat) / 5152734910838036) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-292058058060 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 3)],
  term ((-40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (15, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 4)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-142597896376229280 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 3), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 3)],
  term ((-56273949914012112663 : Rat) / 5152734910838036) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 3), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 3)],
  term ((-101603796800 : Rat) / 25734207) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 4)],
  term ((-26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((48163628284 : Rat) / 25734207) [(10, 1), (14, 1), (15, 2)],
  term (-80 : Rat) [(10, 1), (14, 2)],
  term ((-23567130002 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term (40 : Rat) [(10, 1), (14, 3)],
  term ((-23567130002 : Rat) / 25734207) [(10, 1), (15, 4)],
  term ((3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 3)],
  term ((398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 3)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 4)],
  term ((19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 2), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 4)],
  term ((16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (14, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 4)],
  term ((14441728265 : Rat) / 17156138) [(10, 2), (14, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(10, 2), (14, 2), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(10, 2), (15, 4)],
  term ((-886117422000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((471232743400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((443058711000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((13457701951598306240 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2444125704484034416 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-6728850975799153120 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 3)],
  term ((-148241342000 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 3)],
  term ((551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)],
  term ((-669871707200 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-206696249000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((576227730600 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 3)],
  term ((258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 4)],
  term ((-275887505000 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)],
  term ((317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (15, 4)],
  term ((-120067309600 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (15, 3)],
  term ((-415863546146355026 : Rat) / 227326540184031) [(11, 1), (14, 1), (15, 1)],
  term ((-9156227789447376278 : Rat) / 3864551183128527) [(11, 1), (14, 1), (15, 3)],
  term ((-69478327176245673 : Rat) / 75775513394677) [(11, 1), (14, 2), (15, 1)],
  term ((493325681400 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((-9156227789447376278 : Rat) / 3864551183128527) [(11, 1), (14, 3), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (14, 4), (15, 1)],
  term ((207931773073177513 : Rat) / 227326540184031) [(11, 1), (15, 3)],
  term ((246662840700 : Rat) / 150171761) [(11, 1), (15, 5)],
  term ((-42684430413247895775 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((45398726499931521785 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 3), (15, 1)],
  term ((42684430413247895775 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((51098120000 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)],
  term ((7754912379042501257 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((-21602000800 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((-19149318360975886687 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 3)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 3), (15, 2)],
  term ((-25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (15, 2)],
  term ((-7771841452124843657 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 4)],
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (14, 2), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 4)],
  term ((26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-32267836701874449140 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-19913188564122058225 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((55513980107659942065 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 3), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 4), (15, 1)],
  term ((-26579098247448927625 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 3)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 5)],
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 4)],
  term ((-128415881110 : Rat) / 150171761) [(11, 2), (14, 1)],
  term ((-8031535274218828119 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 4)],
  term ((-145637221665 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((578329503238716547 : Rat) / 303102053578708) [(11, 2), (14, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 2), (15, 4)],
  term ((104922581110 : Rat) / 150171761) [(11, 2), (14, 3)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 3), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 4), (15, 2)],
  term ((64207940555 : Rat) / 150171761) [(11, 2), (15, 2)],
  term ((578329503238716547 : Rat) / 303102053578708) [(11, 2), (15, 4)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 6)],
  term ((2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-1040572137554164210 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 3), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((-39419187456338506031 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 3)],
  term ((-122313260220760546893 : Rat) / 20610939643352144) [(11, 3), (14, 2), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 3), (15, 1)],
  term ((39419187456338506031 : Rat) / 20610939643352144) [(11, 3), (15, 3)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (14, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (14, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 4)],
  term ((-218496628220 : Rat) / 8578069) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((347442106838 : Rat) / 25734207) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((109248314110 : Rat) / 8578069) [(12, 1), (13, 1), (15, 3)],
  term ((-69735388319 : Rat) / 25734207) [(12, 1), (14, 1), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(12, 1), (14, 1), (15, 4)],
  term ((-103899401129 : Rat) / 51468414) [(12, 1), (14, 2), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(12, 1), (14, 3), (15, 2)],
  term ((69735388319 : Rat) / 51468414) [(12, 1), (15, 4)],
  term ((44558192300 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(12, 2), (14, 2), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(12, 2), (15, 4)],
  term ((324898908620 : Rat) / 25734207) [(13, 1), (14, 1), (15, 1)],
  term ((-411716303344 : Rat) / 25734207) [(13, 1), (14, 1), (15, 3)],
  term ((-123583329430 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((116291514514 : Rat) / 8578069) [(13, 1), (14, 2), (15, 3)],
  term ((-324898908620 : Rat) / 25734207) [(13, 1), (14, 3), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(13, 1), (14, 4), (15, 1)],
  term ((-162449454310 : Rat) / 25734207) [(13, 1), (15, 3)],
  term ((196141620452 : Rat) / 25734207) [(13, 1), (15, 5)],
  term ((64255356808 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(13, 2), (14, 2), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(13, 2), (15, 4)],
  term ((13799877729 : Rat) / 17156138) [(14, 1), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(14, 1), (15, 4)],
  term (-4 : Rat) [(14, 2)],
  term ((-13765565453 : Rat) / 34312276) [(14, 2), (15, 2)],
  term ((20245014326 : Rat) / 8578069) [(14, 2), (15, 4)],
  term (2 : Rat) [(14, 3)],
  term ((-20245014326 : Rat) / 8578069) [(14, 3), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(14, 4), (15, 2)],
  term ((-13765565453 : Rat) / 34312276) [(15, 4)],
  term ((10122507163 : Rat) / 8578069) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 500 through 570. -/
theorem rs_R013_ueqv_R013YNNN_block_05_0500_0570_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_05_0500_0570
      rs_R013_ueqv_R013YNNN_block_05_0500_0570 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
