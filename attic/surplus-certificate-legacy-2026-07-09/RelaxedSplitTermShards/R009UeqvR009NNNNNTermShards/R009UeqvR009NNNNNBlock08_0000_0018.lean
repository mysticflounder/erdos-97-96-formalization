/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 8:0-18

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (8, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0000 : Poly :=
[
  term ((-8640 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0000 : Poly :=
[
  term ((17280 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (12, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (12, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0000
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0001 : Poly :=
[
  term ((-798 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0001 : Poly :=
[
  term ((1596 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((798 : Rat) / 31) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((798 : Rat) / 31) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0001
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0002 : Poly :=
[
  term ((-193927 : Rat) / 1767) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0002 : Poly :=
[
  term ((387854 : Rat) / 1767) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0002
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0003 : Poly :=
[
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0003 : Poly :=
[
  term ((4728 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0003
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0004 : Poly :=
[
  term ((798 : Rat) / 31) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0004 : Poly :=
[
  term ((-1596 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((798 : Rat) / 31) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(3, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((798 : Rat) / 31) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0004
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0005 : Poly :=
[
  term ((193927 : Rat) / 1767) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0005 : Poly :=
[
  term ((-387854 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0005
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0006 : Poly :=
[
  term ((2364 : Rat) / 589) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0006 : Poly :=
[
  term ((-4728 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0006
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0007 : Poly :=
[
  term ((8640 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0007 : Poly :=
[
  term ((-17280 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (12, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(2, 2), (3, 2), (12, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 2), (8, 2), (12, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0007
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0008 : Poly :=
[
  term ((-114 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0008 : Poly :=
[
  term ((228 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0008
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0009 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0009 : Poly :=
[
  term ((82058 : Rat) / 1767) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0009
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0010 : Poly :=
[
  term ((36800 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0010 : Poly :=
[
  term ((-73600 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0010
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0011 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(10, 1), (16, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0011 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(3, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0011
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0012 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(10, 2), (16, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0012 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (10, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(3, 2), (10, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (10, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0012
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0013 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(12, 1), (16, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0013 : Poly :=
[
  term ((73600 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(2, 2), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(3, 2), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 2), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0013
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0014 : Poly :=
[
  term ((18400 : Rat) / 1767) [(12, 2), (16, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0014 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0014
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0015 : Poly :=
[
  term ((114 : Rat) / 31) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0015 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0015
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0016 : Poly :=
[
  term ((18400 : Rat) / 1767) [(13, 2), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0016 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0016
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0017 : Poly :=
[
  term ((41029 : Rat) / 1767) [(15, 2), (16, 1)]
]

/-- Partial product 17 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0017 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 2), (15, 2), (16, 1)],
  term ((41029 : Rat) / 1767) [(3, 2), (15, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (15, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0017
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009NNNNN_coefficient_08_0018 : Poly :=
[
  term ((18400 : Rat) / 1767) [(16, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R009_ueqv_R009NNNNN_partial_08_0018 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R009_ueqv_R009NNNNN_partial_08_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_08_0018
        rs_R009_ueqv_R009NNNNN_generator_08_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_08_0018 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_08_0000_0018 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_08_0000,
  rs_R009_ueqv_R009NNNNN_partial_08_0001,
  rs_R009_ueqv_R009NNNNN_partial_08_0002,
  rs_R009_ueqv_R009NNNNN_partial_08_0003,
  rs_R009_ueqv_R009NNNNN_partial_08_0004,
  rs_R009_ueqv_R009NNNNN_partial_08_0005,
  rs_R009_ueqv_R009NNNNN_partial_08_0006,
  rs_R009_ueqv_R009NNNNN_partial_08_0007,
  rs_R009_ueqv_R009NNNNN_partial_08_0008,
  rs_R009_ueqv_R009NNNNN_partial_08_0009,
  rs_R009_ueqv_R009NNNNN_partial_08_0010,
  rs_R009_ueqv_R009NNNNN_partial_08_0011,
  rs_R009_ueqv_R009NNNNN_partial_08_0012,
  rs_R009_ueqv_R009NNNNN_partial_08_0013,
  rs_R009_ueqv_R009NNNNN_partial_08_0014,
  rs_R009_ueqv_R009NNNNN_partial_08_0015,
  rs_R009_ueqv_R009NNNNN_partial_08_0016,
  rs_R009_ueqv_R009NNNNN_partial_08_0017,
  rs_R009_ueqv_R009NNNNN_partial_08_0018
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_08_0000_0018 : Poly :=
[
  term ((17280 : Rat) / 589) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(0, 1), (1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(0, 1), (2, 1), (3, 2), (12, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((73600 : Rat) / 1767) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (2, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((228 : Rat) / 31) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (12, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (12, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (3, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((-2394 : Rat) / 31) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-25920 : Rat) / 589) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((798 : Rat) / 31) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((228 : Rat) / 31) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 1), (16, 1)],
  term ((798 : Rat) / 31) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((1596 : Rat) / 31) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((387854 : Rat) / 1767) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-387854 : Rat) / 1767) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((798 : Rat) / 31) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(2, 2), (3, 2), (12, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(2, 2), (10, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(2, 2), (12, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (12, 2), (16, 1)],
  term ((114 : Rat) / 31) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (13, 2), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 2), (15, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(2, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-798 : Rat) / 31) [(3, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 1767) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 2), (8, 2), (12, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(3, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(3, 2), (10, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(3, 2), (12, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (12, 2), (16, 1)],
  term ((114 : Rat) / 31) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (13, 2), (16, 1)],
  term ((41029 : Rat) / 1767) [(3, 2), (15, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(3, 2), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 3), (5, 1), (16, 1)],
  term ((798 : Rat) / 31) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((193927 : Rat) / 1767) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 3), (15, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 4), (12, 1), (16, 1)],
  term ((114 : Rat) / 31) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 2), (12, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (12, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (13, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(9, 2), (12, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (12, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (13, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 2), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 18. -/
theorem rs_R009_ueqv_R009NNNNN_block_08_0000_0018_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_08_0000_0018
      rs_R009_ueqv_R009NNNNN_block_08_0000_0018 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
