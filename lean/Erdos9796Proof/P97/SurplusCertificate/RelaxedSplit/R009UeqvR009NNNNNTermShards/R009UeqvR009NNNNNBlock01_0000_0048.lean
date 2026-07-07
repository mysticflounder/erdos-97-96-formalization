/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 1:0-48

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0000 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 0 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0000 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (8, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (9, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0000
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0001 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0001 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 1), (1, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (8, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (9, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0001
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0002 : Poly :=
[
  term ((-4320 : Rat) / 589) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0002 : Poly :=
[
  term ((-4320 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(1, 3), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0002
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0003 : Poly :=
[
  term ((3240 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 3 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0003 : Poly :=
[
  term ((3240 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0003
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0004 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0004 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0004
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0005 : Poly :=
[
  term ((36800 : Rat) / 1767) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0005 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0005
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0006 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0006 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0006
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0007 : Poly :=
[
  term ((-399 : Rat) / 31) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0007 : Poly :=
[
  term ((-399 : Rat) / 31) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((399 : Rat) / 31) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((399 : Rat) / 31) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0007
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0008 : Poly :=
[
  term ((215429 : Rat) / 7068) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0008 : Poly :=
[
  term ((215429 : Rat) / 7068) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-215429 : Rat) / 7068) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-215429 : Rat) / 7068) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((215429 : Rat) / 7068) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0008
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0009 : Poly :=
[
  term ((193927 : Rat) / 4712) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0009 : Poly :=
[
  term ((193927 : Rat) / 4712) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 4712) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 4712) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((193927 : Rat) / 4712) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0009
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0010 : Poly :=
[
  term ((-193927 : Rat) / 3534) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 10 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0010 : Poly :=
[
  term ((-193927 : Rat) / 3534) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 1), (8, 2), (15, 3), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((-193927 : Rat) / 3534) [(1, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0010
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0011 : Poly :=
[
  term ((-2364 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 11 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0011 : Poly :=
[
  term ((-2364 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (8, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0011
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0012 : Poly :=
[
  term ((2364 : Rat) / 589) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0012 : Poly :=
[
  term ((2364 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0012
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0013 : Poly :=
[
  term ((-114 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0013 : Poly :=
[
  term ((-114 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0013
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0014 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0014 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0014
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0015 : Poly :=
[
  term ((114 : Rat) / 31) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0015 : Poly :=
[
  term ((114 : Rat) / 31) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0015
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0016 : Poly :=
[
  term ((41029 : Rat) / 1767) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0016 : Poly :=
[
  term ((41029 : Rat) / 1767) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0016
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0017 : Poly :=
[
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 17 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0017 : Poly :=
[
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0017
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0018 : Poly :=
[
  term ((-2364 : Rat) / 589) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0018 : Poly :=
[
  term ((-2364 : Rat) / 589) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0018
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0019 : Poly :=
[
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 19 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0019 : Poly :=
[
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0019
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0020 : Poly :=
[
  term ((-2364 : Rat) / 589) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 20 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0020 : Poly :=
[
  term ((-2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0020
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0021 : Poly :=
[
  term ((3546 : Rat) / 589) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0021 : Poly :=
[
  term ((3546 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((3546 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-3546 : Rat) / 589) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-3546 : Rat) / 589) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0021
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0022 : Poly :=
[
  term ((399 : Rat) / 31) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0022 : Poly :=
[
  term ((399 : Rat) / 31) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((399 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0022
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0023 : Poly :=
[
  term ((-1197 : Rat) / 124) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0023 : Poly :=
[
  term ((-1197 : Rat) / 124) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1197 : Rat) / 124) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((1197 : Rat) / 124) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((1197 : Rat) / 124) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0023
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0024 : Poly :=
[
  term ((-212839 : Rat) / 4712) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0024 : Poly :=
[
  term ((-212839 : Rat) / 4712) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-212839 : Rat) / 4712) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((212839 : Rat) / 4712) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((212839 : Rat) / 4712) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0024
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0025 : Poly :=
[
  term ((193927 : Rat) / 3534) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 25 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0025 : Poly :=
[
  term ((193927 : Rat) / 3534) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-193927 : Rat) / 3534) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-193927 : Rat) / 3534) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0025
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0026 : Poly :=
[
  term ((4320 : Rat) / 589) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0026 : Poly :=
[
  term ((4320 : Rat) / 589) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0026
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0027 : Poly :=
[
  term ((-3240 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 27 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0027 : Poly :=
[
  term ((-3240 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(3, 2), (8, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(3, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0027
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0028 : Poly :=
[
  term ((114 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0028 : Poly :=
[
  term ((114 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0028
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0029 : Poly :=
[
  term ((41029 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0029 : Poly :=
[
  term ((41029 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0029
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0030 : Poly :=
[
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0030 : Poly :=
[
  term ((-114 : Rat) / 31) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0030
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0031 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0031 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0031
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0032 : Poly :=
[
  term ((114 : Rat) / 31) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0032 : Poly :=
[
  term ((114 : Rat) / 31) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0032
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0033 : Poly :=
[
  term ((41029 : Rat) / 1767) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0033 : Poly :=
[
  term ((41029 : Rat) / 1767) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0033
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0034 : Poly :=
[
  term ((-114 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0034 : Poly :=
[
  term ((-114 : Rat) / 31) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0034
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0035 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0035 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0035
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0036 : Poly :=
[
  term ((-9200 : Rat) / 1767) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0036 : Poly :=
[
  term ((-9200 : Rat) / 1767) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0036
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0037 : Poly :=
[
  term ((-2300 : Rat) / 1767) [(10, 1), (16, 1)]
]

/-- Partial product 37 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0037 : Poly :=
[
  term ((-2300 : Rat) / 1767) [(0, 2), (10, 1), (16, 1)],
  term ((-2300 : Rat) / 1767) [(1, 2), (10, 1), (16, 1)],
  term ((2300 : Rat) / 1767) [(8, 2), (10, 1), (16, 1)],
  term ((2300 : Rat) / 1767) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0037
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0038 : Poly :=
[
  term ((171 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0038 : Poly :=
[
  term ((171 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((171 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-171 : Rat) / 31) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-171 : Rat) / 31) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0038
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0039 : Poly :=
[
  term ((41029 : Rat) / 1178) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0039 : Poly :=
[
  term ((41029 : Rat) / 1178) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1178) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1178) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1178) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0039
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0040 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(11, 2), (16, 1)]
]

/-- Partial product 40 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0040 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(0, 2), (11, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (11, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0040
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0041 : Poly :=
[
  term ((9200 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0041 : Poly :=
[
  term ((9200 : Rat) / 1767) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0041
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0042 : Poly :=
[
  term ((-2300 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 42 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0042 : Poly :=
[
  term ((-2300 : Rat) / 589) [(0, 2), (12, 1), (16, 1)],
  term ((-2300 : Rat) / 589) [(1, 2), (12, 1), (16, 1)],
  term ((2300 : Rat) / 589) [(8, 2), (12, 1), (16, 1)],
  term ((2300 : Rat) / 589) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0042
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0043 : Poly :=
[
  term ((-114 : Rat) / 31) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0043 : Poly :=
[
  term ((-114 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0043
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0044 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(13, 2), (16, 1)]
]

/-- Partial product 44 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0044 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0044
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0045 : Poly :=
[
  term ((18400 : Rat) / 1767) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0045 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0045
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0046 : Poly :=
[
  term ((-32200 : Rat) / 1767) [(14, 1), (16, 1)]
]

/-- Partial product 46 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0046 : Poly :=
[
  term ((-32200 : Rat) / 1767) [(0, 2), (14, 1), (16, 1)],
  term ((-32200 : Rat) / 1767) [(1, 2), (14, 1), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 2), (14, 1), (16, 1)],
  term ((32200 : Rat) / 1767) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0046
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0047 : Poly :=
[
  term ((-16743 : Rat) / 589) [(15, 2), (16, 1)]
]

/-- Partial product 47 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0047 : Poly :=
[
  term ((-16743 : Rat) / 589) [(0, 2), (15, 2), (16, 1)],
  term ((-16743 : Rat) / 589) [(1, 2), (15, 2), (16, 1)],
  term ((16743 : Rat) / 589) [(8, 2), (15, 2), (16, 1)],
  term ((16743 : Rat) / 589) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0047
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009NNNNN_coefficient_01_0048 : Poly :=
[
  term ((16100 : Rat) / 1767) [(16, 1)]
]

/-- Partial product 48 for generator 1. -/
def rs_R009_ueqv_R009NNNNN_partial_01_0048 : Poly :=
[
  term ((16100 : Rat) / 1767) [(0, 2), (16, 1)],
  term ((16100 : Rat) / 1767) [(1, 2), (16, 1)],
  term ((-16100 : Rat) / 1767) [(8, 2), (16, 1)],
  term ((-16100 : Rat) / 1767) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 1. -/
theorem rs_R009_ueqv_R009NNNNN_partial_01_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_01_0048
        rs_R009_ueqv_R009NNNNN_generator_01_0000_0048 =
      rs_R009_ueqv_R009NNNNN_partial_01_0048 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_01_0000_0048 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_01_0000,
  rs_R009_ueqv_R009NNNNN_partial_01_0001,
  rs_R009_ueqv_R009NNNNN_partial_01_0002,
  rs_R009_ueqv_R009NNNNN_partial_01_0003,
  rs_R009_ueqv_R009NNNNN_partial_01_0004,
  rs_R009_ueqv_R009NNNNN_partial_01_0005,
  rs_R009_ueqv_R009NNNNN_partial_01_0006,
  rs_R009_ueqv_R009NNNNN_partial_01_0007,
  rs_R009_ueqv_R009NNNNN_partial_01_0008,
  rs_R009_ueqv_R009NNNNN_partial_01_0009,
  rs_R009_ueqv_R009NNNNN_partial_01_0010,
  rs_R009_ueqv_R009NNNNN_partial_01_0011,
  rs_R009_ueqv_R009NNNNN_partial_01_0012,
  rs_R009_ueqv_R009NNNNN_partial_01_0013,
  rs_R009_ueqv_R009NNNNN_partial_01_0014,
  rs_R009_ueqv_R009NNNNN_partial_01_0015,
  rs_R009_ueqv_R009NNNNN_partial_01_0016,
  rs_R009_ueqv_R009NNNNN_partial_01_0017,
  rs_R009_ueqv_R009NNNNN_partial_01_0018,
  rs_R009_ueqv_R009NNNNN_partial_01_0019,
  rs_R009_ueqv_R009NNNNN_partial_01_0020,
  rs_R009_ueqv_R009NNNNN_partial_01_0021,
  rs_R009_ueqv_R009NNNNN_partial_01_0022,
  rs_R009_ueqv_R009NNNNN_partial_01_0023,
  rs_R009_ueqv_R009NNNNN_partial_01_0024,
  rs_R009_ueqv_R009NNNNN_partial_01_0025,
  rs_R009_ueqv_R009NNNNN_partial_01_0026,
  rs_R009_ueqv_R009NNNNN_partial_01_0027,
  rs_R009_ueqv_R009NNNNN_partial_01_0028,
  rs_R009_ueqv_R009NNNNN_partial_01_0029,
  rs_R009_ueqv_R009NNNNN_partial_01_0030,
  rs_R009_ueqv_R009NNNNN_partial_01_0031,
  rs_R009_ueqv_R009NNNNN_partial_01_0032,
  rs_R009_ueqv_R009NNNNN_partial_01_0033,
  rs_R009_ueqv_R009NNNNN_partial_01_0034,
  rs_R009_ueqv_R009NNNNN_partial_01_0035,
  rs_R009_ueqv_R009NNNNN_partial_01_0036,
  rs_R009_ueqv_R009NNNNN_partial_01_0037,
  rs_R009_ueqv_R009NNNNN_partial_01_0038,
  rs_R009_ueqv_R009NNNNN_partial_01_0039,
  rs_R009_ueqv_R009NNNNN_partial_01_0040,
  rs_R009_ueqv_R009NNNNN_partial_01_0041,
  rs_R009_ueqv_R009NNNNN_partial_01_0042,
  rs_R009_ueqv_R009NNNNN_partial_01_0043,
  rs_R009_ueqv_R009NNNNN_partial_01_0044,
  rs_R009_ueqv_R009NNNNN_partial_01_0045,
  rs_R009_ueqv_R009NNNNN_partial_01_0046,
  rs_R009_ueqv_R009NNNNN_partial_01_0047,
  rs_R009_ueqv_R009NNNNN_partial_01_0048
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_01_0000_0048 : Poly :=
[
  term ((18400 : Rat) / 1767) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 1), (1, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (8, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (8, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (9, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 1), (9, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((215429 : Rat) / 7068) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((193927 : Rat) / 4712) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 3534) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((-2364 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((3546 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((399 : Rat) / 31) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1197 : Rat) / 124) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-212839 : Rat) / 4712) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 3534) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((4320 : Rat) / 589) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2300 : Rat) / 1767) [(0, 2), (10, 1), (16, 1)],
  term ((171 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1178) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (11, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2300 : Rat) / 589) [(0, 2), (12, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32200 : Rat) / 1767) [(0, 2), (14, 1), (16, 1)],
  term ((-16743 : Rat) / 589) [(0, 2), (15, 2), (16, 1)],
  term ((16100 : Rat) / 1767) [(0, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 3), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 3), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 1), (3, 1), (8, 2), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((399 : Rat) / 31) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-215429 : Rat) / 7068) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 4712) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 1), (8, 2), (15, 3), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((399 : Rat) / 31) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-215429 : Rat) / 7068) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-193927 : Rat) / 4712) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((3546 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((399 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1197 : Rat) / 124) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-212839 : Rat) / 4712) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((193927 : Rat) / 3534) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-3240 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2300 : Rat) / 1767) [(1, 2), (10, 1), (16, 1)],
  term ((171 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1178) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2300 : Rat) / 589) [(1, 2), (12, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32200 : Rat) / 1767) [(1, 2), (14, 1), (16, 1)],
  term ((-16743 : Rat) / 589) [(1, 2), (15, 2), (16, 1)],
  term ((16100 : Rat) / 1767) [(1, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(1, 3), (3, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 3), (11, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 3), (11, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((215429 : Rat) / 7068) [(1, 3), (13, 1), (16, 1)],
  term ((193927 : Rat) / 4712) [(1, 3), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 3534) [(1, 3), (15, 3), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (8, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(2, 1), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-3546 : Rat) / 589) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((1197 : Rat) / 124) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((212839 : Rat) / 4712) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 3534) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (8, 3), (11, 1), (16, 1)],
  term ((-3546 : Rat) / 589) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((1197 : Rat) / 124) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((212839 : Rat) / 4712) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-193927 : Rat) / 3534) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 3), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 3), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(3, 2), (8, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((3240 : Rat) / 589) [(3, 2), (9, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((2300 : Rat) / 1767) [(8, 2), (10, 1), (16, 1)],
  term ((-171 : Rat) / 31) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1178) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (11, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((2300 : Rat) / 589) [(8, 2), (12, 1), (16, 1)],
  term ((114 : Rat) / 31) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 2), (14, 1), (16, 1)],
  term ((16743 : Rat) / 589) [(8, 2), (15, 2), (16, 1)],
  term ((-16100 : Rat) / 1767) [(8, 2), (16, 1)],
  term ((114 : Rat) / 31) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((2300 : Rat) / 1767) [(9, 2), (10, 1), (16, 1)],
  term ((-171 : Rat) / 31) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1178) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (11, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2300 : Rat) / 589) [(9, 2), (12, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(9, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((32200 : Rat) / 1767) [(9, 2), (14, 1), (16, 1)],
  term ((16743 : Rat) / 589) [(9, 2), (15, 2), (16, 1)],
  term ((-16100 : Rat) / 1767) [(9, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 3), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 0 through 48. -/
theorem rs_R009_ueqv_R009NNNNN_block_01_0000_0048_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_01_0000_0048
      rs_R009_ueqv_R009NNNNN_block_01_0000_0048 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
