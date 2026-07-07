/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 27:500-510

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 : Poly :=
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
def rs_R009_ueqv_R009NNNNN_coefficient_27_0500 : Poly :=
[
  term ((513 : Rat) / 31) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 500 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0500 : Poly :=
[
  term ((-1026 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((513 : Rat) / 31) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-1026 : Rat) / 31) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((513 : Rat) / 31) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((1026 : Rat) / 31) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((-513 : Rat) / 31) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-513 : Rat) / 31) [(13, 2), (14, 4), (16, 1)],
  term ((1026 : Rat) / 31) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0500_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0500
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0501 : Poly :=
[
  term ((-8941 : Rat) / 1767) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 501 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0501 : Poly :=
[
  term ((17882 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8941 : Rat) / 1767) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((17882 : Rat) / 1767) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-8941 : Rat) / 1767) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-17882 : Rat) / 1767) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((8941 : Rat) / 1767) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((8941 : Rat) / 1767) [(13, 2), (15, 4), (16, 1)],
  term ((-17882 : Rat) / 1767) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0501_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0501
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0502 : Poly :=
[
  term ((-33830 : Rat) / 1767) [(13, 2), (16, 1)]
]

/-- Partial product 502 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0502 : Poly :=
[
  term ((67660 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-33830 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((67660 : Rat) / 1767) [(1, 1), (13, 3), (16, 1)],
  term ((-33830 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((-67660 : Rat) / 1767) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((33830 : Rat) / 1767) [(13, 2), (14, 2), (16, 1)],
  term ((33830 : Rat) / 1767) [(13, 2), (15, 2), (16, 1)],
  term ((-67660 : Rat) / 1767) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0502_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0502
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0503 : Poly :=
[
  term ((-114 : Rat) / 31) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0503 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(13, 3), (15, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0503_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0503
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0504 : Poly :=
[
  term ((390581 : Rat) / 3534) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 504 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0504 : Poly :=
[
  term ((-390581 : Rat) / 1767) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((390581 : Rat) / 3534) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-390581 : Rat) / 1767) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((390581 : Rat) / 3534) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((390581 : Rat) / 1767) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((390581 : Rat) / 1767) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-390581 : Rat) / 3534) [(14, 1), (15, 4), (16, 1)],
  term ((-390581 : Rat) / 3534) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0504_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0504
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0505 : Poly :=
[
  term ((-36748 : Rat) / 589) [(14, 1), (16, 1)]
]

/-- Partial product 505 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0505 : Poly :=
[
  term ((73496 : Rat) / 589) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36748 : Rat) / 589) [(0, 2), (14, 1), (16, 1)],
  term ((73496 : Rat) / 589) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36748 : Rat) / 589) [(1, 2), (14, 1), (16, 1)],
  term ((-73496 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((-73496 : Rat) / 589) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36748 : Rat) / 589) [(14, 1), (15, 2), (16, 1)],
  term ((36748 : Rat) / 589) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0505_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0505
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0506 : Poly :=
[
  term ((-117927 : Rat) / 2356) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 506 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0506 : Poly :=
[
  term ((117927 : Rat) / 1178) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((117927 : Rat) / 2356) [(14, 2), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0506_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0506
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0507 : Poly :=
[
  term ((17270 : Rat) / 589) [(14, 2), (16, 1)]
]

/-- Partial product 507 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0507 : Poly :=
[
  term ((-34540 : Rat) / 589) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((17270 : Rat) / 589) [(0, 2), (14, 2), (16, 1)],
  term ((-34540 : Rat) / 589) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((17270 : Rat) / 589) [(1, 2), (14, 2), (16, 1)],
  term ((34540 : Rat) / 589) [(12, 1), (14, 3), (16, 1)],
  term ((34540 : Rat) / 589) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17270 : Rat) / 589) [(14, 2), (15, 2), (16, 1)],
  term ((-17270 : Rat) / 589) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0507_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0507
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0508 : Poly :=
[
  term ((61745 : Rat) / 1178) [(15, 2), (16, 1)]
]

/-- Partial product 508 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0508 : Poly :=
[
  term ((-61745 : Rat) / 589) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((61745 : Rat) / 1178) [(0, 2), (15, 2), (16, 1)],
  term ((-61745 : Rat) / 589) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((61745 : Rat) / 1178) [(1, 2), (15, 2), (16, 1)],
  term ((61745 : Rat) / 589) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((61745 : Rat) / 589) [(13, 1), (15, 3), (16, 1)],
  term ((-61745 : Rat) / 1178) [(14, 2), (15, 2), (16, 1)],
  term ((-61745 : Rat) / 1178) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0508_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0508
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0509 : Poly :=
[
  term ((-117927 : Rat) / 2356) [(15, 4), (16, 1)]
]

/-- Partial product 509 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0509 : Poly :=
[
  term ((117927 : Rat) / 1178) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 2356) [(0, 2), (15, 4), (16, 1)],
  term ((117927 : Rat) / 1178) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 2356) [(1, 2), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 1178) [(13, 1), (15, 5), (16, 1)],
  term ((117927 : Rat) / 2356) [(14, 2), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0509_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0509
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0510 : Poly :=
[
  term ((-3700 : Rat) / 589) [(16, 1)]
]

/-- Partial product 510 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0510 : Poly :=
[
  term ((7400 : Rat) / 589) [(0, 1), (12, 1), (16, 1)],
  term ((-3700 : Rat) / 589) [(0, 2), (16, 1)],
  term ((7400 : Rat) / 589) [(1, 1), (13, 1), (16, 1)],
  term ((-3700 : Rat) / 589) [(1, 2), (16, 1)],
  term ((-7400 : Rat) / 589) [(12, 1), (14, 1), (16, 1)],
  term ((-7400 : Rat) / 589) [(13, 1), (15, 1), (16, 1)],
  term ((3700 : Rat) / 589) [(14, 2), (16, 1)],
  term ((3700 : Rat) / 589) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0510_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0510
        rs_R009_ueqv_R009NNNNN_generator_27_0500_0510 =
      rs_R009_ueqv_R009NNNNN_partial_27_0510 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_27_0500_0510 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_27_0500,
  rs_R009_ueqv_R009NNNNN_partial_27_0501,
  rs_R009_ueqv_R009NNNNN_partial_27_0502,
  rs_R009_ueqv_R009NNNNN_partial_27_0503,
  rs_R009_ueqv_R009NNNNN_partial_27_0504,
  rs_R009_ueqv_R009NNNNN_partial_27_0505,
  rs_R009_ueqv_R009NNNNN_partial_27_0506,
  rs_R009_ueqv_R009NNNNN_partial_27_0507,
  rs_R009_ueqv_R009NNNNN_partial_27_0508,
  rs_R009_ueqv_R009NNNNN_partial_27_0509,
  rs_R009_ueqv_R009NNNNN_partial_27_0510
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_27_0500_0510 : Poly :=
[
  term ((-1026 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((17882 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((67660 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-390581 : Rat) / 1767) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73496 : Rat) / 589) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((117927 : Rat) / 1178) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-34540 : Rat) / 589) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-61745 : Rat) / 589) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((7400 : Rat) / 589) [(0, 1), (12, 1), (16, 1)],
  term ((513 : Rat) / 31) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-8941 : Rat) / 1767) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-33830 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((390581 : Rat) / 3534) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-36748 : Rat) / 589) [(0, 2), (14, 1), (16, 1)],
  term ((-117927 : Rat) / 2356) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((17270 : Rat) / 589) [(0, 2), (14, 2), (16, 1)],
  term ((61745 : Rat) / 1178) [(0, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(0, 2), (15, 4), (16, 1)],
  term ((-3700 : Rat) / 589) [(0, 2), (16, 1)],
  term ((-390581 : Rat) / 1767) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((73496 : Rat) / 589) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((117927 : Rat) / 1178) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-34540 : Rat) / 589) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-61745 : Rat) / 589) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((7400 : Rat) / 589) [(1, 1), (13, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((17882 : Rat) / 1767) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((67660 : Rat) / 1767) [(1, 1), (13, 3), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((513 : Rat) / 31) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-8941 : Rat) / 1767) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-33830 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((390581 : Rat) / 3534) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-36748 : Rat) / 589) [(1, 2), (14, 1), (16, 1)],
  term ((-117927 : Rat) / 2356) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((17270 : Rat) / 589) [(1, 2), (14, 2), (16, 1)],
  term ((61745 : Rat) / 1178) [(1, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(1, 2), (15, 4), (16, 1)],
  term ((-3700 : Rat) / 589) [(1, 2), (16, 1)],
  term ((-17882 : Rat) / 1767) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-67660 : Rat) / 1767) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((61745 : Rat) / 589) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-7400 : Rat) / 589) [(12, 1), (14, 1), (16, 1)],
  term ((390581 : Rat) / 1767) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-73496 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((34540 : Rat) / 589) [(12, 1), (14, 3), (16, 1)],
  term ((-73496 : Rat) / 589) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((390581 : Rat) / 1767) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((34540 : Rat) / 589) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-117927 : Rat) / 1178) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-7400 : Rat) / 589) [(13, 1), (15, 1), (16, 1)],
  term ((61745 : Rat) / 589) [(13, 1), (15, 3), (16, 1)],
  term ((-117927 : Rat) / 1178) [(13, 1), (15, 5), (16, 1)],
  term ((-20300 : Rat) / 1767) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((33830 : Rat) / 1767) [(13, 2), (14, 2), (16, 1)],
  term ((-513 : Rat) / 31) [(13, 2), (14, 4), (16, 1)],
  term ((33830 : Rat) / 1767) [(13, 2), (15, 2), (16, 1)],
  term ((8941 : Rat) / 1767) [(13, 2), (15, 4), (16, 1)],
  term ((1140 : Rat) / 31) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-67660 : Rat) / 1767) [(13, 3), (15, 1), (16, 1)],
  term ((-11384 : Rat) / 1767) [(13, 3), (15, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(13, 4), (15, 2), (16, 1)],
  term ((36748 : Rat) / 589) [(14, 1), (15, 2), (16, 1)],
  term ((-390581 : Rat) / 3534) [(14, 1), (15, 4), (16, 1)],
  term ((-96285 : Rat) / 1178) [(14, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(14, 2), (15, 4), (16, 1)],
  term ((3700 : Rat) / 589) [(14, 2), (16, 1)],
  term ((-390581 : Rat) / 3534) [(14, 3), (15, 2), (16, 1)],
  term ((36748 : Rat) / 589) [(14, 3), (16, 1)],
  term ((117927 : Rat) / 2356) [(14, 4), (15, 2), (16, 1)],
  term ((-17270 : Rat) / 589) [(14, 4), (16, 1)],
  term ((3700 : Rat) / 589) [(15, 2), (16, 1)],
  term ((-61745 : Rat) / 1178) [(15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 500 through 510. -/
theorem rs_R009_ueqv_R009NNNNN_block_27_0500_0510_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_27_0500_0510
      rs_R009_ueqv_R009NNNNN_block_27_0500_0510 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
