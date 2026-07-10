/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 11:0-39

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0000 : Poly :=
[
  term ((-576 : Rat) / 589) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0000 : Poly :=
[
  term ((-1152 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0000
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0001 : Poly :=
[
  term ((-33553 : Rat) / 1767) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0001 : Poly :=
[
  term ((-67106 : Rat) / 1767) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67106 : Rat) / 1767) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((33553 : Rat) / 1767) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((33553 : Rat) / 1767) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0001
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0002 : Poly :=
[
  term ((-114 : Rat) / 31) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0002 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0002
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0003 : Poly :=
[
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0003 : Poly :=
[
  term ((-6144 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0003
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0004 : Poly :=
[
  term ((4144 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0004 : Poly :=
[
  term ((8288 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((-4144 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-4144 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((8288 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0004
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0005 : Poly :=
[
  term ((1840 : Rat) / 589) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0005 : Poly :=
[
  term ((3680 : Rat) / 589) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0005
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0006 : Poly :=
[
  term ((-456 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0006 : Poly :=
[
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0006
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0007 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0007 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0007
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0008 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0008 : Poly :=
[
  term ((-7360 : Rat) / 589) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0008
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0009 : Poly :=
[
  term ((342 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0009 : Poly :=
[
  term ((684 : Rat) / 31) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0009
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0010 : Poly :=
[
  term ((24755 : Rat) / 589) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0010 : Poly :=
[
  term ((49510 : Rat) / 589) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((49510 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24755 : Rat) / 589) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-24755 : Rat) / 589) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0010
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0011 : Poly :=
[
  term ((-1840 : Rat) / 589) [(1, 2), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0011 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (6, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0011
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0012 : Poly :=
[
  term ((6912 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0012 : Poly :=
[
  term ((13824 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0012
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0013 : Poly :=
[
  term ((-3072 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0013 : Poly :=
[
  term ((-6144 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0013
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0014 : Poly :=
[
  term ((8336 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0014 : Poly :=
[
  term ((16672 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-8336 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-8336 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((16672 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0014
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0015 : Poly :=
[
  term ((-1920 : Rat) / 589) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0015 : Poly :=
[
  term ((-3840 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (7, 3), (10, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 2), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0015
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0016 : Poly :=
[
  term ((576 : Rat) / 589) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0016 : Poly :=
[
  term ((1152 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(3, 1), (7, 3), (16, 1)],
  term ((1152 : Rat) / 589) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0016
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0017 : Poly :=
[
  term ((-768 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0017 : Poly :=
[
  term ((-1536 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0017
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0018 : Poly :=
[
  term ((3072 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0018 : Poly :=
[
  term ((6144 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0018
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0019 : Poly :=
[
  term ((-6096 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0019 : Poly :=
[
  term ((-12192 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6096 : Rat) / 589) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((6096 : Rat) / 589) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-12192 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0019
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0020 : Poly :=
[
  term ((912 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0020 : Poly :=
[
  term ((1824 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0020
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0021 : Poly :=
[
  term ((207008 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0021 : Poly :=
[
  term ((414016 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((414016 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0021
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0022 : Poly :=
[
  term ((304 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0022 : Poly :=
[
  term ((608 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((608 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0022
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0023 : Poly :=
[
  term ((-570 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0023 : Poly :=
[
  term ((-1140 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0023
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0024 : Poly :=
[
  term ((-116585 : Rat) / 1767) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0024 : Poly :=
[
  term ((-233170 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-233170 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((116585 : Rat) / 1767) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((116585 : Rat) / 1767) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0024
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0025 : Poly :=
[
  term ((570 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0025 : Poly :=
[
  term ((1140 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0025
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0026 : Poly :=
[
  term ((157328 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0026 : Poly :=
[
  term ((314656 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((314656 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-157328 : Rat) / 1767) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-157328 : Rat) / 1767) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0026
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0027 : Poly :=
[
  term ((-304 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0027 : Poly :=
[
  term ((-608 : Rat) / 31) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (6, 2), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0027
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0028 : Poly :=
[
  term ((-228 : Rat) / 31) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0028 : Poly :=
[
  term ((-456 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(7, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0028
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0029 : Poly :=
[
  term ((-46634 : Rat) / 1767) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0029 : Poly :=
[
  term ((-93268 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-93268 : Rat) / 1767) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0029
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0030 : Poly :=
[
  term ((-342 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0030 : Poly :=
[
  term ((-684 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(7, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0030
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0031 : Poly :=
[
  term ((-21611 : Rat) / 589) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0031 : Poly :=
[
  term ((-43222 : Rat) / 589) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43222 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((21611 : Rat) / 589) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((21611 : Rat) / 589) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0031
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0032 : Poly :=
[
  term ((57 : Rat) / 31) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0032 : Poly :=
[
  term ((114 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-57 : Rat) / 31) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-57 : Rat) / 31) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0032
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0033 : Poly :=
[
  term ((18199 : Rat) / 3534) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0033 : Poly :=
[
  term ((18199 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 3534) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 3534) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0033
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0034 : Poly :=
[
  term ((-114 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0034 : Poly :=
[
  term ((-228 : Rat) / 31) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0034
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0035 : Poly :=
[
  term ((-28435 : Rat) / 1767) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0035 : Poly :=
[
  term ((-56870 : Rat) / 1767) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0035
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0036 : Poly :=
[
  term ((56870 : Rat) / 1767) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0036 : Poly :=
[
  term ((113740 : Rat) / 1767) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0036
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0037 : Poly :=
[
  term ((228 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 37 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0037 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0037
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0038 : Poly :=
[
  term ((-102499 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0038 : Poly :=
[
  term ((-204998 : Rat) / 1767) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-204998 : Rat) / 1767) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((102499 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((102499 : Rat) / 1767) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0038
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNN_coefficient_11_0039 : Poly :=
[
  term ((-456 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 39 for generator 11. -/
def rs_R009_ueqv_R009NNNNN_partial_11_0039 : Poly :=
[
  term ((-912 : Rat) / 31) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNN_partial_11_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_11_0039
        rs_R009_ueqv_R009NNNNN_generator_11_0000_0039 =
      rs_R009_ueqv_R009NNNNN_partial_11_0039 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_11_0000_0039 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_11_0000,
  rs_R009_ueqv_R009NNNNN_partial_11_0001,
  rs_R009_ueqv_R009NNNNN_partial_11_0002,
  rs_R009_ueqv_R009NNNNN_partial_11_0003,
  rs_R009_ueqv_R009NNNNN_partial_11_0004,
  rs_R009_ueqv_R009NNNNN_partial_11_0005,
  rs_R009_ueqv_R009NNNNN_partial_11_0006,
  rs_R009_ueqv_R009NNNNN_partial_11_0007,
  rs_R009_ueqv_R009NNNNN_partial_11_0008,
  rs_R009_ueqv_R009NNNNN_partial_11_0009,
  rs_R009_ueqv_R009NNNNN_partial_11_0010,
  rs_R009_ueqv_R009NNNNN_partial_11_0011,
  rs_R009_ueqv_R009NNNNN_partial_11_0012,
  rs_R009_ueqv_R009NNNNN_partial_11_0013,
  rs_R009_ueqv_R009NNNNN_partial_11_0014,
  rs_R009_ueqv_R009NNNNN_partial_11_0015,
  rs_R009_ueqv_R009NNNNN_partial_11_0016,
  rs_R009_ueqv_R009NNNNN_partial_11_0017,
  rs_R009_ueqv_R009NNNNN_partial_11_0018,
  rs_R009_ueqv_R009NNNNN_partial_11_0019,
  rs_R009_ueqv_R009NNNNN_partial_11_0020,
  rs_R009_ueqv_R009NNNNN_partial_11_0021,
  rs_R009_ueqv_R009NNNNN_partial_11_0022,
  rs_R009_ueqv_R009NNNNN_partial_11_0023,
  rs_R009_ueqv_R009NNNNN_partial_11_0024,
  rs_R009_ueqv_R009NNNNN_partial_11_0025,
  rs_R009_ueqv_R009NNNNN_partial_11_0026,
  rs_R009_ueqv_R009NNNNN_partial_11_0027,
  rs_R009_ueqv_R009NNNNN_partial_11_0028,
  rs_R009_ueqv_R009NNNNN_partial_11_0029,
  rs_R009_ueqv_R009NNNNN_partial_11_0030,
  rs_R009_ueqv_R009NNNNN_partial_11_0031,
  rs_R009_ueqv_R009NNNNN_partial_11_0032,
  rs_R009_ueqv_R009NNNNN_partial_11_0033,
  rs_R009_ueqv_R009NNNNN_partial_11_0034,
  rs_R009_ueqv_R009NNNNN_partial_11_0035,
  rs_R009_ueqv_R009NNNNN_partial_11_0036,
  rs_R009_ueqv_R009NNNNN_partial_11_0037,
  rs_R009_ueqv_R009NNNNN_partial_11_0038,
  rs_R009_ueqv_R009NNNNN_partial_11_0039
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_11_0000_0039 : Poly :=
[
  term ((-1152 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-67106 : Rat) / 1767) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-67106 : Rat) / 1767) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((576 : Rat) / 589) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((33553 : Rat) / 1767) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((33553 : Rat) / 1767) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((8288 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((49510 : Rat) / 589) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (10, 1), (16, 1)],
  term ((-4144 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((49510 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (10, 1), (16, 1)],
  term ((-4144 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((8288 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-24755 : Rat) / 589) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-24755 : Rat) / 589) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (6, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 2), (7, 2), (16, 1)],
  term ((13824 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((16672 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((1152 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12192 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((414016 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-233170 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((314656 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-93268 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43222 : Rat) / 589) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-204998 : Rat) / 1767) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((-8336 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((414016 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-233170 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((314656 : Rat) / 1767) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((-8336 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((6096 : Rat) / 589) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-204998 : Rat) / 1767) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-93268 : Rat) / 1767) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 589) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-16068 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-43222 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((8262 : Rat) / 589) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (7, 3), (10, 1), (16, 1)],
  term ((-576 : Rat) / 589) [(3, 1), (7, 3), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((16672 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12192 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 2), (7, 2), (10, 1), (16, 1)],
  term ((1152 : Rat) / 589) [(3, 2), (7, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((116585 : Rat) / 1767) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-157328 : Rat) / 1767) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((116585 : Rat) / 1767) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-157328 : Rat) / 1767) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (6, 2), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (7, 2), (16, 1)],
  term ((228 : Rat) / 31) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((21611 : Rat) / 589) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 31) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-18199 : Rat) / 3534) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term ((102499 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((102499 : Rat) / 1767) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 2), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(7, 3), (10, 1), (13, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(7, 3), (12, 1), (13, 1), (16, 1)],
  term ((21611 : Rat) / 589) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 31) [(7, 3), (13, 1), (16, 1)],
  term ((-18199 : Rat) / 3534) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 39. -/
theorem rs_R009_ueqv_R009NNNNN_block_11_0000_0039_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_11_0000_0039
      rs_R009_ueqv_R009NNNNN_block_11_0000_0039 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
