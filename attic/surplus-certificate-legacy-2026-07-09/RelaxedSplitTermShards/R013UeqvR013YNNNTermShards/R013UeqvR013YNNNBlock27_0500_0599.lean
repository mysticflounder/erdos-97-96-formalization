/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 27:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_27_0500_0599 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0500 : Poly :=
[
  term (-32 : Rat) [(7, 2)]
]

/-- Partial product 500 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0500 : Poly :=
[
  term (64 : Rat) [(0, 1), (7, 2), (12, 1)],
  term (-32 : Rat) [(0, 2), (7, 2)],
  term (64 : Rat) [(1, 1), (7, 2), (13, 1)],
  term (-32 : Rat) [(1, 2), (7, 2)],
  term (-64 : Rat) [(7, 2), (12, 1), (14, 1)],
  term (-64 : Rat) [(7, 2), (13, 1), (15, 1)],
  term (32 : Rat) [(7, 2), (14, 2)],
  term (32 : Rat) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0500_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0500
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0501 : Poly :=
[
  term ((-72359368790 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 501 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0501 : Poly :=
[
  term ((144718737580 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-72359368790 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((144718737580 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-72359368790 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-144718737580 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144718737580 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((72359368790 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((72359368790 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0501_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0501
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0502 : Poly :=
[
  term ((1809068800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 502 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0502 : Poly :=
[
  term ((-3618137600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1809068800 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3618137600 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1809068800 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((3618137600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1809068800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1809068800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((3618137600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0502_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0502
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0503 : Poly :=
[
  term ((87143158896584560 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 503 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0503 : Poly :=
[
  term ((-174286317793169120 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((87143158896584560 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-174286317793169120 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((87143158896584560 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((174286317793169120 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-87143158896584560 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-87143158896584560 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((174286317793169120 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0503_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0503
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0504 : Poly :=
[
  term ((-27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 504 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0504 : Poly :=
[
  term ((27884507088391692559 : Rat) / 5152734910838036) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 10305469821676072) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((27884507088391692559 : Rat) / 5152734910838036) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 10305469821676072) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-27884507088391692559 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0504_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0504
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0505 : Poly :=
[
  term ((22352835296 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 505 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0505 : Poly :=
[
  term ((-44705670592 : Rat) / 25734207) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((22352835296 : Rat) / 25734207) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-44705670592 : Rat) / 25734207) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((22352835296 : Rat) / 25734207) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((44705670592 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-22352835296 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-22352835296 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((44705670592 : Rat) / 25734207) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0505_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0505
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0506 : Poly :=
[
  term ((-31976792611 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 506 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0506 : Poly :=
[
  term ((63953585222 : Rat) / 25734207) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-31976792611 : Rat) / 25734207) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((63953585222 : Rat) / 25734207) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-31976792611 : Rat) / 25734207) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-63953585222 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-63953585222 : Rat) / 25734207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((31976792611 : Rat) / 25734207) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((31976792611 : Rat) / 25734207) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0506_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0506
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0507 : Poly :=
[
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 507 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0507 : Poly :=
[
  term ((-162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term ((-162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0507_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0507
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0508 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)]
]

/-- Partial product 508 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0508 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 2)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0508_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0508
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0509 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 509 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0509 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0509_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0509
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0510 : Poly :=
[
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 510 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0510 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0510_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0510
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0511 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 511 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0511 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0511_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0511
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0512 : Poly :=
[
  term ((26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 512 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0512 : Poly :=
[
  term ((-26095795363 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((-26095795363 : Rat) / 8578069) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0512_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0512
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0513 : Poly :=
[
  term ((-6844316100 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 513 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0513 : Poly :=
[
  term ((13688632200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-6844316100 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((13688632200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6844316100 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((-13688632200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13688632200 : Rat) / 150171761) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6844316100 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((6844316100 : Rat) / 150171761) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0513_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0513
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0514 : Poly :=
[
  term ((-20278700400 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 514 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0514 : Poly :=
[
  term ((40557400800 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-20278700400 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((40557400800 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-20278700400 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-40557400800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20278700400 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((20278700400 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-40557400800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0514_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0514
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0515 : Poly :=
[
  term ((-976828527015353355 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 515 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0515 : Poly :=
[
  term ((1953657054030706710 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-976828527015353355 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1953657054030706710 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-976828527015353355 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1953657054030706710 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((976828527015353355 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((976828527015353355 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1953657054030706710 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0515_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0515
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0516 : Poly :=
[
  term ((-1318767590134221405 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 516 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0516 : Poly :=
[
  term ((1318767590134221405 : Rat) / 2576367455419018) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((1318767590134221405 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1318767590134221405 : Rat) / 2576367455419018) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 2576367455419018) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((1318767590134221405 : Rat) / 5152734910838036) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((1318767590134221405 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0516_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0516
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0517 : Poly :=
[
  term ((-10753010956 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 517 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0517 : Poly :=
[
  term ((21506021912 : Rat) / 8578069) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-10753010956 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((21506021912 : Rat) / 8578069) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10753010956 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-21506021912 : Rat) / 8578069) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((10753010956 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10753010956 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)],
  term ((-21506021912 : Rat) / 8578069) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0517_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0517
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0518 : Poly :=
[
  term ((12922485011 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 518 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0518 : Poly :=
[
  term ((-25844970022 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((12922485011 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term ((-25844970022 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((12922485011 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)],
  term ((25844970022 : Rat) / 8578069) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((25844970022 : Rat) / 8578069) [(9, 1), (13, 1), (15, 2)],
  term ((-12922485011 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term ((-12922485011 : Rat) / 8578069) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0518_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0518
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0519 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0519 : Poly :=
[
  term (-4 : Rat) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0519_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0519
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0520 : Poly :=
[
  term (-80 : Rat) [(9, 2)]
]

/-- Partial product 520 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0520 : Poly :=
[
  term (160 : Rat) [(0, 1), (9, 2), (12, 1)],
  term (-80 : Rat) [(0, 2), (9, 2)],
  term (160 : Rat) [(1, 1), (9, 2), (13, 1)],
  term (-80 : Rat) [(1, 2), (9, 2)],
  term (-160 : Rat) [(9, 2), (12, 1), (14, 1)],
  term (-160 : Rat) [(9, 2), (13, 1), (15, 1)],
  term (80 : Rat) [(9, 2), (14, 2)],
  term (80 : Rat) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0520_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0520
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0521 : Poly :=
[
  term ((3426783320 : Rat) / 150171761) [(10, 1)]
]

/-- Partial product 521 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0521 : Poly :=
[
  term ((-6853566640 : Rat) / 150171761) [(0, 1), (10, 1), (12, 1)],
  term ((3426783320 : Rat) / 150171761) [(0, 2), (10, 1)],
  term ((-6853566640 : Rat) / 150171761) [(1, 1), (10, 1), (13, 1)],
  term ((3426783320 : Rat) / 150171761) [(1, 2), (10, 1)],
  term ((6853566640 : Rat) / 150171761) [(10, 1), (12, 1), (14, 1)],
  term ((6853566640 : Rat) / 150171761) [(10, 1), (13, 1), (15, 1)],
  term ((-3426783320 : Rat) / 150171761) [(10, 1), (14, 2)],
  term ((-3426783320 : Rat) / 150171761) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0521_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0521
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0522 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 522 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0522 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 3), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0522_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0522
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0523 : Poly :=
[
  term ((645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 523 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0523 : Poly :=
[
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0523_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0523
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0524 : Poly :=
[
  term ((-2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 524 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0524 : Poly :=
[
  term ((4275980800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2137990400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2137990400 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0524_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0524
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0525 : Poly :=
[
  term ((12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 525 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0525 : Poly :=
[
  term ((-12795926937 : Rat) / 17156138) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12795926937 : Rat) / 17156138) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((12795926937 : Rat) / 34312276) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((12795926937 : Rat) / 17156138) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((12795926937 : Rat) / 17156138) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0525_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0525
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0526 : Poly :=
[
  term ((98338270779881207 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 526 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0526 : Poly :=
[
  term ((-98338270779881207 : Rat) / 2576367455419018) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 5152734910838036) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-98338270779881207 : Rat) / 2576367455419018) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 5152734910838036) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 2576367455419018) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 2576367455419018) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-98338270779881207 : Rat) / 5152734910838036) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98338270779881207 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0526_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0526
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0527 : Poly :=
[
  term ((-40700204940 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 527 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0527 : Poly :=
[
  term ((81400409880 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-40700204940 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((81400409880 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-40700204940 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((-81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0527_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0527
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0528 : Poly :=
[
  term ((986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 528 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0528 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((986764800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((986764800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0528_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0528
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0529 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 529 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0529 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-3947059200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 3)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0529_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0529
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0530 : Poly :=
[
  term ((198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 530 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0530 : Poly :=
[
  term ((-396105267711748000 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-396105267711748000 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((396105267711748000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 4)],
  term ((396105267711748000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0530_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0530
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0531 : Poly :=
[
  term ((-102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 531 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0531 : Poly :=
[
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0531_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0531
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0532 : Poly :=
[
  term ((125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 532 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0532 : Poly :=
[
  term ((-251357853120 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((125678926560 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (14, 1)],
  term ((-251357853120 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((125678926560 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (14, 1)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0532_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0532
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0533 : Poly :=
[
  term ((11703819043813137809 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 533 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0533 : Poly :=
[
  term ((-11703819043813137809 : Rat) / 5152734910838036) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((11703819043813137809 : Rat) / 10305469821676072) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((-11703819043813137809 : Rat) / 5152734910838036) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((11703819043813137809 : Rat) / 10305469821676072) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((11703819043813137809 : Rat) / 5152734910838036) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((11703819043813137809 : Rat) / 5152734910838036) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-11703819043813137809 : Rat) / 10305469821676072) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-11703819043813137809 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0533_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0533
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0534 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 534 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0534 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 3), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0534_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0534
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0535 : Poly :=
[
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 535 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0535 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0535_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0535
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0536 : Poly :=
[
  term ((6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 536 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0536 : Poly :=
[
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 3)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0536_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0536
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0537 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 537 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0537 : Poly :=
[
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0537_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0537
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0538 : Poly :=
[
  term ((50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 538 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0538 : Poly :=
[
  term ((-101603796800 : Rat) / 25734207) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-101603796800 : Rat) / 25734207) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((50801898400 : Rat) / 25734207) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((101603796800 : Rat) / 25734207) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 4)],
  term ((101603796800 : Rat) / 25734207) [(10, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0538_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0538
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0539 : Poly :=
[
  term ((-26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 539 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0539 : Poly :=
[
  term ((52833974336 : Rat) / 25734207) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26416987168 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-26416987168 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0539_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0539
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0540 : Poly :=
[
  term (40 : Rat) [(10, 1), (14, 1)]
]

/-- Partial product 540 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0540 : Poly :=
[
  term (-80 : Rat) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term (40 : Rat) [(0, 2), (10, 1), (14, 1)],
  term (-80 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term (40 : Rat) [(1, 2), (10, 1), (14, 1)],
  term (80 : Rat) [(10, 1), (12, 1), (14, 2)],
  term (80 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(10, 1), (14, 1), (15, 2)],
  term (-40 : Rat) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0540_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0540
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0541 : Poly :=
[
  term ((7900897046 : Rat) / 25734207) [(10, 1), (15, 2)]
]

/-- Partial product 541 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0541 : Poly :=
[
  term ((-15801794092 : Rat) / 25734207) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((7900897046 : Rat) / 25734207) [(0, 2), (10, 1), (15, 2)],
  term ((-15801794092 : Rat) / 25734207) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((7900897046 : Rat) / 25734207) [(1, 2), (10, 1), (15, 2)],
  term ((15801794092 : Rat) / 25734207) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((15801794092 : Rat) / 25734207) [(10, 1), (13, 1), (15, 3)],
  term ((-7900897046 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term ((-7900897046 : Rat) / 25734207) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0541_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0541
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0542 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 542 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0542 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 3)],
  term ((-3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0542_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0542
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0543 : Poly :=
[
  term ((-199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 543 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0543 : Poly :=
[
  term ((398059506720 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(0, 2), (10, 2), (11, 1), (15, 1)],
  term ((398059506720 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (15, 1)],
  term ((-398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0543_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0543
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0544 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 544 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0544 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 4)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0544_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0544
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0545 : Poly :=
[
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 2)]
]

/-- Partial product 545 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0545 : Poly :=
[
  term ((19174595706032313114 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(0, 2), (10, 2), (11, 2), (15, 2)],
  term ((19174595706032313114 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (15, 2)],
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 3)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 2), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0545_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0545
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0546 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)]
]

/-- Partial product 546 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0546 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (10, 2), (12, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (10, 2), (12, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (10, 2), (12, 1), (15, 2)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (13, 1), (15, 3)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (14, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 4)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0546_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0546
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0547 : Poly :=
[
  term ((-14441728265 : Rat) / 34312276) [(10, 2), (15, 2)]
]

/-- Partial product 547 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0547 : Poly :=
[
  term ((14441728265 : Rat) / 17156138) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(0, 2), (10, 2), (15, 2)],
  term ((14441728265 : Rat) / 17156138) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(1, 2), (10, 2), (15, 2)],
  term ((-14441728265 : Rat) / 17156138) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-14441728265 : Rat) / 17156138) [(10, 2), (13, 1), (15, 3)],
  term ((14441728265 : Rat) / 34312276) [(10, 2), (14, 2), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0547_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0547
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0548 : Poly :=
[
  term ((1039725852200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 548 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0548 : Poly :=
[
  term ((-2079451704400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((1039725852200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2079451704400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((1039725852200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1039725852200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1039725852200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2079451704400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((2079451704400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0548_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0548
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0549 : Poly :=
[
  term ((-14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 549 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0549 : Poly :=
[
  term ((28174032400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-14087016200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((28174032400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-14087016200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((14087016200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-28174032400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-28174032400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0549_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0549
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0550 : Poly :=
[
  term ((-714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 550 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0550 : Poly :=
[
  term ((1428241757105039568 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1428241757105039568 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1428241757105039568 : Rat) / 1288183727709509) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((714120878552519784 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-1428241757105039568 : Rat) / 1288183727709509) [(11, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0550_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0550
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0551 : Poly :=
[
  term ((-1379485211399678920 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 551 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0551 : Poly :=
[
  term ((2758970422799357840 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1379485211399678920 : Rat) / 3864551183128527) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((2758970422799357840 : Rat) / 3864551183128527) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1379485211399678920 : Rat) / 3864551183128527) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2758970422799357840 : Rat) / 3864551183128527) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1379485211399678920 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1379485211399678920 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 3)],
  term ((-2758970422799357840 : Rat) / 3864551183128527) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0551_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0551
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0552 : Poly :=
[
  term ((74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 552 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0552 : Poly :=
[
  term ((-148241342000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((-148241342000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((148241342000 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 3)],
  term ((148241342000 : Rat) / 150171761) [(11, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0552_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0552
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0553 : Poly :=
[
  term ((-322433014700 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 553 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0553 : Poly :=
[
  term ((644866029400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-322433014700 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((644866029400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((-322433014700 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-644866029400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((322433014700 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((322433014700 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)],
  term ((-644866029400 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0553_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0553
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0554 : Poly :=
[
  term ((-551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 554 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0554 : Poly :=
[
  term ((1103550020000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-551775010000 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((1103550020000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-551775010000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1103550020000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 3)],
  term ((-1103550020000 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0554_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0554
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0555 : Poly :=
[
  term ((258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 555 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0555 : Poly :=
[
  term ((-517179382000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((258589691000 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-517179382000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((258589691000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((517179382000 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 4)],
  term ((517179382000 : Rat) / 150171761) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0555_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0555
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0556 : Poly :=
[
  term ((317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 556 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0556 : Poly :=
[
  term ((-635276079200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((317638039600 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-635276079200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((317638039600 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((635276079200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-317638039600 : Rat) / 150171761) [(11, 1), (13, 1), (15, 4)],
  term ((635276079200 : Rat) / 150171761) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0556_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0556
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0557 : Poly :=
[
  term ((60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 557 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0557 : Poly :=
[
  term ((-120067309600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-120067309600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((60033654800 : Rat) / 150171761) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((120067309600 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-60033654800 : Rat) / 150171761) [(11, 1), (13, 2), (15, 3)],
  term ((120067309600 : Rat) / 150171761) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0557_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0557
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0558 : Poly :=
[
  term ((-5106903183223835078 : Rat) / 3864551183128527) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 558 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0558 : Poly :=
[
  term ((10213806366447670156 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5106903183223835078 : Rat) / 3864551183128527) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((10213806366447670156 : Rat) / 3864551183128527) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5106903183223835078 : Rat) / 3864551183128527) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-10213806366447670156 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10213806366447670156 : Rat) / 3864551183128527) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((5106903183223835078 : Rat) / 3864551183128527) [(11, 1), (14, 1), (15, 3)],
  term ((5106903183223835078 : Rat) / 3864551183128527) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0558_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0558
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0559 : Poly :=
[
  term ((246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 559 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0559 : Poly :=
[
  term ((-493325681400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((493325681400 : Rat) / 150171761) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((493325681400 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0559_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0559
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0560 : Poly :=
[
  term ((3103400248434632581 : Rat) / 3864551183128527) [(11, 1), (15, 1)]
]

/-- Partial product 560 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0560 : Poly :=
[
  term ((-6206800496869265162 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((3103400248434632581 : Rat) / 3864551183128527) [(0, 2), (11, 1), (15, 1)],
  term ((-6206800496869265162 : Rat) / 3864551183128527) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((3103400248434632581 : Rat) / 3864551183128527) [(1, 2), (11, 1), (15, 1)],
  term ((6206800496869265162 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6206800496869265162 : Rat) / 3864551183128527) [(11, 1), (13, 1), (15, 2)],
  term ((-3103400248434632581 : Rat) / 3864551183128527) [(11, 1), (14, 2), (15, 1)],
  term ((-3103400248434632581 : Rat) / 3864551183128527) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0560_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0560
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0561 : Poly :=
[
  term ((246662840700 : Rat) / 150171761) [(11, 1), (15, 3)]
]

/-- Partial product 561 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0561 : Poly :=
[
  term ((-493325681400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((246662840700 : Rat) / 150171761) [(0, 2), (11, 1), (15, 3)],
  term ((-493325681400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((246662840700 : Rat) / 150171761) [(1, 2), (11, 1), (15, 3)],
  term ((493325681400 : Rat) / 150171761) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((493325681400 : Rat) / 150171761) [(11, 1), (13, 1), (15, 4)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0561_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0561
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0562 : Poly :=
[
  term ((56365924555 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 562 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0562 : Poly :=
[
  term ((-112731849110 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)],
  term ((56365924555 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((-112731849110 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((56365924555 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((112731849110 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)],
  term ((112731849110 : Rat) / 150171761) [(11, 2), (13, 1), (15, 1)],
  term ((-56365924555 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((-56365924555 : Rat) / 150171761) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0562_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0562
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0563 : Poly :=
[
  term ((-25549060000 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 563 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0563 : Poly :=
[
  term ((51098120000 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((-25549060000 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((51098120000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-25549060000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-51098120000 : Rat) / 150171761) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (15, 2)],
  term ((-51098120000 : Rat) / 150171761) [(11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0563_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0563
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0564 : Poly :=
[
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 564 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0564 : Poly :=
[
  term ((1357148043341813005 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357148043341813005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1357148043341813005 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-1357148043341813005 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1357148043341813005 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0564_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0564
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0565 : Poly :=
[
  term ((100167550451537711905 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 565 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0565 : Poly :=
[
  term ((-100167550451537711905 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((100167550451537711905 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-100167550451537711905 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((100167550451537711905 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-100167550451537711905 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-100167550451537711905 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((100167550451537711905 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((100167550451537711905 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0565_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0565
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0566 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 566 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0566 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 3)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0566_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0566
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0567 : Poly :=
[
  term ((5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 567 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0567 : Poly :=
[
  term ((-5688738454425521515 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-5688738454425521515 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((5688738454425521515 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((-5688738454425521515 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 3), (15, 2)],
  term ((5688738454425521515 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0567_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0567
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0568 : Poly :=
[
  term ((6127206149291955704 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 568 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0568 : Poly :=
[
  term ((-12254412298583911408 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((6127206149291955704 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-12254412298583911408 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((6127206149291955704 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((12254412298583911408 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-6127206149291955704 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-6127206149291955704 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 4)],
  term ((12254412298583911408 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0568_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0568
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0569 : Poly :=
[
  term ((7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 2)]
]

/-- Partial product 569 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0569 : Poly :=
[
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 3), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 2), (15, 2)],
  term ((7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (15, 3)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (14, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 4)],
  term ((7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0569_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0569
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0570 : Poly :=
[
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 570 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0570 : Poly :=
[
  term ((53158196494897855250 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((53158196494897855250 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-53158196494897855250 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-53158196494897855250 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0570_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0570
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0571 : Poly :=
[
  term ((24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 571 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0571 : Poly :=
[
  term ((-24912620826617210275 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(0, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-24912620826617210275 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(1, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((24912620826617210275 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 4), (15, 1)],
  term ((24912620826617210275 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0571_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0571
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0572 : Poly :=
[
  term ((-62126617701895881935 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 572 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0572 : Poly :=
[
  term ((62126617701895881935 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-62126617701895881935 : Rat) / 5152734910838036) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((62126617701895881935 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-62126617701895881935 : Rat) / 5152734910838036) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-62126617701895881935 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((62126617701895881935 : Rat) / 5152734910838036) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((62126617701895881935 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 3)],
  term ((-62126617701895881935 : Rat) / 2576367455419018) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0572_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0572
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0573 : Poly :=
[
  term ((15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 573 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0573 : Poly :=
[
  term ((-30601359281042731790 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 3)],
  term ((-30601359281042731790 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 3)],
  term ((30601359281042731790 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-15300679640521365895 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 5)],
  term ((30601359281042731790 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0573_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0573
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0574 : Poly :=
[
  term ((2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 574 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0574 : Poly :=
[
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 2), (15, 2)],
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 3), (15, 2)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((5783663196644711770 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((-2891831598322355885 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 4)],
  term ((5783663196644711770 : Rat) / 1288183727709509) [(11, 2), (13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0574_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0574
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0575 : Poly :=
[
  term ((104922581110 : Rat) / 150171761) [(11, 2), (14, 1)]
]

/-- Partial product 575 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0575 : Poly :=
[
  term ((-209845162220 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((104922581110 : Rat) / 150171761) [(0, 2), (11, 2), (14, 1)],
  term ((-209845162220 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((104922581110 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)],
  term ((209845162220 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((209845162220 : Rat) / 150171761) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-104922581110 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)],
  term ((-104922581110 : Rat) / 150171761) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0575_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0575
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0576 : Poly :=
[
  term ((-32367837617031076645 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 576 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0576 : Poly :=
[
  term ((32367837617031076645 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-32367837617031076645 : Rat) / 2576367455419018) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((32367837617031076645 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-32367837617031076645 : Rat) / 2576367455419018) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((-32367837617031076645 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-32367837617031076645 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((32367837617031076645 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 4)],
  term ((32367837617031076645 : Rat) / 2576367455419018) [(11, 2), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0576_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0576
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0577 : Poly :=
[
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 2)]
]

/-- Partial product 577 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0577 : Poly :=
[
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(0, 2), (11, 2), (14, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(1, 2), (11, 2), (14, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 3), (15, 2)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0577_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0577
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0578 : Poly :=
[
  term ((5000236608464196921 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 578 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0578 : Poly :=
[
  term ((-10000473216928393842 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((5000236608464196921 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((-10000473216928393842 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((5000236608464196921 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)],
  term ((10000473216928393842 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((10000473216928393842 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 3)],
  term ((-5000236608464196921 : Rat) / 1288183727709509) [(11, 2), (14, 2), (15, 2)],
  term ((-5000236608464196921 : Rat) / 1288183727709509) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0578_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0578
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0579 : Poly :=
[
  term ((47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 4)]
]

/-- Partial product 579 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0579 : Poly :=
[
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (15, 4)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(0, 2), (11, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(1, 2), (11, 2), (15, 4)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 5)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0579_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0579
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0580 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 580 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0580 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 3), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0580_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0580
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0581 : Poly :=
[
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 581 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0581 : Poly :=
[
  term ((2461405332111606500 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((2461405332111606500 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0581_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0581
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0582 : Poly :=
[
  term ((40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 1)]
]

/-- Partial product 582 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0582 : Poly :=
[
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(0, 2), (11, 3), (14, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(1, 2), (11, 3), (14, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 5152734910838036) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((40433111919274763231 : Rat) / 5152734910838036) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 3)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0582_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0582
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0583 : Poly :=
[
  term ((33375167051077558831 : Rat) / 20610939643352144) [(11, 3), (15, 1)]
]

/-- Partial product 583 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0583 : Poly :=
[
  term ((-33375167051077558831 : Rat) / 10305469821676072) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((33375167051077558831 : Rat) / 20610939643352144) [(0, 2), (11, 3), (15, 1)],
  term ((-33375167051077558831 : Rat) / 10305469821676072) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((33375167051077558831 : Rat) / 20610939643352144) [(1, 2), (11, 3), (15, 1)],
  term ((33375167051077558831 : Rat) / 10305469821676072) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((33375167051077558831 : Rat) / 10305469821676072) [(11, 3), (13, 1), (15, 2)],
  term ((-33375167051077558831 : Rat) / 20610939643352144) [(11, 3), (14, 2), (15, 1)],
  term ((-33375167051077558831 : Rat) / 20610939643352144) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0583_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0583
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0584 : Poly :=
[
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 2)]
]

/-- Partial product 584 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0584 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (11, 4), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (11, 4), (13, 1), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (11, 4), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (12, 1), (14, 1), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 3)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (14, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0584_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0584
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0585 : Poly :=
[
  term ((-9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 585 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0585 : Poly :=
[
  term ((19697164508 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19697164508 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-9848582254 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((9848582254 : Rat) / 25734207) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-19697164508 : Rat) / 25734207) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-19697164508 : Rat) / 25734207) [(12, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0585_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0585
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0586 : Poly :=
[
  term ((583088096134 : Rat) / 25734207) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 586 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0586 : Poly :=
[
  term ((-1166176192268 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((583088096134 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1166176192268 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((583088096134 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-583088096134 : Rat) / 25734207) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-583088096134 : Rat) / 25734207) [(12, 1), (13, 1), (15, 3)],
  term ((1166176192268 : Rat) / 25734207) [(12, 1), (13, 2), (15, 2)],
  term ((1166176192268 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0586_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0586
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0587 : Poly :=
[
  term ((43408697362 : Rat) / 25734207) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 587 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0587 : Poly :=
[
  term ((-86817394724 : Rat) / 25734207) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-86817394724 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((43408697362 : Rat) / 25734207) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((86817394724 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-43408697362 : Rat) / 25734207) [(12, 1), (14, 1), (15, 4)],
  term ((-43408697362 : Rat) / 25734207) [(12, 1), (14, 3), (15, 2)],
  term ((86817394724 : Rat) / 25734207) [(12, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0587_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0587
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0588 : Poly :=
[
  term ((147407235083 : Rat) / 51468414) [(12, 1), (15, 2)]
]

/-- Partial product 588 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0588 : Poly :=
[
  term ((-147407235083 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((147407235083 : Rat) / 51468414) [(0, 2), (12, 1), (15, 2)],
  term ((-147407235083 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((147407235083 : Rat) / 51468414) [(1, 2), (12, 1), (15, 2)],
  term ((147407235083 : Rat) / 25734207) [(12, 1), (13, 1), (15, 3)],
  term ((-147407235083 : Rat) / 51468414) [(12, 1), (14, 2), (15, 2)],
  term ((-147407235083 : Rat) / 51468414) [(12, 1), (15, 4)],
  term ((147407235083 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0588_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0588
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0589 : Poly :=
[
  term ((-22279096150 : Rat) / 25734207) [(12, 2), (15, 2)]
]

/-- Partial product 589 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0589 : Poly :=
[
  term ((44558192300 : Rat) / 25734207) [(0, 1), (12, 3), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(0, 2), (12, 2), (15, 2)],
  term ((44558192300 : Rat) / 25734207) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(1, 2), (12, 2), (15, 2)],
  term ((-44558192300 : Rat) / 25734207) [(12, 2), (13, 1), (15, 3)],
  term ((22279096150 : Rat) / 25734207) [(12, 2), (14, 2), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(12, 2), (15, 4)],
  term ((-44558192300 : Rat) / 25734207) [(12, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0589_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0589
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0590 : Poly :=
[
  term ((-324898908620 : Rat) / 25734207) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 590 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0590 : Poly :=
[
  term ((649797817240 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-324898908620 : Rat) / 25734207) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((649797817240 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-324898908620 : Rat) / 25734207) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-649797817240 : Rat) / 25734207) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((324898908620 : Rat) / 25734207) [(13, 1), (14, 1), (15, 3)],
  term ((324898908620 : Rat) / 25734207) [(13, 1), (14, 3), (15, 1)],
  term ((-649797817240 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0590_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0590
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0591 : Poly :=
[
  term ((152732923090 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 591 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0591 : Poly :=
[
  term ((-305465846180 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-305465846180 : Rat) / 25734207) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((305465846180 : Rat) / 25734207) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(13, 1), (14, 2), (15, 3)],
  term ((-152732923090 : Rat) / 25734207) [(13, 1), (14, 4), (15, 1)],
  term ((305465846180 : Rat) / 25734207) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0591_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0591
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0592 : Poly :=
[
  term ((-105701255149 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 592 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0592 : Poly :=
[
  term ((211402510298 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-105701255149 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((211402510298 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)],
  term ((-105701255149 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((-211402510298 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((105701255149 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((105701255149 : Rat) / 25734207) [(13, 1), (15, 3)],
  term ((-211402510298 : Rat) / 25734207) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0592_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0592
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0593 : Poly :=
[
  term ((196141620452 : Rat) / 25734207) [(13, 1), (15, 3)]
]

/-- Partial product 593 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0593 : Poly :=
[
  term ((-392283240904 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((196141620452 : Rat) / 25734207) [(0, 2), (13, 1), (15, 3)],
  term ((-392283240904 : Rat) / 25734207) [(1, 1), (13, 2), (15, 3)],
  term ((196141620452 : Rat) / 25734207) [(1, 2), (13, 1), (15, 3)],
  term ((392283240904 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-196141620452 : Rat) / 25734207) [(13, 1), (14, 2), (15, 3)],
  term ((-196141620452 : Rat) / 25734207) [(13, 1), (15, 5)],
  term ((392283240904 : Rat) / 25734207) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0593_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0593
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0594 : Poly :=
[
  term ((-32127678404 : Rat) / 25734207) [(13, 2), (15, 2)]
]

/-- Partial product 594 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0594 : Poly :=
[
  term ((64255356808 : Rat) / 25734207) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(0, 2), (13, 2), (15, 2)],
  term ((64255356808 : Rat) / 25734207) [(1, 1), (13, 3), (15, 2)],
  term ((-32127678404 : Rat) / 25734207) [(1, 2), (13, 2), (15, 2)],
  term ((-64255356808 : Rat) / 25734207) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((32127678404 : Rat) / 25734207) [(13, 2), (14, 2), (15, 2)],
  term ((32127678404 : Rat) / 25734207) [(13, 2), (15, 4)],
  term ((-64255356808 : Rat) / 25734207) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0594_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0594
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0595 : Poly :=
[
  term (2 : Rat) [(14, 1)]
]

/-- Partial product 595 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0595 : Poly :=
[
  term (-4 : Rat) [(0, 1), (12, 1), (14, 1)],
  term (2 : Rat) [(0, 2), (14, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 1)],
  term (2 : Rat) [(1, 2), (14, 1)],
  term (4 : Rat) [(12, 1), (14, 2)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(14, 1), (15, 2)],
  term (-2 : Rat) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0595_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0595
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0596 : Poly :=
[
  term ((-53052624526 : Rat) / 25734207) [(14, 1), (15, 2)]
]

/-- Partial product 596 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0596 : Poly :=
[
  term ((106105249052 : Rat) / 25734207) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-53052624526 : Rat) / 25734207) [(0, 2), (14, 1), (15, 2)],
  term ((106105249052 : Rat) / 25734207) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-53052624526 : Rat) / 25734207) [(1, 2), (14, 1), (15, 2)],
  term ((-106105249052 : Rat) / 25734207) [(12, 1), (14, 2), (15, 2)],
  term ((-106105249052 : Rat) / 25734207) [(13, 1), (14, 1), (15, 3)],
  term ((53052624526 : Rat) / 25734207) [(14, 1), (15, 4)],
  term ((53052624526 : Rat) / 25734207) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0596_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0596
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0597 : Poly :=
[
  term ((10122507163 : Rat) / 8578069) [(14, 2), (15, 2)]
]

/-- Partial product 597 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0597 : Poly :=
[
  term ((-20245014326 : Rat) / 8578069) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(0, 2), (14, 2), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(1, 2), (14, 2), (15, 2)],
  term ((20245014326 : Rat) / 8578069) [(12, 1), (14, 3), (15, 2)],
  term ((20245014326 : Rat) / 8578069) [(13, 1), (14, 2), (15, 3)],
  term ((-10122507163 : Rat) / 8578069) [(14, 2), (15, 4)],
  term ((-10122507163 : Rat) / 8578069) [(14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0597_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0597
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0598 : Poly :=
[
  term ((-117779422843 : Rat) / 102936828) [(15, 2)]
]

/-- Partial product 598 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0598 : Poly :=
[
  term ((117779422843 : Rat) / 51468414) [(0, 1), (12, 1), (15, 2)],
  term ((-117779422843 : Rat) / 102936828) [(0, 2), (15, 2)],
  term ((117779422843 : Rat) / 51468414) [(1, 1), (13, 1), (15, 2)],
  term ((-117779422843 : Rat) / 102936828) [(1, 2), (15, 2)],
  term ((-117779422843 : Rat) / 51468414) [(12, 1), (14, 1), (15, 2)],
  term ((-117779422843 : Rat) / 51468414) [(13, 1), (15, 3)],
  term ((117779422843 : Rat) / 102936828) [(14, 2), (15, 2)],
  term ((117779422843 : Rat) / 102936828) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0598_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0598
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0599 : Poly :=
[
  term ((10122507163 : Rat) / 8578069) [(15, 4)]
]

/-- Partial product 599 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0599 : Poly :=
[
  term ((-20245014326 : Rat) / 8578069) [(0, 1), (12, 1), (15, 4)],
  term ((10122507163 : Rat) / 8578069) [(0, 2), (15, 4)],
  term ((-20245014326 : Rat) / 8578069) [(1, 1), (13, 1), (15, 4)],
  term ((10122507163 : Rat) / 8578069) [(1, 2), (15, 4)],
  term ((20245014326 : Rat) / 8578069) [(12, 1), (14, 1), (15, 4)],
  term ((20245014326 : Rat) / 8578069) [(13, 1), (15, 5)],
  term ((-10122507163 : Rat) / 8578069) [(14, 2), (15, 4)],
  term ((-10122507163 : Rat) / 8578069) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0599_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0599
        rs_R013_ueqv_R013YNNN_generator_27_0500_0599 =
      rs_R013_ueqv_R013YNNN_partial_27_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_27_0500_0599 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_27_0500,
  rs_R013_ueqv_R013YNNN_partial_27_0501,
  rs_R013_ueqv_R013YNNN_partial_27_0502,
  rs_R013_ueqv_R013YNNN_partial_27_0503,
  rs_R013_ueqv_R013YNNN_partial_27_0504,
  rs_R013_ueqv_R013YNNN_partial_27_0505,
  rs_R013_ueqv_R013YNNN_partial_27_0506,
  rs_R013_ueqv_R013YNNN_partial_27_0507,
  rs_R013_ueqv_R013YNNN_partial_27_0508,
  rs_R013_ueqv_R013YNNN_partial_27_0509,
  rs_R013_ueqv_R013YNNN_partial_27_0510,
  rs_R013_ueqv_R013YNNN_partial_27_0511,
  rs_R013_ueqv_R013YNNN_partial_27_0512,
  rs_R013_ueqv_R013YNNN_partial_27_0513,
  rs_R013_ueqv_R013YNNN_partial_27_0514,
  rs_R013_ueqv_R013YNNN_partial_27_0515,
  rs_R013_ueqv_R013YNNN_partial_27_0516,
  rs_R013_ueqv_R013YNNN_partial_27_0517,
  rs_R013_ueqv_R013YNNN_partial_27_0518,
  rs_R013_ueqv_R013YNNN_partial_27_0519,
  rs_R013_ueqv_R013YNNN_partial_27_0520,
  rs_R013_ueqv_R013YNNN_partial_27_0521,
  rs_R013_ueqv_R013YNNN_partial_27_0522,
  rs_R013_ueqv_R013YNNN_partial_27_0523,
  rs_R013_ueqv_R013YNNN_partial_27_0524,
  rs_R013_ueqv_R013YNNN_partial_27_0525,
  rs_R013_ueqv_R013YNNN_partial_27_0526,
  rs_R013_ueqv_R013YNNN_partial_27_0527,
  rs_R013_ueqv_R013YNNN_partial_27_0528,
  rs_R013_ueqv_R013YNNN_partial_27_0529,
  rs_R013_ueqv_R013YNNN_partial_27_0530,
  rs_R013_ueqv_R013YNNN_partial_27_0531,
  rs_R013_ueqv_R013YNNN_partial_27_0532,
  rs_R013_ueqv_R013YNNN_partial_27_0533,
  rs_R013_ueqv_R013YNNN_partial_27_0534,
  rs_R013_ueqv_R013YNNN_partial_27_0535,
  rs_R013_ueqv_R013YNNN_partial_27_0536,
  rs_R013_ueqv_R013YNNN_partial_27_0537,
  rs_R013_ueqv_R013YNNN_partial_27_0538,
  rs_R013_ueqv_R013YNNN_partial_27_0539,
  rs_R013_ueqv_R013YNNN_partial_27_0540,
  rs_R013_ueqv_R013YNNN_partial_27_0541,
  rs_R013_ueqv_R013YNNN_partial_27_0542,
  rs_R013_ueqv_R013YNNN_partial_27_0543,
  rs_R013_ueqv_R013YNNN_partial_27_0544,
  rs_R013_ueqv_R013YNNN_partial_27_0545,
  rs_R013_ueqv_R013YNNN_partial_27_0546,
  rs_R013_ueqv_R013YNNN_partial_27_0547,
  rs_R013_ueqv_R013YNNN_partial_27_0548,
  rs_R013_ueqv_R013YNNN_partial_27_0549,
  rs_R013_ueqv_R013YNNN_partial_27_0550,
  rs_R013_ueqv_R013YNNN_partial_27_0551,
  rs_R013_ueqv_R013YNNN_partial_27_0552,
  rs_R013_ueqv_R013YNNN_partial_27_0553,
  rs_R013_ueqv_R013YNNN_partial_27_0554,
  rs_R013_ueqv_R013YNNN_partial_27_0555,
  rs_R013_ueqv_R013YNNN_partial_27_0556,
  rs_R013_ueqv_R013YNNN_partial_27_0557,
  rs_R013_ueqv_R013YNNN_partial_27_0558,
  rs_R013_ueqv_R013YNNN_partial_27_0559,
  rs_R013_ueqv_R013YNNN_partial_27_0560,
  rs_R013_ueqv_R013YNNN_partial_27_0561,
  rs_R013_ueqv_R013YNNN_partial_27_0562,
  rs_R013_ueqv_R013YNNN_partial_27_0563,
  rs_R013_ueqv_R013YNNN_partial_27_0564,
  rs_R013_ueqv_R013YNNN_partial_27_0565,
  rs_R013_ueqv_R013YNNN_partial_27_0566,
  rs_R013_ueqv_R013YNNN_partial_27_0567,
  rs_R013_ueqv_R013YNNN_partial_27_0568,
  rs_R013_ueqv_R013YNNN_partial_27_0569,
  rs_R013_ueqv_R013YNNN_partial_27_0570,
  rs_R013_ueqv_R013YNNN_partial_27_0571,
  rs_R013_ueqv_R013YNNN_partial_27_0572,
  rs_R013_ueqv_R013YNNN_partial_27_0573,
  rs_R013_ueqv_R013YNNN_partial_27_0574,
  rs_R013_ueqv_R013YNNN_partial_27_0575,
  rs_R013_ueqv_R013YNNN_partial_27_0576,
  rs_R013_ueqv_R013YNNN_partial_27_0577,
  rs_R013_ueqv_R013YNNN_partial_27_0578,
  rs_R013_ueqv_R013YNNN_partial_27_0579,
  rs_R013_ueqv_R013YNNN_partial_27_0580,
  rs_R013_ueqv_R013YNNN_partial_27_0581,
  rs_R013_ueqv_R013YNNN_partial_27_0582,
  rs_R013_ueqv_R013YNNN_partial_27_0583,
  rs_R013_ueqv_R013YNNN_partial_27_0584,
  rs_R013_ueqv_R013YNNN_partial_27_0585,
  rs_R013_ueqv_R013YNNN_partial_27_0586,
  rs_R013_ueqv_R013YNNN_partial_27_0587,
  rs_R013_ueqv_R013YNNN_partial_27_0588,
  rs_R013_ueqv_R013YNNN_partial_27_0589,
  rs_R013_ueqv_R013YNNN_partial_27_0590,
  rs_R013_ueqv_R013YNNN_partial_27_0591,
  rs_R013_ueqv_R013YNNN_partial_27_0592,
  rs_R013_ueqv_R013YNNN_partial_27_0593,
  rs_R013_ueqv_R013YNNN_partial_27_0594,
  rs_R013_ueqv_R013YNNN_partial_27_0595,
  rs_R013_ueqv_R013YNNN_partial_27_0596,
  rs_R013_ueqv_R013YNNN_partial_27_0597,
  rs_R013_ueqv_R013YNNN_partial_27_0598,
  rs_R013_ueqv_R013YNNN_partial_27_0599
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_27_0500_0599 : Poly :=
[
  term (64 : Rat) [(0, 1), (7, 2), (12, 1)],
  term ((144718737580 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3618137600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((27884507088391692559 : Rat) / 5152734910838036) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-174286317793169120 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((63953585222 : Rat) / 25734207) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-44705670592 : Rat) / 25734207) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 2)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 2), (15, 1)],
  term ((-26095795363 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 2), (15, 1)],
  term ((13688632200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((40557400800 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((1318767590134221405 : Rat) / 2576367455419018) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1953657054030706710 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-25844970022 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((21506021912 : Rat) / 8578069) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term (160 : Rat) [(0, 1), (9, 2), (12, 1)],
  term ((4275980800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12795926937 : Rat) / 17156138) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-98338270779881207 : Rat) / 2576367455419018) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-11703819043813137809 : Rat) / 5152734910838036) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2), (14, 1)],
  term ((-396105267711748000 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-6853566640 : Rat) / 150171761) [(0, 1), (10, 1), (12, 1)],
  term ((52833974336 : Rat) / 25734207) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-15801794092 : Rat) / 25734207) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-101603796800 : Rat) / 25734207) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((398059506720 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 2), (15, 1)],
  term ((19174595706032313114 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 2), (15, 2)],
  term ((14441728265 : Rat) / 17156138) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (10, 2), (12, 2), (15, 2)],
  term ((644866029400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((1103550020000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-517179382000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-635276079200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-120067309600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((10213806366447670156 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6206800496869265162 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-2079451704400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((28174032400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1428241757105039568 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2758970422799357840 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-148241342000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-112731849110 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)],
  term ((53158196494897855250 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24912620826617210275 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((62126617701895881935 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-30601359281042731790 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-209845162220 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((32367837617031076645 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-10000473216928393842 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(0, 1), (11, 2), (12, 1), (15, 4)],
  term ((51098120000 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((1357148043341813005 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-100167550451537711905 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 1)],
  term ((-5688738454425521515 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-12254412298583911408 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 3), (15, 2)],
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-33375167051077558831 : Rat) / 10305469821676072) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((2461405332111606500 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)],
  term ((649797817240 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-305465846180 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((211402510298 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-392283240904 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((64255356808 : Rat) / 25734207) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term (-4 : Rat) [(0, 1), (12, 1), (14, 1)],
  term ((106105249052 : Rat) / 25734207) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((117779422843 : Rat) / 51468414) [(0, 1), (12, 1), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(0, 1), (12, 1), (15, 4)],
  term ((19697164508 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1166176192268 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-86817394724 : Rat) / 25734207) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-147407235083 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((44558192300 : Rat) / 25734207) [(0, 1), (12, 3), (15, 2)],
  term (-32 : Rat) [(0, 2), (7, 2)],
  term ((-72359368790 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((1809068800 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((87143158896584560 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 10305469821676072) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((22352835296 : Rat) / 25734207) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-31976792611 : Rat) / 25734207) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((-6844316100 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((-20278700400 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-976828527015353355 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-10753010956 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((12922485011 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(0, 2), (9, 2)],
  term ((3426783320 : Rat) / 150171761) [(0, 2), (10, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2137990400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((12795926937 : Rat) / 34312276) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 5152734910838036) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-40700204940 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((986764800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((125678926560 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (14, 1)],
  term ((11703819043813137809 : Rat) / 10305469821676072) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((50801898400 : Rat) / 25734207) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-26416987168 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(0, 2), (10, 1), (14, 1)],
  term ((7900897046 : Rat) / 25734207) [(0, 2), (10, 1), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(0, 2), (10, 2), (11, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(0, 2), (10, 2), (11, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (10, 2), (12, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(0, 2), (10, 2), (15, 2)],
  term ((1039725852200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-14087016200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1379485211399678920 : Rat) / 3864551183128527) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((-322433014700 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((-551775010000 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((258589691000 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((317638039600 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((60033654800 : Rat) / 150171761) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5106903183223835078 : Rat) / 3864551183128527) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((3103400248434632581 : Rat) / 3864551183128527) [(0, 2), (11, 1), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(0, 2), (11, 1), (15, 3)],
  term ((56365924555 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((-25549060000 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((100167550451537711905 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((6127206149291955704 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(0, 2), (11, 2), (12, 2), (15, 2)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(0, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-62126617701895881935 : Rat) / 5152734910838036) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 3)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 2), (15, 2)],
  term ((104922581110 : Rat) / 150171761) [(0, 2), (11, 2), (14, 1)],
  term ((-32367837617031076645 : Rat) / 2576367455419018) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(0, 2), (11, 2), (14, 2), (15, 2)],
  term ((5000236608464196921 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(0, 2), (11, 2), (15, 4)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(0, 2), (11, 3), (14, 1), (15, 1)],
  term ((33375167051077558831 : Rat) / 20610939643352144) [(0, 2), (11, 3), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (11, 4), (15, 2)],
  term ((-9848582254 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((583088096134 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((43408697362 : Rat) / 25734207) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((147407235083 : Rat) / 51468414) [(0, 2), (12, 1), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(0, 2), (12, 2), (15, 2)],
  term ((-324898908620 : Rat) / 25734207) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-105701255149 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((196141620452 : Rat) / 25734207) [(0, 2), (13, 1), (15, 3)],
  term ((-32127678404 : Rat) / 25734207) [(0, 2), (13, 2), (15, 2)],
  term (2 : Rat) [(0, 2), (14, 1)],
  term ((-53052624526 : Rat) / 25734207) [(0, 2), (14, 1), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(0, 2), (14, 2), (15, 2)],
  term ((-117779422843 : Rat) / 102936828) [(0, 2), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(0, 2), (15, 4)],
  term (64 : Rat) [(1, 1), (7, 2), (13, 1)],
  term ((-3618137600 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((144718737580 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-174286317793169120 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((27884507088391692559 : Rat) / 5152734910838036) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-44705670592 : Rat) / 25734207) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((63953585222 : Rat) / 25734207) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-26095795363 : Rat) / 8578069) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((40557400800 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((13688632200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((1953657054030706710 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1318767590134221405 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((21506021912 : Rat) / 8578069) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25844970022 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (160 : Rat) [(1, 1), (9, 2), (13, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1291179491689133184 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12795926937 : Rat) / 17156138) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-98338270779881207 : Rat) / 2576367455419018) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3947059200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-396105267711748000 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((81400409880 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-251357853120 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-11703819043813137809 : Rat) / 5152734910838036) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-101603796800 : Rat) / 25734207) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6853566640 : Rat) / 150171761) [(1, 1), (10, 1), (13, 1)],
  term (-80 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-15801794092 : Rat) / 25734207) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((398059506720 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((19174595706032313114 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((14441728265 : Rat) / 17156138) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((1428241757105039568 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2758970422799357840 : Rat) / 3864551183128527) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2079451704400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((28174032400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-148241342000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10213806366447670156 : Rat) / 3864551183128527) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6206800496869265162 : Rat) / 3864551183128527) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((644866029400 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((1103550020000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-517179382000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-635276079200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-120067309600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((51098120000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-5688738454425521515 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12254412298583911408 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((1357148043341813005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-100167550451537711905 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-7140811239986524775 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((-112731849110 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((-209845162220 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((32367837617031076645 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-10000473216928393842 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((53158196494897855250 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-24912620826617210275 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((62126617701895881935 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-30601359281042731790 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((-5783663196644711770 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 3), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2461405332111606500 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-40433111919274763231 : Rat) / 5152734910838036) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-33375167051077558831 : Rat) / 10305469821676072) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (11, 4), (13, 1), (15, 2)],
  term ((-86817394724 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-147407235083 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((19697164508 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1166176192268 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((44558192300 : Rat) / 25734207) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 1)],
  term ((106105249052 : Rat) / 25734207) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((117779422843 : Rat) / 51468414) [(1, 1), (13, 1), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(1, 1), (13, 1), (15, 4)],
  term ((649797817240 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-305465846180 : Rat) / 25734207) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((211402510298 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)],
  term ((-392283240904 : Rat) / 25734207) [(1, 1), (13, 2), (15, 3)],
  term ((64255356808 : Rat) / 25734207) [(1, 1), (13, 3), (15, 2)],
  term (-32 : Rat) [(1, 2), (7, 2)],
  term ((-72359368790 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((1809068800 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((87143158896584560 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 10305469821676072) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((22352835296 : Rat) / 25734207) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-31976792611 : Rat) / 25734207) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((26095795363 : Rat) / 17156138) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((-6844316100 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((-20278700400 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-976828527015353355 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-10753010956 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((12922485011 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(1, 2), (9, 2)],
  term ((3426783320 : Rat) / 150171761) [(1, 2), (10, 1)],
  term ((8128303744 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((645589745844566592 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2137990400 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((12795926937 : Rat) / 34312276) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((98338270779881207 : Rat) / 5152734910838036) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-40700204940 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((986764800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((198052633855874000 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-102987369605054480 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((125678926560 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (14, 1)],
  term ((11703819043813137809 : Rat) / 10305469821676072) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((6053975762099408022 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((50801898400 : Rat) / 25734207) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-26416987168 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(1, 2), (10, 1), (14, 1)],
  term ((7900897046 : Rat) / 25734207) [(1, 2), (10, 1), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-199029753360 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-9587297853016156557 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (10, 2), (12, 1), (15, 2)],
  term ((-14441728265 : Rat) / 34312276) [(1, 2), (10, 2), (15, 2)],
  term ((1039725852200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-14087016200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-714120878552519784 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1379485211399678920 : Rat) / 3864551183128527) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((74120671000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((-322433014700 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-551775010000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((258589691000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((317638039600 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((60033654800 : Rat) / 150171761) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5106903183223835078 : Rat) / 3864551183128527) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((3103400248434632581 : Rat) / 3864551183128527) [(1, 2), (11, 1), (15, 1)],
  term ((246662840700 : Rat) / 150171761) [(1, 2), (11, 1), (15, 3)],
  term ((56365924555 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((-25549060000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-1357148043341813005 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((100167550451537711905 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((5688738454425521515 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((6127206149291955704 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((7140811239986524775 : Rat) / 2576367455419018) [(1, 2), (11, 2), (12, 2), (15, 2)],
  term ((-26579098247448927625 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((24912620826617210275 : Rat) / 2576367455419018) [(1, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-62126617701895881935 : Rat) / 5152734910838036) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((15300679640521365895 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 3)],
  term ((2891831598322355885 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((104922581110 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)],
  term ((-32367837617031076645 : Rat) / 2576367455419018) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(1, 2), (11, 2), (14, 2), (15, 2)],
  term ((5000236608464196921 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)],
  term ((47527167835746269235 : Rat) / 5152734910838036) [(1, 2), (11, 2), (15, 4)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1230702666055803250 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((40433111919274763231 : Rat) / 10305469821676072) [(1, 2), (11, 3), (14, 1), (15, 1)],
  term ((33375167051077558831 : Rat) / 20610939643352144) [(1, 2), (11, 3), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (11, 4), (15, 2)],
  term ((-9848582254 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((583088096134 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((43408697362 : Rat) / 25734207) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((147407235083 : Rat) / 51468414) [(1, 2), (12, 1), (15, 2)],
  term ((-22279096150 : Rat) / 25734207) [(1, 2), (12, 2), (15, 2)],
  term ((-324898908620 : Rat) / 25734207) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((152732923090 : Rat) / 25734207) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-105701255149 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((196141620452 : Rat) / 25734207) [(1, 2), (13, 1), (15, 3)],
  term ((-32127678404 : Rat) / 25734207) [(1, 2), (13, 2), (15, 2)],
  term (2 : Rat) [(1, 2), (14, 1)],
  term ((-53052624526 : Rat) / 25734207) [(1, 2), (14, 1), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(1, 2), (14, 2), (15, 2)],
  term ((-117779422843 : Rat) / 102936828) [(1, 2), (15, 2)],
  term ((10122507163 : Rat) / 8578069) [(1, 2), (15, 4)],
  term (-64 : Rat) [(7, 2), (12, 1), (14, 1)],
  term (-64 : Rat) [(7, 2), (13, 1), (15, 1)],
  term (32 : Rat) [(7, 2), (14, 2)],
  term (32 : Rat) [(7, 2), (15, 2)],
  term ((3618137600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-144718737580 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1809068800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1809068800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((3618137600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-144718737580 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((72359368790 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((72359368790 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((174286317793169120 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-27884507088391692559 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-87143158896584560 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-87143158896584560 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((174286317793169120 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-27884507088391692559 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 3)],
  term ((44705670592 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-63953585222 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22352835296 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-22352835296 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((44705670592 : Rat) / 25734207) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-63953585222 : Rat) / 25734207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((31976792611 : Rat) / 25734207) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((31976792611 : Rat) / 25734207) [(9, 1), (10, 1), (15, 3)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 2)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 2), (14, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 3)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 2), (14, 1), (15, 1)],
  term ((26095795363 : Rat) / 8578069) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-26095795363 : Rat) / 17156138) [(9, 1), (10, 2), (15, 3)],
  term ((-40557400800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13688632200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((20278700400 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((20278700400 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-40557400800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-13688632200 : Rat) / 150171761) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6844316100 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((6844316100 : Rat) / 150171761) [(9, 1), (11, 1), (15, 2)],
  term ((-1953657054030706710 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-1318767590134221405 : Rat) / 2576367455419018) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((976828527015353355 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((976828527015353355 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1953657054030706710 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1318767590134221405 : Rat) / 2576367455419018) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((1318767590134221405 : Rat) / 5152734910838036) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((1318767590134221405 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 3)],
  term ((-21506021912 : Rat) / 8578069) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((25844970022 : Rat) / 8578069) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10753010956 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10753010956 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)],
  term ((-21506021912 : Rat) / 8578069) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((25844970022 : Rat) / 8578069) [(9, 1), (13, 1), (15, 2)],
  term (4 : Rat) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12922485011 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12922485011 : Rat) / 8578069) [(9, 1), (15, 3)],
  term (-2 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (-160 : Rat) [(9, 2), (12, 1), (14, 1)],
  term (-160 : Rat) [(9, 2), (13, 1), (15, 1)],
  term (80 : Rat) [(9, 2), (14, 2)],
  term (80 : Rat) [(9, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((98338270779881207 : Rat) / 2576367455419018) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((630407390067492873 : Rat) / 2576367455419018) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-645589745844566592 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((1291179491689133184 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((1958266540101701257 : Rat) / 2576367455419018) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2137990400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((98338270779881207 : Rat) / 2576367455419018) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-98338270779881207 : Rat) / 5152734910838036) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-12795926937 : Rat) / 34312276) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-98338270779881207 : Rat) / 5152734910838036) [(10, 1), (11, 1), (15, 3)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((396105267711748000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((11636102751483768209 : Rat) / 5152734910838036) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((250371088320 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 3)],
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-198052633855874000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 4)],
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2), (14, 1)],
  term ((396105267711748000 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2), (14, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((102987369605054480 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((11703819043813137809 : Rat) / 5152734910838036) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((-11703819043813137809 : Rat) / 10305469821676072) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-125678926560 : Rat) / 150171761) [(10, 1), (11, 2), (14, 3)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2), (15, 2)],
  term ((-11703819043813137809 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 4)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((12060418892073406284 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 3), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (14, 2), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 3)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-6053975762099408022 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 3)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((101603796800 : Rat) / 25734207) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((6853566640 : Rat) / 150171761) [(10, 1), (12, 1), (14, 1)],
  term ((15801794092 : Rat) / 25734207) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term (80 : Rat) [(10, 1), (12, 1), (14, 2)],
  term ((-50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-50801898400 : Rat) / 25734207) [(10, 1), (12, 1), (15, 4)],
  term ((101603796800 : Rat) / 25734207) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term (80 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((26416987168 : Rat) / 25734207) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((6853566640 : Rat) / 150171761) [(10, 1), (13, 1), (15, 1)],
  term ((15801794092 : Rat) / 25734207) [(10, 1), (13, 1), (15, 3)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term (-40 : Rat) [(10, 1), (14, 1), (15, 2)],
  term ((-3426783320 : Rat) / 150171761) [(10, 1), (14, 2)],
  term ((-7900897046 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term (-40 : Rat) [(10, 1), (14, 3)],
  term ((-3426783320 : Rat) / 150171761) [(10, 1), (15, 2)],
  term ((-7900897046 : Rat) / 25734207) [(10, 1), (15, 4)],
  term ((-3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 3)],
  term ((-3947059200 : Rat) / 150171761) [(10, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-398059506720 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((199029753360 : Rat) / 150171761) [(10, 2), (11, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 4)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-19174595706032313114 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 3)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 2), (15, 2)],
  term ((9587297853016156557 : Rat) / 1288183727709509) [(10, 2), (11, 2), (15, 4)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (13, 1), (15, 3)],
  term ((-14441728265 : Rat) / 17156138) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (14, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 4)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 2), (14, 1), (15, 2)],
  term ((-14441728265 : Rat) / 17156138) [(10, 2), (13, 1), (15, 3)],
  term ((14441728265 : Rat) / 34312276) [(10, 2), (14, 2), (15, 2)],
  term ((14441728265 : Rat) / 34312276) [(10, 2), (15, 4)],
  term ((-644866029400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4142039681289743032 : Rat) / 1288183727709509) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2143275872200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((31250964600 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-29515490726565563240 : Rat) / 3864551183128527) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((91893277200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2079451704400 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((6206800496869265162 : Rat) / 3864551183128527) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4945902613073736384 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2944773718349330412 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((4945902613073736384 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((1379485211399678920 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 3)],
  term ((2079451704400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-28174032400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((148241342000 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2758970422799357840 : Rat) / 3864551183128527) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2064053987269338568 : Rat) / 1288183727709509) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-74120671000 : Rat) / 150171761) [(11, 1), (12, 2), (15, 3)],
  term ((148241342000 : Rat) / 150171761) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((3985685958319399844 : Rat) / 3864551183128527) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((322433014700 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-82902049200 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((551775010000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 3)],
  term ((-258589691000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 4)],
  term ((14504358440793108062 : Rat) / 3864551183128527) [(11, 1), (13, 1), (15, 2)],
  term ((175687641800 : Rat) / 150171761) [(11, 1), (13, 1), (15, 4)],
  term ((-1103550020000 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((457145727200 : Rat) / 150171761) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-644866029400 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)],
  term ((575242424400 : Rat) / 150171761) [(11, 1), (13, 2), (15, 3)],
  term ((120067309600 : Rat) / 150171761) [(11, 1), (13, 3), (15, 2)],
  term ((5106903183223835078 : Rat) / 3864551183128527) [(11, 1), (14, 1), (15, 3)],
  term ((-3103400248434632581 : Rat) / 3864551183128527) [(11, 1), (14, 2), (15, 1)],
  term ((-493325681400 : Rat) / 150171761) [(11, 1), (14, 2), (15, 3)],
  term ((5106903183223835078 : Rat) / 3864551183128527) [(11, 1), (14, 3), (15, 1)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (14, 4), (15, 1)],
  term ((-3103400248434632581 : Rat) / 3864551183128527) [(11, 1), (15, 3)],
  term ((-246662840700 : Rat) / 150171761) [(11, 1), (15, 5)],
  term ((-2704101478009793545 : Rat) / 112015976322566) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((73937343514278319615 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-206483943441333422405 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3010728805680954915 : Rat) / 151551026789354) [(11, 2), (12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-51098120000 : Rat) / 150171761) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-75658725854369889089 : Rat) / 2576367455419018) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((4426515153302898765 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((100167550451537711905 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((112731849110 : Rat) / 150171761) [(11, 2), (12, 1), (14, 1)],
  term ((10017402290010736242 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((20919214690660373860 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((235394222220 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((-38495043766323032349 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(11, 2), (12, 1), (14, 3)],
  term ((20919214690660373860 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 3), (15, 2)],
  term ((25549060000 : Rat) / 150171761) [(11, 2), (12, 1), (15, 2)],
  term ((-6127206149291955704 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 4)],
  term ((100167550451537711905 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1357148043341813005 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 2), (15, 1)],
  term ((7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (15, 3)],
  term ((-51098120000 : Rat) / 150171761) [(11, 2), (12, 2), (14, 1)],
  term ((12254412298583911408 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 2), (14, 2)],
  term ((4236665668864518255 : Rat) / 2576367455419018) [(11, 2), (12, 2), (14, 2), (15, 2)],
  term ((-7140811239986524775 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 4)],
  term ((7140811239986524775 : Rat) / 1288183727709509) [(11, 2), (12, 3), (14, 1), (15, 2)],
  term ((209845162220 : Rat) / 150171761) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5788739369582149020 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((62126617701895881935 : Rat) / 5152734910838036) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3993406135956836415 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((26579098247448927625 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-24912620826617210275 : Rat) / 2576367455419018) [(11, 2), (13, 1), (14, 4), (15, 1)],
  term ((112731849110 : Rat) / 150171761) [(11, 2), (13, 1), (15, 1)],
  term ((102128510569609457303 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 3)],
  term ((16925808554703537445 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 5)],
  term ((-53158196494897855250 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((22020789228294854390 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((-62126617701895881935 : Rat) / 2576367455419018) [(11, 2), (13, 2), (15, 2)],
  term ((469653011571531795 : Rat) / 21833622503551) [(11, 2), (13, 2), (15, 4)],
  term ((5783663196644711770 : Rat) / 1288183727709509) [(11, 2), (13, 3), (15, 3)],
  term ((-104922581110 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)],
  term ((32367837617031076645 : Rat) / 2576367455419018) [(11, 2), (14, 1), (15, 4)],
  term ((-56365924555 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((-5000236608464196921 : Rat) / 1288183727709509) [(11, 2), (14, 2), (15, 2)],
  term ((-47527167835746269235 : Rat) / 2576367455419018) [(11, 2), (14, 2), (15, 4)],
  term ((-104922581110 : Rat) / 150171761) [(11, 2), (14, 3)],
  term ((32367837617031076645 : Rat) / 2576367455419018) [(11, 2), (14, 3), (15, 2)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (14, 4), (15, 2)],
  term ((-56365924555 : Rat) / 150171761) [(11, 2), (15, 2)],
  term ((-5000236608464196921 : Rat) / 1288183727709509) [(11, 2), (15, 4)],
  term ((-47527167835746269235 : Rat) / 5152734910838036) [(11, 2), (15, 6)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((33375167051077558831 : Rat) / 10305469821676072) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((768744450567762309 : Rat) / 87334490014204) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 3), (15, 1)],
  term ((1230702666055803250 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((-2461405332111606500 : Rat) / 1288183727709509) [(11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 2), (14, 2), (15, 1)],
  term ((40433111919274763231 : Rat) / 5152734910838036) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((33375167051077558831 : Rat) / 10305469821676072) [(11, 3), (13, 1), (15, 2)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 1), (15, 3)],
  term ((-33375167051077558831 : Rat) / 20610939643352144) [(11, 3), (14, 2), (15, 1)],
  term ((-40433111919274763231 : Rat) / 10305469821676072) [(11, 3), (14, 3), (15, 1)],
  term ((-33375167051077558831 : Rat) / 20610939643352144) [(11, 3), (15, 3)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (12, 1), (14, 1), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 3)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (14, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(11, 4), (15, 4)],
  term ((-211402510298 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((488949217882 : Rat) / 25734207) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1232885913374 : Rat) / 25734207) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((105104809478 : Rat) / 8578069) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-435680861051 : Rat) / 25734207) [(12, 1), (13, 1), (15, 3)],
  term ((-27984173772 : Rat) / 8578069) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((1166176192268 : Rat) / 25734207) [(12, 1), (13, 2), (15, 2)],
  term ((-117779422843 : Rat) / 51468414) [(12, 1), (14, 1), (15, 2)],
  term ((17326345616 : Rat) / 25734207) [(12, 1), (14, 1), (15, 4)],
  term (4 : Rat) [(12, 1), (14, 2)],
  term ((-119872577729 : Rat) / 17156138) [(12, 1), (14, 2), (15, 2)],
  term ((17326345616 : Rat) / 25734207) [(12, 1), (14, 3), (15, 2)],
  term ((-147407235083 : Rat) / 51468414) [(12, 1), (15, 4)],
  term ((1166176192268 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-19697164508 : Rat) / 25734207) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-44558192300 : Rat) / 25734207) [(12, 2), (13, 1), (15, 3)],
  term ((147407235083 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)],
  term ((36365496958 : Rat) / 8578069) [(12, 2), (14, 2), (15, 2)],
  term ((22279096150 : Rat) / 25734207) [(12, 2), (15, 4)],
  term ((-44558192300 : Rat) / 25734207) [(12, 3), (14, 1), (15, 2)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term ((72931219856 : Rat) / 8578069) [(13, 1), (14, 1), (15, 3)],
  term ((105701255149 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-96046500188 : Rat) / 8578069) [(13, 1), (14, 2), (15, 3)],
  term ((324898908620 : Rat) / 25734207) [(13, 1), (14, 3), (15, 1)],
  term ((-152732923090 : Rat) / 25734207) [(13, 1), (14, 4), (15, 1)],
  term ((93623087455 : Rat) / 51468414) [(13, 1), (15, 3)],
  term ((-135406577474 : Rat) / 25734207) [(13, 1), (15, 5)],
  term ((-649797817240 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)],
  term ((337593524584 : Rat) / 25734207) [(13, 2), (14, 2), (15, 2)],
  term ((-211402510298 : Rat) / 25734207) [(13, 2), (15, 2)],
  term ((2397801804 : Rat) / 145391) [(13, 2), (15, 4)],
  term ((-64255356808 : Rat) / 25734207) [(13, 3), (15, 3)],
  term (-2 : Rat) [(14, 1), (15, 2)],
  term ((53052624526 : Rat) / 25734207) [(14, 1), (15, 4)],
  term ((117779422843 : Rat) / 102936828) [(14, 2), (15, 2)],
  term ((-20245014326 : Rat) / 8578069) [(14, 2), (15, 4)],
  term (-2 : Rat) [(14, 3)],
  term ((53052624526 : Rat) / 25734207) [(14, 3), (15, 2)],
  term ((-10122507163 : Rat) / 8578069) [(14, 4), (15, 2)],
  term ((117779422843 : Rat) / 102936828) [(15, 4)],
  term ((-10122507163 : Rat) / 8578069) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 500 through 599. -/
theorem rs_R013_ueqv_R013YNNN_block_27_0500_0599_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_27_0500_0599
      rs_R013_ueqv_R013YNNN_block_27_0500_0599 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
