/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 17:0-63

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0000 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0000 : Poly :=
[
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0000
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0001 : Poly :=
[
  term ((-456 : Rat) / 31) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0001 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0001
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0002 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0002 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0002
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0003 : Poly :=
[
  term ((2496 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0003 : Poly :=
[
  term ((4992 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2496 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((4992 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2496 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0003
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0004 : Poly :=
[
  term ((1840 : Rat) / 589) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0004 : Poly :=
[
  term ((3680 : Rat) / 589) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0004
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0005 : Poly :=
[
  term ((-2608 : Rat) / 589) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0005 : Poly :=
[
  term ((-5216 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((2608 : Rat) / 589) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((2608 : Rat) / 589) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0005
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0006 : Poly :=
[
  term ((342 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0006 : Poly :=
[
  term ((684 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0006
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0007 : Poly :=
[
  term ((26729 : Rat) / 589) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0007 : Poly :=
[
  term ((53458 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26729 : Rat) / 589) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((53458 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26729 : Rat) / 589) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0007
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0008 : Poly :=
[
  term ((-1840 : Rat) / 589) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0008 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0008
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0009 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0009 : Poly :=
[
  term ((-7360 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0009
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0010 : Poly :=
[
  term ((-2688 : Rat) / 589) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0010 : Poly :=
[
  term ((-5376 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(2, 1), (3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((2688 : Rat) / 589) [(2, 1), (3, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0010
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0011 : Poly :=
[
  term ((384 : Rat) / 31) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0011 : Poly :=
[
  term ((768 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(2, 1), (3, 1), (4, 2), (13, 1), (16, 1)],
  term ((768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0011
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0012 : Poly :=
[
  term ((-960 : Rat) / 589) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0012 : Poly :=
[
  term ((-1920 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 589) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 589) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0012
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0013 : Poly :=
[
  term ((-342 : Rat) / 31) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0013 : Poly :=
[
  term ((-684 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(2, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0013
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0014 : Poly :=
[
  term ((-1317 : Rat) / 31) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0014 : Poly :=
[
  term ((-2634 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1317 : Rat) / 31) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2634 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1317 : Rat) / 31) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0014
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0015 : Poly :=
[
  term ((190274 : Rat) / 1767) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0015 : Poly :=
[
  term ((380548 : Rat) / 1767) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-190274 : Rat) / 1767) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((380548 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-190274 : Rat) / 1767) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0015
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0016 : Poly :=
[
  term ((912 : Rat) / 31) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0016 : Poly :=
[
  term ((1824 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (4, 2), (13, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0016
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0017 : Poly :=
[
  term ((-23317 : Rat) / 1767) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0017 : Poly :=
[
  term ((-46634 : Rat) / 1767) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((23317 : Rat) / 1767) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-46634 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((23317 : Rat) / 1767) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0017
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0018 : Poly :=
[
  term ((6912 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0018 : Poly :=
[
  term ((13824 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0018
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0019 : Poly :=
[
  term ((-4416 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0019 : Poly :=
[
  term ((-8832 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (12, 1), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 1), (5, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0019
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0020 : Poly :=
[
  term ((2972 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0020 : Poly :=
[
  term ((5944 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-2972 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((5944 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-2972 : Rat) / 589) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0020
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0021 : Poly :=
[
  term ((-768 : Rat) / 589) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0021 : Poly :=
[
  term ((-1536 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0021
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0022 : Poly :=
[
  term ((-864 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0022 : Poly :=
[
  term ((-1728 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((864 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((864 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0022
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0023 : Poly :=
[
  term ((5778 : Rat) / 589) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0023 : Poly :=
[
  term ((11556 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((-5778 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((11556 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-5778 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0023
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0024 : Poly :=
[
  term ((-3840 : Rat) / 589) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0024 : Poly :=
[
  term ((-7680 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0024
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0025 : Poly :=
[
  term ((-768 : Rat) / 589) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0025 : Poly :=
[
  term ((-1536 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0025
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0026 : Poly :=
[
  term ((-3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0026 : Poly :=
[
  term ((-7680 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0026
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0027 : Poly :=
[
  term ((1344 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0027 : Poly :=
[
  term ((2688 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0027
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0028 : Poly :=
[
  term ((20400 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0028 : Poly :=
[
  term ((40800 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20400 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((40800 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20400 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0028
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0029 : Poly :=
[
  term ((189260 : Rat) / 1767) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0029 : Poly :=
[
  term ((378520 : Rat) / 1767) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-189260 : Rat) / 1767) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((378520 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-189260 : Rat) / 1767) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0029
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0030 : Poly :=
[
  term ((-17530 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0030 : Poly :=
[
  term ((-35060 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((17530 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-35060 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((17530 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0030
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0031 : Poly :=
[
  term ((-185200 : Rat) / 1767) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0031 : Poly :=
[
  term ((-370400 : Rat) / 1767) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((185200 : Rat) / 1767) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-370400 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((185200 : Rat) / 1767) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0031
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0032 : Poly :=
[
  term ((-1344 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 32 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0032 : Poly :=
[
  term ((-2688 : Rat) / 589) [(3, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (4, 2), (12, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0032
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0033 : Poly :=
[
  term ((-7824 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 33 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0033 : Poly :=
[
  term ((-15648 : Rat) / 589) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((7824 : Rat) / 589) [(3, 2), (4, 2), (16, 1)],
  term ((-15648 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((7824 : Rat) / 589) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0033
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0034 : Poly :=
[
  term ((912 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0034 : Poly :=
[
  term ((1824 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0034
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0035 : Poly :=
[
  term ((207008 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0035 : Poly :=
[
  term ((414016 : Rat) / 1767) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((414016 : Rat) / 1767) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0035
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0036 : Poly :=
[
  term ((304 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0036 : Poly :=
[
  term ((608 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((608 : Rat) / 31) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0036
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0037 : Poly :=
[
  term ((342 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0037 : Poly :=
[
  term ((684 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0037
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0038 : Poly :=
[
  term ((19905 : Rat) / 589) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0038 : Poly :=
[
  term ((39810 : Rat) / 589) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19905 : Rat) / 589) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((39810 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19905 : Rat) / 589) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0038
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0039 : Poly :=
[
  term ((-228 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0039 : Poly :=
[
  term ((-456 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0039
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0040 : Poly :=
[
  term ((-101438 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0040 : Poly :=
[
  term ((-202876 : Rat) / 1767) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((101438 : Rat) / 1767) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-202876 : Rat) / 1767) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((101438 : Rat) / 1767) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0040
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0041 : Poly :=
[
  term ((-304 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 41 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0041 : Poly :=
[
  term ((-608 : Rat) / 31) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((304 : Rat) / 31) [(4, 2), (5, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(5, 3), (7, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0041
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0042 : Poly :=
[
  term ((-228 : Rat) / 31) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0042 : Poly :=
[
  term ((-456 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0042
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0043 : Poly :=
[
  term ((-56870 : Rat) / 1767) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0043 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0043
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0044 : Poly :=
[
  term ((-2632 : Rat) / 589) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0044 : Poly :=
[
  term ((-5264 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0044
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0045 : Poly :=
[
  term ((-1026 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0045 : Poly :=
[
  term ((-2052 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0045
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0046 : Poly :=
[
  term ((-69951 : Rat) / 589) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0046 : Poly :=
[
  term ((-139902 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((69951 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-139902 : Rat) / 589) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((69951 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0046
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0047 : Poly :=
[
  term ((627 : Rat) / 62) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0047 : Poly :=
[
  term ((627 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-627 : Rat) / 62) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((627 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-627 : Rat) / 62) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0047
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0048 : Poly :=
[
  term ((427841 : Rat) / 7068) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0048 : Poly :=
[
  term ((427841 : Rat) / 3534) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-427841 : Rat) / 7068) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((427841 : Rat) / 3534) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-427841 : Rat) / 7068) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0048
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0049 : Poly :=
[
  term ((2492 : Rat) / 589) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0049 : Poly :=
[
  term ((4984 : Rat) / 589) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2492 : Rat) / 589) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4984 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2492 : Rat) / 589) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0049
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0050 : Poly :=
[
  term ((-56870 : Rat) / 1767) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0050 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((56870 : Rat) / 1767) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-113740 : Rat) / 1767) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((56870 : Rat) / 1767) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0050
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0051 : Poly :=
[
  term ((-1048 : Rat) / 589) [(10, 1), (16, 1)]
]

/-- Partial product 51 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0051 : Poly :=
[
  term ((-2096 : Rat) / 589) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(4, 2), (10, 1), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0051
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0052 : Poly :=
[
  term ((6824 : Rat) / 589) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0052 : Poly :=
[
  term ((13648 : Rat) / 589) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0052
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0053 : Poly :=
[
  term ((-570 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0053 : Poly :=
[
  term ((-1140 : Rat) / 31) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0053
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0054 : Poly :=
[
  term ((-120193 : Rat) / 1767) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0054 : Poly :=
[
  term ((-240386 : Rat) / 1767) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((120193 : Rat) / 1767) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240386 : Rat) / 1767) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((120193 : Rat) / 1767) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0054
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0055 : Poly :=
[
  term ((-5264 : Rat) / 589) [(11, 2), (16, 1)]
]

/-- Partial product 55 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0055 : Poly :=
[
  term ((-10528 : Rat) / 589) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 2), (11, 2), (16, 1)],
  term ((-10528 : Rat) / 589) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0055
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0056 : Poly :=
[
  term ((37376 : Rat) / 1767) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0056 : Poly :=
[
  term ((74752 : Rat) / 1767) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37376 : Rat) / 1767) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((74752 : Rat) / 1767) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37376 : Rat) / 1767) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0056
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0057 : Poly :=
[
  term ((228 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 57 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0057 : Poly :=
[
  term ((456 : Rat) / 31) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0057
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0058 : Poly :=
[
  term ((-18199 : Rat) / 589) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 58 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0058 : Poly :=
[
  term ((-36398 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((18199 : Rat) / 589) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-36398 : Rat) / 589) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((18199 : Rat) / 589) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0058
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0059 : Poly :=
[
  term ((396 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 59 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0059 : Poly :=
[
  term ((792 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-396 : Rat) / 589) [(4, 2), (12, 1), (16, 1)],
  term ((792 : Rat) / 589) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-396 : Rat) / 589) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0059
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0060 : Poly :=
[
  term ((-52673 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0060 : Poly :=
[
  term ((-105346 : Rat) / 1767) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((52673 : Rat) / 1767) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105346 : Rat) / 1767) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((52673 : Rat) / 1767) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0060
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0061 : Poly :=
[
  term ((-399 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 61 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0061 : Poly :=
[
  term ((-798 : Rat) / 31) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((399 : Rat) / 31) [(4, 2), (13, 2), (16, 1)],
  term ((-798 : Rat) / 31) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((399 : Rat) / 31) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0061
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0062 : Poly :=
[
  term ((779297 : Rat) / 7068) [(15, 2), (16, 1)]
]

/-- Partial product 62 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0062 : Poly :=
[
  term ((779297 : Rat) / 3534) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-779297 : Rat) / 7068) [(4, 2), (15, 2), (16, 1)],
  term ((779297 : Rat) / 3534) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-779297 : Rat) / 7068) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0062
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNN_coefficient_17_0063 : Poly :=
[
  term ((326 : Rat) / 589) [(16, 1)]
]

/-- Partial product 63 for generator 17. -/
def rs_R009_ueqv_R009NNNNN_partial_17_0063 : Poly :=
[
  term ((652 : Rat) / 589) [(4, 1), (6, 1), (16, 1)],
  term ((-326 : Rat) / 589) [(4, 2), (16, 1)],
  term ((652 : Rat) / 589) [(5, 1), (7, 1), (16, 1)],
  term ((-326 : Rat) / 589) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNN_partial_17_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_17_0063
        rs_R009_ueqv_R009NNNNN_generator_17_0000_0063 =
      rs_R009_ueqv_R009NNNNN_partial_17_0063 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_17_0000_0063 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_17_0000,
  rs_R009_ueqv_R009NNNNN_partial_17_0001,
  rs_R009_ueqv_R009NNNNN_partial_17_0002,
  rs_R009_ueqv_R009NNNNN_partial_17_0003,
  rs_R009_ueqv_R009NNNNN_partial_17_0004,
  rs_R009_ueqv_R009NNNNN_partial_17_0005,
  rs_R009_ueqv_R009NNNNN_partial_17_0006,
  rs_R009_ueqv_R009NNNNN_partial_17_0007,
  rs_R009_ueqv_R009NNNNN_partial_17_0008,
  rs_R009_ueqv_R009NNNNN_partial_17_0009,
  rs_R009_ueqv_R009NNNNN_partial_17_0010,
  rs_R009_ueqv_R009NNNNN_partial_17_0011,
  rs_R009_ueqv_R009NNNNN_partial_17_0012,
  rs_R009_ueqv_R009NNNNN_partial_17_0013,
  rs_R009_ueqv_R009NNNNN_partial_17_0014,
  rs_R009_ueqv_R009NNNNN_partial_17_0015,
  rs_R009_ueqv_R009NNNNN_partial_17_0016,
  rs_R009_ueqv_R009NNNNN_partial_17_0017,
  rs_R009_ueqv_R009NNNNN_partial_17_0018,
  rs_R009_ueqv_R009NNNNN_partial_17_0019,
  rs_R009_ueqv_R009NNNNN_partial_17_0020,
  rs_R009_ueqv_R009NNNNN_partial_17_0021,
  rs_R009_ueqv_R009NNNNN_partial_17_0022,
  rs_R009_ueqv_R009NNNNN_partial_17_0023,
  rs_R009_ueqv_R009NNNNN_partial_17_0024,
  rs_R009_ueqv_R009NNNNN_partial_17_0025,
  rs_R009_ueqv_R009NNNNN_partial_17_0026,
  rs_R009_ueqv_R009NNNNN_partial_17_0027,
  rs_R009_ueqv_R009NNNNN_partial_17_0028,
  rs_R009_ueqv_R009NNNNN_partial_17_0029,
  rs_R009_ueqv_R009NNNNN_partial_17_0030,
  rs_R009_ueqv_R009NNNNN_partial_17_0031,
  rs_R009_ueqv_R009NNNNN_partial_17_0032,
  rs_R009_ueqv_R009NNNNN_partial_17_0033,
  rs_R009_ueqv_R009NNNNN_partial_17_0034,
  rs_R009_ueqv_R009NNNNN_partial_17_0035,
  rs_R009_ueqv_R009NNNNN_partial_17_0036,
  rs_R009_ueqv_R009NNNNN_partial_17_0037,
  rs_R009_ueqv_R009NNNNN_partial_17_0038,
  rs_R009_ueqv_R009NNNNN_partial_17_0039,
  rs_R009_ueqv_R009NNNNN_partial_17_0040,
  rs_R009_ueqv_R009NNNNN_partial_17_0041,
  rs_R009_ueqv_R009NNNNN_partial_17_0042,
  rs_R009_ueqv_R009NNNNN_partial_17_0043,
  rs_R009_ueqv_R009NNNNN_partial_17_0044,
  rs_R009_ueqv_R009NNNNN_partial_17_0045,
  rs_R009_ueqv_R009NNNNN_partial_17_0046,
  rs_R009_ueqv_R009NNNNN_partial_17_0047,
  rs_R009_ueqv_R009NNNNN_partial_17_0048,
  rs_R009_ueqv_R009NNNNN_partial_17_0049,
  rs_R009_ueqv_R009NNNNN_partial_17_0050,
  rs_R009_ueqv_R009NNNNN_partial_17_0051,
  rs_R009_ueqv_R009NNNNN_partial_17_0052,
  rs_R009_ueqv_R009NNNNN_partial_17_0053,
  rs_R009_ueqv_R009NNNNN_partial_17_0054,
  rs_R009_ueqv_R009NNNNN_partial_17_0055,
  rs_R009_ueqv_R009NNNNN_partial_17_0056,
  rs_R009_ueqv_R009NNNNN_partial_17_0057,
  rs_R009_ueqv_R009NNNNN_partial_17_0058,
  rs_R009_ueqv_R009NNNNN_partial_17_0059,
  rs_R009_ueqv_R009NNNNN_partial_17_0060,
  rs_R009_ueqv_R009NNNNN_partial_17_0061,
  rs_R009_ueqv_R009NNNNN_partial_17_0062,
  rs_R009_ueqv_R009NNNNN_partial_17_0063
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_17_0000_0063 : Poly :=
[
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((4992 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2496 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((4992 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2496 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((53458 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((2608 : Rat) / 589) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-26729 : Rat) / 589) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-5216 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((53458 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((2608 : Rat) / 589) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-26729 : Rat) / 589) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 3), (16, 1)],
  term ((-5376 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((768 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(2, 1), (3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(2, 1), (3, 1), (4, 2), (13, 1), (16, 1)],
  term ((960 : Rat) / 589) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((2688 : Rat) / 589) [(2, 1), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((960 : Rat) / 589) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2634 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((380548 : Rat) / 1767) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-46634 : Rat) / 1767) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((342 : Rat) / 31) [(2, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((1317 : Rat) / 31) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-190274 : Rat) / 1767) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (4, 2), (13, 2), (16, 1)],
  term ((23317 : Rat) / 1767) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((380548 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-46634 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2634 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((1317 : Rat) / 31) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-190274 : Rat) / 1767) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((23317 : Rat) / 1767) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((5944 : Rat) / 589) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((11556 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((40800 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((378520 : Rat) / 1767) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35060 : Rat) / 589) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-370400 : Rat) / 1767) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (12, 1), (16, 1)],
  term ((-2972 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((-5778 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-20400 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-189260 : Rat) / 1767) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((17530 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((185200 : Rat) / 1767) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((40800 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((378520 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35060 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-370400 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((11556 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((768 : Rat) / 31) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-7968 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((166 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-20400 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-189260 : Rat) / 1767) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((17530 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((185200 : Rat) / 1767) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 3), (10, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((-2972 : Rat) / 589) [(3, 1), (5, 3), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-15648 : Rat) / 589) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (4, 2), (12, 1), (16, 1)],
  term ((7824 : Rat) / 589) [(3, 2), (4, 2), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-15648 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (5, 2), (12, 1), (16, 1)],
  term ((7824 : Rat) / 589) [(3, 2), (5, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((414016 : Rat) / 1767) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((39810 : Rat) / 589) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-202876 : Rat) / 1767) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-139902 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((627 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((427841 : Rat) / 3534) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((4984 : Rat) / 589) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2096 : Rat) / 589) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-240386 : Rat) / 1767) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((74752 : Rat) / 1767) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-36398 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((792 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-105346 : Rat) / 1767) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((779297 : Rat) / 3534) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 589) [(4, 1), (6, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-19905 : Rat) / 589) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((101438 : Rat) / 1767) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(4, 2), (5, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((69951 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-627 : Rat) / 62) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-427841 : Rat) / 7068) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2492 : Rat) / 589) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((1048 : Rat) / 589) [(4, 2), (10, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((120193 : Rat) / 1767) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 2), (11, 2), (16, 1)],
  term ((-37376 : Rat) / 1767) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((18199 : Rat) / 589) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-396 : Rat) / 589) [(4, 2), (12, 1), (16, 1)],
  term ((52673 : Rat) / 1767) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((399 : Rat) / 31) [(4, 2), (13, 2), (16, 1)],
  term ((-779297 : Rat) / 7068) [(4, 2), (15, 2), (16, 1)],
  term ((-326 : Rat) / 589) [(4, 2), (16, 1)],
  term ((4984 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-240386 : Rat) / 1767) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((74752 : Rat) / 1767) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-36398 : Rat) / 589) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((792 : Rat) / 589) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-105346 : Rat) / 1767) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((779297 : Rat) / 3534) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 589) [(5, 1), (7, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-139902 : Rat) / 589) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((627 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((427841 : Rat) / 3534) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((156962 : Rat) / 589) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((14184 : Rat) / 589) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((1710 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((109761 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1539 : Rat) / 62) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-413115 : Rat) / 2356) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2492 : Rat) / 589) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 2), (10, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((120193 : Rat) / 1767) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(5, 2), (11, 2), (16, 1)],
  term ((-37376 : Rat) / 1767) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((18199 : Rat) / 589) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-396 : Rat) / 589) [(5, 2), (12, 1), (16, 1)],
  term ((52673 : Rat) / 1767) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((399 : Rat) / 31) [(5, 2), (13, 2), (16, 1)],
  term ((-779297 : Rat) / 7068) [(5, 2), (15, 2), (16, 1)],
  term ((-326 : Rat) / 589) [(5, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(5, 3), (7, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 3), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((-19905 : Rat) / 589) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 3), (13, 1), (16, 1)],
  term ((101438 : Rat) / 1767) [(5, 3), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 63. -/
theorem rs_R009_ueqv_R009NNNNN_block_17_0000_0063_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_17_0000_0063
      rs_R009_ueqv_R009NNNNN_block_17_0000_0063 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
