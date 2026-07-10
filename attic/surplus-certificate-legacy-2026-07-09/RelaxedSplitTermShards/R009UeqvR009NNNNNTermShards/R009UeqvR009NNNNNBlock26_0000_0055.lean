/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 26:0-55

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0000 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0000 : Poly :=
[
  term ((6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0000
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0001 : Poly :=
[
  term ((-456 : Rat) / 31) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0001 : Poly :=
[
  term ((912 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0001
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0002 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0002 : Poly :=
[
  term ((227480 : Rat) / 1767) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0002
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0003 : Poly :=
[
  term ((28435 : Rat) / 1767) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0003 : Poly :=
[
  term ((-56870 : Rat) / 1767) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0003
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0004 : Poly :=
[
  term ((114 : Rat) / 31) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0004 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0004
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0005 : Poly :=
[
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0005 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 3), (3, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0005
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0006 : Poly :=
[
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0006 : Poly :=
[
  term ((-6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (12, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 3), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0006
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0007 : Poly :=
[
  term ((-3376 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 7 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0007 : Poly :=
[
  term ((6752 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-3376 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-6752 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((3376 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-6752 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((3376 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((6752 : Rat) / 589) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-3376 : Rat) / 589) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0007
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0008 : Poly :=
[
  term ((-7360 : Rat) / 589) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0008 : Poly :=
[
  term ((14720 : Rat) / 589) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-14720 : Rat) / 589) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-14720 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((14720 : Rat) / 589) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0008
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0009 : Poly :=
[
  term ((3680 : Rat) / 589) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0009 : Poly :=
[
  term ((-7360 : Rat) / 589) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (7, 3), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0009
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0010 : Poly :=
[
  term ((114 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0010 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0010
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0011 : Poly :=
[
  term ((28435 : Rat) / 1767) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0011 : Poly :=
[
  term ((-56870 : Rat) / 1767) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0011
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0012 : Poly :=
[
  term ((3680 : Rat) / 589) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0012 : Poly :=
[
  term ((-7360 : Rat) / 589) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0012
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0013 : Poly :=
[
  term ((1840 : Rat) / 589) [(1, 2), (16, 1)]
]

/-- Partial product 13 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0013 : Poly :=
[
  term ((-3680 : Rat) / 589) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 2), (1, 2), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (6, 2), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (7, 2), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 3), (13, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0013
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0014 : Poly :=
[
  term ((-384 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0014 : Poly :=
[
  term ((768 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((768 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((384 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((384 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0014
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0015 : Poly :=
[
  term ((960 : Rat) / 589) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0015 : Poly :=
[
  term ((-1920 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((960 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((960 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(2, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(2, 1), (3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0015
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0016 : Poly :=
[
  term ((-1728 : Rat) / 589) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0016 : Poly :=
[
  term ((3456 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((1728 : Rat) / 589) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0016
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0017 : Poly :=
[
  term ((-912 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0017 : Poly :=
[
  term ((1824 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0017
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0018 : Poly :=
[
  term ((-196772 : Rat) / 1767) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0018 : Poly :=
[
  term ((393544 : Rat) / 1767) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((393544 : Rat) / 1767) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-393544 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-393544 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0018
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0019 : Poly :=
[
  term ((114 : Rat) / 31) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0019 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0019
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0020 : Poly :=
[
  term ((23317 : Rat) / 1767) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0020 : Poly :=
[
  term ((-46634 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((23317 : Rat) / 1767) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-46634 : Rat) / 1767) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((23317 : Rat) / 1767) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23317 : Rat) / 1767) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23317 : Rat) / 1767) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0020
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0021 : Poly :=
[
  term ((-51752 : Rat) / 1767) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0021 : Poly :=
[
  term ((103504 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51752 : Rat) / 1767) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((51752 : Rat) / 1767) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0021
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0022 : Poly :=
[
  term ((-228 : Rat) / 31) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 22 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0022 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (6, 2), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0022
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0023 : Poly :=
[
  term ((-3072 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 23 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0023 : Poly :=
[
  term ((6144 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0023
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0024 : Poly :=
[
  term ((11712 : Rat) / 589) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 24 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0024 : Poly :=
[
  term ((-23424 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((11712 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-23424 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((11712 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((23424 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-11712 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((23424 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11712 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0024
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0025 : Poly :=
[
  term ((-21136 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 25 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0025 : Poly :=
[
  term ((42272 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-21136 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((42272 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-21136 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-42272 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((21136 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-42272 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((21136 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0025
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0026 : Poly :=
[
  term ((2688 : Rat) / 589) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 26 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0026 : Poly :=
[
  term ((-5376 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0026
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0027 : Poly :=
[
  term ((-7392 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 27 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0027 : Poly :=
[
  term ((14784 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-7392 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((14784 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7392 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-14784 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((7392 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-14784 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((7392 : Rat) / 589) [(3, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0027
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0028 : Poly :=
[
  term ((13104 : Rat) / 589) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 28 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0028 : Poly :=
[
  term ((-26208 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((13104 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-26208 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((13104 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((26208 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-13104 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((26208 : Rat) / 589) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-13104 : Rat) / 589) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0028
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0029 : Poly :=
[
  term ((960 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0029 : Poly :=
[
  term ((-1920 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((960 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((960 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0029
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0030 : Poly :=
[
  term ((-1706 : Rat) / 589) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0030 : Poly :=
[
  term ((3412 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0030
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0031 : Poly :=
[
  term ((9756 : Rat) / 589) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0031 : Poly :=
[
  term ((-19512 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((9756 : Rat) / 589) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-19512 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((9756 : Rat) / 589) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((19512 : Rat) / 589) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9756 : Rat) / 589) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((19512 : Rat) / 589) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-9756 : Rat) / 589) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0031
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0032 : Poly :=
[
  term ((53306 : Rat) / 1767) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0032 : Poly :=
[
  term ((-106612 : Rat) / 1767) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((53306 : Rat) / 1767) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-106612 : Rat) / 1767) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((53306 : Rat) / 1767) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((106612 : Rat) / 1767) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53306 : Rat) / 1767) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((106612 : Rat) / 1767) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53306 : Rat) / 1767) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0032
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0033 : Poly :=
[
  term ((-1344 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 33 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0033 : Poly :=
[
  term ((2688 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((-1344 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (6, 1), (12, 2), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (6, 2), (12, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0033
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0034 : Poly :=
[
  term ((5808 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 34 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0034 : Poly :=
[
  term ((-11616 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((5808 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((-11616 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((5808 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((11616 : Rat) / 589) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-5808 : Rat) / 589) [(3, 2), (6, 2), (16, 1)],
  term ((11616 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-5808 : Rat) / 589) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0034
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0035 : Poly :=
[
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0035 : Poly :=
[
  term ((1824 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0035
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0036 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0036 : Poly :=
[
  term ((454960 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0036
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0037 : Poly :=
[
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0037 : Poly :=
[
  term ((1024 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((1024 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((512 : Rat) / 589) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 589) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0037
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0038 : Poly :=
[
  term ((-1140 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0038 : Poly :=
[
  term ((2280 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1140 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0038
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0039 : Poly :=
[
  term ((-222934 : Rat) / 1767) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0039 : Poly :=
[
  term ((445868 : Rat) / 1767) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((445868 : Rat) / 1767) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-445868 : Rat) / 1767) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-445868 : Rat) / 1767) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0039
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0040 : Poly :=
[
  term ((1786 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0040 : Poly :=
[
  term ((-3572 : Rat) / 31) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((1786 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3572 : Rat) / 31) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((1786 : Rat) / 31) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((3572 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1786 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((3572 : Rat) / 31) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1786 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0040
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0041 : Poly :=
[
  term ((300928 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0041 : Poly :=
[
  term ((-601856 : Rat) / 1767) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((300928 : Rat) / 1767) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-601856 : Rat) / 1767) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((300928 : Rat) / 1767) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((601856 : Rat) / 1767) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-300928 : Rat) / 1767) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((601856 : Rat) / 1767) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-300928 : Rat) / 1767) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0041
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0042 : Poly :=
[
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0042 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0042
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0043 : Poly :=
[
  term ((103504 : Rat) / 1767) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0043 : Poly :=
[
  term ((-207008 : Rat) / 1767) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0043
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0044 : Poly :=
[
  term ((-2632 : Rat) / 589) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0044 : Poly :=
[
  term ((5264 : Rat) / 589) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0044
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0045 : Poly :=
[
  term ((456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0045 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0045
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0046 : Poly :=
[
  term ((83032 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0046 : Poly :=
[
  term ((-166064 : Rat) / 1767) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-166064 : Rat) / 1767) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((166064 : Rat) / 1767) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-83032 : Rat) / 1767) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((166064 : Rat) / 1767) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83032 : Rat) / 1767) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0046
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0047 : Poly :=
[
  term ((-950 : Rat) / 31) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0047 : Poly :=
[
  term ((1900 : Rat) / 31) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-950 : Rat) / 31) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1900 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-950 : Rat) / 31) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1900 : Rat) / 31) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((950 : Rat) / 31) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1900 : Rat) / 31) [(7, 2), (13, 2), (16, 1)],
  term ((950 : Rat) / 31) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0047
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0048 : Poly :=
[
  term ((-155542 : Rat) / 1767) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0048 : Poly :=
[
  term ((311084 : Rat) / 1767) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((311084 : Rat) / 1767) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-311084 : Rat) / 1767) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((155542 : Rat) / 1767) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-311084 : Rat) / 1767) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((155542 : Rat) / 1767) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0048
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0049 : Poly :=
[
  term ((-152 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 49 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0049 : Poly :=
[
  term ((304 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(0, 2), (10, 1), (16, 1)],
  term ((304 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((152 : Rat) / 31) [(6, 2), (10, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((152 : Rat) / 31) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0049
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0050 : Poly :=
[
  term ((456 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0050 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0050
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0051 : Poly :=
[
  term ((124378 : Rat) / 1767) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0051 : Poly :=
[
  term ((-248756 : Rat) / 1767) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((124378 : Rat) / 1767) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-248756 : Rat) / 1767) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((124378 : Rat) / 1767) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((248756 : Rat) / 1767) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124378 : Rat) / 1767) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((248756 : Rat) / 1767) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124378 : Rat) / 1767) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0051
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0052 : Poly :=
[
  term ((-76 : Rat) / 31) [(12, 1), (16, 1)]
]

/-- Partial product 52 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0052 : Poly :=
[
  term ((152 : Rat) / 31) [(0, 1), (12, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(0, 2), (12, 1), (16, 1)],
  term ((152 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(1, 2), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(6, 1), (12, 2), (16, 1)],
  term ((76 : Rat) / 31) [(6, 2), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 31) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0052
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0053 : Poly :=
[
  term ((-18199 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0053 : Poly :=
[
  term ((36398 : Rat) / 1767) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 1767) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 1767) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0053
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0054 : Poly :=
[
  term ((-114 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 54 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0054 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (13, 3), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (13, 3), (16, 1)],
  term ((114 : Rat) / 31) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0054
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNNN_coefficient_26_0055 : Poly :=
[
  term ((114 : Rat) / 31) [(16, 1)]
]

/-- Partial product 55 for generator 26. -/
def rs_R009_ueqv_R009NNNNN_partial_26_0055 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (12, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (16, 1)],
  term ((228 : Rat) / 31) [(6, 1), (12, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(6, 2), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 26. -/
theorem rs_R009_ueqv_R009NNNNN_partial_26_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_26_0055
        rs_R009_ueqv_R009NNNNN_generator_26_0000_0055 =
      rs_R009_ueqv_R009NNNNN_partial_26_0055 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_26_0000_0055 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_26_0000,
  rs_R009_ueqv_R009NNNNN_partial_26_0001,
  rs_R009_ueqv_R009NNNNN_partial_26_0002,
  rs_R009_ueqv_R009NNNNN_partial_26_0003,
  rs_R009_ueqv_R009NNNNN_partial_26_0004,
  rs_R009_ueqv_R009NNNNN_partial_26_0005,
  rs_R009_ueqv_R009NNNNN_partial_26_0006,
  rs_R009_ueqv_R009NNNNN_partial_26_0007,
  rs_R009_ueqv_R009NNNNN_partial_26_0008,
  rs_R009_ueqv_R009NNNNN_partial_26_0009,
  rs_R009_ueqv_R009NNNNN_partial_26_0010,
  rs_R009_ueqv_R009NNNNN_partial_26_0011,
  rs_R009_ueqv_R009NNNNN_partial_26_0012,
  rs_R009_ueqv_R009NNNNN_partial_26_0013,
  rs_R009_ueqv_R009NNNNN_partial_26_0014,
  rs_R009_ueqv_R009NNNNN_partial_26_0015,
  rs_R009_ueqv_R009NNNNN_partial_26_0016,
  rs_R009_ueqv_R009NNNNN_partial_26_0017,
  rs_R009_ueqv_R009NNNNN_partial_26_0018,
  rs_R009_ueqv_R009NNNNN_partial_26_0019,
  rs_R009_ueqv_R009NNNNN_partial_26_0020,
  rs_R009_ueqv_R009NNNNN_partial_26_0021,
  rs_R009_ueqv_R009NNNNN_partial_26_0022,
  rs_R009_ueqv_R009NNNNN_partial_26_0023,
  rs_R009_ueqv_R009NNNNN_partial_26_0024,
  rs_R009_ueqv_R009NNNNN_partial_26_0025,
  rs_R009_ueqv_R009NNNNN_partial_26_0026,
  rs_R009_ueqv_R009NNNNN_partial_26_0027,
  rs_R009_ueqv_R009NNNNN_partial_26_0028,
  rs_R009_ueqv_R009NNNNN_partial_26_0029,
  rs_R009_ueqv_R009NNNNN_partial_26_0030,
  rs_R009_ueqv_R009NNNNN_partial_26_0031,
  rs_R009_ueqv_R009NNNNN_partial_26_0032,
  rs_R009_ueqv_R009NNNNN_partial_26_0033,
  rs_R009_ueqv_R009NNNNN_partial_26_0034,
  rs_R009_ueqv_R009NNNNN_partial_26_0035,
  rs_R009_ueqv_R009NNNNN_partial_26_0036,
  rs_R009_ueqv_R009NNNNN_partial_26_0037,
  rs_R009_ueqv_R009NNNNN_partial_26_0038,
  rs_R009_ueqv_R009NNNNN_partial_26_0039,
  rs_R009_ueqv_R009NNNNN_partial_26_0040,
  rs_R009_ueqv_R009NNNNN_partial_26_0041,
  rs_R009_ueqv_R009NNNNN_partial_26_0042,
  rs_R009_ueqv_R009NNNNN_partial_26_0043,
  rs_R009_ueqv_R009NNNNN_partial_26_0044,
  rs_R009_ueqv_R009NNNNN_partial_26_0045,
  rs_R009_ueqv_R009NNNNN_partial_26_0046,
  rs_R009_ueqv_R009NNNNN_partial_26_0047,
  rs_R009_ueqv_R009NNNNN_partial_26_0048,
  rs_R009_ueqv_R009NNNNN_partial_26_0049,
  rs_R009_ueqv_R009NNNNN_partial_26_0050,
  rs_R009_ueqv_R009NNNNN_partial_26_0051,
  rs_R009_ueqv_R009NNNNN_partial_26_0052,
  rs_R009_ueqv_R009NNNNN_partial_26_0053,
  rs_R009_ueqv_R009NNNNN_partial_26_0054,
  rs_R009_ueqv_R009NNNNN_partial_26_0055
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_26_0000_0055 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((6752 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((14720 : Rat) / 589) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7360 : Rat) / 589) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((768 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((393544 : Rat) / 1767) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-46634 : Rat) / 1767) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((42272 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-23424 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-26208 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((14784 : Rat) / 589) [(0, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19512 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-106612 : Rat) / 1767) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11616 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3572 : Rat) / 31) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-601856 : Rat) / 1767) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((445868 : Rat) / 1767) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1900 : Rat) / 31) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((311084 : Rat) / 1767) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-166064 : Rat) / 1767) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((304 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-248756 : Rat) / 1767) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (12, 1), (16, 1)],
  term ((152 : Rat) / 31) [(0, 1), (12, 2), (16, 1)],
  term ((1536 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-3376 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(0, 2), (1, 2), (16, 1)],
  term ((-384 : Rat) / 31) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((960 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((23317 : Rat) / 1767) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((11712 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-21136 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-7392 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((13104 : Rat) / 589) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((960 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((9756 : Rat) / 589) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((53306 : Rat) / 1767) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (16, 1)],
  term ((5808 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1786 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((300928 : Rat) / 1767) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-950 : Rat) / 31) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(0, 2), (10, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((124378 : Rat) / 1767) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(0, 2), (12, 1), (16, 1)],
  term ((-18199 : Rat) / 1767) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 3), (3, 1), (11, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 3), (13, 2), (16, 1)],
  term ((768 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1920 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((393544 : Rat) / 1767) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-46634 : Rat) / 1767) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-23424 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((42272 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-6752 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((6144 : Rat) / 589) [(1, 1), (3, 1), (6, 1), (12, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((3376 : Rat) / 589) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-2304 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((20928 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32960 : Rat) / 589) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((3376 : Rat) / 589) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-1920 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106612 : Rat) / 1767) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19512 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-11616 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-14720 : Rat) / 589) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-14720 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((454960 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((1024 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((445868 : Rat) / 1767) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-601856 : Rat) / 1767) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3572 : Rat) / 31) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 589) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((333164 : Rat) / 1767) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1900 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-28435 : Rat) / 1767) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((7360 : Rat) / 589) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 1), (7, 3), (16, 1)],
  term ((304 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-248756 : Rat) / 1767) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((152 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (13, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (13, 3), (16, 1)],
  term ((-384 : Rat) / 31) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((960 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-196772 : Rat) / 1767) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((23317 : Rat) / 1767) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((11712 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-21136 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-7392 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((13104 : Rat) / 589) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((960 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1706 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((16508 : Rat) / 589) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((53306 : Rat) / 1767) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((5808 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((48654 : Rat) / 589) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((300928 : Rat) / 1767) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (6, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21730 : Rat) / 589) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1840 : Rat) / 589) [(1, 2), (7, 2), (16, 1)],
  term ((-152 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((124378 : Rat) / 1767) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(1, 2), (12, 1), (16, 1)],
  term ((-40279 : Rat) / 1767) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 3), (3, 1), (12, 1), (16, 1)],
  term ((-3376 : Rat) / 589) [(1, 3), (3, 1), (16, 1)],
  term ((-7360 : Rat) / 589) [(1, 3), (5, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 3), (7, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((28435 : Rat) / 1767) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3680 : Rat) / 589) [(1, 3), (13, 1), (16, 1)],
  term ((3680 : Rat) / 589) [(1, 3), (15, 1), (16, 1)],
  term ((1840 : Rat) / 589) [(1, 4), (16, 1)],
  term ((-768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((384 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-768 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((384 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((1920 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(2, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((1728 : Rat) / 589) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((192 : Rat) / 31) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(2, 1), (3, 1), (7, 3), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-393544 : Rat) / 1767) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-393544 : Rat) / 1767) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((196772 : Rat) / 1767) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((46634 : Rat) / 1767) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-23317 : Rat) / 1767) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((51752 : Rat) / 1767) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (6, 2), (13, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((98386 : Rat) / 1767) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (7, 3), (13, 1), (16, 1)],
  term ((-23317 : Rat) / 1767) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-42272 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((23424 : Rat) / 589) [(3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-11712 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((21136 : Rat) / 589) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-6144 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((23424 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-42272 : Rat) / 589) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-11712 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((21136 : Rat) / 589) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((26208 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-14784 : Rat) / 589) [(3, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((19512 : Rat) / 589) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((106612 : Rat) / 1767) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((7392 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-13104 : Rat) / 589) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9756 : Rat) / 589) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-53306 : Rat) / 1767) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((1920 : Rat) / 589) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((106612 : Rat) / 1767) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19512 : Rat) / 589) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-960 : Rat) / 589) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-14784 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((1706 : Rat) / 589) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((16452 : Rat) / 589) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-53306 : Rat) / 1767) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (7, 3), (10, 1), (16, 1)],
  term ((7392 : Rat) / 589) [(3, 1), (7, 3), (12, 1), (16, 1)],
  term ((-13104 : Rat) / 589) [(3, 1), (7, 3), (16, 1)],
  term ((11616 : Rat) / 589) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (6, 1), (12, 2), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (6, 2), (12, 1), (16, 1)],
  term ((-5808 : Rat) / 589) [(3, 2), (6, 2), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((11616 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1344 : Rat) / 589) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-5808 : Rat) / 589) [(3, 2), (7, 2), (16, 1)],
  term ((-1824 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3572 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((601856 : Rat) / 1767) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-445868 : Rat) / 1767) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 589) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1786 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-300928 : Rat) / 1767) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1024 : Rat) / 589) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-445868 : Rat) / 1767) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((601856 : Rat) / 1767) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3572 : Rat) / 31) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 589) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1786 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-300928 : Rat) / 1767) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1900 : Rat) / 31) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-311084 : Rat) / 1767) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((166064 : Rat) / 1767) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((248756 : Rat) / 1767) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(6, 1), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(6, 1), (12, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-83032 : Rat) / 1767) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((950 : Rat) / 31) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((155542 : Rat) / 1767) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 31) [(6, 2), (10, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-124378 : Rat) / 1767) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 31) [(6, 2), (12, 1), (16, 1)],
  term ((18199 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(6, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((248756 : Rat) / 1767) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-152 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(7, 1), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 1767) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (13, 3), (16, 1)],
  term ((207008 : Rat) / 1767) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((152 : Rat) / 31) [(7, 2), (10, 1), (16, 1)],
  term ((-13928 : Rat) / 589) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-124378 : Rat) / 1767) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((166064 : Rat) / 1767) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((76 : Rat) / 31) [(7, 2), (12, 1), (16, 1)],
  term ((-15415 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1786 : Rat) / 31) [(7, 2), (13, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(7, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 3), (10, 1), (13, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(7, 3), (11, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 3), (12, 1), (13, 1), (16, 1)],
  term ((-83032 : Rat) / 1767) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((950 : Rat) / 31) [(7, 3), (13, 1), (16, 1)],
  term ((155542 : Rat) / 1767) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 55. -/
theorem rs_R009_ueqv_R009NNNNN_block_26_0000_0055_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_26_0000_0055
      rs_R009_ueqv_R009NNNNN_block_26_0000_0055 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
