/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 10:0-70

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0000 : Poly :=
[
  term ((1536 : Rat) / 589) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0000 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0000
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0001 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0001 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0001
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0002 : Poly :=
[
  term ((56870 : Rat) / 1767) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0002 : Poly :=
[
  term ((113740 : Rat) / 1767) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0002
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0003 : Poly :=
[
  term ((-1304 : Rat) / 589) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0003 : Poly :=
[
  term ((-2608 : Rat) / 589) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (4, 2), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0003
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0004 : Poly :=
[
  term ((-2496 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0004 : Poly :=
[
  term ((-4992 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((2496 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((2496 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-4992 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0004
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0005 : Poly :=
[
  term ((384 : Rat) / 31) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0005 : Poly :=
[
  term ((768 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 1), (3, 1), (4, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0005
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0006 : Poly :=
[
  term ((-2880 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0006 : Poly :=
[
  term ((-5760 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((2880 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((2880 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-5760 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0006
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0007 : Poly :=
[
  term ((-1840 : Rat) / 589) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0007 : Poly :=
[
  term ((-3680 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0007
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0008 : Poly :=
[
  term ((-342 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0008 : Poly :=
[
  term ((-684 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0008
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0009 : Poly :=
[
  term ((-26729 : Rat) / 589) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0009 : Poly :=
[
  term ((-53458 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53458 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((26729 : Rat) / 589) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((26729 : Rat) / 589) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0009
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0010 : Poly :=
[
  term ((912 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0010 : Poly :=
[
  term ((1824 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0010
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0011 : Poly :=
[
  term ((-4658 : Rat) / 589) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0011 : Poly :=
[
  term ((-9316 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-9316 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0011
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0012 : Poly :=
[
  term ((196772 : Rat) / 1767) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0012 : Poly :=
[
  term ((393544 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((393544 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0012
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0013 : Poly :=
[
  term ((-19637 : Rat) / 589) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0013 : Poly :=
[
  term ((-39274 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-39274 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((19637 : Rat) / 589) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((19637 : Rat) / 589) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0013
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0014 : Poly :=
[
  term ((-856 : Rat) / 589) [(2, 1), (16, 1)]
]

/-- Partial product 14 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0014 : Poly :=
[
  term ((-1712 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((856 : Rat) / 589) [(2, 1), (4, 2), (16, 1)],
  term ((856 : Rat) / 589) [(2, 1), (5, 2), (16, 1)],
  term ((-1712 : Rat) / 589) [(2, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0014
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0015 : Poly :=
[
  term ((-6912 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 15 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0015 : Poly :=
[
  term ((-13824 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 1), (5, 3), (10, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(3, 2), (5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0015
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0016 : Poly :=
[
  term ((4416 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 16 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0016 : Poly :=
[
  term ((8832 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (12, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(3, 2), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0016
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0017 : Poly :=
[
  term ((-48 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0017 : Poly :=
[
  term ((-96 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((-96 : Rat) / 589) [(3, 2), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0017
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0018 : Poly :=
[
  term ((-2840 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 18 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0018 : Poly :=
[
  term ((-5680 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((2840 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((2840 : Rat) / 589) [(3, 1), (5, 3), (16, 1)],
  term ((-5680 : Rat) / 589) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0018
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0019 : Poly :=
[
  term ((3072 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 19 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0019 : Poly :=
[
  term ((6144 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0019
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0020 : Poly :=
[
  term ((-13152 : Rat) / 589) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0020 : Poly :=
[
  term ((-26304 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (14, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0020
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0021 : Poly :=
[
  term ((6576 : Rat) / 589) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0021 : Poly :=
[
  term ((13152 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-6576 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-6576 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0021
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0022 : Poly :=
[
  term ((-9456 : Rat) / 589) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0022 : Poly :=
[
  term ((-18912 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-18912 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0022
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0023 : Poly :=
[
  term ((4728 : Rat) / 589) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0023 : Poly :=
[
  term ((9456 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0023
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0024 : Poly :=
[
  term ((3456 : Rat) / 589) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0024 : Poly :=
[
  term ((6912 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0024
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0025 : Poly :=
[
  term ((1536 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0025 : Poly :=
[
  term ((3072 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0025
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0026 : Poly :=
[
  term ((-3072 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0026 : Poly :=
[
  term ((-6144 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0026
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0027 : Poly :=
[
  term ((-3936 : Rat) / 589) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0027 : Poly :=
[
  term ((-7872 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7872 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0027
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0028 : Poly :=
[
  term ((-20736 : Rat) / 589) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0028 : Poly :=
[
  term ((-41472 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-41472 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0028
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0029 : Poly :=
[
  term ((15744 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0029 : Poly :=
[
  term ((31488 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-15744 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-15744 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((31488 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0029
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0030 : Poly :=
[
  term ((17292 : Rat) / 589) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0030 : Poly :=
[
  term ((34584 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17292 : Rat) / 589) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17292 : Rat) / 589) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((34584 : Rat) / 589) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0030
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0031 : Poly :=
[
  term ((-13478 : Rat) / 589) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0031 : Poly :=
[
  term ((-26956 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((13478 : Rat) / 589) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((13478 : Rat) / 589) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-26956 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0031
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0032 : Poly :=
[
  term ((24 : Rat) / 589) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 32 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0032 : Poly :=
[
  term ((48 : Rat) / 589) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0032
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0033 : Poly :=
[
  term ((-12 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 33 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0033 : Poly :=
[
  term ((-24 : Rat) / 589) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((12 : Rat) / 589) [(3, 2), (4, 2), (16, 1)],
  term ((12 : Rat) / 589) [(3, 2), (5, 2), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0033
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0034 : Poly :=
[
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0034 : Poly :=
[
  term ((-1824 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0034
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0035 : Poly :=
[
  term ((-207008 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0035 : Poly :=
[
  term ((-414016 : Rat) / 1767) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-414016 : Rat) / 1767) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0035
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0036 : Poly :=
[
  term ((-304 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0036 : Poly :=
[
  term ((-608 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((304 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0036
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0037 : Poly :=
[
  term ((-342 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0037 : Poly :=
[
  term ((-684 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0037
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0038 : Poly :=
[
  term ((-19905 : Rat) / 589) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0038 : Poly :=
[
  term ((-39810 : Rat) / 589) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39810 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0038
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0039 : Poly :=
[
  term ((114 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0039 : Poly :=
[
  term ((228 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0039
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0040 : Poly :=
[
  term ((-7896 : Rat) / 589) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0040 : Poly :=
[
  term ((-15792 : Rat) / 589) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15792 : Rat) / 589) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0040
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0041 : Poly :=
[
  term ((7231 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0041 : Poly :=
[
  term ((14462 : Rat) / 1767) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((14462 : Rat) / 1767) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-7231 : Rat) / 1767) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-7231 : Rat) / 1767) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0041
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0042 : Poly :=
[
  term ((304 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 42 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0042 : Poly :=
[
  term ((608 : Rat) / 31) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((608 : Rat) / 31) [(3, 1), (5, 3), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (5, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0042
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0043 : Poly :=
[
  term ((342 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0043 : Poly :=
[
  term ((684 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((684 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0043
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0044 : Poly :=
[
  term ((21611 : Rat) / 589) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0044 : Poly :=
[
  term ((43222 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((43222 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21611 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21611 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0044
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0045 : Poly :=
[
  term ((-1026 : Rat) / 31) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 45 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0045 : Poly :=
[
  term ((-2052 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0045
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0046 : Poly :=
[
  term ((513 : Rat) / 31) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0046 : Poly :=
[
  term ((1026 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0046
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0047 : Poly :=
[
  term ((-92129 : Rat) / 589) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0047 : Poly :=
[
  term ((-184258 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0047
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0048 : Poly :=
[
  term ((92129 : Rat) / 1178) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0048 : Poly :=
[
  term ((92129 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0048
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0049 : Poly :=
[
  term ((-456 : Rat) / 31) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0049 : Poly :=
[
  term ((-912 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0049
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0050 : Poly :=
[
  term ((228 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0050 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0050
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0051 : Poly :=
[
  term ((-164116 : Rat) / 1767) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0051 : Poly :=
[
  term ((-328232 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0051
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0052 : Poly :=
[
  term ((82058 : Rat) / 1767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0052 : Poly :=
[
  term ((164116 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0052
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0053 : Poly :=
[
  term ((456 : Rat) / 31) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0053 : Poly :=
[
  term ((912 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0053
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0054 : Poly :=
[
  term ((103504 : Rat) / 1767) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0054 : Poly :=
[
  term ((207008 : Rat) / 1767) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0054
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0055 : Poly :=
[
  term ((-396 : Rat) / 589) [(10, 1), (16, 1)]
]

/-- Partial product 55 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0055 : Poly :=
[
  term ((-792 : Rat) / 589) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 589) [(4, 2), (10, 1), (16, 1)],
  term ((396 : Rat) / 589) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0055
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0056 : Poly :=
[
  term ((228 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0056 : Poly :=
[
  term ((456 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0056
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0057 : Poly :=
[
  term ((2114 : Rat) / 57) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0057 : Poly :=
[
  term ((4228 : Rat) / 57) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((4228 : Rat) / 57) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114 : Rat) / 57) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2114 : Rat) / 57) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0057
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0058 : Poly :=
[
  term ((-24380 : Rat) / 1767) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0058 : Poly :=
[
  term ((-48760 : Rat) / 1767) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48760 : Rat) / 1767) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24380 : Rat) / 1767) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24380 : Rat) / 1767) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0058
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0059 : Poly :=
[
  term ((-228 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 59 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0059 : Poly :=
[
  term ((-456 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0059
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0060 : Poly :=
[
  term ((17840 : Rat) / 589) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0060 : Poly :=
[
  term ((35680 : Rat) / 589) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((35680 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17840 : Rat) / 589) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-17840 : Rat) / 589) [(5, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0060
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0061 : Poly :=
[
  term ((101231 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0061 : Poly :=
[
  term ((202462 : Rat) / 1767) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((202462 : Rat) / 1767) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0061
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0062 : Poly :=
[
  term ((-12140 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 62 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0062 : Poly :=
[
  term ((-24280 : Rat) / 589) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-24280 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((12140 : Rat) / 589) [(4, 2), (12, 1), (16, 1)],
  term ((12140 : Rat) / 589) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0062
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0063 : Poly :=
[
  term ((-133618 : Rat) / 1767) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0063 : Poly :=
[
  term ((-267236 : Rat) / 1767) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-267236 : Rat) / 1767) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((133618 : Rat) / 1767) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((133618 : Rat) / 1767) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0063
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0064 : Poly :=
[
  term ((173035 : Rat) / 3534) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0064 : Poly :=
[
  term ((173035 : Rat) / 1767) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((173035 : Rat) / 1767) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-173035 : Rat) / 3534) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-173035 : Rat) / 3534) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0064
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0065 : Poly :=
[
  term ((-456 : Rat) / 31) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0065 : Poly :=
[
  term ((-912 : Rat) / 31) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(5, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0065
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0066 : Poly :=
[
  term ((399 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 66 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0066 : Poly :=
[
  term ((798 : Rat) / 31) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((798 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(4, 2), (13, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0066
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0067 : Poly :=
[
  term ((69769 : Rat) / 1767) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 67 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0067 : Poly :=
[
  term ((139538 : Rat) / 1767) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((139538 : Rat) / 1767) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0067
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0068 : Poly :=
[
  term ((-11088 : Rat) / 589) [(14, 1), (16, 1)]
]

/-- Partial product 68 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0068 : Poly :=
[
  term ((-22176 : Rat) / 589) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-22176 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((11088 : Rat) / 589) [(4, 2), (14, 1), (16, 1)],
  term ((11088 : Rat) / 589) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0068
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0069 : Poly :=
[
  term ((-62982 : Rat) / 589) [(15, 2), (16, 1)]
]

/-- Partial product 69 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0069 : Poly :=
[
  term ((-125964 : Rat) / 589) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-125964 : Rat) / 589) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((62982 : Rat) / 589) [(4, 2), (15, 2), (16, 1)],
  term ((62982 : Rat) / 589) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0069
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNNN_coefficient_10_0070 : Poly :=
[
  term ((10160 : Rat) / 589) [(16, 1)]
]

/-- Partial product 70 for generator 10. -/
def rs_R009_ueqv_R009NNNNN_partial_10_0070 : Poly :=
[
  term ((20320 : Rat) / 589) [(2, 1), (4, 1), (16, 1)],
  term ((20320 : Rat) / 589) [(3, 1), (5, 1), (16, 1)],
  term ((-10160 : Rat) / 589) [(4, 2), (16, 1)],
  term ((-10160 : Rat) / 589) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem rs_R009_ueqv_R009NNNNN_partial_10_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_10_0070
        rs_R009_ueqv_R009NNNNN_generator_10_0000_0070 =
      rs_R009_ueqv_R009NNNNN_partial_10_0070 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_10_0000_0070 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_10_0000,
  rs_R009_ueqv_R009NNNNN_partial_10_0001,
  rs_R009_ueqv_R009NNNNN_partial_10_0002,
  rs_R009_ueqv_R009NNNNN_partial_10_0003,
  rs_R009_ueqv_R009NNNNN_partial_10_0004,
  rs_R009_ueqv_R009NNNNN_partial_10_0005,
  rs_R009_ueqv_R009NNNNN_partial_10_0006,
  rs_R009_ueqv_R009NNNNN_partial_10_0007,
  rs_R009_ueqv_R009NNNNN_partial_10_0008,
  rs_R009_ueqv_R009NNNNN_partial_10_0009,
  rs_R009_ueqv_R009NNNNN_partial_10_0010,
  rs_R009_ueqv_R009NNNNN_partial_10_0011,
  rs_R009_ueqv_R009NNNNN_partial_10_0012,
  rs_R009_ueqv_R009NNNNN_partial_10_0013,
  rs_R009_ueqv_R009NNNNN_partial_10_0014,
  rs_R009_ueqv_R009NNNNN_partial_10_0015,
  rs_R009_ueqv_R009NNNNN_partial_10_0016,
  rs_R009_ueqv_R009NNNNN_partial_10_0017,
  rs_R009_ueqv_R009NNNNN_partial_10_0018,
  rs_R009_ueqv_R009NNNNN_partial_10_0019,
  rs_R009_ueqv_R009NNNNN_partial_10_0020,
  rs_R009_ueqv_R009NNNNN_partial_10_0021,
  rs_R009_ueqv_R009NNNNN_partial_10_0022,
  rs_R009_ueqv_R009NNNNN_partial_10_0023,
  rs_R009_ueqv_R009NNNNN_partial_10_0024,
  rs_R009_ueqv_R009NNNNN_partial_10_0025,
  rs_R009_ueqv_R009NNNNN_partial_10_0026,
  rs_R009_ueqv_R009NNNNN_partial_10_0027,
  rs_R009_ueqv_R009NNNNN_partial_10_0028,
  rs_R009_ueqv_R009NNNNN_partial_10_0029,
  rs_R009_ueqv_R009NNNNN_partial_10_0030,
  rs_R009_ueqv_R009NNNNN_partial_10_0031,
  rs_R009_ueqv_R009NNNNN_partial_10_0032,
  rs_R009_ueqv_R009NNNNN_partial_10_0033,
  rs_R009_ueqv_R009NNNNN_partial_10_0034,
  rs_R009_ueqv_R009NNNNN_partial_10_0035,
  rs_R009_ueqv_R009NNNNN_partial_10_0036,
  rs_R009_ueqv_R009NNNNN_partial_10_0037,
  rs_R009_ueqv_R009NNNNN_partial_10_0038,
  rs_R009_ueqv_R009NNNNN_partial_10_0039,
  rs_R009_ueqv_R009NNNNN_partial_10_0040,
  rs_R009_ueqv_R009NNNNN_partial_10_0041,
  rs_R009_ueqv_R009NNNNN_partial_10_0042,
  rs_R009_ueqv_R009NNNNN_partial_10_0043,
  rs_R009_ueqv_R009NNNNN_partial_10_0044,
  rs_R009_ueqv_R009NNNNN_partial_10_0045,
  rs_R009_ueqv_R009NNNNN_partial_10_0046,
  rs_R009_ueqv_R009NNNNN_partial_10_0047,
  rs_R009_ueqv_R009NNNNN_partial_10_0048,
  rs_R009_ueqv_R009NNNNN_partial_10_0049,
  rs_R009_ueqv_R009NNNNN_partial_10_0050,
  rs_R009_ueqv_R009NNNNN_partial_10_0051,
  rs_R009_ueqv_R009NNNNN_partial_10_0052,
  rs_R009_ueqv_R009NNNNN_partial_10_0053,
  rs_R009_ueqv_R009NNNNN_partial_10_0054,
  rs_R009_ueqv_R009NNNNN_partial_10_0055,
  rs_R009_ueqv_R009NNNNN_partial_10_0056,
  rs_R009_ueqv_R009NNNNN_partial_10_0057,
  rs_R009_ueqv_R009NNNNN_partial_10_0058,
  rs_R009_ueqv_R009NNNNN_partial_10_0059,
  rs_R009_ueqv_R009NNNNN_partial_10_0060,
  rs_R009_ueqv_R009NNNNN_partial_10_0061,
  rs_R009_ueqv_R009NNNNN_partial_10_0062,
  rs_R009_ueqv_R009NNNNN_partial_10_0063,
  rs_R009_ueqv_R009NNNNN_partial_10_0064,
  rs_R009_ueqv_R009NNNNN_partial_10_0065,
  rs_R009_ueqv_R009NNNNN_partial_10_0066,
  rs_R009_ueqv_R009NNNNN_partial_10_0067,
  rs_R009_ueqv_R009NNNNN_partial_10_0068,
  rs_R009_ueqv_R009NNNNN_partial_10_0069,
  rs_R009_ueqv_R009NNNNN_partial_10_0070
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_10_0000_0070 : Poly :=
[
  term ((3072 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (4, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (5, 2), (16, 1)],
  term ((-4992 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((768 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-5760 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53458 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9316 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((393544 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39274 : Rat) / 589) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 1), (3, 1), (4, 2), (14, 1), (16, 1)],
  term ((2880 : Rat) / 589) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53458 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9316 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((393544 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39274 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((-800 : Rat) / 589) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-4992 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((768 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-5760 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((26729 : Rat) / 589) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((19637 : Rat) / 589) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((26729 : Rat) / 589) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((4658 : Rat) / 589) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((19637 : Rat) / 589) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 1), (5, 3), (16, 1)],
  term ((-13824 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-96 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-5680 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-18912 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7872 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41472 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((31488 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((34584 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26956 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1712 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((48 : Rat) / 589) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-414016 : Rat) / 1767) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-39810 : Rat) / 589) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-15792 : Rat) / 589) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((14462 : Rat) / 1767) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((684 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((43222 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-792 : Rat) / 589) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228 : Rat) / 57) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48760 : Rat) / 1767) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((35680 : Rat) / 589) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24280 : Rat) / 589) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-267236 : Rat) / 1767) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((173035 : Rat) / 1767) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((798 : Rat) / 31) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((139538 : Rat) / 1767) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22176 : Rat) / 589) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-125964 : Rat) / 589) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((20320 : Rat) / 589) [(2, 1), (4, 1), (16, 1)],
  term ((856 : Rat) / 589) [(2, 1), (4, 2), (16, 1)],
  term ((856 : Rat) / 589) [(2, 1), (5, 2), (16, 1)],
  term ((-1712 : Rat) / 589) [(2, 2), (4, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (12, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((2840 : Rat) / 589) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (14, 1), (16, 1)],
  term ((-6576 : Rat) / 589) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((3936 : Rat) / 589) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15744 : Rat) / 589) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-17292 : Rat) / 589) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((13478 : Rat) / 589) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((43222 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-792 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((456 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228 : Rat) / 57) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48760 : Rat) / 1767) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((35680 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24280 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-267236 : Rat) / 1767) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((173035 : Rat) / 1767) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((798 : Rat) / 31) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((139538 : Rat) / 1767) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22176 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-125964 : Rat) / 589) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((20320 : Rat) / 589) [(3, 1), (5, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-6576 : Rat) / 589) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-22336 : Rat) / 93) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-13088 : Rat) / 589) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-9924 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-35874 : Rat) / 589) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11412 : Rat) / 589) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-33084 : Rat) / 589) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((54896 : Rat) / 1767) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 1), (5, 3), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((14392 : Rat) / 589) [(3, 1), (5, 3), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (14, 1), (16, 1)],
  term ((12 : Rat) / 589) [(3, 2), (4, 2), (16, 1)],
  term ((6144 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-18912 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7872 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41472 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((31488 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((34584 : Rat) / 589) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26956 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(3, 2), (5, 2), (10, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(3, 2), (5, 2), (12, 1), (16, 1)],
  term ((-120 : Rat) / 589) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((-5668 : Rat) / 589) [(3, 2), (5, 2), (16, 1)],
  term ((48 : Rat) / 589) [(3, 3), (5, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 3), (5, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7231 : Rat) / 1767) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (5, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21611 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((396 : Rat) / 589) [(4, 2), (10, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2114 : Rat) / 57) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((24380 : Rat) / 1767) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((-17840 : Rat) / 589) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((12140 : Rat) / 589) [(4, 2), (12, 1), (16, 1)],
  term ((133618 : Rat) / 1767) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-173035 : Rat) / 3534) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(4, 2), (13, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((11088 : Rat) / 589) [(4, 2), (14, 1), (16, 1)],
  term ((62982 : Rat) / 589) [(4, 2), (15, 2), (16, 1)],
  term ((-10160 : Rat) / 589) [(4, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21611 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((396 : Rat) / 589) [(5, 2), (10, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2114 : Rat) / 57) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((24380 : Rat) / 1767) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-17840 : Rat) / 589) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((12140 : Rat) / 589) [(5, 2), (12, 1), (16, 1)],
  term ((133618 : Rat) / 1767) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-173035 : Rat) / 3534) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(5, 2), (13, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((11088 : Rat) / 589) [(5, 2), (14, 1), (16, 1)],
  term ((62982 : Rat) / 589) [(5, 2), (15, 2), (16, 1)],
  term ((-10160 : Rat) / 589) [(5, 2), (16, 1)],
  term ((912 : Rat) / 31) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 3), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((19905 : Rat) / 589) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 3), (13, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7231 : Rat) / 1767) [(5, 3), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 70. -/
theorem rs_R009_ueqv_R009NNNNN_block_10_0000_0070_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_10_0000_0070
      rs_R009_ueqv_R009NNNNN_block_10_0000_0070 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
