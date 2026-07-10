/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 9:0-56

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0000 : Poly :=
[
  term ((-3840 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0000 : Poly :=
[
  term ((-7680 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (11, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((3840 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3840 : Rat) / 589) [(0, 1), (3, 3), (11, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0000
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0001 : Poly :=
[
  term ((-576 : Rat) / 589) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0001 : Poly :=
[
  term ((-1152 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 589) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((-576 : Rat) / 589) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((1152 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0001
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0002 : Poly :=
[
  term ((-1368 : Rat) / 31) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0002 : Poly :=
[
  term ((2736 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1368 : Rat) / 31) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((2736 : Rat) / 31) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0002
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0003 : Poly :=
[
  term ((-113740 : Rat) / 589) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0003 : Poly :=
[
  term ((227480 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0003
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0004 : Poly :=
[
  term ((-1706 : Rat) / 589) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0004 : Poly :=
[
  term ((3412 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0004
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0005 : Poly :=
[
  term ((920 : Rat) / 589) [(0, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0005 : Poly :=
[
  term ((-1840 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((920 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((920 : Rat) / 589) [(0, 1), (3, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(0, 1), (12, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(0, 1), (13, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(0, 2), (2, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0005
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0006 : Poly :=
[
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0006 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0006
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0007 : Poly :=
[
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0007 : Poly :=
[
  term ((-6144 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0007
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0008 : Poly :=
[
  term ((-1840 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0008 : Poly :=
[
  term ((3680 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (3, 3), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0008
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0009 : Poly :=
[
  term ((-456 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0009 : Poly :=
[
  term ((912 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((912 : Rat) / 31) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0009
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0010 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0010 : Poly :=
[
  term ((227480 : Rat) / 1767) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0010
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0011 : Poly :=
[
  term ((920 : Rat) / 589) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0011 : Poly :=
[
  term ((-1840 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((920 : Rat) / 589) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((920 : Rat) / 589) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-920 : Rat) / 589) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0011
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0012 : Poly :=
[
  term ((342 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0012 : Poly :=
[
  term ((-684 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0012
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0013 : Poly :=
[
  term ((28435 : Rat) / 589) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0013 : Poly :=
[
  term ((-56870 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 589) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((28435 : Rat) / 589) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 589) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 589) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 589) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0013
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0014 : Poly :=
[
  term ((3072 : Rat) / 589) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0014 : Poly :=
[
  term ((6144 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (11, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(2, 1), (3, 3), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(2, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0014
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0015 : Poly :=
[
  term ((-192 : Rat) / 31) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0015 : Poly :=
[
  term ((-384 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((384 : Rat) / 31) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((384 : Rat) / 31) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((192 : Rat) / 31) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((192 : Rat) / 31) [(2, 1), (3, 1), (13, 3), (16, 1)],
  term ((-192 : Rat) / 31) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-192 : Rat) / 31) [(2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0015
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0016 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0016 : Poly :=
[
  term ((912 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0016
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0017 : Poly :=
[
  term ((113740 : Rat) / 1767) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0017 : Poly :=
[
  term ((227480 : Rat) / 1767) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0017
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0018 : Poly :=
[
  term ((-98386 : Rat) / 1767) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0018 : Poly :=
[
  term ((-196772 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98386 : Rat) / 1767) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((98386 : Rat) / 1767) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((98386 : Rat) / 1767) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-98386 : Rat) / 1767) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0018
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0019 : Poly :=
[
  term ((-456 : Rat) / 31) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0019 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (3, 2), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (12, 2), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (13, 4), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0019
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0020 : Poly :=
[
  term ((920 : Rat) / 589) [(2, 1), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0020 : Poly :=
[
  term ((1840 : Rat) / 589) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((920 : Rat) / 589) [(2, 1), (3, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(2, 1), (12, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(2, 1), (13, 2), (16, 1)],
  term ((920 : Rat) / 589) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0020
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0021 : Poly :=
[
  term ((84 : Rat) / 31) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0021 : Poly :=
[
  term ((-168 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((168 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((168 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-168 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((84 : Rat) / 31) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0021
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0022 : Poly :=
[
  term ((-3072 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0022 : Poly :=
[
  term ((6144 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0022
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0023 : Poly :=
[
  term ((4608 : Rat) / 589) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0023 : Poly :=
[
  term ((-9216 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((9216 : Rat) / 589) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((9216 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9216 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4608 : Rat) / 589) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4608 : Rat) / 589) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((4608 : Rat) / 589) [(3, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0023
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0024 : Poly :=
[
  term ((-7128 : Rat) / 589) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0024 : Poly :=
[
  term ((14256 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14256 : Rat) / 589) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14256 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((14256 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7128 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((7128 : Rat) / 589) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((7128 : Rat) / 589) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-7128 : Rat) / 589) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0024
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0025 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0025 : Poly :=
[
  term ((227480 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0025
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0026 : Poly :=
[
  term ((1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0026 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((1536 : Rat) / 589) [(3, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0026
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0027 : Poly :=
[
  term ((-4224 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0027 : Poly :=
[
  term ((8448 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-8448 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8448 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((8448 : Rat) / 589) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-4224 : Rat) / 589) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((4224 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((4224 : Rat) / 589) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4224 : Rat) / 589) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0027
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0028 : Poly :=
[
  term ((-2520 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0028 : Poly :=
[
  term ((5040 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5040 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5040 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((5040 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2520 : Rat) / 589) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((2520 : Rat) / 589) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((2520 : Rat) / 589) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((-2520 : Rat) / 589) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0028
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0029 : Poly :=
[
  term ((-129094 : Rat) / 1767) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0029 : Poly :=
[
  term ((258188 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-258188 : Rat) / 1767) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-258188 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((258188 : Rat) / 1767) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-129094 : Rat) / 1767) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((129094 : Rat) / 1767) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((129094 : Rat) / 1767) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-129094 : Rat) / 1767) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0029
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0030 : Poly :=
[
  term ((4658 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0030 : Poly :=
[
  term ((-9316 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((9316 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((9316 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-9316 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-4658 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4658 : Rat) / 589) [(3, 1), (13, 3), (16, 1)],
  term ((4658 : Rat) / 589) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0030
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0031 : Poly :=
[
  term ((23159 : Rat) / 589) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0031 : Poly :=
[
  term ((-46318 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((46318 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((46318 : Rat) / 589) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46318 : Rat) / 589) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((23159 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-23159 : Rat) / 589) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23159 : Rat) / 589) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((23159 : Rat) / 589) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0031
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0032 : Poly :=
[
  term ((-3072 : Rat) / 589) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0032 : Poly :=
[
  term ((6144 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 2), (3, 2), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0032
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0033 : Poly :=
[
  term ((-5568 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0033 : Poly :=
[
  term ((11136 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-11136 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((-11136 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((11136 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-5568 : Rat) / 589) [(2, 2), (3, 2), (12, 1), (16, 1)],
  term ((5568 : Rat) / 589) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((5568 : Rat) / 589) [(3, 2), (12, 3), (16, 1)],
  term ((-5568 : Rat) / 589) [(3, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0033
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0034 : Poly :=
[
  term ((4144 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0034 : Poly :=
[
  term ((-8288 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((8288 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((8288 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-8288 : Rat) / 589) [(1, 1), (3, 3), (16, 1)],
  term ((4144 : Rat) / 589) [(2, 2), (3, 2), (16, 1)],
  term ((-4144 : Rat) / 589) [(3, 2), (12, 2), (16, 1)],
  term ((-4144 : Rat) / 589) [(3, 2), (13, 2), (16, 1)],
  term ((4144 : Rat) / 589) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0034
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0035 : Poly :=
[
  term ((-2608 : Rat) / 589) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0035 : Poly :=
[
  term ((5216 : Rat) / 589) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((5216 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2608 : Rat) / 589) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2608 : Rat) / 589) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((2608 : Rat) / 589) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((2608 : Rat) / 589) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0035
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0036 : Poly :=
[
  term ((4198 : Rat) / 589) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0036 : Poly :=
[
  term ((-8396 : Rat) / 589) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((8396 : Rat) / 589) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8396 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((8396 : Rat) / 589) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((4198 : Rat) / 589) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((4198 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4198 : Rat) / 589) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4198 : Rat) / 589) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0036
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0037 : Poly :=
[
  term ((-228 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0037 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0037
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0038 : Poly :=
[
  term ((-36398 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0038 : Poly :=
[
  term ((72796 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72796 : Rat) / 1767) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((72796 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72796 : Rat) / 1767) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0038
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0039 : Poly :=
[
  term ((-114 : Rat) / 31) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0039 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0039
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0040 : Poly :=
[
  term ((-28435 : Rat) / 1767) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0040 : Poly :=
[
  term ((56870 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0040
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0041 : Poly :=
[
  term ((1368 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0041 : Poly :=
[
  term ((-2736 : Rat) / 31) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2736 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2736 : Rat) / 31) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1368 : Rat) / 31) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0041
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0042 : Poly :=
[
  term ((113740 : Rat) / 589) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0042 : Poly :=
[
  term ((-227480 : Rat) / 589) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0042
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0043 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0043 : Poly :=
[
  term ((73600 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0043
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0044 : Poly :=
[
  term ((18400 : Rat) / 1767) [(10, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0044 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0044
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0045 : Poly :=
[
  term ((18400 : Rat) / 1767) [(10, 2), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0045 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (10, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (10, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0045
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0046 : Poly :=
[
  term ((-570 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0046 : Poly :=
[
  term ((1140 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-570 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0046
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0047 : Poly :=
[
  term ((-47085 : Rat) / 589) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0047 : Poly :=
[
  term ((94170 : Rat) / 589) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-94170 : Rat) / 589) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((94170 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-94170 : Rat) / 589) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47085 : Rat) / 589) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-47085 : Rat) / 589) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((47085 : Rat) / 589) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((47085 : Rat) / 589) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0047
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0048 : Poly :=
[
  term ((6288 : Rat) / 589) [(11, 2), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0048 : Poly :=
[
  term ((-12576 : Rat) / 589) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((12576 : Rat) / 589) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-12576 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((12576 : Rat) / 589) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((6288 : Rat) / 589) [(2, 2), (11, 2), (16, 1)],
  term ((6288 : Rat) / 589) [(3, 2), (11, 2), (16, 1)],
  term ((-6288 : Rat) / 589) [(11, 2), (12, 2), (16, 1)],
  term ((-6288 : Rat) / 589) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0048
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0049 : Poly :=
[
  term ((113740 : Rat) / 1767) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0049 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0049
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0050 : Poly :=
[
  term ((456 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0050 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 1), (13, 4), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0050
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0051 : Poly :=
[
  term ((34040 : Rat) / 1767) [(12, 1), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0051 : Poly :=
[
  term ((-68080 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((68080 : Rat) / 1767) [(0, 1), (12, 2), (16, 1)],
  term ((-68080 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((68080 : Rat) / 1767) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((34040 : Rat) / 1767) [(2, 2), (12, 1), (16, 1)],
  term ((34040 : Rat) / 1767) [(3, 2), (12, 1), (16, 1)],
  term ((-34040 : Rat) / 1767) [(12, 1), (13, 2), (16, 1)],
  term ((-34040 : Rat) / 1767) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0051
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0052 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(12, 2), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0052 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (12, 3), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(3, 2), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(12, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0052
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0053 : Poly :=
[
  term ((29239 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0053 : Poly :=
[
  term ((-58478 : Rat) / 1767) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((58478 : Rat) / 1767) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58478 : Rat) / 1767) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((58478 : Rat) / 1767) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((29239 : Rat) / 1767) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((29239 : Rat) / 1767) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29239 : Rat) / 1767) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29239 : Rat) / 1767) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0053
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0054 : Poly :=
[
  term ((-11902 : Rat) / 1767) [(13, 2), (16, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0054 : Poly :=
[
  term ((23804 : Rat) / 1767) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-23804 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((23804 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-23804 : Rat) / 1767) [(1, 1), (13, 3), (16, 1)],
  term ((-11902 : Rat) / 1767) [(2, 2), (13, 2), (16, 1)],
  term ((-11902 : Rat) / 1767) [(3, 2), (13, 2), (16, 1)],
  term ((11902 : Rat) / 1767) [(12, 2), (13, 2), (16, 1)],
  term ((11902 : Rat) / 1767) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0054
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0055 : Poly :=
[
  term ((-3278 : Rat) / 589) [(15, 2), (16, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0055 : Poly :=
[
  term ((6556 : Rat) / 589) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-6556 : Rat) / 589) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((6556 : Rat) / 589) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-6556 : Rat) / 589) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3278 : Rat) / 589) [(2, 2), (15, 2), (16, 1)],
  term ((-3278 : Rat) / 589) [(3, 2), (15, 2), (16, 1)],
  term ((3278 : Rat) / 589) [(12, 2), (15, 2), (16, 1)],
  term ((3278 : Rat) / 589) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0055
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNN_coefficient_09_0056 : Poly :=
[
  term ((-18286 : Rat) / 1767) [(16, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R009_ueqv_R009NNNNN_partial_09_0056 : Poly :=
[
  term ((36572 : Rat) / 1767) [(0, 1), (2, 1), (16, 1)],
  term ((-36572 : Rat) / 1767) [(0, 1), (12, 1), (16, 1)],
  term ((36572 : Rat) / 1767) [(1, 1), (3, 1), (16, 1)],
  term ((-36572 : Rat) / 1767) [(1, 1), (13, 1), (16, 1)],
  term ((-18286 : Rat) / 1767) [(2, 2), (16, 1)],
  term ((-18286 : Rat) / 1767) [(3, 2), (16, 1)],
  term ((18286 : Rat) / 1767) [(12, 2), (16, 1)],
  term ((18286 : Rat) / 1767) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNN_partial_09_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_09_0056
        rs_R009_ueqv_R009NNNNN_generator_09_0000_0056 =
      rs_R009_ueqv_R009NNNNN_partial_09_0056 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_09_0000_0056 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_09_0000,
  rs_R009_ueqv_R009NNNNN_partial_09_0001,
  rs_R009_ueqv_R009NNNNN_partial_09_0002,
  rs_R009_ueqv_R009NNNNN_partial_09_0003,
  rs_R009_ueqv_R009NNNNN_partial_09_0004,
  rs_R009_ueqv_R009NNNNN_partial_09_0005,
  rs_R009_ueqv_R009NNNNN_partial_09_0006,
  rs_R009_ueqv_R009NNNNN_partial_09_0007,
  rs_R009_ueqv_R009NNNNN_partial_09_0008,
  rs_R009_ueqv_R009NNNNN_partial_09_0009,
  rs_R009_ueqv_R009NNNNN_partial_09_0010,
  rs_R009_ueqv_R009NNNNN_partial_09_0011,
  rs_R009_ueqv_R009NNNNN_partial_09_0012,
  rs_R009_ueqv_R009NNNNN_partial_09_0013,
  rs_R009_ueqv_R009NNNNN_partial_09_0014,
  rs_R009_ueqv_R009NNNNN_partial_09_0015,
  rs_R009_ueqv_R009NNNNN_partial_09_0016,
  rs_R009_ueqv_R009NNNNN_partial_09_0017,
  rs_R009_ueqv_R009NNNNN_partial_09_0018,
  rs_R009_ueqv_R009NNNNN_partial_09_0019,
  rs_R009_ueqv_R009NNNNN_partial_09_0020,
  rs_R009_ueqv_R009NNNNN_partial_09_0021,
  rs_R009_ueqv_R009NNNNN_partial_09_0022,
  rs_R009_ueqv_R009NNNNN_partial_09_0023,
  rs_R009_ueqv_R009NNNNN_partial_09_0024,
  rs_R009_ueqv_R009NNNNN_partial_09_0025,
  rs_R009_ueqv_R009NNNNN_partial_09_0026,
  rs_R009_ueqv_R009NNNNN_partial_09_0027,
  rs_R009_ueqv_R009NNNNN_partial_09_0028,
  rs_R009_ueqv_R009NNNNN_partial_09_0029,
  rs_R009_ueqv_R009NNNNN_partial_09_0030,
  rs_R009_ueqv_R009NNNNN_partial_09_0031,
  rs_R009_ueqv_R009NNNNN_partial_09_0032,
  rs_R009_ueqv_R009NNNNN_partial_09_0033,
  rs_R009_ueqv_R009NNNNN_partial_09_0034,
  rs_R009_ueqv_R009NNNNN_partial_09_0035,
  rs_R009_ueqv_R009NNNNN_partial_09_0036,
  rs_R009_ueqv_R009NNNNN_partial_09_0037,
  rs_R009_ueqv_R009NNNNN_partial_09_0038,
  rs_R009_ueqv_R009NNNNN_partial_09_0039,
  rs_R009_ueqv_R009NNNNN_partial_09_0040,
  rs_R009_ueqv_R009NNNNN_partial_09_0041,
  rs_R009_ueqv_R009NNNNN_partial_09_0042,
  rs_R009_ueqv_R009NNNNN_partial_09_0043,
  rs_R009_ueqv_R009NNNNN_partial_09_0044,
  rs_R009_ueqv_R009NNNNN_partial_09_0045,
  rs_R009_ueqv_R009NNNNN_partial_09_0046,
  rs_R009_ueqv_R009NNNNN_partial_09_0047,
  rs_R009_ueqv_R009NNNNN_partial_09_0048,
  rs_R009_ueqv_R009NNNNN_partial_09_0049,
  rs_R009_ueqv_R009NNNNN_partial_09_0050,
  rs_R009_ueqv_R009NNNNN_partial_09_0051,
  rs_R009_ueqv_R009NNNNN_partial_09_0052,
  rs_R009_ueqv_R009NNNNN_partial_09_0053,
  rs_R009_ueqv_R009NNNNN_partial_09_0054,
  rs_R009_ueqv_R009NNNNN_partial_09_0055,
  rs_R009_ueqv_R009NNNNN_partial_09_0056
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_09_0000_0056 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((44304 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((1152 : Rat) / 589) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((684 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((56870 : Rat) / 589) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-168 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-9216 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((14256 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((8448 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-2256 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((258188 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9316 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-46318 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (10, 1), (16, 1)],
  term ((11136 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-8288 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((5216 : Rat) / 589) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-8396 : Rat) / 589) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((72796 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((94170 : Rat) / 589) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12576 : Rat) / 589) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-424252 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-62560 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-58478 : Rat) / 1767) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((23804 : Rat) / 1767) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((6556 : Rat) / 589) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((36572 : Rat) / 1767) [(0, 1), (2, 1), (16, 1)],
  term ((-9984 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (11, 1), (16, 1)],
  term ((6720 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-568700 : Rat) / 1767) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((191654 : Rat) / 1767) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((168 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((9216 : Rat) / 589) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14256 : Rat) / 589) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8448 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((3840 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((9316 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((46318 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 19) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-258188 : Rat) / 1767) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((8288 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-11136 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((-1706 : Rat) / 589) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((920 : Rat) / 589) [(0, 1), (3, 2), (16, 1)],
  term ((-3840 : Rat) / 589) [(0, 1), (3, 3), (11, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((8396 : Rat) / 589) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-72796 : Rat) / 1767) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2736 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-94170 : Rat) / 589) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((12576 : Rat) / 589) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((58478 : Rat) / 1767) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23804 : Rat) / 1767) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6556 : Rat) / 589) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36572 : Rat) / 1767) [(0, 1), (12, 1), (16, 1)],
  term ((12242 : Rat) / 93) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((65320 : Rat) / 1767) [(0, 1), (12, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (12, 3), (16, 1)],
  term ((-920 : Rat) / 589) [(0, 1), (13, 2), (16, 1)],
  term ((1706 : Rat) / 589) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((1152 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2736 : Rat) / 31) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 589) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(0, 2), (2, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 31) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 2), (12, 1), (16, 1)],
  term ((-11184 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((528 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((384 : Rat) / 31) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((920 : Rat) / 589) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((28435 : Rat) / 589) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((5216 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((168 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-8396 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((2520 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((72796 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-42768 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12720 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((13212 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((94170 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12576 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-485668 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25440 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-68080 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((42320 : Rat) / 1767) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((2596 : Rat) / 57) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((57272 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((6556 : Rat) / 589) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((36572 : Rat) / 1767) [(1, 1), (3, 1), (16, 1)],
  term ((-168 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-9216 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-552 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((9368 : Rat) / 589) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((402 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((343493 : Rat) / 1767) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1028 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-46318 : Rat) / 589) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((14208 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-10128 : Rat) / 589) [(1, 1), (3, 3), (16, 1)],
  term ((-5216 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((8396 : Rat) / 589) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72796 : Rat) / 1767) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((227480 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2736 : Rat) / 31) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-920 : Rat) / 589) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-94170 : Rat) / 589) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22580 : Rat) / 589) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((12576 : Rat) / 589) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((68080 : Rat) / 1767) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((142175 : Rat) / 1767) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-28435 : Rat) / 589) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-6556 : Rat) / 589) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36572 : Rat) / 1767) [(1, 1), (13, 1), (16, 1)],
  term ((58478 : Rat) / 1767) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23804 : Rat) / 1767) [(1, 1), (13, 3), (16, 1)],
  term ((14256 : Rat) / 589) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-6852 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 589) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((192 : Rat) / 31) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((192 : Rat) / 31) [(2, 1), (3, 1), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-98386 : Rat) / 1767) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (3, 2), (13, 2), (16, 1)],
  term ((920 : Rat) / 589) [(2, 1), (3, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(2, 1), (3, 3), (11, 1), (16, 1)],
  term ((-192 : Rat) / 31) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((98386 : Rat) / 1767) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (12, 2), (13, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(2, 1), (12, 2), (16, 1)],
  term ((-920 : Rat) / 589) [(2, 1), (13, 2), (16, 1)],
  term ((98386 : Rat) / 1767) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (13, 4), (16, 1)],
  term ((84 : Rat) / 31) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-7128 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4224 : Rat) / 589) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-2520 : Rat) / 589) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-129094 : Rat) / 1767) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((23159 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(2, 2), (3, 2), (10, 1), (16, 1)],
  term ((-5568 : Rat) / 589) [(2, 2), (3, 2), (12, 1), (16, 1)],
  term ((4144 : Rat) / 589) [(2, 2), (3, 2), (16, 1)],
  term ((-2608 : Rat) / 589) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((4198 : Rat) / 589) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (10, 2), (16, 1)],
  term ((-570 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-47085 : Rat) / 589) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((6288 : Rat) / 589) [(2, 2), (11, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((34040 : Rat) / 1767) [(2, 2), (12, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (12, 2), (16, 1)],
  term ((29239 : Rat) / 1767) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11902 : Rat) / 1767) [(2, 2), (13, 2), (16, 1)],
  term ((-3278 : Rat) / 589) [(2, 2), (15, 2), (16, 1)],
  term ((-18286 : Rat) / 1767) [(2, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(2, 3), (3, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 31) [(2, 3), (3, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-98386 : Rat) / 1767) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 3), (13, 2), (16, 1)],
  term ((920 : Rat) / 589) [(2, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((-4608 : Rat) / 589) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4608 : Rat) / 589) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((7128 : Rat) / 589) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7128 : Rat) / 589) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((4224 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((4224 : Rat) / 589) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((129094 : Rat) / 1767) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2520 : Rat) / 589) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4658 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-23159 : Rat) / 589) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((2520 : Rat) / 589) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((129094 : Rat) / 1767) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-23159 : Rat) / 589) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4658 : Rat) / 589) [(3, 1), (13, 3), (16, 1)],
  term ((-2608 : Rat) / 589) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((4198 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (10, 2), (16, 1)],
  term ((-570 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-47085 : Rat) / 589) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((6288 : Rat) / 589) [(3, 2), (11, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14232 : Rat) / 589) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((34040 : Rat) / 1767) [(3, 2), (12, 1), (16, 1)],
  term ((-30832 : Rat) / 1767) [(3, 2), (12, 2), (16, 1)],
  term ((5568 : Rat) / 589) [(3, 2), (12, 3), (16, 1)],
  term ((29239 : Rat) / 1767) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24334 : Rat) / 1767) [(3, 2), (13, 2), (16, 1)],
  term ((-3278 : Rat) / 589) [(3, 2), (15, 2), (16, 1)],
  term ((-18286 : Rat) / 1767) [(3, 2), (16, 1)],
  term ((84 : Rat) / 31) [(3, 3), (5, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(3, 3), (10, 1), (11, 1), (16, 1)],
  term ((-7128 : Rat) / 589) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(3, 3), (11, 1), (12, 1), (16, 1)],
  term ((-4224 : Rat) / 589) [(3, 3), (11, 1), (16, 1)],
  term ((-2520 : Rat) / 589) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((-129094 : Rat) / 1767) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(3, 3), (13, 1), (16, 1)],
  term ((23159 : Rat) / 589) [(3, 3), (15, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 4), (10, 1), (16, 1)],
  term ((-5568 : Rat) / 589) [(3, 4), (12, 1), (16, 1)],
  term ((4144 : Rat) / 589) [(3, 4), (16, 1)],
  term ((2608 : Rat) / 589) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((2608 : Rat) / 589) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4198 : Rat) / 589) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4198 : Rat) / 589) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((114 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(7, 1), (13, 3), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (12, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (13, 2), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((47085 : Rat) / 589) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((47085 : Rat) / 589) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (13, 3), (16, 1)],
  term ((-6288 : Rat) / 589) [(11, 2), (12, 2), (16, 1)],
  term ((-6288 : Rat) / 589) [(11, 2), (13, 2), (16, 1)],
  term ((-34040 : Rat) / 1767) [(12, 1), (13, 2), (16, 1)],
  term ((-113740 : Rat) / 1767) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 1), (13, 4), (16, 1)],
  term ((-29239 : Rat) / 1767) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((30302 : Rat) / 1767) [(12, 2), (13, 2), (16, 1)],
  term ((3278 : Rat) / 589) [(12, 2), (15, 2), (16, 1)],
  term ((18286 : Rat) / 1767) [(12, 2), (16, 1)],
  term ((-113740 : Rat) / 1767) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 3), (13, 2), (16, 1)],
  term ((-34040 : Rat) / 1767) [(12, 3), (16, 1)],
  term ((18400 : Rat) / 1767) [(12, 4), (16, 1)],
  term ((3278 : Rat) / 589) [(13, 2), (15, 2), (16, 1)],
  term ((18286 : Rat) / 1767) [(13, 2), (16, 1)],
  term ((-29239 : Rat) / 1767) [(13, 3), (15, 1), (16, 1)],
  term ((11902 : Rat) / 1767) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 56. -/
theorem rs_R009_ueqv_R009NNNNN_block_09_0000_0056_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_09_0000_0056
      rs_R009_ueqv_R009NNNNN_block_09_0000_0056 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
