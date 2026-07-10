/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 28:0-46

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0000 : Poly :=
[
  term ((1536 : Rat) / 589) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0000 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0000
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0001 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0001 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0001
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0002 : Poly :=
[
  term ((56870 : Rat) / 1767) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0002 : Poly :=
[
  term ((113740 : Rat) / 1767) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0002
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0003 : Poly :=
[
  term ((-2224 : Rat) / 589) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0003 : Poly :=
[
  term ((-4448 : Rat) / 589) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((2224 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((-4448 : Rat) / 589) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((2224 : Rat) / 589) [(0, 1), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0003
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0004 : Poly :=
[
  term ((768 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0004 : Poly :=
[
  term ((1536 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 589) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0004
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0005 : Poly :=
[
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0005 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0005
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0006 : Poly :=
[
  term ((114 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0006 : Poly :=
[
  term ((228 : Rat) / 31) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0006
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0007 : Poly :=
[
  term ((39475 : Rat) / 1767) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0007 : Poly :=
[
  term ((78950 : Rat) / 1767) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475 : Rat) / 1767) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((78950 : Rat) / 1767) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-39475 : Rat) / 1767) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0007
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0008 : Poly :=
[
  term ((64 : Rat) / 589) [(2, 1), (16, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0008 : Poly :=
[
  term ((128 : Rat) / 589) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 589) [(2, 1), (3, 2), (16, 1)],
  term ((128 : Rat) / 589) [(2, 2), (14, 1), (16, 1)],
  term ((-64 : Rat) / 589) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0008
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0009 : Poly :=
[
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0009 : Poly :=
[
  term ((-13824 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0009
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0010 : Poly :=
[
  term ((4416 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0010 : Poly :=
[
  term ((8832 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 3), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0010
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0011 : Poly :=
[
  term ((24 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0011 : Poly :=
[
  term ((48 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-24 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0011
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0012 : Poly :=
[
  term ((-524 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0012 : Poly :=
[
  term ((-1048 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((524 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-1048 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 589) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0012
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0013 : Poly :=
[
  term ((4728 : Rat) / 589) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0013 : Poly :=
[
  term ((9456 : Rat) / 589) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-4728 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0013
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0014 : Poly :=
[
  term ((-4728 : Rat) / 589) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0014 : Poly :=
[
  term ((-9456 : Rat) / 589) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0014
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0015 : Poly :=
[
  term ((3456 : Rat) / 589) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0015 : Poly :=
[
  term ((6912 : Rat) / 589) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0015
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0016 : Poly :=
[
  term ((-3936 : Rat) / 589) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0016 : Poly :=
[
  term ((-7872 : Rat) / 589) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7872 : Rat) / 589) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((3936 : Rat) / 589) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0016
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0017 : Poly :=
[
  term ((8640 : Rat) / 589) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0017 : Poly :=
[
  term ((17280 : Rat) / 589) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8640 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0017
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0018 : Poly :=
[
  term ((-1728 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0018 : Poly :=
[
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0018
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0019 : Poly :=
[
  term ((-6428 : Rat) / 589) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0019 : Poly :=
[
  term ((-12856 : Rat) / 589) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((6428 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12856 : Rat) / 589) [(3, 2), (15, 2), (16, 1)],
  term ((6428 : Rat) / 589) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0019
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0020 : Poly :=
[
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0020 : Poly :=
[
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0020
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0021 : Poly :=
[
  term ((-207008 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0021 : Poly :=
[
  term ((-414016 : Rat) / 1767) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-414016 : Rat) / 1767) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0021
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0022 : Poly :=
[
  term ((-304 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0022 : Poly :=
[
  term ((-608 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((304 : Rat) / 31) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0022
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0023 : Poly :=
[
  term ((-342 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0023 : Poly :=
[
  term ((-684 : Rat) / 31) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((342 : Rat) / 31) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0023
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0024 : Poly :=
[
  term ((-19905 : Rat) / 589) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0024 : Poly :=
[
  term ((-39810 : Rat) / 589) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39810 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((19905 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0024
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0025 : Poly :=
[
  term ((228 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0025 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0025
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0026 : Poly :=
[
  term ((3948 : Rat) / 589) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0026 : Poly :=
[
  term ((7896 : Rat) / 589) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3948 : Rat) / 589) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0026
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0027 : Poly :=
[
  term ((24572 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0027 : Poly :=
[
  term ((49144 : Rat) / 1767) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24572 : Rat) / 1767) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((49144 : Rat) / 1767) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-24572 : Rat) / 1767) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0027
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0028 : Poly :=
[
  term ((304 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0028 : Poly :=
[
  term ((608 : Rat) / 31) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(2, 2), (5, 2), (16, 1)],
  term ((608 : Rat) / 31) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0028
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0029 : Poly :=
[
  term ((228 : Rat) / 31) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0029 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0029
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0030 : Poly :=
[
  term ((-228 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0030 : Poly :=
[
  term ((-456 : Rat) / 31) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0030
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0031 : Poly :=
[
  term ((82058 : Rat) / 1767) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0031 : Poly :=
[
  term ((164116 : Rat) / 1767) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0031
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0032 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0032 : Poly :=
[
  term ((-164116 : Rat) / 1767) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0032
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0033 : Poly :=
[
  term ((456 : Rat) / 31) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0033 : Poly :=
[
  term ((912 : Rat) / 31) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0033
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0034 : Poly :=
[
  term ((103504 : Rat) / 1767) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0034 : Poly :=
[
  term ((207008 : Rat) / 1767) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-103504 : Rat) / 1767) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0034
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0035 : Poly :=
[
  term ((76 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0035 : Poly :=
[
  term ((152 : Rat) / 31) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(2, 2), (10, 1), (16, 1)],
  term ((152 : Rat) / 31) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0035
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0036 : Poly :=
[
  term ((152 : Rat) / 31) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0036 : Poly :=
[
  term ((304 : Rat) / 31) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-152 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0036
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0037 : Poly :=
[
  term ((570 : Rat) / 31) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0037 : Poly :=
[
  term ((1140 : Rat) / 31) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-570 : Rat) / 31) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0037
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0038 : Poly :=
[
  term ((-6032 : Rat) / 589) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0038 : Poly :=
[
  term ((-12064 : Rat) / 589) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((6032 : Rat) / 589) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-12064 : Rat) / 589) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6032 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0038
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0039 : Poly :=
[
  term ((101231 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0039 : Poly :=
[
  term ((202462 : Rat) / 1767) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((202462 : Rat) / 1767) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-101231 : Rat) / 1767) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0039
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0040 : Poly :=
[
  term ((2148 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0040 : Poly :=
[
  term ((4296 : Rat) / 589) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2148 : Rat) / 589) [(2, 2), (12, 1), (16, 1)],
  term ((4296 : Rat) / 589) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2148 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0040
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0041 : Poly :=
[
  term ((6824 : Rat) / 589) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0041 : Poly :=
[
  term ((13648 : Rat) / 589) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0041
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0042 : Poly :=
[
  term ((10551 : Rat) / 589) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0042 : Poly :=
[
  term ((21102 : Rat) / 589) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10551 : Rat) / 589) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((21102 : Rat) / 589) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10551 : Rat) / 589) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0042
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0043 : Poly :=
[
  term ((342 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0043 : Poly :=
[
  term ((684 : Rat) / 31) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((684 : Rat) / 31) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0043
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0044 : Poly :=
[
  term ((3148 : Rat) / 589) [(14, 1), (16, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0044 : Poly :=
[
  term ((6296 : Rat) / 589) [(2, 1), (14, 2), (16, 1)],
  term ((-3148 : Rat) / 589) [(2, 2), (14, 1), (16, 1)],
  term ((6296 : Rat) / 589) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3148 : Rat) / 589) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0044
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0045 : Poly :=
[
  term ((-327791 : Rat) / 3534) [(15, 2), (16, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0045 : Poly :=
[
  term ((-327791 : Rat) / 1767) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((327791 : Rat) / 3534) [(2, 2), (15, 2), (16, 1)],
  term ((-327791 : Rat) / 1767) [(3, 1), (15, 3), (16, 1)],
  term ((327791 : Rat) / 3534) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0045
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNNN_coefficient_28_0046 : Poly :=
[
  term ((-40 : Rat) / 589) [(16, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R009_ueqv_R009NNNNN_partial_28_0046 : Poly :=
[
  term ((-80 : Rat) / 589) [(2, 1), (14, 1), (16, 1)],
  term ((40 : Rat) / 589) [(2, 2), (16, 1)],
  term ((-80 : Rat) / 589) [(3, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 589) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R009_ueqv_R009NNNNN_partial_28_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_28_0046
        rs_R009_ueqv_R009NNNNN_generator_28_0000_0046 =
      rs_R009_ueqv_R009NNNNN_partial_28_0046 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_28_0000_0046 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_28_0000,
  rs_R009_ueqv_R009NNNNN_partial_28_0001,
  rs_R009_ueqv_R009NNNNN_partial_28_0002,
  rs_R009_ueqv_R009NNNNN_partial_28_0003,
  rs_R009_ueqv_R009NNNNN_partial_28_0004,
  rs_R009_ueqv_R009NNNNN_partial_28_0005,
  rs_R009_ueqv_R009NNNNN_partial_28_0006,
  rs_R009_ueqv_R009NNNNN_partial_28_0007,
  rs_R009_ueqv_R009NNNNN_partial_28_0008,
  rs_R009_ueqv_R009NNNNN_partial_28_0009,
  rs_R009_ueqv_R009NNNNN_partial_28_0010,
  rs_R009_ueqv_R009NNNNN_partial_28_0011,
  rs_R009_ueqv_R009NNNNN_partial_28_0012,
  rs_R009_ueqv_R009NNNNN_partial_28_0013,
  rs_R009_ueqv_R009NNNNN_partial_28_0014,
  rs_R009_ueqv_R009NNNNN_partial_28_0015,
  rs_R009_ueqv_R009NNNNN_partial_28_0016,
  rs_R009_ueqv_R009NNNNN_partial_28_0017,
  rs_R009_ueqv_R009NNNNN_partial_28_0018,
  rs_R009_ueqv_R009NNNNN_partial_28_0019,
  rs_R009_ueqv_R009NNNNN_partial_28_0020,
  rs_R009_ueqv_R009NNNNN_partial_28_0021,
  rs_R009_ueqv_R009NNNNN_partial_28_0022,
  rs_R009_ueqv_R009NNNNN_partial_28_0023,
  rs_R009_ueqv_R009NNNNN_partial_28_0024,
  rs_R009_ueqv_R009NNNNN_partial_28_0025,
  rs_R009_ueqv_R009NNNNN_partial_28_0026,
  rs_R009_ueqv_R009NNNNN_partial_28_0027,
  rs_R009_ueqv_R009NNNNN_partial_28_0028,
  rs_R009_ueqv_R009NNNNN_partial_28_0029,
  rs_R009_ueqv_R009NNNNN_partial_28_0030,
  rs_R009_ueqv_R009NNNNN_partial_28_0031,
  rs_R009_ueqv_R009NNNNN_partial_28_0032,
  rs_R009_ueqv_R009NNNNN_partial_28_0033,
  rs_R009_ueqv_R009NNNNN_partial_28_0034,
  rs_R009_ueqv_R009NNNNN_partial_28_0035,
  rs_R009_ueqv_R009NNNNN_partial_28_0036,
  rs_R009_ueqv_R009NNNNN_partial_28_0037,
  rs_R009_ueqv_R009NNNNN_partial_28_0038,
  rs_R009_ueqv_R009NNNNN_partial_28_0039,
  rs_R009_ueqv_R009NNNNN_partial_28_0040,
  rs_R009_ueqv_R009NNNNN_partial_28_0041,
  rs_R009_ueqv_R009NNNNN_partial_28_0042,
  rs_R009_ueqv_R009NNNNN_partial_28_0043,
  rs_R009_ueqv_R009NNNNN_partial_28_0044,
  rs_R009_ueqv_R009NNNNN_partial_28_0045,
  rs_R009_ueqv_R009NNNNN_partial_28_0046
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_28_0000_0046 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4448 : Rat) / 589) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((2224 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4448 : Rat) / 589) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-47654 : Rat) / 1767) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((2224 : Rat) / 589) [(0, 1), (3, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((78950 : Rat) / 1767) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-39475 : Rat) / 1767) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950 : Rat) / 1767) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-34867 : Rat) / 1767) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 589) [(1, 1), (3, 3), (16, 1)],
  term ((-13824 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1048 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-9456 : Rat) / 589) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7872 : Rat) / 589) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12856 : Rat) / 589) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 589) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 589) [(2, 1), (3, 2), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-414016 : Rat) / 1767) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39810 : Rat) / 589) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((49144 : Rat) / 1767) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((152 : Rat) / 31) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((304 : Rat) / 31) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4296 : Rat) / 589) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12064 : Rat) / 589) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((21102 : Rat) / 589) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-327791 : Rat) / 1767) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 589) [(2, 1), (14, 1), (16, 1)],
  term ((6296 : Rat) / 589) [(2, 1), (14, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((524 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((6428 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24572 : Rat) / 1767) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(2, 2), (5, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(2, 2), (10, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6032 : Rat) / 589) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2148 : Rat) / 589) [(2, 2), (12, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10551 : Rat) / 589) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((-3020 : Rat) / 589) [(2, 2), (14, 1), (16, 1)],
  term ((327791 : Rat) / 3534) [(2, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 589) [(2, 2), (16, 1)],
  term ((-64 : Rat) / 589) [(2, 3), (16, 1)],
  term ((-1824 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-414016 : Rat) / 1767) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39810 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((49144 : Rat) / 1767) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((608 : Rat) / 31) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((152 : Rat) / 31) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((304 : Rat) / 31) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12064 : Rat) / 589) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4296 : Rat) / 589) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((13648 : Rat) / 589) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21102 : Rat) / 589) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((684 : Rat) / 31) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((6296 : Rat) / 589) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 589) [(3, 1), (15, 1), (16, 1)],
  term ((-327791 : Rat) / 1767) [(3, 1), (15, 3), (16, 1)],
  term ((912 : Rat) / 31) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((165536 : Rat) / 1767) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((927 : Rat) / 19) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3900 : Rat) / 589) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27716 : Rat) / 1767) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(3, 2), (5, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-53690 : Rat) / 1767) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((53690 : Rat) / 1767) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82768 : Rat) / 1767) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(3, 2), (10, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6032 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-124847 : Rat) / 1767) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2148 : Rat) / 589) [(3, 2), (12, 1), (16, 1)],
  term ((10456 : Rat) / 589) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14007 : Rat) / 589) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(3, 2), (13, 2), (16, 1)],
  term ((-3148 : Rat) / 589) [(3, 2), (14, 1), (16, 1)],
  term ((250655 : Rat) / 3534) [(3, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 589) [(3, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 3), (5, 1), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 3), (5, 1), (12, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 3), (5, 1), (14, 1), (16, 1)],
  term ((524 : Rat) / 589) [(3, 3), (5, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 3), (9, 1), (14, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 3), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(3, 3), (13, 1), (16, 1)],
  term ((6428 : Rat) / 589) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 46. -/
theorem rs_R009_ueqv_R009NNNNN_block_28_0000_0046_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_28_0000_0046
      rs_R009_ueqv_R009NNNNN_block_28_0000_0046 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
